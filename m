Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFB5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kVTNc/9jknS5UWRVRntQL1AqoiLE1DkjRtltxTY4gME=; b=DP0qi6TmRJcafOd+eSga5Z9xXL
	lO4n+rfedqn4mGx+q8SSoWwyiBj0bemwC0Ay8snkd97PB6h4IUf3vSylDMQuBwxtdzPBDqsaj/HfE
	60c1Bd3rLdi022kvJF4MAQjIEBlcUHLiAZzd4Q3Eq7EGhG58jMgcNJYb1TuwYFEdNlwzOiymeNMhB
	t/w1mX36/rVcFGUWJ7Cb71qK3Dm9fP62mPQIv2OOPHPbUq/10Hz3b6dQ8zbBW3R6tK79je/XQc+w9
	GBSEuiS4dD+EihiT+cC0y3fmqzrNjN3wGjkaW+qUjs/5XjMannawjxL9zLhJSJwCNaRLuiNfM4Hne
	kS9dN8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkSp-00000003UZ6-3x0H;
	Mon, 23 Jun 2025 16:56:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThCe-00000002sBd-0Yn5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Jun 2025 13:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=kVTNc/9jknS5UWRVRntQL1AqoiLE1DkjRtltxTY4gME=; b=fhFdLsed89bXtHgCUXKRvrY855
	uS/n0/sZv6VAii+sbTXtGN956j2OqjnQIfb3WLkOuaX+UY+Yp3E5JnQQOeQo4mK5E/RazM0p7unzB
	7CWtOari5IS3pZWoRAb5L77JdLUCDK8XPoMejX+OCM3HxUUd3Pjk5skldx464RuoJ/+gpOg0I+G4o
	EOyRgyNoYy4AtjhijxX+g6rtaLTb0bFS134Nbed1Zk1O9tAPRl4BjEzpAKTPT5WMsBtbexOOdLgi7
	RI5WVN15Ns8B9SYkr9WH/QEr0+aUnPbbVLHsn5CiQKm37/cfre46STxm1dOWtCwz5C0y0jdPPrQs5
	ZPY9Bopw==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThCc-00000003XSl-3cfe;
	Mon, 23 Jun 2025 13:27:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uThCc-000000043AL-2a63;
	Mon, 23 Jun 2025 14:27:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [RFC PATCH 1/2] KVM: Add arch hooks for KVM syscore ops
Date: Mon, 23 Jun 2025 14:27:13 +0100
Message-ID: <20250623132714.965474-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

Allow the architecture to hook kvm_shutdown(), kvm_suspend() and kvm_resume()

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/linux/kvm_host.h |  3 +++
 virt/kvm/kvm_main.c      | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..8e16b6c0d2ba 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1622,6 +1622,9 @@ void kvm_arch_disable_virtualization(void);
  */
 int kvm_arch_enable_virtualization_cpu(void);
 void kvm_arch_disable_virtualization_cpu(void);
+void kvm_arch_shutdown(void);
+void kvm_arch_suspend(void);
+void kvm_arch_resume(void);
 #endif
 bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eec82775c5bf..4af1d9943d39 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5609,6 +5609,20 @@ static int kvm_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
+__weak void kvm_arch_shutdown(void)
+{
+
+}
+
+__weak void kvm_arch_suspend(void)
+{
+
+}
+__weak void kvm_arch_resume(void)
+{
+
+}
+
 static void kvm_shutdown(void)
 {
 	/*
@@ -5625,6 +5639,7 @@ static void kvm_shutdown(void)
 	pr_info("kvm: exiting hardware virtualization\n");
 	kvm_rebooting = true;
 	on_each_cpu(kvm_disable_virtualization_cpu, NULL, 1);
+	kvm_arch_shutdown();
 }
 
 static int kvm_suspend(void)
@@ -5641,6 +5656,7 @@ static int kvm_suspend(void)
 	lockdep_assert_irqs_disabled();
 
 	kvm_disable_virtualization_cpu(NULL);
+	kvm_arch_suspend();
 	return 0;
 }
 
@@ -5649,6 +5665,7 @@ static void kvm_resume(void)
 	lockdep_assert_not_held(&kvm_usage_lock);
 	lockdep_assert_irqs_disabled();
 
+	kvm_arch_resume();
 	WARN_ON_ONCE(kvm_enable_virtualization_cpu());
 }
 
-- 
2.49.0


