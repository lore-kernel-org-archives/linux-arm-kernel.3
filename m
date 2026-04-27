Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C911CFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhTgo6WW+Hf+fMpICkTG7fyYcG3KOpomLOlvv70GtyU=; b=am7GMWRG1JABIjrLwX8k/mMguA
	/Ef0OT5RnDas3rnpni5aZOB8nil28T4F/gv2YiPG17QXt+jxJov1ITecpCilP5W1gb3PkMIHvgmmd
	X9rVTkkOZmR8R5TzUJVzXOUM7lJO8kQDrR+sApe0xQ6CyVa5daZwswSBMOM8ofP4DxkdLSBy8Yvfh
	clI6K7qFg+nCHKvBKUv13kUpKWgPi2k4+aF0EF2D7B40Ke1H9O1lcYrAwMRJl8tu2Lc131cpHgr8Q
	vdtkaqArRvfyZc1efV+rw/CzaBMKrPvhbHF0DVw0WE4Zm2cxl4j2zIH0zpNnAxeIolj+AZeKUSakw
	nuYwGMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFGk-0000000GFDN-3SWo;
	Mon, 27 Apr 2026 06:16:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFGj-0000000GFCd-0qpo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A451A6014C;
	Mon, 27 Apr 2026 06:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D5BC19425;
	Mon, 27 Apr 2026 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777270592;
	bh=hTCKt18aJAo+65yWwcIoa64hixUbPX6xHIb2YBgs2KY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LvT05MDoRKVUCbCVVrSqbMDI4zJAoGYv2pfKHXuUloJmPCcbFViXFNrjLzr6fgxsi
	 XtHEG9aLvbyj5qbwgyU1P6WVTK0275pA5bsBSV3FFypOoTtwuAboKdWE67XuAwTTbH
	 vQIhMz2vOeP6ZjF1imAI66U/txiHICSxBpX9eSVdAn4jr6O0XmiQT9qZMZs16N/0LX
	 c6AfNEEQ1ptLmCDDdialjuHT12m2feMMY+sjEPuA+iUXeMuz80uD9IzZpy7ddz06WP
	 biSEam5k7zmO95rqLFGn1gdscXwtd6spwXHmuGdWPhflEWVuuv+J2wBGw5o6sE+WQg
	 zrfv8Wggt37bw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v4 2/2] coco: guest: arm64: Drop dummy RSI platform device stub
Date: Mon, 27 Apr 2026 11:46:15 +0530
Message-ID: <20260427061615.905018-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427061615.905018-1-aneesh.kumar@kernel.org>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The SMCCC firmware driver now creates the `arm-smccc` platform device
and also creates the CCA auxiliary devices once the RSI ABI is
discovered. This makes the arch-specific arm64_create_dummy_rsi_dev()
helper redundant. Remove the arm-cca-dev platform device registration
and let the SMCCC probe manage the RSI device.

systemd match on platform:arm-cca-dev for confidential vm detection [1].
Losing the platform device registration can break that. Keeping this
removal in its own change makes it easy to revert if that regression
blocks the rollout.

[1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/kernel/rsi.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index 8380e5ba88d2..9ba29e832685 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -159,18 +159,3 @@ void __init arm64_rsi_init(void)
 
 	static_branch_enable(&rsi_present);
 }
-
-static struct platform_device rsi_dev = {
-	.name = "arm-cca-dev",
-	.id = PLATFORM_DEVID_NONE
-};
-
-static int __init arm64_create_dummy_rsi_dev(void)
-{
-	if (is_realm_world() &&
-	    platform_device_register(&rsi_dev))
-		pr_err("failed to register rsi platform device\n");
-	return 0;
-}
-
-arch_initcall(arm64_create_dummy_rsi_dev)
-- 
2.43.0


