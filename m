Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B83C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKHE75yrZ9C1KCUyhPKYIHEh7LJhrNDPfIhpMcjSA64=; b=5Fy2Po0sQAtWcPvosmW2eDlNio
	PKMdx+J3lKrcINWIxSdgXThhfdfXieA4JZtLMSeDuooKItpGQadSC4aWVgxYWNOdNjrJozF83wKL9
	UpDAti8wHnyxavQHMIZVhLQI4vdrZC9yIwsUeMMZnv4Wq1GVPJY8BfFY2cy1awdMEL1F/0OPiwT8h
	RgKjew4r4xpfmClBoXET7xhksfdtuu0gqmQmTAC3IiT+O8kRXRgv99iC4CL/czvsZ44ZosRErk7xM
	3I/azOlg85Sc6SSTD8XYqD6ClM1BLovI4iJe9lInV1t4tH34CY949+89NEgNAc94rF0Q8Cn1+Sm0i
	cpdPx/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YU4-00000001Ddq-1WzS;
	Mon, 21 Sep 2026 07:30:40 +0000
Received: from out-131.mta0.migadu.com ([2001:41d0:1004:224b::83] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YU2-00000001DcA-28pR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:30:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0njPdbaKLdmcvhV4JMlTlxwDuJcfUS+uR9TLYY7nzIc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789975836; v=1; x=1790580636;
 b=rTt1dg0j7DINWZf1ZAgCBj6aNYCpGhMM6eanKKFoafkpZFLHGx12/ZskKp6OWcu0g/8/bIch
 M/C0it8UMQ0Q+oE0brdMiJAcQEiMaYPsNhq775PaLh1fmJhgVP8xKQr2WPDr4yAfBOVdE/UnXRi
 tqZXKRkbT7ciEomvSdNOG/c8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ad2a4d2e289077aa;
	Mon, 21 Sep 2026 07:30:23 +0000
X-Mizu-Trace-ID: ad2a4d2e289077aa
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
Subject: [PATCH v3 4/4] KVM: arm64: vgic-v4: Restore nr_vpes before freeing the vPE resources
Date: Mon, 21 Sep 2026 08:29:58 +0100
Message-Id: <20260921072958.2918477-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260921072958.2918477-1-fuad.tabba@linux.dev>
References: <20260921072958.2918477-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_003038_691714_2B162960 
X-CRM114-Status: GOOD (  10.80  )
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

vgic_v4_init() truncates its_vm.nr_vpes to the failing index to bound
vgic_v4_teardown()'s free_irq() loop, but its_free_vcpu_irqs() reads
the same field: the vPE irqs and the v4.1 SGI domains at or above that
index are never freed, each one leaking a vpe_id and an LPI pending
table.

Restore the count from online_vcpus before that call. This depends on
the previous patch: a failed vgic_init() keeps admitting vCPUs, so
without that patch's teardown the vPE array outlives the failure while
online_vcpus grows past the size it was allocated with.

Fixes: bdb2d2ccac65 ("KVM: arm/arm64: GICv4: Add doorbell interrupt handling")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260820130616.1A7241F000E9@smtp.kernel.org/
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index ed236f083f0d7..30e1de3fc7d9d 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -333,6 +333,9 @@ void vgic_v4_teardown(struct kvm *kvm)
 		free_irq(irq, vcpu);
 	}
 
+	/* Make sure we free all VM-wide, per-CPU resources */
+	its_vm->nr_vpes = atomic_read(&kvm->online_vcpus);
+
 	its_free_vcpu_irqs(its_vm);
 	kfree(its_vm->vpes);
 	its_vm->nr_vpes = 0;
-- 
2.39.5


