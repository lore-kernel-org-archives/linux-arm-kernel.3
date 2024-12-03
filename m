Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6566CE64A83
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxSILp22APpVBx5tHexHUV/Y8I0r0x3nASsEN7dt3nk=; b=ERgO82Svb9u4n0X4qr6f3MjJtB
	OPANrz2fYqtLi3eW1kxdKA+V73xxYmi+5u6s2JbHg49bKIFHmTjEsEIcJCFxhOTJuxeCcy+s0oi5Y
	vlX6g1svmdB4CD05Gtz4NYJqGmkwK5yFXYOvtPyNjmG3Ke748FqjW5KL67OGxLhAdEiQigpVbM6KI
	caFTUA+bstzaJmlvW+c3HcybSDvady2tSMOWUX2eACiYQgPeAfgftHprLMdMF59DLjdlfDsl95/UL
	mtydZe3mwX/fUx2oGHNjiBFCwQzKOa7VJ2ZxIwYJKEJUtePRHu4Xs/qoPWrpqTZ9fNhFdvGg2PWfE
	YSZ1fVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRoq-00000009OCT-1muD;
	Tue, 03 Dec 2024 12:15:56 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRmr-00000009Ndl-1axy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:13:55 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53de79c2be4so6499435e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228031; x=1733832831; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxSILp22APpVBx5tHexHUV/Y8I0r0x3nASsEN7dt3nk=;
        b=GfBMGt9tNbRZOdOPq1cEtFjLlZRg/jdinYvxBKR7v9TL8YfrZWQvOBjjJySDIaREwr
         XwYYup5+q38Wgc84HWUwlz692Z4oS/1MKu9uAUzSmkisqMgIhRIq4/8p7mQZ27iqmSua
         VfDckMVRQn7+C0EQNzNETlQsujH6kblsjrJhAS0852tiOw50DKACkyefgD8a/dhDuJUL
         z4opsVn2bbfPbUxrfa4r2OkaiM0qs6vRTU5CVsrQhcrC5mN2k0Wdy/x+eH0FpnA5jdaD
         Ru7VgZjv2Rz4axUDXofMTZlkqdbGyJ+c8OLYH4Qr8KLpkGU72GahBi9T8pWG3OJ2hoEl
         M5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228031; x=1733832831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxSILp22APpVBx5tHexHUV/Y8I0r0x3nASsEN7dt3nk=;
        b=HwsAAht96rZus/eNvZE7OkEcGfUtPUekST6zZ4rgDB4lFFnF9mCcsTHd/ubC2smQ0k
         43zZakKyFVz4dHWO0HpHkZ9WavrA4qVN388N5oOB2DCNoWyGPSy6a7vrNXqn32jcwtW9
         TVU5qOXQZQuBKSyOJA6mbUPYTnrRwqnpswfBqmqeHxieGZ38ShW1cAsKAJmdBLVAGkNJ
         1nuGP4fveJXfaFFtumIEYtRIubR9k+HVazTuGLhrxKQJ/JDadrrPAl/lxAEg9BOoPUWR
         vViKFto7yLID00ebB5ULLuA8SrkfIC4OGlkWf2gtl1o/lStNiZ43DUzQaOv4ZcJcf2d6
         zqVA==
X-Forwarded-Encrypted: i=1; AJvYcCXfq4XdU5SMrT1XtXQU+1aepsYX1K0gFSaeyl4yauivgtjywM9pUgufDzTOB47dnUdqZRnskSlccXHkyl6ZBfo1@lists.infradead.org
X-Gm-Message-State: AOJu0YzDIFU7tMsoxwsp0/AZdgFC3M+zPA1xjCEQAhWR9U43tV3yJZ04
	K7QdmRkMO+FA58HA+0OfaFweUD341fvCJAEIadyDiViZVfCAkRZKVVgAcjnf69Y=
X-Gm-Gg: ASbGncsIynjXNYfsIDiJMY/twHNWi8UEvqrPrgwXiNIUcTO1jMBbP1LZWrxRq4T6ii5
	242WQ/kkFOAVaN4Q4xoCkH9VUYYjPgApj8TfO409UTNVo1pi+NCZbUncw8DRozPfeyIcnxKRrtJ
	C+O11Q6xnUZhdoxTJeH1GwghqHTT6vWTT7TTlsTYIDgw9QB1tET+1N50zE/Hn9mxpEcSa/zjRFf
	nwOhydS60+pOndRa4DPqlHx7PJUAwLkPA/IgbJTYgThZnWo2y0ruB9QdSuahJpujEmQ408Hwq3v
	EcRPYBSve156LmMavxqt5lM2UY6SH23eTA==
X-Google-Smtp-Source: AGHT+IGJXqz+bsjwL9K7fxpkACgJ7CUUYtTsBMRBB8QXiHvyZub3gqPv4SCB1Lxa7PjJlefvUOWsPg==
X-Received: by 2002:a05:6512:3e26:b0:53d:d58a:cb67 with SMTP id 2adb3069b0e04-53e12a26e81mr1428897e87.35.1733228031160;
        Tue, 03 Dec 2024 04:13:51 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:49 +0000
Subject: [PATCH v2 1/8] dt-bindings: phy: samsung,usb3-drd-phy: align to
 universal style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-1-40dcf1b7670d@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041353_417164_8F638EAA 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

In [1], Rob pointed out that we should really be separating properties
with blank lines in between, which is universal style. Only where
properties are booleans, empty lines are not required.

Do so.

Link: https://lore.kernel.org/all/20240711212359.GA3023490-robh@kernel.org/ [1]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 16321cdd4919..1f8b35917b11 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -83,14 +83,19 @@ properties:
 
   pll-supply:
     description: Power supply for the USB PLL.
+
   dvdd-usb20-supply:
     description: DVDD power supply for the USB 2.0 phy.
+
   vddh-usb20-supply:
     description: VDDh power supply for the USB 2.0 phy.
+
   vdd33-usb20-supply:
     description: 3.3V power supply for the USB 2.0 phy.
+
   vdda-usbdp-supply:
     description: VDDa power supply for the USB DP phy.
+
   vddh-usbdp-supply:
     description: VDDh power supply for the USB DP phy.
 
@@ -117,6 +122,7 @@ allOf:
             - description: Gate of control interface AXI clock
             - description: Gate of control interface APB clock
             - description: Gate of SCL APB clock
+
         clock-names:
           items:
             - const: phy
@@ -124,10 +130,13 @@ allOf:
             - const: ctrl_aclk
             - const: ctrl_pclk
             - const: scl_pclk
+
         reg:
           minItems: 3
+
         reg-names:
           minItems: 3
+
       required:
         - reg-names
         - pll-supply
@@ -149,6 +158,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 5
+
         clock-names:
           items:
             - const: phy
@@ -156,8 +166,10 @@ allOf:
             - const: phy_utmi
             - const: phy_pipe
             - const: itp
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 
@@ -174,12 +186,15 @@ allOf:
         clocks:
           minItems: 2
           maxItems: 2
+
         clock-names:
           items:
             - const: phy
             - const: ref
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 

-- 
2.47.0.338.g60cca15819-goog


