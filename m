Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=at4AGtoJzuUSMRoGQaflHxu5wCpuyRhNqdSwxFevlHw=; b=OLXiAUOYbbKBMAn2M97sHZQPTp
	87NQ3FqUyC0br+FTcxZAETxN7vaUFYsL0Rb76KXlo+oFWmOvrShTLsvKLXmUdGB/5gtxBq5u8DxtJ
	J9asABo+1GPIvpr/Op2zBMd+nDSn4J4QgSZ//NcNVG4NxpGkv5G/f9+fv3sK7Te42oOdEJQgupcL6
	h2Ll1xKlMr//T73hTDSrpxByoSDawmq6qNbv9hHzNXrIkk659CmjuPTq+pMmaC/XBKayzGoWT3+5Z
	jXdzr3LS464ArtenCWDGQyn+mfp3TVxpYbORDPmT24LxOLKvWK1fKnEg128rZZzKnpR9XEqaKjTuP
	fpUPSckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5YC-000000066df-32Rn;
	Tue, 24 Jun 2025 15:27:08 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45t-00000005nI7-3qEV;
	Tue, 24 Jun 2025 13:53:51 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553644b8f56so486986e87.1;
        Tue, 24 Jun 2025 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773228; x=1751378028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=at4AGtoJzuUSMRoGQaflHxu5wCpuyRhNqdSwxFevlHw=;
        b=WX2KyA+rz1VK1iIzeL0RFVLgNZW8lQj921HUgb0ssBwNR7mQOmJQyZVopEQEdE7128
         QGndremLvetiLd0whgftB5of5AlQdrDVyD74zuyqJzpU0Jx7Ok/Fu19HmNgUAUY32gPH
         Pjai1krvk1SU1IMZ+6vmpnMN0+bJ6x01qtFbCf9Z5zJoP4qFK6H8P+UpBynK+V7s/LLX
         7IVBjhBsn176oVMwmcQlm5P+59UUSm5aOlN2Od6rUNo06FOKpQjkjSPx82bMo7sxxlEN
         FsSQ//SSdJwQ15D+5CS3Z1ZJMSvoUvFG9zJdBPIPsew26Cr5yNm6WVCy+VxkPeWTY8Ut
         cdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773228; x=1751378028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=at4AGtoJzuUSMRoGQaflHxu5wCpuyRhNqdSwxFevlHw=;
        b=tiRTfMmS/+7SZ3KSeTOOFfd4IqK6FeCTpia2ZR6qUZTUIvLJVe+GA6ZdpH/IHmlbYO
         htrxwyLcnQGhL35Iyk9OspJatc8nvEw6NINsWIxMNZQMl405rq1VkmA0K1vitZg3W9LK
         ntS3FCEC31rWz+BXf4/2bd5AFnf7p94AcRqLG5lBJvgFXTichfL1h3HSPjPjL0NFrVa/
         VT+1ciO5SVK4PYAri2P8tckHCO/TGOvyjojW344ax5DV8LAeNJRNk8gAfS64eK46OkGF
         efuRuMqCMEb3KJQnlPW5Bjse4k94uZqTUj8kV694LeOuIWrCvXKO63xjsJAq9ySGHx54
         cpog==
X-Forwarded-Encrypted: i=1; AJvYcCUJmfWtkapuB5QmMTX2Q6NVq5YjMKfpfXyC56s3hCRG0JXDrFJ8Ia1j4oX6DuDZr6L3TfUgBFVvjopZoJaF@lists.infradead.org, AJvYcCUtVufAHnTOKYSrLf0SIMRnC28jU04f4HzTP59YNhQOUtzKnjK3ZW3pmmAtq1bC3uh5ZwBXGVySrxMKTUAwsUSNwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHm1o8Ay0xBLEEOF7sOmPrFdn1t3ID8qAuuwGG88wFxZHAh+8v
	+EUgMXjCORtAlz87by/sKhvdbnVrUirhLZj0Wcv4N7XQxR6mI3IujBN1
X-Gm-Gg: ASbGncs3T7OOT0/mv94vJ92Vd36fHIVGyWRoYnUhWAXFGjYAVPPRPB+wmHRhIWNBPO3
	pY1MgmZ10aQHtEwsXK0FkqXAAXHYnfXxlWqTG/ryfA+BfGVz4RyrtF9p6vZcv+dYDhLaaw9G882
	aeypl1ahZUaUtWyfU0KM/UEGJKwX/2x5JS3ej2VwaNhM/jeFmjVMYXPcj5x/muM8hOGQgIa2lVQ
	gFymQAHKdkNNjAi51cJ5wYj1tKIE1fBSP5JpqvnoPa+F9U9vXnoJjxk8qC7qWpLgylu7IoKWjYW
	TZg87EVVyY3h3n1R4uwUeVV5ZujQIrvZ185aF1Fl25dPrAIFjDj21n/6F9wgiphW1iiOQFMCj1q
	GC+EPIex/mViuIHMe8Zl5mo08MFWofisI3kqx0rAVyLp9ZhaNsHYoySAEu2vAfg==
X-Google-Smtp-Source: AGHT+IFbDE+lWZiMZmwadCBMjxfgjChAjL5/r/S/Zb6cyZMzeD+uljn9vGxJOP6BB4iHquZJI37Mkw==
X-Received: by 2002:a05:6512:3f19:b0:553:2c93:6140 with SMTP id 2adb3069b0e04-553e3b98f31mr5355681e87.9.1750773228139;
        Tue, 24 Jun 2025 06:53:48 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:47 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 22/22] arm64: dts: amlogic: axg: add crypto node
Date: Tue, 24 Jun 2025 16:52:14 +0300
Message-Id: <20250624135214.1355051-23-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065349_954711_1CA0930E 
X-CRM114-Status: UNSURE (   8.43  )
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

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 2df143aa77ce..f126097ab013 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -294,6 +294,13 @@ ethmac: ethernet@ff3f0000 {
 			status = "disabled";
 		};
 
+		crypto: crypto@ff63e000 {
+			compatible = "amlogic,axg-crypto";
+			reg = <0x0 0xff63e000 0x0 0x48>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
+		};
+
 		pcie_phy: phy@ff644000 {
 			compatible = "amlogic,axg-pcie-phy";
 			reg = <0x0 0xff644000 0x0 0x1c>;
-- 
2.34.1


