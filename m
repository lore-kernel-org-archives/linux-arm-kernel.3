Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76388EFCBBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZMRxjLXE8D2Cdgp/vdO8bWkwaeP3e4nJ6ZrADBGSOnE=; b=CQH2FoAUhLKHm5sK00zI14DbrO
	VdO5xLq+IWp0xKDLpsY4hXmXjQRloZtU7SK0bIsSMcNaWBjf9TkMhRczM7xPBvh4scEQ2URm6dbzS
	eENv6zKm7jZAeBw0OHFI5I9oas+hiLGRr5m8meGpxAygdifnJjMg6KSC6Wv+k3bJQKXe+z1o/Wpit
	kMqUoAE/K6pC99GI9ertX9rGXA+h4BjvqYvTJ8Idy9+dbsBhNnABE7CbIqGihcCyIll9anprhgbcU
	cbVOAN/+zrk4IE0N/MFy014/y5MgKDhAAzYWtJqtBxCfHthQkoMrpFRyGc2o3oe74Di11mLVhI+fa
	7oQiXeLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w221P-00000003RnW-3K06;
	Mon, 16 Mar 2026 07:05:51 +0000
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w221L-00000003Rm8-2EBP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 07:05:49 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026031607054044abe6954600020796
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 16 Mar 2026 08:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZMRxjLXE8D2Cdgp/vdO8bWkwaeP3e4nJ6ZrADBGSOnE=;
 b=J27DOwr2tTRTS1V6o/PxmyxZQRfmumgdd78Zp60ZvpxnVludKEpsSX0NvzMp7+l/FZr6pE
 eEycWKJxuh4mMJlyqIz9kHKqJQs086ImNsyKPXsUeYfo0nKPRQOn/KaMgV+3iuY3rA7SEwWz
 NBAbZpGK9yjo6Sq2xOynZJQPrz0irTZGncA9Id38li8qZzbE6qDRsu5qWJS0JjpsDo7upaF6
 PGhf2keqrLW2g+T/tUG9eSye1+I0KEEr8qQLaeWXzcbiAzXxesZ6wqRpc+aV3BUM23mqEsAj
 +RsT1X5Xn1FdsW8f6V1CaJIBmTVgJohW5k1d2p0NG6LaR6/GS8nCZUPQ==;
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
Subject: [PATCH v2 0/3]  ARM: soc: ti: k3: Provide reset cause information
Date: Mon, 16 Mar 2026 08:04:22 +0100
Message-ID: <20260316070429.1545707-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_000548_236135_BDE7C4B1 
X-CRM114-Status: UNSURE (   7.87  )
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

- provide the DT bindings for the reset registers
- add the rest registrs to the device trees of the corresponding SoCs
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

Changelog:
v2: amended mfd/syscon.yaml instead of separate reset/ti,am64-rst.yaml

Alexander Sverdlin (3):
  dt-bindings: mfd: syscon: add binding for TI K3 platforms reset
    registers
  arm64: dts: ti: k3-*: Add am64x and newer reset registers
  soc: ti: k3-socinfo: Provide reset reason information

 .../devicetree/bindings/mfd/syscon.yaml       |  1 +
 .../soc/ti/ti,j721e-system-controller.yaml    | 11 +++
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  5 ++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |  5 ++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi      |  5 ++
 drivers/soc/ti/k3-socinfo.c                   | 88 +++++++++++++++++++
 6 files changed, 115 insertions(+)

-- 
2.52.0


