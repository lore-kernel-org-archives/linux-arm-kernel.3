Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304CBC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLVWGJnSfsEEukfN1+zTo77SPW/PH3u101wyYaXIf00=; b=OGCfaT9gz5I5VyPAiVkX3xFVrw
	RCDaK16CdnpO0ZAOGe6i+Ho6LtAaYklzg5sO2GSfEWkgcABgkAutYg8KdQJg0r2CkxNpa8qRmAdQd
	F3zSOV14nNUejEPPslcJKIlAEt6WnysU2BHjX09Mo11MXymPXyemfaghM14tAsOgBaufZpMrHnuh8
	1RmKttHtHn0lpl3xquQYyfBTxHX6Y8EBtJYX8s/qMhOLg5mOaraKwezbHsHa8o3ZYQ+cXcKqUrzzN
	6BUdSPRGxMzav9FuRyi3SkQ7iPZZx8dHEOXORqo/TS74x+remwwom+CTW17dP+B8yL7aTQRFsi/j1
	ivXmGk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YTf-00000001DQ0-3rAG;
	Mon, 21 Sep 2026 07:30:15 +0000
Received: from out-19.mta1.migadu.com ([95.215.58.19] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YTc-00000001DO5-421J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:30:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YRjrdcXSvz0c+tqwc5MA976Iks7cA0z99Etwh6VpwMA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789975811; v=1; x=1790580611;
 b=xMAiMtOrSud9SSi2GLPjPG3elstbMhdL9nCAPFyvdUne9/7gFhCWYgRXeb8vbgtmiQAhG5pk
 xIvryYs6wYWYkf4FBqxB4Lii4zbvAsJAErqPs8z8jkz4+50GeJfU4RX7o3swktiCWrU6YmxL802
 oiR+sPGP50ldSJUZbE+yomzs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5b3602680922a617;
	Mon, 21 Sep 2026 07:30:07 +0000
X-Mizu-Trace-ID: 5b3602680922a617
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] irqchip/gic-v4: Unwind what its_alloc_vcpu_irqs() allocated on failure
Date: Mon, 21 Sep 2026 08:29:56 +0100
Message-Id: <20260921072958.2918477-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260921072958.2918477-1-fuad.tabba@linux.dev>
References: <20260921072958.2918477-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_003013_158616_025940BB 
X-CRM114-Status: GOOD (  14.07  )
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

A failure in the its_alloc_vcpu_sgis() loop leaves behind both the SGI
domains created for the vPEs below the failing index and the vPE irqs
allocated before the loop, since irq_domain_remove() frees neither. Each
leaked vPE takes its ITS state with it, a vpe_id and an LPI pending
table.

Free both from a second label before the existing unwind. With the
freed pointers now cleared, its_free_sgi_irqs() can skip a vPE with no
SGI domain and be reused there. The check has to precede the lookup:
irq_find_mapping(NULL, 0) falls back to irq_default_domain, and the
live irq it returns would then be freed.

Fixes: 6d31b6ff985d ("irqchip/gic-v4.1: Add VSGI allocation/teardown")
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v4.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v4.c b/drivers/irqchip/irq-gic-v4.c
index 754839e409f88..f707a3cb281aa 100644
--- a/drivers/irqchip/irq-gic-v4.c
+++ b/drivers/irqchip/irq-gic-v4.c
@@ -159,6 +159,8 @@ static int its_alloc_vcpu_sgis(struct its_vpe *vpe, int idx)
 	return -ENOMEM;
 }
 
+static void its_free_sgi_irqs(struct its_vm *vm);
+
 int its_alloc_vcpu_irqs(struct its_vm *vm)
 {
 	int vpe_base_irq, i;
@@ -189,11 +191,14 @@ int its_alloc_vcpu_irqs(struct its_vm *vm)
 		vm->vpes[i]->irq = vpe_base_irq + i;
 		ret = its_alloc_vcpu_sgis(vm->vpes[i], i);
 		if (ret)
-			goto err;
+			goto err_free_irqs;
 	}
 
 	return 0;
 
+err_free_irqs:
+	its_free_sgi_irqs(vm);
+	irq_domain_free_irqs(vpe_base_irq, vm->nr_vpes);
 err:
 	if (vm->domain) {
 		irq_domain_remove(vm->domain);
@@ -215,8 +220,13 @@ static void its_free_sgi_irqs(struct its_vm *vm)
 		return;
 
 	for (i = 0; i < vm->nr_vpes; i++) {
-		unsigned int irq = irq_find_mapping(vm->vpes[i]->sgi_domain, 0);
+		unsigned int irq;
 
+		/* irq_find_mapping() falls back to the default domain on NULL. */
+		if (!vm->vpes[i]->sgi_domain)
+			continue;
+
+		irq = irq_find_mapping(vm->vpes[i]->sgi_domain, 0);
 		if (WARN_ON(!irq))
 			continue;
 
-- 
2.39.5


