Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83637C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 00:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+gx5ZNCMsuG+9EZ8S5YZHwkusVOhHhpz+xIEdXsfkY=; b=YJ5INQ3UExL6SqfDFw1Tg0em8E
	NYElKrmM14KIashZjMM2XgTSLWnKdPPIOLdIaHgGoYbwEbPg5cCgjNaYRMpmNnuodymzh/Fbo01pr
	hyueW4Jwxmw10DK9WH6mzu7o6PllhPuDyqtB8L6VSrIoV7QMgDQNdenDooT3r39Ua+wz80haACA5w
	yqm91IyMY5Dsrnp5yjTqRqTeOz10K3Yld1tXa8ZSfMagqbaVyJCpw4dBNdkjCu+Tl74hTbHp2s/k+
	PGzsUlC3zOTnA13tGLKsRmTEARlouoF0tXPOE0HGy9Q0OP5L9VMKetYgxB8vMP/1xvo0MuTBf1Ag5
	O3KdfOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5DHu-0000000BKsr-42Ua;
	Thu, 17 Apr 2025 00:39:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D4x-0000000BGpN-2yF5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51E0E49D6A;
	Thu, 17 Apr 2025 00:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1515FC4CEEC;
	Thu, 17 Apr 2025 00:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849567;
	bh=LDt1xNEXDV4dCIkz7nCmkUUILCzxDoXGLDJ0dFTAhvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MdkO4f4JPRZABY1VGe30ZeGWmuZSaFtFjbPoiZ2JKwQKtrVsYYf+i/22bM/C+txQ3
	 VSO+h2w4M6PFbTJ4jJuGtA7NKmb8GQRy7fxoJvXqI8F5gsZeaih/Epir+BBRnVNxBo
	 Hp6hUzdsIkOFIYJJjEeNVg0Ql1sx2Oy53Ymcnb6a6tGeil1b4Pi1WKRP/FZ4z5qFjp
	 7pPdS6TOxmVCSVTUHyU5tp+Ms+5+l1+metEEhiXl3x0QMVo21vdWGqnJXgEGOtZg0d
	 h1BI2SPu6XavqVmm4LMiapysyCFBTz7B07OxOsVm+98XmHHC0kdhlDlBI4XpxPHEa9
	 dllqrRyHfmcCg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:10 +0100
Subject: [PATCH v5 06/28] KVM: arm64: Pay attention to FFR parameter in SVE
 save and load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-6-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LDt1xNEXDV4dCIkz7nCmkUUILCzxDoXGLDJ0dFTAhvY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEpzpbQUMEswprMpZyLy/JHBOf6XVtUUczmdbGV3
 75K2OBWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKcwAKCRAk1otyXVSH0HsWB/
 4sQSXEfCj864idBPTgxT0QVL16QLKlb2tYjFR+g2STcCPnwZtZV1LFwSJbC+OJ0RtkpxlsRUsy5QJJ
 WFPpm0J4Sg7vjD8aAwkFrjupW6IXioTIpwT6iNqrgVv0t5lhHq3QaUTweKPMNmhngcGpVQH7Tv0xKz
 CM3CmFatHvmNWXBNDUCzW3RfToFWgv6sydXRsYGZ4pXT2SPKc37OCJH0gKrmd/5pnCPhIQfFwzhDka
 7wGg10+QjYKhwRxgJFm0McV6OSvvX2EegeLpZ3m8rJqinM817Vh56PEVx8wjGXJot2vVqsPOckFYjU
 MGfk8dfjxwzkIRO5X1aN0LPGTEUO5v
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172607_771295_8AD3A923 
X-CRM114-Status: UNSURE (   8.65  )
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

The hypervisor copies of the SVE save and load functions are prototyped
with third arguments specifying FFR should be accessed but the assembly
functions overwrite whatever is supplied to unconditionally access FFR.
Remove this and use the supplied parameter.

This has no effect currently since FFR is always present for SVE but will
be important for SME.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/fpsimd.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
index e950875e31ce..6e16cbfc5df2 100644
--- a/arch/arm64/kvm/hyp/fpsimd.S
+++ b/arch/arm64/kvm/hyp/fpsimd.S
@@ -21,13 +21,11 @@ SYM_FUNC_START(__fpsimd_restore_state)
 SYM_FUNC_END(__fpsimd_restore_state)
 
 SYM_FUNC_START(__sve_restore_state)
-	mov	x2, #1
 	sve_load 0, x1, x2, 3
 	ret
 SYM_FUNC_END(__sve_restore_state)
 
 SYM_FUNC_START(__sve_save_state)
-	mov	x2, #1
 	sve_save 0, x1, x2, 3
 	ret
 SYM_FUNC_END(__sve_save_state)

-- 
2.39.5


