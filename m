Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E06C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6bsr72gPLZS4+Vn9ns/EyB+cjsTuzd4KHOYP8Zr5sM=; b=ybAbDmjQhyQ27O/gtt42RGDGcJ
	28+92fVshGy+vcccBfqAkWgU2DYyYCV6gu9VL9/4u8Q1jNyr7pGzQ8a6F0ob+Ei6u+4Uldi+H45Qr
	DN+PnWiGQknzmh3H0le1p2edI01xE/DicOG1BUB+1Y4Ac/nvUm2o+w0i1xeRxWW/RPNTznwECVuYH
	6Gu05BnGcWMif4zjkv/2YFIoUYLGwvr7FGoo4OBlb2GWG0xchelBWHfrTQUdZs4Mk3M0Wc+jPEwd4
	0nNzfGd3Ls+cx6EZboC5UvTGzLCMmag2LkgSXSLHxW40GjIcIU3PZr4ROdxjHigNZK0ydUfo1tgLY
	zclKLU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Qel-0000000CzyM-1Q5X;
	Wed, 09 Sep 2026 22:20:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Qef-0000000Czw0-4BGh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:20:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 582AB1576;
	Wed,  9 Sep 2026 15:20:29 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 011F73F7D8;
	Wed,  9 Sep 2026 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788992433; bh=UEnUnQoggEdcy/+YEATXGRzgw6BqC5bdlYacrxhBCr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oIn2j7IdOAYEu4YtjFv38zRnuv2FsD497t1DbToiochFJYvkWVUe61nY3PGWqAntw
	 cT/jJzZqlHFFusKlxHdg9gtHo80AacV5VSTYitgfNPZ5dkCwlj4N6k5b7pgQRBFBiH
	 rUtzGSSjL0vgigmSfNGVhsJYfHpugZpBqErK+mUY=
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
Subject: [PATCH v1 1/3] KVM: arm64: nv: Don't advertise FEAT_LPA2 for guest stage-1
Date: Wed,  9 Sep 2026 23:20:13 +0100
Message-ID: <20260909222015.3046432-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909222015.3046432-1-weilin.chang@arm.com>
References: <20260909222015.3046432-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_152034_087077_040E8897 
X-CRM114-Status: GOOD (  11.17  )
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

There is no FEAT_LPA2 support for NV guests as of now, but we missed
limiting it for the non-stage-2 granule size fields (TGRAN4, TGRAN16) in
ID_AA64MMFR0_EL1. Add the sanitisation.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/nested.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 3c4fc566eafc..1fd98117df23 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1731,6 +1731,19 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		/* Hide CNTPOFF if present */
 		val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR0_EL1, ECV, IMP);
 
+		/* NV does not support FEAT_LPA2. */
+		if (SYS_FIELD_GET(ID_AA64MMFR0_EL1, TGRAN4, val) ==
+		    ID_AA64MMFR0_EL1_TGRAN4_52_BIT) {
+			val &= ~ID_AA64MMFR0_EL1_TGRAN4;
+			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN4, IMP);
+		}
+
+		if (SYS_FIELD_GET(ID_AA64MMFR0_EL1, TGRAN16, val) ==
+		    ID_AA64MMFR0_EL1_TGRAN16_52_BIT) {
+			val &= ~ID_AA64MMFR0_EL1_TGRAN16;
+			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN16, IMP);
+		}
+
 		/* Disallow unsupported S2 page sizes */
 		switch (PAGE_SIZE) {
 		case SZ_64K:
-- 
2.43.0


