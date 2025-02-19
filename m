Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DB1C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgTv0R1ppnT7IOn1i1PAmOOJxoWXJpDOFFz9jf3JakM=; b=jUbKial4Xrsks2EPKe6ivuRFl8
	W77zzNyS47BvlsqPtfMP6r1iMqZZJLJYUGXyX28Ew8ldRN9WcJ9y0ixXbcpYXsaOf865dGj+QHSiq
	BMLrczACJYWN8zwop7o/iSbJMo+nXitQt7DfcT04N8WMIlnakvDVwoZxZKZ4temao5QsLxCXV2kSl
	0KIRvvUB5vyjdbqRf0y5c5403ADllWDaf7JKPzQoV18TAeWkA/IEWHusk2fE8eq+pwIH70kDxp9pU
	KEvZ/OZR+EGTEIiH4CQuGGQ5gyTEgYXOLAVbokm5/HDr+qCjaDpu2fZl/ZZE7FJk0GyZgPJBUUuwX
	JX7a7H6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfbQ-0000000BaJi-4BiO;
	Wed, 19 Feb 2025 08:38:45 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfHl-0000000BSvS-3lPX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953105; x=1771489105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mgTv0R1ppnT7IOn1i1PAmOOJxoWXJpDOFFz9jf3JakM=;
  b=Qc6ExBxzFVNHgCM8pkDi3O/xOZl/n5l0iPdiVeXN7qUuqJfEIMX7fIiE
   ZoB8PzM9VLsVPmOPVp1EYjah9xXK1GlbSZYChooJ2hRREe+NpoVgNFkG6
   oWNPzORFj91JfMWzBcBcLPVhaQ7W5P/ahrRldJlM1IalRQf+FQLAaB34C
   pg9YcatXetYw9TznDGUS/MreR3xWBkg6ecWodO2aMFZN6HZ1gGuSFQGyP
   fZZIZrLzZqGegpnx7txIn9HwWCgXMGZv6Rq+Zg/Aj3Aag3geWcBSAhDiN
   6UiQHR0Ul3st2p+K2MVD8XIbMSM6+dqi743e75tLCMxnLyiOfsIA4WBoI
   w==;
X-CSE-ConnectionGUID: npr4UZyKQ0e5NJTF79faFg==
X-CSE-MsgGUID: iBZ9GZ24RWuEK4Jq+xtujw==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945142"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:24 +0100
X-CheckPoint: {67B593D0-46-EBA888C4-C1AC8B84}
X-MAIL-CPID: 92A129BAF551DBE314B1BFCC27C2662D_0
X-Control-Analysis: str=0001.0A00212C.67B593D1.004A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 271F6163F68;
	Wed, 19 Feb 2025 09:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgTv0R1ppnT7IOn1i1PAmOOJxoWXJpDOFFz9jf3JakM=;
	b=hpGWHKpTirC1rh1/mZYQCWfXGRCD1MYyOiNVsVFT5jogwup38LQ7fG51XjooOzAQOs7KqE
	J9run0GufbGmz8ZpUkrSEWtUSisnPq8gAE1GeXdA/v6Pj6zLisjaIprdpZQjazbtk4+9S3
	QAeWkLig//xKK4v1nCfaME0UoymrwCfisfL/5akF7v6n6KEF8FHxypQg0g7KmymSEa9C9d
	WL8P4qP4y+IgbltHOTj3c/ovY6DRE+K0idBkx7iCPce8QjZOOnkM810hIF0I6ErIpT8QAW
	hMHcANrXjigOMNCX/lmdH5pyV1RCJtYSRvOGRThvIEIkRR1g3ouBvZu0lpES8A==
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
Subject: [PATCH 5/9] ARM: dts: imx6ul-tqma6ul: Order DT properties
Date: Wed, 19 Feb 2025 09:17:40 +0100
Message-ID: <20250219081748.1181507-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001826_233190_F951530A 
X-CRM114-Status: GOOD (  11.60  )
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

'compatible' and 'reg' are put first.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
index c9c0794f01a2b..d63229d8b4655 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi
@@ -162,13 +162,13 @@ &qspi {
 	status = "okay";
 
 	flash0: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "jedec,spi-nor";
 		spi-max-frequency = <33000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
-		reg = <0>;
 	};
 };
 
-- 
2.43.0


