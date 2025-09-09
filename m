Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439F2CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R3dwPDl32+RZedfPUBrSLOu+mtb96Ij0hDnjWhRsoSA=; b=dF2OxHfjVswjjhXsIFClbr7cug
	XuD9SUP+ACdawDBfX2QTsGMogJbiHxN3xKDW9RQkGXUuekJds6Sv8dliFHssuLYRhhd6QiFRm7lhg
	IXpNx1N6KD64x8c79vRWBuakRAVMxvZs9P9Wk76oWe8XPyZL/JeOGho6hdhD4yGVhPy93600jt7oN
	HhYnwpdjI9Qo3SCxRTm4sy/+fIMQvYSyu4cyB0VI3gr3qSLq0z2dHcDIvzFx+Hwv1qxQyzZIYd6ZU
	3CxtaLL6KPKUzPKjdfzbY7QTLApvo3Mg5GbfQ/2OoSsFvzilbJvo8dc3fgQKoSqb1QjKcXgU4h9vd
	KFAA44Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wq-00000008pFu-40Ra;
	Tue, 09 Sep 2025 17:16:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwgo-00000006nbm-2avt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=R3dwPDl32+RZedfPUBrSLOu+mtb96Ij0hDnjWhRsoSA=; b=BOOM5yuFW1qAeWrg/pVMlJg2K/
	tx5crPaAua/Uopc4JvwORH+1MwCr317wmOfvdmHn8QNQX30WrwL0BVRSH5N2jPrLEEQnISknBUck+
	C/dHzEmoU4okNsoP3ParZUcPC5fzUNjv4OghXqTwLFTOFUPdCnKmBVpsYHHZSOk19svDnfIMnkc+J
	4crLjkqqUK+h2EmdgyhBcD/U5jEZrdYiiObGukpSE2FQDUBTlBR7SL+4hcG/AzRXQoLPAZ2HbcGQi
	MGpmXUXvoQZDrlq2Wqk9a8Izriv5/jJwyZdZpKIGTngvvQiS08PCkSr/GATOiKvidiGGOVAkJmF6J
	uwnNuJrA==;
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwgj-00000005K8Q-0iyo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:39:09 +0000
X-CSE-ConnectionGUID: 5J2F5CjWQh+YoGlKPOAH3A==
X-CSE-MsgGUID: YrNEyb6QT36IFFdU8D8ozw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Sep 2025 20:38:54 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.24.0.1])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0EB52401E4F5;
	Tue,  9 Sep 2025 20:38:46 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: catalin.marinas@arm.com,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lukasz.luba@arm.com,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	rui.zhang@intel.com,
	sboyd@kernel.org,
	will@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	rafael@kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v8 0/4] thermal: renesas: Add support for RZ/G3E
Date: Tue,  9 Sep 2025 13:38:35 +0200
Message-ID: <20250909113840.122785-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_123905_542174_B8C5E05C 
X-CRM114-Status: GOOD (  11.59  )
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

This series adds support for the temperature sensor unit (TSU) found on the
Renesas RZ/G3E SoC.

The series depends on this syscon patch [1] that has already been queued.

Changes:

v8:
 * Use of_parse_phandle_with_fixed_args() for trim values
 * Update binding doc and collect Rb tag from Rob
 * Use millidegree computation to for better precision

v6 -> v7
 * Update DTS trim priperty name and specifier, updading the documentation
 accordingly
 * Refactor main driver: remove spinlock usage, using polling timeout as computed
 from datasheet. Also use polling for get_temp() while using IRQ for trip-point
 cross detection, and finally add both runtime and sleep PM support.
 * Add new patch to update sys #address-cells as trim specifier now requires an
 offset from sys base

v5 -> v6
 * Minor typo fix
 * Constify regmap config in patch 1/5

v4 -> v5
 * Remove useless curly braces on single line-protected scoped guards

v3 -> v4
 * Improve commit messages

v2 -> v3
 * Remove useless 'renesas,tsu-operating-mode' property

v1 -> v2
 * Fix yaml warnings from dt-binding
 * Update IRQ names to reflect TSU expectations

Regards,

[1] https://lore.kernel.org/linux-devicetree/20250818162859.9661-2-john.madieu.xa@bp.renesas.com/

John Madieu (4):
  dt-bindings: thermal: r9a09g047-tsu: Document the TSU unit
  thermal: renesas: rzg3e: Add thermal driver for the Renesas RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add TSU node
  arm64: defconfig: Enable the Renesas RZ/G3E thermal driver

 .../thermal/renesas,r9a09g047-tsu.yaml        |  87 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  48 ++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/thermal/renesas/Kconfig               |   7 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3e_thermal.c       | 564 ++++++++++++++++++
 7 files changed, 715 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c

-- 
2.25.1


