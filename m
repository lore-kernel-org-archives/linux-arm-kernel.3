Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74B3D3C928
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 17:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLFiJTr/PkVr7rHKO2KwNJ/IBM0wSXjgLNXeCzLoIec=; b=X/NbaaRyDCuGhm0p6D+QJL69Qr
	B23aOnnY7rZ/k5+y79n4S1F9oQJ1oqXc0jT1uyO1uysobLSsAZAfggVkJya6QUMwl+M58HNMxzoWK
	A2q470dnyOMIVPVjnKB2QhIqyFirwArUCI5GNqc8zgTvq4xVUFda9LenBNeTBgFn1+v2AOz2DmH+D
	0/mDVE7Uc/FGV3XNCz4QZDW2Fg+UQ+z9RPPVZY4y9VKKTFn9y2gqj2/Xqv0kla793wGFnr5+2btSg
	7VA0kh8cszGLKIK2UEnG4Adx34r2IHoHUE6WcRICB1NGO+bZE5FCB+JY3FkyEOzVUVQmJKBP+GLHa
	yPHsZ77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1P-0000000FhHx-3Sml;
	Wed, 10 Dec 2025 17:30:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1J-0000000FhDv-34gZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 17:30:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFA71443F2;
	Wed, 10 Dec 2025 17:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EE8C19421;
	Wed, 10 Dec 2025 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765387832;
	bh=J8YgpBDKoIkE30i8e29RJl8Adbc8Y+aT9MBBTzbD6IU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sSOo5WP6UKC9vcbq2TY4ukoOt5KHxAYPAv6WNjyJCfIP8kSQPVRYrH0hofInGlZrf
	 7/agm4ByI8aRY/ll+k7QHdWJuzHTXTXfF0w1COYNLfZhT/T7UU5/JccB58vqIhu5cI
	 EtkyaHuVy2ng0vKa1C6XjnZZiZ4EpkySeeY7dx0l+6E8GR7lNhBm56zsSDYPohseTB
	 JgyIJy69gA6m3MAEJuTrkDHc59znOoKvRPMMt/XuTovu+C0fSPhSQt7m+xJWiokghi
	 6PZkR5M0crLR17EEc7etzCiuwcqrNTzj5Xs3R8fLldQMyHHoa4foKRLfi2VqBt0A4L
	 d2vekAW3SyUag==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTO1G-0000000BnnB-34Gm;
	Wed, 10 Dec 2025 17:30:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: [PATCH v2 2/6] arm64: Convert ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2 to UnsignedEnum
Date: Wed, 10 Dec 2025 17:30:20 +0000
Message-ID: <20251210173024.561160-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210173024.561160-1-maz@kernel.org>
References: <20251210173024.561160-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, alexandru.elisei@arm.com, Sascha.Bischoff@arm.com, qperret@google.com, tabba@google.com, sebastianene@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_093033_794997_6D1CAB24 
X-CRM114-Status: GOOD (  10.22  )
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

ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2 are currently represented as unordered
enumerations. However, the architecture treats them as Unsigned,
as hinted to by the MRS data:

(FEAT_S2TGran4K <=> (((UInt(ID_AA64MMFR0_EL1.TGran4_2) == 0) &&
		       FEAT_TGran4K) ||
		     (UInt(ID_AA64MMFR0_EL1.TGran4_2) >= 2))))

and similar descriptions exist for 16 and 64k.

This is also confirmed by D24.1.3.3 ("Alternative ID scheme used for
ID_AA64MMFR0_EL1 stage 2 granule sizes") in the L.b revision of
the ARM ARM.

Turn these fields into UnsignedEnum so that we can use the above
description more or less literally.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1c6cdf9d54bba..9d388f87d9a13 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2098,18 +2098,18 @@ UnsignedEnum	47:44	EXS
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Enum	43:40	TGRAN4_2
+UnsignedEnum	43:40	TGRAN4_2
 	0b0000	TGRAN4
 	0b0001	NI
 	0b0010	IMP
 	0b0011	52_BIT
 EndEnum
-Enum	39:36	TGRAN64_2
+UnsignedEnum	39:36	TGRAN64_2
 	0b0000	TGRAN64
 	0b0001	NI
 	0b0010	IMP
 EndEnum
-Enum	35:32	TGRAN16_2
+UnsignedEnum	35:32	TGRAN16_2
 	0b0000	TGRAN16
 	0b0001	NI
 	0b0010	IMP
-- 
2.47.3


