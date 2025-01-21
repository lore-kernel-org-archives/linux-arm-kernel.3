Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E49C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgpZk5oqihgVyzrI0fxydSyp3ZXeLQXDu/o+jWDaK0c=; b=EeENufuEfH45i7GbABnZuWULnQ
	JXJK8CQIN2jWU3mojZ0nsJU3CIkD2Qqk+J1aTrfJJZHlH0AS2jFofqKt815tEgoms0CYRfTRI9wgI
	HEZJwmDpYf4PqjYpuHmDtA4z9G2hV08ZONB0pbMQgEq4uqm4bNrxDuY5iKCrB/gohjo1GiDMr7/zt
	OH1Fmd0Og3wxEqx6iNaW83MxAF+73f5dLuD1+Hbp/z94dpIaCIv+IVUEBHF8W7tNatygPSFp2h8tW
	bD5nxJgOVs0YXX0/L8y4iUVNPBbp0ijSuPd6fwZNIGN87m4ucIQkbXlJkPd4j53nPyE9vWkYa9hsK
	7stSO9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAWO-00000007PNl-34g6;
	Tue, 21 Jan 2025 09:26:08 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taATc-00000007OwD-0rx7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:23:17 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so9469064a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 01:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1737451394; x=1738056194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgpZk5oqihgVyzrI0fxydSyp3ZXeLQXDu/o+jWDaK0c=;
        b=ferKJpPvsl6c2YntGJrSCoIcV6LO0etxNH3M6dkK/2C8Eaa8HZXtrlcC9f6OGDDOiz
         eT91pphwZRav6Wj5kEwdSkif5twWp15kctt3M5xT4i9BmwnRf61keRyzVpEOAUxbmFmB
         DQs/xCeBotIyeP+MU8/swNZrx7DXlNR0Zu9iLobqctn0eA/C7GLEA30NO56Le74IKdf3
         HQCypYWXuu7CD1ZCDJkNwopRerEmxldnHdGkhdKW/UCR7MfgTV6FNLndoAGxF9ezj92C
         1mpNE9ooviXFdj726nmgaEI4WybMX/cb7WhyxgcFtQPmBs0vxgbYZRyy9ArH88ryemxP
         LPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451394; x=1738056194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgpZk5oqihgVyzrI0fxydSyp3ZXeLQXDu/o+jWDaK0c=;
        b=Ob1tN3yhH4dwDr4jR0uPwKv/PLWGXUkLbNtkIZuPEjePVdfelrtRfjDHRSxzZuTiBi
         p0SA5A/FOeTF2pU9F/7zCosblHdtLMHt6FR2cnimf2DB38WeHCljXZEPaJc2UoG0q3X6
         jRENHc8iJc+i0JVk1EqbmFKYkGhQjo7978wmmWQXkiP88M25DHYp9+O8L8lvuYKjlJC1
         rirqvr6bpxVHjBbIqHIb27QNyQth6ko8UPNdq9YvrS1eWR0+cmcc6WompiGAhmru/5wo
         NJKZqBUWcRrGlK0u4s4KlefxMINM3ucZYgozd8uXhjn2sGAo5KpKUhPMVbAz0hBdXSY3
         L0ow==
X-Gm-Message-State: AOJu0YyTFKn3NFmDoqks1TRqZNEbg70//DVhUjGP3sKvoAEVNu3YVCiX
	dXXy3o6VmcK4xR1T/K01pemZKlbxJdagPMu+in5Tk/IYgl5cVHFV4J/20ClpkbhzIg3SIpLxOlf
	n
X-Gm-Gg: ASbGncskcc//R6dOcMzBb1XVX9KRYnsycbr9gPijxRJvR2xji4yTT7OMlNK6Tpv6WhD
	gVePw6stQrR5nikOdiHtWDS0c2qJH8gnHa7HRdfv28BaqJ1/SY+wAtJxildNxBv+npzZaU5fQzo
	J4OTH/ovbZNnwS/nwWfq1OONY6iuOWKVenTON2TmW9g0tLjITu4qqR7G7OUhJGnHaObSSt+lX8u
	0chiCcR2f28a2CEgcLzesei2o35ZpvGo7WM/IQa82XSAAwuJPiYzyDebWL6S+FGYZ3G0VsGLpw4
	gaeplJmocWd7Tgaob+RYq6cVHw==
X-Google-Smtp-Source: AGHT+IEGFMDZvCDIvt9A0W1+h4kL2cAI+LSHFPGwDogRfwqCXhx8sDnaMyyEk4Z9cSK2lRIuj2FPsg==
X-Received: by 2002:a05:6402:42ce:b0:5d0:8359:7a49 with SMTP id 4fb4d7f45d1cf-5db7d100348mr15914293a12.0.1737451394344;
        Tue, 21 Jan 2025 01:23:14 -0800 (PST)
Received: from lczechowski-Latitude-5440.. ([78.9.4.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db8942cad4sm5681726a12.60.2025.01.21.01.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 01:23:14 -0800 (PST)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: quentin.schulz@cherry.de,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Move uart5 pin configuration to SoM dtsi
Date: Tue, 21 Jan 2025 10:22:54 +0100
Message-ID: <20250121092255.3108495-2-lukasz.czechowski@thaumatec.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121092255.3108495-1-lukasz.czechowski@thaumatec.com>
References: <20250121092255.3108495-1-lukasz.czechowski@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_012316_242830_494889A0 
X-CRM114-Status: GOOD (  14.13  )
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

In the PX30-uQ7 (Ringneck) SoM, the hardware CTS and RTS pins for
uart5 cannot be used for the UART CTS/RTS, because they are already
allocated for different purposes. CTS pin is routed to SUS_S3#
signal, while RTS pin is used internally and is not available on
Q7 connector. Move definition of the pinctrl-0 property from
px30-ringneck-haikou.dts to px30-ringneck.dtsi.

Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts | 1 -
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi       | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
index e4517f47d519c..eb9470a00e549 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
@@ -226,7 +226,6 @@ &uart0 {
 };
 
 &uart5 {
-	pinctrl-0 = <&uart5_xfer>;
 	rts-gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index ae050cc6cd050..2c87005c89bd3 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -396,6 +396,10 @@ &u2phy_host {
 	status = "okay";
 };
 
+&uart5 {
+	pinctrl-0 = <&uart5_xfer>;
+};
+
 /* Mule UCAN */
 &usb_host0_ehci {
 	status = "okay";
-- 
2.43.0


