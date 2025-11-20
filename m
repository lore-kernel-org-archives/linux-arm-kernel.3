Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FA6CF885C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHS+ShTd2CkJzC/awfjaT1l3eKow8+x9vpRZiRWUEyg=; b=q8HS/wrJoj+oYrx+cUNlw7waOr
	cGU/uF57EhEI7LEiYCjtiqrfCUUaU9eWT0rPgkB+aGXIyXLz/5p006AB9Ur9mz7tA1JCrkNC1m+hS
	oz/AwP9XaRXXlXTLjy3Rj0y4YKvTzWdFCSqLBkDaCqgJ91XeqsBthUi6oB/Hp991cjXDdMfljxOy2
	1CEbMcwTwJ5CyEYBXrodmBWUyYjjILPa2Aj4gOllmlqHFbvCtILQFuPwlKD8qBEYWueiZehx7Weg+
	Cagbr9xaerpW+WUrOJx2HV8oYlLkVQw5vQeo+lQbJk8TfpeCxHmUp3JsR6CKfDvcA2xTU4Fmat18x
	RX4Y7GOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5Gc-00000006nE3-0sQE;
	Thu, 20 Nov 2025 14:04:10 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5GZ-00000006nCi-2Ipw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1763647447; x=1795183447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nHS+ShTd2CkJzC/awfjaT1l3eKow8+x9vpRZiRWUEyg=;
  b=CrtrME4gFpUKIVVAAhWELtmTZktynbltkMA/G9gg182/QFPWzl7tKQTw
   80bNrB7lvGqv9DCyyfWmAZ6mMVm58YwAZvdI07jdneV0SWFZRvNaXDjAK
   SNum7lkBRJtfzu32LVs9goSY2T8x1XIKdIIqQwIbxPj29r1as7EPZyqAS
   3xlCy8VStj4gVWBJ3e1xjrp1U+zAMJMZ/ikV/ou2IcDw7Yxu6OqmONVnr
   VffZGUqf9XqAu8BcnufM3QFOvSauh87nGaQwEt6m7F7yFkPcO56j8KyAR
   Db06HILdvZKjWj3wSgpIc7UIO7kqC5GLxUWMe7n4rt1UL6zv6vaI/Lvov
   A==;
X-CSE-ConnectionGUID: /3FDSui1Q3qezKZcB9vYmQ==
X-CSE-MsgGUID: DIRt3zyiQAiq/VgE3zLiyA==
X-IronPort-AV: E=Sophos;i="6.20,213,1758585600"; 
   d="scan'208";a="7424378"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:04:03 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:10463]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.192:2525] with esmtp (Farcaster)
 id 8b50bdef-f4c6-4df2-acb1-3b5a9a984323; Thu, 20 Nov 2025 14:04:02 +0000 (UTC)
X-Farcaster-Flow-ID: 8b50bdef-f4c6-4df2-acb1-3b5a9a984323
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Thu, 20 Nov 2025 14:04:02 +0000
Received: from amazon.com (10.1.213.15) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29; Thu, 20 Nov 2025
 14:03:59 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <pbonzini@redhat.com>, <shuah@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <kvm@vger.kernel.org>,
	<mdittgen@amazon.de>, <lilitj@amazon.de>, <sauravsc@amazon.de>,
	<nh-open-source@amazon.com>, Maximilian Dittgen <mdittgen@amazon.com>
Subject: [RFC PATCH 03/13] KVM: arm64: Refactor out locked section of kvm_vgic_v4_set_forwarding()
Date: Thu, 20 Nov 2025 15:02:52 +0100
Message-ID: <20251120140305.63515-4-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251120140305.63515-1-mdittgen@amazon.de>
References: <20251120140305.63515-1-mdittgen@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.1.213.15]
X-ClientProxiedBy: EX19D038UWB004.ant.amazon.com (10.13.139.177) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_060407_683617_85E0D5E3 
X-CRM114-Status: GOOD (  15.20  )
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

kvm_vgic_v4_set_forwarding() acquires its_lock to safely map guest LPIs
to host IRQs for vLPI upgrades. Future per-vCPU direct vLPI injection
requires atomically upgrading multiple LPIs while holding its_lock, which
would cause recursive locking when calling kvm_vgic_v4_set_forwarding().

Extract the locked portion to kvm_vgic_v4_set_forwarding_locked() to allow
callers already holding its_lock to perform vLPI upgrades without
recursive locking.

No functional change.

Signed-off-by: Maximilian Dittgen <mdittgen@amazon.com>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 38 +++++++++++++++++++++--------------
 include/kvm/arm_vgic.h        |  3 +++
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index fb2e6af96aa9..4a1825a1a5d7 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -483,27 +483,15 @@ int kvm_vgic_v4_map_irq_to_host(struct kvm *kvm, int virq,
 	return 0;
 }
 
-int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int virq,
-			       struct kvm_kernel_irq_routing_entry *irq_entry)
+int kvm_vgic_v4_set_forwarding_locked(struct kvm *kvm, int virq,
+			       struct kvm_kernel_irq_routing_entry *irq_entry, struct vgic_its *its)
 {
-	struct vgic_its *its;
 	struct vgic_irq *irq;
 	struct its_vlpi_map map;
 	unsigned long flags;
 	int ret = 0;
 
-	if (!vgic_supports_direct_msis(kvm))
-		return 0;
-
-	/*
-	 * Get the ITS, and escape early on error (not a valid
-	 * doorbell for any of our vITSs).
-	 */
-	its = vgic_get_its(kvm, irq_entry);
-	if (IS_ERR(its))
-		return 0;
-
-	guard(mutex)(&its->its_lock);
+	lockdep_assert_held(&its->its_lock);
 
 	/*
 	 * Perform the actual DevID/EventID -> LPI translation.
@@ -567,6 +555,26 @@ int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int virq,
 	return ret;
 }
 
+int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int virq,
+			       struct kvm_kernel_irq_routing_entry *irq_entry)
+{
+	struct vgic_its *its;
+
+	if (!vgic_supports_direct_msis(kvm))
+		return 0;
+
+	/*
+	 * Get the ITS, and escape early on error (not a valid
+	 * doorbell for any of our vITSs).
+	 */
+	its = vgic_get_its(kvm, irq_entry);
+	if (IS_ERR(its))
+		return 0;
+
+	guard(mutex)(&its->its_lock);
+	return kvm_vgic_v4_set_forwarding_locked(kvm, virq, irq_entry, its);
+}
+
 static struct vgic_irq *__vgic_host_irq_get_vlpi(struct kvm *kvm, int host_irq)
 {
 	struct vgic_irq *irq;
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 02842754627f..18a49c4b83f8 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -454,6 +454,9 @@ int kvm_vgic_v4_map_irq_to_host(struct kvm *kvm, int virq,
 					struct kvm_kernel_irq_routing_entry *irq_entry);
 int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int irq,
 			       struct kvm_kernel_irq_routing_entry *irq_entry);
+int kvm_vgic_v4_set_forwarding_locked(struct kvm *kvm, int virq,
+					struct kvm_kernel_irq_routing_entry *irq_entry,
+					struct vgic_its *its);
 
 void kvm_vgic_v4_unset_forwarding(struct kvm *kvm, int host_irq);
 
-- 
2.50.1 (Apple Git-155)




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Christof Hellmis
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


