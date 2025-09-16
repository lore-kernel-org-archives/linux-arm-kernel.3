Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDC6CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ummlr2UUKGVQ6te62E5zslyCu0MUOMC+Asdn9tweZ+k=; b=vdxBmABeoXQiKS2pDjL/qrTtCS
	p5c/ZnXvhteCDdYaC2PiYbpDLMesScvZNW0iHYTR1jtk78qIQ8QxMQcTBNi8iUJdi+Dev0Fh4Z2hO
	LTuOQVWM6ZKr/uoVM9FMyDIALq9pC3LEYPRLEG32XCXGZvSuOZrHycmKtvj2BMGr1Z0nXPc2JrEjd
	xCAslMEGBKGw6nhfi4j/p6jtb9tbVSar8RjeCsksPPgA3F/NY5/f3SzH16hmdCNb3nOIkD3fZMAV9
	5XcTABYkS8Vs77rfErVx3W5WRV6ALsNaGhw4YDiNa0Gj6m7Lo/IEq86z2P9WCb5eqhtLTazBLZlLf
	tihx0EMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc39-00000008z8a-21H5;
	Tue, 16 Sep 2025 20:13:15 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc38-00000008z7s-0AXV;
	Tue, 16 Sep 2025 20:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053295; bh=ummlr2UUKGVQ6te62E5zsly
	Cu0MUOMC+Asdn9tweZ+k=; b=YXBLMRGNXzq8m1lN4v8HGQLSnmIkn+lEy7gdvhEKyJOZadGSZB
	gQIE6lW1Itml2bHzizGcBAq4Q8IeNtyAEV5qJQHZz2rMPKTYgXeEZFg4HC8f1JghFJ6S+rDBhvq
	f3g3IwSGnsMQn+K0GywIyhpf6ZUvM9c1bRPptUwbfjJBYjZQT/FU8dDEnPQDFy7rymEhgJh5khL
	5g3NvAe7iXKoT+q1MeBJkdTYXvvS7DyNoQkZZsF2xM5nKbJp1McHUgUvrzCJE+3J9xTKnX9EJOv
	ZRpRnGuJsEfcXbuMDMYCGix6OLsOPnLgwrlwtdYhhoQvYB3g6yqJ3gTaO/VtQaTLCLQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053295; bh=ummlr2UUKGVQ6te62E5zsly
	Cu0MUOMC+Asdn9tweZ+k=; b=RJA/1KAEP/DRcdOPk6HdFI+JYu1sfHCUQLf7vIxa9BMY1c1NM1
	y40AEWm0WHX3or5NKR6Y88I0hVAoqK/mVnCg==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Wed, 17 Sep 2025 03:07:20 +0700
Subject: [PATCH 03/25] dt-bindings: gpio: rda: Make interrupts optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_131314_218977_27C82AFB 
X-CRM114-Status: UNSURE (   6.41  )
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

The GPIO controller from the modem does not have an interrupt.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 Documentation/devicetree/bindings/gpio/gpio-rda.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
index 6ece555f074f84b396537917d7149d4061724dcc..dbb73b4d33ed39aa65024376b1af0c4e2fb896db 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
@@ -41,9 +41,6 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - ngpios
-  - interrupt-controller
-  - "#interrupt-cells"
-  - interrupts
 
 additionalProperties: false
 

-- 
2.51.0

