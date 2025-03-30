Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2032EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=halZH6jvhUjK9JoJsfFiXMcT2/WmVmWfglMoiF2rRv4=; b=f7noQk3hpqYQBV+RMywVgmJLa5
	WcIlgj6zUzMPP9W0A+Mka21eVqcFqDaxIsKwJcC58iCK6E+DsF66FOrHqvzM4XAYRpL2+lZvJr0++
	jxinViwo+cehoiPPwM6VliaHVnYUbw2a94VFyf7BV29wV0KXR0AAGYppdBm2fw9mBow86X70LtUWZ
	hyKWZvqX+FB4efD+5hqd7HyDbZL+/jgz2NsTTaU1WYxxpiKoUjkDU/U3Dc6bL7pWKwftj/XGwORrL
	B9Zfhas+GdgYPLioZL0wy28sjzHmtenF37E4vObSm64tOvAslj8faZ8l1BJMpj7h0FRKMmwVZh13R
	i7RXIymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyYM-0000000GbQk-3NGO;
	Sun, 30 Mar 2025 19:42:42 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyUt-0000000GbAF-37jp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 19:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=halZH6jvhUjK9JoJsfFiXMcT2/WmVmWfglMoiF2rRv4=; b=EJ6wQu
	LS87H1D2FDqCB8hE0TJhdD6IyR5UjsxCJt0IEOuLpWJbpRAWwxj0lb04HcLtqB0X
	aMx4NbinUzM43D5HHLBDPa4mboeNtiPWq4bVnR2bw/8ODVUFW4j4P6DQ/Rmq+1Au
	+6nGETDa11Dgt+BIuvijjvcJft1yZ2iuamay9QeyLq0y8ka2zNkBgGi9ihy02Rxg
	XL/RLDa5OykrUq6znLA8izyfy4fJdWhg2cq4RgXTyvNkLTMlao5dHUPgTyKe0bqA
	8zcW2vVTUsUXC4HSem71iyawgeFtvHSs/RyVKECHBrNih77h8aSUGprmtbLyKL47
	78SdZjX4T5zKsNXA==
Received: (qmail 964870 invoked from network); 30 Mar 2025 21:39:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 21:39:05 +0200
X-UD-Smtp-Session: l3s3148p1@O43TdJQxVNlQ8qei
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] ARM: dts: nxp: lpc: use correct ohci/ehci node names
Date: Sun, 30 Mar 2025 21:38:33 +0200
Message-ID: <20250330193833.21970-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
References: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_123908_647525_5DF47355 
X-CRM114-Status: UNSURE (   9.89  )
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

They should be named "usb@".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..41f41a786f9d 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -94,7 +94,7 @@ usb {
 			/*
 			 * Enable either ohci or usbd (gadget)!
 			 */
-			ohci: ohci@0 {
+			ohci: usb@0 {
 				compatible = "nxp,ohci-nxp", "usb-ohci";
 				reg = <0x0 0x300>;
 				interrupt-parent = <&sic1>;
-- 
2.47.2


