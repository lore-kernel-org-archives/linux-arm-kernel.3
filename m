Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30920CA5FDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBvSWJey5DYABgnbVHURMRWOEVtheIo6pFXgiypB5gE=; b=MO5crWiI7K3k8he97eW/rWVZ+X
	czgo2tqUk7nhlmTcvBYrXn+eiiF1rqEwtMR2yhg10ZskBPuZXXn2le0JVABBpLCNoKj/lNnjj9BcG
	jqB02PyTskZCHzdkB0XHpSKASNWWFfkBUyOsv0i9za65uEHf3lQwjoWSLQcO2IEoy0HYKTZFLkzHV
	v7naIHgMkDN2zqTHdtGUhnaFF3mYmE8EuoPtHbZ9oveCQ+EjfvqZspfNujqI18YygBcwYavXSuQ5Q
	10d8LE42Ei8yaIuzfHVTiCM7uqiSYViChTXv0J2D4RinY/YJt2d0SH+QN/YPGxm4y9+4S+cgIpN9d
	GuQ/Z3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuh-00000009u9K-0DKr;
	Thu, 01 Oct 2026 17:49:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKub-00000009u4S-2L9r
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 17:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bBvSWJey5DYABgnbVHURMRWOEVtheIo6pFXgiypB5gE=; b=m06Kh0MJI6xhFBzB6pKvZf8LM7
	EEJfK20pZ56KqDkx2s0+rTzJba4DdJS2t5ch4NNT4YUkOp+8TjW/PqW6u7MPlxbltKuQ/3c4JLhS1
	bT/EDaEjndu/ulsPIhAvxIwi6PevcJENuv0B4dzsRhmLU6RWWlnEtxUYx7s3h1wxCETJG908AoQXD
	mSe1YKE9RNzqtQ51EthlrdX5LOcuWwSwNJ4s0yP/OyKQp9cYvw6P8NkuzqDsaIgkWdO9OunfnqfZ7
	THbbB0lY5HXIoYfC7vQzmJW9AthonfO/50VbfkPGFK7sAfsfFNdmAS/Lvi280p6p/yIJv5ZWYF/aX
	20c+acJA==;
Received: from mail11.truemail.it ([217.194.8.81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCKuY-00000005GoS-17X0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:49:40 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 03BCD20020;
	Thu,  1 Oct 2026 19:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876973;
	bh=bBvSWJey5DYABgnbVHURMRWOEVtheIo6pFXgiypB5gE=; h=From:To:Subject;
	b=F9QEaVCP9SxNaJnZH0uXy9kvp+MlCdhueQhQzBqhTwpFk1l/r7I7w4jpD1412VwaS
	 YCGVNFdu/4nwjjgyufFAGLSc0Bl5TIjsB/7NBxv2t2nDABfHxY3knP2YTbCzs5ZHSN
	 ytlpVQVexn4W12dM+J7i+6j9bolmyQ267L+oCkEBXwOTkLIV1mIMEmlFesZYySaJWb
	 DIH7RnxVMFEbM5/cbO4i2sxQUAB9B/TqSpdu0S/f36O0MduzYCjFK4YErJ8h5qRzRy
	 e/QUq/taq+Nw8T2vkwojz9KqhFB9PGMeBGYuBQYaP7my70J0Zl2v1B39/9PK10YpR1
	 HWS2+iJjvshyg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] ARM: dts: imx6ull-colibri: Align backlight brightness levels with Colibri iMX7
Date: Thu,  1 Oct 2026 19:49:12 +0200
Message-ID: <20261001174924.3831455-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_184938_705823_9AAA945F 
X-CRM114-Status: GOOD (  12.03  )
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

The LED driver of the Toradex 7" parallel displays turns the backlight
off below roughly 15% PWM duty cycle, with the current brightness levels
only the three highest ones produce a visible image.

Use the same brightness levels as on the Colibri iMX7, which is used with
the same displays, keeping the default brightness at about the same
value.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index ec3c1e7301f4..c2f8fd195041 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -14,8 +14,8 @@ aliases {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
 		enable-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_bl_on>;
-- 
2.47.3


