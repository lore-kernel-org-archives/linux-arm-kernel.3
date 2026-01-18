Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D36C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jtJ0JHkBONXN8QFPUokfERKmqgzusHvWZDDChLmbMm8=; b=P3V91oBCpp++FPXgW5Ef7PJ8zs
	1sFLVkefCNjVyLJzBRIuWDnem2cjfnXD/9gTPIQLugAb4343QHY9DTXWowPiSjBkU6gPYMcT4c745
	9qRNr62kxRDEcn0MfvxPDEnHZZihoAFxLnVcvG6cT55xNdd47G5bmyFATZhzY1mZrz2yrdW/oX4pN
	LriUOEdIhAJ/635Sg8cBL0N5npueRFpTBWJRnM1mzglB+qpm4JlkUrNbBosg7sz67p7Mpj9ogDLjz
	JXLaYztPqwnocDql170YnGfesD/KlbCe9Ay2hzGwDkrVHSAfatqnL/lwFF7mLVlIKXEfa4+Z8Sk5J
	dxIDeOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBf-000000009Nj-2HC1;
	Sun, 18 Jan 2026 13:51:28 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBZ-000000009KY-0a8z;
	Sun, 18 Jan 2026 13:51:22 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dvFNx6R4xz9thH;
	Sun, 18 Jan 2026 14:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtJ0JHkBONXN8QFPUokfERKmqgzusHvWZDDChLmbMm8=;
	b=LG/UH7x7IzsqbvD5MbwNTy1O/ghryF3obqHx1GvSzllD43dOamqzVxEkU35cqW2MJYgY0H
	IfVj6oBjWfViXgAJITuzM574P/q+Odq1rzrlKLhiQI1XeYC0u0ZdGiJAjjYHNXewuW3+3J
	XXYw39pGvec5e1ty6ldEPivJV0LL2ik6lVAVwHH2oHTwX7umRCA1LzDK1TrLvK60gbzBqN
	MHn4+CjIicFcvrFru0IOi6R0rEcaPAPweX1HgivcJ54TbOlCrYJA1RsRGDOMQnx/s5+Se8
	qPxZPIONwaWRRvwSyNAt5ECKz/xI/PGzd/ctOPKGIiJFgfuEad0yWIap5ix1XA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wx9SJXwH;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtJ0JHkBONXN8QFPUokfERKmqgzusHvWZDDChLmbMm8=;
	b=wx9SJXwHPUrYm7huy1+FQ3XdlH3yeE2gGXkdsgEtDUgda8Sior5juch57dY65xrPo0lufG
	7/YZ45pQy8PmOBVo2btZpV4dFPYBCgeBG1Hke4TyBMfDVnAf80rA7rDiTdws5+KplERruv
	QD3/upfIwzYc93ay4VOpz0kuefVHxYHzDPEtRfE+sNjU642AOZn3+WqJIXmQo1gqvZyEHz
	fIniWPVcSLHvq1RXPq4yldDmBOCLSHGdyrZYGFayxM0rSfTspH91sq1JWAB1nu+RwffxHe
	aHfIOgd3f0eO5vmXCCh6JBshuxonxUBEv4OoIxxMd8tYUneJJLN7jpo0tSM3Qw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/9] Describe PCIe/USB3.0 clock generator on R-Car Gen3
Date: Sun, 18 Jan 2026 14:49:48 +0100
Message-ID: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: aeaf430141668aae5a9
X-MBO-RS-META: z7y9zyqpix9wcqxp6nkri4jzedid9w9z
X-Rspamd-Queue-Id: 4dvFNx6R4xz9thH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_055121_379254_C3704CED 
X-CRM114-Status: UNSURE (   9.47  )
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

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on
various R-Car Gen3 boards. The clock generator supplies 100 MHz
differential clock for PCIe ports, USB 3.0 PHY and SATA.

The series effectively has three parts. The first part is description
of PCIe root ports on R-Car Gen3 SoCs where applicable, in this case
that is H3/M3W/M3N/E3. The root port is used with PCIe port power
control to also control the PCIe port clock. This is needed on Gen3
boards, because they often use separate clock output from the PCIe
clock generator 9FGV0841 to supply clock to the controller and to the
PCIe port.

The second part is a single patch, which fills in the missing USB 3.0
PHY on R-Car E3 as usb-nop-xceiv, thus aligning the R-Car E3 USB 3.0
support with the rest of the Gen3 SoCs.

The third part is enablement of the 9FGV0841 PCIe clock controller on
the R-Car Salvator-X/XS, ULCB and Ebisu boards. The boards use the
PCIe clock controller outputs in a slightly different manner, all use
the outputs to supply PCIe controllers and slots, as well as USB 3.0
SuperSpeed PHY. The ULCB board also uses the 9FGV0841 to supply SATA
IP, but this is not yet described in DT, therefore it is also not part
of this series.

DEPENDS: https://lore.kernel.org/linux-clk/20260118025756.96377-1-marek.vasut+renesas@mailbox.org/

Marek Vasut (9):
  arm64: dts: renesas: r8a77951: Describe PCIe root ports
  arm64: dts: renesas: r8a77960: Describe PCIe root ports
  arm64: dts: renesas: r8a77961: Describe PCIe root ports
  arm64: dts: renesas: r8a77965: Describe PCIe root ports
  arm64: dts: renesas: r8a77990: Describe PCIe root port
  arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
  arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock
    generator
  arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock
    generator
  arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator

 arch/arm64/boot/dts/renesas/ebisu.dtsi        | 43 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 20 +++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     | 27 ++++++++++++
 .../boot/dts/renesas/salvator-common.dtsi     | 26 +++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      | 21 +++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         | 13 ++++++
 9 files changed, 210 insertions(+)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.51.0


