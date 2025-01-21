Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA50C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vlr5cUwPRRPdmdrxfHfnoxx2HdPSWBufIchZ2vqklZk=; b=n5OmQvrWrPbQTYC0YApL+IV8G6
	/DzDzxgQfPub32HBQg+ByGd69qBAn5F3xkYnSZwmJOuhjw/RfEmbPDAjswXk5nySZQtaMS9HLgyQo
	7dQH4eauxYcJMizfKDDTuk38Ko+8Zk93OR7eBOmYcGMajS79IHn60AmfZE18oVziF65V64ezhJwHW
	mQbj1PSl/nxrsxe6P/4qVkYo91LI+9s45CVSgPy0wiW4hxLHHw5oSPB4VUrhH96kAwDM0F9jiYPrT
	KAJ9Os7RF723yoQ8b/3HoxmCSyVpt2S5Xt3/7lDg7PgeSg0dVvHYn3TyY+qVFbgPsbiNJ1wNep/QC
	4esA/spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBYN-00000007aow-15Af;
	Tue, 21 Jan 2025 10:32:15 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBWt-00000007aJ6-1VVy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737455443; x=1768991443;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vlr5cUwPRRPdmdrxfHfnoxx2HdPSWBufIchZ2vqklZk=;
  b=PXvXnK5u9ldo0oSDerJO1p7JS7dxyX+R1rcbGOUEC8WEfdxyt3w3ckF+
   9/ZVptSc2d+h+RkgyTWFJ5J4JCXetntOplTBOmVWBuwqgu9ZIR2eoSbjS
   lpy2T3ttJY0bzeBcgloyHq+P+nveQ0APSCOEsj2muTnWJlsaSDyrAnhGJ
   LftiMJhCTIXZQyXatb4fwuhHXNHwW8YnuGGcdL7vgZ6KmvZnZcXviBrBM
   ut7IQerB495qiyf1S1Mo+u46CcBsdn/7jnpORLqAHFo5heF+l00lz7YbA
   AgmJ4eCHRkpBBh9GDNF+Zj4miKsyUedXxX2eMegwQQUABUK62snJHNFB6
   A==;
X-CSE-ConnectionGUID: VLxxD6TwSP2QjGRQNpkVoQ==
X-CSE-MsgGUID: NOYYOwoHRY+NVxiinLL4Tg==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="41196365"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 11:30:41 +0100
X-CheckPoint: {678F7751-A-31397509-E321C4C4}
X-MAIL-CPID: EA44B9009F17B461DEBA4D0C8EEB203A_0
X-Control-Analysis: str=0001.0A682F25.678F7751.0071,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 433D2163631;
	Tue, 21 Jan 2025 11:30:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737455436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vlr5cUwPRRPdmdrxfHfnoxx2HdPSWBufIchZ2vqklZk=;
	b=sx0RZGSjlZosl5kPDCZiO1SYdeThTPbiGYy06XUhzZuko/HoS5jbx6IVui/+0/PDbomMPn
	W7Jgcx46OPYHN8x2l3T1oBKXM8FH6cOllWOn57YZgwCXE+ieTukBtb6dWyl35bnZSPZ2K3
	n1fbLZ0miOhXbvZPdB+aK8THlLt+Aqvx5s4G3ZyDE+iHdE7clkKbBC36+BM7aieEK8RW55
	w48q7gZ0jmJCSiGwW+CbEV8di4kZrE+x/mHFXVzuiBDdpCTugw3qIijpgB766Z00DBM0i9
	EpaSADrkj2NMx2zS3/k0mT2/13CLSZGvI7rPG/qgWK4I0njjVzJAjUUl2YFXOA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: freescale: tqma8mpql: Add vcc-supply for spi-nor
Date: Tue, 21 Jan 2025 11:30:22 +0100
Message-Id: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_023043_889551_0EA74317 
X-CRM114-Status: UNSURE (   9.70  )
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

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index 2ca87d2f0b590..f00730ba4e1c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -50,6 +50,7 @@ flash0: flash@0 {
 		spi-max-frequency = <80000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&buck5_reg>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.34.1


