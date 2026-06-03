Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F24CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 22:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3C+gaBKcvAuAu/9BkeM+uxTwGBBZ0/WtClg4XV9O2Y=; b=G6whD9QFGsXbKOMIXrILF6CI8l
	/hA/RqMUxDsD8Sdy1eIE5g6bYE51du4qQ0wJhs+ci66tXQfZWMmLpWp6inKAJn1dBZrZYOFEEKHK3
	4r7gP0iLwkE7hzmuxP2L9JfT+uU7qzJwms4xxdSxFNo4W3Yhz0IjFnhFqbDORF78TtBFLbYIXbgsw
	wa1WQAXMh2CZG091TfRY1QdVQD2r3GJxt2dKtpv7HW+pTxU1bqk6KQUA4VQkv6oEyt1Yva/QZEgeT
	X1zEJYKJSNt3KyOlbuJt1y6gV5ewoPzXf3hK0ja7lshj0n59y32it/JiDbyvmcNpOJPag/z+XmJ2X
	fbn0+/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuTX-0000000FuH9-14NW;
	Wed, 03 Jun 2026 22:54:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuTV-0000000FuGG-2tnX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 22:54:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b7866869so800215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 15:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780527252; x=1781132052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3C+gaBKcvAuAu/9BkeM+uxTwGBBZ0/WtClg4XV9O2Y=;
        b=cjJchC0kDmadkrVGjbTRhcm5uE58CHpbyND0NzKhQZi12RcIH0ztPEb0EYLHzP7ytr
         yEXhkY9B1ghJXG6UN1QQ5mmv3uoc9BcPh4uwRUlKivxeDycO+D5EdSYrvFf8/KQlonEL
         ofCv20c/TVK3WgiFmUG/hEAYOOsrpQaWAjpLnHtsImQy/zcG/Yjd4piM/9/F8Mf3cDfl
         ZHw4NJKf8NSTMRH+nyZlQuB4BKXYVHiRKfMCAIKT1ClNy7JK0swoKuxlmIudj6AwFUzD
         XiieP9AQzjyUkhHHB0uBBbvMta/gME0PRWkwtd7m8QYTUWjvAV7QXaYfpkoxHR2xh4Gu
         BZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527252; x=1781132052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u3C+gaBKcvAuAu/9BkeM+uxTwGBBZ0/WtClg4XV9O2Y=;
        b=ZsNv5SVEpt53tfvFvEjlOUauJbdI24G4oiB6FwCvlOw70MvlI3x8TzmBc0tRjDxC5x
         qZSRtqvVg8yg5Y5hx87ChQtivXUEqsf5FrL9duwj9EiItt6P+0DrNI8ynsw1oYvrvvnm
         O70e6Py1pu0Fj2awDzo5HiR0YxvlKynBigL8mV1QP4RARcWU2Puvy7XZhbIkT7zbHseF
         XZSM1LRrRWjYOFqe68cgJI5UGHunxDOFZSIzq2quaFKWZgDKmn8ah87Z/19qFiKIL4GJ
         N6Ti7nKmpDxe861MlKady6Z+qbF5LUMkPz3z4+Orh3s4kDrDhsvaNGi/t5v+nEnxsmmP
         /JaA==
X-Forwarded-Encrypted: i=1; AFNElJ9eFzH6230pVyg42RCCCRUyJ+OYsapgQsDkunPaw9fQ9hlgL2Is2+D8OoYWHBglIgtEagjdbqJuvD5W4AGfGNo1@lists.infradead.org
X-Gm-Message-State: AOJu0YxP1wBoEPRZwdZ0dZzERv08XshWt+6HrhH3Eq3A2tgh58uZxqW5
	LdzzFOmeydHWZzV8Ut5NZwSHe/GifE5WThlnZbh37RBbQb6JMS9y3pWH
X-Gm-Gg: Acq92OG8f4LaZnL84MoxuRH1e9bIK/m7hw0T/Pv7JFFTzZGDEzZEur3nAcRaTDuIOan
	knbe/pEv4+SiKW0aQpEef3svweqkOtMDIXZvve7j/7KetNEqhS+7dgjZfjMb7cOU9IovUBDdh9j
	4eqRNobh73+8ID8plI3qFruZsr+34HOaZUkHJufqxtrvHVVFbjqjr+MHgwrf2DTLCE0Kqh86z1h
	JAq1juKP1pDhHC7N4LWsRSCseeAOFItjHYZsxW2Tsp4ZjzUUJN6KxKoI6j8pxxG4aIIz3GYYgn/
	64WdwUVYGJMtGbJDqx+ncPTesyXu56322dNIT9LbPsFEvpvyg3IP7vgUT/VZgmYWuUQI+xlJs9g
	OQ5UWhjaDz8ptXsAWJtVDCLlnnNl9jvjKeO6XlK/HFHfCPr8Dj38iMegfHP2PWRMlm5aV1NnIod
	Pmh1YDQ9ztcIq0f+9aUQDh3lSG0M3rq4OmerEezYPI1UfaKnRXjLXSRu5NFZtUtathnz3RRoikP
	iQVQRthIVCyz2OExXmBi6N/coTz5Nq/oEgoRFMNWExajXQ=
X-Received: by 2002:a05:600c:8216:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-490b610a410mr82034325e9.33.1780527251928;
        Wed, 03 Jun 2026 15:54:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm26366385e9.6.2026.06.03.15.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:11 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 2/2] arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low
Date: Thu,  4 Jun 2026 00:54:00 +0200
Message-ID: <55fb7ba8f5249a0be5296a0b3523ce20a668a89e.1780527068.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780527068.git.stefano.r@variscite.com>
References: <cover.1780527068.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_155413_749008_0B46644F 
X-CRM114-Status: GOOD (  11.34  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 090752014ee2..fd0a1862ce90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -168,6 +168,14 @@ pca6408: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3


