Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D3DC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HkzLv8L0tgzdHFXMZlyDL2zfECPLPMfktcq+Y9SVhHY=; b=iCo9/2ZWcGnQqX5uuxJyIrrumF
	OztNENYWDuciFdGQVMvpSRmHu9or1T/+00va2FnMyfDps8LgO3rtVg6P8PIVloNMYaAYJOLNV3ffr
	91/U/a9ci5C8HbyYCPJMpPccMby7VqFWVTub6IZVkOoZozOIgNTzyFVlUOlS5Hv35PFW+4u1YT7W8
	kyn4vlaIv1Xc2ipSOFucfCYVbP7HnwfwRaPiN3aC0iBAJVjr1An/nBSuv7hfvf3wi5Sk/uA7OP12C
	P4eexoKfNLKvxYapuY/pWUrPcCYHDUuZotYgPY40KxQGJTjz352H8HGs6SB2oxLYzyyiDzDVSz45x
	a8Mhbv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Gi-00000003g0z-2agc;
	Mon, 14 Sep 2026 12:58:44 +0000
Received: from out-56.mta0.migadu.com ([2001:41d0:1004:224b::38] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Ge-00000003fya-0azQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:58:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cr2R0muZQJAbH/2zo0/ZBnfmxN5tuFxhYming9+hGcc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789390718; v=1; x=1789995518;
 b=JDRQ+09bRJUJGjJZsL1xZ6JLy+LM+HvBswowUWJwMIT/lQS5gbdSXgPewQs2AH9PqVxT5gRr
 3L/H44i0d58+6rQ8PzNAJ1pNRSjAFFOx1zS/vwxXbsIUk4yENJNm2VHOxCkWXvY4AnGXv9h+ap7
 zy/6ZzTPEqZr5m4MuQYbvKb4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 89023a9896b98e15;
	Mon, 14 Sep 2026 12:58:28 +0000
X-Mizu-Trace-ID: 89023a9896b98e15
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: Report SMCCC_VERSION and SMCCC_ARCH_FEATURES as implemented
Date: Mon, 14 Sep 2026 13:58:26 +0100
Message-Id: <20260914125827.1645980-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_055840_327788_901DE77A 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

KVM reports SMCCC v1.1 to guests, which makes SMCCC_VERSION and
SMCCC_ARCH_FEATURES mandatory, and DEN0028H 7.3.6 requires
SMCCC_ARCH_FEATURES to return SUCCESS for both function ids: "This
function must return SUCCESS when arch_func_id is the SMCCC_VERSION or
SMCCC_ARCH_FEATURES function id." With arch_func_id set to either, KVM's
guest handler returns NOT_SUPPORTED. Return SUCCESS.

A Linux guest is unaffected: it discovers SMCCC_VERSION through
PSCI_FEATURES, and issues SMCCC_ARCH_FEATURES only with arch_func_id set
to ARCH_SOC_ID, the ARCH_WORKAROUND_* ids or HV_PV_TIME_FEATURES.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hypercalls.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index b11b8821c9fbc..66f16bf9a8ea7 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -293,6 +293,10 @@ int kvm_smccc_call_handler(struct kvm_vcpu *vcpu)
 	case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
 		feature = smccc_get_arg1(vcpu);
 		switch (feature) {
+		case ARM_SMCCC_VERSION_FUNC_ID:
+		case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
+			val[0] = SMCCC_RET_SUCCESS;
+			break;
 		case ARM_SMCCC_ARCH_WORKAROUND_1:
 			switch (arm64_get_spectre_v2_state()) {
 			case SPECTRE_VULNERABLE:
-- 
2.39.5


