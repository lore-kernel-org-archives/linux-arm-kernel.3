Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D680C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuPam/iehf72m5aGBmzfmGaMC0fjEQsbS6N65lW9NgY=; b=MCMd+J+gt4P8qpe1gvsdFHUFfT
	GW1SHI4ZYk7htgqCWdBzH+1T9UiLQ6+bYQp14W9v13bnF6QJsOP02M8lt+Ln2QWcR3VdnCgTQbff+
	SVdToorE1pzoUWVtOlMAsqH8Xl0EadDqY7OJTavvv7KFDk6ER6rCBv3SIwTvPtmPFRYVNBvFZxJkr
	oKTGu8o7KBopuATc8LTvyR1VYp3Y1TSKCeraLVQZiIdXevzvju2ryrcslxCGiBZXbPcwidpuvXnEk
	dN0qZwdnwNqcnao14F0uBePSm4W6P6aKvIowH1Y7GpuDXVvXt7CeqWDfxH2HvQD3gJNN3FyPOe1bN
	rzR+2qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSaM-00000009DFd-2KXI;
	Wed, 25 Jun 2025 16:02:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOGh-00000008T1D-2pvn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0537EA522FD;
	Wed, 25 Jun 2025 11:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A962C4CEEF;
	Wed, 25 Jun 2025 11:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850778;
	bh=WD7Qdl+8RLPaAAK0jVM2Hhe8rXkw7WP2aSYuPJ67M/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EzRDGd80v1T245DORt+m7lyT/phx2cMHa6Bmx3wSaBUv807/ZAbWRHNjVD0PV9rss
	 p0R+INLGwxcn5rgLMXiLMMG9tZx/z+fdW30XVXgUnpETuj7kqu8olCzWZtlivzvSeD
	 8AHxwSJG6nnRxGmnIuLs1OZN2qOtOgIKvztoWSS3yKD1a0FgIVprLTkXOrEb74mg2V
	 Sg9beXfaT2OQpWNforpr7JzNDggWasBEoweuoMzswUkxjpLGCx1MsAG0yA/uc1IG9U
	 8QJsytPThyQYE1ymwEaOpwd1b3H2j8WFPyC1zeivKGLe9MeZQYfc4+QVL3ECLCWD/r
	 R3rw1u07jJpQA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:48:16 +0100
Subject: [PATCH v6 25/28] KVM: arm64: Expose SME to nested guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-25-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
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
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WD7Qdl+8RLPaAAK0jVM2Hhe8rXkw7WP2aSYuPJ67M/g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9x4iTmgZQfqDlvOFBXIQoOeOfmXAs97MM384
 e38IEaxSD6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvceAAKCRAk1otyXVSH
 0I+rB/90XLlA//CNIkOF15gb5lFWd9Gk5kUpa6TKktgykbrMG3194zYAKMl6f1qOP628gc1tIHx
 w1BsKTfiukZB3i2iPdTWjpc3UkK4qfQIpMNmje1Ksse+lVQC7tL0x2gN5hRGao9w6C0m+tKwMOB
 9Rv0Ij6RJdbNWxaHQBjX7Q3BKaqdP9nMNAFinfRJr1nMyV3NRrTzTtUFa83R39+tdw6azfSCO+U
 qYiVuJ3porNhbLVq03b8Sj7vLVpzrX4gVyHxD/sB8w6OdT3ARonMKxWrlO6FYsQuC936U2gE2wm
 BMElLujtN0Fay6KKAkR+gHcDPGsUExmWmY4lUcmya2IIJ2q4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_042621_932652_040E57B7 
X-CRM114-Status: GOOD (  11.34  )
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

With support for context switching SME state in place allow access to SME
in nested guests.

The SME floating point state is handled along with all the other floating
point state, SME specific floating point exceptions are directed into the
same handlers as other floating point exceptions with NV specific handling
for the vector lengths already in place.

TPIDR2_EL0 is context switched along with the other TPIDRs as part of the
main guest register context switch.

SME priority support is currently masked from all guests including nested
ones.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/nested.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 5b191f4dc566..9a03439dab90 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1442,9 +1442,10 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64PFR1_EL1:
-		/* Only support BTI, SSBS, CSV2_frac */
+		/* Only support BTI, SSBS, SME, CSV2_frac */
 		val &= (ID_AA64PFR1_EL1_BT	|
 			ID_AA64PFR1_EL1_SSBS	|
+			ID_AA64PFR1_EL1_SME	|
 			ID_AA64PFR1_EL1_CSV2_frac);
 		break;
 

-- 
2.39.5


