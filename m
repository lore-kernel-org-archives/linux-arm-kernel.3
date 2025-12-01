Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB18D11701
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3haUaE3WBd/H3ns4eosPa5tj4oG7IhSbyAobG8wCXM=; b=RfblyG/6feYbluhLMTE4ePFNSQ
	r2yE+406Ic4+rYJ1Un0CBIh8Ry9OZ2/gvn8eM2iffaRbnDFDLacDP6wpRBeEAy+MyHUbEa0tEloJ2
	t/N0HkKFMqRPCqI6s73GG1mG7+D6Y5mvLCe/eCpsnMdw/rsHH++ROYyHn4aRmfr+ZjxXwQ7py3LDZ
	nvKLFCkwyhlhhN+sTp2jNAhKYQqxglIycAYSlFoFtIrXyEnEUVtrUwKViddSvYLKgLD27U5AujHkH
	5QxSMIGTQ4+JjLVLWgIcWfjK/Tlw1fxLXhKQEt8mJVh2QnImwA/i1Pzr5XyJL4oCtehYY+a6mkOJ+
	J/D1M0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pl-00000003MKd-1UNr;
	Mon, 01 Dec 2025 10:45:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pf-00000003MFZ-3AbY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:45:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477a219db05so24853125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764585946; x=1765190746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3haUaE3WBd/H3ns4eosPa5tj4oG7IhSbyAobG8wCXM=;
        b=UYAdZrWGck5SqjZnKDwHD642DYqU+VJZpi8OoSVjCgoA6afkT80DL7VnvdAVgggVzv
         DI6oHzWeoAzLET6G6IBHp3FWdQRlYiFqK8rfltHuFZAV0yr1514RV2rpu4q0OBs2eEzU
         znz1K14ZP9jy7l9JsGdBk6WjT1mGhLJg5UZ1TdYggfOAiFEaH+Xz8hLiR97hKojW2+d1
         xUIwHNAl6iEm75i/VUPXrCgsjAg3exyvV2A4V8raKQqOcjfrQ3z89eaSH0q8nJbsA9gl
         NzExwfWRs/KbbBxAr8VvqAvPVSGZIyXiilFQtZey4KqeeqjBI+gNvbVNPeAY5lyehJa2
         cM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585946; x=1765190746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3haUaE3WBd/H3ns4eosPa5tj4oG7IhSbyAobG8wCXM=;
        b=EUJl0I2Lcm/9WWq/k+s+QSzV6EYcdM85LA8mXlMq0MKEV/VjRcVgLtoKsco6ImhsGL
         EYo/izfoQR71Q1GDnV1znE9CXc8IomoAr/9LqqVWu8FJ7wbJlS0MZeYwIFNbCwWmoZVx
         vUR8MYstKvhMkXLghWpQ0zxPRm0g0MVYxiTU6fQXq+OAP3PDD+rjXB+sUfd4VfabA/Pv
         W6aayDS+teWonve0RXr49cKoIFw1OBRFvh3e1ooCERbBWSTlfZ/2jVtO74znLY5WyzRV
         0vSJNRo/o2QyH3ZlmIkmb0OoMKFKsckgogPv8mfNsT25B2eSC4i4xQneEmgg9FumnhzY
         qDAA==
X-Forwarded-Encrypted: i=1; AJvYcCUYoYnrkXs0nqHuspYi/bIk2aRnx8xWtvl8fa0aVJyA6UZBCqxeqIIsbH8chNncsotK0YgAmUmeMknrQTqPyX94@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2whTjTRZ+8xzM6ZgALSgoO3Zql5ncg0+NeVGqoPm2mdZtFcsz
	VXOUsf922d3oYGOpamTBWIYmGqaS6vPvTj7GsO2qf6l81ZQQDF0BoQr9
X-Gm-Gg: ASbGncsdzZJbWqMjO2lpOfQ1ohDjvVY6yYLXzdwPyg9jPQgL32NCRl+G45VSbuxBqE4
	BmY0/cQnqhs03CYMgWLeNrapL7WFo5f1p0r6vvluF6+ws6MjxNuVUzc3Qx3l+IyCrwzGAr2Tv5x
	lwtYkarOAxafmzwH7ZD1P8zghN3si/ztmoxoTu7lN7cit3jPIj/LGIrY8/DmPVo975u/yEh+3c9
	H6GD3gH/ayZ2NiSXUKIabdiDbDW8nqHbjA9OO8yoN+PcK0RuWAbcXC6ym5BSkdS2GsVEXvHKl7Z
	oD71jcU7AcB3fLDLQvX47S30uhHCDLQiB39+G4J0LZnEmSaCjtJ/1mQQpS6Sjb1PImuKeg6tNoD
	j9AXgfe0emY5hDmSWHTia/ansEvc18rGl+yGQtHZVA8omsv1Ez5qx6brgGCC30Y9PKFCr1+Yl76
	Rr2Wp8GXoxlC1vGlxcIvfdSgbbTg==
X-Google-Smtp-Source: AGHT+IEOXXUIrMivLgZSl60uiNX4yUHLTdTE+ZPG3CdRF6KMSnG1uLC22eyTbR/Tq36BGJVswlCeDg==
X-Received: by 2002:a05:600c:3588:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-477c11179ffmr408394335e9.22.1764585945795;
        Mon, 01 Dec 2025 02:45:45 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm26264262f8f.10.2025.12.01.02.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:45:45 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:45:17 +0100
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add Ezurio LLC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v3-1-07f9af7341fd@gmail.com>
References: <20251201-review-v3-0-07f9af7341fd@gmail.com>
In-Reply-To: <20251201-review-v3-0-07f9af7341fd@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764585944; l=968;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=e+eXP31aXqYuHfqQ4ChdLqp8avfL3ewikrQxBy7BDg8=;
 b=7bNTbOK4r/NgZeFKYX1i7o9YFptwPZEoE0LRJ7HZzNvAZqmeDOUbmdMZB/SswLMppISOcDsW5
 DuvgNJUd7cpAeAWNmDrMxqS0hp9FFRrfWLvfVhzCGvmt6PXiPUg6tlF
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_024550_019992_F4ACA1B2 
X-CRM114-Status: GOOD (  10.43  )
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

Ezurio is the new name of Laird Connectivity after it acquired Boundary
Devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- none
Changes in v3:
- Added missing Acked-by from Krzysztof
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..e76e6c5be726 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
+  "^ezurio,.*":
+    description: Ezurio LLC
   "^facebook,.*":
     description: Facebook
   "^fairchild,.*":

-- 
2.43.0


