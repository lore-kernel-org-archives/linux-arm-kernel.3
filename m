Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24428EFCD80
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jSLZtLPFNYP99Gp43k1eVbX2dL2LT8yQcf9WKPjt9q4=; b=CeH+CwvQLEjzjDvjsX0btDvGhN
	Utg7x2CGn1ZQT1DZX1ZFbOSs00iN2/lPxYZIZ/A1YIvQBw65/TL6Xx15ufu6R16lZBsuJdrUbtFhP
	WhKe/jQl7ybfcHYqXAtBYmDu8tPoPETabltn15Wys7n5LbpFaKleLPBiqj0L4+D1ppceT5v3NbIZ+
	RThu0HamHPPeNJmjQhci79MmnvMkA2Y2Uy0aAzl2siuzPWV2k8/9YPxHkvGKhKN6P9PxGY1VdsjVS
	8iCM0hFJL5+sAbFW3Qwu8mikAJ7I5REPYk+hwiO5A/KNbZKZM5KVbS+sAhXsWRzCF1hHYLhhkBiod
	JZchn44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXXx-000000073Qc-0aDQ;
	Mon, 09 Mar 2026 10:09:09 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXXr-000000073OG-197L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:09:06 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202603091008574b4224d0b70002078f
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 09 Mar 2026 11:08:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jSLZtLPFNYP99Gp43k1eVbX2dL2LT8yQcf9WKPjt9q4=;
 b=BKMdqH/qcRjY7+zvRPudjerq6dfqp8IlajHtYlGpOLRV/YqMwsOtTVCw+8d7I4qDM3oLEM
 nht9zNeNNn41vU2TVMiB+5/XCNjN2nX6365V9xn1ltl72Ly6CoRW9zLtDk3DKhdFsAqa07lm
 oJwndfwH5YHjF0TjVcl+4znQKQdyN8q5tjJp+Wecu9eZr4LfeInVTy7RZa2tLa0Ao6pFp9/x
 Xj1NESmLM52ozfGF9VxgGA2AqzG4wMHGBQMNiv4tyPQ0wwLfeUNWnbGNo/W3aJM0icCbGo+Q
 W0aGlrPOR+dz14tyEgELKmw+4J+VZKL0GVbAz9jzniZlnxFw5hNEnQrg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Abraham I <kishon@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ARM: soc: ti: k3: Provide reset cause information
Date: Mon,  9 Mar 2026 11:07:52 +0100
Message-ID: <20260309100800.1134701-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_030904_766641_D83F2DFA 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Newer TI SoCs from K3 family (AM64x and newer) provide a detailed reset
cause information in RST_SRC register in the reset module within memory
mapped control registers. To make this information available in user space:

- provide the DT bindings for the reset module
- add the rest module to the device trees of the corresponding SoCs
- conditionally add custom SYSFS attribute group (if particular SoC
  supports it) with "reset_reason" attribute providing the textual
  form of the reset cause as documented in AM62x Processors Technical
  Reference Manual.

The location for the newly provided information was inspired by
drivers/soc/tegra/pmc.c.

The series has been tested on AM623 (relevant DT is k3-am62-wakeup.dtsi).
Interestingly, K3 can have multiple bits asserted, for instance in case of
WDT-triggered reset:

$ cat /sys/bus/soc/devices/soc0/reset_reason
Reset Caused by MCU ESM Error
Reset Caused by Main ESM Error

Alexander Sverdlin (3):
  dt-bindings: soc/reset: ti: add binding for k3 platforms reset module
  arm64: dts: ti: k3-*: Add am64x and newer reset module
  soc: ti: k3-socinfo: Provide reset reason information

 .../bindings/reset/ti,am64-rst.yaml           | 39 ++++++++
 .../soc/ti/ti,j721e-system-controller.yaml    | 11 +++
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  5 ++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |  5 ++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi      |  5 ++
 drivers/soc/ti/k3-socinfo.c                   | 88 +++++++++++++++++++
 6 files changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ti,am64-rst.yaml

-- 
2.52.0


