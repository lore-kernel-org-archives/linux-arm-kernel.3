Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D08D44D43
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/GF/Qtpn6msAtbROl5IORl4ZiQde9+aAMX19fZKFEE=; b=1RG9KZ6xYxj9cYLlRFWteS+LXW
	KjTBN05evYw/578mRcu3bOJYJ3b4iiHn3Mx26OG8TxtuBpQb5H+5Q6ExnY/VM4uZ0fBWa8XNcqDEy
	oTG4CchpG3ft7FIiSt9VHsHaJXOyANCuxH+QoaYS02ybNSkD4G8mDqbjzqpmBzi9iExj41RqaYfm/
	S+euyjvGIyIjq67zW2MhuF+MgYVLOSGixeyauUcc3PNMiqsJMf0juIzCllCAGiBnYLcdrqJcHTxht
	7fbo9aZyNnPZCkexwepaJIFNhNdhDiqnC68JXjK9WJwbj8f1Hw5OjsDt9zUSd2MvxeBUksDAYAW4J
	+9KuzMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8d5e-00000002iMe-38wq;
	Wed, 06 Nov 2024 10:16:42 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cQo-00000002Ydg-0Gd3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:34:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cd76c513cso50955495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885669; x=1731490469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/GF/Qtpn6msAtbROl5IORl4ZiQde9+aAMX19fZKFEE=;
        b=kOQhsifW0g+hvstAv9BS5GhVHqVNaHzJEqm02Lr+cBhBF2NfTGZbVgXBeShpm2ny2e
         RZra1DkKvDYSNo3c10QDOjI9lZ2GdryMZhqyQR9nUFdDh+uXh4EEsBGebd7wyX8I8JDz
         EVyWQbkYNqkh+jZm0ZVxRoGUKefz2rVqKRdwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885669; x=1731490469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/GF/Qtpn6msAtbROl5IORl4ZiQde9+aAMX19fZKFEE=;
        b=elvpFZjFzTScNRjdstg/5zuV+qwhY/DoVRbYjM4/Ykp9V5C1RGo1KHmK5YmQY5IpeK
         B659BhVEcGWAIVGVKD5HbxmNYOgD3WuT1wcB2VDYK5e80fxXG70pEzMsPID/H7L/Nqjm
         EMWJTlB11R4PW+tiVUKkmr94YlZQHzWhgM4bamJ9q2DnylCnV3whzplynq1+j4qrHbQV
         KvdBwg3hWExveOIY8m29IGkP8ztLtQpWcx3ly6rdbpu5lYD+uoFFE47LwAU8LZ1YWk+c
         Pb+YRpJsncvC7H70yFNzODBMRz3mUe8RxzaQEbOJeioFneviX1gynGcgaYFJ1H12nSAH
         bNlg==
X-Forwarded-Encrypted: i=1; AJvYcCVq8R7MOtxXf7KgISIERCl1zhVQ6bQip9w85dPG4hFyXt3/Q8nSyKvUqR3MGNyuht3eOy2GkvzCgLEyg+MU49rb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkc4DfZ+vgPxEpfQiKFFebWA521YtmUqKpP5qUeJ1u1Vh4BdM6
	qGte1AE8e9e+ZJqpBZWARbMI++KUbhRUY6M2oMNd8bcdGXMGDk6dqRggCP06SQ==
X-Google-Smtp-Source: AGHT+IEFJaxMs5mAqrxaj0N0qXwA3k96U3FQh8ZQNA88MZaxh/utNb59Xt8KT+qflVg8MQLvbAXTtQ==
X-Received: by 2002:a17:902:d481:b0:20c:5d78:4d8f with SMTP id d9443c01a7336-210f76f2d29mr381797155ad.52.1730885669470;
        Wed, 06 Nov 2024 01:34:29 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:29 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	stable+noautosel@kernel.org
Subject: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Wed,  6 Nov 2024 17:33:34 +0800
Message-ID: <20241106093335.1582205-8-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241106093335.1582205-1-wenst@chromium.org>
References: <20241106093335.1582205-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_013430_262748_BFD7BC51 
X-CRM114-Status: GOOD (  16.04  )
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

Instead of having them all available, mark them all as "fail-needs-probe"
and have the implementation try to probe which one is present.

Also remove the shared resource workaround by moving the pinctrl entry
for the trackpad interrupt line back into the individual trackpad nodes.

Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
Changes since v9:
- Picked up Doug's reviewed-by

Changes since v8:
none

Changes since v7:
- Mark touchscreen@40 as "fail-needs-probe" as well

Changes since v6:
none

Changes since v5:
none

Changes since v4:
- Rebased

Changes since v3:
- Also remove second source workaround, i.e. move the interrupt line
  pinctrl entry from the i2c node back to the components.

Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      |  4 ++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index ae0379fd42a9..dfc5c2f0ddef 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -14,6 +14,7 @@ touchscreen2: touchscreen@34 {
 		compatible = "melfas,mip4_ts";
 		reg = <0x34>;
 		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/*
@@ -26,6 +27,7 @@ touchscreen3: touchscreen@20 {
 		reg = <0x20>;
 		hid-descr-addr = <0x0020>;
 		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/* Lenovo Ideapad C330 uses G2Touch touchscreen as a 2nd source touchscreen */
@@ -35,6 +37,7 @@ touchscreen@40 {
 		hid-descr-addr = <0x0001>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -47,6 +50,8 @@ &i2c4 {
 	trackpad2: trackpad@2c {
 		compatible = "hid-over-i2c";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		/*
@@ -58,6 +63,7 @@ trackpad2: trackpad@2c {
 		 */
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -82,3 +88,11 @@ pins_wp {
 		};
 	};
 };
+
+&touchscreen {
+	status = "fail-needs-probe";
+};
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index b4d85147b77b..eee64461421f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -358,12 +358,12 @@ touchscreen: touchscreen@10 {
 &i2c4 {
 	clock-frequency = <400000>;
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&trackpad_irq>;
 
 	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x15>;
 		vcc-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
-- 
2.47.0.199.ga7371fff76-goog


