Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8438C531E8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKYUgE4Lj5YWYTlIcNqqLcI1EoAo5/fpI79A2agQr2o=; b=XwvRQ/TDj5VlcpJGBMTVyT/Qz/
	+jhI61TM3McYcyVDe1hgSpwyLrHN+YcYT9scjk/8UemafU6BvDo7+ALRINzlD9xlwyaFm8rzeBZ7f
	699s7WGnP5gq+p2yyEKrmYdWHV1Oad1EYrcMVWXAOubnTb2FESej3EToDBm8Hj1F4x2F618nWARjd
	gZg+dQ8i0F0fTP4IDO7jENUcCqyH8GPur3wxkAqJkwZ4TjRrAyBMPyxxex+GvsESk4Cjbp4711RE0
	jH+yTNIRrLMmhF4TkPL9DZJAWt7ng4kE8ikUExKu1919cpJO5mpyKOS7mimB+V9hDWKCcv3UNYx8v
	nEfKo2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCwD-0000000CESp-1aCv;
	Thu, 19 Feb 2026 22:56:01 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCwA-0000000CEJK-0YsX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 22:55:59 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7d18d0e6d71so990366a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 14:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771541756; x=1772146556; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKYUgE4Lj5YWYTlIcNqqLcI1EoAo5/fpI79A2agQr2o=;
        b=P91RRIC2E5tcfanMjrMrK44RqdNqk+CSW5XNuz98iR0z+hRw4/6MvOvjktGQWxawbQ
         Wg7PxvMmrKj1arvG2P1APJxr/jxttQhU/uAjvzywSE1iw6mDwUW0MpHfCdJqnsdxKi6B
         bGbX5hwwWm6gqX62+GqbJQsbhta0SYHFnAXIUmP6SF/R1li15b9bt6wiNyYElmn0+QiO
         ikWBQvLWS08tDen8UwlNUWqthXDX565r2uA3Xa4Utwo0XimHt+DXV5G+Um1PFxUa9lkX
         Bj+xku5elqB7lFabfW33m8czBjw/tzbCOmwTNy+IC2CTg3utiLawJ1IczN37rWMAuCPU
         9NLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771541756; x=1772146556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jKYUgE4Lj5YWYTlIcNqqLcI1EoAo5/fpI79A2agQr2o=;
        b=b7m2Ttu+mBPLf2SFBwfRKZEtlXfo4PYtb2OtjKJ/fcl6EMGO54+KKQSzoGRZi53mW6
         xwSy/7CEvrTM/Pc3V2BPgEV3/9Kuu2kgc8IgQlT3Yq3K59wgDvYSGIEf567auUFl+7fL
         eVZMKFKvtnP0e+wNfPD2WCsk3NFxDKF5c/F+UfC/nbds+U04Ty++5MvoZGOJO8ww+Ga+
         Y+yXcGk1CacXn6UlqYduIojXJlCj0aaJHSLNS7hUY4yEQheKcQIq0Rv/yHs44Zx2dev5
         AxL9c37jXbdop0ouUHiVfFUQcBO55WRB82gB8Tj/w9OCUsPvbrBTiy3HGn72/NLlexuV
         I6rg==
X-Forwarded-Encrypted: i=1; AJvYcCVN+1T26oKbPCahByThRyRzzJOoWJcTIBAK4jhE2XEwdazMdOFWvFOhbDUguCrYBcT9tXO98pL2oW2AWjqJAWG5@lists.infradead.org
X-Gm-Message-State: AOJu0YwKCl78uUzBLqGBxHVRsDEDM/aF4wtFiqKanLnLCg5nam5Sk8GW
	rLtmyztxVczC1Q0VtmA+BsGILYrpamF+7wQpuwcIevb0skg0Pun3eLoJyVxHNevM+xU=
X-Gm-Gg: AZuq6aK3QD7DthgpqUaI1UT0OxoSKUJayfQ5mcpLw7RJJsKLJuViwXw+DA26A46kVq7
	/9E1VNNFHd9Z1JTlgoLnJ1uW5h+WwYQrAF17eL6+R2x7cnM1MxqovKYvOiQ2I3tXHRB0/vDEEju
	XHJC/KTOkjUtL1j7jb3bsdgKJIPQnxHV0XCI1f5Z7LsR0Ukj2lw5jTfuHyoYhNpS8XXUPHzaOVP
	vvz/EAL4Hy31ktgqojRw0v1bkPvVrvS29xql+EUlqHgt5ggQ7tS36mksHYqjA6c+eUKwK33Oh5b
	ClaiGqzDT2wIECKEGSxhqzyHfjwxRh/oL1iJHu3eglniHZlNKJHh6AHeyuJXs/HImDBRpNz5VF4
	Sjg4nYyt6Nql8Z0vwEMctG1teN+CjF0QFGkA1cMq2EFUE9HVdaSfsg+cyoMtuO7aQcn4hwI8fqc
	5Y5V+9M48UX9QKBRrYRTZSE0G2Kg==
X-Received: by 2002:a05:6830:2b23:b0:7c9:5bef:e9b with SMTP id 46e09a7af769-7d4d0a9a731mr11337634a34.3.1771541756215;
        Thu, 19 Feb 2026 14:55:56 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7720a95sm20565585a34.29.2026.02.19.14.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 14:55:55 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 19 Feb 2026 16:55:30 -0600
Subject: [PATCH 2/2] dt-bindings: regulator: mt6359: make regulator names
 unique
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-mtk-mt6359-fix-regulator-names-v1-2-ee0fcebfe1d9@baylibre.com>
References: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
In-Reply-To: <20260219-mtk-mt6359-fix-regulator-names-v1-0-ee0fcebfe1d9@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=q5ubFzH4qgc7OuFNqgcrKZJjea7RWBN3Hi9vN43DLO4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpl5TzMYDxF2HX4rTA3UnTgVFDxUpAyCkM1Kg6Q
 /Pk2GoyLeWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaZeU8wAKCRDCzCAB/wGP
 wBX4B/494HnG2O3/PxDWMUTl5U+mRUHVBFcrRCjPMQGllZGxZhl0cAExWCe/Riqh1c8ca7b6ksR
 O13CBTRTitM2swXkuwkkECCdVDc/WK2FwJMX9HYlAXourphfs+DFDrQAPcAa2EippXn/tQRsnhI
 MrL41gtfiROq8S5cQYJP5wu5ansEBfY5z/1iabqbsDaDNHfn3jOyUqunbQ0HXY6xxdTPzYCKRDx
 O3Ovcp4iVhPbzgPCtidoQ6joIT2IRTIs3A5GCtnG5j6s6Ul2zCJBGvTEFBVyV59LJWoJq2rk74y
 MGyj5pAs73pMtMSh+HHVuMJoVlPv22ngO/F3KJU6T3Te7LZO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_145558_216227_962ED4EF 
X-CRM114-Status: GOOD (  12.93  )
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

Update the example devicetree with unique regulator names for all
regulators. This reflects the same change made to the actual .dtsi file.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index d6b3b5a5c0b3..fe4ac9350ba0 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -287,7 +287,7 @@ examples:
           regulator-max-microvolt = <1700000>;
         };
         mt6359_vrfck_1_ldo_reg: ldo_vrfck_1 {
-          regulator-name = "vrfck";
+          regulator-name = "vrfck_1";
           regulator-min-microvolt = <1240000>;
           regulator-max-microvolt = <1600000>;
         };
@@ -309,7 +309,7 @@ examples:
           regulator-max-microvolt = <3300000>;
         };
         mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
-          regulator-name = "vemc";
+          regulator-name = "vemc_1";
           regulator-min-microvolt = <2500000>;
           regulator-max-microvolt = <3300000>;
         };

-- 
2.43.0


