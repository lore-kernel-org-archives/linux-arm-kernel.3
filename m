Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1DFC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdjGXEPbwx9d8dagmoP3TN3Sha6+88f/yNQTLVRWULs=; b=yok99bRyNNhOAQAEbwIlsyxv11
	65vQzvMJxTXtPON56po/IIXtOlszwFZP3ciw/TGeWcQkLUES3byxSvY6zrwCwPzkaKymWU0r73xYu
	iyK2z0+aRucxUevn4+l/zqgRwSrnVT46ipaKXBuX3j/BQ67Gkzql9ZXz+kOObyb9v3xwkJs5KTnU0
	cBWcVzcylyy3ZSTfGSml2snDB+QlykHYytoMw9Wo4dPNOQc0DYI6LEcZQJkDLnJcFcq6WD9zOiUen
	9CaQGCAzBsivJOWIAdNxrdCYXkujmpFiQHfhiehcAmkh9UH43/VE+Pe0F20HNY2XrPgpy/Xyqio2O
	HUEvU+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcG0-00000004kAD-0jXT;
	Tue, 15 Jul 2025 09:47:28 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbd8-00000004cnm-0bti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 09:07:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-60fdd24613fso974902a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 02:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752570436; x=1753175236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdjGXEPbwx9d8dagmoP3TN3Sha6+88f/yNQTLVRWULs=;
        b=sElKKLmpsibB0x1t/Ump4AcnjPOqciQ7S4vBs9mJOEclJCVIxtlpU1h2fNfsPDVcJq
         FXPpmKTII4x5vXnFvdn/0mfgc7YEWZLMKb/D6Cthgimb1s9u9EpcCz2+VRLXaHelBC8n
         r/ntVsSyU8JOxLblQ99hGBCuS++EXxfCf0qeaNEsCwIhd7LmxhbVFRxR7PTRD0EvUjuF
         hp5fIJNnYnPrScJri7oAYA+3yUJ5thg9OJbJr57McfPPhqpbjG9Y+GrDK2YuDgx6T2eP
         8UzFpj5Dkp3vvozEO4CSOr2P5KMeHh6kkhRe3S+EHsBRnaIrC1YPru7Zdqw5OMYV4YZf
         K/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570436; x=1753175236;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdjGXEPbwx9d8dagmoP3TN3Sha6+88f/yNQTLVRWULs=;
        b=KqvFMkF5s/e0uH7H2OSFWKLQDXwRRPnlf72joSrc5DPGpTw66PAV5JoqUSjyXKkLyM
         48AckqEmIcP41/5Qh6G6pgDJLd2roq8xGBwg/KJJxcPeNEFoPcyv1l74aqUqHaPdJvAd
         INpSCPtOWw3vwAY3JwaRwWvMLEv/17X6M7vSAn/pDZHxIFiOGNz1B5BQCmdGW6lciuYm
         zpIAdWb5oKytSh3pBAG4X+nAGX0Hl4t814G1N8nUP6+DBYR+ZGm97u51PpPjdF4K3YJJ
         p09mbIT5Am6FaDflTrA+fCY3xxwh8HYQm5mka06joiMbvuE5uTY5BgmIOJWkuZmuIre0
         Btqg==
X-Forwarded-Encrypted: i=1; AJvYcCU6okcDtGp3MSiTZ6UVOq2cMwQkQu0pF5pT+u+jvuLOTZqGeDUouhg5s5bMsGfQjRo3VNRLxbP8Nx1SVm/Qcc60@lists.infradead.org
X-Gm-Message-State: AOJu0YwloEwak8P9fyoMY+BcDp/fX9upnOd8Z+Nfm3JZ5l4vpThERLjj
	N6deaZJPhWkEd4fzd9OPYEKUNysOVHuNmg6jxeMoSqH4SMYcKpRhwobU76q+LdTAl6o=
X-Gm-Gg: ASbGncskb4N52sCPNHvThvNOJJ/Akar14n551coEi2yxy9meDZsX5aO7F6VYW2jsDGJ
	kXO/wACcX3z66uDFrEbfwOUqA6deXKS4/OkQ7d6goG7UzQgUIU/7Uoicyc0lVrLJbHUc0VzbPWX
	z+x6ampUI8Z14nSRcfGkobE0cINI0aeB5u+HQxCj3FmmCqcbXO5haM1qo+fFaMvYeeqQLbQPlZE
	3HjtmWNoviHtOy9HsKHmlF4e0mCj8Z/65UClVUBF+Y/vISQdA1f4so1jHBnklSGVhRRtVKvdWvu
	iOY6J2Y7B8aJw/dleyw9saWK5SA0Bk0Z7wMrnTWyvDyqFNHTmGoBb+wLJk7QEzI20oWegtgQCVb
	t7ALOIHD7+ZCTn9g1hVlz0JS7y8LAuLJYmtlG
X-Google-Smtp-Source: AGHT+IG7sF7KS0pmEBtE7CyUxnRi/W3VS/BOjQxGcy53ccUO5o7hMkUXG853x5EsNRJefAyaqN5s2A==
X-Received: by 2002:a17:907:84a:b0:adb:2d38:4479 with SMTP id a640c23a62f3a-ae9be9f6375mr34796166b.10.1752570436431;
        Tue, 15 Jul 2025 02:07:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee459asm988001966b.52.2025.07.15.02.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 02:07:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC
 clean" maintainer profile
Message-Id: <175257043504.32608.13454383152371102716.b4-ty@linaro.org>
Date: Tue, 15 Jul 2025 11:07:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_020718_208460_8D2AFFA0 
X-CRM114-Status: UNSURE (   7.42  )
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


On Thu, 10 Jul 2025 09:34:44 +0200, Krzysztof Kozlowski wrote:
> Effectively all Tesla FSD and Google GS101 DTS patches go via Samsung
> SoC maintainer, who applies the same rules as for Samsung SoC: DTS must
> be fully DT bindings compliant (`dtbs_check W=1`).  Existing sources
> already are compliant, so just document that implicit rule by mentioning
> respective maintainer profile in their entries.
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC clean" maintainer profile
      https://git.kernel.org/krzk/linux/c/7f311e5ac36b6cf9cc0734d89546e643f33b684a
[2/2] arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry
      https://git.kernel.org/krzk/linux/c/8e5bf103b3ada972ea890ae6aa2118ff9b8c321c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


