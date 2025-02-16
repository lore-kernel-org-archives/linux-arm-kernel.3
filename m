Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538ECC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+isfF1av2MEN7dZuPePQNIg6D59LIEPS+5Xwxezxio=; b=J6tCa1l7sBp8cnKb5lS+/JziiS
	Bsz/Ncauo97hrLeo1pdPNYt2ktG0A4WWpMz1wYavXtR3MXkX+hCw6eIYEfhVyDV3T8jw8QAgshhkc
	w8UPJs7RMmcWeDphfjY1zScP45rOIRz1wWCgOmT7mzCD14yQOBXoJFF8UiA723Nv2vJNAeMu9tpWs
	Z19fHvHY3rQ/CcPXv36PHgLFfnSOFpT1Sy2OSpXJ7kbCJtkkQ7WsLGtwJpS3QVlLTOO2o9j9jUIQN
	HubPHlEeozz0UXhOXFtXCmsbB5778sMQQGeoKznMV5MK13NhEJm6vsU4Px+jRTQVFkSN6FK3wr9i3
	POs7MxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjcQA-00000001g5b-0f3k;
	Sun, 16 Feb 2025 11:02:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjcNJ-00000001fnA-25wc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 10:59:50 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abad214f9c9so30133566b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 02:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739703588; x=1740308388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+isfF1av2MEN7dZuPePQNIg6D59LIEPS+5Xwxezxio=;
        b=rjcKNSX/w5iQWzS+hpt9JTGQzByeLCTxb9Wp4tQwyqFPM382SSyo58Pqt+5eGPfea1
         GLegDYqNvqCkp2Znnao52v+qrN95ALutAp266gSOsCp8vhzqa7f9YOQaBi7QBk6qKYK3
         LAtSNF1CG8P50VGyVdrTEoKMnAOB0UqQy6XUkOhkSF3eyglMxP+N17JuM3UgCS1jyn4c
         oBagC17UoIV8vPsuznCEvN5fcT5NiCYdbtftm2/qFRXVvSnPJNvGoMMx3NE6wSI7RkUf
         fRlwiR18KLmy2E5j3Zg7sqmQMBASNDQZy8Q9p1qTVBE2qb40P0z6/w4KQz/MDpLbmVbV
         dH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739703588; x=1740308388;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+isfF1av2MEN7dZuPePQNIg6D59LIEPS+5Xwxezxio=;
        b=fmgtVJjCQXW93Fm4jAPYOFFzerjxsnpndiqPWK72F3LKJQauWSHunflMZ5hvDeZYvD
         7OJzGD+yyqZ6Petgl7qbSdWtfUWxpQs1sm+e9JFx1R/dwsgzMA1UFseJ3soqgQrStIpT
         zBYVqYGqDPm+mEHRspBTrxgi5vVos1JBPDrK6uM6RZyRWlFTvF9suO4FrWCuxgrTktUo
         Ca44+KmahEM/AKWbAz0CVaffJfKNOBZQYcamFzEPWNkYi7QgJyMl2beB5pILh40VLsxV
         qi9bPnQfVzogpmGhZHfd1qT4WCEW2TxMopNQEvDFXio3WONZTQ3eoEtjh4p1QQc+Q7E0
         a69w==
X-Gm-Message-State: AOJu0YyOGhJqsdP8jpizc+wmhiy//nMzWpWbfAby9s+vNLE5zKJ0Wful
	KR7MgzE4F52SyZEmPIU+Q4vCx1JSu05ptmg8NwUYqt+gqiTuTAuyvGx7jEkEv/U=
X-Gm-Gg: ASbGncuowGLhlAL099HSlXJfHaik4R8NpO0CZE4vlpvLi6RxfIzvP3n/BuJETmyHIW8
	Mz35kf3LSv1R2a/GktMrrGYB/3DMwe31eMTH2w+aRRgs87OSgQKtP+4aeaLvvUEVNvl5zW3mBWR
	qrXKp5aAEBVwOIDqAdGBRHaijFnHYgflSRZv3kiAlLwwa6MzxpGsphczuDza670ayJwqjjXvI8H
	8atFH5gE1GOSmhj0R3iax9KTJVJARTrz8ZvPJ54USYwgYXMjZ+EqNAIC8CVBBrYP57z3KOC+ROI
	CNSq6f6CkRuszYtHH31p0O/LBHd48Qo=
X-Google-Smtp-Source: AGHT+IFXNLvXjNtIwPOLaCkCItusmH2cRIwO8DowYwkSiG5W1dJqPaqeLLtJQtE9GmDO3bjyfv9zLQ==
X-Received: by 2002:a17:907:d8b:b0:aa6:6792:8bce with SMTP id a640c23a62f3a-abb709319d6mr218340366b.3.1739703587756;
        Sun, 16 Feb 2025 02:59:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6f13b11esm310849266b.71.2025.02.16.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 02:59:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
Subject: Re: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes
Message-Id: <173970358595.40124.3478053371340167838.b4-ty@linaro.org>
Date: Sun, 16 Feb 2025 11:59:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_025949_597537_FFB652A2 
X-CRM114-Status: GOOD (  10.06  )
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


On Fri, 07 Feb 2025 15:56:42 +0000, Tudor Ambarus wrote:
> Define SRAM, mailbox and ACPM protocol in device tree.
> Enable the mailbox and ACPM protocol in defconfig.
> 
> Bindings for google,gs101-acpm-ipc are proposed at:
> Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4
> 
> Changes in v4:
> - rebase on top of v6.14-rc1.
> - describe in the cover letter where are the ACPM bindings.
> - Link to v3: https://lore.kernel.org/r/20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: exynos: gs101: add SRAM node
      https://git.kernel.org/krzk/linux/c/48e7821b2690428a40d16567b2fd3784591f36b3
[2/4] arm64: dts: exynos: gs101: add AP to APM mailbox node
      https://git.kernel.org/krzk/linux/c/23159ccf60026f9c510bcc422f75b2a74af79f20
[3/4] arm64: dts: exynos: gs101: add ACPM protocol node
      https://git.kernel.org/krzk/linux/c/f64fdd3c592dfb45d9c2be4b2506230467ebd27a
[4/4] arm64: defconfig: enable ACPM protocol and Exynos mailbox
      https://git.kernel.org/krzk/linux/c/8ba2c48394d4f9291d2fa3e108bbb192ac0e5f32

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


