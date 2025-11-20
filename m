Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914BECF8860
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFAQ5G6SeRazRA6pE/mTpK/FWyyGCqzO+A2GJFIOtY4=; b=srKa2KRR89vmxeC6qa3M1yGYAP
	G4DfHRdh83OrChYZcmclbLjSQVVqblkvOKIlzWAva/+VkI1D5dDRnoWzFlBWBfzKySficE+mSL9NP
	eDbc6ADRfJwyGByZIha/pwsyoZcZinEFXrEE/i8K4xy6TbfcEARor9kK0alC9KjMypWziyTkYKQRp
	Wwy9nVHWdgy1VDoL+qvFWeRxD76CUJ8Zz+RhZXdQlptwV6o+nwe9vsTZrAf1kQRLERsGHdd/Y/Eli
	/TxARTcB5ejS/D+04JaZqqLSQ8XLuzfqs7RCHCKs7/6L5BAD0fSlc0nib0l9i8S18WXOxoFqTnPkt
	LsAqdDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5I9-00000006nr3-0suG;
	Thu, 20 Nov 2025 14:05:45 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5I5-00000006np7-1W2O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1763647541; x=1795183541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aFAQ5G6SeRazRA6pE/mTpK/FWyyGCqzO+A2GJFIOtY4=;
  b=MP3CIYH5OhDOYBnl7F2+LcIdxW5bAIcDqN9qPStC9tvH5iwqQcMqfdOa
   RqWR1zmZxOxfXoRSxW7qLfnq4f5Q2/ucNiGXFuZ2WNoIGfmiOewiSO16S
   IQNzr0ZmMEvoPMhsgHayr8R/WGgdfn1BXxmCpTFyb/a0O6RxTzKSzevIY
   RBGSQjC2+AjVRnLZgzpKeUZNk6NhgVAqs4ktHu5Sb4w4E3WV7rDLNVGUO
   vHVUozwWMPHUdH7Ek05S2dupQ4oipHWlcM91b3tnrlVWidUJr6ZszEEDA
   IsoKytaHtaAFl4ln27WCU0jj4H+55CjAVjRQrQ7zDfiHaQ0t6VOPAI1Do
   Q==;
X-CSE-ConnectionGUID: J/mEdwrhQXSmlG+bry7r6Q==
X-CSE-MsgGUID: +jVNHvYwTUK+fdgeYuajuQ==
X-IronPort-AV: E=Sophos;i="6.20,213,1758585600"; 
   d="scan'208";a="7244749"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:05:36 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:20739]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.156:2525] with esmtp (Farcaster)
 id 7a28a8a5-e14f-4fbe-bfe7-92e87adf30d6; Thu, 20 Nov 2025 14:05:35 +0000 (UTC)
X-Farcaster-Flow-ID: 7a28a8a5-e14f-4fbe-bfe7-92e87adf30d6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Thu, 20 Nov 2025 14:05:35 +0000
Received: from amazon.com (10.1.213.15) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29; Thu, 20 Nov 2025
 14:05:33 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <pbonzini@redhat.com>, <shuah@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <kvm@vger.kernel.org>,
	<mdittgen@amazon.de>, <lilitj@amazon.de>, <sauravsc@amazon.de>,
	<nh-open-source@amazon.com>
Subject: [RFC PATCH 09/13] KVM: arm64: Couple vSGI enablement with per-vCPU vPE allocation
Date: Thu, 20 Nov 2025 15:02:58 +0100
Message-ID: <20251120140305.63515-10-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251120140305.63515-1-mdittgen@amazon.de>
References: <20251120140305.63515-1-mdittgen@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.1.213.15]
X-ClientProxiedBy: EX19D037UWC003.ant.amazon.com (10.13.139.231) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_060541_464814_9C03AE97 
X-CRM114-Status: GOOD (  11.72  )
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

When KVM_ENABLE_VCPU_VLPI is enabled, vCPU vPEs are
dynamically allocated and dislocated ad-hoc. vSGI
direct injection requires receiving vCPUs to have
vPEs, meaning we must couple vSGI enablement with
vPE allocation to avoid injecting vSGIs to nonexistent
vPEs.

Modify vgic_v4_configure_sgis() to validate whether
a target vCPU has an assigned vPE before calling
vgic_v4_enable_vsgis() on boot. Call vgic_v4_enable_vsgis()
and vgic_v4_disable_vsgis() during vCPU vPE alloc and free
within vLPI enablement and disablement functions.

Signed-off-by: Maximilian Dittgen <mdittgen@amazon.de>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index b7dbc1789c90..5d6694d366b5 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -198,7 +198,7 @@ void vgic_v4_configure_vsgis(struct kvm *kvm)
 	kvm_arm_halt_guest(kvm);
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (dist->nassgireq)
+		if (dist->nassgireq && kvm_vgic_query_vcpu_vlpi(vcpu) > 0)
 			vgic_v4_enable_vsgis(vcpu);
 		else
 			vgic_v4_disable_vsgis(vcpu);
@@ -838,6 +838,13 @@ int kvm_vgic_enable_vcpu_vlpi(struct kvm_vcpu *vcpu)
 	if (ret)
 		return ret;
 
+	/* Enable direct vSGIs */
+	if (kvm_vgic_global_state.has_gicv4_1 && vcpu->kvm->arch.vgic.nassgireq) {
+		mutex_lock(&vcpu->kvm->arch.config_lock);
+		vgic_v4_enable_vsgis(vcpu);
+		mutex_unlock(&vcpu->kvm->arch.config_lock);
+	}
+
 	/*
 	 * Upgrade existing LPIs to vLPIs. We
 	 * do not need to error check since
@@ -859,6 +866,8 @@ int kvm_vgic_disable_vcpu_vlpi(struct kvm_vcpu *vcpu)
 
 	downgrade_existing_vlpis_to_lpis(vcpu);
 
+	vgic_v4_disable_vsgis(vcpu);
+
 	return vgic_v4_vcpu_teardown(vcpu);
 }
 
-- 
2.50.1 (Apple Git-155)




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Christof Hellmis
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


