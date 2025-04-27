Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A049FC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXPUPYVAVNB4fLB5qm1IDSC7hT2U9okvZDPKW73jm9c=; b=RJoYOCfjl8HvbsqiCb8ychqDR2
	mXWIFzLtEf8zukfM3GliukReYGWVd3Y7Ofdt+jXH+SG3R/uCmNURc2Bzbq7ugTcN+7NrLhC2OGErq
	tuzAMgLm4+zDj/P3m1F7gJ92fFhPuoBqc0Dj+0p4SlPN+G4uTlsDOVqBZ5RSyTJrNzlCV5ToQ6mAs
	89q+CaNtP5LoBiDxD3cqn7tvSL6kA3eadAz+ybTYoGujlj4I3xoQPAC63FgXt2E0M6uvr/SiWH8ae
	p1WaznpKtmZ3EjV5D9slgtHwiwuZ4twS2L3gMox5k8zDM01RGcqPTn1uMWfs8m6EXfb10t48m8l28
	ORevN9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u97gl-00000003vmy-1Lfr;
	Sun, 27 Apr 2025 19:29:19 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u97cv-00000003vPV-3Siz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 19:25:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5f623af283fso436506a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 12:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745781920; x=1746386720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXPUPYVAVNB4fLB5qm1IDSC7hT2U9okvZDPKW73jm9c=;
        b=YFlCggPkFMwFhebR4TG6WJQpRWMcRlF1j/y2oacdDUoWFukZjSeCbXDWOTaY+0JKzM
         RnxSj7I7i6dNmqVU1cWpj+3N7uWVFrvLMRJ2LVm8ehol+EtjOBvIucWU1FRDH4wja7sW
         9cd1nV0cfcBxevGyTZIMQGOJD+O88DQyESOfl0X6OuKUeHD3QY/bDCGR3qKcnNnCCYWI
         iTjMuNFO9oYUo676vfinkSoKf4O5hy7Il3I52OdWxTjegyr7r+EdimK4hjhinmt9E7N1
         l/O/ybsyCULq8kEvZB8Ai9FRGXEtx7k5rV4PtT/3YS6KcHppC0GOjlyofh5MA87gPEU5
         eMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781920; x=1746386720;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXPUPYVAVNB4fLB5qm1IDSC7hT2U9okvZDPKW73jm9c=;
        b=oi5VZtTSX/bP5Mt+rj80lmIm6oOJEjVEpzPk467ssG0Ca4Ua/y3XClTC9VbNw7QciZ
         IjK/z0Uh9mSptpaNiivD+iQ8uqLJWeLXYXVTLIbZoZ24UPUJ+vrrl2WhBz0LqYFCxL4M
         sVKXtvwXjWCY7O8ho0GKnv63Jh9HnsfdiRsFearzCw6scIc1XFt9OZ+xXUMHbDP+KNLK
         JyiftF8UO0yqKffW0Z5g1A+WUBExoRnchbHR7m3ArUqbL7UjNZNa1JsyBcD7Rz+/kmUR
         LhLXkZt1sMAj+A5CDHvxtEzTVvwjaI4oDYATSbypiXFyA6oVO46nFq9FBwsSjB3vH+vU
         1LIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAvUb0qsQrZim5ek+hsIGG9h1YXOp9GrifoKdOcUF5rSTVG4hJ7sVeHP/94TXianeiTPBMd7eKOIRpGHM+U/cV@lists.infradead.org
X-Gm-Message-State: AOJu0YwsRgv6Jyw5tODg5eYnw0d5sj2pcngaCRX1eKsLTS5ftopTsPoW
	WIiRiwfxsNg75WwtAaPHV4CJepHAzWQN8UGEjapQdv+HXPzObTzFO7y3t8KVybY=
X-Gm-Gg: ASbGncsLL2XHlLqYDQGUiPUAtxfFT28f7q4bwBvN2SDFO+q25k/kX5g+6OXCoGxgpYa
	iHgCgTGEvSm8AHIQyrZpYsfJp/Ijn/OFTZe07DxEoYaXUoUX3m6a2EfJFyqmtB8ffDXoVxTYKWz
	Ae0xFQ/qrjJaC0yeL66eK5ymdwbvfVUZyF/vHmsN/fU2ks1rV81/AWT6zVp+YOSKL+PW87OD+xi
	Aep9hfcEp0yZ2d28aH4LbBPO+3oWkbC3XRncOGVAAQhd25RCTldNsXq8wy3UHYQ7GQzfkiyZ36r
	OFnLoHBZNlxiyUfwrIUr7yUAFTY60kInXeY92Xo8MQ79SdUMNSgwt7AW0ug=
X-Google-Smtp-Source: AGHT+IGS5DVAmpRz3jszdp+B+4sEGv+C4WCZtJdnPRD2i2v9FBIXA2OGY5+agSN2zxioxrRcy2x40A==
X-Received: by 2002:a05:6402:358c:b0:5e4:d192:86c5 with SMTP id 4fb4d7f45d1cf-5f723a13a94mr2562484a12.9.1745781920166;
        Sun, 27 Apr 2025 12:25:20 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm4650196a12.46.2025.04.27.12.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:25:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250423044153.1288077-3-shin.son@samsung.com>
References: <20250423044153.1288077-1-shin.son@samsung.com>
 <CGME20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78@epcas2p3.samsung.com>
 <20250423044153.1288077-3-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 2/3] clk: samsung: exynosautov920: add
 cpucl0 clock support
Message-Id: <174578191781.47282.17074973176100225448.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:25:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_122521_875437_5E5158DA 
X-CRM114-Status: UNSURE (   8.46  )
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


On Wed, 23 Apr 2025 13:41:52 +0900, Shin Son wrote:
> Register compatible and cmu_info data to support clock CPUCL0(CPU Cluster 0),
> this provides clock for CPUCL0_SWTICH/DBG/CLUSTER.
> These clocks are required early during boot for the CPUs, so they are declared
> using CLK_OF_DECLARE instead of being registered through a platform driver.
> 
> 

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add cpucl0 clock support
      https://git.kernel.org/krzk/linux/c/59636ec89c2cafb54d33be4e288f953b0876adef

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


