Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9A5CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmB/pg19xY4DdHaYP3bkXo+lI0qdolVjTIN2vrF01Hc=; b=MW9uvjHH/00Pnao+6fQAeEqyFG
	lcixjBelTw/8UBGAs3YnhMC46tjeVYri5FmIQHwYdo334Hkfmcn7RI/+gfNJmQI67NBxi0FOYIudu
	L5rLM/VscabOD15JnerkTarkRRZPpWG3M8MNezKieduwoE7+SOCQCUh6XH/LTRTXIihJOhcEBn4MW
	Fi5jvw476Y73X0PSRj7n+h0g4izchhO89wMNyrCBeyXCAKfy0iqYotVGkhrnkgZ5dvIZ+HJ/VfiQZ
	Tp2XViSyRjbBCa1rd2DRWFlF6iz3jbJdD99MVo1aiIToPTa4kCbaqaHdTLdRqoaRE1xyA36xBU519
	xLYN43rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjQz-0000000Eswo-3s9e;
	Wed, 03 Jun 2026 11:06:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjQx-0000000Esuh-12kn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:06:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3C4549E3;
	Wed,  3 Jun 2026 04:06:45 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE8173F86F;
	Wed,  3 Jun 2026 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484810; bh=W6P26d/kErOA0izTtTGBCaL/vzda5y7B9/4LMfwwkUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qpvjIdOAwV2/6Bb1QsDvVYa/Sr6kMhS3bVzVfOXpRRVDleA4ASaIKaMGWSjFG4qkM
	 9WX5n11YA14VbGJWc8cFLfcRPKH4q4JuFVqtg57BqcjyNWd9bjFWK94vUdi0qWqNTa
	 VqO4243r9kiFe1fBmQMgehlYF9l/zK1JXeV4Lyr4=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 04/20] KVM: arm64: Don't override FFR save/restore argument
Date: Wed,  3 Jun 2026 12:06:14 +0100
Message-Id: <20260603110630.1027435-5-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040651_399373_044758F0 
X-CRM114-Status: GOOD (  14.13  )
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

The __sve_save_state() and __sve_restore_state() functions take a
parameter describing whether to save/restore the FFR, but both functions
silently override this with '1'. This has always been benign (and
callers have all passed 'true' since the parameter was introduced), but
clearly this is not intentional.

Historically, the functions always saved/restored the FFR, and there was
no parameter to control this.

In v5.16, the sve_save and sve_load assembly macros used by
__sve_save_state() and __sve_restore_state() were changed to make
saving/restoring FFR optional. The implementations of __sve_save_state()
and __sve_restore_state() were changed to pass '1' to their respective
macros, and the prototypes of __sve_save_state() and
__sve_restore_state() were unchanged. See commit:

  9f5848665788 ("arm64/sve: Make access to FFR optional")

In v6.10, the prototypes of __sve_save_state() and __sve_restore_state()
were changed to add 'save_ffr' and 'restore_ffr' parameters
respectively, but the implementations were not changed to stop passing 1
to their respective macros. All callers were changed to pass 'true' to
__sve_save_state() and __sve_restore_state(). See commit:

  45f4ea9bcfe9 ("KVM: arm64: Fix prototype for __sve_save_state/__sve_restore_state")

This is all benign, but clearly unintentional, and it gets in the way of
cleaning up the FPSIMD/SVE/SME code. Remove the unnecessary overriding.

The 'save_ffr' and 'restore_ffr' parameters are 32-bit ints, and per the
AAPCS64 parameter passing rules, the upper 32 bits of the register
holding these arguments might contain arbitrary values. Thus it is
necessary to pass 'w2' rather than 'x2' to the sve_load and save_save
macros, such that the upper 32 bits are ignored when deciding whether to
save/restore the FFR.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/fpsimd.S | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
index e950875e31cee..30507c50942eb 100644
--- a/arch/arm64/kvm/hyp/fpsimd.S
+++ b/arch/arm64/kvm/hyp/fpsimd.S
@@ -21,13 +21,11 @@ SYM_FUNC_START(__fpsimd_restore_state)
 SYM_FUNC_END(__fpsimd_restore_state)
 
 SYM_FUNC_START(__sve_restore_state)
-	mov	x2, #1
-	sve_load 0, x1, x2, 3
+	sve_load 0, x1, w2, 3
 	ret
 SYM_FUNC_END(__sve_restore_state)
 
 SYM_FUNC_START(__sve_save_state)
-	mov	x2, #1
-	sve_save 0, x1, x2, 3
+	sve_save 0, x1, w2, 3
 	ret
 SYM_FUNC_END(__sve_save_state)
-- 
2.30.2


