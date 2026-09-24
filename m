Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A272C98316
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/q4IHYKCy6ATe5C6R4o2zyKGD60s2UPYSeHPBkDVEs=; b=JTom5BfchZdvIW7dyPjr0G0BUP
	GfSPe9+9i1NSihiLmKtOc1zv8nTqvAd/umlgkmiupANa5lKi6oCeiJ+C0zbnyJLnQSOBdQdWHK7Lr
	XzwEQpjfHbipOPsEU0zAe8uaXoCsMJUALP2buvGVisgyIceuBmhP8v6PfcJKy17jKgRFRSBls0byu
	kyYVpVkElMC/DYmo5fhDoLSVwxIS8iqsd3NG/02q31n5jlMLOxtXZd8S0C31XIt7e+g3GQNk5WUoI
	l5AHBn4gWgqmsk3oOrQOSSYNPGOLFZL0J4bBgVJnnENasEOZrBUjJhxZC98fEodPXSSwk0B8CwQzp
	Re+jNpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dfc-0000000AFVU-2ybX;
	Thu, 24 Sep 2026 07:15:04 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dfR-0000000AFPM-2KeU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:14:55 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso2806203a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234092; x=1790838892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/q4IHYKCy6ATe5C6R4o2zyKGD60s2UPYSeHPBkDVEs=;
        b=kclWb8x9/bGGZomPAwVMgKKS/obKK6w/Ck+eP6q0n9NQw5rkJ82P70o2f6OPAiRI5j
         zS/5erLtltJSJGubogbaylI7RF56BaWjg2U0kMNNSb17Lgf3Sehdt98IG0fV+Gn97Zo/
         bsLUAPFILWovWe7YrcNgp6fud1zCOHzQmdf2c+PWryNYqwmujxVtjprSieXeUeRJkVMf
         oGl3hmSA04KSgxpvFQyT6Ll5Co8PPEecwCrNRmqQuFTSwPi3jfXNpkV/ZAJ0ATsgM51Y
         XogAMVdUX9WDvr8F8D9P2bogC8cl1MlLY1Jb8H1ikggZvVmeFtSG8Eu5hH9K7P+zf3GS
         UsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234092; x=1790838892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/q4IHYKCy6ATe5C6R4o2zyKGD60s2UPYSeHPBkDVEs=;
        b=LlCBYBJYgdIPHjES/tNvEkwKzbIcBlQEhhO1gGVnoN0c33O4eWXczj9jrgm0kyA/86
         NLqS8GE4b5TJepzu0oiGj7Qr+JSU6Jq3g9wB08CyHAb4vfHEYA/vMbdSGPJ+uvvsK4XL
         JXJ04JVQ5q7XvgaK+3QDgivES/YPQRD1idIsBmkfJwXQOudl6SqPZNb5ebLTd6ByGr2m
         DysmjL9KnBWQ2SWeixWeEZIZAOkmAjC1dnOvWAdeyZvSkXqqf6zHu283IjECsn5eucoA
         7iokgBoTvXaQ2Tc6k7plDaZxaWvpxDjDc2OI+DRAX5GXLk1F7h5o2hIMx+Dcv0lUYeHC
         z+5A==
X-Forwarded-Encrypted: i=1; AKwUvBwP7cbkP13LIoxLG8KXZGIft6oRxewjMHFQI8IZyAb7Qo3mDOx/CT+2d96BY+me9tw0B2aqzEdfR/gSZzIpgasB@lists.infradead.org
X-Gm-Message-State: AFuF++mu2Vi4qv+2b3XRgjCdS8Skxz9Yia+s8Ny9izkYV1R4jzYvT55V
	yonOt7ZvPv67M3YoVbvKJac9lBBDHL1p68aSzGzRBTxHm39QEm1KAq6p7RH31/xPphx/+ICshAM
	iSRoo
X-Gm-Gg: AYBFou1JhZaO85+BtgPea8yUbK+ZkR/gxawofeJ/gFUOg3OXKev0DWzlm8EZpFjkQz3
	IZcEJx62cBBOmfjgE3S7WTg4f4O6QP6XLsFaQONTigpsfaLeoQUqPhAKiQzmaYx2wlufw0RW7Ig
	bn92AwNQ2lYw3mZm0g6ovwGksBWirBQbFs10SwLn9/Ym8+ERt3iVwbAmkhbldLEHRr9ksmpOwHD
	wYOwW1D0l1WA7SfKRRKzuVHc9OBrFE2GXh4/02jrYPWzfAgJXvz5NyS/HcO50stq8zszoZmL7+l
	xxIo5jdN+Qx50At8RJoY0wTo7qLXGaF3pIuyzT2IeKBrRAYrCMMNeME3uNl22J5Tjhw7aeu6FAe
	jaJNP9Lhsgl0b/fP6DNzmeRNmZPLuMLQYl8gsOa3QNGJVSxNSGl9g/LFf4msRWLcN609rGAKphS
	118XRbN6SW4VKxFEsx67jxsnOsAbvgx2oIMpWya6CI9DdrTOSyGW/3FeDicExLd6655izN/thlC
	JnEZ1N0gjLtpmm82l5a1KXWTUkccaDIT5Jk8267ODKb9xM=
X-Received: by 2002:a05:6402:5385:b0:6aa:aaf2:f6a0 with SMTP id 4fb4d7f45d1cf-6aac8ecf65bmr1299955a12.1.1790234091341;
        Thu, 24 Sep 2026 00:14:51 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:50 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:43 +0200
Message-ID: <20260924071445.441822-2-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924071445.441822-1-adam@wermuth.pl>
References: <20260924071445.441822-1-adam@wermuth.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_001453_599595_F400633F 
X-CRM114-Status: GOOD (  12.44  )
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

The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOST3,
which is served by usb_host1_ehci/ohci through the host port of
usb2phy1. Enable the controllers and the PHY port so that modules in
the B-key slot, such as LTE modems, can enumerate.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 149a5306bb03..ad9a91c0d0d0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -758,6 +758,14 @@ &usb_host0_xhci {
 	status = "okay";
 };
 
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
 &usb_host1_xhci {
 	status = "okay";
 };
@@ -780,6 +788,11 @@ &usb2phy1 {
 	status = "okay";
 };
 
+&usb2phy1_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
 &usb2phy1_otg {
 	phy-supply = <&vcc5v0_usb_host>;
 	status = "okay";
-- 
2.43.0


