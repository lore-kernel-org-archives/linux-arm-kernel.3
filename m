Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFCECCF2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KdhsdJDk8SIToeoTJ04bKGX01lJQDTSPOhBJqAzOfE=; b=INHyu0pwR8y7Ml8A25Bub717vb
	0wiRE/Cg/ctzii1QB2daYYb9jG49gB8n1XR7Uc67MOTc05zlOfK+M+0nNgaRdQInhgkDfnc9nqsZs
	piwiefR80G43q+HO4d//QXH1wma7VKudrkd35b5pfetWpExGigVcq9V9cI6ZY4aH7VCVoWeRHLFIN
	s97PexpUpz3XNgbhAGS72RfAB5jWLI82xqQXo2EPy8xweBDQHqannDKFbuXcY8vfO9c/ApI2gVtFR
	Ieb8lZzupfuvk9MEKLY8Zm1Lg3HK1xBo8PXOuHnlcvD9iHJ5rzGH2y37QKJ174ziXzFwNNglMGS/B
	KluW3J8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhof9-000000023E7-18ez;
	Mon, 19 Jan 2026 12:47:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhof2-00000002389-27HF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC93460131;
	Mon, 19 Jan 2026 12:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222CBC116C6;
	Mon, 19 Jan 2026 12:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826831;
	bh=Ci8Yc7ndwDlszED/Qx1HGsS3eO9VUT9SMiftdYGNQu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L+kax+mFuRN3ESDhczlAuyD1l3SxYTvc0LuBJJvNxSL9yW0Tmwni1tTupHx0CRQag
	 2ZUPTwTToR9s9KbzvtArqerdYpOdalYAD77fPrj5Ubpet1iEMLGKhd4m2vvm5Vhoty
	 4Ise9kfMx92nTCCN28VIngy4Vq8Yr7OLh0X2wg9uu7zH/1niw5c7B3LC/TfyVQtdUe
	 wPfrxH4y8FfwKjw41yUL7+B40vcOxgggBIAGFrh2HLJr6FxzkFov5DAX5Sw5s6HZj5
	 EFxiHU8ceqqFbpA5XxE0tRcFBOcextPcLnPrIh7SFL3FGPDcrw6DIqUEw9pkp5AbcI
	 LG06VOagfk4bQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 06/35] KVM: arm64: Expose self-hosted debug regs as RAZ/WI for protected guests
Date: Mon, 19 Jan 2026 12:45:59 +0000
Message-ID: <20260119124629.2563-7-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
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

From: Fuad Tabba <tabba@google.com>

Debug and trace are not currently supported for protected guests, so
trap accesses to the related registers and emulate them as RAZ/WI for
now. Although this isn't strictly compatible with the architecture, it's
sufficient for Linux guests and means that debug support can be added
later on.

Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 3108b5185c20..c106bb796ab0 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -372,6 +372,14 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* Cache maintenance by set/way operations are restricted. */
 
 	/* Debug and Trace Registers are restricted. */
+	RAZ_WI(SYS_DBGBVRn_EL1(0)),
+	RAZ_WI(SYS_DBGBCRn_EL1(0)),
+	RAZ_WI(SYS_DBGWVRn_EL1(0)),
+	RAZ_WI(SYS_DBGWCRn_EL1(0)),
+	RAZ_WI(SYS_MDSCR_EL1),
+	RAZ_WI(SYS_OSLAR_EL1),
+	RAZ_WI(SYS_OSLSR_EL1),
+	RAZ_WI(SYS_OSDLR_EL1),
 
 	/* Group 1 ID registers */
 	HOST_HANDLED(SYS_REVIDR_EL1),
-- 
2.52.0.457.g6b5491de43-goog


