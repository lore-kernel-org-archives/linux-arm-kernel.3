Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362E8C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=15iHJagiYHAlmG3scyQwBZ0nHkV94osZRqbySnuXxIw=; b=jXijcDfKLtbgoW026CwNcjngWT
	J+dfC7Ut5HmBm89NY9i3k8r6spF4Dn/MaEaaUmRoVVpqmURXVoyzCKSv1WMMuMr7ZD3+l4C/LJt+B
	7KD6o6xAdqKnRBwBdyBYosG8zyDgn4q5HumPOjYGuAzPkj1H43CblXn1IrwmuiAeTOHSn+I9rYA2r
	P24QjkzD9XvtPiKl/kCy0FWKTJfkOO5KOsXnqaS9u/xwBXGRMdA08shJYlzyd6SrjC7cJGW3ke0Sp
	c9Q108G3m9hqxQKxIY/gZ1SKILv2S2qNOWGzmpQrMUS3tV508PDxvo/gPw3FthAaN4f9jRCAa9mBZ
	oK5E5SjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Md-0000000BU7V-3XKG;
	Fri, 28 Feb 2025 15:33:23 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to23t-0000000BPif-29JC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:14:04 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 372A61F843;
	Fri, 28 Feb 2025 16:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1740755638;
	bh=15iHJagiYHAlmG3scyQwBZ0nHkV94osZRqbySnuXxIw=; h=From:To:Subject;
	b=RHhemupfNu7Fhr2FgTRs/CaWgDNxP+tLaWODFgYN5hZ10SljFGsBs7xCj4/J6ubOY
	 RB8PlU6hyGq5OyMamLbbeNBLKBei5V7/NCV55TFr4gjHXY5AiuSoTqSfa5mQIvbiCs
	 MU0mWxwm/twOfByDokymDLNPizOADcBr579hJa0QYw87rl+kh8Vs0WxicMI7naxeol
	 VmR91noKEpPqksfS46VwbugAM5JE4sD/SNP6cPl9M/zOxn0GfZXvn9zG6sKWLNBZEe
	 6wuy0qkqRMyK727DPvNUeVVB2QUeOd5Jio3hs7FgdOsopV7n+mJdIW1HV+XjxjlYAZ
	 JGsMUQMfoZWKQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] arm: fsl: drop usage of Toradex SOMs compatible alone
Date: Fri, 28 Feb 2025 16:13:48 +0100
Message-Id: <20250228151352.91768-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_071402_166452_A9367072 
X-CRM114-Status: UNSURE (   6.64  )
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

The Toradex SOMs cannot be used alone without a carrier board, so drop
the usage of its compatible alone.

Francesco Dolcini (4):
  dt-bindings: arm: fsl: drop usage of Toradex SOMs compatible alone
  ARM: dts: imx6qdl-apalis/colibri: Remove compatible from SoM dtsi
  arm64: dts: imx8qm-apalis: Remove compatible from SoM dtsi
  ARM: dts: vf610-colibri: Remove compatible from SoM dtsi

 Documentation/devicetree/bindings/arm/fsl.yaml   | 16 ----------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi    |  1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi   |  1 -
 arch/arm/boot/dts/nxp/vf/vf610-colibri.dtsi      |  1 -
 .../boot/dts/freescale/imx8qm-apalis-v1.1.dtsi   |  2 --
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi |  2 --
 6 files changed, 23 deletions(-)

-- 
2.39.5


