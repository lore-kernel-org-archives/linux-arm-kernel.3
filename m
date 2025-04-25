Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6FDC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OY31xp7Dll9vOIEOmAuyrG07iLGmNS/7kqtV/vhc5Y=; b=I2D8ZFm+U0CqjBNZk3oBRbQfD3
	vXeRByxJzKfXCnyHghNVaFUl0auPCtlzGcC5amOqtpRKYPRrokIagkvVqVcjZK2BNY2u2diP+XU3o
	Wwuty4memzduyD5ZIfk/KBKzR8AMbwdZhrkaD5ScgD+m0p01zfQ1wXkewFGrTTAZpG9d36C0SifGJ
	GsFLLzJNeCNYKg3KKon8ht8iGaVBmB4el+F4hFUpkIynaefg+fPULwUvz1AGp7/XLOqQ2jmVO+Jpp
	XOrK0RLFZ4P6YjWgbwAuUF1FaBTv+yUnGyuRFq07SZPyHg1nwbMyQYxZweyNLLLaT1yUv09MpFUXJ
	gUuhvYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NAV-00000000RvY-3Gei;
	Fri, 25 Apr 2025 17:48:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KpI-0000000017P-1UKk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:18:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaecf50578eso365206266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594331; x=1746199131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OY31xp7Dll9vOIEOmAuyrG07iLGmNS/7kqtV/vhc5Y=;
        b=j42Mt5qxCJoOQSAZ67W/QfhQdbkruiN8scys5w72FR/PJT4SkMiuvSysOixXR9NJAT
         Szooa0MhhB0unOV9Ti6R9o+kTVBsHSEeOpQrqwI4pHg6qXyuJWCXlXJdvoljsAU5nVEp
         CKZYawRNh4dwCEVooHT2e1x03O50YwGwzh/NS95EedFJ/ikDy0zmWpWp2kZ6ho6YOqmT
         9fsLBBy3gt543ewtrZBYC7QypUjUy/vT4DRjhZ+uu8eyH6t8BcgXEa6TYfn5JjK4/W3i
         +DV2fmV0QFZHn5kRW6DwFSlGpYiJP5UJ6Af4TT3w6GhKxyS314i+OJzxroIfyiqiZD4S
         M/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594331; x=1746199131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OY31xp7Dll9vOIEOmAuyrG07iLGmNS/7kqtV/vhc5Y=;
        b=slqlZzzf/rAcuDqrFuAr1BnzPE57XWUJLyjUgCurIqFH9zDEz1Pv5DlXcPD0Mf2oFS
         XAmlHRpfyg/z9q5496CAqA1MVxWv6IxYnst1FJDuzQB3q89nGcePUYJCFz21EWQ9Z5Qm
         YISgWS+IkI5kS2WX2POfdpltcGw0jU9nWzFkjJFtxZaj8mmuXRMMKPDQXpAaWpv3w33c
         2UWqKUmc8/lOEJ2bdJcQU53nji2uo0prXUlzhw5JVA6tIcxSi5UGv/15Nfyk4Xq9jayk
         yXuip4Y1qZ/l0JewnDb41WfEecOEU43+wQKBav7uV1b5SEExrCaioa9QWWrpxW9yuXph
         6S0A==
X-Forwarded-Encrypted: i=1; AJvYcCWLv5WevyPdzygnNh3Puz7tygcAybvdv2xf3Wax3vhYe7XUTpLAwT0wvpL4B9rZsvu9shml2e0oglxS1Jb6AUSS@lists.infradead.org
X-Gm-Message-State: AOJu0YzMIQsBF+rKQYngr9lPmuItYtvILKUBZ77M2X37FcB1uADLpyzq
	CtWqAdo0kJ71CCyubwtwj//zLbTj3RyUdLQ+pR8w1CAxN+viQjEBl/Xdd1PszHqpk2X8Jt2Ifty
	XbYA=
X-Gm-Gg: ASbGncvB6i1w2J81COQJDJE1/8HPn6MVP/lrQPeccoyUrpkqIRt5i6eD/aComFvfuOG
	Npu3IonOPz228GPFzZ/p59kAYOrY0Zx0cIulA3biHQcpZ9OI5nCU6Ce4AWli7M84nQywzR7pl45
	Db5ILsajBBtK8Nu017ik4x96qI7wKp+/442C90QQwa6YLjH1ge4yj2K727ha0kJBKu9hEfB0WOY
	E8AeOWZPprLy9CCJPsDpmsCY9cSWOMUXRg2v49/mqu3hO1UacvwHlYzxqUGcLQU9Lto7h6NlM9o
	fGNL4hL/iPOVBh8iedPF0SOwsw/v2wfBUR+vp7pIYICNKe4keTl+t0ffQA==
X-Google-Smtp-Source: AGHT+IF/D7KC9l8++rWqiUEiNq3eyx2s0Qq/rmeB9HU9Sb4W5K3CdWLHL8yd44YFf3+hogCSyIirhg==
X-Received: by 2002:a17:907:2dab:b0:acb:bbc4:3344 with SMTP id a640c23a62f3a-ace71098d8dmr246518666b.22.1745594330687;
        Fri, 25 Apr 2025 08:18:50 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:50 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:10 +0200
Subject: [PATCH v2 5/5] arm64: dts: rockchip: disable unrouted USB
 controllers and PHY on RK3399 Puma with Haikou
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-onboard_usb_dev-v2-5-4a76a474a010@thaumatec.com>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
In-Reply-To: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_081852_400387_86F09E0C 
X-CRM114-Status: GOOD (  17.39  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The u2phy0_host port is the part of the USB PHY0 (namely the
HOST0_DP/DM lanes) which routes directly to the USB2.0 HOST
controller[1]. The other lanes of the PHY are routed to the USB3.0 OTG
controller (dwc3), which we do use.

The HOST0_DP/DM lanes aren't routed on RK3399 Puma so let's simply
disable the USB2.0 controllers.

USB3 OTG has been known to be unstable on RK3399 Puma Haikou for a
while, one of the recurring issues being that only USB2 is detected and
not USB3 in host mode. Reading the justification above and seeing that
we are keeping u2phy0_host in the Haikou carrierboard DTS probably may
have bothered you since it should be changed to u2phy0_otg. The issue is
that if it's switched to that, USB OTG on Haikou is entirely broken. I
have checked the routing in the Gerber file, the lanes are going to the
expected ball pins (that is, NOT HOST0_DP/DM).
u2phy0_host is for sure the wrong part of the PHY to use, but it's the
only one that works at the moment for that board so keep it until we
figure out what exactly is broken.

No intended functional change.

[1] https://rockchip.fr/Rockchip%20RK3399%20TRM%20V1.3%20Part2.pdf
    Chapter 2 USB2.0 PHY
Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
index 947bbd62a6b09ce55320d0889ee8cf50ca59dfd4..93cefacc7a01ec8f9716de828077b3395a5e7696 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
@@ -292,14 +292,6 @@ &uart2 {
 	status = "okay";
 };
 
-&usb_host0_ehci {
-	status = "okay";
-};
-
-&usb_host0_ohci {
-	status = "okay";
-};
-
 &vopb {
 	status = "okay";
 };

-- 
2.43.0


