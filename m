Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A238EC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rhpA3Cikvd4vVTg3XKNoFr5tc0hVr/qRtlX9bHqc8y8=; b=YB47lv9PKjYSQSG4eo1VPmWUX8
	7dHWEnqouBGgEqm+GWp05b0CSXHrCvM5VT4OeVW9Ue+VECa3x7IvGmYtYI6r19vhxLGcGd3Le/IoX
	vEmzAlx0IE4qMIAhP8mgE7lju9LvIZlPq9K3vUTMHNIeK4+u9PsEVJB6zOlnmf2EAeIDin9ZuBoZa
	L+8MjppGHwH5QhwsHjsYyKnR74yM8RXhPK6/sJNaRsaagAStZggLJwmF+PgPRdylveU/gNhS15jSD
	lfzGISXdDELRyoPwqOHlwcH7g64TEo5ksQ82T9995ofBfnDkq4OTt1vbYyYOhdAnCjLyNhEisdmET
	Z2VhmxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Qeh-0000000CzwZ-0NvF;
	Wed, 09 Sep 2026 22:20:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Qee-0000000CzvR-3pzv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:20:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0136D1570;
	Wed,  9 Sep 2026 15:20:26 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97AEC3F7D8;
	Wed,  9 Sep 2026 15:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788992429; bh=q9kAgCxhMvuZTxSbAknymQbFZup+7wlN//P0jig0Xr4=;
	h=From:To:Cc:Subject:Date:From;
	b=qkD8voS/gaiT/+ejytMcIDdMoVUHsl870wkg3D8x/s9Dkta/l3otQcUCEDJrtvnn6
	 1otCPjM+IQmliaXJOrwvSanm2vOi3SISch1nfUGyv4fOJec0EiZDeYOmDjOLQSpkJJ
	 2IByXCG9Baoqxjn0KONUgq1tGbt5Tkub8mWoing4=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v1 0/3] KVM: arm64: Properly advertise !FEAT_LPA2 for NV
Date: Wed,  9 Sep 2026 23:20:12 +0100
Message-ID: <20260909222015.3046432-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_152033_001705_95F63480 
X-CRM114-Status: GOOD (  11.05  )
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

Hi,

Previously for NV FEAT_LPA2 is accidentally exposed to the guest at
stage-1 if hardware supports it. Stage-2 is correctly sanitised out in
ID_AA64MMFR0_EL1 but not stage-1. This is wrong on two fronts:

- There is not FEAT_LPA2 support for NV yet.
- It is non-architectural to advertise different FEAT_LPA2 support in
  stage-1 and stage-2.

This series first removes FEAT_LPA2 from TGRAN4, TGRAN16 for NV, to
present a !FEAT_LPA2 system. Then guest TCR_EL2 sanitisation is added,
to make the DS bit RES0 for NV guests. Note that this sanitisation
can't cover all cases, as we don't trap VHE L1 accesses to the vCPU's
TCR_EL2 via TCR_EL1.

TCR_EL2 sanitisation differs slightly from the AARCHMRS, please see the
commits for details.

For testing I booted a 4K 52-bit nVHE L1 and checked:
1. It is using 48-bit VAs in stage-1.
2. Writing 1 to TCR_EL2.DS and reading it back reads 0.

Series based on v7.3-rc2.

Thanks!

Wei-Lin Chang (3):
  KVM: arm64: nv: Don't advertise FEAT_LPA2 for guest stage-1
  arm64: sysreg: Add TCR_EL2 to sysreg infrastructure
  KVM: arm64: Convert TCR_EL2 to config-driven sanitisation

 arch/arm64/include/asm/kvm_arm.h  |  13 ----
 arch/arm64/include/asm/kvm_host.h |   2 +-
 arch/arm64/include/asm/sysreg.h   |   1 -
 arch/arm64/kvm/config.c           | 113 +++++++++++++++++++++++++++
 arch/arm64/kvm/nested.c           |  17 ++++
 arch/arm64/tools/sysreg           | 125 ++++++++++++++++++++++++++++++
 6 files changed, 256 insertions(+), 15 deletions(-)

-- 
2.43.0


