Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA1CCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPQ3ruo47w3o4Mfm3SEVOpsgwsvYs1zjU3NfCO67nD0=; b=kZ4yqHNqU1XaA8Uk+N32M08kbe
	qI7ADKSnz9CwdwldCOpOf/zBlfAEz7RtYZ8eTpxuOsmFkIVHwZgZcaa1BMDxWdTpHJXXLJLuPAdF2
	QDxcfneBycurWxINiP/Hi3y16nhq0vXTtz+nNaODsCyTN94dh4qx8ctd2v1NEH4jblxmFBwKCrVW8
	+Gl8Noz20TjF9vHVExe6u/M+KZy/AjgRYEcaAgB/5TXBcWN79l/4cA2PbnjCq70YukRDeTMIVUsqG
	S91Qnugla+8GJYf8pAzVT7aXwywnAdhIQjgJZ1zX397yBloNF8twlvXh49Q37a/GgvFXoKPv/mfS6
	JnrHbpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7e3-00000003xwM-1AzY;
	Mon, 15 Sep 2025 11:45:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dj-00000003xeM-25FQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5249060231;
	Mon, 15 Sep 2025 11:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A54C4CEF1;
	Mon, 15 Sep 2025 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936699;
	bh=2TF/zey+KtgVTwTjGrxKxIt7FD4E/OPw0nUb/TkWf2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KucY3wyZ7ey4BOfRCjfbLr0+D5mWLUvhVrg9PvRWDaErQRg3o5JOBBdBrKU1uErKj
	 QT7YognH7WcR/TBciahDpN4IRUqqfV1z+FwiBuZtCPQsK1KuYVgqrPkpiI6K972hiP
	 Cfhb1x/wDgfbMaXXA/5p6LZ131sk9qwzEpdiDs4TkGW9sz5uZyL0TTgU0+3FlwBNT0
	 Hwrk0y+nvc09kNkoinngMJG93fy6c+yZ33wg+yHxPMtx55igs4URKm6a2V/QfQsMtm
	 BhJszbm9RhrPB0eMDGHGKB8A7eeyaTbZrcCwiQn+xA9AV5AQGHGUgEg5GrwsoV5cTZ
	 SGb+HUv7GHLBQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7dh-00000006MDw-1NvK;
	Mon, 15 Sep 2025 11:44:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 12/16] KVM: arm64: Don't switch MMU on translation from non-NV context
Date: Mon, 15 Sep 2025 12:44:47 +0100
Message-Id: <20250915114451.660351-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

If calling into the AT code from guest EL1, there is no need
to consider any context switch, as we are guaranteed to be
in the correct context.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index c84a021067daf..2f6f83cc8d19d 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1294,7 +1294,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 {
 	struct mmu_config config;
 	struct kvm_s2_mmu *mmu;
-	bool fail;
+	bool fail, mmu_cs;
 	u64 par;
 
 	par = SYS_PAR_EL1_F;
@@ -1310,8 +1310,13 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	 * If HCR_EL2.{E2H,TGE} == {1,1}, the MMU context is already
 	 * the right one (as we trapped from vEL2). If not, save the
 	 * full MMU context.
+	 *
+	 * We are also guaranteed to be in the correct context if
+	 * we're not in a nested VM.
 	 */
-	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu))
+	mmu_cs = (vcpu_has_nv(vcpu) &&
+		  !(vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)));
+	if (!mmu_cs)
 		goto skip_mmu_switch;
 
 	/*
@@ -1379,7 +1384,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 
 	write_sysreg_hcr(HCR_HOST_VHE_FLAGS);
 
-	if (!(vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)))
+	if (mmu_cs)
 		__mmu_config_restore(&config);
 
 	return par;
-- 
2.39.2


