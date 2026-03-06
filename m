Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991CBFCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVsjeQ72a1jvhPSbomjcwina6QXCghsVbxWH+pcqOtA=; b=HmP+4sctIRYzsppcAw8NWFcdS0
	8ygYQLEYUR7uPYjrsBKuRlp2nPgxNovPwf7MbXEHibD2YAhkj0NyLon+akLVxWlqhe1paSX80NEd0
	rUWOssNqc37VEsPN2T7L5z0qbKXlxO3aYr5i0j3sBNLMksEFPGXFE0K48YdIwvR8iBBFY5+TR3uu0
	h/B1/qIcFv362+yjABLV1OB450xQQDj4qoveyPqYAuxxlIf84rVX+Yr+PxBtSHgkaicVGPRQyp3iu
	fXjIKVkmkJcy6T/qtt0I3IvBIYKXH4+9J5U7cs3PiyLquBUsWrFY+DNzIt/gcEFHpZu+JSG46M3Xb
	CnoyQlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhs-00000004EK5-20tY;
	Fri, 06 Mar 2026 17:11:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYho-00000004EEB-0zlX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:11:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED3194083F;
	Fri,  6 Mar 2026 17:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE467C4CEF7;
	Fri,  6 Mar 2026 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817075;
	bh=9AoDP1H4yvRJIEhTi6n9tn6RUHS9VgzCYqCyyE7TlDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U9eXInAq6PsnJKF4xNWxt6HMYo7q/Ik/qmUHsWJc5gdGs5DmM2lDRmBzFbKU+97LK
	 PYmTWkZzqMPW6rHVeYbOwOV4yonZzgBKZBOxz6wi+nUL2EKnle4L7P4/mg1AhsMx25
	 xIvpDRdjtZ4xWTOMIiFqCyygM0KXBeQJLo84NbvJ4IFrqxTRW76bT/SPyg6P+s2MT1
	 BwA+tY/0PBQqWiikpb7WZRM7pFbwg8BsD3WQHOEEz0IIgIeI8BiYcgj8SmU8jm+FLF
	 AI5xAz8ix1CnhxZHCbjxC1Dk4XEjHM7h/d+0tWXjrCqHXUqcp1pN1cYTU6S/9Yz3zY
	 xrI6L67qRsE+w==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:17 +0000
Subject: [PATCH v10 25/30] KVM: arm64: Expose SME to nested guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-25-43f7683a0fb7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9AoDP1H4yvRJIEhTi6n9tn6RUHS9VgzCYqCyyE7TlDQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwo8SGPszNhvztYIvDOCtpWiaiaB+98YQbEDr
 eOW1XPeuIiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKPAAKCRAk1otyXVSH
 0GWxB/9Cu9zVjHVSP0M7G5dJXH/040q4ZjiItij2oocAWBOf4nwWUab+WPXOw32G6SHWIOX8Bkx
 elPX0VunIxTX2TMNP15U5YU+GNdWbG9x9t/hjnQ75Z1jJCOqxc/uixUjGipKDOkrVV7gFAeATv3
 T07TBZRm+SCJs9uUt4HC6DyQ3jZE0CXGBhBf96xL+TAdO5FRTkw+ZSvT0diWnYc32y0DLPciKGG
 nMN10SjIlTd292CD3GLuAEsPdyiGNjzQ4+fc8Rqct/JQL/bFF6mPRPhW/zXZcLwYSNH/EIfd6hL
 /8cBWedrr9rAa7eRWv12ECW5wdSfZ+67R0HqU5MKPCvO77HS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_091116_349076_A0A2192A 
X-CRM114-Status: GOOD (  10.46  )
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

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/nested.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 12c9f6e8dfda..a46002004988 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1540,14 +1540,13 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		break;
 
 	case SYS_ID_AA64PFR1_EL1:
-		/* Only support BTI, SSBS, CSV2_frac */
+		/* Only support BTI, SME, SSBS, CSV2_frac */
 		val &= ~(ID_AA64PFR1_EL1_PFAR		|
 			 ID_AA64PFR1_EL1_MTEX		|
 			 ID_AA64PFR1_EL1_THE		|
 			 ID_AA64PFR1_EL1_GCS		|
 			 ID_AA64PFR1_EL1_MTE_frac	|
 			 ID_AA64PFR1_EL1_NMI		|
-			 ID_AA64PFR1_EL1_SME		|
 			 ID_AA64PFR1_EL1_RES0		|
 			 ID_AA64PFR1_EL1_MPAM_frac	|
 			 ID_AA64PFR1_EL1_MTE);

-- 
2.47.3


