Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643BACAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOcrIoNr25HDz/QJv/9nz1km8B+JKQd3A3tnWDgtjkQ=; b=0B4v3x4YvslQeSEXyWKz528It5
	iz1mHg2C52Bynz7yn1sAduLWFTnHOYzgCZc6TjES4oJlZBt4xoystpV9umsW4bTEznmxnt1a+76R5
	/BA6SR1lH6dfCW7bwUCl1SWdlLo+hVwp5XSU9Km7reJYYZfbkCcKvBXcLJ5jt8sf1qVLlg4W6riLY
	FgnWZWGB3rflRc/oeesR6gzv150aCTfbsZomcZ5Jwt16j7CBuMbZzkimFPfXe88JWDzOC/fyWUuvg
	WEnxkLWrP3NUGGd9ZxEb/c2Frb95oXRuqhQWVniXxmmg69B3MpdEXcDn3/+NSjKAa7pBwqalsh482
	cRBOc+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1n-0000000BDES-2OGP;
	Thu, 25 Sep 2025 16:41:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1e-0000000BD0U-0Aeu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:40:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso1213166f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818456; x=1759423256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOcrIoNr25HDz/QJv/9nz1km8B+JKQd3A3tnWDgtjkQ=;
        b=crwu2+kTzIBbK8sz6fIaqx2zunQPkXdlfIrthUYhZXd6wbTEzQQBrJHRpvz5frIHQy
         /PMUxY8VG9D7vr9eonQ9o1e/lW1+np04tUFAF4VhF+y9A774Ckf7hCG7mcsxOjE5Edw0
         MZ+/sCGs0KJhZ5bLCA2GMoP9CFOUKxrHzwYNbUPkdh+3x+l8E5a1NGrBu00AlwQXL/wc
         0YR0FX7t6Mry0kRWQuwSuDs/MYpAiK8dItJvzWPp5I+vzdlo5Vz7E46KHs3r0ys1+PdC
         CHTmW0md7lB6XLP/S+ZNgDPMwTkGichS5w4Krf+tIiqFto1ZJH2N75E8GL4RR6VKtzxn
         ShCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818456; x=1759423256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOcrIoNr25HDz/QJv/9nz1km8B+JKQd3A3tnWDgtjkQ=;
        b=eVh68PDyGBOCxCnYNa3+nrypUXJXmixYiIdKYEOaVY7hjzHibtIekPZYWmV8yehUf5
         wqteMXwSZictlHlOslbLdckImCoQPMmPR07qiHGz9g7h87gpR8Gk8qiMiH9dGDxXBklX
         jELrMNdkb7T0yxfwFGv7y+X+K9tVfY9IT2XWfflLionyFpH14Qk/jZ3KdDbf1BJJxrog
         Z5PlLpPogo5N4IRMwmxkU2x2xZD4baJLq4OyOH9epSGTfNB4hCE6AkXroqEkjaDv1Rra
         DTxvH/RTmKlWtzSWHHgpeH5tXmhfd/MwrvNvpIg2277eTDv6buW4HmetV0PvkTvT0O5i
         3MAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRERnhmrHBZf208PgufuWf3n4zmd4i772Do7C1SzLS0I3SpktVIJrxx+MCn40jHdG27eRssFMDkpj8dDZuQZBT@lists.infradead.org
X-Gm-Message-State: AOJu0YwzA9HjiWWnP0aJIBrgHef0cz2iKbY8P9b63i4G+xZXtrbJF9IG
	UpOqEfYM8KZAKlJNmG5C7IZpH0dryfHNM/z0PftV/Q8BLaKiV9Jp5oLV
X-Gm-Gg: ASbGncv05zFAmtxwO8BdKmcgkjj132OC4Pd4yAvIu7GMaz83SmG3tNe+H9JsjaIR850
	jcDvbo4zMA5SSPZXG9CaQ9vcyztV5lV4bARQd6T3s3/pO/D7rvbxaoinJheFeGzAakJ5572cAIh
	mqqYi8a1OwfkhbcDnf2Ct5QOt+w1SfW79XZjN5WRp0tZRVDiWDZHt103eYZcqZ5aJkPnZKDclr5
	k42MOZPSchCGBCF3Us0TL5Hurx+Y7nnThV1qJs/8dOhP6tbbjoa096wQHqfel6coO47lc0UGCTU
	n16T106YzogPQrLz8sxKOw8ThvJh0QHeWqFHwFcnp7NL5U/MgvjM+npvoKQ/sG2FXziFSrOt6IE
	8nDDgBHytxZco1VmIfR+lI9qm8byReyAB6P2sORyY9Rd3smYkfiueVfoHDgSslU2feFpaNGk=
X-Google-Smtp-Source: AGHT+IHX/CI2L/vfg9Dj8p1oMbt+FsoCRcXjcK4DCzITBXnWVWzmuBAbvqxNfCx8Z5RM2iRB5ODlEw==
X-Received: by 2002:adf:8b88:0:b0:410:3a4f:1298 with SMTP id ffacd0b85a97d-4103a4f15e3mr2182661f8f.15.1758818455924;
        Thu, 25 Sep 2025 09:40:55 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/4] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Thu, 25 Sep 2025 18:40:36 +0200
Message-ID: <20250925164038.13987-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925164038.13987-1-ansuelsmth@gmail.com>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_094058_076437_7F0A4A4F 
X-CRM114-Status: GOOD (  11.24  )
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

Add Airoha AN7583 compatible to the list of enum for Airoha Supported
SoCs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..df897227b870 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -18,6 +18,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
       - items:
           - enum:
               - airoha,en7523-evb
-- 
2.51.0


