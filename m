Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB932C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=; b=vz5fmPzywstj0sVrg8QDKasow2
	5BnkQCAj8u3chSwwjxh1WRaqW8aO8A07zK2T6MLYEtLrE0hNFHlShUS9me4RWtBrUAaS7MEwWmDei
	ZuADG/IV1XiOmVd4xjiNYvoXyxFNr1/zLszkJ+uR1MdSQwt4jHeUZK7l1uLjafNqQj/NaMh/B1oYC
	De1x1zm3b6zfvwhGtY4FvdsSdlhSELyyV+5g0azy2sPlXBeC8hjYiMR3lQVDVOTTbgMASukobyCLY
	hYR8KR3yrlZjz4795o9kcjuAVYRYT6FuK7pnwQDMJ0Qr4zI8IASYIdA8eNkqsXsz40jct4Lh6WrHx
	famZpzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmBHa-0000000B7Ji-2JbR;
	Sun, 23 Feb 2025 12:40:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB8D-0000000B68Z-3XPK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 12:30:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so30965905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 04:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313848; x=1740918648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=;
        b=lWegykLLdsDGurvTBaFzzApSTWid5CLzq7K/4Zdqi3ZoQ3a0OXBpNtanzLJoEqDzbP
         6OI74Z9u03FGM5Zw4wt0rJYTBya+g98nPE4wrGat/2pjF49NjZa8LKEOjC+LDqQ5niMX
         O2aE7wDEN72KOJP7mxuzuxUWJzzmu+PP4S9PGH96dbADtkpjC2NyiUa5o6YiBHP8Tvl4
         tHwRtiKNUskvTGXBHDdkkNDAL91l4+gjlQoGMec28nlrWde1KAyVW7b/hpgn2rhgKy67
         G6vicdq4QFx3FRbj5S73qfw89LgevXjpjzU/o+6bdgRRI4/4bNfgJoq3c190iDj25SHt
         Vdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313848; x=1740918648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7pE5Ysu98qvM8Dtr8qK+BXt3i2KN5R1lxlItWkqUL4=;
        b=Lr8v3gZa7J8AUBFYJb1t46CHf6wHhIKEVZY+J0J2k92cin7rgfAzV9190XXojpt5vC
         qUNJ6a51d8nLIstJRZZysfcUVVJw2IEOytCyTC+IajhXc7EZ3vokjL7L7M6uBCE3PYjC
         bwPuR9WDOR+p9VY8pFRBscOD6sW5qpkp7naA8kUBnkqDrkOolOIyADYDUlQaaWfvGgQa
         CEfqi0CWKd1o9JVjZ4Avf+tgRjc8+TxgJ76VNGGVvzvKdXl5Ek7EOeQwRC0btFLvAlEz
         osWkkNifBxL3YaLXw2ec53s4BzTCxgE93OVORxlCxAeUZlhxpklA/VxYWi49PNIEOfmQ
         WieA==
X-Forwarded-Encrypted: i=1; AJvYcCVtzxzZyWDoQUmzy0Il21vfYD/hX9WtqJvQI3YBDyC1NSrphWbqtX4rgFkiz8gwcjuplhGRlETEAP7lTRiJCKKQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwUZnGJ0ph7pB4gTSdLghvZlFYzopZjYXZARSwNDEDM62KghnFD
	zC2A84dxVlhHszHCOmjoLnpKmRua92tB5zD151mDtjWTjjqz9Nn1joWdmg==
X-Gm-Gg: ASbGncu90AmGwh2X2LDgo0ojc04+ZiL6I2tmwZku7JDMMQBMNe0e5K1j78WNEpgxhSK
	3lsU86ZQiRjHf/Pr1ZyYMXwSFVOegZ+nu8mjRVasPFAU4hAbN7GEi7AG6B7JVG0Q1nFcaWUoKYJ
	1+BQrKZFjUz9XJdNvtdiw7HkdNB2O9RtrTu81SYodJst9rRz3J69D6y3cTe5gNkYB6Iq5qj6TFB
	uSeBWim1MBJpY4TWFOLzdjDyc0xAFS3Iq2lyTIpsFe0CeDtY+T0QqJndIYA+fJ5TwKapLV0Gd+c
	7iSHYq/JvuSz9lUdPlPzIIE1klEFQEpAGZ/0ioW9Nns4q5EMHxnbw45cBUsCIuOGsHp1ZFc/I0i
	s1A==
X-Google-Smtp-Source: AGHT+IFyAFhdaYbgObByL5o2erYzL8TE+I6wyAASx5P6UXLrNX2c/m8NKIgThwkM0kZ48S1KFiiKAQ==
X-Received: by 2002:a05:600c:468a:b0:439:87d2:b0fd with SMTP id 5b1f17b1804b1-439ae1e8dc2mr81335095e9.12.1740313848074;
        Sun, 23 Feb 2025 04:30:48 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b030b2c8sm77061935e9.25.2025.02.23.04.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:30:47 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: arm: samsung: document g0s board binding
Date: Sun, 23 Feb 2025 14:30:41 +0200
Message-ID: <20250223123044.725493-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223123044.725493-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_043049_879961_3E7D913B 
X-CRM114-Status: UNSURE (   9.36  )
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

Add binding for the Samsung Galaxy S22+ (SM-S906B) board, codenamed G0S,
which is based on the Samsung Exynos2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d..bb3f6a0e1 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -45,6 +45,12 @@ properties:
           - const: samsung,aries
           - const: samsung,s5pv210
 
+      - description: Exynos2200 based boards
+        items:
+          - enum:
+              - samsung,g0s                     # Samsung Galaxy S22+ (SM-S906B)
+          - const: samsung,exynos2200
+
       - description: Exynos3250 based boards
         items:
           - enum:
-- 
2.43.0


