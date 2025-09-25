Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1799DCAC5B7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eyp9Gi1dreOzDe7chY8j7wPpNbM6pbeZ96TyLDdfpM=; b=vx/502JCa5f+kktKUd4IyXhbyX
	AanXKJ3w1XxKfL6saSYUe/J2oPKySL5NLRR8toud0E3lvYMQS3vV6RvKpHNiSqK0747qp4XT1tEhc
	3nMKz2uN63Y1vReEP46y2nqKGUUZwSadtb/ePfU/y9ZrFEKAGdGw6/NhCYPat63kV4X7RhosFEn6s
	2QoWNnNZJ1L8P5fLCSYs9u094hy64qzdsRqVvHyZYMyGDmPVwc3J45bqojRPpS2q4Ylvj88EgJINi
	KjOqFhanRZ97RrEzQij0SjmcN/yVBXmMNO6BEdVQHx3jXFh+f/7Sl/2R5SNtUpKf4zqS0M0Mmewgx
	QdoSAyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1c-0000000BD15-4Bdz;
	Thu, 25 Sep 2025 16:40:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1a-0000000BCwc-1e0H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:40:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so1230241f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818452; x=1759423252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eyp9Gi1dreOzDe7chY8j7wPpNbM6pbeZ96TyLDdfpM=;
        b=HMXFmCwk3xZGJBQL2tLyd19VDUbUdIJm2U4gXMcSyzdDYFhDONP7dU69m2OYT0RFJA
         eyjF73nUvlqlmiF9FIuhARifk6ufJ8AkKirlNmWkU9mOBp9sS974aPLpC9YJncM8/y6d
         uChC6AQbt8fydFbrEfX4N6nxXGWyUOWEVTcr+eyqvnaB4tIru4+gLzfMdxZTV0uCTXqO
         h77aXnFooeNXpmf6RiIubrRKEXh4PNnnaytkLO17aZojCP6uNpmrhQBojcwbBtkGNKRV
         zq5bVgZXQvoJB1Gkaem+m15wEnfG44BVE5Wj7/HgvK0aUG29bUpoe/unq8+hh/usvMiw
         5IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818452; x=1759423252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eyp9Gi1dreOzDe7chY8j7wPpNbM6pbeZ96TyLDdfpM=;
        b=Mm9vNYkvWpUOkX/cPFa5mrlHhxz5P6yRrL6Hy68Fn/ecf/fwStGjSuOI1dD69N35MK
         CmCV4udqmTbXgxpZNfmy2QfG89Zo6yrZKpKz99Kdw9Z4n2VRI7Y6RvCSXkRT/KdSZiQN
         JoaoLocivf3A8eQwWe/6AaPL99jTgJ1GZC7SrhP9gf4axtESYOphesTzSJHuJ+lgbHV8
         GhBMU5MQj0zYeV1R+8rKIwt98fKlA23jT3i4alzUyr6AYaDYFfKd5leyPrOpw89BXcDI
         v9GfiNjdVVqPyCezqj1DaT8TzPl5lbFkj8rWCq7KWwvhqUrL17tpyIxrM8PBYui/+On/
         HOvw==
X-Forwarded-Encrypted: i=1; AJvYcCVrk/pFntMHVFjxhpkZ1/ZdCNiaqF5idKMUib07WFrP5DR4yD6xdgN+jTMOQLxCmehKRY52NRpEydm7hwzJUbX5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3h95D0ZvsrCz0ILqlFHgMTHrh1dSoG//bLOmJQnwnjRxz6kFz
	O1XBhw4IP7a7SXwjXoitekbcJgvM6P8cnOMb406vo/WspQrCDW7W2szx
X-Gm-Gg: ASbGncuEtITGshPirHxVoyv7zy4yySbSvbam6euEwDnGcqVoYfQlsXXkkNaWpj8ngVV
	1ab2SddWA1zpJZg48Io+tPRCWqqJVqObmcFzwdqLjB1S5EYtILAmDH0sm5C71FyTZS/1IABdtkp
	RvsVggFypkzwmfoTa64VA+SPFaG++7+2nQlHxkBkfmaQudqCl3d9cuxVwFpSujwquntBEesf1LW
	wsVc94b7kAPUddgXVzMiDSxTrMtQZsrUXsViIQ4SRwRrAdX6HIefYaQVMXHfDDpm1Arap5LmZ+M
	ITrSLcOi7+Ztdz/FPP6tAmhJ2zM4AjQD0Bk8JLO5TU3KCFttNmgD5hLkJ9h0JuEdI17Xq29rpiF
	Sd1/3goZxhqtLIh76z2s6+SLGgvmI7OtDF7z3Nf0/jvXAJy7yYjEnoTAlLTZAwxD3Exlpq/SJ6o
	kOAGo5JA==
X-Google-Smtp-Source: AGHT+IFuboP96UTpd7Lrf1lzxKViS1D5GdrbEgDmgGvbVgns+3irooGx/K0KSA4xhs66h89FOOvM5g==
X-Received: by 2002:a05:6000:3102:b0:405:3028:1bce with SMTP id ffacd0b85a97d-40e4886dea7mr4262966f8f.32.1758818452397;
        Thu, 25 Sep 2025 09:40:52 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:52 -0700 (PDT)
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
Subject: [PATCH v3 2/4] dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
Date: Thu, 25 Sep 2025 18:40:35 +0200
Message-ID: <20250925164038.13987-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925164038.13987-1-ansuelsmth@gmail.com>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_094054_440790_779FD5CE 
X-CRM114-Status: GOOD (  11.95  )
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

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same of Airoha EN7581 hence we add the compatible in addition to EN7581
ones.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/watchdog/airoha,en7581-wdt.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
index 6bbab3cb28e5..6259478bdae5 100644
--- a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: airoha,en7581-wdt
+    oneOf:
+      - items:
+          - const: airoha,an7583-wdt
+          - const: airoha,en7581-wdt
+      - const: airoha,en7581-wdt
 
   reg:
     maxItems: 1
-- 
2.51.0


