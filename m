Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06814CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgKqByS2/RO1SRU9MW5M+/ddL3PnmL8qHsnqkvfLvhY=; b=RkrwAaNzExA07ltr85Wbmyix3Q
	ZC3X7aTTvbMtEwS6Am2u7BFGSJe9qjeS7tUbKy0bw+4hO+T1EatzsBwiJ/Ln3zO8RaiBtZ0cjTkhI
	xIXBbUpciHXCESwzdCOi9DPoE7W/ic0+Orbtiu2hqr3dfb0HABhszNtoaYQJyWv7+qnTuh//1qy6j
	QKeX+HAQBCY3ytt9ffpZWc4SAhjI83uo1LkwqL4PcFO0XQ9e/I0lPEmuF/hyVvroYu3aH/iQDsxEY
	ZX6gzOS/tff6QtMfsxTW/CszqbqgPDHZ+KCn3Jobfn1yCsGLlG6Igm8NCfShXSDke6mAaMltYqD0M
	N03AFnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET6D-00000004FGz-1q97;
	Thu, 30 Oct 2025 13:53:57 +0000
Received: from mx-relay94-hz2.antispameurope.com ([94.100.136.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET67-00000004FDd-3KnF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:53:53 +0000
ARC-Authentication-Results: i=1; mx-gate94-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OgKqByS2/RO1SRU9MW5M+/ddL3PnmL8qHsnqkvfLvhY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832416;
 b=T8BViKzPVDAqxmTW4RQLk0aA8ipwnAR7g4u7HqT54H9WU8IGlmmPk8iSTSzL0WB9fDlbNYVo
 eWFd2mRv37ZNvDdQvYcGLxHyt5NbwIFpH9GUXR1+OeMZgTEvBjJ1cvPyoI6yTBmLQVE6vj5vrko
 r6aJlbSsSvIQUsofxqcfIzEPyodxMnW3wB6s5EGYtETWM8YlSgXFv9Ti8sw33YzvIFfGbQUxk/z
 xD8aJBcHicw68acelUPSGkKsF5vz9Obr/vZBWBmJstYmBqx0glcc6LqJXG/AvXKK3C2b2nfvgJQ
 lHlfX0tI9rpqfk8pZgcg0kA/oeIKcM2Kn4h2uO9HnYZ0g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832416;
 b=rIo9CmrwP+IW277+U8Mu7bLriZJp+tjnfIsoQ2iU2rWD3YVJUPhYAnoqgg8qAv6LFv200H1z
 39dwwzOwui5KIEM45pQMuKh0obepnkAQ+i2UhhsVn657gjusuM7Jsk41xdWRIuQiuNfqooo5GSN
 aeK9RPPNfPFswdyEKB//78Wl351e0oPovATarEV4EXlN2OcCa+YOWEbOKFOczqbTJxdmnYvMR4L
 3OBhbS8iiuo1tHIQFPDWkS3KiUy5zATjqAwkHu7r44pl/mLLywkxGOYLbtMXi9myiMY5mDJKLod
 i0omHWVijxaLJtF4L/MyNvf3uWaadD9ULEUSlDQNoRLBA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay94-hz2.antispameurope.com;
 Thu, 30 Oct 2025 14:53:36 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 136855A07D3;
	Thu, 30 Oct 2025 14:53:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/19] arm64: dts: imx95-tqma9596sa: whitespace fixes
Date: Thu, 30 Oct 2025 14:52:56 +0100
Message-ID: <20251030135306.1421154-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay94-hz2.antispameurope.com with 4cy5DK3v73z3dGQg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 783d95388d58bfc72f1c3cb0f6f3ac9e
X-cloud-security: scantime:1.915
DKIM-Signature: a=rsa-sha256;
 bh=OgKqByS2/RO1SRU9MW5M+/ddL3PnmL8qHsnqkvfLvhY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832416; v=1;
 b=mKhtroh9WXJMsM203xAYoqNbmDMrjNJR3VR8aaepXF1oVe1XqtO1tyrphRbxOwRKojgZilf6
 F62U9lG35BU/NvffuX0c2xEZiJEfcdLyQSrE2g1p2u31NrNqQdHQvJjocs2VknO7PNKCXwMiAii
 4irHPnhoEVOJgXFYyrqUElTpqaPy35j9z3z0Yswv0O8jPHdmxn21hDXN5wl4sOfcH1+sk9WlJwY
 spN8nO3perwJC/iUOEcutNXwUzAdUoas4GggR4+hzkqYe1hC1N+ScuFcubzc91l28XDbjFp3QpY
 r4oSsbZrT/5qRX9JaVS9DxKbtOgLJcm3mQFRHsybyv3jQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065351_985159_1F6F82B7 
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

Use tabs instead of spaces for indentation.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 9c892cd8ff215..a4c6083ab43b1 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -621,8 +621,8 @@ pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
 	};
 
 	pinctrl_lpi2c4: lpi2c4grp {
-		fsl,pins = <IMX95_PAD_GPIO_IO30__LPI2C4_SDA             0x4000191e>,
-			   <IMX95_PAD_GPIO_IO31__LPI2C4_SCL             0x4000191e>;
+		fsl,pins = <IMX95_PAD_GPIO_IO30__LPI2C4_SDA		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO31__LPI2C4_SCL		0x4000191e>;
 	};
 
 	pinctrl_lpi2c4_gpio: lpi2c4-gpiogrp {
@@ -631,8 +631,8 @@ pinctrl_lpi2c4_gpio: lpi2c4-gpiogrp {
 	};
 
 	pinctrl_lpi2c6: lpi2c6grp {
-		fsl,pins = <IMX95_PAD_GPIO_IO02__LPI2C6_SDA             0x4000191e>,
-			   <IMX95_PAD_GPIO_IO03__LPI2C6_SCL             0x4000191e>;
+		fsl,pins = <IMX95_PAD_GPIO_IO02__LPI2C6_SDA		0x4000191e>,
+			   <IMX95_PAD_GPIO_IO03__LPI2C6_SCL		0x4000191e>;
 	};
 
 	pinctrl_lpi2c6_gpio: lpi2c6-gpiogrp {
-- 
2.43.0


