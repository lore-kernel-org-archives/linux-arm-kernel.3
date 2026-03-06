Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9307AFCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kia3GIJLwSF9tt5Zt4vjAHz1El8pTggl0qTJzNBPqHg=; b=TE9AKoYaWMvVxbBGhLoUiawUu1
	rfStY/2YXBu9OqLu6T0E1RyKtdMGgGcZ1bqQqwr/6DtpfyzeQYKA2vUpLzM9BC58dN4KpMnWd0M6A
	CMnKXHDPATXAm61Ju4u++R8dKjckmtKijfTvMdbAFFnKNrBhqDldtyscH6xyUxHoeRcNOO8aeN6sJ
	m1YjdXNNklg2e4j60U+xhFd861SqO5gem2sN3KYK1xQeRAHYop9wiagBQDnwAT0FVgNdnYLrDfUw7
	ft9vFFU0icbBhyZsmdNEPEZKAgt48QIoUjJh0VmrAWmLQ9Zx6nqg8C40IOnrnFu3U39nXiSFvKVBc
	AoYgCtZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgQ-00000004CnK-35A6;
	Fri, 06 Mar 2026 17:09:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgO-00000004Ckv-0ivE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9758B60018;
	Fri,  6 Mar 2026 17:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F587C2BC86;
	Fri,  6 Mar 2026 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772816987;
	bh=G+7uwco+cJxxYiPrDD2VSLQyEnMR+uK7i7CR96riimI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KLSmqjF3zu/Hq+cmUv/6o3saOiwTxdRmNIX5mEX0yS+E8nQem2rqUvQjUFcRRo4Dc
	 /c3Fl12ugWO0CrUDJFBT1uCHOCZu36EEGSUtfJVqH41hmBq/pkTgYEKLbxhZDCVEVQ
	 Ni0ZNACJpPsYUpDaWjeuJXyMk2fDrUff8Wv4JxmYMLxSkrgVEEW50P7T8gmUo26BDb
	 HWBcQMLaLbs26PboNYY+hcDQ7wT0JNJ0u+pMlCPP0OmCs3FQkxkWpKZajoha9HwD6X
	 wBT1dnVV3lL3NoAmrcWqbmWigzaENpGSCxzaWpoZsIEyLgoUBVAn6Wwa/huY72dR7Z
	 x2m4Y0riGtK1Q==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:00:57 +0000
Subject: [PATCH v10 05/30] KVM: arm64: Pay attention to FFR parameter in
 SVE save and load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-5-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=broonie@kernel.org;
 h=from:subject:message-id; bh=G+7uwco+cJxxYiPrDD2VSLQyEnMR+uK7i7CR96riimI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwosR2hPZbMXVk/Ddq+Vv8nfNrmuk16HWkT3n
 gdWq0P4Cz2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKLAAKCRAk1otyXVSH
 0HcMB/4qfwyGeSaC48mPdYWl/NRMAL9TBWIkgLGfmprEZMugcBQr/IZzXfSgjje6tzteESpv2xZ
 5rb6hifu0/CSMQSY55uyRk+qSxThb/mAkfYdY9WwtTLrB6dCF0x7loc+8Htr7setZEy6ffMeiX9
 KvcEhG/CKZOJlobmuKPq0rwDKA8zQ7y2IFxlxB5GqWDvwZZvTpdrNuWYo3E5ytMXjjy8fnA2daJ
 CJ/hJpLidcZHZCxrI8EkxSfX6y6HwAMwf1akh2ljY/G6AY1E+pRNAAjHMEs3beyBn76/rvMJx/+
 JEgC8hzcC8U0AUHiGXBPwQEBWI/xSv9AlucE3qDGJ624i02l
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

The hypervisor copies of the SVE save and load functions are prototyped
with third arguments specifying FFR should be accessed but the assembly
functions overwrite whatever is supplied to unconditionally access FFR.
Remove this and use the supplied parameter.

This has no effect currently since FFR is always present for SVE but will
be important for SME.

Reviewed-by: Fuad Tabba <tabba@google.com>
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
2.47.3


