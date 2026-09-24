Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6D9C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7STxnZVUQmrLVyWonCr/WVFvn6ySKjnlDMhE0HDJ/pg=; b=qPKzRXvr3bTW8H9s4M+lWImg3m
	IeFHXYsWVTntj12eqOEuSMBAfT3Dcl5JGRbDXWGnLBmItLYSQD8Qy2zJJEn2x/ES/ARcP7NxSiQsx
	yBPyRQ/Q0EnOxHTsU80f6UCRgfItHvff5PayyBZCK9CnGDb+ev5LV1+XTkL6YpA75U99+PE12Z9+x
	CdxDgWD7DxzlAfdzHUjsl4m9F57vkgG2eNItCMMh/29nEN0u+W17TIyB4t3DfB+l3/jERCVq3jYxK
	u29AvoLfV4KgtjboUQxYQM5uysbvXBDN+lWyr8u2S3wf5qO07BcGAZPNQphepB9J+BLJQq25FvekL
	VSe8z0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dfd-0000000AFWK-01cb;
	Thu, 24 Sep 2026 07:15:05 +0000
Received: from mail-ed2-x14.google.com ([2a00:1450:4864:33::14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dfT-0000000AFQQ-2sO4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:14:56 +0000
Received: by mail-ed2-x14.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso2091757a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234094; x=1790838894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7STxnZVUQmrLVyWonCr/WVFvn6ySKjnlDMhE0HDJ/pg=;
        b=o+kDUEn9mJmcrIn/8EkGX+MRFg8pfW3VWFBw6mNbxHEvpNtpIsqiuoFpaSP0lRpTi/
         j9el0Zl0UGNBmWkyai6Hc8YA9TSwzzRrxVvkhADJqHCzVfjvAoirDrUvhIogWSCK6+n2
         hlCJKNg/mNCgxoHs3wkcxea18KWwQhhj0GKdk/razNayKBE/FIAmsLWC1Vd2R5upQmPe
         NvMwlsyxR1vCJ6ynAkoswl/lNxxJ+gJUt007UFR/g2OGnEITbG4uBM5uyBKV+HLzqpcL
         be3ncPd9GxkB/90NZqJX72u8FgDtN3QKBapqoF8N/UQpbcXR07r1kddYU5gDsY3E/oRh
         WGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234094; x=1790838894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7STxnZVUQmrLVyWonCr/WVFvn6ySKjnlDMhE0HDJ/pg=;
        b=DFSNsccOFWhqL3h3FGe5r812QGxqCus/bbCmcG8m5wGGx9kxUlRzLzshKBck4g3ncu
         Exi7nhrfQar1pQk+hpTDnc+nN/5A1Csb5TxbTm4v1dpgFJXTJwQ3PSgNzz3TeCwT3HnA
         4gw9Dg2lokyoVysbApTikfaUI6iB2OjYaEqqE/nNaRfx5gu0uk6G6kIASSrGASZ57KfJ
         jTXfuKiLpEK7E0SFOiDRM3kP+zlYIwvovMkmmCX6xxYf5Sg/v2i93gV85Ktq3A5vtFC0
         e1Y/YwsEZ31EJ47kPLvspS0Z2i7IEycx5O9U3ybfSyCok2Cr3U/h5M+ao61iJxdQ7ImH
         tg8A==
X-Forwarded-Encrypted: i=1; AKwUvBz/tH7zYgVPwrrrrReco73dYD8ghgp3E2RrNbyVsCg6yifsK0fYq7UtQP6gHoNNuQpBAus0KcXkODA6PkKMh0/V@lists.infradead.org
X-Gm-Message-State: AFuF++m/1jfO5j/x91P4D6z6A+0iPVu0CGslPuuAEwLCOwhoziIzLWeE
	dSYb2VwBrrOCxNKcUGli/nvJ34BUWhLUVqTabri2irBYZgF0WdPlksHY41z7bxhzerM=
X-Gm-Gg: AYBFou2UJvCcFrLu3Kjw2LXT2HkNMczpm7S+ZYpwZV+5rDt3vJFdQFSutS83hBHqpvq
	I+LkRLJO43ncLdZOyYnMCr13fu9qqpQX+5kvdcUsqrcHNYfnCfjZMytny7Q7rIyxIr7+x94Kn1i
	lycZz0cRJNUaqcFQ9YwyRmxmKLJ09DwKShWEhqIpb2k9mb6AJVvBjOfmSyf66RrZD8Pq2Y1uBBF
	heORUiflJy3Zi+l67S/Nr1HZ3INoT0vkz6V/tltAx/ruSvUqP9/0ZsFUImTyn+FzHGBd9M6A2aB
	8eDxzOJs5BBebYXwYhIb86butxDHsnAzcoRQ63CUzEXdOax57BQQz0xTJfEDO7Eed7IIIQXLymj
	uFupYjH0KKCGWhYgxAie5SbPkUMvqIHZ20KHsufTaaG1U/2mwcaLoHX8meMwtBay0w8C9ahHiVD
	1HKTkU+cEdrkiPxoQ00ONp9mKXS33MRnzZEfVgjYfVMOS7jPfn7aXmx2Kp4oy3uk7+GEcQMRqYp
	h62Rn1Y222jaqeDRovJ6/p0jxeojw798y/JeCjWxhZQwdCGuOQjifDBEQ==
X-Received: by 2002:a05:6402:44d0:b0:6aa:a040:cbd3 with SMTP id 4fb4d7f45d1cf-6aac8ed4399mr891513a12.3.1790234093718;
        Thu, 24 Sep 2026 00:14:53 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:52 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable M.2 B-key WWAN slot on Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:44 +0200
Message-ID: <20260924071445.441822-3-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924071445.441822-1-adam@wermuth.pl>
References: <20260924071445.441822-1-adam@wermuth.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_001455_736386_9C5852E1 
X-CRM114-Status: GOOD (  12.01  )
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

The M.2 B-key slot on the ROCK 3B is controlled by three GPIOs:

 - GPIO0_C6 (4G_PWREN_H) enables the 3.3V supply of the slot, which
   is generated from vcc5v0_sys by a dedicated buck converter,
 - GPIO0_D6 (4G_RESET) drives the RESET# signal of the slot,
 - GPIO1_B0 (4G_DISABLE) drives W_DISABLE1#.

Unless the supply is enabled and both active-low signals are
deasserted, the module never enumerates on USB. Describe the supply
as an always-on fixed regulator and hog RESET# and W_DISABLE1# in
their inactive state.

Tested with a SIMCom SIM7600G-H module.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index ad9a91c0d0d0..908bb4425e81 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -98,6 +98,20 @@ vcc3v3_sys2: regulator-3v3-vcc-sys2 {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
+	vcc3v3_wwan: regulator-3v3-vcc-wwan {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wwan_pwren_h>;
+		regulator-name = "vcc3v3_wwan";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vcc5v0_sys: regulator-5v0-vcc-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_sys";
@@ -220,6 +234,24 @@ &gmac1m1_rgmii_bus
 	status = "okay";
 };
 
+&gpio0 {
+	wwan-reset-hog {
+		gpio-hog;
+		gpios = <RK_PD6 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "wwan-reset";
+	};
+};
+
+&gpio1 {
+	wwan-disable-hog {
+		gpio-hog;
+		gpios = <RK_PB0 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "wwan-w-disable";
+	};
+};
+
 &gpu {
 	mali-supply = <&vdd_gpu>;
 	status = "okay";
@@ -655,6 +687,12 @@ wifi_wake_host_h: wifi-wake-host-h {
 			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	wwan {
+		wwan_pwren_h: wwan-pwren-h {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pmu_io_domains {
-- 
2.43.0


