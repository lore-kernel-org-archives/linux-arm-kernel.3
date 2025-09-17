Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B276CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0/Qc2BPdulXzfpw/A9mgu/rx012qP724b25vcBgdKs=; b=F5y6hZM6A6rTmAWAtietxMU+Z1
	+keB17RdyDlPAEHEZkQUjd9Gj2yz3ImtM7nTs4hyBKgLCRb7QlRzeZduAqKvK45TNSihBOqRMFvhc
	bUCxhPUH/rgP09IP6a3AFi4P5cuMukzzxnjavhmkPC/h5HC7Kcua9Dmx+ope3MiTrBlZWgI2CWbkY
	F3pwdJMplhAmN2F2V9YWwA5Cmn+ehjCWLOLQ/OnlNFUkR5fuXlezZRAncyWtfWptDViox1fmZo/ue
	41G2l/DmP8Dz1EO5HK8ywJ1JpcTuWUtg/eX5VluUZqvqgcct4p3AZiPFcTxWhFjBNvP//co29Orkz
	BE0Uv/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzbU-0000000EsOV-0B2b;
	Wed, 17 Sep 2025 21:22:16 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzbL-0000000EsDK-3kbn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:22:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758144125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0/Qc2BPdulXzfpw/A9mgu/rx012qP724b25vcBgdKs=;
	b=C66xWBllv8a5VboTd2riAgHmMXWq8+fWcdel1J+qLpm06LzgAK5neOKLGikjzY9ZGLKy29
	f0ubT/b1OgANBHzxEyoZ2fEKpNMvLtVa+/Tv+wgcHX4sWeBEs05eehFv2i76hqpCOf7/AE
	NzeRnmYVg+X/qjRyIY3i/L8WpgWa0ek=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 11/13] KVM: arm64: selftests: Initialize HCR_EL2
Date: Wed, 17 Sep 2025 14:20:41 -0700
Message-ID: <20250917212044.294760-12-oliver.upton@linux.dev>
In-Reply-To: <20250917212044.294760-1-oliver.upton@linux.dev>
References: <20250917212044.294760-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_142208_081617_DFAC3C9E 
X-CRM114-Status: UNSURE (   6.49  )
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

Initialize HCR_EL2 such that EL2&0 is considered 'InHost', allowing the
use of (mostly) unmodified EL1 selftests at EL2.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 tools/testing/selftests/kvm/lib/arm64/processor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 5ae65fefd48c..4339de2fc482 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -369,6 +369,12 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 	vcpu_set_reg(vcpu, ctxt_reg_alias(vcpu, SYS_MAIR_EL1), DEFAULT_MAIR_EL1);
 	vcpu_set_reg(vcpu, ctxt_reg_alias(vcpu, SYS_TTBR0_EL1), ttbr0_el1);
 	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TPIDR_EL1), vcpu->id);
+
+	if (!vcpu_has_el2(vcpu))
+		return;
+
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2),
+		     HCR_EL2_RW | HCR_EL2_TGE | HCR_EL2_E2H);
 }
 
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, uint8_t indent)
-- 
2.47.3


