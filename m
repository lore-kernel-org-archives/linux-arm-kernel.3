Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A919E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAxZhNgk1rtIGa1kSUqiUHbGpsQKOEDQpw7f9uu1F6A=; b=U3whPZgP+amyFUBkjaIiva4R9L
	rWgAIxmRGYyX35LZp62iRLjH+SUVsGAVcWlhmv7gBX32N1UJuZyP8ko/a9I+x90e3TmVkWpCY71o0
	CODLDjyEIc6w/QlYr8oNJKv1H5la2WRuEeyMS9iqt4bIEWkJT8T7DorX8Rh43SekM2KNtk9MuTzju
	K9b8/KLAEWGELyVSPxo4eHlqyxvBe7YPWMih38Rry2iUfQwuicxGp4fJ0ScyG2MyrbI1Q0VEwETmo
	dGSAvTJ3ZZV0I+4eAmZkMFpMcWpSmjSGhQXLrvp7RpQ746vcq6ISDrXF2gsTz+vCDC1e+3R8YiG4H
	ucQieblA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgOW-00000005YNU-2l4E;
	Fri, 20 Dec 2024 17:02:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDs-00000005VxN-1ZWN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aAxZhNgk1rtIGa1kSUqiUHbGpsQKOEDQpw7f9uu1F6A=; b=TdSGrixl/v/XXUEgaHLPe3/PxQ
	Z34quBrnhKYlSWsCow25TZAeLSkzz5G4/VxJz0fP8/6woUJq+jTpws2spHiyBM2XktKdApqieuA1s
	wCO2NHuzSfi12VwxqCJxaRZ49oeaY3/7cvMdzKzxlxPTu/yuO1J8XYSvgr6rHblST207gY2t3NXNd
	Z/knRPBre1I8zgBrBZjH1MWQuNKkvPN3CQJFwOUFoMk8JW0+PiJNlNNryAJv9VK6C5TM/dOFyhs7X
	zPFYDBIU2W9TEFiGvnYnpSARCCax7oiIaq9Yin/xYvTSlYzt6UN9Wt9pPjUSQ2ukAXnQZDJIHF81e
	ZnlqtlJA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDp-00000005jW2-1e39
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DAB15A42017;
	Fri, 20 Dec 2024 16:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAB8C4CEDC;
	Fri, 20 Dec 2024 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713488;
	bh=/i3TwaKgCBLSWDUFzgZJ5E4rHb3UDDDbQ/9/hT2MAGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=crEj/i06gGmZk5M1LHwTVOq3Ku4eZAwf5Lzjlpp4UJMXlDax1g3QMdBxXpwDIF7FL
	 3f4Sw2E19x5pgh+/SUWeExgu5ZqBXoC0UQYa9MfQqEiEqAYj7i1uvEoPBmwRt3Zch/
	 yBRzbMe3fLfIJ0ZQU2nlMSoQ4Z4Ft0xsLUnbt10tgLxn8eAPoNfh4jbCJEWaXWYKkj
	 6+JriIQTN1rfxrzPFATGPza69g/KlQ6qL7xrR2ftbW4arHneM8tELY2c83conD3+sc
	 Ne7bT4T5Z9rC0XG/I9u3BvNBBAG9H0C3RtojGEnJmqcjV8an0PT22I8GWfXd1YQeOo
	 D+NPSWaiBOsYg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:33 +0000
Subject: [PATCH RFC v3 08/27] KVM: arm64: Move SVE state access macros
 after feature test macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-8-05b018c1ffeb@kernel.org>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
In-Reply-To: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/i3TwaKgCBLSWDUFzgZJ5E4rHb3UDDDbQ/9/hT2MAGs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBaSCMFrVKugleuCqcjESXruDC/s6CaD4yZ5F6Z
 p7wReKWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgWgAKCRAk1otyXVSH0LqlB/
 9idSTtrsfAftjwtJ51rl1MDfrczjOESiyC+PCFAePnmVi3KdagMZPCJQvdE7wrKQuchGOWvo9/CLq+
 cN7EaMnLRHfgp8Z/hUnReRjkCeiHX6BBOj0iNBGSRirbpxgDO95XXMQAGYnQLEeGAXP1431tdMRmzf
 LAzBVbJtNVeUBBEHCRD0Yn5Wb8AKl7fWQYwAJHJikESsLd6fPuwCVKe+oekBg/R1YaUxiTNfVApgOM
 s4PZRY/HFMAqM77VIzYl/XflL9D6jQAwR2yKjwLDgt7OK5tGxJk41JJH0hl36jcAdH41yrYuMic6lU
 kq+tPZijmIyttMxtCnye3BE46zZ1AN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_165129_743232_442E4872 
X-CRM114-Status: GOOD (  11.74  )
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

In preparation for SME support move the macros used to access SVE state
after the feature test macros, we will need to test for SME subfeatures to
determine the size of the SME state.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 46 +++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index fca81ede6140c0ee7d03cb6ca8f5eead45b87033..97b617606221e8c11fd2b55d9636848d8453209f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -934,29 +934,6 @@ struct kvm_vcpu_arch {
 #define IN_WFI			__vcpu_single_flag(sflags, BIT(7))
 
 
-/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
-#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
-			     sve_ffr_offset((vcpu)->arch.sve_max_vl))
-
-#define vcpu_sve_max_vq(vcpu)	sve_vq_from_vl((vcpu)->arch.sve_max_vl)
-
-#define vcpu_sve_zcr_elx(vcpu)						\
-	(unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
-
-#define vcpu_sve_state_size(vcpu) ({					\
-	size_t __size_ret;						\
-	unsigned int __vcpu_vq;						\
-									\
-	if (WARN_ON(!sve_vl_valid((vcpu)->arch.sve_max_vl))) {		\
-		__size_ret = 0;						\
-	} else {							\
-		__vcpu_vq = vcpu_sve_max_vq(vcpu);			\
-		__size_ret = SVE_SIG_REGS_SIZE(__vcpu_vq);		\
-	}								\
-									\
-	__size_ret;							\
-})
-
 #define KVM_GUESTDBG_VALID_MASK (KVM_GUESTDBG_ENABLE | \
 				 KVM_GUESTDBG_USE_SW_BP | \
 				 KVM_GUESTDBG_USE_HW | \
@@ -992,6 +969,29 @@ struct kvm_vcpu_arch {
 
 #define vcpu_gp_regs(v)		(&(v)->arch.ctxt.regs)
 
+/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
+#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
+			     sve_ffr_offset((vcpu)->arch.sve_max_vl))
+
+#define vcpu_sve_max_vq(vcpu)	sve_vq_from_vl((vcpu)->arch.sve_max_vl)
+
+#define vcpu_sve_zcr_elx(vcpu)						\
+	(unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
+
+#define vcpu_sve_state_size(vcpu) ({					\
+	size_t __size_ret;						\
+	unsigned int __vcpu_vq;						\
+									\
+	if (WARN_ON(!sve_vl_valid((vcpu)->arch.sve_max_vl))) {		\
+		__size_ret = 0;						\
+	} else {							\
+		__vcpu_vq = vcpu_sve_max_vq(vcpu);			\
+		__size_ret = SVE_SIG_REGS_SIZE(__vcpu_vq);		\
+	}								\
+									\
+	__size_ret;							\
+})
+
 /*
  * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
  * memory backed version of a register, and not the one most recently

-- 
2.39.5


