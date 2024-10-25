Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF06D0C601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HNnYCMWwNqSncdK5XICNLGGS6qqpAsQS7/caik9gL8=; b=CGnTdnjiSpNkzFldqVoZSxhVby
	jekepXqmCNCqaEg+qkTLc85EfihRpfxY6+Yr36d7DmEtYECdTobjBXnsj2u38FpuckLsc0WPzoW8Z
	n48ndOP4muaZM8CbDBeY7Hxffx/2BusZmUkLxEdeYz7Djzz3N4f3YUBMYEhhSGxzdo0ivvTw1enV8
	dvirhWYlo9b3TOWV4KUfRW66HupQEBdnaxSgqIYbJbVh3Vtdvws0E8/0IKF6VvlRt6jUTErmP0XGJ
	3X2xLrF0/6MFi1T59dl2s0MRgZcz/g1VemMC8FVSapzpleo5z2cw1L3xJn1k680GNfGtPosr/mSCz
	iO+XPdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ih7-00000003XYi-0oNl;
	Fri, 25 Oct 2024 11:41:29 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IRN-00000003Uxn-1dV1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:25:15 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539e6c754bdso1764377e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855512; x=1730460312; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HNnYCMWwNqSncdK5XICNLGGS6qqpAsQS7/caik9gL8=;
        b=kMqI3VCCta8//W9hfVMupLwzzxdU1EihzhgJUXzaA0auliGO/+2yJpvesnpz/wvG+H
         rRpqgKU9Qb0yap7Lfm3OdgGxsaKJg/GwXDJLKp1CiIN3M07wPTfhLx3h/21bP/Rus0lC
         O8q4xUA7IumugfTR0OTgSp6/ko3nHKb2SR9t/vd8a+kJxZtScleFDw4fJV097D2Goxd9
         7qvJG8CzH6RMFT/nPFenjnm1v/fEqJRL8+HCLAoAugG9zmHSji9GlioIZq5+jJFi/QSj
         +DdTqkTyo39S47EFceUqctYsPjUeroeoOoYoHVgyVKo0UoNeqLApO1/bbd+yOiElxNtS
         xhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855512; x=1730460312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HNnYCMWwNqSncdK5XICNLGGS6qqpAsQS7/caik9gL8=;
        b=NqgQqvLDkrWxj7dbN0PnIfdvsV8Rlifii7shb8GdHYd3mZVtw0jVh9nsGC6kUEaL7h
         AD6HQcpyOBFG7H3M0w+PiX3z6kX1Y/EQTsrNPdeYROC7qr+DLilKPnymtProN/poCe4u
         IF7ukOKWOtR0jTsga2yPyRfXarumsMSR/+q9RcO/mCtBCqB9eor/ccf1SJf3bHIacerk
         ThjDSOYmJjEY86Q4DAWoINLKCn78DPO49bNj52kFAqF77RNKN6hZnroilSa1RFy9238t
         jQl9Jflbf43SgYcACpTWa+TqpsvYW+HodrJzb6ommFzfTc891b2JJ1xMMZgWOGRhVFXZ
         6h1w==
X-Forwarded-Encrypted: i=1; AJvYcCWx7dZFuus2F7J0maznPkBS9NpPhsIkhiKqrKVRQPDInXmiOc5ZXiE018jwudVN2BuP6uF3KUBhMx0x7bV37TgN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw8Hg90kEV5VylZyVW/Ylus1v65DRuMhl5MQHLAkjCOZ7+IbfE
	nAM8ZtgRRMdCrgcA32E9sVrMWc7gUFx39GM387EXyoP+bBdhBaDd
X-Google-Smtp-Source: AGHT+IGWhx14LNtltdJxbSM1OwgnZgVxVGD3zuhki3CqEUZoL2D9f/SDtBAiMVIL9e/v9p5gAgVqgw==
X-Received: by 2002:a05:6512:3d0e:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53b1a391e86mr5184359e87.45.1729855511426;
        Fri, 25 Oct 2024 04:25:11 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c90c0sm144028e87.189.2024.10.25.04.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:25:11 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Fri, 25 Oct 2024 14:24:49 +0300
Subject: [PATCH v2 02/12] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Samsung exynos9810 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-exynos9810-v2-2-99ca3f316e21@gmail.com>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729855507; l=1083;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=e0pUeZhnaxoOJxI70AFSXGBv66qAJ/ODZ80pJS01hrw=;
 b=sQmGok87n+es/tJA9th7JWqP4Nbe8occLtRJWndKkoWz1YPWdc5GUzrS6sxN43GcJj7SXodIq
 RLrVmYnnu5HA8KY70kpPWkTvJauKR56ZvAGF4ak34wFnAgZSirOtDrN
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042513_630020_5553B610 
X-CRM114-Status: UNSURE (   9.78  )
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

Add the compatible for Samsung Exynos9810 chipid to schema.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 47a8d98346ebb83a7ea4d11e2fc7fc87df6bc5ad..385aac7161a0db9334a92d78a57a125f23ca1920 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos9810-chipid
               - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid

-- 
2.46.2


