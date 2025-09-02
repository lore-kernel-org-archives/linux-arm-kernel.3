Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D20CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+gx5ZNCMsuG+9EZ8S5YZHwkusVOhHhpz+xIEdXsfkY=; b=Ij2f8WqQ+ybx4r/9ZDIByQlGYU
	Sn3O27C17znePH1bhyD2PKgOxqlWDU8JjxNWCyPWLQjozysafKseqvSqHzNag+M9+GFxt2zBmQsKK
	AquAmE8htzMUWiMHjfI158Rwhas5gjOdG7mHV8hPh1KMORBaq21PUzpFZ9NtGG9X8OYkKRp5g24Ow
	fparNUWXYcm6+Sw5iPafRvMzBdiuhL7Zri+7SXTFmx44Ga28aozN2qLWwiZ+TW+W2gZXIvepR3Kqy
	D7GWbk/R2lMTwGhl456pf43wOkHoGaaokLZ2+0zQWRBa2cpnJoq5ucyplI/pPf2j4+4Jn+STZ/JLL
	D6qRwa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utR5b-000000003do-1pIO;
	Tue, 02 Sep 2025 13:30:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPRT-0000000GykR-28Xo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:44:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E78DB60210;
	Tue,  2 Sep 2025 11:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D16C4CEED;
	Tue,  2 Sep 2025 11:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813490;
	bh=LDt1xNEXDV4dCIkz7nCmkUUILCzxDoXGLDJ0dFTAhvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=McaPTu/3nEsNP8++iWdFRglKCDsQdyR+NL93ZI4OrRVu2Q9xUK+u2VvR5p/3Z37f4
	 3vU/tgooF3fpSsDozPJhilz1IA0RdIWBePkbYvwUfd8WlWFX11pj8ZibuLecwLQJg9
	 8ZAVJNt+qGBDsKfQQ3RXYJ1lZeuMwrnQRDRmeopYzLPHmrr0lwlPTN6iwg+FsQ9t9g
	 Pz1Pis4LoJXlxAVknm4hVi/zYTcw5qmEOJzBmyHWCPTeYcCThgFzTEVyYxwt6/pdCe
	 lzsbrB5g3BGFSYDFIRSHUXO+7IojOPZ5+Mx8/AqHMCrq356OAMfMEoCzhpQc+6a0vQ
	 mwmif7Fgre9PA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:10 +0100
Subject: [PATCH v8 07/29] KVM: arm64: Pay attention to FFR parameter in SVE
 save and load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-7-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LDt1xNEXDV4dCIkz7nCmkUUILCzxDoXGLDJ0dFTAhvY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBotth/9YhjtgkxhNW/f037K41pEV8WSI0IuBOzW
 PYA2fg7tr2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYfwAKCRAk1otyXVSH
 0HWuB/4/sgZvXMFiO8HnjLPW/KnLnt7j3M2mbyq6B6N2WFGNoUMmKbnOpewTSJK3AebyJsxuZRz
 BQk0Yeskp7W3e70mCa/gkCkc2WToJKwGF+jI+XyLQyJ7AqybIfI4T8RVr+ZBUqSpiZrSJq7jagD
 m0Vtrne+Prso7Qr/nHlKBxL0z4G2kgleznHl2E3zJeyNTkaV4ZH8c6h34Y1zGY2tSbycgVlazU8
 AOgwzTIRRn+wbLrlOigGn+24TNsfWm3e6BbiE2ql3JvCGvA2g3A33zQuikym6t7lVt/tItParw2
 PB+F05oat9VglRwcHIlD582ek3of50kZnirNTxo/rpgagrUD
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


