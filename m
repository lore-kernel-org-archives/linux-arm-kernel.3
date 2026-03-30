Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FE1061B0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dnhAgVDW8iuPSVs9uJHLaTkCl9UflKkR8DioSBXExQ=; b=1W34btj0Kj5ik2qP9rb5SyvSsn
	K1rFYuRseYIzKynW4n8FnHosGW4dklg7j/kN0+EOecFfYh6p1yCnKj6ckviIeqp0SowxI/onjXQvK
	kmboqXdlWRSZfLfofJZUEt1XD0Jdn3JsEdY1NS1uOGy5OLn0T9hendY1eGH1VWWJlxMWqQ1aS4Y/K
	IXqwGumq9Sopk1z0Y7yEnh5oqiTRW2nm15slH0lJIxxUwg/lwIUXTn4p4RNaLZ3SHrxIZgvKEhmXH
	JS6Y2EwfYsQQkRzYDkFCsNwEvA7ovaRSiQYoVl71pujJc5Awt9BxciRDgaVNSPON/UF0rR/romSpV
	nfS29HBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EUj-0000000BZDm-3pQ7;
	Mon, 30 Mar 2026 15:25:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EUc-0000000BZB0-08po
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 15:25:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b97f9587e6eso707791766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774884328; x=1775489128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dnhAgVDW8iuPSVs9uJHLaTkCl9UflKkR8DioSBXExQ=;
        b=baXEUnxf/Ac1VzmkqgOOhlVCob9J2ATKXNYeBsRJ6+QGCW3KW3r64ZyfaaKCkrL5Cf
         D1c52z7SIsSyWNnEC7igNdasJqmdoTZfpKop5JAjNiiP9jw+jFznCSD+oOs8m5NPrEKf
         JdWXTeymbRPYdi7VWXLRkcSB5JmxXkOXTJzCj58U1rQxa77FcFVc2U1AuHpkifhMN7qF
         UTRPtPQMitEkZ4Bj2XVDyP4Nj6Q3sGM28FvQmX/Y8Jp26rFDqhCOuyxpCIH16lVasneQ
         7RxnNZDXFYeoys8LfyULAw0NB0rJ09mQWRX1MQ9KGAhq/+ybJjriJqkxJglqkUcKYRTt
         Rv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774884328; x=1775489128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8dnhAgVDW8iuPSVs9uJHLaTkCl9UflKkR8DioSBXExQ=;
        b=VU5U+WE4s3WESPa5hAPFurzz7h1AEKIhE7RiBoXBkEU7G8yx+R9Ztr7vz++mlzDI/W
         wDGg8ATJj4EF/u8SGLEctSGMmPuf1SUyO0HY6RkxRSZkmKODkw/NSAqxUkP4gv04Owut
         w7vdb+pZvabiMquEpphHrk32UJOyRavHZgN6zCZ+NVxNOoIDfM2MbdGnnpIUoljOXaMk
         wKyifxgzkRgIocIigVFBTv88+WX5jhemsLAsAyDhmwzE41d1ujYopNa6ht5CzOylT4YH
         kBtdGRt/TkgKA45jPAhngliUe/OyWmK//AHGbALNnIIunFqvN62OW6V1QJ/VLSYslQ+q
         ba5g==
X-Gm-Message-State: AOJu0YwuvMSU7JxB3nk1IJ16lC8a5Z+oQFPycxwaTNgF0qX8GC+Na0Va
	1JBAXaEnQX+mE+ruYkj+HLsZoPBwIW9ddoW3/aI++CeLOm3xIhCAAiGg
X-Gm-Gg: ATEYQzxhPaHASqyiWPSyux8gw86Y6ZeNoPWtsmNM8wE2fWGlXTBIQ1/ec8gC3WkVYUT
	DIF6BrKoypv/ofkYbTv59K8mfRcMozL3xyP366w1SmVwin0dnwj8IUj//mNjDh6GMoYEv4kfWba
	T4jclCo+APLdMGd6zdgzSNUjjYWxuwS5reye7WokvidKxOAhMlSB8ZCXBN3+bnfNvQHS1L31ogX
	fW547FIlb+Q6mKzhI9BzvmYVHxj98mTaYSGUvKZmZZedzL/Tf39DhHJb5NvHedtDaB11GKPwYdJ
	pqcWe9/Kmg4uLG1Iyk8gr2XxZK5valNnTNcQ7MmR/ELD63wiVzNoLuvjowQwTYgt4do03kus/CB
	Xz1X8WmAF2Ax8meOIgvZ/P+mWhPPEMfebVV0x5z6L3CrJ9uZUzvX/nFDYyzS0i+04jqgtpfTvmb
	fbv5h6BDO5TWW7amibwY11FElQpHVrmSvz0I5dCdjT1QVaXKDrk/S3
X-Received: by 2002:a17:907:1c9e:b0:b98:40f3:47fc with SMTP id a640c23a62f3a-b9b50169017mr811597866b.1.1774884327882;
        Mon, 30 Mar 2026 08:25:27 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b9b7b1e33c0sm301058566b.49.2026.03.30.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:25:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 30 Mar 2026 17:25:16 +0200
Subject: [PATCH 1/2] arm64: dts: marvell: armada-37xx: use 'usb2-phy' in
 USB3 controller's phy-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-armada-37xx-usb3-phy-cleanup-v1-1-34d77f1a1784@gmail.com>
References: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
In-Reply-To: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
To: Gregory Clement <gregory.clement@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Robert Marko <robert.marko@sartura.hr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stanley Chang <stanley_chang@realtek.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_082530_091089_3995F462 
X-CRM114-Status: GOOD (  16.09  )
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

Instead of the generic 'usb2-phy' name, the Armada 37xx device trees
are using a custom 'usb2-utmi-otg-phy' name for the USB2 PHY in the USB3
controller node. Since commit 53a2d95df836 ("usb: core: add phy notify
connect and disconnect"), this triggers a bug [1] in the USB core which
causes double use of the USB3 PHY.

Change the PHY name to 'usb2-phy' in the SoC and in the uDPU specific
dtsi files in order to avoid triggering the bug and also to keep the
names in line with the ones used by other platforms.

Link: https://lore.kernel.org/r/20260330-usb-avoid-usb3-phy-double-use-v1-1-d2113aecb535@gmail.com # [1]
Fixes: 53a2d95df836 ("usb: core: add phy notify connect and disconnect")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 2 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
index cd856c0aba71e6f6fd3db8fb386ad607912e7577..12deacb741ccbea684d905f246f26a4399fc8cd8 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
@@ -161,7 +161,7 @@ &eth1 {
 &usb3 {
 	status = "okay";
 	phys = <&usb2_utmi_otg_phy>;
-	phy-names = "usb2-utmi-otg-phy";
+	phy-names = "usb2-phy";
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 44c47409f8793ae1266303607812ef481edbfbc5..7470d504a41081b32bee45368028189a13ea7087 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -372,7 +372,7 @@ usb3: usb@58000 {
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&sb_periph_clk 12>;
 				phys = <&comphy0 0>, <&usb2_utmi_otg_phy>;
-				phy-names = "usb3-phy", "usb2-utmi-otg-phy";
+				phy-names = "usb3-phy", "usb2-phy";
 				status = "disabled";
 			};
 

-- 
2.53.0


