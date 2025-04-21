Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EA8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=; b=ONK3mWxSIQJ6CShO+9Zv9V1Bjf
	S2E+upfaXc794VP3V+cEx5mFTr2G61QCPN/16bZQn1LDERlo/M7R8himaaR1CYt5y3l4/n92Q5A1b
	JxBbXLg1KAvQqlZaPjISItiQ55hMbXd4T00LtHJAb8V2xO1K5srlaESC+Ca4KErBzejPgjPP2vZVX
	l7GV8RcOc6fd+4BavjHUTRiIhEW4XG+aOJfcgf2lKR2ju5odJZSu4sYiT3RvWHNIOB5pcsYgaf4P5
	PmUU8RL956mY/p388S3Xx+I7nwUDTJ3xNMvnajGsWtgU4opQp3PBHehfanQhNw6X6jT2VZO3GJxj9
	uIlG+6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oEk-000000044ru-20N3;
	Mon, 21 Apr 2025 10:18:50 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9I-0000000445k-1YAv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:13 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-226185948ffso42147395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230392; x=1745835192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=GEHclYAJhzLf2h4sKixQWOO1bhvViSYjna2CTegsy6pDLmNhydSKClkglFU+GaAdxx
         YvcxVbdwmjwTEBJTr6wN1xp/U40sDYvTIXGAd+sfw9NdbwLEazg/MLWczNNjSMdduuG+
         LXFblYf1GVD8l2zZGrucrncceQ2OfBMVwfVUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230392; x=1745835192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=UOx0yEBZfw27zVWYugKry1p20tDK6FXvE1GOi6kqIr7j1c8SfpmbKrLopps0FkBPli
         Jvc7rhHTAztC6yfduq/I5HZszqv084w3Yre+Ep03tUuPDVpJQ77LR6JjZSMwbF0hp9kO
         BonkF3ym4KyZ8I7Ge7Jz+sP5zYOIPDMnWKkl0dEMROKmPkh/RVLHiVpHpYuD7Eu37sSq
         FlkcH3MsXpt27rCKUiJ+9sfnYbiDeIuK1Z4RXwJdg1CBcsfiq6iU+DDBB8NMOjUNHNN0
         x2nzuKlrizxkdDThNZ+8ErBvZ+dpQjsn0eGrdOO2NzGVpcN/qYXkl6JRGNc+wRyI6bpP
         fhcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl2sR5qbr//AlKXRQaXdMALqvXXWZ9NUONkqKtKx1f2mFCPOdEHEt9dqMb67+lZETdJhPsy1hkjcFBKLuqxZ/5@lists.infradead.org
X-Gm-Message-State: AOJu0YzIOo4AbajQAd3eAmgU97RRxcZeurXwIWeHbrDW5i6k4YT7gRte
	w7XuFt7mU/0VJ+ClSeYm6cYphZ6W2s8Mfp0d6iHpeU1fKKuJbUQc0qfDbAYBwg==
X-Gm-Gg: ASbGnctTMLdhIUKohFWnJ+PSzL3MFoUcBu1UFcJQzgWhVfKwpXXGel+gLRC2/kfGlms
	TutgU+bH5Fo+7t6s3k460+hW64TYzh9qBXFEy3yfKrmoskKPwOXA0XlfEbgDeBnXJ0+CTBzt8qq
	qBmUeQNji/LD43hCjF08Z4gElN/v7OJtRHZVZtbIDkdSI6fcz8mCe0darAiX7mgJb19eYCTSvMa
	nsEZbXbQAHjct4GaRK1wQCMZQI/UgURekXXY82gGWVWAgywTQr7NCKUH9h82KkTRTkxroXnFDR6
	Nxv6clFHl4BTANFmRK91zfHjHmwOZgYCQgtVNJC1dIXgGvphAzsjHjd2ypY=
X-Google-Smtp-Source: AGHT+IEzP8P3BuI4W7WctpJECwx8nzR8w2GBK/ppnOU1J4/hN4o5Y1Q6ZPLjik3RIkoMMrSDGxWajA==
X-Received: by 2002:a17:903:19eb:b0:223:5e56:a1ce with SMTP id d9443c01a7336-22c536063e3mr184062165ad.32.1745230391767;
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Mon, 21 Apr 2025 18:12:40 +0800
Message-ID: <20250421101248.426929-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031312_407817_0650857D 
X-CRM114-Status: GOOD (  10.77  )
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..49ddc504c160 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -339,9 +339,6 @@ properties:
           - const: mediatek,mt8186
       - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
         items:
-          - enum:
-              - google,voltorb-sku589824
-              - google,voltorb-sku589825
           - const: google,voltorb
           - const: mediatek,mt8186
       - items:
-- 
2.49.0.805.g082f7c87e0-goog


