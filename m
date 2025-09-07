Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8240ECA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 22:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=; b=BuRr2xG2Ep1gZ10Li/d22sqopQ
	CoOWGPicHIomNLGC86eglmRHuANqzUtNsR1HIVdY3pEcWw7kquKiviGufX8qgQMk4bpXAYSto8usl
	MK64Rj7kvGTgovztPwt+k9f/Q8jdB+hiaN0Is/CzRzfnzQxOiJDuTI/IMp3OdtRdkRZUw7Rg3PSvl
	Q3DGs+JObeWnh+OGCfdIgV4z9eBO5X9//dJKSZBr1+1dQTPCwtLrPqEPrzyP5nh9TXMj/FLQDyhyj
	XfqOrlRQEW5Sc9RmyPlFSKWJ6Z2GYfbnHvAb9ErY+Rro0yYoNGmPtVTubZizoFZhkiYUik+p8e01S
	AgXpOUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNzv-0000000DAvV-1Pm3;
	Sun, 07 Sep 2025 22:36:35 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvNdk-0000000D5gm-1YNr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 22:13:41 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-80cc99fe980so388678585a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 15:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757283219; x=1757888019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=b/7xzMDVt5MFZFweVjaPWR/vag8+RicPuYjliaua2RUbPcPWQOzlZ4ultyqPqD/9tC
         P8uMGkyFeEfass/Y7g+RFH56x9V0l3OFPXYhExqg9VsZOVws8x9bg3TXirURIS57Twsz
         rtLFY+622xttwBz+wX+YvmCEPnfZ0hFPVO0CsGblRj9OfE4LBzq0w4ErpTEkR+VyPx0x
         F4/YUMdvh4jcamMq3A+KjpxzALVYOonC1kk2Qq4UN8S48d9OpvBMJJRUA5bAUgS+kBAb
         lHuP3fwsUuqgFLOdqwwjtqt1Ue+qS31HLrerR06JHEzy9ISPfiB2i7uF8RlS30moxbuY
         xGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757283219; x=1757888019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8MNTCcCI05lKy8GxRsjPvBNkyGZcGYhXm3EBNYA8RY=;
        b=VZsCRUrkOzK+je1HG2K1C1s63VTl9WWjanGmrMg6C2jYyRBDPwnrCHo3buyL9U/KRO
         cirkcp9vnUG7VfXS2CxWMiEupk4pCDFZj21n5MNdETeIUqDByCVdBQEulSjB0yTo9P99
         /pDqLNDZuL/Fmg6M4fnj9WFmNobO2YJATZXVgFWEeL/AMqarFr2yAWIGA42h85/hGhq2
         F5U5gv9vhgk92SsebCbnKJ1ckUY/4pmDssLU/8V9pf0eH+pX/HiF7rUDozTU8a7Qr4Dv
         L5Jy7ujI72VpWewl0HmWg2/6mNeKPyn0XIzEYO50dO25X9avJpS7H3HhhVKbiBb/Wr68
         Xaeg==
X-Forwarded-Encrypted: i=1; AJvYcCUevDGar7PpzHfzcNvL5LtJ+uB9kHb0jJqUy56OqTyZA65c9TDRmnf8su3rOQi7LtXXuZGUQHCkLGDu8WSyOr7w@lists.infradead.org
X-Gm-Message-State: AOJu0YyDARX3ksT8sxAG3wE+CDhgumDgRRMZThUvs2fu7lNOdWkzbITl
	7BMw2vmWOYtrQq+pq735DW423+l9/YKQ/4S/xkN4Oli84u3ngzSoN/7p
X-Gm-Gg: ASbGncvEZFPtUYah221FAlcHI8Gb0rsMnfNbfwKMaIJnQfDnLiqQfSaJIeQEDliaDUF
	6reLb9eFLX5V6m4ywNoJyGUd/bGfSH5Msdc2NJ5pnNh26JKOcC3lHm3R/viw8IXSzRqFBkUYdOp
	zRnkmfWMTq414/+obJOkRh24K3ojXbdzgr/jVsVhNRDe9kfSVEAs/Pr7vaWW+JBl76sOdaMW/vS
	oB3z6FgwFv1HNR94f3Vn68YuBJt/jx50MFhkF//X5FiUvVW7Bqe3bkehPnCRySHnjtARt82iSHa
	EmPD0C/TYDc5k9kt9ay9/xKfo2elJrOb343B52DdddEQM+E8toVMYUx6qv/04xrTsy6zUS1h49Q
	yye1yJjmGRg395nAiOmVA7Typ7qGo37E=
X-Google-Smtp-Source: AGHT+IE1KnGgUGzQYayOeIn4igAJi5V7ifutA8i7Ug7tvLbQKmSmOMB8AAgMDWHe2LgEYdprzhWsSw==
X-Received: by 2002:a05:620a:19a5:b0:80c:a9c2:d0c6 with SMTP id af79cd13be357-813c443d872mr625273585a.84.1757283219289;
        Sun, 07 Sep 2025 15:13:39 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4914csm930935285a.16.2025.09.07.15.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 15:13:39 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 07 Sep 2025 22:13:38 +0000
Subject: [PATCH v2 7/8] dt-bindings: i2c: exynos5: Add exynos990-hsi2c
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-perics-add-usinodes-v2-7-58f41796d2d3@gmail.com>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
In-Reply-To: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757283213; l=1022;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=sk6UDVI+7Kd9lIW0AsYOL2i9ElBbm6Hbh+uzwTLnIrc=;
 b=EmbaVCXec4bAF0b/8PD/Sq7A5JYr7QLAANw8SjOX/Kn7rt/+FRwpa3laOL3Rb5Cp4MSbVbvVm
 1gZim+s6BbQCKQbVwxlN/0+hnLngcttPGSx4MdO5KONdSvLlAPM+6Ak
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_151340_402348_F19CCCC7 
X-CRM114-Status: UNSURE (   9.53  )
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

Add samsung,exynos990-hsi2c dedicated compatible for
representing I2C of Exynos990 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d0067e7e7a73a58e8bcb4aac71e87dd8..6fc03281a8f8440ba64df569f6c83ba2d9f6915e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -38,6 +38,7 @@ properties:
               - google,gs101-hsi2c
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynos990-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true

-- 
2.50.1


