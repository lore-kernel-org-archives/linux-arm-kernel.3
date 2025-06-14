Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2C1C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 18:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8mxLnGx9jfWVN0B9okkdbNhtWc3iZ46snC2AVhjIeE=; b=p0oqTWPnKGS4Yn8/l10mIqUe7E
	ivDZRKJYB4lue6RPztWs4x6U5MYHW0bc8+splIcwx+rZvpRNVnFSeU3Lj7N7UPWYLajAmCPTTyJ/Q
	1+iW5egJ7OBgCMFvJjZ7L/J4dGEwr0U1eH2aieccCTG/XUCMcVo4K1T6Hg8mmKmWLaBPycL52Y567
	N0K4TrB2XNNyutW4G5RcW/lpSV6nCd/Bwh3cGy4PwbtqajSe/ntWMWYeMcSs0NBfxnDYKeLAnWVV0
	yiBFsL7RrVfz8eN5gjNjhcKOnjOL9UX4AS/yR5t2v9LAgQ1agFG8m5f7PSw/LXDxoeFqjfKlXCrDP
	Q9/JjeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVXu-00000001ez2-3DoM;
	Sat, 14 Jun 2025 18:24:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVPN-00000001eDB-2dF8;
	Sat, 14 Jun 2025 18:15:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-451d7b50815so25642985e9.2;
        Sat, 14 Jun 2025 11:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749924912; x=1750529712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8mxLnGx9jfWVN0B9okkdbNhtWc3iZ46snC2AVhjIeE=;
        b=L60qW77dwGQFm2PAAmsENAidg+kLycAzkCOPagAcqWf7G6H/forFKJRjQMOzZL9CXJ
         7kT/FuHv9ugza8weuZnSs0ipOvgsMgnSMmZ7h7MzpmFAOryXvlmgMVi9fRwEplbIuYGn
         juowG3WGAYOb5mSe+gZ6YF+GZLWydFoTSBKYgQm9PlTm1TmQ2Oqui1ZqXHWi6AEWQ4V+
         fOFnIqkTLJeg7wj0Hw/Eb60xlv7VVHMexlR2xwD2K/Jyf41f2zQE79P2cgR6IG3Bw87z
         Ky/K9B1cX5XuCjdVnXFF1ldKBHlMZ5CaFKT+v0D3Ji3VqCx+TztlPF8witdmKtB2bbd/
         +Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749924912; x=1750529712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8mxLnGx9jfWVN0B9okkdbNhtWc3iZ46snC2AVhjIeE=;
        b=PZ9uFWaNx4m8/5zyzJx5uaL3Rl9SZHWxTa7GXSMANKKYLsC/rOOs1gTDuqKg4kiR+Q
         CVqZgCKY176kpg1jNvTmSQwFhqNEHQToLLEGs8G6/XgKPBvnLqhLpyjQ6mWlNY4paYEA
         D/fUK/hrs5W4SepTQcEdCNzcSL/NtRTyIKtSTMCWxrXI3iagEtUMnweUS1U0Hn8DjbtX
         Gx9jMsTm3JYcDOKPoTSq78tvmQ5bFUmvFSsO64pEowwO4w8z7bba4StMoqdEkHN4KGRN
         GoC+8ZO4YpL5UBrG8S8RvmZhCxDksw0ngvbuyYl14g9gpwp8WMSI6lFCOjMxjgxLjs2L
         jiww==
X-Forwarded-Encrypted: i=1; AJvYcCU4TVEL7a6cQBLn5mVdTWBQiOSUXwsyx83ADDGmehxIxkKbZQotE66GAhJSAgh2lbRGPwxbu/uuSdVAPVJetXM=@lists.infradead.org, AJvYcCUYZuqIdhYjz2bItzplajshO6E1c4CHNjE6Rnx9C6SGCy7bhef+uFo6fJSCatGX/23rnyxQAJTdgE5TnkKlXFiX@lists.infradead.org
X-Gm-Message-State: AOJu0YzcYLmqoee5WU7bs44mLkEPaJ2+yXkJFQ27Qz50nBz+sAes7zBu
	t5IaR7btlJPJHxY86yXnD7LhVXkv/XctpZHeBsTdPn8rsddJLTesBMZy
X-Gm-Gg: ASbGncupZgspPwZ+u1Jv+CNiXGLkofaiaPukVMpF/SJqzBMSu8nEJqhFCf1hYKprtRn
	pX5c2bfmtRrk3NZRHpkstCXTMtzt2RL8CGa9lx6QSToiSdPhtenITpbih1w26H7E3zsDCR9nlBl
	WSyCP4z7F9v/D2KusxaaBY33XyMS7jrgLnQUsm/moax3o+jRMtQ8TNCiWrUZpQRu5krRJsRg8Zb
	FJG+sUwyjD4JmHMVFlt5EXiqEPCWx8UMV8OX65vmp0cbTEfIqcCyftWovXh+3aAS2B3qbHj/26u
	Q9QEdpTdMQODQ7AbqGxashL5amP0GIAeK+x/dSjMsdW8hnt2LOlAF9RdwBA80ZIs/wLssju7BMU
	HdA==
X-Google-Smtp-Source: AGHT+IHfDffm8Xm7lmqJq0GV4IBSE6wyNVVkwdv76K0acnYFf+Fv6x3cdYOhC4q+/sM+5N2Ciwky2g==
X-Received: by 2002:a05:600c:3ac6:b0:450:ceb2:67dd with SMTP id 5b1f17b1804b1-4533cb5751bmr33952525e9.33.1749924911946;
        Sat, 14 Jun 2025 11:15:11 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm88195255e9.4.2025.06.14.11.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 11:15:11 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 14 Jun 2025 22:14:35 +0400
Subject: [PATCH v2 3/4] arm64: dts: rockchip: add version-independent
 WiFi/BT nodes on Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-sige5-updates-v2-3-3bb31b02623c@gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
In-Reply-To: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749924902; l=3032;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=3DJgRHBIHaRkfSksrkJeFZcxwEJRSeWYIwn581kib/g=;
 b=pYDvU4yX90IhZRBowVTj2XS+CEv2E5YaZeW8Hepxa+3M9BRO7ucdAHue5BhB21KS+vq0N7egd
 OmhV/8hc5X4Ak4KWKLhBCtFtvIzyZKYELQQ5xj69W7R+1R+Hb+W1Ygh
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_111513_671865_655464C5 
X-CRM114-Status: GOOD (  12.29  )
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

ArmSoM Sige5 uses a soldered-on WiFi/BT module with WiFi on SDIO and BT
on UART. However, board v1.1 uses a Realtek based BL-M8852BS2, while
v1.2 uses a Broadcom based BW3752-50B1. They use the same pins and
controllers, but require different DT properties to enable.

Thankfully, the WiFi part at least works without explicitly listing it in
the device tree, albeit without OOB interrupt functionality.

Add required device tree nodes that do not depend on the board version so
that at least the WiFi module can appear on the SDIO bus.

WiFi OOB interrupt and Bluetooth function support are not enabled here, as
they require module specific properties.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 801b40fea4e8808c3f889ddd3ed3aa875a377567..fcc8b7d8c1cdc79efa7a37e9f0e5b0e6f3c8758c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -205,6 +205,15 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v0_sys>;
 	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on>;
+		reset-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &combphy0_ps {
@@ -757,6 +766,30 @@ pcie_reset: pcie-reset {
 			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
+
+	wireless-bluetooth {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	wireless-wlan {
+		wifi_wake_host: wifi-wake-host {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &sai1 {
@@ -784,6 +817,23 @@ &sdhci {
 	status = "okay";
 };
 
+&sdio {
+	bus-width = <4>;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-sd;
+	no-mmc;
+	non-removable;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	wakeup-source;
+	status = "okay";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
@@ -803,6 +853,13 @@ &uart0 {
 	status = "okay";
 };
 
+/* Used by Bluetooth modules, enabled in a version specific overlay */
+&uart4 {
+	pinctrl-0 = <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
 &vop {
 	status = "okay";
 };

-- 
2.49.0


