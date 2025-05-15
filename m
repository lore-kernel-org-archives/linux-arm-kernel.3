Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC9DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=; b=G9qwAlu1o/ZHizl0sgpZCqFHW1
	13wv27CiLFIWRDcrI6pprY1yhh1mE40R6pOwJAVQhIdsn8JazX8k1C3VYV+nK9IxKfcgwRlL74whQ
	uD+v9sj6UVh7OOmiALOI/dX5pYcIIbg3kPxAIb6NXarWxJpmfjP5CQ2MZG+QGBocKQ91eKmmQMUHT
	6QondyNBFELk15cozB0rbs66mIe8vSkIvhQ93MpShVUFA0Gg2ggZSJbI4suDoAuwyVY1AmxPGKyRV
	Ej8a5Z9D+dQDlVTl63rS44ZlaDhVZ21FxlCsM11NKI4JfkEPdvqqqidJ8PwoGN4aa+gafES3cu4R8
	WAdNGJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYLW-00000000gQ9-10TH;
	Thu, 15 May 2025 13:09:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYB9-00000000ek7-0CKb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 12:59:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so9925285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313954; x=1747918754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=gnzYfAw2Q5Ft8eOQx7Ti8qgwOtJI/fYyd0X2C4214uSit838HV7Xl9MRgXyG5atKZw
         K5iBj2K/d62xiCpdD2+1yubQTQTTWOsyqoCRC7ZeiE/uFwG/HqlRJlBlGs0g/NNztgYR
         nB2pOXLuz8viniok9wTP3gobxTomMHFVH7uyhVc46yQZMs1Ia6d7FVsiV5y0hTjz8D3m
         mSGnf9FBfx+3UG5PZa8IVtSZHJydlrJRYE1vPKD03rUGrfL9BaxWf3BDqhNV1mbGqlmW
         M+sIvzGMC0G3FhvQwcof5iPlzxknT7b8JcocLr9fVRecbHG+uO5FkVPmV+rmzMvXtuqT
         8xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313954; x=1747918754;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=JncDB588RfwGfkAdBsxiGTxCl9vt2baS2AWme7r5W2L+wjE/1EDa9JNhHHZsQ13qAv
         gI/blLnQjJ8f6wlgsEPyKANOiFtYBKSIXbNx6iQNSbXrYd4CgHtOLgiBp32G5EQcaHaA
         Raf3PYCyEeYg8qUh2+gLBS9d4FVONZjJnc1MjNRF4Bj2iXHVQIrWB98lVej1QPKBU2Cx
         CHVhRXvnVunQ3c0YSBVDFgd82+ak0/zu0YG7FgvJFFVALTYBow6hihTlucGOk8nFXMvQ
         JaLfZ+9JcguKBA4ruvz4YMSZm2e7RUDDCCdAi2BrrnPGgqABTbuZsQN9Oy3j0IwImXdn
         lxNw==
X-Forwarded-Encrypted: i=1; AJvYcCVxNSWjI1wwvqeTnQsLKUOhQzP8NnNN0y2hOpkuf5gz2sgFgUWyS4Uu5hdGtcRPx0B/GlAEgR4Hl2P2DiToYz2m@lists.infradead.org
X-Gm-Message-State: AOJu0YwFX/o8erPAm7MbBNziJ+DJAdMo2ymhlcUUrAKp8kpJJ+Ryn0iq
	/WsNaWtSAeptanrnaieHq7D7qzisI81vq5mjRWBC3XNomABqY3e+wAh3smPTOdE=
X-Gm-Gg: ASbGncvE2t/vIDwXHsfojhPtj8zd/Btzomnh5YjvyUF6axFSveoBpgzwqzpm8awFS0t
	e9sRgY71NBJsix5FS8tKyYwrrKvj9hMjlmarVHhPoX5Ej5HDoVIFxxanC+4QTtzmwTwt1mpbOIF
	5vRj/J54DQxgKHJkYM3vuao9pAjoJleeAgRBWlvKFSBrRQQd+Eqbde35a+UcQG0lvgU+weoedTT
	Bn2GE1DgpQnI6Lvk8f6k4O1msnXRhr55yGIrG5l6XHxhMqhUfG2XE7/LlJ+Lvh70FBab4dl9GaB
	C+MUOcbqsQ5o6BO4qXB9RcaeQxOnBhs7BIv8LgS2aIfKAwAZT1auG5VPg2YbJnzGZg==
X-Google-Smtp-Source: AGHT+IFyeqD0A0IScg3QZihC1XrEVTucJipRcuMxEvf1pQxV8DR8pNFyFAx+gn85sF514EVzZ/V3/Q==
X-Received: by 2002:a05:600c:3554:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-442f970a9bfmr25956895e9.24.1747313953125;
        Thu, 15 May 2025 05:59:13 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:59:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Subject: Re: (subset) [PATCH 0/5] clk: Do not enable by default during
 compile testing
Message-Id: <174731395227.3761659.8617180462546520115.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_055915_123086_A9456DC1 
X-CRM114-Status: UNSURE (   5.51  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/5] clk: meson: Do not enable by default during compile testing
      https://github.com/BayLibre/clk-meson/commit/0afce85ed26c

Best regards,
--
Jerome


