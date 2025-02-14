Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7126EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHjc5OPKkF37ggPKdeL5lnNFJ7D1zRHxw3TUZjzBlto=; b=FquNGl93k0Aa3Z/Pd8gX3mySZP
	ODRQODw40okymhdVXLmGhGJagpPU3/ssrq3QIVGzh2LVYWEJcpqODLgJuqrwrc65l4aP9pIPQGOB2
	yF4iMVgnuCpBzykLSSy9qniM8r+t9etHschaeBxjiT9EllAnByG9Jm4OI7+Py5NOh6AqyNPXN6YjG
	adIVONigVV4D/i8/hwB0vdBZco2wOoZ6rf4UyxlgFscGBXtoHQWY/5ucKCuKlAwIn/ze4kHPkHGyz
	ezNwsbDIVjFBgfq7Mf8ORXKVgKwmpRsxGQjN4lToJo6VHLibdDZNE/Um7o/zoB/c5+k6YjRXD0IMg
	e5eJnkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilSv-0000000DM35-3oeg;
	Fri, 14 Feb 2025 02:30:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til1w-0000000DFVa-3Jbo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:02:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5BCA5C5D16;
	Fri, 14 Feb 2025 02:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9701CC4CEE8;
	Fri, 14 Feb 2025 02:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498531;
	bh=hTVDnp0p6nmD43kAvlLpMQz5gcUT21vSNtNfafanNjA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ePLg2gQu1d/23ahI4SHCbAFiOWOxSSpo2p9SvZHxjTr11X9256HuK4tkbcp9JNg7W
	 mceo5hZqD2rwHroxUagmvA1KZKf/dMkS4nkDbmej80RcgygY79V8BBSvJ06ESsWjlH
	 J45nJGqL2f+3AqdKkvXh6Xsdicbuw/aU9lga+X7A0S/Ctm4WBcOojqxWiE5H6B+kUd
	 q08272WxckRA/6z98dbYdA2+t8lprgILaEGu+pI/5or6qIMUsDHSI3kmcCQ8un+yze
	 9l1g54vsIVnrPjqQNTl/h8mbpeFOM/JZqg3+BC3laVc/3EmoKqMIw11ZowU9ImEyQ7
	 /86j441616Zlw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:58:02 +0000
Subject: [PATCH v4 19/27] KVM: arm64: Provide assembly for SME state
 restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-19-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hTVDnp0p6nmD43kAvlLpMQz5gcUT21vSNtNfafanNjA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPPqEmHRwyJlV+4taSwkW14T+B7Fla3GYl2iXUU
 d/Vh+z+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jzwAKCRAk1otyXVSH0BVyB/
 94PGxLphmD7LasFr7JLf4xmHrwfbkexncRmrlZKWhA+U8fKTy+dHyqOhsJAeU1uT6rL09lrOozq6vb
 b3pUGAZ3VCoO705G404h4QBPBi7Dlzu3aO9NdfyiJSTz+ATFeC/d1iSutGSgH0TFDYY+kVnHR4tFqF
 cTH6A8MdHa4o4H6iNGJChQsWc1ctwb2MUhaRUp6iu1dYF/lkhklXERxhqRj4LLGcxVGI2zgPL/BS/6
 TE7nKBN9b4DGJtsV/2HeHzVXwUxLb9EAymsIl60BBi/V+qLbuLa5A0TrqEISq/DQ0Brk1/N+BKXt8x
 CteX9zKpoXnpiqlyz5R7Z8mIkFCKom
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180212_956888_A9E577AC 
X-CRM114-Status: UNSURE (   9.56  )
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

Provide a __sme_restore_state() for the hypervisor to allow it to restore
ZA and ZT for guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_hyp.h |  2 ++
 arch/arm64/kvm/hyp/fpsimd.S      | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 21943cb98542750a1b626a8de6bbc095d7770ccf..5a1f8e4be18624efa6b887f09c36f0e8ad318c40 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -113,6 +113,8 @@ void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
 void __fpsimd_restore_state(struct user_fpsimd_state *fp_regs);
 void __sve_save_state(void *sve_pffr, u32 *fpsr, int save_ffr);
 void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr);
+int __sve_get_vl(void);
+void __sme_restore_state(void const *state, bool restore_zt);
 
 u64 __guest_enter(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
index 6e16cbfc5df27e63732655dffea60d7039c37332..b21809adfba78522410da053fd4eccbb66484532 100644
--- a/arch/arm64/kvm/hyp/fpsimd.S
+++ b/arch/arm64/kvm/hyp/fpsimd.S
@@ -29,3 +29,19 @@ SYM_FUNC_START(__sve_save_state)
 	sve_save 0, x1, x2, 3
 	ret
 SYM_FUNC_END(__sve_save_state)
+
+SYM_FUNC_START(__sve_get_vl)
+	_sve_rdvl	0, 1
+	ret
+SYM_FUNC_END(__sve_get_vl)
+
+SYM_FUNC_START(__sme_restore_state)
+	_sme_rdsvl	2, 1		// x2 = VL/8
+	sme_load_za	0, x2, 12	// Leaves x0 pointing to end of ZA
+
+	cbz	x1, 1f
+	_ldr_zt 0
+
+1:
+	ret
+SYM_FUNC_END(__sme_restore_state)

-- 
2.39.5


