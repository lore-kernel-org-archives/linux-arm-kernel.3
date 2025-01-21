Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037F9C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiSS1nYpUCNiSeYMCfYpcAR25/sptrb9q7TkmxVtubc=; b=29OaToxLohvJS/EvShRHGbxYj/
	xob0UHqjXXLTS0S7XBrS+dwtV5dn/NB4Dhm5PrEe0eeT8DNTGNtNTdtJIlafCrLQ+dZowkqoRtkX1
	BlzK6u4B7XqxK0Acjs2hFvk7bvmOeRMamsbESvRciIXXuSxpPQyQthS64yHmxsN4CzkfJ4Kz+LcaA
	gg/x41I8f9ED3HWftHWoTKejf77zNhHIQHCe/tsEklB93H6T0/Ri0MTYOxLxe3UbQIGDyRUPnFI9b
	kVCTrAK3jfwimvBZBitAARpOGdKgD9+08M247JhHFLmUofIfmltwqtqVpCZQArEDbcmHfapGMSN0a
	xl9to9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taDqX-00000007v2Y-0VS4;
	Tue, 21 Jan 2025 12:59:09 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taDnn-00000007ub4-323N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 12:56:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaef00ab172so852862366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 04:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1737464178; x=1738068978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiSS1nYpUCNiSeYMCfYpcAR25/sptrb9q7TkmxVtubc=;
        b=bGGr6iJO3o47YZdBJwjlIFin5mbsA5TQwzLmYnHTqHEUQx5XW01UTerW+QVd/3l+uY
         VPYFy8Tvj2yDVi6BwDdFyygLsuCpij70z0v115KFTf0WBxAZDmCohWpXIQcPDkq/DJZJ
         O+HnRg1nxfbsjXWf9Nw4sF57Q9ERHCkyJMVl+CSPE/xAqtlQ8Lo5AnpawUfdve1E8Bh5
         XoEa+5Vu2HRnufUyMXysiuojfIvj6VX9jCulTA3/adjSr3Mm9aSQ2w4VYV1wQr8k0e6L
         jY6AY12EYT/6QKOAze6hzq3nOQdZfMWaWviagEFiSdYymCgPhbQ+BUlW+rPrfoN+s8Kf
         2sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737464178; x=1738068978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiSS1nYpUCNiSeYMCfYpcAR25/sptrb9q7TkmxVtubc=;
        b=fXp3GVWbPEBHX2DM3UbdW2x2ByAXzkqb8IZmXUNzBhfqzlM+f+zRbn0GG0/FkhoWQp
         UBheQ8z7la4gKvJZKB/A4A2GYzOuT/CfgzNr6j7tEX5WNFHvw9qGpV8vYWInZCtqdkTm
         YHm6cWeQO0Pa7UrzTP6AzCpN2imuS9bFX3QkkrrmqdzFARtgTmbP5T8QTuxUE0S6NGQw
         4ueS9FsIHefdyE2fgQSgzjzkVv53Y8/jqucFcqF+8fuBeIv8iymaZebP62NB9qRtxud5
         lOm74iibegmwsFqQ5CR+nxGYuSk7IKHrFmrSmM3rzseDDy0XLwSFiVRL9QRUVEYgssLv
         eD+g==
X-Gm-Message-State: AOJu0YzEcA0wkethVh0/4/gASxBiQr3b15Ik6IlQT8k15hR4iH5PyafT
	TalVgtaMR8dOBAVYyhcP4Vg0a3dhiH6ok2Dq+Yg7A4Ee1lkqys0PLMwiDvnDNb8DpGFrF2AW868
	8Zxw=
X-Gm-Gg: ASbGncu/6Ghk1RcptURXwbAf68E7j8JOG4ppXqBgjtkBU5uYPh/1yM+7tclfYDzMmr/
	80Pl5z0VngWhASmRTAZQSISBMeWj1F/b74LCAJiDPSLHQOqRuA1djsr1lJeXmDmt5va2oDjKLOU
	2H7c+tcNuyeAj6gQv8jdXdSMB6+YqRkAbneZHK7m3ff9VzV00I6gdSk87MUyjdc1zcqAk8Ti5+l
	h9nLbUaD8BVBtgzg6DEgS4X9qKWmvM3Dmpn34dtjIgpRPMNUG0AZjN7DJ15VWq64mwVN5m9H/o2
	6yubKGj1kySkLE5DfOGliq+aog==
X-Google-Smtp-Source: AGHT+IGNUrQ1owGiuycreL+ecfL6xNDC4NN9qxkE8FnFn4B+VO++Fb989ERQC0artIbK2G1crar2zw==
X-Received: by 2002:a50:9357:0:b0:5db:e91a:6baf with SMTP id 4fb4d7f45d1cf-5dbe91a6ce3mr1051424a12.14.1737464178063;
        Tue, 21 Jan 2025 04:56:18 -0800 (PST)
Received: from lczechowski-Latitude-5440.. ([78.9.4.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce0529sm740943866b.43.2025.01.21.04.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:56:17 -0800 (PST)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: quentin.schulz@cherry.de,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Move uart5 pin configuration to SoM dtsi
Date: Tue, 21 Jan 2025 13:56:03 +0100
Message-ID: <20250121125604.3115235-2-lukasz.czechowski@thaumatec.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121125604.3115235-1-lukasz.czechowski@thaumatec.com>
References: <20250121125604.3115235-1-lukasz.czechowski@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_045619_758860_FA5BA9FF 
X-CRM114-Status: GOOD (  14.80  )
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

This commit is a dependency to next commit in the patch series,
that disables DMA for uart5.

Cc: stable@vger.kernel.org
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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


