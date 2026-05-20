Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EC3CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02qnO6q+Y2WyzRZ55saENhptxHHaPB8mtl4fEi4I0kQ=; b=LAtyOEKRmMEPJMjmXP6/lfNx1K
	jauH3HHLMDnsUDIyBWmkIgoH11lrGvqfSNLK44FyWOg+ZULD1m8DXiDLJj9R0JwGH7uV7EovqnBYm
	SgD02KjaoqAQCDnwlMehMwFfs4EKNdJyFAWF5VueNiY/A0zHYHWNNFhWWJFQyr+Dh3fUjwZY2nBJt
	rQP2ggizuCAEUej3Ca3FtJvWtfApmEHlAFddVdGdBUoOMsdl8JQ7f5NGt+2ZFjiqgcK+uxLxyLE8H
	OzAgZULuw4oU0pXvyHQwoz/jsBNAd5J7d973zVeBYMWIKTKX6IDYv2mP9WnNHRykKVMcsnPmOkUAd
	c4BSw0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd7Q-000000048p7-1FmC;
	Wed, 20 May 2026 09:21:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6Z-000000047lH-3p9U
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=02qnO6q+Y2WyzRZ55saENhptxHHaPB8mtl4fEi4I0kQ=; b=hc4QBv62B0wPmBzLbHyI9ZJMZm
	MGHsHkXX/hNzI0G7+pwAO3PYn4T5iS1YrQvRLZ64HTlnXvuDAubV3UIsphay1F/rM9p2F4erI8zog
	g+2htil2MV3MddiImfduN1qBA6aJ78nHLo0X0nl6PK0Fn0cqewmzFjkP6i/exHSqiW7oOLDpyWsMa
	R6S5p8etb9u7oiHnVFFpCauM3vwXRHrgrQYjfDz8VsUnVyi27ItEr4HFHZPzJwvaktBR4qQ3eOKJ6
	DMNmdCSNU6QhTglcpTcSABiZGItSDt8njiktXzJFvheBmBQI8NLhvlHU3CozPRZlDgZcZ/sbWCEZ5
	4KskPQSw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6E-0000000GKXg-3HlE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 52C6842B1C;
	Wed, 20 May 2026 09:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383761F0089B;
	Wed, 20 May 2026 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268815;
	bh=02qnO6q+Y2WyzRZ55saENhptxHHaPB8mtl4fEi4I0kQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M8uW/XzSvbnK2eY1XJNbp8dQ8hAmyed5meicw52xAMVS1dvBuD/aYpbXKYI9/s8lO
	 pjugGCFR8NFnATvFURdBLDd3Dh0Gk4L70Vp3PPNQnndpOGo6OOpZ1NgAQmhbWZtnQU
	 xhbNG9Bx82nYL1cIJ/95E1PoG3DOwzvn4pdZ03wi/3+3v4KBvy+OXeOffsxkkqZb8y
	 cp5DrR4s8Hv4wxbD8bqAdbNdSmvUv6U02ob7VDUeJB4ytfJvVqU2PvwiNKGzWGv0nB
	 FfUGQ12E2R4JEaLG6lPwd84b+vBuSIGP99ATAtBs0RrhQMhiITlmslg0i99iMLIhHh
	 baymaWCsaSw2A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd65-00000004IaV-2OOx;
	Wed, 20 May 2026 09:20:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 16/18] Documentation: KVM: Clarify that PMU_V3_IRQ IntID requirements for GICv5
Date: Wed, 20 May 2026 10:19:47 +0100
Message-ID: <20260520091949.542365-17-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102037_069766_DFE44ABE 
X-CRM114-Status: GOOD (  12.42  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

When running a GICv5-based guest, the PMU must use PPI 23. This,
however, must be communicated via the
KVM_ARM_VCPU_PMU_V3_CTRL->KVM_ARM_VCPU_PMU_V3_IRQ ioctl as a full
GICv5-style Interrupt ID. That is, 0x20000017. Optionally, the whole
ioctl can be skipped for GICv5.

This was previously not clearly documented, so bump the documentation
accordingly.

Fixes: 7c31c06e2d2d ("KVM: arm64: gic-v5: Mandate architected PPI for PMU emulation on GICv5")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/virt/kvm/devices/vcpu.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 5e38058200105..66e714f2fcfa7 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -37,8 +37,11 @@ Returns:
 A value describing the PMUv3 (Performance Monitor Unit v3) overflow interrupt
 number for this vcpu. This interrupt could be a PPI or SPI, but the interrupt
 type must be same for each vcpu. As a PPI, the interrupt number is the same for
-all vcpus, while as an SPI it must be a separate number per vcpu. For
-GICv5-based guests, the architected PPI (23) must be used.
+all vcpus, while as an SPI it must be a separate number per vcpu.
+
+For GICv5-based guests, the architected PPI (23) must be used, and must be
+communicated as the full GICv5-style Interrupt ID, i.e., 0x20000017. This ioctl
+can be omitted altogether for a GICv5-based guest.
 
 1.2 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_INIT
 ---------------------------------------
-- 
2.47.3


