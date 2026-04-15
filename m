Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9D4F43858
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZC7RGmu7cmGs7288ATy9HIDP9ZnJ3SM1lgH934gSdw=; b=bC7pgRY/95CUR8jOSUoZ8rkyUs
	bhMrTD2QZAZ5Ck/EMA26gb2oWhVklA4m4fDcPc8ZQuTdICV2Q8TVJ7lfxkswyWwm0nu3iZOsgamrn
	b/x8x/fM6gI8ydlaDlUq/e2VYjHRKXins7VXj916YGp1MROYDGE+o2ZVwNaZb84l6dzK0JDDe0J4G
	NBaoiQtX/WpRs0U8+yysrch7s6hE0e1UQIY4jg0oTCeWGSWE1/KN+lU1bNfIK9gO5YP/g8kE6hhqd
	7Ovtv61rv+QQEY+1WYPmgnKniwToxVVYiz/Rr9MHRY/svn/lMSD/iyG9xLYFoyyj9AONwKkbAdMvF
	Wptl8mGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wq-00000001Pbx-2fcY;
	Wed, 15 Apr 2026 16:55:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wk-00000001PXO-1yVY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:55:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A77F32FB;
	Wed, 15 Apr 2026 09:55:40 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C81E13F7D8;
	Wed, 15 Apr 2026 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776272145; bh=Ewh6cA8o+NqF7LLawvfJJyMTyhJYUObSRPM1ExAFkfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AAgTVC49TckOCB4CwFX2pzaCQZyoa6CWcVoQolgpsZ2AgEU6k2MPmEZ5Z60lQ1cTY
	 nLIsV9xbVG3Qj8Qg5FhdKhZ1mNaXrQb96GvqIsY3htxr5WXWEm/B3LngAs+44J21To
	 7Yd/tAG5r6cH4AsniXPouaATmEORZAtk7/0FDQ6U=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v5 06/12] coresight: etm4x: fix leaked trace id
Date: Wed, 15 Apr 2026 17:55:22 +0100
Message-Id: <20260415165528.3369607-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415165528.3369607-1-yeoreum.yun@arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_095546_558146_B34EFA19 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

If etm4_enable_sysfs() fails in cscfg_csdev_enable_active_config(),
the trace ID may be leaked because it is not released.

To address this, call etm4_release_trace_id() when etm4_enable_sysfs()
fails in cscfg_csdev_enable_active_config().

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index f55338a4989d..b199aebbdb60 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -920,8 +920,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
 	if (cfg_hash) {
 		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
-		if (ret)
+		if (ret) {
+			etm4_release_trace_id(drvdata);
 			return ret;
+		}
 	}
 
 	raw_spin_lock(&drvdata->spinlock);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


