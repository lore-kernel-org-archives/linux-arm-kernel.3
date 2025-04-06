Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769E9C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ouSo7FlRFCn9kPXMwokD5Qs7NISOOu4zypPQBTuY4SI=; b=ALQ+pvUD4x77FtSDI/PJChtcQl
	T3q5qRZXa+N2AkBORsfoWxqaadicXqg5SdEjssvui4sUFfX2EOnlod/3D14s7yBPuJyfEzFUvdxM1
	LESoU3qTQjdtcZz0Tb3FybYZsz5/c4K5ezZt6t2XSDnRgceMve0AQzWAI/cKO4Way4mt+3WLXWU6f
	iH7oIIb7Zldf0wNbYXB34FiYlKhXWP8wMcu4C+GrH4suuwRompmqw0MWe7Shqf/oyJE9ftOFl0P49
	lWe2IZf8+1yyqAMVN9WpATtnbk/lVKsvH0exAfw8g3CCf1snTGzLu4am1TKgwx9oy5TtBdH+3yexU
	LNa6DtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RKs-0000000FRnL-2sFs;
	Sun, 06 Apr 2025 14:50:58 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RJ8-0000000FRUr-0lGI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 14:49:11 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZVwG64vF5z9tLv;
	Sun,  6 Apr 2025 16:49:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ouSo7FlRFCn9kPXMwokD5Qs7NISOOu4zypPQBTuY4SI=;
	b=En8A0ggUjT68sKruXxIgdm+Wz8dunHe0VfBFuXmWyLucfLQ+4d460RH9NVBkGAmF0ss6x/
	SA8b//Pq0IqtceVtV5pdZmPf3YL8GydKDOnAjq81ABbJJnbpIdvqpWS+ExknfFEaY+B3m+
	WxWbUnRY1/9YrfTfrnLMOWSN1ujPUOJ/rLu5sz3aHHLJWpAcvCPCAxK3hCyl2wilfSuU8E
	dVfbxdK2Q9j+WK8YGNamEe8O3ZFt+aqBtGdgdqZCMTQoRhoF0BgC1drcBIJXgTmXhq40GR
	3ir2rbk5dpSMdIJbEamfI4LkADhP+X3TjjVgdJIw2IQClVB9euPG66ncdbb2Dg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ouSo7FlRFCn9kPXMwokD5Qs7NISOOu4zypPQBTuY4SI=;
	b=jq/4MFd9ypv83vVVduk1mXXb3uryRPKi9/b5jFpbp9qkvPYXxnytlXwldOu5il0GNzKFtl
	ZzTxuhT/1jYuFbfD4n6Peg6EgZxnskuW5rwvAC+GsDsbk8Rc9iSZbJYEPwRq+O6WDj8Cb0
	7M4+aICSNYep3EF1I8WMlG/7V3gvqWO3HPxD9QF4kzTj0WyMZG/vOd8hlC+Obr4ShvdCAD
	88msxmiX6dzBPR1Ru0mCH7t7k00UBQ13SXLIPCr3LFvznC08U7cR355Q5py8mcNN57pZ8H
	7F+Q3mT0JomFWGHlzZTf3e88CwLB50sswgwFeDuCr71NXCCEheVlnSovwLc6Rg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support
Date: Sun,  6 Apr 2025 16:45:20 +0200
Message-ID: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: x5etaarnsacp4g3atghkao78dekbpsoz
X-MBO-RS-ID: cce39108303713c226b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_074910_403267_577A232E 
X-CRM114-Status: UNSURE (   9.04  )
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

Add Retronix R-Car V4H Sparrow Hawk board based on Renesas R-Car V4H ES3.0
(R8A779G3) SoC. This is a single-board computer with single gigabit ethernet,
DSI-to-eDP bridge, DSI and two CSI2 interfaces, audio codec, two CANFD ports,
micro SD card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe SSD,
debug UART and JTAG.

The board uses split clock for PCIe controller and device, which requires
slight extension of rcar-gen4-pci-host.yaml DT schema, to cover this kind
of description. The DWC PCIe controller driver already supports this mode
of clock operation, hence no driver change is needed.

Marek Vasut (4):
  dt-bindings: PCI: rcar-gen4-pci-host: Document optional aux clock
  dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
  dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk
    board support
  arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk
    board support

 .../bindings/pci/rcar-gen4-pci-host.yaml      |   9 +-
 .../bindings/soc/renesas/renesas.yaml         |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/renesas/Makefile          |   4 +
 .../r8a779g3-sparrow-hawk-fan-pwm.dtso        |  43 ++
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 685 ++++++++++++++++++
 6 files changed, 747 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts

---
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: "Rafał Miłecki" <rafal@milecki.pl>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Junhao Xie <bigfoot@classfun.cn>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.47.2


