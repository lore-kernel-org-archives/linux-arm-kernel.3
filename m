Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2EBCA0EE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nwf0tl4nBa13UJCl6mfa+smPxgRED9nFICt3MHieDdU=; b=gMGT66rAySkprmcHLCM1veMftn
	cfsh+PQiLyAMV0lKRIpMhkWWeiPtMKX7KYxzDPOEZibOhqe65icGWzCWeDfH/k6PiLaHCkQEWGaEk
	RtSyfs6MpR+S+iC3go+YlsccSYzUU5qOqco17AVej8ZWD+YJK4uoaJtkzSgStTYnpnSHV9fsVFWlq
	Pkl0uoofnQkl4FS2FffIft4yM+NOZnVR7xU9fK7Ff0uAeqTz1BDJc3tavhus5AaFOLNP1FP6+u2zs
	Q5abqMF52luNPCrNnGg6uh0WU56PXkJoKobh5ZxqRLoqfJgneyHNInRenovoZlsJBKddtkWO0lMnD
	j84c068w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwHv-0000000C1hs-3AGG;
	Tue, 12 Aug 2025 21:12:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvdl-0000000BwR7-1qmn;
	Tue, 12 Aug 2025 20:30:38 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-af967835d0aso823769466b.0;
        Tue, 12 Aug 2025 13:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755030635; x=1755635435; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nwf0tl4nBa13UJCl6mfa+smPxgRED9nFICt3MHieDdU=;
        b=aPoeRda1rU3lMwH1VTpWebOj3zq4qh3H6Eec8oPVwy5YLJEnyH+LYaY1LaWyDq7bFx
         kn809GnnyBflXfYCxgGSdcEEDYBthYGS4fOILPQt9DG+dGjTJ8+0mYAmiHXqx0EQtQ+D
         CgwJ/ZnWRodKN6/hp6v0nXaBIrqDbRwqVBkMucUR+x5rK5eIWn+5jRiFOx9FHa62Mz4Y
         RLi3E0yIflEDGQ/dJI1QI2yA/jjok6/Hkf/HUrQ0r0eNEqMaZlsR7jd2ZBEAOhk8AG0B
         9JlS80MXjpWg/SbsZJ5s0stTIqi2/tAKoGYAE7Fo8N8x0TbQqP+3HEsUIBfEWNYgfjqQ
         0Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755030635; x=1755635435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nwf0tl4nBa13UJCl6mfa+smPxgRED9nFICt3MHieDdU=;
        b=JWmIpcoQq3AWjsr4fqS/FP+mwv4vwVWd7RiW0Xw9UTnUjlIb3l6caWbUivwCXBp8Bi
         kUBju0JrtfkRgvPZQ3eZKAetXCkjdZX4NNNUtimgGfdyDV3eVQjn1GXfPkdptHvgfP/s
         bQcEIBsyxqle651NYPDapdfY+h3JGAa/5h5/h+PP6XYREpnj55s+FHy0nfx3B+sniqAQ
         VOHv3RUrG8vUKQ9QJXAoClhqpsqc9rN5i+wGUThBNn415r4BLpxaCzdsHBrtVfDSCaXI
         ze9ZAsxvawrop9DjVEfs4MR/boIv4vfOkHFd0ikuccALNIzo2OnVGWo9cdbViPhiNajO
         HcRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkNCSM2y3FLs7CtrBDfMbrtAw4ED1dGfUs0U76fgi8ZVYvjoFSpnXXwBcfKfEEy+NZwT+N2rXNheF3ohp5yi8=@lists.infradead.org, AJvYcCX3Bjmw73wDyaFLLL13K6JQA7/P+325m3M4nKzyAHjVYaKjmSwL4RtO+KZF45ci0QIPCc9LvW5hlu7VQiK89WFR@lists.infradead.org
X-Gm-Message-State: AOJu0YwARs0kTN7k+RszBd6P0TYG8lr5Bq6eXZ1EPnRHfTMUUzGc/oDb
	9tqws/I29+1o4BzeRHv9QujcjDx7QGQvLcG6wz9KHWNEbug8lZLtsR7ytsM3vQz3Fzo=
X-Gm-Gg: ASbGnctnD5sJNogHEzBQhc/srrSQigSKxQfyTp7zt4RIpTDUbiHzDoPY3HNMYhW1aEJ
	snYap+Xjstb2W/u5ZG+jf8pj00Wf1XNELlPYKe710ssupwbYek14RPX4ZM0SOrnYnj4b3oVK0Tz
	r3clHzg6WtKfcZvSyQGKdU60jEZzZKS59R8W9bT0H+f/NX2DB8Y6JCx3inZsaPQUtRzW5FJq/zA
	1MB/2cH31kg+7IVW6cSW5hw6U3+bNHayy51/PVEgNV2tTorV+0qHzVPf+9eIphTrL0LXxt64nWB
	bsmSEBIYHRIbJi+QLqEFRQj/0W3I3pbUUhmtbUruILAZlzOMbZLt6Sd5W/G+cjg+TFtuxL5Ut43
	i47amh+DXn8Wix2gV8VOqK0aPKH7rMRsVTdMmhJrcAoqntuyT2yI=
X-Google-Smtp-Source: AGHT+IEfTzvBVYRLiP0bE3VohxDxUnqG+MLEAQ2wwCgb+zmjB2XzUTRJ02q7YAarySiFmVMKHcddMQ==
X-Received: by 2002:a17:907:3fa7:b0:af9:24e7:1c85 with SMTP id a640c23a62f3a-afca4e6c854mr56918366b.55.1755030635456;
        Tue, 12 Aug 2025 13:30:35 -0700 (PDT)
Received: from alchark-surface.localdomain ([185.213.155.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b58sm2266073166b.58.2025.08.12.13.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:30:35 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 13 Aug 2025 00:30:25 +0400
Subject: [PATCH 3/3] arm64: dts: rockchip: Add Bluetooth on rk3576-evb1-v10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-evb1-rtcwifibt-v1-3-d13c83422971@gmail.com>
References: <20250813-evb1-rtcwifibt-v1-0-d13c83422971@gmail.com>
In-Reply-To: <20250813-evb1-rtcwifibt-v1-0-d13c83422971@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pavel Zhovner <pavel@flipperdevices.com>, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755030626; l=2008;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=Z46ZEe7O+jWIb3cQLmtasBStIyvB4eOFL1/6Uj9pPf8=;
 b=RQg31BRxfObH1cVBuJD4fSCw1UhS4ukP9dJLnufNSw+VBfFIYLbjeudwPAaPOhmQ/zr8CmtWj
 T5kSwCxhfcqBhEHdI4Qbo6cHZoG/vAF0oDbaA1OF8Ax5LUPH8J7jLej
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_133037_483049_67148813 
X-CRM114-Status: GOOD (  11.27  )
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

Add device tree nodes to enable Bluetooth in the Ampak AP6275P module
found on Rockchip RK3576 EVB1 and connected over a UART link.

Note that this doesn't enable the out-of-band PCM connection. It's
routed to SAI2 M0 pins in case anyone wishes to add it.

Tested-by: Pavel Zhovner <pavel@flipperdevices.com>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 100ca2e23c6093ae517d741fcd047e2a8172f457..d3e70a646fbe1e99cb007e7d9f09da33beedc842 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -766,6 +766,20 @@ &pcie1 {
 };
 
 &pinctrl {
+	bluetooth {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -843,6 +857,27 @@ &uart0 {
 	status = "okay";
 };
 
+&uart4 {
+	pinctrl-0 = <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-0 = <&bt_reg_on &bt_wake_host &host_wake_bt>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
 &ufshc {
 	status = "okay";
 };

-- 
2.49.1


