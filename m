Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5426DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 04:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I9SAvhC/1O9xhOgEJgltjPIiKB+jL/KUsbTgQGFrTOI=; b=Q5I1uHGQ9cYl/wkZ0iicVouSFD
	XHnEz4JihPm5Hj0yOV8u2LeRNm+w+jD3Ei+A7MdY50Ym8Zw5zi4EzWHGrh3cqLB5HmORUzMHWKsBK
	G5P9PJxzSbvCMGK2XlSIcja0CElPZYCQErPF6EhUTMzjDuG7xN+hjiSkLAxxIn8qgGYxdk78ruoqW
	Ipp+F5OgdrWJyAxGmllLwiVLzwWtQf75qMb/XPy6ufQexzfRn8l25J//cI/BuUsIk/+0aemqrZS26
	tU+GYi92SUqxdIBKLmoYFH/WoBGCmtAjS6u8Qq5OM/Tl8OGfwCgNyfgcQkBUBHtXcUHy6NvnfMs0e
	KIgtNJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxkN-00000002j9J-0RVx;
	Fri, 13 Dec 2024 04:57:51 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxjH-00000002j2a-17Ri
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 04:56:45 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-728f1e66418so1201306b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 20:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734065801; x=1734670601; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9SAvhC/1O9xhOgEJgltjPIiKB+jL/KUsbTgQGFrTOI=;
        b=RO73Mfd+mlIV3skRrCK68/fwE5sKSAx7YWudX5bH7ky2jyKBn1SUJbtMzYHKQWAGkC
         WP+QMBeRGTRmbYInrauxFrx+OLAP/CMIgzUHQHA/Roe+/18Dn7kZaTuQCfG71RpcNTS4
         GXs5zHtaUuOfrl6evW+BczqDInlt85UakK+PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734065801; x=1734670601;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9SAvhC/1O9xhOgEJgltjPIiKB+jL/KUsbTgQGFrTOI=;
        b=mjVaG3Z7c1wHFMh9W77zuYmqiOKsw4HN2XN85CHJ7HQ1+0+bZ792l332TuqwdVj7Gi
         1GP0S+3U/uLOInh9ynLzI8cySBwsh5v4TQ5P7zZdZMhJSgl86JamPSS+L3tvHmTpSGNh
         rGBoWzI2ZhpNh0XRi2RgZdw3qYvcM77yqe2wosLC4NFcmwB6fD8+aXinKCqWtN6OKf/I
         RK4uFtwfXN9aqu1ioQLMaMkGyvWv0vk03ql9Sr6kDEkhHaZnyOATlHShWpMqZjqd8KEb
         JnpOU25MJ/s61W+ThQoV5JpUtwwF3f440w3mM49IaSbKyeR0VpBvp9z110I8S7RafRYP
         G6ow==
X-Forwarded-Encrypted: i=1; AJvYcCVrLl8sK3NEtuzNdy7DZKWJuM1esFXJzc0YkpSBEIWSNNQGponS168PdRZJ2i1aWb1hi0jt3eCSc91RQBb1QxA+@lists.infradead.org
X-Gm-Message-State: AOJu0YzwkVRap9Ej+4Gv49aylng73NaQECHP0r/2aake+BbILQnwto5r
	5FYeWL4m933fcYXfds4b0gjg2NtI3YzPtRnG4pPWKUBJFbdRkPfCLDuWouzU/A==
X-Gm-Gg: ASbGnctjlxOdI9S1uB9RkI3ZsQm2EaubiEJboShILq1CaVEuczeeaW5Rs0jrBmHLJ2X
	slQySCsqCZByqcTB67BXB9bLOZWT5RwXKmLH3MOCRmrXFKa0c0Nu4BYHZ6/+nbANKufQpcSPrsM
	ZeA0gGuIKWJGYWgZBCetv9ExIh9xJiTGN8DQotoYsW8lEIP14JC2D+IP928Yh9cuXUEUTazFyJl
	/51texnCfM29K6Pf+fgG6SzBF08+KpugQvGpnOU4QQ050kxVaZ4jpLHW/zVojvMiVjF/E7rGGKA
	35fLm2AjeXXIKYG6FGi5yD/jcGCZ5y2aa5kojsYwaOdiz90=
X-Google-Smtp-Source: AGHT+IGVfeYguG/ILnnKexOgC8Dj9851hNf9D996FbgoQLKq1WGOOUB6A+Iz+5HK65u7tKV9Fecjzg==
X-Received: by 2002:a05:6a00:3d10:b0:71e:1722:d019 with SMTP id d2e1a72fcca58-7290c272caemr1997795b3a.22.1734065801174;
        Thu, 12 Dec 2024 20:56:41 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e73f1e41sm9070244b3a.61.2024.12.12.20.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 20:56:40 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 13 Dec 2024 04:56:11 +0000
Subject: [PATCH v3] arm64: dts: mediatek: mt8183: Switch to Elan
 touchscreen driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-post-reset-v3-1-ec30df9b9381@chromium.org>
X-B4-Tracking: v=1; b=H4sIAGu+W2cC/3WMQQ6CMBAAv0J6tqbbWkBP/sN4KHSFPUDJFhsN4
 e8WjkaPM8nMIiIyYRSXYhGMiSKFMYM5FKLt3dihJJ9ZaKVPoKCWU4izZIw4S9eWZaOMhRKMyMH
 E+KDXPrvdM/cU58Dv/Z1gsz83CaSS1jnfVNYqZapr23MY6DkcA3diOyX9v9a51rW35uyrM0L9V
 a/r+gGvT5NC5QAAAA==
X-Change-ID: 20241018-post-reset-ac66b0351613
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_205643_335146_88F67877 
X-CRM114-Status: GOOD (  14.90  )
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

After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), the i2c-hid-of driver used by some mt8183 devices resets
the touchscreen without having enough post-reset delay. This makes those
touchscreen fail to get probed.

Switch to Elan touchscreen driver, which has enough post-reset delay.

Fixes: 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
proper post-reset delay on OF platform.  From the commit message of that
commit, not to decribe poset-reset delay in device tree is intended.
Instead, describing the delay in platform data and changing to use
specialized driver is more preferable solution.
---
Changes in v3:
- Remove patches related to the race condition of pinctrl since they are
  not needed anymore.
- Link to v2: https://lore.kernel.org/r/20241018-post-reset-v2-0-28d539d79e18@chromium.org

Changes in v2:
- Add second source touchscreen patches since they should based on the
  first patch of this series.
- Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts       | 9 +++------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts | 8 ++------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts | 8 ++------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts | 8 ++------
 4 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 65860b33c01fe832f3a4b2e21d24ea6b4f0cba2b..b226dfee22669d596e5b45a7cc02133ee4aaa828 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -14,16 +14,13 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
+	vccio-supply = <&pp1800_alw>;
 };
 
 &qca_wifi {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index 72852b7600383972d98d9b0edd40b6e99e34a85b..863f3e403de8577da41b17b144cdb17c578b2027 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -27,16 +27,12 @@ &cros_ec_pwm {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 &qca_wifi {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index 757d0afd14fb064fc1de4608e65eb1a561c4dfa6..e0a583ce4a0bb18095a77d23ab8409bb80898979 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -14,16 +14,12 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
index 6641b087e7c5f3a957e43ac985137dfd84ac7878..7874c9a20e124c65ace3f90e2ec5bcaf59b69c40 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -14,16 +14,12 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 

---
base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
change-id: 20241018-post-reset-ac66b0351613

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


