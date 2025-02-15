Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3FDC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gAFkLopync5cLp7LyZ6TxHPYvVX+emiR0FJPdt+POI=; b=2uNfSD2aRLNgPWxucAMuHm5DYs
	iJc44XubGPmc4risx0XzYJhwgiI+uvzTnPnA94MFEyj/vBUAVzFoYzyiQkFccvVq5RMKUB7EYY8zv
	dALR+2wUmVSHSeA/gcnTyFzv3zKxSikoDG8/hxc7SoaWdQTehUNDIC9mRL4UqR6UfP+zIhhtS39fJ
	5Tzl/+CZRVN0vEDVRrq3iBkfLsf/1ehI8Q00PRtVMnH4zbeQHnVMf68Y/Tcs5ygBMUVt4mtgJgXzG
	0sh5XKArQbhAFc2jRfzUyMx0Gl1wozDHciR+vkVRgP7Q05IGXKG4AYcRRTc6hJiCNJTeT7aZ574I8
	sc6vPEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJok-00000000IDe-3F1X;
	Sat, 15 Feb 2025 15:10:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJgC-00000000H1M-1lVo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 15:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 035425C5413;
	Sat, 15 Feb 2025 15:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25564C4CEE8;
	Sat, 15 Feb 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739631723;
	bh=DZqWgyeVUqaZBKtUHoe9HapFKZfsw/9ajICg4MC0T0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O4FtqBhj0JS/ProY5LuKkzSoMfEa+jFZR9jxIKjGcsFWssgAKB1SEQw3uJTOrrz1b
	 FUavgPXFzXTFC7UYsPQsqwD6KW41EmtNi8jYix6qh0mUtqHKb2TUPkmJcy2pP6T+dR
	 L892Y43ZIKzWhlH21Q/0aw73Jm+wCnxEtyq7itapSUpfzZte/fgNUP03KHjMe8ncLz
	 wiCXw7n+yclZJjRnig7oqvmkDKNVdv/KMSu/O9O1i6UrKM6ynzsfcvpx3H2jXn19uW
	 HWYewjztBS8m0+bth/hvyJsvfmgq13YZ8n61lnX5CIYv8qgWWE9gYxnfKvFq2VEeIl
	 Uw1a2JFtwr52g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjJg9-004Nz6-4W;
	Sat, 15 Feb 2025 15:02:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 05/14] KVM: arm64: nv: Move TLBI range decoding to a helper
Date: Sat, 15 Feb 2025 15:01:25 +0000
Message-Id: <20250215150134.3765791-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215150134.3765791-1-maz@kernel.org>
References: <20250215150134.3765791-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_070204_542444_C3350C18 
X-CRM114-Status: GOOD (  11.20  )
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

As we are about to expand out TLB invalidation capabilities to support
recursive virtualisation, move the decoding of a TLBI by range into
a helper that returns the base, the range and the ASID.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h | 32 +++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c           | 24 ++--------------------
 2 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 2bd315a59f283..cc1302cb7929f 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -230,6 +230,38 @@ static inline u64 kvm_encode_nested_level(struct kvm_s2_trans *trans)
 		shift;							\
 	})
 
+static inline u64 decode_range_tlbi(u64 val, u64 *range, u16 *asid)
+{
+	u64 base, tg, num, scale;
+	int shift;
+
+	tg	= FIELD_GET(GENMASK(47, 46), val);
+
+	switch(tg) {
+	case 1:
+		shift = 12;
+		break;
+	case 2:
+		shift = 14;
+		break;
+	case 3:
+	default:		/* IMPDEF: handle tg==0 as 64k */
+		shift = 16;
+		break;
+	}
+
+	base	= (val & GENMASK(36, 0)) << shift;
+
+	if (asid)
+		*asid = FIELD_GET(TLBIR_ASID_MASK, val);
+
+	scale	= FIELD_GET(GENMASK(45, 44), val);
+	num	= FIELD_GET(GENMASK(43, 39), val);
+	*range	= __TLBI_RANGE_PAGES(num, scale) << shift;
+
+	return base;
+}
+
 static inline unsigned int ps_to_output_size(unsigned int ps)
 {
 	switch (ps) {
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82430c1e1dd02..24eaff9379e75 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3304,8 +3304,7 @@ static bool handle_ripas2e1is(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 {
 	u32 sys_encoding = sys_insn(p->Op0, p->Op1, p->CRn, p->CRm, p->Op2);
 	u64 vttbr = vcpu_read_sys_reg(vcpu, VTTBR_EL2);
-	u64 base, range, tg, num, scale;
-	int shift;
+	u64 base, range;
 
 	if (!kvm_supported_tlbi_ipas2_op(vcpu, sys_encoding))
 		return undef_access(vcpu, p, r);
@@ -3315,26 +3314,7 @@ static bool handle_ripas2e1is(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	 * of the guest's S2 (different base granule size, for example), we
 	 * decide to ignore TTL and only use the described range.
 	 */
-	tg	= FIELD_GET(GENMASK(47, 46), p->regval);
-	scale	= FIELD_GET(GENMASK(45, 44), p->regval);
-	num	= FIELD_GET(GENMASK(43, 39), p->regval);
-	base	= p->regval & GENMASK(36, 0);
-
-	switch(tg) {
-	case 1:
-		shift = 12;
-		break;
-	case 2:
-		shift = 14;
-		break;
-	case 3:
-	default:		/* IMPDEF: handle tg==0 as 64k */
-		shift = 16;
-		break;
-	}
-
-	base <<= shift;
-	range = __TLBI_RANGE_PAGES(num, scale) << shift;
+	base = decode_range_tlbi(p->regval, &range, NULL);
 
 	kvm_s2_mmu_iterate_by_vmid(vcpu->kvm, get_vmid(vttbr),
 				   &(union tlbi_info) {
-- 
2.39.2


