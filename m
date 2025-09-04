Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A52CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sth5f0EfnGMhnP61jZARNQU8jXYTlW3mtrdS5BDhcSc=; b=q1+LMm9Qr4ZpnZ4B8pa9XHiHqm
	Nord3wdvoB3zGD8GyUtrHqKk0mgJm0F6KLAXg1bZM6qpB4OjoBZ29/K182Fno+TVQPshdHe+vtl2l
	kF8fCr5cD3qIH8V6VFyxIs+pC61vFyZcI3rQPjiUDDzVuppMK1+iYm6B/yOjhN0gvldl0QlXJ4pjL
	2vldLA9NK8GxUNGsQEZnAmqQ6bu96nG/oMGQU1bkX9FBVCksirzZim0uxPzXAKL736uRrG6fRrAcF
	RxPIUS17ZkqR3dlnR+GXqlPv9tKfTbebZuunWMCXYHyTYNOd2djyxF+KAQAVn9XVCD7hSwWbDaz0W
	J6md51jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8kc-0000000BRpx-0SGV;
	Thu, 04 Sep 2025 12:07:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7ap-0000000B1i7-0L9x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 10:53:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C99F22E98;
	Thu,  4 Sep 2025 03:53:15 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A20DB3F6A8;
	Thu,  4 Sep 2025 03:53:22 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 04 Sep 2025 11:53:04 +0100
Subject: [PATCH] coresight: perf: Fix pointer check with IS_ERR_OR_NULL()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-cs_etm_auxsetup_fix_error_handling-v1-1-ecc5edf282a5@arm.com>
X-B4-Tracking: v=1; b=H4sIAI9vuWgC/x2N4QqCQBAGX0X2dweXFGKvErFcd5+2UKfsagjiu
 7f0c2CY2cmgAqNbs5PiKyZTdTifGsqvVEcEKc7UxvYa+3gJ2RjLh9O6GZZ15kE2huqk7Hp5Sx1
 DfnaIHUqfykAemhVu/Sf3x3H8ALQBfQR0AAAA
X-Change-ID: 20250904-cs_etm_auxsetup_fix_error_handling-cb7e07ed9adf
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756983202; l=1661;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=gUN/ZW4KvGQOdeqR8aU1Idybq150PRVccSLO4ebU/d4=;
 b=QWI/ZPBR2t1UE7dFZrvbApqTI04e5+fJVZrjlXO2btD5VhnPcXlBHbYw4I1p7FXEd3kkKQAAW
 4V0fjusEoKsAj2fME8m4GLjO6vCqwiQvFrc7aQ5jQFrGOOyNi1Snu2N
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_035327_169234_1855E4D8 
X-CRM114-Status: GOOD (  11.53  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The returned pointer from .alloc_buffer() callback can be an error, if
only checking NULL pointer the driver cannot capture errors. The driver
will proceed even after failure and cause kernel panic.

Change to use IS_ERR_OR_NULL() check for capture error cases.

Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f677c08233ba1a28b277674662c6e6db904873dd..440d967f5d0962df187a81b0dd69a7d82a8b62ba 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -198,7 +198,7 @@ static void free_sink_buffer(struct etm_event_data *event_data)
 	cpumask_t *mask = &event_data->mask;
 	struct coresight_device *sink;
 
-	if (!event_data->snk_config)
+	if (IS_ERR_OR_NULL(event_data->snk_config))
 		return;
 
 	if (WARN_ON(cpumask_empty(mask)))
@@ -450,7 +450,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	event_data->snk_config =
 			sink_ops(sink)->alloc_buffer(sink, event, pages,
 						     nr_pages, overwrite);
-	if (!event_data->snk_config)
+	if (IS_ERR_OR_NULL(event_data->snk_config))
 		goto err;
 
 out:

---
base-commit: fa71e9cb4cfa59abb196229667ec84929bdc18fe
change-id: 20250904-cs_etm_auxsetup_fix_error_handling-cb7e07ed9adf

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


