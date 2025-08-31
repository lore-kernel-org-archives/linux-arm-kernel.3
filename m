Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4140BCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUsiiWH7g4d6FEVfKTRPbe3R6ugJoOhF5bsWtOAIO6k=; b=GHwtpW1qNLh+Y1B1Lw1cJk0p9/
	hqv46/TAMMrMe5/B/aDaqE/VV/5fugBegRacWJ/dj08SiCq8k6Zi59Ao44x3/gHrQ8tqCMyHOdnHQ
	mohiZPRgt9ifgb65gfrSOY+TVLuJ5SuhNscVFJotjU9i4p8BlneVjVvY54MgS2b6OP1C6DqIubULe
	hWAQW2XXcljcMGJiRFd4E6itzSL2sydGMhrhfDxtlAs+hVYKxSAOIufB9wah67tVSC85xE7i9IgFV
	PEj/Dwy0FXZ2t/kCG6rsi5zajiLgcEvAxji7agbfmuIi6ClBtHeFFDdZN863JleW5K28dFOiHZh9f
	5XcZreJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usiEU-0000000AEg3-08F0;
	Sun, 31 Aug 2025 13:36:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usi6T-0000000AE6N-1WMA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 13:28:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b76f3b24eso3885635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646896; x=1757251696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUsiiWH7g4d6FEVfKTRPbe3R6ugJoOhF5bsWtOAIO6k=;
        b=WHkvpKiT5TwHG1NhBj+zIFOPXaC52/GNS2G8kdZJG4on+F1uqc2/ubWrPlpIdqh4E1
         j/nrnen5/3DFL6XOQRBD7Tb+psJcgUpPRmzlubYQ+UOP82fIKt4TQ5jrLikoTKA0QVUP
         mz4z7NnKJwcRGitVq8DD57AjCGFxic1wOTBg/DCItIFy5cdZ8vuQ9voSHmFN/Xit8G+L
         xlpg1HghbJR5Tqq5zNOM9q0ub472ZNYqZnEjCwBB9no1oaWjIkpdLPtWAd8O5GLzaOce
         exl/mK2fcQhr5UckEJzjXGY82WSZ+tnfnyygKrxZq6VN4a7PLeoAvqBfk0PJP1MXt+M8
         pSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646896; x=1757251696;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUsiiWH7g4d6FEVfKTRPbe3R6ugJoOhF5bsWtOAIO6k=;
        b=SGPGVSWogRI72zgiI3KkzSra/gasveEMezqnK3a6yim7PKJgDkSc2t1Ee93YvYH0C8
         eybkOCLz/T5Ci4cfui6G8V5F29+WhTbXQc6jif++wxG8pG6BZGtGBXTnbvvrDyd9VBVx
         8U0lDjr1z3AJWZgr2Fk74hvcqN0WKosCyvEdzymKKVnuoqSn4b//7/txjLnz7GgwqF4a
         E+Sa8osEXCtZvdWjfA4aOIEIbfhsBrOcXrgvHSEYcM5LVuVuO5I9hxJN7Ocj9Nl4WTQB
         ncTYCw0O2TuhXcLmUPCq6kK5f+qckClgylCiwuN6GTvbcYxOmx0v9bLVl/ThpxiG5XUZ
         d/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWOu+HeDiDNdECpp46NfKI06AWyPHG6MNkl+Kl84Zf5wEV2C5KkzUMybCyHjwWdnk6b5AvWD6Z+vvUfMcjqRwhC@lists.infradead.org
X-Gm-Message-State: AOJu0YyfczmMX2yZBo0WAmXaSvyXDT9jFpw/IVBj2mbI9BKb30OkKkSg
	noblWgk24F+mmXQ1VF2/ED13zNU+od0rOeUdjt9FTGiUa0J9d621JXo75u2lTen411E=
X-Gm-Gg: ASbGnctmOT0oe+M6TNkp+WxiSVGMGZZbO6mHp4mELRevRcKF+6LTugDzBOe6ljmPFau
	wteU0QToaxJ276LtwR5OtXc7F53zaFeFQ4YqbmGJBudoXTSuOMxh4ASYiwetqx7BE2PjSdzeMvl
	FV9vfZnp2TyPGAxlx6oh1C1q1oWuF2XPBXy7mgB+L4bxwvl1fulJ1egF5mCyfTBLNg1TlSmJY9z
	rYr/+9DO2j+AE9RHEjnevpxRpIDSftFcQs7EjYnKCmU/AkvFaU8xPSl+FQ8kWCzLJx5LZ0XMvoX
	W+ay2S9nM1pjQZrtlrCoM4TwPkHERqzVBi5m6aEfzMgs9ah6t1gmxh+OPgtGcD6CZJlc4foFP2y
	TYe5bQ9vc5oV5zNVkIPXxYf7B+MBLc+Ct2iMjf30e5ohL4WH/QQ==
X-Google-Smtp-Source: AGHT+IHuGuVHHk5pZhTIqaJ6T0pRMpVLKOi+qYDhard/uCHRhDaK8a/HDroJFFPgp6qQQ0xTGeYLmw==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr32007925e9.0.1756646895694;
        Sun, 31 Aug 2025 06:28:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
 Varada Pavani <v.pavani@samsung.com>
In-Reply-To: <20250825114436.46882-4-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120710epcas5p421c3c8169019599e76f782bb7086e0e1@epcas5p4.samsung.com>
 <20250825114436.46882-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 03/10] clk: samsung: artpec-8: Add initial
 clock support for ARTPEC-8 SoC
Message-Id: <175664689350.195158.6648344469963977673.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_062817_407318_9FF4022F 
X-CRM114-Status: UNSURE (   7.76  )
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


On Mon, 25 Aug 2025 17:14:29 +0530, Ravi Patel wrote:
> Add initial clock support for Axis ARTPEC-8 SoC which is required
> for enabling basic clock management.
> 
> Add clock support for below CMU (Clock Management Unit) blocks
> in ARTPEC-8 SoC:
>  - CMU_CMU
>  - CMU_BUS
>  - CMU_CORE
>  - CMU_CPUCL
>  - CMU_FSYS
>  - CMU_IMEM
>  - CMU_PERI
> 
> [...]

Applied, thanks!

[03/10] clk: samsung: artpec-8: Add initial clock support for ARTPEC-8 SoC
        https://git.kernel.org/krzk/linux/c/bd5336e3f7040f300b01702215b45e6267a400cc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


