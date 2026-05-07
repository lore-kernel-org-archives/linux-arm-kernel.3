Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B607CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 13:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urEkDOjmn67fkW9KLKNlyD+GyDqXWSbwVbUbk4d7z6Y=; b=Y7ycjhce4FZZk7j0nXbha5bN8b
	6JwzU9SjyLxsnW5bnavYku0dzZmudK5EZR9+h48sS+ouzEHYfzO1aMd4F07hNVOUCJWKpFh0b9Ac/
	T3Nj8nj/A8L9ktmSTQ87G9wZV3qcqCn1GFHstqPJJBbLALu+9IWPU0VhnphgIvHUMciQ4pY5vTcMo
	NRnzom4Bq2FaofATuQM6Fr1qgpEi9P51/aaylUiXkhJ+QnOiayW/sIIa0r0QMPy6sCwmJGRBAPuqj
	5yCxABAjTHaPeGGLCSoBJS8fvMQ5FJQMMEm8FCtstzbMw8OvmXPTL2/nXI9Mi+G94Y/X/i27pPMct
	a3bp8eTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyGt-00000003pPK-3DxW;
	Thu, 07 May 2026 12:56:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyGp-00000003pL4-426r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E1BD441D8;
	Thu,  7 May 2026 12:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CBDC4AF52;
	Thu,  7 May 2026 12:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778158559;
	bh=6c96IjMHaMre41xBr3FzTv5pSHvU6UTiqN3k4zC2F0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZprJQtbEL/qKSJ+blHqLXn59EDJTINi2PRv8HZAJjZMGROUPoGzPTJmGlmAGFX3e
	 PTDLW7Q3wARN/9UIHA87bU4LvS35WvweNlTSOV2N4QyUwpyKMoCcmXWDLViTxOkrz9
	 1ErRvSfAbQb8+DlgtOg1hu8FQgUlVMfBT9OgirBt9ZE9U+bZHUQg7yH4iU/6xQ6Mrk
	 M8yP6TCze5NN4CY5los0Up5KFHtKKV/CFilK3ntIJP+T2EcaOFKulLZIKLQ7BlB+Zv
	 x8koVqu2iX8ZGsOLRudsFodKQ8ae5cJKJZNwLrVwLhfC8/6GQXaWAp7ZmBAuwZVU2v
	 vRExc3FIx62kQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wKyGi-00000000d7d-23jP;
	Thu, 07 May 2026 12:55:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ge Gordon <gordon.ge@bst.ai>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH 03/16] dt-bindings: timer: arm,arch_timer: Fix requirements for interrupt description
Date: Thu,  7 May 2026 13:55:31 +0100
Message-ID: <20260507125544.2903406-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507125544.2903406-1-maz@kernel.org>
References: <20260507125544.2903406-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kernel.org, afaerber@suse.de, 
 heiko@sntech.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_055604_042147_7839768B 
X-CRM114-Status: GOOD (  15.43  )
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

The arm,arch_timer DT binding is extremely imprecise in describing
the requirements for interrupts.

Follow the architecture by making it explicit that:
- the EL1 secure timer irq is required if EL3 is implemented
- the EL1 physical timer irq is always required
- the EL1 virtual timer irq is always required
- the EL2 physical timer irq is required if EL2 is implemented
- the EL2 virtual timer irq is required if FEAT_VHE is implemented

The consequence of the above is that the minimum number of interrupts
to be described is 2, and not 1.

Finally, clean up the description which made the assumption that
the timers are plugged into a GIC (unfortunately, that's not always
true), drop the MMIO nonsense that has long be moved to a separate
binding, and use the architectural terminology to describe the various
interrupts.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 .../bindings/timer/arm,arch_timer.yaml        | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
index c5fc3b6c8bd0b..c65e48a155ab6 100644
--- a/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
+++ b/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
@@ -10,13 +10,8 @@ maintainers:
   - Marc Zyngier <marc.zyngier@arm.com>
   - Mark Rutland <mark.rutland@arm.com>
 description: |+
-  ARM cores may have a per-core architected timer, which provides per-cpu timers,
-  or a memory mapped architected timer, which provides up to 8 frames with a
-  physical and optional virtual timer per frame.
-
-  The per-core architected timer is attached to a GIC to deliver its
-  per-processor interrupts via PPIs. The memory mapped timer is attached to a GIC
-  to deliver its interrupts via SPIs.
+  The per-core architected timer is expected to deliver per-CPU interrupts
+  (commonly to a GIC to deliver its per-processor interrupts as PPIs).
 
 properties:
   compatible:
@@ -33,13 +28,13 @@ properties:
           - const: arm,armv7-timer
 
   interrupts:
-    minItems: 1
+    minItems: 2
     items:
-      - description: secure timer irq
-      - description: non-secure timer irq
-      - description: virtual timer irq
-      - description: hypervisor timer irq
-      - description: hypervisor virtual timer irq
+      - description: EL1 secure physical timer irq, if EL3 is implemented
+      - description: EL1 non-secure physical timer irq
+      - description: EL1 virtual timer irq
+      - description: EL2 physical timer irq, if EL2 is implemented
+      - description: EL2 virtual timer irq, if FEAT_VHE is implemented
 
   interrupt-names:
     oneOf:
-- 
2.47.3


