Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546D3CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o38gmX36PyqmjEq1ZTvcb122z3x4XvhpJiBBsGOOwy4=; b=I2JxKweJ0pKdaF2O19scH1p6oZ
	mOkcJT15hJehO4qnhR3RsJ6g/MQPEoeRPs2myFzkf0D87x8YCsO4f2Kr6zzsvxfLwv8liKuPt3X8v
	e/hR1vyrC7HNZPSHXl2DF4jqSYlB1wvwBSKM1LkitOc+bdHIfa9yw2fEgtuJ9KQp0sKY+xfIwAnlt
	FYadpf5pKmcfPYsQd++lwa+LkrXrRzbAo/g4KpI6fAJuX+45TnDkIvXi6O3sQT/gYomrBY6RzI9nk
	cY2/yFTrWaYYrZ0k77aMIrHk9XJciC+6rHUqUFfp4DYTEdNmRuMDyGT877zNVb3V0uyXNays//8P1
	VRUD6nnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eaH-0000000GKGn-2VON;
	Tue, 14 Oct 2025 12:56:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eaF-0000000GKFe-0a69
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 12:56:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2681660d604so58466885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760446614; x=1761051414; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o38gmX36PyqmjEq1ZTvcb122z3x4XvhpJiBBsGOOwy4=;
        b=NuWNdN7V81t3/AdOkJzotvS022BrVjdF+ZsmwyCX0E5ENKk64WWoeqKU1nnM09ZJhq
         pgyxQkCF1HZK42uop+1GegFkBjLJup7NIbZJYWtO7TG4MTE7EYRQgnRAdk9NV7Bax8hV
         GoR5d/Gi+U9AK71M8erTvkmdtyzIJP6gsNgvxDRi0DsoinZArZ0r/uJR7mHohL2PVXeD
         TxZWiylZbAe08/5g2P3c2F8zuC+e6MBdUSoGxr4Lsr1a5bsZrJR/diUXi1rYvZK6+wCx
         7dVINjG5HbKbaXnbfa1YMyUSmP4i9ySxzCqDwaw5woNSjSxiLf8es5kPh7u0ay1a8WgT
         4tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760446614; x=1761051414;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o38gmX36PyqmjEq1ZTvcb122z3x4XvhpJiBBsGOOwy4=;
        b=r1/7nE+aaR9c3FUEmvXea9wgKmE6lB88B7faC5aj35fm8FxynT90PHicyGi6iRbVTz
         sQg0P9UJ0w6PGi85CCnouKPEJtdxQWDjybBW/B+3+gGYTY4GJ3hjpmngtBLDZe6AKrE2
         2ODSrcQZqj2mqeXi3nexJo3N0nHppfyl1LmeQECSmQVG81VlKI7M6HgJEBaXw9Xnv8lA
         SH9Wz84Db8xNadIRlO2IrYJTMA0DCC1IM1tBCuDjOIGmTPw0cxbTcrk9PciZQ8EOa9yl
         26lk7rR42wDNOgzoeLmnuUkoYyLH8NdoBHorJAjSia92CpEox/TtRvDgLLYRiUgNI+Mb
         FpxA==
X-Forwarded-Encrypted: i=1; AJvYcCWMfvsFLn4JSKPG30gFLhenKHK0/+M2HBp/KufPCVXVI3myl55W7eflxUiXMp69xilQXyUwbPH9KefD4leFWRxL@lists.infradead.org
X-Gm-Message-State: AOJu0YwW983QZ5M4ph2IascPoDhXMLfYDies6WU9kuIR6eB0gWiNhEYN
	NOffFCrRMzOkaxzoMT1EsUPjb1FCe+ipGzEIH1GVHbIkV3AUUgMDzBwm2PNbY61wuB0=
X-Gm-Gg: ASbGncvHNUTjXMqiYJz/U/ttdnMW/SSEWWF4MREVZyJzPzE2HKQ/JoqXM5fmURiOVDq
	03mZo1Ndh7/QrNCcnUlycB5UWZQqkfVBZNJuF4fJEJmBlfouHdoPixLbup405xIwPRBePmRT9hu
	9bHw531EVPsBUfZqoJqYZQaz93DvHViAEpNUSE8LI5ZSWPji5+mO3IqppuboT0VmMGrG+OiMtkz
	iDA60zikQWr6cEP0ydycA2Hpjr8MQ8j5dPZW8YqKB9VYc4+wKflkB4OO7duiZhsFLb0FIjCKmUi
	rTOrsxKGZuAY7mslbCPmL1IHO0TN4GLrOr/hTzabFpSB7V/mpR+7o3zC+klreow1Y/fybkCKQyQ
	jRpFdrdeaKeRvwOBTDwZgFV1VkJ0/PWd56RjGDp52k1D9Gd8I4mhCq0SW2Ffj1llo5x9euetHGD
	4=
X-Google-Smtp-Source: AGHT+IFFPt+m448T/uVhH/uFa4IYkTCQ7dJj+PBX8yKsxeuPCGTRZrXD06eMiOSktRMiwnrCyjS6iw==
X-Received: by 2002:a17:903:2351:b0:269:a23e:9fd7 with SMTP id d9443c01a7336-29027262689mr366784675ad.26.1760446613904;
        Tue, 14 Oct 2025 05:56:53 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3ab2fsm163919985ad.105.2025.10.14.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:56:53 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Tue, 14 Oct 2025 09:56:43 -0300
Subject: [PATCH v1] arm64: dts: imx8-ss-img: Avoid gpio0_mipi_csi GPIOs
 being deferred
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-imx8-gpio-csi-deferred-probe-v1-1-62dd1b949731@toradex.com>
X-B4-Tracking: v=1; b=H4sIAIpI7mgC/x3MQQrDIBAF0KuEWXdAUwxNr1K6sPpNZtEoIwQh5
 O6RLN/mHVShgkrv4SDFLlXy1mEfA4XVbwtYYjeNZnTWmJnl3168FMkcqnBEgioiF80/MJCm4Cb
 /dN5TL4oiSbv7D+2Wvud5AVmyznRyAAAA
X-Change-ID: 20251009-imx8-gpio-csi-deferred-probe-eef6c56a35aa
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_055655_184115_DFADA023 
X-CRM114-Status: GOOD (  10.79  )
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

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

The gpio0_mipi_csi DT nodes are enabled by default, but they are
dependent on the irqsteer_csi nodes, which are not enabled. This causes
the gpio0_mipi_csi GPIOs to be probe deferred. Since these GPIOs can be
used independently of the CSI controller, enable irqsteer_csi by default
too to prevent them from being deferred and to ensure they work out of
the box.

Fixes: 2217f8243714 ("arm64: dts: imx8: add capture controller for i.MX8's img subsystem")
Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index 2cf0f7208350a416d77b11140279d2f66f41498f..a72b2f1c4a1b2ef26196c810b33ecfdebdbc1675 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -67,7 +67,6 @@ irqsteer_csi0: irqsteer@58220000 {
 		power-domains = <&pd IMX_SC_R_CSI_0>;
 		fsl,channel = <0>;
 		fsl,num-irqs = <32>;
-		status = "disabled";
 	};
 
 	gpio0_mipi_csi0: gpio@58222000 {
@@ -144,7 +143,6 @@ irqsteer_csi1: irqsteer@58240000 {
 		power-domains = <&pd IMX_SC_R_CSI_1>;
 		fsl,channel = <0>;
 		fsl,num-irqs = <32>;
-		status = "disabled";
 	};
 
 	gpio0_mipi_csi1: gpio@58242000 {

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251009-imx8-gpio-csi-deferred-probe-eef6c56a35aa

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>


