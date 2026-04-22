Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E943F9EDC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgRldhICHvbBWXOQFyWbwxpTtquW2L1us6R5J8Kfk+0=; b=gNYTyoJX6Koe3xGyKWJrMrwMBV
	xLjw0hrsT8EKYpfR0Xn2uXfzueAhcpnrMgOdHEKJZlI3HBmwbu+QiWvpuXYjJkY3FEHSu9FATM65Y
	qKS2StUWOdNNLdxeaWw1iEi8v6nYc+iMvWZmg0FHJuQr1rLx5rrNy+mdZsE1KXwrlyBrWwXb0bbMy
	BqN4Z8uYZUJIo2egEWZQLkX+CUJ9d5OrCbiycgftJeVXJoXs2JwzVTzge0SQ3T+YLsCNhrteoyQiN
	HoAK8iZ3M0JVSIMBIv7LAop/IpYwysVzSTVUzRWIs/C7ZKMWDKEasW6Vt7Ec+6AOOUfng2L+NzV1a
	PSArkqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXX7-0000000AHdB-07GT;
	Wed, 22 Apr 2026 13:22:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXWv-0000000AHYz-2D9l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:22:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 954BB2454;
	Wed, 22 Apr 2026 06:22:06 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 513063FD46;
	Wed, 22 Apr 2026 06:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776864132; bh=C80BxkkV3yaYUBWXXNinYrlq6daDJPw+nnYPcG9ZXP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LxLsdqatynaQU6jorKoFRcwBRs8FJgJwYfvHz/1TT0H0Wayil8DNdOuSvmz6xvdfB
	 wEJ5a7a2TEv9TfrbrF1xQVr1FU+6IvhzuSmy0tGP5z1kkvASLcyfYrkWzPQ1KuBQhJ
	 KN8QFpL1EMGn8JUEG+0P8MnbqjtOjQ1NftMOHdEY=
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
Subject: [PATCH v6 02/13] coresight: etm4x: fix underflow for nrseqstate
Date: Wed, 22 Apr 2026 14:21:52 +0100
Message-Id: <20260422132203.977549-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422132203.977549-1-yeoreum.yun@arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_062213_678925_1A374C3A 
X-CRM114-Status: GOOD (  12.37  )
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

TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.

Therefore, drvdata->nrseqstate should be checked before entering the loop.

Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
Fixes: 2e1cdfe184b5 ("coresight-etm4x: Adding CoreSight ETM4x driver")
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-etm4x-core.c | 18 ++++++++++--------
 .../coresight/coresight-etm4x-sysfs.c          |  2 ++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 74b7063d130e..ba5b8b423bd4 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -544,9 +544,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 	etm4x_relaxed_write32(csa, config->vissctlr, TRCVISSCTLR);
 	if (drvdata->nr_pe_cmp)
 		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
+
 	if (drvdata->nrseqstate) {
+		for (i = 0; i < drvdata->nrseqstate - 1; i++)
+			etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
+
 		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
 		etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
 	}
@@ -1927,10 +1929,10 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	if (drvdata->nr_pe_cmp)
 		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
 
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
-
 	if (drvdata->nrseqstate) {
+		for (i = 0; i < drvdata->nrseqstate - 1; i++)
+			state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
+
 		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
 		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
 	}
@@ -2058,10 +2060,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	if (drvdata->nr_pe_cmp)
 		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
 
-	for (i = 0; i < drvdata->nrseqstate - 1; i++)
-		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
-
 	if (drvdata->nrseqstate) {
+		for (i = 0; i < drvdata->nrseqstate - 1; i++)
+			etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
+
 		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
 		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
 	}
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index e9eeea6240d5..0e1ad175aa1e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1395,6 +1395,8 @@ static ssize_t seq_idx_store(struct device *dev,
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etmv4_config *config = &drvdata->config;
 
+	if (!drvdata->nrseqstate)
+		return -ENOTSUPP;
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 	if (val >= drvdata->nrseqstate - 1)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


