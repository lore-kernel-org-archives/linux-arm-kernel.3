Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04398D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=; b=SZHwOsQEDXMwP/8V3k9yOuPVC7
	iRp11xicZgHwAvrBkPeiVTOElDCdwqplLiNlrT+bzeB/rIUP+XmZCH9JyeCUg0CaEdVlNkJCDiDJh
	Z+U0BGqsBxFvZ4UA+xkTp13RkNb6rI+t6XS6jNMRgpm3IP6Bz/SyGXg0FPPUtQUoddHkKruDh07j0
	FYtMl86/Umz0lWkum58Gf2r+NMIIcX6IwdjV21zf06lGz5SqYbDwvDkaXw1nTttstJat38/8VPEPb
	PJ8GlaB8IkbyU1gkHbWUIOBpGZdInzoe6+l4adf0iqxg6g0UZZFXf79z1bS4Z9TfuH7vuW4UXezIP
	h5nr1QCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5M5w-0000000AF8a-0HBu;
	Mon, 28 Oct 2024 09:31:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxj-0000000ADfO-1HiT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:23:00 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539eb97f26aso3952146e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107377; x=1730712177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=;
        b=SzTOoRGlM9NMRq0HlPznIygEcMfwlQs38ETnzm7ECnFBHEQgTgkPV2/c+Uw9GkcEhP
         UAciFNjk+GO7rRUyO8mB/L/pBcVcF/I0X9YZW4K0z6xjyc61CPVJmu7WmgqsGEk+hQ9M
         IDOrD9mrTB6jgnALLxN13Q2V22iVOC2hd9yNv1LoiPQCoyQZ4NRqe+OYtAgc3MXLX505
         G0vDQZY+XYxDW+nQpguL/em4tDij5eRlfYvdtE10TRM/Bj2e/gb6czxnqkTQBBLmCuvz
         93DHFKwPsK15LYlF40xPwtYp4n+YMdBe2uytATXOda4TY9yRb0WkDCTNmb7iH3t3uCqg
         fYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107377; x=1730712177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfbT6MDiefFz3BliYWZ+loVFrZSj8n+9s/0V0etkG70=;
        b=NVLspzxhtStT+gaCoJME7EjFWuH89wTJUO4FBleYqVSj+nhFt1Oux0qaoAQo4FK1nD
         ItCEUSPBRYwuPs3jdqffswayxLy4abg1PDE3cX/273STWCn1WE2zmhvy3IqbpFqAbMMs
         dVrEm1DqCrNqvmfw+8Kq3KQetTQ19bgf5tW4y+cAOIYm9eGADF4k5GfcjAX9GT1+HKnp
         uUywIuJdRuEF1cJaTEvzA4XzQjBImPLXyZm9vs102frNWHIzAJvEuPchwpPaBsFCj+dJ
         m7bgGHp11fm3LNKRpzpgKOSBX95juVH+qYxSvgXuf62y42aPMYREHuRrMON6gDJ8x14P
         JezA==
X-Forwarded-Encrypted: i=1; AJvYcCXoLQQbROqAYwnsv7pYflCtSOIzL4IIyf4iBdypZLVWP2N/kJo2oJbQcQusaZ7BNdyKL1k9z7uEGTvXSYOLTtDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzpV4ZZDn8F8IqrN0bz0LTaZX+0XTAKrhSqHUWZ5V229n6z/0PS
	S9csDCvofOCjs6IV/IDJL+2zIpuqK4p7wotoFW3NjcHH+W0flFMI
X-Google-Smtp-Source: AGHT+IH0r7NhuE4e3aS5DFYvV11dcgTWYihLpCXJFndQTB+bM4ir6kkVsAOB7fNFSclJ4Bc1GcbMCw==
X-Received: by 2002:a05:6512:138b:b0:539:eb82:d453 with SMTP id 2adb3069b0e04-53b3491cb31mr2950188e87.39.1730107377080;
        Mon, 28 Oct 2024 02:22:57 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:56 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:32 +0200
Subject: [PATCH v4 04/10] dt-bindings: pinctrl: samsung: Add compatible for
 exynos9810-wakeup-eint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-4-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=1230;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=nX/aujPmPzzwxGs4OFiOnvYO/MsiQA4p8l4iwrKD/GI=;
 b=Sq9kFPvTP9YcHAGpXXU9jGFS9IuV7ycqPn3PuCUuF91KwF8lJYHbzjJsZ1CKRsmse5ZyVGwcI
 3/73NGYtnQfDIa63R+wT1vGaT4m2M01R0YDaurWfxn2T24Pxj7cdD2j
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022259_394475_AA5E06B4 
X-CRM114-Status: GOOD (  10.69  )
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

Add the compatible for Samsung Exynos9810 pinctrl eint block
to the schema. It is compatible with Exynos850 EINT controller,
and doesn't have a dedicated IRQ line.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 565cacadb6be77b1be1a7423f88564dd950c44db..68ed714eb0a178c46228bac142d69bbd6baa6277 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
           - const: samsung,exynos850-wakeup-eint

-- 
2.46.2


