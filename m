Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D65E6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7PeXkSAyf/7Um+qmruhKgBIwD0MtvF3gzzOGc0x0Fs=; b=E01OaenUs9VEiBeVBWIMNcMbd5
	Mb/nBM/MRkPFw2tDN6lNVbfgl0UxFZaVhgoxS5D99BzN6XujkjJpl54EIzggkXscVPtXPYnkJ+EbF
	UdA/Y5InaWXHBtxLwwgGsadfr169QPNgyO9LkX8q63sOdWmNa0tIrENCDvcbI7UktC2imhcoit6l9
	dQDQ2Fg2/g1E3+UckChC4uupDC4wY16pg5iFyL4LuXY1smt+B+335emQfl8AD0xR7Owxhy/0ye/6I
	e5PO2eCLo0TRPbEiaU3lEiKZZ5P/hCIqgo9T85E4TiN4MXF5jKpcoRT6VfohhTeMke8U/8sVhG2nr
	22WFKjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr6A-0000000ELRE-3j3u;
	Tue, 23 Dec 2025 01:22:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr68-0000000ELPo-4AqI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99C8E444D5;
	Tue, 23 Dec 2025 01:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F732C116C6;
	Tue, 23 Dec 2025 01:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452920;
	bh=UcBGRJk70S1Rv85qJDISL95VGW1CnVltxuNnSLnZae0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E7yyC4qqfA7Z/4QdPyqc7ZrKTGJdfcJg7FhYx0nX+gXWVxuFH++5TPGZzO/caQQfS
	 XpLaLH8tmJPz9Ddfp7pwSc1+xeNTqSTx4p28gRsfnty3yeuvx+Zt0cg/CBU4NkR3TC
	 7gMvAcvzUXVM+NIXZxAerxOFplv/QLMDfTEbqI+8gUq6Cf8orGZ39ZwMk5OMbO5N8Z
	 DQW5VGoVAHRtIOwCs+O1UvDf1bLodi0QHCTWbzl3zvNYLlF1Azmnd553GKsZs+m/IX
	 kZ+Ru92Qgyf5BSZHVqgSOxK1w2kg+3//gUL9SQyB5DTvnu7olYffbXVL3iuv0mpfIR
	 zFExHmJoqy3lQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:00 +0000
Subject: [PATCH v9 06/30] KVM: arm64: Pay attention to FFR parameter in SVE
 save and load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-6-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
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
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UcBGRJk70S1Rv85qJDISL95VGW1CnVltxuNnSLnZae0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6HE2lIx24yhrPMc49cAVdCIj5v6Ca+PxFJM
 DBjjjoyPl+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnuhwAKCRAk1otyXVSH
 0Km/B/9mi3IncLDznTqdkw6oHxNbhh/TkoU+szJI5TxJTKBu3cBLsGpmJdyK9E/Hk6ANuJCKcWY
 plu/p0/6f7/RgAPiCSYPu/dlC0s4OQ3XXlOedkB8NxCDFm/xyXGwD8XEiIY6hWF0hgNM/a7szsy
 fSCoTxt13+AZ54LGpyUU3dx583VmGJ2xux79Ozu1oUXf9lpVFvjNFsoxE1XYOF0Sa4gL5aAowdt
 itKE2Fw1RQ7XhGu9ELQ1TXGqyj9DR6zdiASflllMsKVPL2BS6IQDaVUruEi8FPMjqeAyUDlfWfb
 xtBPrZvvOp7Q8rX+rReGQtOmMIEgyeczAaL/tzrHYjHUdEjf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_172201_083571_E631704A 
X-CRM114-Status: UNSURE (   8.97  )
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
2.47.3


