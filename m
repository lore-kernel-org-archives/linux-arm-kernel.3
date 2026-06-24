Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6403BCDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=; b=RiHmEY+Z2/Sa/1Q1A4ZCig5KYL
	Q26UFbGPqP2CdV66FovEvxSgftHMd0iK10iKaZrVyl8CQIVtrgfyX+pS+1CUAyeFvj4SgS4bI3Z8w
	0kgRz2SR8bBJBSFo/t25em6ECEzf9clqkR7yr39yIDQSUwIFstJOOvniqz2JRttt/qt5LQH+LH9XU
	WBF/VqAaVwayMKlXt0Lc26XVw6C0ktXhgeUrcC/JYX07x47wPqchI6FlB9DweS3IDmxZSA6gK9Pq5
	dYp3l4YaO2NtuWDI15J8Sm6OJVU6jGCaveScDJ0XFC9f9b9d0d99d1i9cniqdEsHVzwtiutMpqRJH
	+2+d1iow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO77-00000007rzZ-0atb;
	Wed, 24 Jun 2026 13:58:01 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO74-00000007rxC-0olc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:57:59 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-96757a30368so95652241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309477; x=1782914277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=OQwkeAy/Xy1h7+jWnGMiN/xLKSfuwrhKeaSHXN38uWqg+REuFi5OcB7OVBYJNd6peV
         QKifgRNW7vda8JzZCxmHB3rZ1VBmRPcsbj76zruFi1DdORLcpwYVr08CdyutNMyCQkhS
         7pRuGl20IwlZuPn16TVxSjeUx6tbhcBZTtsrPdSaOGWzoqCBbMTFnFx4uCTEmOIwnr3K
         6uKuB8jEb9SPje4SPitgJTPD+bCjBbvLCThEDuXYqNzU1PhWHAlhqD0fT25AlPHUuCv/
         37k+vuREQbnSiXG7cpu/jM6ZeKAiCI50Q2kALkaTgBUWHA7dpGJcWkpFnE/YsMH+PUw7
         lwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309477; x=1782914277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=IEdnqX6XmT0iB6yh9hCwDcNkbGdycqris5rr3HPUtrIb6ldAK2XlpZg250qYj6o8Eu
         LrPLpgNaK/ma7jNlZezCFmim7B1wf+98iILjhxgHH6wJMfAd11TZYi2vpF+rBgsjOmxR
         7m9sBSINXDx9mv28o9Ds0/X928BJD/olKaTM58mqy3ZLBsWoaO3ztUFlIKMaiJtIGKaW
         nmnUPEMJMIel46+WcyiLtoIOw8ehva4723SfXPKzD3ai7EM1bzKATIf7nXLrcrvh1P+0
         kJakvHwq3xhM7Z7QdrfMX63Fmyf+22HOfnRaJPlzawp9mFU7lRdiRt31hPp/XKvqTgqh
         9oNw==
X-Forwarded-Encrypted: i=1; AHgh+RrHyabMKFOWVT5VNuCqL+XT65U1gq4Vv5s/e4Oc6rB/cq6VtWDYCzV0KVsBRd+N6eNqChxKhM8e1x8+eQcBV3fh@lists.infradead.org
X-Gm-Message-State: AOJu0YyfMRw94KIRh7oGFDwCHi8hAwHVuHCi3tU+bSJopqGv31Mo8NU/
	8LWfCI7Dbt+teuPA9zx6V2KR6bwXSWFUrV8LTF3xEubH5CUwG9Fyjk+e
X-Gm-Gg: AfdE7cmkouZvlgrF5M2UNLzRqHYMrnAnR4JT5EOPX24tarQ4UW89G9d+w9QPV7v2uts
	Pt32rch1+3LNCWwRrr0R6jvlf+E7VEEiyYdv88HBFmXZgODcSnLcyZp48/OmJXra0N+K4NK6hLv
	dNKgy3/08DSDRcCJ7GUlXNM325R8zgzbi3+uWYQ9yS1k7PRP+DuXXAtQOtFdmy4GrALTjLrKZsN
	fkyeiotj4/a8HYOWgJ3C7ZsbCS5+y75NYfmmjAA5voiQd29nYdWgv4Xpm6Hv04mr29InclCj77B
	uJe8KUMf6o4b73mebK4t3n+GQzY1CBydvHzfB7gBMDwOksYcqI3hIjRGnCncY8EsuqIpItIUvFW
	pA7kfwG36juvVxk091cxClRkzzKSonpcOhZQnwWkilE+GOBgsP28tVWOkMjND8nlBJBZLwlP40D
	haP2D3jpe9yv01CekaCCLjTjbw7W+b7YkxHGY=
X-Received: by 2002:a05:6102:f09:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-731157322acmr1460988137.23.1782309476725;
        Wed, 24 Jun 2026 06:57:56 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:56 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Wed, 24 Jun 2026 21:56:43 +0800
Message-ID: <20260624135650.727077-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065758_237152_56592CD9 
X-CRM114-Status: GOOD (  12.76  )
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

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8ca3ac09b306..5b8ef98f6d03 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0


