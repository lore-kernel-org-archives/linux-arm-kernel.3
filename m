Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CEECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmLfEMR0Vw9wPWJkVM3oKv7COMTxVJz60j3r9iGyw40=; b=mO9+q6QwMy/i1pyIJ7ryq0cBGf
	tP7BNpTE/pQknamqo/VHVChGIuPk1Pji5R4+AtMu79Yh3L5QeUg7GBgnQQFmidd+pHTytNt+Dwnt/
	5s6nRk65UGwybrbgFjP9L5m3c8Pxtbt5UuA/gAi2fkF67CGSlql8DGOLiiBHANOxtL+aVdUXbU9Xd
	UicnMsHI6UJS4XIGCsAEFxF+0TI5HOrp0F036/PyfJw/nxgSYed3xow267Z4g+dQlBpxGmirP9VYE
	8bRdE53vCWhqr/1Mnfj0UlztH5hOfctHSLeZgpunXyLCQSVYiUeBgWC4ly2UHhS9ons4byfLsOXNF
	Dx4rdqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nXF-0000000APhh-3mIN;
	Thu, 25 Sep 2025 15:05:29 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nXD-0000000AOXw-1yEO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:05:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758812640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QmLfEMR0Vw9wPWJkVM3oKv7COMTxVJz60j3r9iGyw40=;
	b=Pg23J2YQzR/u3/d6RmJbd+JFQmaFrm1PUKwptCHKoxr9JCjx7OrMjRncrUGClJYFezae0p
	AvQbA+Eqp98MuIv8akkafKCvwmlYO3tm2ZyENDBVZx+wlys5VAMQjoKvG2IJkBMtJBc17O
	xpaHDoUn+W3H/tfbNKkXeAnfskccvjE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Linu Cherian <lcherian@marvell.com>,
	Mike Leach <mike.leach@linaro.org>,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v5 1/3] coresight: Fix fwnode leak in coresight_register error path
Date: Thu, 25 Sep 2025 11:03:40 -0400
Message-Id: <20250925150342.1845615-2-sean.anderson@linux.dev>
In-Reply-To: <20250925150342.1845615-1-sean.anderson@linux.dev>
References: <20250925150342.1845615-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_080527_651840_37966BB7 
X-CRM114-Status: GOOD (  10.35  )
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

If registering the CPU map fails, we need to put the fwnode. free_percpu
works when called with a NULL pointer, so just use
coresight_device_release.

Fixes: 5ad628a76176 ("coresight: Use per-sink trace ID maps for Perf sessions")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v4)

Changes in v4:
- New

 drivers/hwtracing/coresight/coresight-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..022c8384b98d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1352,7 +1352,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 		raw_spin_lock_init(&csdev->perf_sink_id_map.lock);
 		csdev->perf_sink_id_map.cpu_map = alloc_percpu(atomic_t);
 		if (!csdev->perf_sink_id_map.cpu_map) {
-			kfree(csdev);
+			coresight_device_release(&csdev->dev);
 			ret = -ENOMEM;
 			goto err_out;
 		}
-- 
2.35.1.1320.gc452695387.dirty


