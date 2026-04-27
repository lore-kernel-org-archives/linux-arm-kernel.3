Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA0AFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IMFvWn4bMUcIXQpx/OE+bHq9xpHDeiZjz5kCAiCvPSE=; b=4+fdLlAZWBZMa1jMz+fTNSWvfg
	Ch10pqezJyTcnmeZ6DBLVOvJC7J3Vzcda+XmyfJHtskQH86ve3b40OT2N3yzZb67jQJXTjHaw+o7M
	PnZ3k6xUZVih37vlJN8uB1Jj2eQYLW4RpS6t2gTGPza3LNua7x57WVCSWRSnaKl9n2QUwMvtBkgrA
	GAzkpIqZN5tt0/v8p3RZhThP2E6f8y8l6okHv6GlqRvUQzvcPrhx5KuEBBUS2Zos+Otq+R73n8LUL
	GJesw/EOT3yP+xaJDROdvB1lFg6vYpd1pkHTvN25XHtI75554QWbD5BoEY9y3nN7aqBmky3bicvB2
	uoJUItpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMxz-0000000H6M0-3mf5;
	Mon, 27 Apr 2026 14:29:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMxv-0000000H6L7-2wa7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:29:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 306AC4E42B34;
	Mon, 27 Apr 2026 14:29:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD899600D1;
	Mon, 27 Apr 2026 14:29:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77F8010728201;
	Mon, 27 Apr 2026 16:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777300174; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=IMFvWn4bMUcIXQpx/OE+bHq9xpHDeiZjz5kCAiCvPSE=;
	b=OBm2Oc5RhoK+jY+juB43n1SFGuNEXi4M5PKpopAuBMfJF2QZ5rEgo5rDJb9ZCbItBMWI8J
	KSvxANLmV2wspDotACNXnb89PvoNj5lYp05ZGiliReQBRGQcWLsDnMr1PZNkR/ypRl9CYl
	qa2WEQ2QBXFR4/AGck6xDDzPlk2Xx0zxe40tKHVROBXiz7oTR+GUaNF97+TyriGFY39Q9P
	4JN7wxtK6mvvTOA1w61Y4qD6iLo+j1W/jrrmoc3Z3aeUJWDIiVeIBTBUnNNl5R0/oj8Pb8
	D1ZSCk/h+K8GkuPWcJSrHL1ANyQTc3aHpepTgr1a52goz1l0ok9XBqwoCFn0FQ==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Richard Genoud (TI)" <richard.genoud@bootlin.com>
Subject: [PATCH v2 0/3] J722s: s2r: use ti,j7200-padconf
Date: Mon, 27 Apr 2026 16:28:58 +0200
Message-ID: <20260427142901.341861-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_072939_874981_6D068284 
X-CRM114-Status: UNSURE (   8.78  )
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

The pinctrl contexts for j722s should be saved and restored during
suspend-to-ram, just like it is done for j7200 and j784s4 SoCs.

The first patch adds the ti,j7200-padconf compatible, and the next 2
patches introduce k3-j722s-mcu.dtsi and k3-j722s-wakeup.dtsi, preventing
using k3-j722s-main.dtsi for something else than main domain
peripherals.

Changes from v1:
- Add ti,j7200-padconf at SoC level instead of board level.
- create k3-j722s-mcu.dtsi and k3-j722s-wakeup.dtsi for mcu/wakeup
  domain peripherals.

- Link to v1: https://lore.kernel.org/lkml/20260420131735.3833993-1-richard.genoud@bootlin.com/

Abhash Kumar Jha (1):
  arm64: dts: ti: k3-j722s: Use ti,j7200-padconf compatible

Richard Genoud (TI) (2):
  arm64: dts: ti: k3-j722s: Add mcu domain peripherals specific to J722S
  arm64: dts: ti: k3-j722s: Add wakeup domain peripherals specific to
    J722S

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi   | 24 ++++-----------------
 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi    | 15 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi | 18 ++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi        |  2 ++
 4 files changed, 39 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731

