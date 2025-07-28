Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F756C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqOVyINMYuNtnSjdNQ+edIzC8dJzm5etAOwvnetYLt0=; b=nyxDsB0KlGvro1nTXVD7FoVIVd
	WDg488LUdlxZY63qteMXiXzHbfX/KzH+5rvWL1e/NgWzwkiBqIfnoSyyketdUsee/GvFavChMD2M6
	+FksYfrcGdR03VmKCh2Q1Rw4/bfZqWuEqhi2VRdJ/E7tS4Pm9FCf9RB7VV6k9llItp7sEe0wZOZW9
	iK4p8vd5FzmxPFDL/ru/T04B+vizcq36dioluLbi0bHHONuRfKUHI3ULaGWjQDSjSQxdZCH2ar7V9
	nj8ArZz6GdBx9IpJP1TpT1h3iEyLe5wksP+kYfXYwAuEoOkISq0E84G5SnE6HQpaCAYLeu82IOVTn
	NlCwqs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHGx-0000000Dl4H-3NmF;
	Mon, 28 Jul 2025 06:23:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqk-0000000DhPM-1vXv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-23636167b30so36424925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682198; x=1754286998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqOVyINMYuNtnSjdNQ+edIzC8dJzm5etAOwvnetYLt0=;
        b=e9sn1YWYDiNWMukHQzqMujh2BMdeHmY+yz0AmyA5uf8NXFYE4e+D1CXbw8nUPBLsnD
         2wIxg+uMql/mH4c8655OR29l8C29WipPwIBn6efDTco3JGNRlH6zek5duUYNEpUfkpTe
         cZSTCefFnGwgbUvZgFQaSNa/U5YdVp7ZuygKpK3nGNLCbRDwMOFVyQKwBRXjOGIHXMBq
         jH0rs4esnS7Js9THSKfa1fi657tVv/O4ViYqb5corW2ELTlkECOakMB49KuSVhUM47Je
         TdD0ktVT0jpaZcEWQu9ksbDo7wvz4uoEpJGFMZ8eG4do+gG3sjjafnLsKbX7YDRsAUQ8
         l0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682198; x=1754286998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqOVyINMYuNtnSjdNQ+edIzC8dJzm5etAOwvnetYLt0=;
        b=js4qAcjFz5sIeboNtG0R0zs5rVRdS4E7gASavO4fA45uwVPYLQvgPYOH9GbqSsTzuk
         jQB3/DU6g1V/8bg1gxHbF8nfwv5NfJbeA8TTv7WR+/dk+VvhpwjduQs0Oh+TpxOXaWYM
         Ch+VymibiNY575X7vhxWfDnw0kAWRW2Klpzz1EoNv2nTfqkVYR/lA96idcnThm+gh6Nu
         Uyx3ilNkU9IEL1PvRQoNCdryQKajM8ar6Io+dOFJQxH8YXzOFhKhqs3zIs8ZcZiqyIPp
         ntWlpV2sQorAcicmo8dSG1GTqNZnBvAHPBIdybBVtMWWUn1VHZCYQCGzAVdanWDVOJF3
         3cYg==
X-Forwarded-Encrypted: i=1; AJvYcCW8yKnhPc3pCTZfhd7QRJkos5L8iOHVvvrUxsgsK1sxJ/4prKaVqS1JzMq4DZE1HdTIt/B2T+QAE/FBEnRFGRIx@lists.infradead.org
X-Gm-Message-State: AOJu0YyPxoprEXDXkuNkSu7nF2w2TuSJ33sscki/vlKgPhQbkzF9+7wo
	19dvdFu7rOjxMAt+jMf6ct5EQrmTwtor26AiZZ13xz3FowIGLOEv4MDszM8F2DuV
X-Gm-Gg: ASbGncs4xTYbM5/oATt4RYJIbFoO9UBWueC7omcSjdDoFPPrBrcnS6FhFI9Rw6XLAAj
	Ln/Duy45oogv92gmRjeu/bETd3XEodnifaPhwF1H6T1MWQffEGJZNapZ1txGIJHLsN7BMN/+2+f
	/mPPkwoX+hXaxuLcMyBha/RxsFCrJQOypB7QvGXNR4kael9x+CXQ/FBiGRv/bUzKaGsfPmzRYQT
	NbNWnok0jiPDPwXPleMjuR382T4OtlcQovGeo3lVqWetWmdqH7oHJD43uVRSQ/WV7dPE9s/DY+s
	iXEZ4A2109xbRSI0fyh9g9c4tqtEtTKBdqSOxiRXdxPaS4I+PsUqO6TeoVE1wskAfG9WSNb/7Yg
	EANmruyrPe1w5Aa78vklPYyKR5TB5V0xmlrrC0wjL5GTjWV1LV2YVfmh0N5JgRXHGRZg4DwXWo+
	g=
X-Google-Smtp-Source: AGHT+IFBm1mrwen/QlGU6O64ea2pU34DFNUrcoPJ9y+PKUl8rOqB7Kvb1drivW0O2i/6eJF3sUumhw==
X-Received: by 2002:a17:903:2a8e:b0:23f:adc0:8cc2 with SMTP id d9443c01a7336-23fb30b2f8cmr145174495ad.27.1753682197770;
        Sun, 27 Jul 2025 22:56:37 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:37 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v4 09/13] dt-bindings: arm: aspeed: add Facebook Fuji-data64 board
Date: Sun, 27 Jul 2025 22:56:11 -0700
Message-ID: <20250728055618.61616-10-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225638_505880_8F5E2990 
X-CRM114-Status: UNSURE (   9.96  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Document the new compatibles used on Meta/Facebook Fuji-data64 board.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - None.
Changes in v3:
  - None (the patch is introduced in v3).

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 0c9d6a30dce0..3cc6e62ae5f3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -85,6 +85,7 @@ properties:
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
+              - facebook,fuji-data64-bmc
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
-- 
2.47.3


