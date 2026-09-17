Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAE0C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dNODCOLTXGeCR+UA8EPlwoFw0tTDAdgh0k3iQ0Fc8c=; b=iCCj15e7MYsv5UaDwzOM+eNvLq
	0dse3DnNVzuJ12APv3wgPAggn4uheFiw1PG8UR4E+lKuROvHWsRm9toTuCRoudvBgHWHf4W06tAyP
	Hrq6VGpChRxfnBehZOm0DkFySCPUthwMIKWyv4PPJgOjln4/QxZBmcSteChIKKVeRx5y75Vrk75YL
	ZlWY0XCAG4+Oktq8xyVyqu4eiZgMgttk2i8nUz/TaWPMIEFheTmcxlbW4PvJ97wSCXZIHnEm+Bp2Q
	EX6CCyAkpBDsKfkScq1oSHpP6dWqRbr8NB7OWbDEOFMYDs9URSMSVxZ8XQpmdIJUTN2wsiLxXiNNn
	wADLkI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JsW-0000000CZpz-3pVL;
	Thu, 17 Sep 2026 21:42:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JsS-0000000CZoA-2LWU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:42:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01A6C1596;
	Thu, 17 Sep 2026 14:42:40 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 429C43F7B4;
	Thu, 17 Sep 2026 14:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789681363; bh=kUZhUVbts+ndC39LiYRFJ2AH2v71NBpBnvqeaYZgEFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IkH+u8seP17fq+zdfbRfFgZAD2GQ4dWL+zSuTnoa+he3GN5+gyMfZ9VB1WpbShiC4
	 VoxLtkoAUg7GXqndsVgmbVOip0wMw3B2cy0EyLUeIs+4p1bOulE8IWZ4jO7zhJVvfZ
	 wRBIzpHB33TB9mYB9XKOThpWiXQPUIopn20KLDhA=
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
	Jonathan Cameron <jic23@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	James Clark <james.clark@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] KVM: arm64: nv: Don't advertise FEAT_LPA2 for guest stage-1
Date: Thu, 17 Sep 2026 22:42:11 +0100
Message-ID: <20260917214215.74135-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917214215.74135-1-weilin.chang@arm.com>
References: <20260917214215.74135-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_144244_632739_B48C4043 
X-CRM114-Status: GOOD (  10.33  )
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

Fixes: 9f75b6d447d7 ("KVM: arm64: nv: Filter out unsupported features from ID regs")
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/nested.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 3c4fc566eafc..4a860904c1ce 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1731,6 +1731,17 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 		/* Hide CNTPOFF if present */
 		val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64MMFR0_EL1, ECV, IMP);
 
+		/* NV does not support FEAT_LPA2. */
+		if (SYS_FIELD_GET(ID_AA64MMFR0_EL1, TGRAN4, val) == ID_AA64MMFR0_EL1_TGRAN4_52_BIT) {
+			val &= ~ID_AA64MMFR0_EL1_TGRAN4;
+			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN4, IMP);
+		}
+
+		if (SYS_FIELD_GET(ID_AA64MMFR0_EL1, TGRAN16, val) == ID_AA64MMFR0_EL1_TGRAN16_52_BIT) {
+			val &= ~ID_AA64MMFR0_EL1_TGRAN16;
+			val |= SYS_FIELD_PREP_ENUM(ID_AA64MMFR0_EL1, TGRAN16, IMP);
+		}
+
 		/* Disallow unsupported S2 page sizes */
 		switch (PAGE_SIZE) {
 		case SZ_64K:
-- 
2.43.0


