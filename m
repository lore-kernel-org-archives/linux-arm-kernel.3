Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E2AC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SztSUpbsqfIgO005x2FPAmHBQNw5E5n0LUq/NdA0HU=; b=vpHYEgvOzXyPWdUfUqYHzTWja2
	bWmJTlhwJfR4Ygqmg6mpc1EBIouNBDxkHZELB2jzcqYpHcQpYcTgAIs2MvjZuv3ePOUBFoFI5edtD
	QPPaLDrhpTrkeyX5l+tKyiH0ywR0UjdmSnfzk6FbCMix7nBj8ayeKHKrkjy2u12Fp3f9b4QIzM06y
	DHjkMHdsv+Wt8HarCRfITZDoZnDcq9vgaRxlk7Hr3XTUvadTXJsvRuBijcQxeGHTEi93GmVOLuN1r
	DEk28gDs2ND3RJPiMkYAZS7dWWXzW5/uW0PPrfQU+99ujcv7Vq9817D9G8p4FT9HIRF6lEO3Og7Yk
	Ez/FWmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmVM-0000000CUwC-1Yns;
	Fri, 31 Jul 2026 12:38:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUl-0000000CUcY-25hn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:37:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C97B541A49;
	Fri, 31 Jul 2026 12:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED971F00A3E;
	Fri, 31 Jul 2026 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501466;
	bh=2SztSUpbsqfIgO005x2FPAmHBQNw5E5n0LUq/NdA0HU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MUVfliT8oYhJnCj/BJ/J46GBwZX1YAo9xvIA4MuUIEZ/gptCvTGlpC4IEBXOTbdZb
	 ob/In2Wk29Fw+ESbe+Gkrrt+OKF081D7z4WTsE8cZ6YESbkFduP6FegCDtO6NibPyz
	 JTVHuqB5XJ9vl6b+bZr+rmiVoao/+LULhsGkx3n7qoOn13BboxqC2x6bDG4hrDRjRU
	 Gi+ry+Ezi/E797AT5CkjNWhHtbvWuZi1XalDBfyFfuxkebar3cY8p/Nn6TjL1tAMlW
	 tZ1Hne61MJmemJFTOAMGH+pn46KaSorMy9aVj3sWktq6G4ts5HIkpNfKkR1mEv8iTT
	 QK30tQ3uRtz+w==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 13:25:43 +0100
Subject: [PATCH v17 05/14] KVM: arm64: Set PSTATE.EXLOCK when entering an
 exception
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-gcs-v17-5-5e39ca01b14e@kernel.org>
References: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
In-Reply-To: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rvtRV62usxvYDabRiDuT5QzOKER095ZOoLBRwH9Xwsc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbJb/AJFaS2DpkGvedgVJ9VYbHW8bMmiP0fPw7
 ZEiXBwgikqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamyW/wAKCRAk1otyXVSH
 0OuTB/97FhJlWUvMLrTaOyBT9B0gl7l0ec7Rp7QH+V2nKcB+6vFPfbo9QZy0y+QIMY623/IZ/NN
 3rch/ho8F5zS7/uOWByUeL13H1YDc3cK0nZPRbWesfs28hgmLhXS7ioiwWr2k8O14P9v2zAxo10
 836ejbS1cJ6dXxCenqTo64xHM/EtYw57f7MtQ55epF9vQ9ZM0yDcv4eDtY2C9ZB7RO3cYd8dEPo
 VnQPEel90VPuG1yheGBtJs/zxj7bJfC2xHumC1ptkSTWhHtbLCY+dZwYff8OZiTvTkBlGd+x9NB
 mjzHRZL36yQIfByPnetyTFYOZdEnwXB/8nZsparyCW6chXtP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

As per DDI 0487 R_WTXBY we need to manage PSTATE.EXLOCK when entering an
exception, when the exception is entered from a lower EL the bit is cleared
while if entering from the same EL it is set to GCSCR_ELx.EXLOCKEN.
Implement this behaviour in enter_exception64().

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/uapi/asm/ptrace.h |  1 +
 arch/arm64/kvm/hyp/exception.c       | 37 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 6fed93fb2536..6113b9f9771b 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -56,6 +56,7 @@
 #define PSR_C_BIT	0x20000000
 #define PSR_Z_BIT	0x40000000
 #define PSR_N_BIT	0x80000000
+#define PSR_EXLOCK_BIT 0x400000000
 
 #define PSR_BTYPE_SHIFT		10
 
diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index bef40ddb16db..15b00e0ee1ec 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -65,6 +65,38 @@ static void __vcpu_write_spsr_und(struct kvm_vcpu *vcpu, u64 val)
 		vcpu->arch.ctxt.spsr_und = val;
 }
 
+static unsigned long compute_exlock(struct kvm_vcpu *vcpu,
+				    unsigned long mode,
+				    unsigned long target_mode)
+{
+	u64 gcscr;
+
+	if (!kvm_has_gcs(kern_hyp_va(vcpu->kvm)))
+		return 0;
+
+	/* GCS can't be enabled for 32 bit */
+	if (mode & PSR_MODE32_BIT)
+		return 0;
+
+	/* When taking an exception to a higher EL EXLOCK is cleared. */
+	if ((mode | PSR_MODE_THREAD_BIT) != target_mode)
+		return 0;
+
+	/*
+	 * When taking an exception to the same EL EXLOCK is set to
+	 * the effective value of GCSR_ELx.EXLOCKEN.
+	 */
+	if (is_hyp_ctxt(vcpu))
+		gcscr = __vcpu_read_sys_reg(vcpu, GCSCR_EL2);
+	else
+		gcscr = __vcpu_read_sys_reg(vcpu, GCSCR_EL1);
+
+	if (gcscr & GCSCR_ELx_EXLOCKEN)
+		return PSR_EXLOCK_BIT;
+
+	return 0;
+}
+
 /*
  * This performs the exception entry at a given EL (@target_mode), stashing PC
  * and PSTATE into ELR and SPSR respectively, and compute the new PC/PSTATE.
@@ -154,6 +186,11 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 	// PSTATE.BTYPE is set to zero upon any exception to AArch64
 	// See ARM DDI 0487E.a, pages D1-2293 to D1-2294.
 
+	// PSTATE.EXLOCK is set to 0 upon any exception to a higher
+	// EL, or to GCSCR_ELx.EXLOCKEN for an exception to the same
+	// exception level.  See ARM DDI 0487 R_WTXBY.
+	new |= compute_exlock(vcpu, mode, target_mode);
+
 	new |= PSR_D_BIT;
 	new |= PSR_A_BIT;
 	new |= PSR_I_BIT;

-- 
2.47.3


