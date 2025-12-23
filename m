Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8BCE6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpMqQ3wvZj+ouJx1/JPyHZ6FJWqUDPHR5XJ9tjkRbIg=; b=GOMIuYu+oAA1U1w8YQdYgw8IgH
	WgTuf6EYnszh+vecz1/hkrs0AIX4+3ATIF6FAsk8ageVOBf8kV6GX9MwneZcyurFxD5mVmsIV0vgc
	Cetc0KJXatDOU5hf6Eyh7rMvVTSyXAWo+3vul2VTKUDoIfTVxPgY0iD+dNK63yiL77hi/bAsxhEmh
	caR4OkkWrzwuPLI2w+LUB9/cTJZmSLZBGsxE5LNPkj5FtGZN+4TSFHDw37lnDwa4h774mXN6+m3UE
	Ducd1caA8ql5glkgLdIoGxKlkArHSUi0L60Uy/RU/wF7ZW4tTETbBuBVwJfNuy7JlGgFFcJyqVZvT
	FwT7OzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7o-0000000EN3O-3ERN;
	Tue, 23 Dec 2025 01:23:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7T-0000000EMgG-33Oy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2943643F47;
	Tue, 23 Dec 2025 01:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E997C4CEF1;
	Tue, 23 Dec 2025 01:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766453003;
	bh=FzRi1bctv9rrqNEWwOJp3F+K+iFD0wwTwXRP36rhp+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OdctPKNJwOjWJ5tecGrza74VtWHJA9rrjCwOhN2FX4CdIo9tRikRy644wetxVooIN
	 IxOkRdl83h6vyyS401NfoF9BJGXc4LHcF2cIdR7OwPJOKDb9vjzS+WsXCW7zC+yp/b
	 hemm1WLXEpOfp2qa/Ww+RBfYFNVM70aWmqZ3E056kOqKWXvtAd6u9RbgjtC7wV3aR1
	 SLV6QBFuJ5owkYy8Mqr6cOv5j5OP1hsKqei9pm95vSiB908pvlkD48lgeEOgV3KJdQ
	 emF/QSPj6QoZAB4EkayZIKNkYwuIHcf0Z/83lALqupB9Lrew7oh2NnBKgsw/h5DCUQ
	 OnkhLeKZi411A==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:19 +0000
Subject: [PATCH v9 25/30] KVM: arm64: Expose SME to nested guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-25-8be3867cb883@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FzRi1bctv9rrqNEWwOJp3F+K+iFD0wwTwXRP36rhp+Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6Vf+MTqYjq4kXe4kbr9Zy9gweDKTkN/+6I+
 2AscH+hGPOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnulQAKCRAk1otyXVSH
 0K47B/46AKQNCiAhn5hTkguKHo5oVF1pbyCaBey9vSjyQIbzDbvhCfKZqmL6Sdu/DMwtf98exB1
 RD1+t4wd3yU5XYMsyE8z5/zhRYyKKnOpz97jMwjJwkZ1YS7TYLQ4WmUhvaSV+WkLPEJkbCsSXIi
 y59GMQwrVxyom7Wui2mpYgm2JkqomZOW10XLIPBi8G60NgFjH6q7LGsUDBe7lucid92uDTvCkGe
 bh5+0qgM2Bf0ecCA5VCfMKhgCY6yAj7SPuzOWWApXTABtJHLH7MPC/b6EWv6h9PpwbdWQy8YHTf
 ezKax5T3S18GNdYUmZZdkUApkD2VmxucgyzJ6bwLrmqesJhe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_172323_882785_2B5C5A13 
X-CRM114-Status: GOOD (  10.66  )
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
 arch/arm64/kvm/nested.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index cdeeb8f09e72..a0967ca8c61e 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1534,14 +1534,13 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
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


