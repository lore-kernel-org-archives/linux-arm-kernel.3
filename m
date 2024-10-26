Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD7DD0C604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=; b=RMGF1B8XhrtXyZm7k7fWWfjuDB
	oK9umsSBzfEpRYpGlz4S0ix9H0GDVKM+pZSP7AVJdKreVr84NMFFkteS3kYlR57150gHKPZVLNtq9
	q2/qAtDy/0tPRsDNQQ4k6D6rxOdRUQ+T+yCpKuRy5fNUjmE+0SOL5FM+I42s2S/0iLa6ztHeixL43
	PwwBONyWDH0BbvlTrJyAHpZKVhM8o27YMEPHj8WGf1hwtMgu0iByr/StRVkll7Bt65p6xtzoWGXpc
	Tc2yl3TcWhJopwts0df8FdszL8JrCTWrdT2fHOLJI+xsKTOkP2ArmIvCsEzoHh8In2JAheE4bdESr
	E2rwIf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4njE-00000007EGK-2S7l;
	Sat, 26 Oct 2024 20:49:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nSz-00000007CAF-39QS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:32:59 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so4312231e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974775; x=1730579575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=;
        b=LvLkFy8WcJGfA40Urgb3pjLIM7uAMBgApMBBuw6K8tH9mqcYMoHZcaoyxdyB3p2E3E
         M/aFn2i1qgZR7CrvSy896jEKAU9AL0BUmzD9tJjtntR+S2Mx79AMXC1m2ETjeezu7jj2
         nUlomO+zJMMg7XTZU3s3IRtSSZ5a/oqS1gyV15w3wAVAoZrDQcgUKrsHm2az2bcQW1+9
         qmGZ5LBv8JS3NXF56TY28r8leXAMMcdZ706oexdy4xwMiK9FTyxxWHRUdPJryR6S90J3
         jw08GpJ/FtJEny1k/LWUscgJY7pCpLtD7lqbR7zYkZwufOaaGsRUf+tx25NOgH9wPjh8
         GsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974775; x=1730579575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4PSQ1+e6ucZrPf9c7JXGpzaVnXhXC5MY+CSiZgTD00=;
        b=X56UF0E45x8FkIzcjgYEj3GR7RmITIRju7Ti1o8plAl5ptdzPqGGDn8cUP14uRIUDJ
         ixEv7EJC7xB+Zq2L2Nlm6tacv3RW1qxh/A+jYQWqbsPQQbfOGV5HwEd7Jj0LIEr+Esz3
         KrfQw9hplBXtfy8glSg/YI4NPVFjVz+QoQgxNHuHobxVRilRalOkqJ1bwcMAB5JLAzpt
         nTvU//Nc30VC48sZs5XWI9zSJ3jRJvhFPPNh3uAoSAXdTNkLJfNxrpNRjVURmPNRdh8A
         gqdecQcgy2N1yyQsT946liXidP2s3KXZYecrQk2bp1ldCABPf91k4m3jbUM1Yc/qr9yU
         7epw==
X-Forwarded-Encrypted: i=1; AJvYcCXDuW1lOPRiqG7HjNWF1dHPLC+h6NwclAg9rNJ2Nz1i81NwALVfKCRdqlTcsASGJOin4zo6qtiXeq5h39a86OSa@lists.infradead.org
X-Gm-Message-State: AOJu0YzG61FfmjVHLXwSmL3YYzQC38xENTjBQBh4kKnr3tZ7531G/4kT
	McXrfmlSm0xeNI3YyaG5wAYsoBVsRAvKaaecVpiMsv3DaRlvsa/k
X-Google-Smtp-Source: AGHT+IGe/U7xw7yCNlVrZkKflCS/QoksZPIgpTjKEK2BqRkydCbpcJIzK6HfwaBb965DKr+e1v5fYQ==
X-Received: by 2002:a05:6512:1383:b0:539:a3cd:97ca with SMTP id 2adb3069b0e04-53b34a1b050mr1384179e87.36.1729974775252;
        Sat, 26 Oct 2024 13:32:55 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:54 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:34 +0300
Subject: [PATCH v3 03/10] dt-bindings: pinctrl: samsung: Add compatible for
 Exynos9810 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-3-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=1128;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=QRm1Gv2AA1GFAPmeHv5zxFsdSoDgKKQmqGhsA6AhOnc=;
 b=HDW1N7iiH21cJLtmEurHMCvgcqcgWvT8OTEhZSo9//vXyw7gqKZHkQXBXRI43H4K1hRsp3UWF
 2pLP0DVbPlvBhkSNA9pO2Qo5gsoBtgkSnBUhlu7p131+IutUlluARIp
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133257_821959_D8FBBE0C 
X-CRM114-Status: UNSURE (   9.43  )
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

Add a compatible for Samsung Exynos9810 pinctrl block to the schema.
Exynos9810 has 9 total pin banks and it's similar to other Samsung
SoC pinctrl blocks.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 7e6ef8249de6c2eeedfaab0ad6316af135c2ec31..5296a9e4faaec691994cd567bc3805f870aaebf8 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,6 +54,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl

-- 
2.46.2


