Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19D1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9y9jtm3UdXwtwABizUC1WU+17uEhYP0YGv4IThPOMns=; b=yjOWhm5V18lnev
	lhMisKbFY48vphFXATWEqCOXS5+3H31G13v6f4R6gS4ht7qU+Vy/ABhF25DyT/kXM1qB5sXI3ms1v
	/ds5jRAVws26Wtx1kzXnHfZiAlt1H+Go8iqfHUdF3OigodQAUdHJH0X76yshoPiIgIyDoG4Oahksa
	PoK9LjXV9OpndsRZUO70PWke4iHVAufYIFXD2D7dfE0pUr9csSkXI68K3vdlMKf+5XW6FFZCvmm4V
	VfMmv8cHqqhendEIH1LfBAYkWr1GphcCrwDQiV4kk6Ji2y1ydaLKjja4Pjw0PpucH73F6q4yYriwx
	qSleZe3f4OrhsFjM7vCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fhF-0000000BbUB-3ZmP;
	Fri, 04 Apr 2025 11:58:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ffR-0000000Bb4t-16De
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:57:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d64e6c83eso1788405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767820; x=1744372620; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y9jtm3UdXwtwABizUC1WU+17uEhYP0YGv4IThPOMns=;
        b=ldcTPsUNZeRUrkwj2B2Ugbj7nK0vcraw0QgYO7e98N+OBXaCO7VeSL/x77fawJcmsu
         DuJFYsEaan5YPsilQzz13yyDED0C7kDz7RuPChQ2SzfQhy74nY9VJ1du5xn5QlOuWdDM
         xWk2dIVwDzQeTPZWIFCYTOtGG1I+E4RAToXNUBUXbXA3dSRKZFupptBHQjqlaRFj9au4
         1LpwEYMhxbilvGsR+N6OORym69Nn9lhZUyyUS/XuoFKd7Gam4oPR6XkaLf63ewUxI1r6
         8XC/LyFsN1CbNMdMuf2XekRh3x902CcdVp2+IGKcWqRk0PZRq9AwcF6d257NCXbTiaiu
         1F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767820; x=1744372620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y9jtm3UdXwtwABizUC1WU+17uEhYP0YGv4IThPOMns=;
        b=BX1/H7xYyTipOeCOC3esxngYwb4Ujj+EpDoisDpXTJ/l6+p+QaxhC/boNHbmWTV2LY
         NxWJLgQ0WjYGskp9iv16a7hhLtg0eIcTw9iorgF5oFx4IUMheA+fwb913U/BRjvjx4rQ
         dnYeIai0gxnzDU/eHdUAHapurluYo9WlZSMRHoiMYWcGD3qrl1BPODfS5dKIY64L+R0z
         h3XCNa6Cd7UNpENLur8qV2eZBz1Lw+QdLVyRJSsfv5Bymbg+y1N8wf0ANamNTx02wQcw
         NuYeoAZORynnB+zq36AV1ViEnEKIfB7ts0FcSSv/fpseCWRvCApTZJhca0tK89EBPaU0
         kAfA==
X-Forwarded-Encrypted: i=1; AJvYcCWzAz4F7XNfbg1Colx6inRMVt1oyvyY9Zf9rxfR2NmCs2e6ltKccrYd5Gyz5nuBezFpZI9KLDLbmH4S0KAEWig1@lists.infradead.org
X-Gm-Message-State: AOJu0YxQb38F7AHRD0K/gBkQ5ep0U/GjhLNR2kuzqQNoXpnfneSKE2yN
	zqZZQs9XAoopX2JGXL90wq+tCJk2eQjjRVzFAutxtdycUGlVWJkuMsDcNoRUUVQ=
X-Gm-Gg: ASbGncvDVn+GMPN+EJ2lMReekZ7jufef02MeospcZtjvAr0ZViOBn8eNORd5dsc7ddX
	xSoiK7KXZarREOPGtykNLFWQZWWm8fCqGWEPwbDmQ/6GhNaKKrBxAMQLWYGDApn09LQo/KFZZrS
	3fFQZ2lrxopre2OtsFutmZ257FE4q83KOu1Ms5s7Yxd1wYRKhytkTN5TefElbUW4IFCdRlG9arP
	dg/cP01eOSdZWiif+hpszS8fU1CnDUQoOhIyeD51k1dVcWlhhaomd5bMYHky1ktMMeQGoeQgMJ1
	SeBxTXV0atxKFGlXlBFjmjPo9xyCf7s2E0zB1qPeJ2NjeuIejcAljewzuds6kpg=
X-Google-Smtp-Source: AGHT+IE3YMdROfy4Pz/lL2bVAErbCHUi9OQZGeJfx60uexq6ErgRMWHK+iTZDQBEUem01jamr5n43g==
X-Received: by 2002:a05:600c:3ba2:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-43ecf81ce08mr9264575e9.1.1743767819747;
        Fri, 04 Apr 2025 04:56:59 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:56:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] clk: Do not enable by default during compile testing
Date: Fri, 04 Apr 2025 13:56:56 +0200
Message-Id: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjJ72cC/x3MQQqAIBBA0avErBsws4iuEi1EZ2ooLLQiiO6et
 HyL/x9IFIUS9MUDkS5JsoWMqizAzTZMhOKzQSvdKKMMLm4LLBN6YnuuR0K3LshWG+68aytTQ07
 3SCz3vx3G9/0AHeSjdWYAAAA=
X-Change-ID: 20250404-kconfig-defaults-clk-fa24f8dc6143
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_045701_310108_AA4BFFEA 
X-CRM114-Status: UNSURE (   8.09  )
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

Enabling the compile test should not cause automatic enabling of all
drivers.

No dependencies, can be picked by individual maintainers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      clk: meson: Do not enable by default during compile testing
      clk: nuvoton: Do not enable by default during compile testing
      clk: stm32: Do not enable by default during compile testing
      clk: sunxi-ng: Do not enable by default during compile testing
      clk: sunxi: Do not enable by default during compile testing

 drivers/clk/meson/Kconfig    | 16 +++++++--------
 drivers/clk/nuvoton/Kconfig  |  4 ++--
 drivers/clk/stm32/Kconfig    |  8 ++++----
 drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
 drivers/clk/sunxi/Kconfig    | 10 ++++-----
 5 files changed, 43 insertions(+), 43 deletions(-)
---
base-commit: 07951d09335e96138e0595208fcc66c35ce0447e
change-id: 20250404-kconfig-defaults-clk-fa24f8dc6143

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


