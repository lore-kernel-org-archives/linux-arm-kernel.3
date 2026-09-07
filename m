Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70360C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZjo2rP35c22LdRsGWMelD2pXSSLFk6XahwhGFayevo=; b=sTHCLIeMPEtzOlvhcjQbvyU72Y
	1bMYBo4I+DUINA5UKviMOJEZirZDroKgF2KeinZrV/9ELgesKXtEJfxAbXvo5wX71FpPh52Qzg/XU
	jj71B+licQsVEhmTQduGAqGK35db0XV3JTLo6FfrW2FCc5kY6UbcmUEaNNeQuTGspUuSYrOPToCNA
	JsXWlEhk0RigcFey+K0VAu32W8b5We21CtYsqrgJACzkuepwK0vugm6cgIS6h5OdJ5GXLXWXI2A7c
	unB+PLTpQqMhPzMzDKpfo1iz4rOsjbRodl5SLOuIgcA/gHlRt5yU0igaoxjeTt473s021pMhQA5Oo
	Kxl/f2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TL8-000000065j3-1yQZ;
	Mon, 07 Sep 2026 07:00:26 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TL5-000000065gk-1mDC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:00:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PK1z4T8+HJA4CmHfQi7yiSBW4CDCz2oM5Ruw56h1rLM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764421; v=1; x=1789369221;
 b=KIAJh8wvoMZVe8f+WnnXTzrEEeNxpQoEXly03XKOnbZM6Tikcmzz3BHEjfH87x7Ua5LfOTpy
 X/Rrsj/2gN//A6JO8jRP/PFwCB6CRcex4RyaQcVD6nYZff2G3eGhKU5ynXoxda24qqRCB13EN3P
 XYxmweHod7U3LWNm4X1E/Q1I=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1bd4e47017fc79c9;
	Mon, 07 Sep 2026 07:00:07 +0000
X-Mizu-Trace-ID: 1bd4e47017fc79c9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 02/17] KVM: arm64: Reject the PVTIME vCPU attribute for protected VMs
Date: Mon,  7 Sep 2026 07:59:47 +0100
Message-Id: <20260907070002.3333525-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000023_606794_E313D748 
X-CRM114-Status: UNSURE (   9.58  )
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

pKVM currently doesn't support steal time for protected guests:
KVM_CAP_STEAL_TIME reports 0 for them. The host still accepts the
KVM_ARM_VCPU_PVTIME_CTRL attribute, whose IPA would point
kvm_update_stolen_time() at the guest's private memory on every vCPU
load. Return -EPERM for the attribute group instead.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/guest.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index b01d6622b8720..ab659795d4b2f 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -916,6 +916,10 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_timer_set_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_PVTIME_CTRL:
+		/* Steal time is not advertised to protected guests. */
+		if (vcpu_is_protected(vcpu))
+			return -EPERM;
+
 		ret = kvm_arm_pvtime_set_attr(vcpu, attr);
 		break;
 	default:
@@ -939,6 +943,9 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_timer_get_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_PVTIME_CTRL:
+		if (vcpu_is_protected(vcpu))
+			return -EPERM;
+
 		ret = kvm_arm_pvtime_get_attr(vcpu, attr);
 		break;
 	default:
@@ -962,6 +969,9 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_timer_has_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_PVTIME_CTRL:
+		if (vcpu_is_protected(vcpu))
+			return -EPERM;
+
 		ret = kvm_arm_pvtime_has_attr(vcpu, attr);
 		break;
 	default:
-- 
2.39.5


