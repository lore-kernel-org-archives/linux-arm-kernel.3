Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362EDCE7A8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0YUz2qgv5SKEEik1W2pb3FhNcPvyr9EdjMyQWMFQs8=; b=pgsAYJoooF7ELqK6k9C9sGiW2o
	aNuD4YpBH9ID3HHNSNNXstnpu/ICGrS53N/cveLnHYg5pOGLnVxE0ScKQhQgLBoE7M8H+ihTdkWDY
	HHqciCucMaS4VgVjAEL3PH2WylveAVOeeqCCEGFfbr8SckuJ26WgGIRTiydK3TY4x16wNlbJFccce
	bdW3dmHaxm3SMi9ELWwF/AlFPv3Ynmt1DpIOccdAY5HCcVSc2QuCrvoRTadFxRmFfYKW/S3cnm2/W
	2H444/+yzxixGaSOwKsJ0ZDIAAywsUcFsK1WeIz4qnoSeI2tM10kNFgvaYn8wlGrXXC6ggGvbyKON
	lZIU/3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpWh-0000000BpmY-3dny;
	Fri, 14 Nov 2025 08:51:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpWg-0000000Bplw-0R4S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 08:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAA5B401EE;
	Fri, 14 Nov 2025 08:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E038C4CEFB;
	Fri, 14 Nov 2025 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763110285;
	bh=7Ml5g5GMw5hImaogyfCGwLHRO/LZ+w2FiswOQQXR/7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DC0N4+sCVSEjmRQD36WAiQDt1Mshz+uRKYeQLzf2cQHtW90HVokHMFG3EUjWldgTU
	 09jg0R86G4oJmuG0h635UMsFGaMA4U7V1EI5Wln98IXiNqk7LHcAxmyMf/62UE6OFn
	 olRdeY3rh/mF3yrbfpxSXRv1bh9eAKMzxVaGfB21D4vONW82uRIBplQ44s0mG16YaI
	 wEpxQC5Ml6RTgYDcAJJecask5EStgQCa74Kb/WlsUOfQsqhguJnPrIIAQ8PkhZLvxN
	 sJh9mn0+O0fhv2xT3cuBljtdUSJjQqZNAhJsMxa0hlWsI62D42n7y1CespYcGN8aMP
	 gMJO7tIuWNnXw==
From: Sumit Garg <sumit.garg@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	mark.rutland@arm.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	shivendra.pratap@oss.qualcomm.com,
	leif.lindholm@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: efi: Pass reboot cmd parameter to efi_reboot()
Date: Fri, 14 Nov 2025 14:20:58 +0530
Message-ID: <20251114085058.2195900-3-sumit.garg@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114085058.2195900-1-sumit.garg@kernel.org>
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_005126_164677_E47E3343 
X-CRM114-Status: GOOD (  11.79  )
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

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

EFI ResetSystem runtime service allows for platform specific reset type
allowing the OS to pass reset data for the UEFI implementation to take
corresponding action. So lets pass the reboot cmd parameter for the EFI
driver to determine whether it's a platform specific reset requested or
not.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 arch/arm64/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index fba7ca102a8c..51784986c568 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -136,7 +136,7 @@ void machine_restart(char *cmd)
 	 * ResetSystem().
 	 */
 	if (efi_enabled(EFI_RUNTIME_SERVICES))
-		efi_reboot(reboot_mode, NULL);
+		efi_reboot(reboot_mode, cmd);
 
 	/* Now call the architecture specific reboot code. */
 	do_kernel_restart(cmd);
-- 
2.48.1


