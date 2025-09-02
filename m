Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7556DCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTOnYZFLkfdWX5mXxYaZWrKAd2btjaQEGUSqE21aWz0=; b=QfQbz4uhgKfZCRYgsAK7mL2bCf
	0Eu6MFqCfhmRp/PRtetDhJso+TDM+75n9V+9gIiUce5yKT9BYWuLjAzQVxuwrGEc5qCjGJmZ+Vjap
	0e0W86mwb19s/pVy4MqpkHg/wjUmkjvNI3Fl5+Fa6eXlQPlMdwtdoR4sSzyhsy17RbXkrdQ+khJvF
	8cpBgOaFsQG/Zw99aNxlwXjhiC4ztUibVMBxrTKVnbI8UCmeWOF/cAf+3rbvP8fw6lJnZipARW2hl
	nkQZufbDwt0fKe0wzgdSnr2PaC2fIkWWMlOUYgI574X25S0Nv0eXg6/+Cf0VyMWLD1h1zWTTEVqj7
	H8IMCqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRyP-00000000LeN-2Vqp;
	Tue, 02 Sep 2025 14:27:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPSq-0000000GzQI-2Veq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:46:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A20143E87;
	Tue,  2 Sep 2025 11:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBF7C4CEF7;
	Tue,  2 Sep 2025 11:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813576;
	bh=ApIjPu6tr41pN88JrHKurRe18MYIB0RS0vVGxBjI5iI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y3U/VCcTyDJrfmX5N1I3ma4BNaMP6NnjIsplzE8qqNmwu2XCxAwPUL27++y15kkKf
	 BmsUHdrWff0+p/dch1o3gGe+npIHUciHViJNy5RewFkc2eTGS73eT+87n5zjbvIgHL
	 +d/B7S5l1MZcDikktnMIhVP+ZZp6Y4hPurHVL61m5+8pDKMhvsge7DALAiAvF3xK2R
	 hBLIVSVdNSk1LVU8EuI/NB2BwDVEi1MCNj6EHElJ3Gcj8x0FhilbvHTC5mIfcYCzey
	 OoVIK7Ua1fA02entp4HnJ4vr9YmZ2mJGEjIFto/pZJ13T/znl9czAGX9fYee9/n676
	 1bhOcFyHloFpw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:29 +0100
Subject: [PATCH v8 26/29] KVM: arm64: Expose SME to nested guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-26-2cb2199c656c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ApIjPu6tr41pN88JrHKurRe18MYIB0RS0vVGxBjI5iI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBottiOkZba4yI6s4kTrmrdeDhrz3ok1FUW6bPBY
 q74Sa3+y/iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYjgAKCRAk1otyXVSH
 0B0eB/4yoHkWE2bYFaQkDOX1dyrxupmFWVwQPQqDQ5u01j8CCEG7HlTowkwPc+l3bqfDugrPdSs
 ZXSIAHLlcppfcijjwVmDKC6HpLNxG0f6rNy9DoxM6eHanWIjJaLs5yEqk5pmIjALIdPSxy5YnFL
 7Owmj00+UDfilbqgmg1xdquA/jc0f9GICTfWllO8jkhzkQ9c8RgG9IKIGmV2InLCvYof3+ws3el
 ICGQ2kZL2svSg4O2ryDcK2wiottcvFbIIVqEGwrrARywl16wkp8mSHgNvJoETdt5ZfF2N615sry
 knnXAMcPzDGKO8TnyWmDB2E891gSf86fdlPcyRkiV7wt8SbY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_044616_660501_F89F8A25 
X-CRM114-Status: GOOD (  11.58  )
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
index 153b3e11b115..804694f2dc9a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1458,9 +1458,10 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
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


