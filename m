Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA280E64A84
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=; b=ldY2itf/ZJd0fv8rUggIP02otU
	zaGyZ0gr8ovHdDjGpyKSlUOQf5RCmJAu3DFf/t3b9UDqCpBC7KBs6kWQ6Jt5uhG25Yj5eg8JFtCTU
	z4pfTcnirecNYY+i8YNl1h1gw38Ljvp3yl3XDMFOdI5SHi1YG2X1HsZHtzmLl6JsmwmmkZENxqZJi
	B+g8fqGzdBS2/s/75TYbpPaGjyf3A+0KXv304Tjcia3VaIy7801b44BnX0qeJwfj9Ga+QU7bAPvGy
	f5IzESrT7n5NgWRaOkLFr3NJooJrWJADMrc4ht9LlEh/A9YN7UPysXbp14ipI7ZA0uHagTQSjeML9
	sXQHUUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRsl-00000009PBC-1U8t;
	Tue, 03 Dec 2024 12:19:59 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRmt-00000009Nez-1bJd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:13:57 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ffc1009a06so80012431fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733228033; x=1733832833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=pVY9ZZKhao34IAvdXgVZwOJOKvaK3/qmMnKhMy7FWQ1OzagMiOPKo47Lf5VbYOvCj0
         +DH+7btXCP23Yl1pKDxAOGxiaSoB3mcvKBg80fJa5JE9mLbw8l1SwfXE3g3k81dnPYHa
         uUnWY+CnwoV5pPX+gbIQgPyr4FTQW9BYrubHyWtzpmJFA79d1lNs4MnaT8GCzGW53ytE
         K99I7cepNoYXk06FxreycxY+8998cJWkwk82D5CqwUbm64N5Q1BqCm9Sn8QVjgHlsc1V
         tSwq6E+2yMfoyeoHntVMYmD7usgllTiu9f6Bc8gi91VspdQQvLedgCR9APbN8TmDGgW0
         ntJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733228033; x=1733832833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=SHg9vISR587XyHCG82LrJiE7A1IrDzaCvp6jhOX+dgSy3TKVrYwR0EpoGNL5A2rMmQ
         QFqsCgPsiYhZS90awcyA9Cky2maTQwKVaA5t9lejIZXq8kgSedrKFlp3xBX2kQl/g8Wp
         GF0PS3LFZBUnNsyAvMVQj1w4pSb8nQoVJNQNWVRPP8soq8GkEYxdc9JQPnRP4dUgSKTi
         0zgEkwnuQXWngs165qaafd/U7u0W06aOeenESEqgvlEwZUn0xzu77IyVLk31YTQBOFOE
         Bjh0vfS6jPDiOP8d3mlp91EiJJSkdXUgFax1aBXPgxxjp+v/8I9QrWa3oVQ+mO9IxAdw
         ApRg==
X-Forwarded-Encrypted: i=1; AJvYcCUDmROX0NgtlJb+fegG6KAZFj1K0m1j4Lt0mDtKlBkVEw6mzuDeIsJbGjy3xJhE0mqZuunBoX+LkccMav3bPbVG@lists.infradead.org
X-Gm-Message-State: AOJu0YyOr2Un6oE3iLZ0jOGGv7kfO1bIsbq3dkPmXiMllk+45dS9LtnB
	kgGPwNRk0fZx039DohHUhEdEw2CN0NKz1zltAS0DmoBbyGtcVYDCB0MOmnPSTkM=
X-Gm-Gg: ASbGncufSD4gUJVZYtBjNWSPBB1yaxKP8kEC9IuP4Lt2e7iB5RPv56nsRZlxA9axi9z
	4z1AkDT1++97nU5ISM9H+dtSnTYWSoLxXbeHVqfBO6ap8YV0bu5pc5wp9paipswBkt0WlFryDD4
	2iLVMySTAW/FT8v46fNK/21i2xMVd77mEJg/pZuQFgjl/y3rYwL2ou5LKc5RfViDbMlvJtH4g1/
	VKRKwBmKuwpql4OKAtkXzXKdu3jfdZDF9srphnLvjla1PEUvfyK6Xk7SUKKw4SOcIp/WPEwFJRt
	jv0RANY56/0TXRxbE2IB2wp5Cc1QCO0ydA==
X-Google-Smtp-Source: AGHT+IGgwyjBJkS8A9AXx8hnLtvyrGDGaqK5MFnxCflHlyNqWU5j8V8iVeDiiMrTGSbUFmaLqW+/tQ==
X-Received: by 2002:a05:651c:b24:b0:2ff:d133:b54c with SMTP id 38308e7fff4ca-30009c63bf8mr20389271fa.11.1733228033208;
        Tue, 03 Dec 2024 04:13:53 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c245bsm607603766b.8.2024.12.03.04.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:13:52 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:13:52 +0000
Subject: [PATCH v2 4/8] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-phy-v2-4-40dcf1b7670d@linaro.org>
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
X-CRM114-CacheID: sfid-20241203_041355_458007_65D648A1 
X-CRM114-Status: GOOD (  14.44  )
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

This code's intention is to configure lane0 and lane2 tunings, but for
lane2 there is a typo and it ends up tuning something else.

Fix the typo, as it doesn't appear to make sense to apply different
tunings for lane0 vs lane2.

The same typo appears to exist in the bootloader, hence we restore the
original value in the typo'd registers as well. This can be removed
once / if the bootloader is updated.

Note that this is incorrect in the downstream driver as well - the
values had been copied from there.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ceae4b47cece..2a724d362c2d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1510,8 +1510,11 @@ static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_preinit[] = {
 	PHY_TUNING_ENTRY_PMA(0x09e0, -1, 0x00),
 	PHY_TUNING_ENTRY_PMA(0x09e4, -1, 0x36),
 	PHY_TUNING_ENTRY_PMA(0x1e7c, -1, 0x06),
-	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x00),
-	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x36),
+	PHY_TUNING_ENTRY_PMA(0x19e0, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x19e4, -1, 0x36),
+	/* fix bootloader bug */
+	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x02),
+	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x0b),
 	/* improve LVCC */
 	PHY_TUNING_ENTRY_PMA(0x08f0, -1, 0x30),
 	PHY_TUNING_ENTRY_PMA(0x18f0, -1, 0x30),

-- 
2.47.0.338.g60cca15819-goog


