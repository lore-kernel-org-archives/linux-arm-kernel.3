Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD5FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6P65NQorbg6riSJZf0uR6dARXoP7xkF5PuwdJujrJI=; b=u8OXJVDHKxVKoKmRKFAE26ocmU
	pY0kq8k1qnrJbhEX3I8K8WPFVHYKB4OA8mmoqKVubbcvj51On6jBurb2cxKLGInnSHBUry71MwiLu
	xncwOvUrjLlYORx486RPjDk02ms2l+A896uEIMNzqJTLxZkLIjN0/EphxFPaFoj+v1qRTkePMJywe
	HLAr8kNzTRuaAHQ/3Z74ap6WEOpc7yMsKFtaqb2vaJh1vJVQ9Z7YO2SVY/7hX6rkABTBEpleWZB0X
	K1XjAE+IT1300rWKH34RzmPjtfU2NKUYE2ak7Nx1w434Ro+o8G1YIFXoZYg7dQi6bc+zh9P7Ujd48
	YRUnurKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKw8-0000000A0za-3d7x;
	Fri, 24 Oct 2025 16:46:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKvw-0000000A0ql-1hhC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:46:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5015E1D34;
	Fri, 24 Oct 2025 09:46:23 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D64A3F66E;
	Fri, 24 Oct 2025 09:46:29 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 24 Oct 2025 17:45:52 +0100
Subject: [PATCH v4 04/11] coresight: etm4x: Correct polling IDLE bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-arm_coresight_power_management_fix-v4-4-690e69ae6977@arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761324381; l=1327;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=6JFlV1iB+B/PJX3uDpYsm8yr0tL0HgIr4yPNrMCuQx4=;
 b=Al3oHcj35P7G/VE5VtqtVBjQ5hLOFx/kjxUCe2HV0PPSWy+b+3lEOVFq/1oI2RC+7iBgM/TFn
 AJQovpPQleXBMfEeztew7/VER+vpXwQPf+wfcE7VkW9LyPk9v94ob72
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_094632_516332_ADE7E7E3 
X-CRM114-Status: GOOD (  11.40  )
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

Since commit 4ff6039ffb79 ("coresight-etm4x: add isb() before reading
the TRCSTATR"), the code has incorrectly been polling the PMSTABLE bit
instead of the IDLE bit.

This commit corrects the typo.

Fixes: 4ff6039ffb79 ("coresight-etm4x: add isb() before reading the TRCSTATR")
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1324b40d54210078b70a760ac1b084a4b20e8770..c562f82985192ad71e181be1b570c9a2f334f29f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1924,7 +1924,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 		state->trcpdcr = etm4x_read32(csa, TRCPDCR);
 
 	/* wait for TRCSTATR.IDLE to go up */
-	if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1)) {
+	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
 		dev_err(etm_dev,
 			"timeout while waiting for Idle Trace Status\n");
 		etm4_os_unlock(drvdata);

-- 
2.34.1


