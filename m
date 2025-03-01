Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341DAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnbdHsHTQ86fPzgXCuKmjr1fO3E1oZYk9t9Lff4ycVM=; b=DM0wYdxfuqILNCDjC6t4ShR/3r
	lCyHQ2pxxTu8/rLC3qbVufelbhW6kQlBWSoCBc+ZT+KuF1GDcdp7qYyDYQGs+PP6a9MO3JWQoIKwh
	iz0z+wnH9F7LZ0pY42mo+kySJcdpZcImrvUz98AAN6jK0wR88AWk0GXRay7C2Ereez4H6dWaDEzeb
	Ac1jB0JLwVnBQiWdOsdx8mDQHoEwLEwR/uQcbErorG4UVUvL2EDBPwx0W6DoQYuPHqyq3LERTSI8J
	71HmRDmQReFfQ9m4Z39ZfR7aASKte0AwPm10imdWmUH5nBxu8mQTRUHPessH7bI/bTh/J+NLdGwFd
	lYbh3ByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNfR-0000000EQyd-3R7t;
	Sat, 01 Mar 2025 14:18:13 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNat-0000000EQK9-0D8n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 14:13:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abf5f2e4482so5463266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Mar 2025 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838409; x=1741443209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnbdHsHTQ86fPzgXCuKmjr1fO3E1oZYk9t9Lff4ycVM=;
        b=nBljkSiz+M/O0iz+xr4Ncsc9ZUpoEM/HweJn7va1Y2ygxDwuB4DmsHoGhDo/pdzt2S
         baql2YSfk7Px5om+hpCDZRID6J3kZACytF+gAeukDD1d5mU9+h7s8Sy0NDEN5mnVir4d
         uMRi2WJmeRbVSMRRFfL5khFhvdxAqNlxZs7jgudoMfN+6jhWxSF4nz0vqQXkEzlNnntZ
         21NM0RK67f5UeN4LospgAcAE8XNZPpKGzzKEl66iddp6pyaYpnFdS4wAYQ+Hii9rHOU7
         itaZwc/TRKBrybtMBj4Dx6LkT82VluKaNvJxgg21RtHsyj6C1N1xond2JXIn2n+sviZd
         lQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838409; x=1741443209;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnbdHsHTQ86fPzgXCuKmjr1fO3E1oZYk9t9Lff4ycVM=;
        b=HSVxFXJI29/0zHaOvN78V3aScoU1qWxov6CJIpVb8CZXDU3wwQPO7XK3X1/PsA/0Ng
         kbw50/Vpo53m1FN484NkhI+Czy0gizeSLSdlidJqep9HQRdwG0XgGiYiwQ/5d1TAS+9p
         jWRQm3geMP5gzWVvNhmJgpelB9DAljyR0zhlfpXHMiH2rFo/8xqwi2YMNGo4aUJ9rClr
         SclWPw3PbVh70koCznp5qYcsMcZL/4EXoG+pOSe4A/nvP4nF3hkLTkqYz9hkpDd/rh2t
         /sjWmXbHvVSXrH+SRIMWZ/1VQ3vpfJaeuPjASJDNEpQIFrojjr9zenjqYADhjPd4C9sB
         G65g==
X-Gm-Message-State: AOJu0Yyui+4XcrhEq1ryTDWojwQN0eBx6rN1vgRDUaa19tXpHwxofKMd
	BQ2eQij+ew/PdRcQ4uf8NznFmBVRkCN2QQvhurAWL7pzju3V8tBYg6ibQ0R6uPI=
X-Gm-Gg: ASbGncvxcCM5ngPXmx6Mwz6eQw5qrGLdRUZtFOvi2CIxjqAye9FhaudVkfuKkW/yElx
	D7P18P6z39HGlP5JIiraFY7AY3pUWYBILAZf5cYp/le0NAXTRyQ3Qm0ATuTmJZ4M3beO0G9Ljgu
	ogXlKLzOCG/gAkS86HOD8rLHBKjn68Co8kbz1eDyjQPKj78TFus1jO5/g+pakYWO6Gr0TBexyZA
	wVdtyEFuCv/lbmluPm9zILo1puZXB1YE6HQZdKIXKE9e16LSSQoA06WEHAUk5ldG8qVRIX7uJEQ
	d617R1HsGFuX+J0CnV6xbYGtxcSkJBl/SpzD+sHfxN/DbGPTldkZagYzb7HO
X-Google-Smtp-Source: AGHT+IFbAre7Y2ts6f+9wyz3jeSARqJEVou9IA7TgraYYXlc+RIXaNzzDk7QN2b0NMZOmmxJ3LBOAg==
X-Received: by 2002:a17:907:3203:b0:ab6:6176:9dff with SMTP id a640c23a62f3a-abf25b120f2mr310555266b.0.1740838409375;
        Sat, 01 Mar 2025 06:13:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250223115601.723886-3-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223115601.723886-3-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: (subset) [PATCH v2 2/3] clk: samsung: clk-pll: add support for
 pll_4311
Message-Id: <174083840636.17657.13627418806102780540.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_061331_095878_2C1EDC91 
X-CRM114-Status: GOOD (  11.62  )
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


On Sun, 23 Feb 2025 13:55:59 +0200, Ivaylo Ivanov wrote:
> pll4311 (also known in the vendor kernel as frd_4311_rpll) is a PLL used
> in the Exynos2200 SoC. It's an integer/fractional PLL with mid frequency
> FVCO (650 to 3500Mhz).
> 
> The PLL is functionally similar enough to pll531x, so the same code can
> handle both.
> 
> [...]

Applied, thanks!

[2/3] clk: samsung: clk-pll: add support for pll_4311
      https://git.kernel.org/krzk/linux/c/f33807c30664d2b134ba17f2ae0740acbe91986a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


