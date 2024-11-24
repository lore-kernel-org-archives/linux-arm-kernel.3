Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13144E668A0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/IvUBcoipMDIe3/pYAHB/bcuEx/FUoQvLyB3GzlNVU=; b=wojI518GuRce+BpfHGzVDeDFkd
	zv5T/To4oCmVWi4MHfZicLVyR7D3iCYYPIlW33URO8AvuKUiCbQ2m/5CTJigO23zPwrScycEcgV3z
	JQITqC5Zox476RZBWH2X0xqzG5C/eh9N3+0bb9ey2nYTwAF7t7mxVHg0F9tWkqD7bnoMJPwPsBS/B
	lMmgxFsWx/KJf5L52LGlaDHp6RwCs1GQ7Zz4t8vf4lPVwjRLRxvNit15p4zUN72oHorfE0JmWsBHR
	O/0GWsWvJelhhWQIJGGdg4W90VJ7V38z1Vct/94LB/6RoPO+ylw/ui+kaD8jixEgz5YgxW0xvgBL5
	J0ttKbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF8UW-00000005Wf2-0qeT;
	Sun, 24 Nov 2024 09:01:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF8Sf-00000005Vxh-1kii
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 08:59:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7248c1849bdso3534163b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 00:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732438760; x=1733043560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/IvUBcoipMDIe3/pYAHB/bcuEx/FUoQvLyB3GzlNVU=;
        b=lxKfRIXvmQUT5ZFJadE8FIU2NO/M1382DWIDzzbDh3Dv38MjRIAleN/USx2xnNjtPJ
         UVtz/IAdordfGQA3+ii9eU5RwmSdD+gv0Q6Zr8Ebm4fqpC281S1xTNKjZcGcg1DKwkWf
         PyIhra6C2wQQJ8mCtSeueeDVQXaZ0UvN1ojFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732438760; x=1733043560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/IvUBcoipMDIe3/pYAHB/bcuEx/FUoQvLyB3GzlNVU=;
        b=R314ybDVLJQxlq23ExPPb7tJks8IuM3JRde9ly7m3yYv7a30chbMwinBb7HqDc0XQX
         SvscOLKh5oUe+Uu1sveBENFKgEKOUukBHpEMnp7/Xd0cnlKFn+Ec1WW9Y94QkpJdapLH
         1xxq6cYybn/ZWy3VGG1pmGF5E5gb4fvzRiMpna8uGosrJevXoQATGzU8AryS6S7fRaI1
         EiPnOFEJhMIeP0bO4SVzT7Sam8UowQvihliYCqUk2n8Inr+SzUiUQMY2kuqCW/na+TGs
         hNSJxoUABRQaNz12P703Pk/VB5+sObAoxOayy29yTa44ixnpB/08Hi7/6SEXs98fRyrW
         OV8w==
X-Forwarded-Encrypted: i=1; AJvYcCVSLYPIBk8wGtGqunu4z1wSAXsUbiCLSVu9M6PXoq1bo1VT5+EJ13jWAKnqkfhVIQhesXY4IaRWwxBnBXe8PyL2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6i2F6spReD5N4ydZy/WrxBTpyB6/0fYM3KBSRPWA7pdA4d7oR
	pLU0BUiLuokNi9aBdexbGFSijTRvnKGnHkaVj9jcSgYK3Iief+ZAfQ97Wr1c/A==
X-Gm-Gg: ASbGnctrnJf+oOcljCsvTdVzBJL+IMCqHXOXtCDS+ecak0nRtyZYgMFUpg4eswwOwee
	+CzZQdKDYr25c/TXQHV1dt2KwuvO8GLbhR/vBDz6fO8b8AhdoP3tfn3S4GaBgMK2P9EnZvWCTMB
	O1lIMQG/5EcDc3DNhXyk570OxEXxadnTjX32Xl7pTbPYsAwUTDrax8aOiHCUXtQ9200Wkmcc7ef
	cSvde+2Lj/uC1Z8TScf8Wy2tEPn5ndtOoid0WEWp9rUl4k4nPr7N1tMSvG7YjITCgDB6Q==
X-Google-Smtp-Source: AGHT+IHfzR8ObvybrfM7pUctOZmJy+v/RQYyVAaGYmK6XbUOyVSBD4McBx6obvZbzN9dxMWFrAHZVg==
X-Received: by 2002:a05:6a20:9155:b0:1db:d932:ddcc with SMTP id adf61e73a8af0-1e09e452055mr9437889637.19.1732438760553;
        Sun, 24 Nov 2024 00:59:20 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:f699:9cb9:f928:9a14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcbfc4c28sm4465890a12.3.2024.11.24.00.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 00:59:20 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fei Shao <fshao@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
Date: Sun, 24 Nov 2024 16:52:37 +0800
Message-ID: <20241124085739.290556-2-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
In-Reply-To: <20241124085739.290556-1-fshao@chromium.org>
References: <20241124085739.290556-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_005921_453206_B2467FEC 
X-CRM114-Status: UNSURE (   9.91  )
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

Add entries for the MT8188-based Chromebook "Ciri", also known as
Lenovo Chromebook Duet (11", 9).

This device features a detachable design with touchscreen, detachable
keyboard and USI 2.0 Stylus support, and has 8 SKUs to accommodate the
combinations of second-source components.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..4b68f0baf010 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -307,6 +307,19 @@ properties:
           - enum:
               - mediatek,mt8186-evb
           - const: mediatek,mt8186
+      - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
+        items:
+          - enum:
+              - google,ciri-sku0
+              - google,ciri-sku1
+              - google,ciri-sku2
+              - google,ciri-sku3
+              - google,ciri-sku4
+              - google,ciri-sku5
+              - google,ciri-sku6
+              - google,ciri-sku7
+          - const: google,ciri
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8188-evb
-- 
2.47.0.371.ga323438b13-goog


