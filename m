Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E950EFC6174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29VsiJqR0uFBbQHYC75VBavG4DpR3+cDRVjS52nwMSM=; b=IYlBKsdMkbIOKQoLMLpYdtNaW0
	RTK1lSsW/9D/gTN1dCRIQhQwRFxwx/WBs6zc9THcFMdz6bDu16Yih9VbZ1I2WmaYcJNpypEJMXYAI
	oQSOE7p92e5+/VsGWZtUcltrU8G+sAEYCumE3V8BGW2sN1J1Qn5THmIKUqFrwfSg+mE+eLSXai5gB
	13d+g5jYmDzmN8r7MwMh3dc+jwUQvkePFxvqdwK4P4fACrn23DdWJMfQbahxT3rHpbdXQN9E2e1R8
	duGJZwDumxWfkuLbE1fFcQLMi243KOKjqTqWWfSuNStM3/f+2KeuLG5zVPtK0VT31WSnkoM0IG8kB
	wXCmDnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx4i-000000096W3-3wSf;
	Sat, 03 Jan 2026 08:33:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx4d-000000096UQ-0LCt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:33:26 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0834769f0so123714325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767429202; x=1768034002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29VsiJqR0uFBbQHYC75VBavG4DpR3+cDRVjS52nwMSM=;
        b=iYrAdwHBfIY6G8p3KS1L+tsZektyf46mz7eAQ0HqTYoMsvzfl5rlp0+gA7gakGP3HY
         oLa6jORdfQ3YH+IlWRFKsBKXmen+7x+/JxOMlRuOBHWIUeRiPCKDnb+YK7qjM/ZwcdWI
         sTNnkI+psOo7AjK9SgYboa1omP9qsRJ+ODr03g0rWHv4Bi1UUSqaB7zicOf3WMHz7/ml
         Ru0yWknYbOliJGcPtMTpmWtLXLlNMOfqyu/GL8I531bjwOHLkjhYaZRYckfj1NmEU7py
         1Nolw+C9ebh0w4nLLTK9fdW1n+eZ9fdFHscyt0pIZK6v2MrhT+1tIFS/8QPlKT0/aYwn
         UP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767429202; x=1768034002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=29VsiJqR0uFBbQHYC75VBavG4DpR3+cDRVjS52nwMSM=;
        b=HGtF4C6YF4xY5LvmQlzFEGv0gb7OJC29WuYExFeVfQ//woj8xX1OYoGfNSu2HGY3Ul
         ZzKn9BbHpv5QfBfMoAF8kxpzp1xueRsgwM7Et0BbRuY5fEeEnJc7pLCBqLl+zbKSdkth
         33AWmMKqWzDrKVBjpyUCaUxQ9pVbK/RErPyep2tedK1tzD/K7xP/6HLbbSCUMy1BLLv9
         oYhJAr6OSUjfZKsS4UShRr++Kxz99c5zKR1SuRZp/8DVhHgkpHKenFP3/NC7Hw3XLmVJ
         9ruwGXovM+lSIInYp6qiv4muWfaERHyztdv1p1PUCJDdrDEd8gUckxDRVIYgiYdS2in8
         DodQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFKykgbGvQCtjaiVjUe1Bx//f1y8Ovr+M3RW+Q5YTQRZMKDDwLbX6PVo2lYWzVAuk7Eo0xp5GYLkAakaxJM3gS@lists.infradead.org
X-Gm-Message-State: AOJu0YyE5CrkPCAe3071R7jEobCvSNoUwSPjH86I2m2rD51vzF39TNO7
	yvEuy/egiGBH7/NZcTROHLijJHpt2sPAGColGq43rsBpxUQBX1uyY6pSR5bYAw==
X-Gm-Gg: AY/fxX55aLjXIsJDQww9m/WaXxaMrTJO9N4yhCq4N5kQB9SomKrT27IicbmT8XPc80C
	GO90LZwFT8kFjNwTp6vHd6ZkRz8rqU6wcy5j5x2hn6lJ7RF4S4L687UnxvLy0tgMRbrcXEAMvzo
	ODDiOb5rRqay1oba+JKbeBQRjT7dqOirFQib++WZ8SaO66y/HqeanbKCbGWd0tcZTo7QpSr6QeB
	hAPQIBjHhDWK/Mgt1/4bDRn1s6AQY55mu7LdCFCl8yiqQtD7quztEk6pfzIJ33505Y/WmqkNWO9
	raLJg6urz5Ty4ZUct7lnpDsTbnKXODsoByHibRCGCzda21AShK8L2d8X7uHgQElvXH/BmCfTxcB
	nZ7oGQQHkVe9BiKVQalxgFnLQTk7Ks9QSpaBwcSF2S3G9Ezk+lG9LTPEnGI8pyH706FQRNejWv2
	fPvDcpEw==
X-Google-Smtp-Source: AGHT+IEdATA9P7k2n5CWUx8yOsmhm/F/9su5pYtPk4wylobkfRFEAHqb0+3yD3t4l4QDFzSZPoWtgw==
X-Received: by 2002:a17:903:1c8:b0:2a1:3769:1cf8 with SMTP id d9443c01a7336-2a2f2734d5emr447661885ad.33.1767429202381;
        Sat, 03 Jan 2026 00:33:22 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm391700365ad.21.2026.01.03.00.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:33:21 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yongbo Zhang <giraffesnn123@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 2/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix USB host phy-supply on Rock 5b-5bp-5t SbC
Date: Sat,  3 Jan 2026 14:01:18 +0530
Message-ID: <20260103083232.9510-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260103083232.9510-1-linux.amoon@gmail.com>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_003323_291278_2AC57D41 
X-CRM114-Status: GOOD (  13.31  )
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

The USB host USB2 and USB3 on the Rock 5B, 5BP, and 5T is powered by the
USB_HOST_PWREN_H gpio pin which is used to enable vcc5v0_host host
regulator which ensures proper power sequencing and management for onboard
Double-USB-HOST.

Update the u2phy2_host node to reference the correct phy-supply.

Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 0cd8ac7bf538..886d788572fc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -981,8 +981,7 @@ &u2phy2 {
 };
 
 &u2phy2_host {
-	/* connected to USB hub, which is powered by vcc5v0_sys */
-	phy-supply = <&vcc5v0_sys>;
+	phy-supply = <&vcc5v0_host>;
 	status = "okay";
 };
 
-- 
2.50.1


