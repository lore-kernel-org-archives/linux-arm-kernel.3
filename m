Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812DEC44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MMeVGfxElC0Lxj76VZe3jY3LwxYN+PY2gW2pcA4KR74=; b=KOicw3oOtMh7cTttH1clQiGw/J
	gQDOrt/ZIo4Tx92jxA548c2IWPM3IcTMpMhbCHz5Wzl360NkNf76UO+viNhwXFcN6qAOrA47+53M0
	jnPgJmb4MVPcoJuy+3sqK7X1RTbi4tvXP1whVIyOJuOWeK2oCFgqULZhdWbXc/gNm+ZZSLGDS0i1r
	PUehfdkZG7IO83G85akWapyIgm2C6LoD7Op7JvxTJpxh1MAz0TlC0OzdHRbAO2qG+5JR3wSbrCjGK
	AnMZ+lmBGhhnwcXnFReVz76VJj2gDuWsxglHRuylqKa5MdniMqwRtiF49qmn92XfrrBivuC2oIxdK
	3A8THxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcyD-00000000fsf-0beD;
	Thu, 09 Jul 2026 00:50:29 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcyA-00000000fpt-0RFq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:50:27 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-80bd5b5b3afso13848757b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 17:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558224; x=1784163024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMeVGfxElC0Lxj76VZe3jY3LwxYN+PY2gW2pcA4KR74=;
        b=spVcR9dQQ4YoSXk/aU1KbjWOeER6fT/n3ywDMLdYk3oPrxsKGNqDJua3IZjZq6gcK+
         Ld0flbqeIWeEcyNJqJer0grgCD1VG05IfvQbgD0CcdkhJ0LVnFnEbW1bLNc4pEPQr+f1
         EsVd4rQZbPA+SfVqAnrxK069sTOjzpERu5XxB5aTj4kxrtdF0uxv+mdO1goDUssk8twO
         jA/hgiI46JcYm2kFQHB6hfxrymPkPVscgEkeuvuldl6b/Cy7CeRBwP3cPrYsJlH+eH9k
         VuPGtjXHI9RJTDRLJkC1zz9PCS1S6BeHR+jwnFhZTGSRWKWsmd33ufBDfKgyHEfukuwu
         Jsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558224; x=1784163024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMeVGfxElC0Lxj76VZe3jY3LwxYN+PY2gW2pcA4KR74=;
        b=cVZbOIjyAd7gIyIM3URY3Ok5mac2+LDTGUZmWqn7Y11ul+qvUHRo96fLj3z455dFCv
         v77WXuTGxmOQ6nEHT0vnk8v4c+1LsrXelACFmWGtXdaCTTUKYyx+TgDUPGRHUiWvdzem
         gqqCewzPgcsoDR+c04ZuDeH79rd6siWqqK0PrE2qUlvxePJFTDla8Qrer+Xzdvzh5yXP
         +vHejtBQtTb0MzLKedG42/bUECS/mdrq7UQtVSmcbjsnCC+tl0NbENJyURrjWITnl6Mn
         EbtUd5G1O5Ocatkv3mHVYKrI9I3mDn1co6bAcx/6WSwNtaKLy86C/NGZZQJCGhNmVLrt
         3irg==
X-Forwarded-Encrypted: i=1; AHgh+RqBnvQ/hnf0nnIbhIMK+VuHCEvlYInmkTJZIJrWhKsOwBN2Yh3RaHEmysIY94gj8wUJJqGJxeCMe+OHs2N26Q0s@lists.infradead.org
X-Gm-Message-State: AOJu0YwrVSEcogmmBIJ0yPOlDmR4CFo0RuZEeWxUfd3EQw2xclMSD4LW
	ZYpEWYeOKeeCAClcxrURMteXk8WjVvktWjD9FQUVWa6ZjKbU6pEwKS4l
X-Gm-Gg: AfdE7clWWuBo8XPTixIdfw0x4j/01npAVOEd9Z9qSpP/XEPN7gOqJhikbwud26tEtky
	7UxXsZkuFIuMDbeWOVdrlgEdss+81j4a72RaVVhUouayqbkQc6u3X/EY1UIv5qOOzaBlNBNnvFM
	8piVLp3keOEQGw7G7uEdbkC7kiWtoyrYd93rttXpSOOfr8bbV7PoKpiS0W+vY0OU5L9IlLTV5xF
	LNw/Uk5PW20HVhErDW6DWAj6KAS0owR2xvtxdPbFSZzoxiF47k1a0ctKa13+2yxo5QY/HRlxqGY
	QqCDTLwxJ6Imn0WYdwGMkz+jmL7efN19SUzqVrklv1R+SPKlyCJDwtv+4g4ckS9PcXU/7TI+khW
	MYL/T1CkUAzJWQ4wose/IAeaLM/JQZRy51yO6Alak8x5MLhIwqfE8pqbphfYWGMoyiNMZ1uqUSt
	Hq1TJjKu8H0L88Dx9+9LFxxMmC3MLu6KSHlbq9EOPauoMSBqn1pwyPUHVhvQ==
X-Received: by 2002:a05:690c:60c6:b0:81e:6a10:f90f with SMTP id 00721157ae682-81e6a10f9edmr12376517b3.17.1783558224268;
        Wed, 08 Jul 2026 17:50:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a800:b434:bc3c:5012:1fe:ac7c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm5645667b3.14.2026.07.08.17.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] arm64: dts: rockchip: Enable USB device mode on rk3588s-roc-pc
Date: Wed,  8 Jul 2026 21:50:05 -0300
Message-ID: <20260709005006.413145-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_175026_153964_59610D6E 
X-CRM114-Status: GOOD (  12.11  )
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

From: Fabio Estevam <festevam@nabladev.com>

The USB3 OTG controller on the ROC-PC can be used in device mode,
but the board description only enabled the DWC3 controller and USB2 PHY.
The USBDP PHY remained disabled and the controller had no role-switch
default, so DWC3 did not register a UDC and USB gadget drivers such
as g_mass_storage failed to bind.

Enable the USBDP PHY and describe the controller as a USB role switch
with peripheral as the default role. This lets the controller register
as a UDC when no external role provider has selected a host role.

Tested on a Firefly Station M3 by binding g_mass_storage to expose the
eMMC as a USB mass-storage gadget.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index 99853880aaac..7150d5f7684d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -833,6 +833,12 @@ &usb_host0_ohci {
 
 &usb_host0_xhci {
 	extcon = <&u2phy0>;
+	role-switch-default-mode = "peripheral";
+	usb-role-switch;
+	status = "okay";
+};
+
+&usbdp_phy0 {
 	status = "okay";
 };
 
-- 
2.43.0


