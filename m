Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D51E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxXz3WpaThweh17qvEPd21YBcQt/rIWJNH8WCdo/zmI=; b=DJTdt3MjzbuwuNqyyqAhjO74Ds
	BN9+fO8b+68v6s0K8F943w5OoSUTdoHXjmMBAqTBgaiRIMkBcnRIEWxyE9LzJ24t4OSGPE0R1SpVj
	wUEJ/iTRErsLvVSZ/YbcyXFQeRrXhPkVLdUCXEaiKtvcNwuGaYDDrDb/pKb5rqp8p+D/koO8V+72n
	pHgQEZ97sorwtTYoG8SWssv2hrrul/nnWCFmIxS0xPGu2qyy9zcIPIxJkDyUxbWwynpcTtpLEd/0W
	D0irm9H8L755buV6QElc/+DnpsOiL192jB44yJKv1+7x65V16p5It8MNpMHYOnqmCJb7sDgKKlgO3
	hspb6s/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgc2-00000005bJ7-1smo;
	Fri, 20 Dec 2024 17:16:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgEX-00000005W57-3art
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5160D5C673D;
	Fri, 20 Dec 2024 16:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D48C4CED7;
	Fri, 20 Dec 2024 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713533;
	bh=ENOuC1TJcLemryiEjkWj2obhMQPzOqxnrV0P2mql+Ks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ssi8EUnVVNwfhRrHMmu+SM0Q4NnT9gMhK3MqiAI8pA6M0bBsb959zketSgp2K4CN5
	 JlpNGd3mV8s19GLNEdJ0aEOxoR/MILHM6yw4kfFVMnCkgoIbKEgdUlkM4Ifwp6IdEm
	 D3DW05Lwv9eapii3FYvUq84+RhtvBtmubKLBZoH1hYLZjI14TVC9BoNcfMYY2ng8Ae
	 B6zIJL1JjJ1in59kolXbEgkojFnZZhH4Eih9/LGrLfA3CdV5pciy0hR0RX/7FBMASt
	 YvWyq5ejgR4+RXyjYBys+gtLXfY8uW+wrm3etNfKMUzak/AT4qVMfvL7jaqXSxGGKD
	 eA2epJRg+O6Hg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:45 +0000
Subject: [PATCH RFC v3 20/27] KVM: arm64: Provide assembly for SME state
 restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-20-05b018c1ffeb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ENOuC1TJcLemryiEjkWj2obhMQPzOqxnrV0P2mql+Ks=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBk3E6dm3e3qW64VbwkZ8BsgUXtHAv6JoenG6H9
 ivnP0ZWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgZAAKCRAk1otyXVSH0BkOB/
 9pZK/XWcKBxIAbq8Kxz8iIvhPYuh/k36bbRLFCMarZ1Z5rPMkf8dntgyNKiUgIzPm6Uw+3qRbKIe5E
 Bm2brl/HNycaJBXjRtj5afSTrMoQDsvGkVtIs0I8duEJFnqCf43+XJ0apduhKJ6oaPiDBTJDnOcZTe
 ULQT9t7Hwlzm4FsjQuXTcdNoOnXcjEnlG8ng440HTikYzJLhmd6F5lBW/Ivx99Ke5XlM+MRrm3k9VZ
 ot6KxSdKkSj8wIFQr80TkHle48IdnsMkMSd2EBdOrTcrop+pK8XvZWc6CR5iq8aZcEi165we8JzTAp
 5tBTTH/jNzQnZA5FYD5EIyS0Nhtz5x
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_085213_988058_56BEC456 
X-CRM114-Status: UNSURE (   9.20  )
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
index e950875e31cee4df58d041519b7584356463c91b..9e4bce86ef2e632a6071480c06a0b7d69bf48f3d 100644
--- a/arch/arm64/kvm/hyp/fpsimd.S
+++ b/arch/arm64/kvm/hyp/fpsimd.S
@@ -31,3 +31,19 @@ SYM_FUNC_START(__sve_save_state)
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


