Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ABBD116FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rBKIjSzAwbk7FH1fuZrbrBv4iYOLXu9AA0angIhb2c=; b=XdwCzBcQKpskcAdVxkA7UfR+Vm
	wDINE0gpRV+anQ5jqw1zz8iDxg46lUCiCG+pbtMzt08MBjKN3uJB9V8nOY3ILX0LqV/8aHSG2b54A
	sXKqKJJz42SKBbiV2JxjxuVZv5RyVihnvMEPdLu/W4r3dqc76rHUavPMEQu+XJHwtm1CRcHNobmmk
	WBCkWySSv+Wf2R/1lqiA24INZ4RkAsCMIsQakar+UyeTtAwLor8+NB+8NUcXhaRKs8tSfYYU7d+kM
	IRws9XIP29RbSXwJVN6dFn60aIlIbvG1WvQTRrHJjpYle8jkuL4vLwMHst2AjfZK0NJsnwdKQNGHO
	iWo0u4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14H-00000003JY4-2vei;
	Mon, 01 Dec 2025 10:23:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14C-00000003JSm-2c0L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:23:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477563e28a3so26740155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584615; x=1765189415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rBKIjSzAwbk7FH1fuZrbrBv4iYOLXu9AA0angIhb2c=;
        b=RNgGwiuROyPCGpBp4fNQ978gw4O+KBNbioCx+Ho6Tu1q4Sfkz2WFpavRhr4Hne57ET
         F+yAgegeCt3g2zagtXdbUGdQj+LCUmphoTDShC8h5P5HLuEvcaLgaTMcQmKOeoXkG9XE
         GpRTahcl92bo4V9FvE2hPTyst5GPYu6ypFpV692P1PP6DZSRVS4MJrZbPhNlPb6vuHU0
         ml6/6aT8LQLK9EH8vnasK+rOR4UknXdeJU9XjwMNm5H1+MFdou3eKz25oMPkGLD3Urr5
         wVzxUwXocnADHBWOMUpAtSel2A7g9VvmiHtUZKMetfBpV8K2W7MC9KO7JzKSaOmSBLEv
         N7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584615; x=1765189415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/rBKIjSzAwbk7FH1fuZrbrBv4iYOLXu9AA0angIhb2c=;
        b=BT4q/okIYARUx1TI16u3anV6yyBSKYIpxFasmJIqs7yUI6bhxOs9ICJO7czHQh7VqY
         OSKRJDmrkrC77ZyUfpiQ+70jKX3HKip9tpeJHw+0elJY2ecGtu86r37kIem1Si6gQqbR
         DfLjRUt8QlveK18pQMh8ZfC1YxZTJZ+lNIzWU8aPMooXs9uaiTv5MiN4LJ85qYIWP2nj
         NHnVfuRf1RLGE6/SB+LNSn3HQo/uBKr1NoUMepo8Y64ICTVHXtovi2kRqVLsSSPATUOW
         yGp8vjZ6SRAun65vzJUjoWmpeGlEWtkW83l2y66ZJXEkWHJAU0Dy3Q+xZbv9S+7i9QKC
         kDEw==
X-Forwarded-Encrypted: i=1; AJvYcCW+lSUXLnM3NahZ/Lo7kl/4LSnD3/JjCNiz97/9pVXM+jn8qrxeVEGpDRDk51XPpkd6PyeAt6mIUQhzfuB67QAg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwdz87SwImVLbPiypB8RKpJ2D4kEdxg3k6w75majBwUpEKv1Ov
	V0eLbY7L6az764nPFp51H+7qc/+xljeXSxV3qRwKqU9cRkdN5dCOgYIn
X-Gm-Gg: ASbGncsCg8tu1GlZ2AIrmrgoONZlYfxMr2f0uDogsvNtx/aaTP7vl4bu6IADuOLK8ht
	q8wXIGObbC0//lFW1x+aSVfIq5hZdWqbi0d4cDs9pZNY56gG2Y2HHT5IG/u5If6IxV/NgFK0gye
	W84hSuPgVrZ0WzspEhAKCsy+Vg7HS5+YJX5Ri+gsV2+rBOQCTr+5gsGBHqdaGxYXUJCcOB6Svty
	GOopnhKCSvF8Qlp2dSu8fnEi28J8j0+BfICHD9reyjggiCSL72/PSz5oc5RpaNB3RUdRWQU8PB3
	K6A6fRu+yRf64XkHV+HkHHwkl56TN1Yt52gmYBQejRuGczXCsdZPOQ5iuB/dCgoSJlhpME4s4Tr
	g5QqwZikAtwiMz4cUOhFDsja79gAF0amYG8VtXS0uhMjBAK5PHo9EcAkV5TbKCnEq6mvLkpTzcE
	zf9UjtxyzmEZ9o79HEnxArAq/2ZA==
X-Google-Smtp-Source: AGHT+IFAwJxBI469N7L9CqPS5vNwebnCpoilxRn/5gXB2dFYAtif9suU451xCgzkE/Q6bFDKsWWdtA==
X-Received: by 2002:a05:600c:5952:b0:477:3fcf:368c with SMTP id 5b1f17b1804b1-477b9ee4fbfmr302253395e9.9.1764584614500;
        Mon, 01 Dec 2025 02:23:34 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c8csm29466439f8f.2.2025.12.01.02.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:23:34 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:23:16 +0100
Subject: [PATCH v2 2/4] dt-bindings: arm: mediatek: Add Ezurio Tungsten
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v2-2-dc2df44eec7e@gmail.com>
References: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
In-Reply-To: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764584612; l=1305;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=xFX5YgQIiA3apISM9uVyuqH8avDy/oWY29ZCIQmyCTc=;
 b=p/W1wp7YQyzzW+UcST+cXTXhp1K5/zznvhV9cPYVl6t4+RrDx/duXQb+41zcP/qryk570Nmqi
 IQcmlqNpFm/BUR/uG+UqUQsgS1sG9MZDYeQtxzZgt1obzSaqVB3do3h
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022336_696315_E385F953 
X-CRM114-Status: GOOD (  10.20  )
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

Add device tree bindings support for the Ezurio Tungsten 510 (MT8370)
SMARC [1] / Ezurio Tungsten 700 (MT8390) SMARC [2] + Universal SMARC
carrier board [3].

[1] https://www.ezurio.com/product/tungsten510-smarc
[2] https://www.ezurio.com/product/tungsten700-smarc
[3] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694..cffb0f6ac690 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -431,12 +431,14 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - ezurio,mt8370-tungsten-smarc
               - grinn,genio-510-sbc
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
           - const: mediatek,mt8188
       - items:
           - enum:
+              - ezurio,mt8390-tungsten-smarc
               - grinn,genio-700-sbc
               - mediatek,mt8390-evk
           - const: mediatek,mt8390

-- 
2.43.0


