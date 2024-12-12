Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCE8E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 06:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmhFFd9OZS3YcXJsK70hE90ScOtfqunHCKFsvNhGnPk=; b=NL/YS1Zet8IxTtWw+cV3aQDfG5
	rwuxd8+5w2bGZleJKQV0LIxqgjIhMheUIlsjREma14+I3jpCSdc6g0zqLR/Rc3Cptt5BdnGZx31Ll
	wAAmwj7UcNN/c0PD1wP+uGbcsVOaSwkV7vHar7DOuq9QLSvy/T2TiPlnqNYqRCc81Hc9aavFSRA68
	Kg7a+NsCy4kCvZCdl/jETkuilJezvOaOExICrWcUqVKav5hf7S/OUlvqdeuDbwvrQxIlZrtNVlXcd
	ar/vZaMd2Q82tGwlJnf8xfl97iLsBMSkJVada21jvTK/Ageia3mdgXHyjpsszsRMjiVitGcpT2HkK
	GFYr7p0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcbI-0000000H1ws-3qR3;
	Thu, 12 Dec 2024 06:23:04 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcZI-0000000H1XF-1daa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 06:21:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-215607278acso436015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 22:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733984460; x=1734589260; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gmhFFd9OZS3YcXJsK70hE90ScOtfqunHCKFsvNhGnPk=;
        b=pt6CPg6ATFlcfxjUeWMVfaMrTc25fVfM36CrGmIhBeSX+UHDU7cgnoHrolPBOUj4as
         qTZXz2AIfkg9dUOLMr5Jz5xvfdjeKjXMq3Gq7MxiX6MIqaPoI9kB+KcHW4/ZkK83GJH4
         WYYp3NvlQGIbYksacINaTY3YwVTWhRUfCrTvHg4iZC/MT9S0kafNPWyJUvWdj3yWoWj2
         CmZdF70ezR3I7Mcu6mGOTh2vtA1O+dwey3yZrM4pjNiWMZ88fxeLwnwyOP/Vg617f6tt
         8czJGxQx9X95du3B06HxxkO9kxeCq39sXXS2HI9nXzVdAByDC37DtT3+Anf31tB+fPF1
         zM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984460; x=1734589260;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmhFFd9OZS3YcXJsK70hE90ScOtfqunHCKFsvNhGnPk=;
        b=HjL8TN04a6689xjwEbMVAKwrckf9VmvOLJoI6LQ4j13AmbzLNBEVtfE6RLen/KxxZd
         Qpm/mQHkfArcxviLNaRl6bhQHg5YdVjlk8J1lJ0EUBemKZyvrni3oUCAqiijbCRiSsjg
         j4AZLZX51NpXNOBB4R7yD29XLyaXfQrR+EwnIjiq0SuatOcwNwrGUtEgSHsDKjC4cIJ/
         S2pdcWzQeBf/Le+1ss3x3d8WoQQ2WSFqJN3MVrw7/U06HkMOKkI+cdIxkSzXpG4h+8pr
         wFJy/G2RzbAhjqhletrRKX3jt+kyMozdkM17sl+VoFfstAcBOCs3wwBUkiy06dlGPAEd
         tY5g==
X-Forwarded-Encrypted: i=1; AJvYcCVpwFZ74+TtI+TQbEGbXpJMbQQk68/OpbidgDcdsf2uQMfRr3YwJZUjHR6RhcWs1HNHEwu+keYNZ9ubnDyii7v2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx557wTeGCRs5fr+Z00Yb592cdKefLAWQU3aA6ECmecPu1gEr9O
	n7P4B6JP76a1oytQTWcQnNNcPPMbBcRxywaNG3YkT/dYOefYnRXPT7U4ALIkF8w=
X-Gm-Gg: ASbGncv1HoGH6uDG10isCi4YlhRU8UpAJt0jbZVJZtTeRS1LuCt8YYsFJxdUM8CmuSd
	gfGvS3cg28+FJHAhWO3M1HacNGUa9uWGsJukArEP6frChuyILDRpQ1+RJ7n0Xd1DoVtjsho10dx
	oEcyMbod1ElJku4zwPxjRfTMBxQoLy4rFDNBqetOZ9IPEgyTp99kpD1fsODDd1FOUYCs2H7b9Dm
	sDuAmeSU9u8PBn2rCUxR3do6r7c2RiTuKakJIbt4V08ERwDWaSsdmLVfgdaUer6Kqv0AbSuqSkV
	dPIKm5T1AjByK4mPB2bp
X-Google-Smtp-Source: AGHT+IGNhqg7BDa95UyNmBCMDwuy5gdbsBxRXNYNtSRIJSSwK0euI41N/BGBIkwVFECyb3kJ4tXPWA==
X-Received: by 2002:a17:903:32cd:b0:216:3083:d043 with SMTP id d9443c01a7336-2177856a6eamr36242165ad.12.1733984459913;
        Wed, 11 Dec 2024 22:20:59 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c278668sm83579165ad.81.2024.12.11.22.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:20:59 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v5 1/4] dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
Date: Thu, 12 Dec 2024 14:20:43 +0800
Message-Id: <20241212062046.22509-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_222100_428556_509A6B7E 
X-CRM114-Status: UNSURE (   8.47  )
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

Add an entry for the MT8186 based Chinchou Chromebook, also known as the
ASUS Chromebook CZ12 Flip (CZ1204F) and CZ12(CZ1204C).

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/arm/mediatek.yaml     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..d3cc6fbad8d0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -239,6 +239,34 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Chinchou (Asus Chromebook CZ1104CM2A/CZ1204CM2A)
+        items:
+          - const: google,chinchou-sku0
+          - const: google,chinchou-sku2
+          - const: google,chinchou-sku4
+          - const: google,chinchou-sku5
+          - const: google,chinchou
+          - const: mediatek,mt8186
+      - description: Google Chinchou (Asus Chromebook CZ1104FM2A/CZ1204FM2A/CZ1104CM2A/CZ1204CM2A)
+        items:
+          - const: google,chinchou-sku1
+          - const: google,chinchou-sku3
+          - const: google,chinchou-sku6
+          - const: google,chinchou-sku7
+          - const: google,chinchou-sku17
+          - const: google,chinchou-sku20
+          - const: google,chinchou-sku22
+          - const: google,chinchou-sku23
+          - const: google,chinchou
+          - const: mediatek,mt8186
+      - description: Google Chinchou360 (Asus Chromebook CZ1104FM2A/CZ1204FM2A Flip)
+        items:
+          - const: google,chinchou-sku16
+          - const: google,chinchou-sku18
+          - const: google,chinchou-sku19
+          - const: google,chinchou-sku21
+          - const: google,chinchou
+          - const: mediatek,mt8186
       - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
         items:
           - const: google,steelix-sku393219
-- 
2.17.1


