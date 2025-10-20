Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B6CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iMew/cU0hjBoxwBz0iB+7LijsCZyiMyr5SL5xMs8+vU=; b=ecwg+HTj8EeAy33szUcEWlYx8z
	pPjbXOJTvpncSZ6yf/A1t//3p1TZ1LO9cIJO26BsyoqNq1Pv+U0n3KixCqvemztaw8x8DbSZp1147
	WqtGXmfjaDNo7gtNm3NkkJ/iP0ynU5aIefKNFt0vB2FsaiptmhOTtEeoVP9NAguPlDC6LmEyKdabu
	OXofRZjHsbTMQNk0J8jAcJ1mhc697svKqKB3+9XLzXMOb2BdExNw2d4hW1vQIi0s/SDZXXJF+vCFu
	Z1IwnmcUKTNusNRfhIhcRxM0YAeFmhcGJseFvk6N4u9mWWrlO6GAGNUshSeqD9pxf6h716tqsOJL+
	4+LnX0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAq5a-0000000Dol5-0tIr;
	Mon, 20 Oct 2025 13:38:18 +0000
Received: from mx-relay19-hz2.antispameurope.com ([83.246.65.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAq5Y-0000000DokY-1WhT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 13:38:17 +0000
ARC-Authentication-Results: i=1; mx-gate19-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=iMew/cU0hjBoxwBz0iB+7LijsCZyiMyr5SL5xMs8+vU=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760967487;
 b=Gxxo0Zj5Gf9/6eleM3318EzSWLqeER2jYKuOAYmYH7Lr14B+VHZPGx1nzcnBakFnc0gJp6Or
 /Uh1B+4DC+JWDjqXyjb1p7ZeKxXg+FjVVn5LSSydqNe4OKYI3XJB72jZ70Y6fFlG+Y1Uehu1VbT
 Hw1dZdvaI74/LK6XmBR/rKgsDTzzYDJqr5AeAElpEcs+o9Ck5CuTgZdopqnIEhfCw57D5xO1qTZ
 5WfCr3Ql3eG4ta4zGXD34zHHWgHW88lQZ6h7L+lIhv2PLpH8ySHpSuwo5WVMWxnMnBe/9b1YzAj
 fukYDzB2JI9aEbo2I32uabgMrv8SU2ssMt70mKAuGiOZA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760967487;
 b=e42kWNWcD3UarZF8SkQoh3AwGwdBb3QNT6cs03nc0Z0j9wkiNmZgrqWts9417+5iQHNYN3NN
 UmCRCdoNCGLs2ThDzNnsfAxUbxD8AULa3N9VRdTzxWKCvU4n53yQbXDd2QuFobA9tf+plKUgEol
 jcpIMdgAlAOE3xnNjz3kML9pZkuU/gDEJU1dgH8SJ73DJurO61vu4xFY6vLZHseVzQqyVh7FqJr
 4ZuVL711qh6iq2Ife1MDzRHAfSe6XJkacPU2gJAHNKbA7sQiQtxskMOzIK8lKl6GoghGD3h3W5/
 xUFc02e4uFnD1kbZVSHfzsWUn+EldIyM/6cYAiQpDLOXw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay19-hz2.antispameurope.com;
 Mon, 20 Oct 2025 15:38:07 +0200
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 325B1220C57;
	Mon, 20 Oct 2025 15:37:56 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: fsl-ls1028a: fix USB node compatible
Date: Mon, 20 Oct 2025 15:37:53 +0200
Message-ID: <20251020133754.304387-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay19-hz2.antispameurope.com with 4cqxM85HsCz2Gk5X
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: a9ced658393900b1efa503262e27cae1
X-cloud-security: scantime:2.178
DKIM-Signature: a=rsa-sha256;
 bh=iMew/cU0hjBoxwBz0iB+7LijsCZyiMyr5SL5xMs8+vU=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760967486; v=1;
 b=EFuVdqMXmtCCu+5IBy/Vc+w15h5TEHIJ8l5YsJFOSbuXfl6oxg9eWkyTPj5EqHtpvE3mWK68
 lW2QX8/7ZXEZ8dw1YuLeI2MWqAlqLovAMmAWrJimxpIWIpnaureTJVaTgR1a61J8omzWdAJc9WM
 aSvSdD5/pb+pwWeqc8tnW5NIc32r+edthIDXPLf/SbrjzDAP7IHiEu7hHd14BD2MMvQpNj32YK+
 AI1SpzWbH61sHdYio+5Fda/N7BrZIWQ3Up1I9qelVd9runfkH9ro2NzshllkWsPTpUA9hhsG/2m
 FgWNe/slrHuRPIhGL0efrCKeOQmhRiJcQLYmco0zRSWkA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_063816_548610_66E6F27A 
X-CRM114-Status: GOOD (  11.79  )
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

usb/fsl,ls1028a.yaml says the compatible is just a simple
'fsl,ls1028a-dwc3'

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 7d172d7e5737c..ddfb007dda920 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -613,7 +613,7 @@ gpio3: gpio@2320000 {
 		};
 
 		usb0: usb@3100000 {
-			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
+			compatible = "fsl,ls1028a-dwc3";
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			snps,dis_rxdet_inp3_quirk;
@@ -623,7 +623,7 @@ usb0: usb@3100000 {
 		};
 
 		usb1: usb@3110000 {
-			compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
+			compatible = "fsl,ls1028a-dwc3";
 			reg = <0x0 0x3110000 0x0 0x10000>;
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 			snps,dis_rxdet_inp3_quirk;
-- 
2.43.0


