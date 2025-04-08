Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D5AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WSce9rbjfCgPkO0DucOcYT6D40ag2I1PC2CdQxIDyyc=; b=yYsUuWX986Dv88NDfSfj6shC9t
	t7U7TkixmIyIlI8kMsElWx+ghRekyR3ncfG1EVnTM3kgts8OFIoHiHZWAK8Pe6cyh69iV+eSi1ZLY
	9jYsINWt11rmZ/tVCRBdiDgHr+fpTDaQ7csH4T/mGuDXnlZaXENg/Ar7C46OB6spnU89cGWf3xXSF
	+1utY7APdf/66/97m6LMSeS4iLzMJ4VO7KeAnvTokrcCM6H2qDwyPt71YCl1ptxG/zXplojRTyW2j
	YXD6Jocvm1XJGEoKClq9659YYSKl/1KCZVMipHp9lkC1T6N9+Iy1iP3MFPrx1Pk4XoQd6B1+Eherz
	1jNE6TXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Fbg-00000005LuG-0yx2;
	Tue, 08 Apr 2025 20:31:40 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FZt-00000005LaP-2TDL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 20:29:50 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2122A1F9EA;
	Tue,  8 Apr 2025 22:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744144188;
	bh=WSce9rbjfCgPkO0DucOcYT6D40ag2I1PC2CdQxIDyyc=; h=From:To:Subject;
	b=t7SyU3X2J7mg9BFXd6hZWr6fMCTnxKNQMjaesJPA/Xn3owhuPT+nUy8nOS+Jufc+y
	 8MXi9S1B42cF89u9noqb9i3v887rIksxX3L+EfhFxaHEqjxBtpAPFiYpMgd8AvHkIM
	 bPcmCIW/nGlZU7vIkiTs3x6UZcxDGo0xKxk+r2JwZHvVmRk8Bwd7Eudg4I81Z1HcYI
	 PqLBVOlBMSO7d9TgowgGNUpFNPSCosdNTtuwEBJjuQTcYNASRCftPCe01MsLgzZdW1
	 9VUDNWDdDaN3dP1XECXaxGEwkQyi0oHdnUF3sPo1QuYZPeUjRGO4gqLzcaCUxcAyM1
	 uKbKAaslLeW9Q==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin: Add EEPROM compatible fallback
Date: Tue,  8 Apr 2025 22:29:37 +0200
Message-Id: <20250408202939.6887-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_132949_814627_D2DDAB89 
X-CRM114-Status: UNSURE (   5.89  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

According to the AT24 EEPROM bindings the compatible string should
contain first the actual manufacturer, and second the corresponding
atmel model.

Add the atmel compatible fallback accordingly.

Francesco Dolcini (2):
  arm64: dts: freescale: imx8mp-verdin: Add EEPROM compatible fallback
  arm64: dts: freescale: imx8mm-verdin: Add EEPROM compatible fallback

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.39.5


