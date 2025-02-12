Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A48FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 01:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrClHRqKsJhUgr2olSBXPZ258Bk/7fWr+RNJ8O+98cs=; b=H4gtnnDHAhbaQQI/bvjWCZZoIg
	X6HcnOhLQCLr82X0u5fW0pkdhQp+Tw+zP4mKvfNBs7uOWLx03AdYIYdkRw0ZOLu7BvgObodrUhlrG
	gl4E9JC5MpfmGmGe1Iw6LTtU7w1dV+GWvXMk41nIG66zbRXQaJwFQmn3dkeaT7eJ4SjIkIuKgEDKQ
	HyJrHKVfzGdiCXLGL8MfEujSRLcODrdszkPCC4KLhoDE8vCO4Z/fkoRsVLYqut3ixn+8Ar5EXVXIH
	E04KnZEM0KiuSwYofleXTsbFxsOqxNlbKFP2INQNYt6NU/G+jvrLknKSM1vD2NYn3SeAdO2MHjit0
	voLx8iAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1tc-00000005sc4-0Y4n;
	Wed, 12 Feb 2025 01:50:36 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti1mh-00000005r5L-1UsF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 01:43:28 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7DBB92107AB8;
	Tue, 11 Feb 2025 17:43:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7DBB92107AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739324606;
	bh=jrClHRqKsJhUgr2olSBXPZ258Bk/7fWr+RNJ8O+98cs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ieXru8hhff4SzJYmU6EHZI/dEPSX8q2Xb7zi7YlIfIPeYzUaZUckucd34oJNV7LhY
	 3S6o6AAGzTgz2QVqenW5T941oF3Z7mbvQxu6xvBugwO7ipqm+bIrLiOiYssbEsJCK7
	 8vq13rXYxk1l8AGAW3HotWN54WjAlogOoVSNT11k=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mingo@redhat.com,
	robh@kernel.org,
	ssengar@linux.microsoft.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	x86@kernel.org
Cc: benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v4 4/6] dt-bindings: microsoft,vmbus: Add GIC and DMA coherence to the example
Date: Tue, 11 Feb 2025 17:43:19 -0800
Message-ID: <20250212014321.1108840-5-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212014321.1108840-1-romank@linux.microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_174327_417292_3E122300 
X-CRM114-Status: UNSURE (   9.05  )
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

The existing example lacks the GIC interrupt controller property
making it not possible to boot on ARM64, and it lacks the DMA
coherence property making the kernel do more work on maintaining
CPU caches on ARM64 although the VMBus trancations are cache-coherent.

Add the GIC node, specify DMA coherence, and define interrupt-parent
and interrupts properties in the example to provide a complete reference
for platforms utilizing GIC-based interrupts, and add the DMA coherence
property to not do extra work on the architectures where DMA defaults to
non cache-coherent.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 .../devicetree/bindings/bus/microsoft,vmbus.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
index a8d40c766dcd..5ec69226ab85 100644
--- a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
+++ b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
@@ -44,11 +44,22 @@ examples:
             #size-cells = <1>;
             ranges;
 
+            gic: intc@fe200000 {
+              compatible = "arm,gic-v3";
+              reg = <0x0 0xfe200000 0x0 0x10000>,   /* GIC Dist */
+                    <0x0 0xfe280000 0x0 0x200000>;  /* GICR */
+              interrupt-controller;
+              #interrupt-cells = <3>;
+            }
+
             vmbus@ff0000000 {
                 compatible = "microsoft,vmbus";
                 #address-cells = <2>;
                 #size-cells = <1>;
                 ranges = <0x0f 0xf0000000 0x0f 0xf0000000 0x10000000>;
+                dma-coherent;
+                interrupt-parent = <&gic>;
+                interrupts = <1 2 1>;
             };
         };
     };
-- 
2.43.0


