Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE001061B0E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fi+1KAYYwQg88j14KB9Qe0SEuxhGb/RcRHTFnbIZpHk=; b=Bl0lTM332d01JFVKe9riWS+ENY
	YtLThqLKBOQwN9OaJASYFrKZ6ScyinzwKSW7osRBQzDAQy8KDJiAxH6tfS9VaUPrmAEz+QtNWwlbo
	OOYSbqkDa86lnDHJE0UOHCB+QaIy9mm0vY8pTc+Wd9aY2ZSuBarfo02A1m27L0IAO4TNarJlUmxIW
	jzebWLiGZNnS5j706lADgVfc/h4aPI3YBY4EJAINXKmuWOfJiAPm6axiDrD9Pw/SZEPTrFmeKAFzT
	9pueyjGQFrbZLyxGoSi+6m8rNPDkEjSSi1go56RIMZP6Sjh0gCnFsD0/Pf4THh9BCaBzFX41UQhcq
	JfjFH59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EUk-0000000BZE6-0ujS;
	Mon, 30 Mar 2026 15:25:38 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EUd-0000000BZBW-2YyS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 15:25:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-66a33f61d80so7736774a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774884330; x=1775489130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fi+1KAYYwQg88j14KB9Qe0SEuxhGb/RcRHTFnbIZpHk=;
        b=aI9dJg7ZzTRbTm7y2UzUywjObEGEp2S5iTpPf09a3riczu+l4ssEQuUwPxZ/JPXFYi
         5cbK3wlLmpi5r86TnzhQvanXq81XYPaQLMvKnwZwhCcKh5IMeIv55Ov5XeDgoXWka5A1
         aXAPiW1I0lHEhUxhhgv3iJTaROc+DMW03XMTYioXMX3KxXdBjBgHexcCjKb9ZPtIPLGF
         5sVWt3G5NnmaaEqXmPrQs7qyFR7IUqeZ4fMU8U+jyhFDLk33KR//jcZ4TRh7g2nULV9m
         Sp7CghmS48a67Aw0sN4BSPc6RZtsjN5zTXOM2m//N3j4ol/ZszPaawUV2NRjq6ch8M/A
         NOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774884330; x=1775489130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fi+1KAYYwQg88j14KB9Qe0SEuxhGb/RcRHTFnbIZpHk=;
        b=ceR7rHEoQXWv8rnQ+SoVXUZwYzTyINZWNsWkn3D87FCzAogAKYkWVZjhLyZ/pdztzT
         b0qiOhfZfifgB2O81Ri72vocGcN95afy3jJEz26HCmhPNhGTo5sh+JOhRHC5/Sh545fv
         ZEq+RW4k1lt/M6Qro1w+OHzCBvr5e7Zwhjm6LcXWusptWfhaqDER+JlAWCH68jhcr6NI
         X/MELIVdMa3NtNU6E1DFnJZOCKfpEiDI3H1OiB/7b34I2EiRN4nrutw6f74/az5C1L+D
         OjLq0ZE7aEzW2pF0V+oCVPYIodbKt62RsvFVeaOWkqw7HwnECflT+ZkowvfT7QTFV3Bo
         w9TQ==
X-Gm-Message-State: AOJu0Yy6wZMTnCXnAW5e0/+/rf9do/mP2U0U9jUruJHaC04DhH+uqSqi
	TovJlyR+XqmqjincBHDvaKxlLOI39JFeTrNJzvBsB/h0jVAYoSWmWDCb
X-Gm-Gg: ATEYQzwXqXNJBiYD5Z39PSVXJiPFJuGwRco9WNNfs9mk5ImT9YLdpTrVeJBKw/pRNIS
	ZGtMqw9c8Q6RBE8EItN8pM2HUEdiweTb4kScZ3OOTmwVG3Bz+u50gLy5PkgdAVQ8kXzFJ9kRzDV
	1r7rUQHTXAD9vrGXJpG9z8vgclJiXpfQBCcBx8sXMpiCsGfPUotcVZ7djcLiLUz3vQ1GdNxUYVC
	8uPRxnw3Kb43OZvNaCBn1mQUs1Kf6luo08X116bW3FTC9P/cE6jvajxc/cCf6ZmuAweVn9S5iCo
	ys9UzLCkTWQC+hR8JheEzTSwQwlAXVRkzVu/RmELzvF/X3ef4aq36Equ9TVwnL26/JOqUcEpEfS
	o4SXzZmsSW9S042HjG95DzGcPjA4CSBnLIslP28ipKI/EkZobLPtmYfgG9FPurtrF45mX0xRDm4
	H6Yky4F8lZNZspBPXxALD4xXDw4Dxl5OJBTJjP7j1KbNPkVgLTOyGf
X-Received: by 2002:a17:907:960b:b0:b99:7697:76dc with SMTP id a640c23a62f3a-b9b50175845mr850255266b.4.1774884329432;
        Mon, 30 Mar 2026 08:25:29 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b9b7b1e33c0sm301058566b.49.2026.03.30.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:25:28 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 30 Mar 2026 17:25:17 +0200
Subject: [PATCH 2/2] arm64: dts: marvell: armada-37xx: swap PHYs' order in
 USB3 controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-armada-37xx-usb3-phy-cleanup-v1-2-34d77f1a1784@gmail.com>
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
X-CRM114-CacheID: sfid-20260330_082531_718225_F9776FC7 
X-CRM114-Status: GOOD (  14.81  )
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

It seems that the Armada 3700 is the only platform where the USB3 specific
PHY is defined before the USB2 specific one in the device tree:

  $ git grep -E 'phy-names[ \t]*=[ \t]*"usb3-phy"[ \t]*,' next-20260327 -- *.dts *.dtsi | tr '\t' ' '
  next-20260327:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:    phy-names = "usb3-phy", "usb2-utmi-otg-phy";

In contrary to this, there are 93 other platforms/boards where 'usb2-phy'
is defined first:

  $ git grep -E 'phy-names[ \t]*=[ \t]*"usb2-phy"[ \t]*,' next-20260327 -- *.dts *.dtsi | wc -l
  93

Swap the order of the USB3 and USB2 PHYs to follow the common pattern
used on other platforms.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 7470d504a41081b32bee45368028189a13ea7087..360fc24fdde2204540ac415852146d3020be87c0 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -371,8 +371,8 @@ usb3: usb@58000 {
 				reg = <0x58000 0x4000>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&sb_periph_clk 12>;
-				phys = <&comphy0 0>, <&usb2_utmi_otg_phy>;
-				phy-names = "usb3-phy", "usb2-phy";
+				phys = <&usb2_utmi_otg_phy>, <&comphy0 0>;
+				phy-names = "usb2-phy", "usb3-phy";
 				status = "disabled";
 			};
 

-- 
2.53.0


