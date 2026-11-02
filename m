Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DD660913EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1GBH60LW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oWy3HQhm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SMo7/u996wbVcHi3k4xgqARzUbdAu1qHiecGi066wTg=; b=1GBH60LWx2VD48CDHYPbHTasUl
	xwoXt7GIopSDkZwjgkq0iDa7J2tIL/41GH2N1lENTtSDhJLKOiYGepXwYrM7mQqIS0+9VZynspHDw
	kPj4ue7XLS1Wu/T5ARzYlJyVhSqKXuJDOlOn+mLyWy6CYq86eXKBIlW9hXP8dkCPXxNO2ltY4QHl3
	2LgNKkBVRA8sOVRwFfdZazMrQSDUsivIl06jrSzDBzUAA4332xPnaR6wosNSwjsgnxC+QPM9yL4Xx
	3DJCX4j8Xaf0aJ/2xpdrPy87Sb1c0izGbUXEskFsmScmp9KdlqXS79bandkgBAQRoUlZVMM1FHN11
	c7rcMM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvIq-0000000HLfH-2hoI;
	Mon, 02 Nov 2026 16:54:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvIn-0000000HLe0-1NPm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:54:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A81C316F3;
	Mon,  2 Nov 2026 08:54:29 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D116E3F59E;
	Mon,  2 Nov 2026 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638472; bh=L72770060tG1YWBMEpx+PQ5qVJqAP1qUPGT7jZu5ZpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oWy3HQhmHsHKtd7U32Ydo+OrzCfHSyJGfRI9zN/B6tzEs0y8gdXFccTRucK1e1K2T
	 OxZtl7PTvsRXHgSOuIYQajFqcorTL1Vp2H2Ip/KjyXGu1RY45BDPbkNWxiKQ4p2ch1
	 2E3ovXXmU2uBrO31zQV/k446DpNQqbdOxSyh722g=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 RESEND 1/6] dt-bindings: arm: Add Live Firmware Activation
Date: Mon,  2 Nov 2026 17:54:15 +0100
Message-ID: <20261102165421.3651202-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085433_458924_D18BE789 
X-CRM114-Status: GOOD (  14.48  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Arm Live Firmware Activation spec [1] describes updating firmware
images during runtime, without requiring a reboot. Update images might
be deployed out-of-band, for instance via a BMC, in this case the OS
needs to be notified about the availability of a new image.

Describe an interrupt that could be triggered by the platform, to notify
about any changes.

[1] https://developer.arm.com/documentation/den0147/latest/

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/arm,lfa.yaml      | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
new file mode 100644
index 0000000000000..de97dc88d0b15
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,lfa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Live Firmware Activation (LFA)
+
+maintainers:
+  - Andre Przywara <andre.przywara@arm.com>
+  - Sudeep Holla <sudeep.holla@arm.com>
+
+description:
+  The Arm Live Firmware Activation (LFA) specification [1] describes a
+  firmware interface to activate an updated firmware at runtime, without
+  requiring a reboot. Updates might be supplied out-of-band, for instance
+  via a BMC, in which case the platform needs to notify an OS about pending
+  image updates.
+  [1] https://developer.arm.com/documentation/den0147/latest/
+
+properties:
+  compatible:
+    const: arm,lfa
+
+  interrupts:
+    maxItems: 1
+    description:
+      The notification interrupt for changed firmware image status. For
+      an out-of-band firmware update, some system entity would signal
+      the availability of a firmware update to the host OS via this interrupt.
+
+      This must be an edge-triggered IRQ.
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    firmware {
+        firmware-update {
+            compatible = "arm,lfa";
+            interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
+...
-- 
2.43.0


