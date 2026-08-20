Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5C3C5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LoRrIKzx+DTNajl7fpKvXfuaxBPDerEWGgYegREjnnI=; b=MtRi8D1piGy6s8WTlcQa1Zt8gU
	/r82K1VzAFmTsfT6WSow+XGFXIll378N+k6EJfmIAoXhrbMPSLbCobTiYubIlE20VYslJIIt/gE6D
	bGYBZETxz0Y+0iwoWvliyfQSAo3JC7pH6pyhURt4E+jThQ7xp5vn5u4WkNHvrKziMzsOp73PTPSGR
	ZglYbywBhqpdu98ciswqBNP4thAzfyBH13n3WIJYuM3P1PDTtA2cEd/GiJZp7nLfBrd4XO6XzfxCS
	odfE7Z1U2pZ/tSHr61ZNMXerjvoYNHnwVKm2qn2lX2vJQRdzWmM+y1v1loyhMzMwS0NCbdzjqpz4w
	EM7RxWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2EY-0000000BZhj-1rR8;
	Thu, 20 Aug 2026 12:51:02 +0000
Received: from out-112.mta0.migadu.com ([2001:41d0:1004:224b::70] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2EW-0000000BZgX-1CjE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:51:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gNv3rmQs8sBjpAmX4m5IzC8H8pWO4C5VE0KwoE7p1CI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787230258; v=1; x=1787835058;
 b=pZVVZ6JbyC2cDztRYlDcGowvgre8jqz4srJ25sdm0V16khrUIcrEFBSVg5d+HFErKQUippUU
 sJICNiB5Bf1BI1KX1vcbveyLia8OlodgYaTby1rNHHS/qDWFEg13/o8WZW4qgoMMvt3JcrkHizs
 aFJ7NKch6yiizMRGylorBpWo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 0cbeada787c9c601;
	Thu, 20 Aug 2026 12:50:58 +0000
X-Mizu-Trace-ID: 0cbeada787c9c601
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
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] irqchip/gic-v4, KVM: arm64: Fix the vgic init error paths
Date: Thu, 20 Aug 2026 13:50:50 +0100
Message-Id: <20260820125053.2951078-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_055100_466559_48BE5253 
X-CRM114-Status: GOOD (  10.35  )
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

Hi folks,

Three fixes on the paths that run when vgic init fails partway. Each one
needs an allocation failure to reach.

Sashiko reported the vgic_init() case [1] while reviewing the SPI-array
leak fix. The two irq-gic-v4.c fixes came out of chasing it [2].

Patch 1 clears the irq domain and fwnode pointers at the four GICv4
sites that free them and leave them set. Patch 2 makes
its_alloc_vcpu_irqs() release what it allocated when the SGI loop fails.
Patch 3 releases the SPI array and the vPEs on vgic_init()'s later
failure paths, so KVM_DEV_ARM_VGIC_CTRL_INIT is all or nothing and a
retry starts from scratch.

These patches run across two subsystems, but ordering matters, which is
why this is one series. Patch 3 runs vgic_v4_teardown() on a path it
never ran on before, which adds a route into what patch 1 fixes, and
patch 2 reuses its_free_sgi_irqs() from an error path, which only works
once patch 1 has cleared the pointers.

Based on kvmarm/next (aa8e5dc6a7a2a).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260807105558.73D701F000E9@smtp.kernel.org/
[2] https://lore.kernel.org/all/CA+EHjTyDix+y6NTLTsXP5j9Sn2VLOZcsw94LntQxg_etRBJZuA@mail.gmail.com/

Fuad Tabba (3):
  irqchip/gic-v4: Clear the domain and fwnode pointers after freeing
    them
  irqchip/gic-v4: Unwind what its_alloc_vcpu_irqs() allocated on failure
  KVM: arm64: vgic: Tear down what vgic_init() created when it fails

 arch/arm64/kvm/vgic/vgic-init.c | 11 +++++++++--
 drivers/irqchip/irq-gic-v4.c    | 34 +++++++++++++++++++++++++++------
 2 files changed, 37 insertions(+), 8 deletions(-)


base-commit: aa8e5dc6a7a2a1141ab40706a51010adcd0e57d2
-- 
2.39.5


