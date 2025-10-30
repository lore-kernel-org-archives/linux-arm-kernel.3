Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7660BCCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7CHMivira0x/FyH+Ow1E9d8fqnubbrxUxidvJeHW7o=; b=YNO8CN8K/EUzVxf0NXjLJCGL+d
	abKMijaZYHYeRUvDGsCdsqWaiDvM5Kr5PkAPBT0Yy0wBh6qT6NKVLpBjQRlwVG4eTmE+HOJFoVJ4J
	26MqWau1N4fE/toPgEELPjYGxDNVlJ/hOiokSyvu81l73K5g91b/6dZt570GM+nvi3+7cLilAjSb0
	sF+3UZCBqPVkucN5J9GpoCPYVtzrdcqQdD0Rdu2SMKWfpRETf0vdqHLOWUXGdmPEIYPrP3jiC8ffn
	TcUFvQUSmt1oz5MQhkFZTzcFzP3BouYiftpfIP6urnmhZiPvtY8qBh1AhqPrwTF5e3svZfwJBJtYj
	0bek45dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6i-0000000494t-0vwH;
	Thu, 30 Oct 2025 12:50:24 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6b-0000000492O-3XoU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:19 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k7CHMivira0x/FyH+Ow1E9d8fqnubbrxUxidvJeHW7o=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828606;
 b=qBXuCj9R2hPDu6kHEgvmtF7coD5JaKAg0ZMnMR69C/28w370wWT5fzouZQlw1Og2P/tG/5+r
 3tbuoMrjDR00ydmrlfl2aB0bUUqZcC0e/KChS0LOegwkIO0936xb+cVMF3DduZ861R76kxW5unp
 ZFuwvisI+OvM9Dy49FuKf2JFguXkpJ7yGu03KBfvTpPTsIFYDWlZLiC8JqVzY+qs5di8Kd4ySlA
 k5kTIFX/t3pJ1Fnvg4TTftLN19M8T86noqOT4e1chtr2LQq/YwDjDDMWq1gjlKXURj/+aPb3wpO
 Ce/dvCirQ2dFH0PThs3rtWPDVPr8iowb5s6dBE8GZH7AQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828606;
 b=OwqJS0W5r0owt7VhS4oxBKcIN5GMvbLQoOJVBU1IcIZIkRBqvPu9Y0IsxAM4axbrkiudmnco
 95ewi29pJ8tTmtyn5EcQQ04MZBziSUh7IeM1fQnosAN6MTU7KR8I8c2IY7OayF5vZyfLWrmwmqG
 oI/QT2asyphsdEIYx/StrOFmMNI0O7eaBvtbvXtZsq4wpwhIDqD8NBiBmrJWorNRzKNno2EXZ2l
 0cJMB010f0VUKvUpz54yNlI/TjqwPM9Jr1N1M+RMrStZK8jzynNkt9hjIjSPoxDYzEZMHFULRiS
 60/4Md0KtOK9ueoaUkwaZKP2I4YHotQHOu563fzJ8cCmA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:06 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6035B220CC1;
	Thu, 30 Oct 2025 13:49:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/19] arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name
Date: Thu, 30 Oct 2025 13:49:08 +0100
Message-ID: <20251030124936.1408152-2-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4cy3q40Wp6z2nHFG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: c734b9e42def97ec10e90bed4c62542d
X-cloud-security: scantime:1.998
DKIM-Signature: a=rsa-sha256;
 bh=k7CHMivira0x/FyH+Ow1E9d8fqnubbrxUxidvJeHW7o=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828606; v=1;
 b=EbQDst5w2/285z++P/VOHKWgdks8nrEQqOqFCCDsjzNVCu513SD9CJUVYxB64uxJu6h3C0JO
 a9OjsdC8GUHhuRySRtZngkJDSd6IHsxNWYRXNLoS9DGZqR3VCqxgMs5y+dvn9P7BcDrJQ+VcWXd
 DTiFs3aDRYNGOIatcSsNnzKi5QVC7yYrAWfnW9fU/kIpl3spwThFGivj9A7nOLp/1XIfzXOWfB9
 ToCuth93K1OQNzgLEVXykrEFP2yiRi4WwHp+jJOj4mvS5XJZHWOE86Bi5YMHfbzd4mBK/UmUhh5
 qL+ztvhjKTc5KvoipqGBqwdQLRkOTMumLFQ+yZIgf/B8A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055018_027908_027D404C 
X-CRM114-Status: GOOD (  12.30  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

tpm4grp will be overwritten. Fix node name

Fixes: d2c4d71b6cde ("arm64: dt: imx95: Add TQMa95xxSA")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 180124cc5bce1..c3bb61ea67961 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -617,7 +617,7 @@ pinctrl_tpm4: tpm4grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO05__TPM4_CH0			0x51e>;
 	};
 
-	pinctrl_tpm5: tpm4grp {
+	pinctrl_tpm5: tpm5grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO06__TPM5_CH0			0x51e>;
 	};
 
-- 
2.43.0


