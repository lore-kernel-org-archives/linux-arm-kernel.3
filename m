Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC2CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEcS9kmFNroiJfhtAKIlLkk9PCfkgBUnsKq1fC1zPFg=; b=07z5tWMek+oncQQNzV1Jby5KSj
	hnrMB9FVpZmPbdPfeFCdFxJH7Qrqtu2RkJ9UjFOHfvaDQ4MIKmJe1Hu7FnVYIsgnvIFLQ3AdUUGHs
	gzfQ7Rd5ivYIlBSg8LZkQvUMY14XH5aBBfDTkYHceX7UjPBq+xR+mgVtxXKBrIpVoEWfByOKFJZmL
	VqhKNnP0W0rzn1mKvK+6nNwRBbTUMp9HuDgvaPLmwbnKJDisHi0/kPunqn5TvTn+5qojYVktkUq5f
	VggQ6qupuOXAJLOJjbiT+cisPONucQcyxbRSsP8MUoDXuRMbvAnzd8labmP/41dWIvIJV6qoJ7kya
	L6Z7JKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3Xn-0000000Glqo-2qtY;
	Thu, 21 Aug 2025 11:33:23 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0h6-0000000GG2o-2On2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:30:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-afcb74bef86so11915266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765047; x=1756369847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEcS9kmFNroiJfhtAKIlLkk9PCfkgBUnsKq1fC1zPFg=;
        b=sGrKuMFRAt8YM95euzKJb9TeCd1GJe/IfOvOJtuDtlkQbChe57VV9JgKFq6zLXiCv0
         gZObc/pSkDZp+elYdUxpmmSRVMeZ1F4rG3rDNEuEGScSv9U4oMTwHOHKoZI44muZ/MCM
         WcpPihi3VKersVR0YYWrXZSRXebcmm1d6pIxuABPyRQvU8kU5Zac1dJH+W/JYN2g8hjn
         g/poMYX7QKMbAFIrRFyG+sBuC+4snfLD3BgnET2T+ySsx9cRXyVWfAXhosLuuumIFcJD
         hT2f6DaMt2sdwzhzrYtzLetLkNowIitn3BlwMpSwCiZMT+loIyyn7zc3g3LZk2YBuPer
         v2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765047; x=1756369847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEcS9kmFNroiJfhtAKIlLkk9PCfkgBUnsKq1fC1zPFg=;
        b=GSP+IUyZZQEC1ubO2BIuzWrg7NSlTDWakg6pIEeBF70O17vw0/m4hlsBWRfmK8Y7/0
         5AYwQbNaQz6EYviqt4WKo5FbvdnmuN31G5u8ugSh4Y9Iy+0wsv6U5uHRJHrFIqOH7Lzz
         dJzugSJ+jOPrGS3M/FnlTZ1Od1athsm9S9XnJIDU8+On9ZCQ3EvTN+uObGLCG9bnXaRP
         P63l8jGqLdCXIwcs6vijTsj1eaCrDy94nEhK06NlN4+w2J6d3HK+4RdRS3lox3Hirs6b
         oCyTKfJfKm845iJs9WkBV44Kjvvaq1+5grLYxuY2l+XsEu400OxvL+td+eKWOS12mvFv
         cKsw==
X-Forwarded-Encrypted: i=1; AJvYcCV36cIJzxXl3zy5jz+naw3i7yxj4HnbfI4K7X87jlho9zBGcKnYSrIg6co2aOnNQS6FGHm2KZY+eowOSufrLpUX@lists.infradead.org
X-Gm-Message-State: AOJu0YwE4PjhXmcstqt3ob8/qhevR7LaKNB26TporQr8bdZjiPX8XnYu
	vRPwzMjGGH63ERV0K+JNr3K+caGuIUUNooXUwRPzwQbPXZm9MNQucIa1ZN96Ugzu6I4=
X-Gm-Gg: ASbGnct78JUSuV9gDx9iYlK20vaW3vsfV0tCgGoXahmoSqQQywOY9ZiuGKBep+055ix
	m1G+7nJ+dVuXzqdPZsJQunD5ktFJtvKtkbOkKbhlFEjqXAvuXFuemt787SV4YK1YpeSWe5/3Kbr
	CEIW4Vo7hbb2wpN2HTCD8l+RMUKKEpVOmj2E7MzaaGwpt0v3lefWZkFKah+OmxAWYVuTENNZkap
	dJFjB3a+5qXsKHgBF+07MoVBgfhLWTi54IfZ+Od226khfjfxEbK1+kZw2pasEXQAVdPzpdNVCyH
	IkTqxEA1vxtunVIV4gzRYRDwKXdtxN/b2WRbwKdsS1Ghz8R6hSJ6dj57JxHCWKvhQZKFcsM2UwH
	H96zmkZVMPNirhrxNEPVqdBHAbsGSunMJjA==
X-Google-Smtp-Source: AGHT+IFfK7KR9dULQ+eb5pquxlByOYnBMZWeZhLR+dgCavIt1FucW6E6r00iBOgiXFI47XtRb0RHAA==
X-Received: by 2002:a17:907:6e8a:b0:af9:3758:a85a with SMTP id a640c23a62f3a-afe07a1f85dmr80547366b.5.1755765046984;
        Thu, 21 Aug 2025 01:30:46 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded355489sm349014166b.51.2025.08.21.01.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:30:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: net: Drop vim style annotation
Date: Thu, 21 Aug 2025 10:30:40 +0200
Message-ID: <20250821083038.46274-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250821083038.46274-3-krzysztof.kozlowski@linaro.org>
References: <20250821083038.46274-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ND4zh8X94+77oWXwlUcgY2jHQfPRnpcNlAA0j3O1hvI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptkv9iG6FsH4MiISPx4GR5gayrwH/aJQg3dDl
 pA50kxO8HeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZLwAKCRDBN2bmhouD
 1wh3D/sFpXXif9I0uZB2iXFPLlCC5wlPui68Fk6vtcGP5KMEIZUYTBqI4tMqX5EOZSgZM8Cozri
 iflai5Ao/Nrgn4+KHzgGfbwgeStGH2ylgZ+6O3v/uTCz5rcGKlUhezIZ2gKGgXQlLEc+6DTDMlq
 yTyfzKEz52Y6uzynfvYL6ro13xevfQFRV9o96Cl8ELwuyBn9tuVGy9Odc/7lRgkS4A02rSNxS3G
 SXRo+MmopPrAI7Gh1K+yG0uEXebY6omw43uzjXeCDYQ+XaQ+r+jVWpI8nNfXC2U7+TDlKtRJ/5f
 khxZHQ8bAlMg1rfRnjvaQn6DQs2YoPZlnvEaWpk8r7l1POYieYwujIWqcKYOW4DjgAZBnXhVRe2
 /0zx2fI8HJ6hdJfXrnOGthZiNPgGJHz7kxxiU9UzrYxi4fmRbL1aYrZOo2MqusjMQjYCrTR+R9q
 plKS4NZDqimEFhhXvI1DpDw4kFn75sIalTS+TIrxY3rQl7YdP9OeKcoIahORG+YdxlzPRF/WD5P
 t0hE3+67pfSobjD5SUsGh0lo5vv6SK3H6IXwOGca2rBDh20yTUrG7BjLRFWfQchZln4wWERfo1w
 mPVO6dpj6VvRHmdqFFDle6yhcAuQKKQBN8vND/BCA9uqeYQv/yEeokzWi9svny74uDwOn1zHppB aZlrJs5rkosb93g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_013048_608415_9E7A4C51 
X-CRM114-Status: GOOD (  10.11  )
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

Bindings files should not carry markings of editor setup, so drop vim
style annotation.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/litex,liteeth.yaml        | 2 --
 .../devicetree/bindings/net/microchip,sparx5-switch.yaml        | 1 -
 2 files changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/litex,liteeth.yaml b/Documentation/devicetree/bindings/net/litex,liteeth.yaml
index bbb71556ec9e..200b198b0d9b 100644
--- a/Documentation/devicetree/bindings/net/litex,liteeth.yaml
+++ b/Documentation/devicetree/bindings/net/litex,liteeth.yaml
@@ -95,5 +95,3 @@ examples:
         };
     };
 ...
-
-#  vim: set ts=2 sw=2 sts=2 tw=80 et cc=80 ft=yaml :
diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index a73fc5036905..082982c59a55 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -245,4 +245,3 @@ examples:
     };
 
 ...
-#  vim: set ts=2 sw=2 sts=2 tw=80 et cc=80 ft=yaml :
-- 
2.48.1


