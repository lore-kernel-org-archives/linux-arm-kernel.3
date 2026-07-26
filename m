Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2C4C53209
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=; b=KWFD8+Y6G3Gu8e/QFdgw+WLQdm
	nf5jvcI3xLvaEOIC+w8RyM0tlWbEHrNeYLzvg04pYHUnSGFuSCVWUZJuvtfJAI7rSqdJ/M72ZXKcX
	sOibeeIonbT8ESqm/9djcV0wth79cpAzg3XauVTvO+tro491MbGAwP1L5XLdpPS5x24bLqpCFL8uB
	bo3+nz31VTj5rLHW/jOosEl0/eLoNyVnBmuNj1loxu/6DRXhpKoXfrcw7yeBBkpuj2o23m0AlFfkX
	S+45ReVMweXWwDl2c8nPzRtTrOtLVX752zQyMggbEDRIcVc89ATxAUuDzDp7UsBXv1bCKRaI42iFy
	wGMhomjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Hb-00000001a2o-05Ma;
	Sun, 26 Jul 2026 20:17:11 +0000
Received: from mail-wm2-x0a.google.com ([2a00:1450:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HN-00000001Zvk-1Zqx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:16:59 +0000
Received: by mail-wm2-x0a.google.com with SMTP id 5b1f17b1804b1-495459712d2so6497215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 13:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097015; x=1785701815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=H36Goo1LGha7xf58Ufj93NpB1eDe6pEQc4Ku54Cuj6U4LS0lo557TMzSAVl6Y8dLiV
         WOQp7O3jB5UVMX05swt3IhRQS0O1wcPsBe/GUgC/nhqPzP2JoFUxfiUrhqw87QX/ohRm
         YG6p4lVVRoyCea53dsljUd6RD9gD3NbHnsxTk4gTOT5+U17eXLUL/GKvNCW7KBC7Y2gD
         6x/zoACvBdr3NdRJ+fCi54HGeEhflJNa1ENGqHd/JnTjCmZzBF0v0wBi2zS/Fgosi1tF
         47o0vCD/zASkRbT7iwaRA3/MFDxwxsO9GhR6BPm4PCG+GRGtzNsCyIK8Z0pKPz3hLH4p
         W/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097015; x=1785701815;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4eIQcdRfGNlUtm4nFJpWfG0m8ngl2vo8ULkvsCbNlJA=;
        b=f32N7lsK2aKfHL4q3Zx8DLIgRNbcWPEj2Lgi19YhBEMcnnt9hr/6HSgro4aftPHy4u
         DkyZNCrFtvDL1iPuhGvx/L3sSx8aNCuz+Dr2iiMGNj9LWfwVxMEFdES7PRxSwDuopPie
         yDQFpVqqFyW4x94vmkSpD4tQI+fj/Srr4pwnI8A2wNF7N+RUUmYPgijJ2CY1EJCTFP4n
         LAzVuLAIHiuo8pRbSjmqdv/gLPuuYjVgoTHI/CPuaAzpIFC5c5nc9WgksiIW3AOnaCXn
         FXgst4HFWU1HFuP4vaxAXC+5+u/cPvKEAAlcye3kLEO/QYa621ZWzdF1CK0h8RzN6RVR
         N2sg==
X-Forwarded-Encrypted: i=1; AHgh+RqM+XM2EXrbJNnSalBJKMeuMJRF8IXwo4f38fXcRU1U/oHDxXG3XqT0SipvDyINzOS/130kYn3aRnhTg1f47KNV@lists.infradead.org
X-Gm-Message-State: AOJu0YzV0/2SdGW5fl0BQrarfxrzI2nFoxVDHI/oiNmOJTqEjhLUummi
	8EkWloqLS/K64hV+XjwsiN8GCeNoGRqJFDG6NoTsMsistmFLoUxDw2jI
X-Gm-Gg: AR+sD10MDRo3djTMy8stheCRm5/NE85JpIlIhNpIxTsU4OfLJVMJ+3pslPUU2/BTi6q
	C+UFW80K4Ij8gDAvgwKn8gQrHzp1enMJapHtDJYuv083DRUYXXrw8La3si43VMMUlQAkHbU+s8E
	TaKmohQXKL+buQmfKmKC2aCjVcmjWVr5ahnBR6U5Xhz7ebaKYP55RXMnedFNBKn4Js9+m4kc2Az
	/q/Y6zNrshEFIMz7fnyE/x1xIkarhN7cmN0p/cCtY3D7Wab2WSGe7d5a9tuWPigQHRDehi/E/yH
	lXcFdcxh4AGCXaJj4nlqzi5jWPmaw6o0ehH8+voMTtbTfIDrqpvjpPEAuOfyq+zIoawPYO0GBjT
	lwR19L8RjetKmYRdqd8eNBt5S5l9byRrNLwbE3pLOf2OVSOjh8NI86MtegWVtkVBYf8TmZUK9EZ
	SeIpZJWLxMVDYBESGnq00QQr1NLaGquBentc9xKg==
X-Received: by 2002:a05:6000:402a:b0:47f:5369:bba with SMTP id ffacd0b85a97d-47f9fc901e8mr7976564f8f.15.1785097015393;
        Sun, 26 Jul 2026 13:16:55 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:54 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Sun, 26 Jul 2026 22:16:46 +0200
Message-ID: <20260726201647.264108-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726201647.264108-1-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_131657_443357_CF32841D 
X-CRM114-Status: GOOD (  10.44  )
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
Reply-To: robazza.alberto@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
device tree is added in the follow-up patch.

The "orbbec" vendor prefix used here is added in the first patch of this
series

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


