Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8622C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpCeLBVC6ziEvRs3avdSAkam/Yq1PpMlp/nqMW89isQ=; b=L6mDu+Z8VcCosP2F8PEc2rUfIK
	5y7tjDSj7aW4tn/0tuxxHk7HoiMj2hAMh2oW5w7vAy6F5wZm2hjpAzQuEYmXE/jszlgUdwVTJJvm9
	d4u8iE15uFh3EF7lTbJzAJ35E58xBocRzOMOy5eCdaQubXfDWf3BGk5g13uWfmgBB1EjM/CgSPmqw
	LCWLsEz2Hg9zdXpkfjA4OWokCWspLyvG8W8fPQR33M5zzfLgd1P9JhPoML8FMXbNVXRawnUYdsWrS
	TWQOMmAAUTZ48IGHOnGuFilvqxbPEdUDcC+0am6hWTm/jL6orvturNTTtdpdkKI1sTaSVl7GiHJfm
	NwGnGPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62FN-00000002mu5-1hgu;
	Mon, 14 Sep 2026 08:41:05 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62F9-00000002mhq-2m7Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:40:54 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DED38140011B;
	Mon, 14 Sep 2026 04:40:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 14 Sep 2026 04:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375250;
	 x=1789461650; bh=xpCeLBVC6ziEvRs3avdSAkam/Yq1PpMlp/nqMW89isQ=; b=
	EINVKVEO43+7qJHkcQtIKRMJ/9kyreA3kE/dN3CW9P6yEQs5L/dLE628rwDgLDzV
	Vpge7d15+mCK4A1Kobz9HEKArEycerauOCeVuipdP26eHDsWw62rQjsAZQr/gZsE
	Np3UQZSjd/+ZNJ1s0nSdn93Lr17qZV02Nn3BkUv078oH7FlInZx/IM05KTbKdIML
	B3rSNZcmadeQaq8pd8VlGYpXX8WBZmZL/dB/WzF6M8TJ/qYdrpFQGIKLVNoUKMxH
	d8J3wFb+H+Sgp2K2UdaI48sItlmh8GBrHhBDPIqfg0kKwq4Xaz0kkh1RgAmJwwc5
	bgD82keo2lgVsO/dNAzq0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375250; x=
	1789461650; bh=xpCeLBVC6ziEvRs3avdSAkam/Yq1PpMlp/nqMW89isQ=; b=E
	D6cda9wgbxz6lPD97zDNzlzt4n57QpGqv/xYz6d9uBJ+XR7REzttMFvuMnHkXZVl
	X4Gidy5P/iCMdSuvCjEvrfdSHlWYGy7o93PFhPpo3HdiNorBOFlxgBWa/A4WT5xL
	Ud7A81vLnHxGS+z32tySmpB6jO33dgOpK4ZO8mfUvaw6bQOmySoz0Ca0o8N/KlzB
	53LMxKxJ/x8Rd75i1yGLTkumzo2PJ6pc2dTtwMte787dSzp2CoRMD7L/gAgAdzZ0
	4eSCoQkEsgy0UZ6mtCb8BGX5eoGE7aj5D5NxHWUU8btlJzrwhoiAFfyQjLlTSxea
	GfJt8tPRh/wLBVZkCwyrg==
X-ME-Sender: <xms:ErOnaimqHtCienUlK9HJmAKNR-239eJT5Ws7alRcyimGPzUsycWjlQ>
    <xme:ErOnaiBaLVgGfm8gS5xiLgpFeVgZB-Vk6F3nK18fmSKBO2b2rLeMukqbiMGhWGTNl
    44dlRiqtbIguk-N5JH5w9-5_y51y7DfvlnJF5mpwfDBUuEUCvm9m77V>
X-ME-Received: <xmr:ErOnasPhQqn5HIUsjgoqFqU5GCwNXTSqj86i_2HSYywr7WWfjt_lU08irBRhnO6Nb0FIONjVgJKYhpDHIzraUO8jN_HQ8UyNuydKNA>
X-ME-Proxy-Cause: dmFkZTE4K6JMrxd6sPzZVNrePGCzWSArxKGqIFy2UwUC7nS/ZY+sStdcZ7vmPmE2pNoHZC
    9MiqcQ5OXckdWGFiy01IJr2JkZ+n3p+fcnek7D1Qwk8LgHRtAPwJ3G0I5cz7ZhSuemTIJc
    i9Rs6SyTtRrS0p1PgXmcVZpifTNEIm8RuZjsFaFCWemyhP462rhvuOdftkbms6ekvvuLIV
    6HeACEZ35ia1OWZxWsqljJDvRhxvUU8yfY+GnRLK37wYdoIiqubcn305EIee0gH5ypsRyC
    0b6zJacisih6eDtoNCnZwnv1woWj2R2DHm/YruUPQexvu5t1hokHp9I+EwChY3zqidyUKT
    AH6jLRxp21KakCPCNYzrFQtgU+0dBVi5QSC6Ck2H0ysHcOAgPwa4PgGhDMQcdMd7oaRC4m
    BcxJVhvNsDDVI0Xz8CQy5Ui9dTOrPjZZOnrPwa4Z5x17Q2GEyPA5tqL50zjXMQBlm/6G2R
    HnHUQb3NuPbXUICMSUxy4VejcokevpLsSL2EQ4bbM8pcYwOi1X9Yz79W1wXse0JDWs56CI
    b5Bf6jHlQgMvS7PR/PfRXN9cDuwYraPFr4RB5dhiBQ9whdJPbwKR2cEjqcoOqG0/QUutVC
    QuamD9Yxj20CCsmyuClv7MhjQE5A976uDsNTfZwPVa5BMU0r7blvi01G0mNA
X-ME-Proxy: <xmx:ErOnahPYi8Q1qCfgHPV98LuGyxdHMja2ftWe0odGzQ3jejNGahkWJw>
    <xmx:ErOnaslVfvaki30FyfXe1iVnwp7i30DfubEgQ7tLJhUAqZ4P8ST5mA>
    <xmx:ErOnanvvDc_0jW5OKJiFcCG_U19zwHalR2ZuanNVVVuL6VtSza5rPQ>
    <xmx:ErOnanqURu0MD3Xoc5FoOvyJvekWBdJ5HrfEOiPdn8vssEvFDswFBg>
    <xmx:ErOnammjRUuRx7AQD_Day7wlnKrIQQXrGUB-_HhL9lavndvHw5pqOoh_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:50 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:37 +0200
Subject: [PATCH v2 07/13] arm64: dts: apple: t8122: Fix continuation
 alignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-7-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=743; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=W9V+oB+r9lFZT7SEICn5PR68cDT522xBOot+vrw+XQM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5nj9/uGrqipYtuuXHyja9e0IDefN2Kc73QqRRmu/
 zC+Yfa3o5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEQSuRn+Z1vaGs/flvvn54RT
 3RfkMpY1KTY9Prvc9HQZg84Uq8aqZwy/WWPbs3SvOGl3G/UtPvp76p07JWcbP6zi+bHOSv3Uhr9
 MbAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_014051_786814_4714EAE3 
X-CRM114-Status: UNSURE (   9.56  )
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

Align multi-line properties exactly to "<" of the previous value.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 3c7677079a29..cf9cd0781fde 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -344,7 +344,7 @@ aic: interrupt-controller@2d1000000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x2 0xd1000000 0x0 0x184000>,
-				<0x2 0xd1040000 0x0 0x4>;
+			      <0x2 0xd1040000 0x0 0x4>;
 			reg-names = "core", "event";
 			power-domains = <&ps_aic>;
 

-- 
2.55.0


