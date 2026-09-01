Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770CDC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlRBTnAxAr5Mr3h2Ki5AWmuYRNMm8WhwP7R0oNWZa10=; b=sp8Mx0iOQJ8LzXxJSO+2a2B92/
	LknvGtfdIx6TmWX37fSKkUs/QKLa2ocyQ7eAzd9NCt+i9y7JADsGJlkkbbnt6pnR8ESF8jKHhWkaA
	5G93UjZyR60XDg2qhAMhkmpNzTIY/MSt3kQr3c3LvC0xaud+hH3oC58CamqZYPQpTpiU0h0NTfjQm
	Hp+g+0b+3Z3HskYYH6ZBINQLucYX0uSyO/g3Zh7ILHpHrA0eJ0Oj5IhTaslvYU2tgynsHm4Ajpi2n
	dIns8/IAF/LC7AcknS9i0CbD9C5JeG4+cVwaJkeqN2wTDl+rzarCtND2Klvd2w60397Cg0wefMO2Y
	P6ZawC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUW-0000000CVry-07WW;
	Tue, 01 Sep 2026 15:33:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QUT-0000000CVor-3Rhk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:33:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so11789715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788276816; x=1788881616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlRBTnAxAr5Mr3h2Ki5AWmuYRNMm8WhwP7R0oNWZa10=;
        b=bKhoJ3foHe6mHE8OpJMp8tdd74Rb2zgnj7Xg6dv/OnguXmRowG57JqDFegIAXZ7Wgl
         KwZS1wD1E2lhD7L+IrUXgtJ88huZxCjV+1auZ8+G346BcBTYRDVF9ic67rXh6rdsBw8R
         YaHt67nZiHIxFTu1qG6KW1Gm9+DixzbssoOlJS2gv1fh5XUX8T0XA9BghDH2hixNfsDS
         McrZ7RYsEDop+BSRd8ofrKLNXoLmFVMd2k+rgryLrs8Vnqs93ORfG8iiZVV5cPmxJJpA
         JdoV+BmhVSZWp2bdpKpqNLmoZzeQZGNZR4tcXnqGizjnFRsEupcbObIG7DH/4+XkVvsx
         PHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276816; x=1788881616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BlRBTnAxAr5Mr3h2Ki5AWmuYRNMm8WhwP7R0oNWZa10=;
        b=K8Fvtj89+/+2EVPLq6ewwycUGCKnldKI0w8sffPVSe/GiizfxnIBqR/goX9aVlI+lH
         OEcM9mP2IyiN/gDc4152ymJxgrkpCJQPy7lq93TQdcBAdHfuSg8j2+Zx0wNAQ7hFWZq+
         BxBTHMa4Ao5sWVCsj4G3VPm3spLlM63Py281mn8l9LWnHy8dQurgiHPcSHWd1RO188yP
         ooHdlHqOXlbWnBfu2L7IUHMdY5XCzW+QSaZbQ7Ua9gIKVceBDc8lsaT6ABzX1VW/5LS4
         UBwiRCW3dhFuFZLanBUMI17h2a/BrSXJcwGrgUdDBIfq+58odZk3/yKlNX5pTRmSBy1J
         ivmA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3a7eJo0gYdzT6x/ADkWWgA3yFsth2m+NqolG2Kg2OB+IPQB4MouVF/WjAQXXahYhgSICsqCsT9X4E2LtpnMQx@lists.infradead.org
X-Gm-Message-State: AFuF++mDUxo7S3lMUWU40jZ369w4fOlH0xowO6l1eDe++Wa8FCzgHMFv
	WYmRUCmBhEb6EzAnU5VALh+UdNYV6+/1eVKgywVcG16TJKruMqJfMwIasW9Lo2h9eUO/ybRCr1y
	u17Nz
X-Gm-Gg: AR+sD11mpV4p6yoDgw6agDGWsOU01sGFTynXpl1VCmsK/M0xiTDm+xNjZ2HSztI5GHg
	qkVuZmZgjwtvC1HgT3yPSf4steJWBVOZr7slKwmi5shJXhir29utkCdRkKtJAT11P8ZqW+vci2g
	ZrGTp9ftpUARwGqFZtEL82Kq3gGrCzME+2L2phlX/YucpPEv8x/eeFJcX1e/kwTM2Plj1rW+nkP
	6auNsrLREg0oNlz58O8VOI0mbKzcJ85GOex0Xi46vf79g+9h5PR8Y2rb1p1xbxuoILZolmIAcx1
	xnTJOrN42ecbiVBGl0qhvYcN/nPUdHEOxgoNUgU3GjAFJGbmctH/m7srFyDvBACS77XDeYAgrxj
	NWJzw0RMgWPmQQqqkkvEmXpiesqIS0d7Ar612IHLAW24tu9SZ4EN7hIzszqS3E7V+9TcGrIswE5
	9/mKjwmYEm98imfpK0wFSKZz2OjjUoqJ+3UYeMvUF8btL2Qm60Flr6XXLWlxo37JbumGqAm9u7E
	HDLJZb6iDGfhBBkrIXw7KybCBnB006w32mOqaqw
X-Received: by 2002:a05:600c:5288:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49b91c41014mr616951295e9.9.1788276815737;
        Tue, 01 Sep 2026 08:33:35 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm314541845e9.0.2026.09.01.08.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:33:33 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 01 Sep 2026 19:33:14 +0400
Subject: [PATCH 4/4] arm64: dts: rockchip: Derive GMAC MAC addresses from
 OTP on RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-rk3576-otp-cpuid-mac-v1-4-ea9135270fc2@flipper.net>
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=alchark@flipper.net;
 h=from:subject:message-id; bh=7ScGxa+8+RlYUQcbDyTy3K6G/E2mZ7i4yB4b0QAxXtI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRN+2Bn0+oxU6P3qU/7I7eGFXnGf49KT7dMO7uyUF1W6
 rxyqMHyjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6W5zhn97ro1tSdDtDJG4wGubZej43tPqwU1bkr0wH95UzN2IYrzEyPHz0dy2
 bQNfGDaf/3zEQnXryvurGjW8ropd8La2Y5dtUwAkA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083337_881650_3272ED2D 
X-CRM114-Status: GOOD (  13.54  )
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

Rockchip SoCs derive stable MAC addresses from the CPU ID in OTP memory,
which a bootloader would normally process and patch the live device tree
based on it. This depends on the particular bootloader implementation
though, and the derivation itself is not described in the device tree.

Add explicit nvmem layout for the CPU ID derived MAC addresses on RK3576,
so that any OS can implement the same derivation without depending on the
bootloader used.

Boards which store a MAC address of their own can override the reference
with a cell of their choosing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..0012b45ef426 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1845,6 +1845,8 @@ gmac0: ethernet@2a220000 {
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_mac_address 0>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC0>;
 			reset-names = "stmmaceth";
@@ -1893,6 +1895,8 @@ gmac1: ethernet@2a230000 {
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_mac_address 1>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC1>;
 			reset-names = "stmmaceth";
@@ -2131,6 +2135,14 @@ soc_tsadc_trim: soc-tsadc-trim@64 {
 				reg = <0x64 0x2>;
 				bits = <0 10>;
 			};
+
+			nvmem-layout {
+				compatible = "rockchip,rk3576-otp-cpuid";
+
+				otp_mac_address: mac-address {
+					#nvmem-cell-cells = <1>;
+				};
+			};
 		};
 
 		sai0: sai@2a600000 {

-- 
2.54.0


