Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59190C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lx02G64ppy0lrZvVfG9pprG+9x/MBOLftogqYbGMsNU=; b=TqynNFXhuUbFlIUyBFUwFMC/Bp
	1qLEsUns8FLmVID5CuB9r1eVJNjI+cXtSG86vfvyua/PNuSyszzOSNkpMcgmKdt+9bPNmLz+Om4TY
	X3fG2dqYWPlxf9Ww1mNJc30K3io5z7vMtCM5IDgh/ep1Kz25VRiSYav+9aBEr5AudTNuPLqyuaDO4
	N2FTV4zdYMOYny79LG87tM3UKQsXiooI3+upPJY+zjeR/vfBFaaBGhA3a/yTArGi5SHMxJUb19TYV
	NGGzi2VIyutwYEMngTYI7O5l+SB4QuDQXkSjbF78WLddgDY0zVz5EnSm0LHNTHaP8wsGbY/JTOG/w
	jzJkNNDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4Sa-0000000CUiP-3OMh;
	Wed, 30 Apr 2025 10:14:36 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3x4-0000000CPK9-2UbA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:42:03 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C45121FC78;
	Wed, 30 Apr 2025 11:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006121;
	bh=Lx02G64ppy0lrZvVfG9pprG+9x/MBOLftogqYbGMsNU=; h=From:To:Subject;
	b=KXMc4JonHkbvrSI3vKjMUrbKqsdlwC7PlEQMhbgpLObXrXcVA9HDk16ZIrg/F1B1P
	 7RgrpKefrn+HcSK1v9Z9ZyJImbNdicIEfA48nXWyGnMzj4fsq+d1BiNje3qywywo7D
	 4ANPDFus5TjRFex8OYWgqvKX6IdAPy76Wr3pR0gGLzEwmhSJgR4Uk8IwY7KGhnAD/v
	 aKJkJRlVEgyCeVDvYc2SXJ9r+NidlEoJ6P/qdpyAQ/laFAA+keACbh0TJaxUxQgOFu
	 oG+ozv1JyiW6AKdmgqIW3PyY+mzN1Mcs4AS9j9pFQ9XyAHbTDzHQE6DH9+UDQJSYw7
	 fe7NpgnSoQoZA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx8mp-toradex-smarc: use generic gpio node name
Date: Wed, 30 Apr 2025 11:41:50 +0200
Message-Id: <20250430094151.98079-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
References: <20250430094151.98079-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_024202_785886_EC1F047E 
X-CRM114-Status: UNSURE (   9.46  )
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

Use generic node name for the SoM GPIO expander, following the
Devicetree Specification generic node names recommendation.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: new patch
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 0cd04c3c96bb..22f6daabdb90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -434,7 +434,7 @@ &i2c1 {
 	single-master;
 	status = "okay";
 
-	som_gpio_expander: gpio-expander@21 {
+	som_gpio_expander: gpio@21 {
 		compatible = "nxp,pcal6408";
 		reg = <0x21>;
 		pinctrl-names = "default";
-- 
2.39.5


