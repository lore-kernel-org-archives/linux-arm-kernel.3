Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E511E937EC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9jLXwihCSYh96p9OmAAo/ItQG73kLchdgmOdgdjJ/DI=; b=cgwot5Sd9rmCvSIzITd6z+gawg
	ANvnaLs16JJBmPWtZdL1zidX90oXrzd5SjCYpz6y2d35dlbEiajsEGmiangVIWBqsahN7GKHB6+XN
	TjR4lYt0qiIMiCxv1kcaWXRPPGqCQWBuG4MrbD/9kpDpRwycsm0VBYO/QBdFZXc4EToj2zWcxH+4T
	H8WXDH0xzXFDD9n1WmPEs2qLqWs2DfxsmpHov0VoxWCxU7oElZ63QHiOnTZOvbtM6yzuOMwf48J1O
	W5QNhec0ykXdkyFmhz0rMcT8ydZ6YRGaHA2Dr1K1+iQskMkfiuN92EFbVkFM+PN2Er7NRnajzaTFU
	yXesSCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFb-0000000EVfN-0nmj;
	Sun, 12 Apr 2026 17:05:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFa-0000000EVfF-0Rna
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF60560142
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B63DC19424;
	Sun, 12 Apr 2026 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776013532;
	bh=PthFYeljXqJ3i4XcIWqo/pxPDbf552L3YLDUc5+rmpw=;
	h=From:Subject:Date:To:From;
	b=Riai1qEHsgYCDx7681M+hSPQ9bDjcEj+b+SAPZVuRS2QQl1vSKSoqMSNrHwaLtovV
	 l9vkHKQM4nxqrUy5uh6yb1Hy7VrOzjh8cp7fDHZXB3J46esbZtUBGz+j+6sidjCc6T
	 rZu+F7dZ1bCTD+s6MkgX2r2mdu+ZCa4x3ogQqb1orq/Bh5ubOgdy9aJLFzOc3oxO4Z
	 LraJyNeg8Gcjz5crJ17JdwmZGqNv9P01+/6ri5BSM/mF+bovgcErDPs01W2xqyfX9y
	 5naLQH03Kgc1UR/1IfW5N/dUbStmc0HszgFXuROOPpEX2k9KKJuo9HljhyAVipR5mm
	 o7B0B3/MW0dEg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 0/5] firmware/irqchip: Add FF-A DT interrupt support for
 donated NS SGIs
Date: Sun, 12 Apr 2026 18:04:36 +0100
Message-Id: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKbQ22kC/yXMQQqDMBBG4avIrBvQGCz2KqUETf6k4yItmVaE4
 N2N7fJbvFdIkBlCt6ZQxsrCr1TRXRpyzylFKPbVpFs9tKbTajYqhMkmsRLZRnZrr+BhfMDorwO
 olu+MwNvven/8Ld95gfucK9r3A4JXfsp3AAAA
X-Change-ID: 20260412-b4-ffa_ns_sgi_gicv3-ede4dfe9d76e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.0
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

Hi all,

This series wires FF-A notification interrupts up through DT using the
standard interrupts property on the arm,ffa node and adds the
required GICv3 and binding support for secure-donated non-secure SGIs.

This has been long pending after the discussions here[1][2]. I have been
waiting for some ACPI story to shape up for almost an year now, but no
progress there. So posting this for now to start discussion on the approach
taken here instead of waiting for another year to sort out ACPI 😉.

It:

- documents secure-donated NS SGIs in the GIC DT binding
- teaches the GICv3 driver to accept and map those SGIs
- adds a DT binding for the arm,ffa firmware node
- updates the FF-A driver to use the arm,ffa node interrupt instead of
  synthesizing its own GIC mapping
- adds an FVP DT node using SGI 8 as the FF-A notification interrupt

The FF-A DT lookup expects a single interrupt entry, verifies that it is
a per-CPU interrupt via the reported affinity mask, and cross-checks the
resolved Linux IRQ hwirq against the interrupt ID returned by
FFA_FEATURES.

[1] https://lore.kernel.org/all/86plqayvu6.wl-maz@kernel.org/
[2] https://lore.kernel.org/all/86zfpgztmt.wl-maz@kernel.org/

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
Sudeep Holla (5):
      dt-bindings: interrupt-controller: Add support for secure donated SGIs
      irqchip/gic-v3: Support secure-donated non-secure SGIs
      dt-bindings: firmware: Add Arm FF-A binding
      firmware: arm_ffa: Use device node interrupts property for IRQ lookup
      arm64: dts: arm: fvp-base-revc: Add FF-A notification interrupt

 .../devicetree/bindings/firmware/arm,ffa.yaml      | 42 +++++++++++
 .../bindings/interrupt-controller/arm,gic-v3.yaml  | 27 ++++++-
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          |  6 ++
 drivers/firmware/arm_ffa/driver.c                  | 53 +++++++++----
 drivers/irqchip/irq-gic-v3.c                       | 86 ++++++++++++++++++++++
 include/dt-bindings/interrupt-controller/arm-gic.h |  1 +
 6 files changed, 201 insertions(+), 14 deletions(-)
---
base-commit: f5459048c38a00fc583658d6dcd0f894aff6df8f
change-id: 20260412-b4-ffa_ns_sgi_gicv3-ede4dfe9d76e


-- 
Regards,
Sudeep


