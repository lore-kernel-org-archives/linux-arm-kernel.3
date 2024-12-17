Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB12BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsE5TTXVMRYiZBDyzcmMxkSZyOQRMFMtPP2JDgsx18g=; b=0MxyLXoIME6MHXuKa6z0ND1K3U
	fJCwW0PD5A9I8CG3HNukyg9Kv0kYKOSQ+eNjKQKrlFyePgtIjPqcbriw6Y0XdKUS86QT3azZb4J5m
	eZXVo3M1jkuXnbAUGocbFikO20MyVAw+enNEtgHQ8odbSfHhUd4eVjg/4JODoP2FIZM4ciKrf44Pi
	vdjSmEe99IcUujaYn86OqiaQl/P1dF7Be8gtzwhWA+syBQ4HzxVHe64WmZXq628kkq2/NbSiVKbjh
	ux3gy30nRPg7kmHpaO7D/OQri5Vlqo5rf9fJ0XFSXbeKr/rYBVwmQdXNlKT8foEHDx9AY7+ANBUG+
	XpemzDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYfa-0000000DmEK-0Srs;
	Tue, 17 Dec 2024 14:35:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYU2-0000000DjZM-0ajC
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 14:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OsE5TTXVMRYiZBDyzcmMxkSZyOQRMFMtPP2JDgsx18g=; b=EI213qn/V2IxPYyaWjSOmqfIVm
	Zsq4S+iyOjbbst/ih5aL31PcHgUhQpBfIyMkpXNU2O1fLh3augyTXZIiOHWsF660YO/O0sFWkTaK/
	Q5bBmRurN5a/qNXD6PatZ0I7Wf+OrHXRTS23qzUZsKWcFb6Epw3KuV+y+GYUVJFgzEkYMHJMOojhG
	+FPIzG++MZzim9A3qCWL9qoHermMv4cZ6tlvQ0oaq3dUbGY/2mSCjdmIbHesWUI/ytb4ctHwg1kLF
	oWZRMcGGCjd4D1O9RPR3MuXQPbpXxFiAgrToRn5qI3oMfwKPJU/XkgDsz6eCwX9Gqpuzui5Qs0+Zh
	0fhbnj5A==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYTy-000000055XR-2Q4q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 295255C58DF;
	Tue, 17 Dec 2024 14:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B913C4CED3;
	Tue, 17 Dec 2024 14:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445409;
	bh=wHj4zN377wsDETkTsOjFHCOteV1TAO7OHXuPO+V9MYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=obW6nvlLhC7aFXElIrw3wUiRllST8rBB4lolKqmPg2hm/piIKzFuzcNV2AkJ9qOoV
	 svPhr2iywT49TQcEtlfFeRp7UNY4v2GPMn4nrfMpifzL4LmCamcqn98VF4y6F4/1Mx
	 g+pZmq7Y/naH3ggjHCJueIpnH9JIoTnEL/QBrwFefw/ifaPCV+Vg18XmV1Jwe31bvN
	 v+mmGRCBPTHjnN8XXUI6LHBdm0YgMtGbKBTcJKJ+HtiedVRQJtQb1elME5zsimoJxk
	 d2Jp3MTtBVivzvuciUzrB+J2wT9babvI+IKoeC/9ZNyRW0qlxttAhFmEfvEhNmIskW
	 LN17Ir1tyk73A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNYTv-004aJx-1p;
	Tue, 17 Dec 2024 14:23:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: [PATCH v2 12/12] KVM: arm64: nv: Document EL2 timer API
Date: Tue, 17 Dec 2024 14:23:20 +0000
Message-Id: <20241217142321.763801-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217142321.763801-1-maz@kernel.org>
References: <20241217142321.763801-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com, gankulkarni@os.amperecomputing.com, chase.conklin@arm.com, eauger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_142330_908521_DEEFB375 
X-CRM114-Status: UNSURE (   9.87  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/virt/kvm/devices/vcpu.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 31f14ec4a65b6..d62ba86ee1668 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -142,8 +142,9 @@ the cpu field to the processor id.
 
 :Architectures: ARM64
 
-2.1. ATTRIBUTES: KVM_ARM_VCPU_TIMER_IRQ_VTIMER, KVM_ARM_VCPU_TIMER_IRQ_PTIMER
------------------------------------------------------------------------------
+2.1. ATTRIBUTES: KVM_ARM_VCPU_TIMER_IRQ_VTIMER, KVM_ARM_VCPU_TIMER_IRQ_PTIMER,
+                 KVM_ARM_VCPU_TIMER_IRQ_HVTIMER, KVM_ARM_VCPU_TIMER_IRQ_HPTIMER,
+--------------------------------------------------------------------------------
 
 :Parameters: in kvm_device_attr.addr the address for the timer interrupt is a
 	     pointer to an int
@@ -159,10 +160,12 @@ A value describing the architected timer interrupt number when connected to an
 in-kernel virtual GIC.  These must be a PPI (16 <= intid < 32).  Setting the
 attribute overrides the default values (see below).
 
-=============================  ==========================================
-KVM_ARM_VCPU_TIMER_IRQ_VTIMER  The EL1 virtual timer intid (default: 27)
-KVM_ARM_VCPU_TIMER_IRQ_PTIMER  The EL1 physical timer intid (default: 30)
-=============================  ==========================================
+==============================  ==========================================
+KVM_ARM_VCPU_TIMER_IRQ_VTIMER   The EL1 virtual timer intid (default: 27)
+KVM_ARM_VCPU_TIMER_IRQ_PTIMER   The EL1 physical timer intid (default: 30)
+KVM_ARM_VCPU_TIMER_IRQ_HVTIMER  The EL2 virtual timer intid (default: 28)
+KVM_ARM_VCPU_TIMER_IRQ_HPTIMER  The EL2 physical timer intid (default: 26)
+==============================  ==========================================
 
 Setting the same PPI for different timers will prevent the VCPUs from running.
 Setting the interrupt number on a VCPU configures all VCPUs created at that
-- 
2.39.2


