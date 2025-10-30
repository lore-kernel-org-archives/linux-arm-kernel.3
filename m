Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D02DCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orpjfmaMqp/ep6TopDZ6qss0KQr8oMJ5sbynNFItMqc=; b=ZSGiLQFtgKddK4mET4BSt2IdV2
	jy5bkKxkEh8UKdeNiAii+zqKTfCKviVw80C6wthjs2FtHrw1TE0g/SrLIsGy/SIRJk88VyAXbtCRH
	e6AoinBEyoybYncSY+WJ9TwMzkYnBsN8/oP/PxZowus6apAGjae70e5oYpwlkrC8Km3otyI/uW9oG
	a/VqWsGi+tPSqocd/v9kE3XkE7qIGlQGBZniK29iNne+lWiwZyyfBxUFV4XaQ6TaZuT9jNrh4Kokn
	lH/zbk6dyFr2xuHQkUyWbof2d1oZQAbprSLifo8vk273R8uU+7yhoFVa5xVeuK1M8NHZrdH/zRPXh
	3hgUmV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6v-000000049FD-1Jsl;
	Thu, 30 Oct 2025 12:50:37 +0000
Received: from mx-relay32-hz1.antispameurope.com ([94.100.133.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6m-0000000497A-06oS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:29 +0000
ARC-Authentication-Results: i=1; mx-gate32-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=orpjfmaMqp/ep6TopDZ6qss0KQr8oMJ5sbynNFItMqc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828617;
 b=k3vHv0ayBVBaV3ezlC0LeAX8bMUVCRlJ66Mnlubk/mMfHWN8uoV0JWUIRwaoUxWJc8S0m5Uf
 Ixy4uwBHbJkf26QgDSvzlhbeuxtXyfJllgmip4h23kNIkXxwzrPINuvb1BY4l0YUnQ0RXTo3vr9
 TjpceMM11/nAEDaKAnloQU/0DmNicAZgPHFiZ3szg+rfRBFGZ4fAYzmvbswXlPYDBWbj8NoKIj7
 qkUj/g051+csqCa2Kc5JnzyotqA/vMbjkdDk4IQPL7e5Fj+e+DabjSIpF81Yn221risv4bKhsPa
 EJy7IuLJdGXSWsWwTwV0YWIyR7BTf8E68Qh1B7KCNUw/w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828617;
 b=Prit7ZDFFrGon8WY1tXZq6MoN+BY144S8jUwR3wPMGqLGvdZ9N0zhAnzO1UFwZki1tXdPHXH
 FVCPnFbtod2c1t1NibL7BUmztWsbugf+VFSyXBL8zOAcPTdQaUwsFRvcpwi6cQ1RW7gT+vrs/3B
 o1eQ691Fv1plVDywgThQzrNsjQaf68BdIqa9cq/GvT5v+ZuCm9z1J8Xilpi9IBfiiaK0978N+y3
 ebYs7ZnaiURtBJ5o/coRsT2eSoOEe3h9kCcflrHgm/lYwbMIvGuo2vBrR8UeDaQ/1YbiEfgks3g
 qshpslRMa2xaUWFCuYZRgY5xCXpChOPHpIoS+SUjGdojA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay32-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:16 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id CFE28220C62;
	Thu, 30 Oct 2025 13:50:02 +0100 (CET)
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
Subject: [PATCH 10/19] arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for flexspi
Date: Thu, 30 Oct 2025 13:49:17 +0100
Message-ID: <20251030124936.1408152-11-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay32-hz1.antispameurope.com with 4cy3qH419Jz8stG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 201a609ca4cd8de84ce042f2b20575b7
X-cloud-security: scantime:1.813
DKIM-Signature: a=rsa-sha256;
 bh=orpjfmaMqp/ep6TopDZ6qss0KQr8oMJ5sbynNFItMqc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828616; v=1;
 b=JOpfV3r8Ojf4iYI3OH2w8tU0etqBpcJXMv08xmxD1aRYpRVjtx60elWAoCL19LAP0WbDdSWS
 XnhnYgQ4FanUQ0lQqcPqeduV09yq8aMeyeSgOpz5GH2PAEtnGKZJov46S0DIyzIOB+c7c+qHYib
 Kh80/ZQEz4Q3uWhCi3X9TArzeYxdooIO44gm1gk4lDGKYZ0b90cDR7QqIzRpQ5VrRuAEX456Rc6
 9oPIoKOsF7+T01cTogVD+EcbiFBuYs0JBHKfN1eIvO33hammIHADQhueQH4f3GN2MH28ndf5xfY
 sn5Zy6LMLJ15WEVwmduyp+V6veuSHDxvEr9KxE1196k5A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055028_223091_31BEDDA6 
X-CRM114-Status: GOOD (  12.88  )
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

A sleep pin mux is not useful if it is the same as the normal pin mux.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 36da8ff8d1835..b7136982700a9 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -117,9 +117,8 @@ &flexcan3 {
 };
 
 &flexspi1 {
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi1>;
-	pinctrl-1 = <&pinctrl_flexspi1>;
 	status = "okay";
 
 	flash0: flash@0 {
-- 
2.43.0


