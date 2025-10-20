Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A924CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0DnThhMkOfv9YGDKUQ7VwqLvt/fY4Aetr2LPisH1YU=; b=K8BdNmCbFe4C8fVWs4R8QtrvNm
	ByzgcyB3hsQAWJgH+Ugix0Yn409rxJ8eAAPP5PxWm468HAMWtRxN0D1J+YwdjgvhTubjAP8qXRCTL
	7ogSO1B67fymMaIeQQzOep/FI2S5/sIp2Ph3gYn0l5TYrNG+WRsLdR8FP70SBYou1ZEVsf91M5jp4
	gIQ2lTVastdUlpXsR7KQBXM07NY8tmtBJYj/14vfh+F0jpskCZEnDOlI1UfwpIVZtLcgf/Fg14HXT
	g6wPLBu7TNVc2YUJaoKmtlAODySbu69c9DG2kyTr98tEQgVd8f60ODichb2tw25iOgRTSysNO7e2p
	JFR2U0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjou-0000000C6iX-2jAd;
	Mon, 20 Oct 2025 06:56:40 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoJ-0000000C6Ir-2O72
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:56:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3c76f3703cso68322866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 23:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943361; x=1761548161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0DnThhMkOfv9YGDKUQ7VwqLvt/fY4Aetr2LPisH1YU=;
        b=LNz6kvS1NllpvEObvkU33LJ+h5y/UMTrCfBfrQsDX2/F6P25jB+xupctXYOW5FpiAL
         O5Ng0DtsryNJsWtgipoUvwgPazAtkfpM6iT4lgMLSBt++/kOUMQgHlYPjnWPK81Td0cD
         fpK1GXmRbPvm+ZqCShBjVLiwftBvZZP1vcmIOFBXekFxHhr8k6hkwMC0laTQeXMR6VCz
         EM/8f3WjrkQtcli68QRHtd2uucOAp2eIS9AemdVyBchj+O/ZsdQCMIHAWQxH6k56gzVp
         181dPt4gIEkZ7eU6Fn5gaicnCg4P1mSiryWBbgL+1QYrWTcHTKcPwslxpR7HQeqo2/XG
         eqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943361; x=1761548161;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0DnThhMkOfv9YGDKUQ7VwqLvt/fY4Aetr2LPisH1YU=;
        b=jsDrLdnBDmURi1Fk/LHtYiFLaIbhCxwBweTwuH1sVlFihqk1nPNNAxzmCdhQMniTdr
         TBbFpZBUcM/R02eQHv5sPgHviJ0KyrWvy1Tr63e3KYWiU72XwehgunYo+9DnQfLtM02E
         ozQt6kWFppS3p2u1aJQiGajNZr7MTOLyvgw8PMXU1migPnTObM0rdhl54rdWIgocPOMb
         AiGL0nXiUlngcM6zImZ/hmyNL3CZzz04+LG2z8zQJl1+qwYMo5Wo9u1yWWZR5Q5mgBeL
         bmIWQsViNFXLiSa7oUuvLtLudOn0JEo7jPNZvYojcK9wk0OBa2WGdQw66rnw0AEZvnqu
         EvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGQmzJ0VBXVxq5ylwZyqUxUEcfRwxABVcYHcOtD5N//kqbOR67DSgVemHBt99xkxbyGrfSp/Gl2xIIvAfKsSpd@lists.infradead.org
X-Gm-Message-State: AOJu0YyoTk34f1/x+zQb/4h/uMdQOS6RqA1yOnecWcO4JjVlkHz7KzIA
	XgL2in8PY75xxe/9tGQ3NQZQjqZ1EyGZSuELqyL00miN2iu3e0wMx5/CMwKT5mbFkgZCozLKJdP
	HolDG
X-Gm-Gg: ASbGncv80XTcDmslZIeNOkG+renNihfH5K7dzSvERZG7HvRQsZ+T0H1VK1uFa20/5Ps
	1z0R1k2xSF8C8Miou5UNM4Wvtr0ZpJgg59sfBZvVf0mby/Ew5GJbtrXZ5wquHlCusmBwhMJskpI
	2SiufoLoZn3n/rVJrulSRfrDQ28VPD+EYNkd4c5kLC1o0NL8Sxsbhp3k1dJBYjMAKlwadVcu8oR
	g054jjOyo4inQEFazJg8pIgWkxhY4+ZaH4MbGE5T4v3aqEE4aw7qlgjguocff+axomgKmlLgHp+
	xsLXrzjlOC/8Ku/MQ5oTCw6Woiy/Z1IveZKe0wzxVdlTKHZEb2itVkFzDoEp1jnozGSUZDRoqG6
	4BZ4cSwGgRYXRCCd/cWDF4Ge1OgYkDq73krE63YqgJXEynwLVPvy23vYauYepYp8crGBVm1v6I/
	eY5LFQCgG3PZOcKLid
X-Google-Smtp-Source: AGHT+IFB6Ey5I5GEPVDKYwQBF2ZBDxVATO0+MlEz4wW7uv+BJczKh6T6QMgfi5LUYg/EAYYZmtjQvg==
X-Received: by 2002:a17:906:9f86:b0:b3d:5088:2140 with SMTP id a640c23a62f3a-b6472353d0emr732095566b.3.1760943361476;
        Sun, 19 Oct 2025 23:56:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:56:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-6-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-6-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 6/6] MAINTAINERS: add ACPM clock bindings
 and driver
Message-Id: <176094335955.18498.10975479866423717961.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235603_616505_E41A6882 
X-CRM114-Status: UNSURE (   8.85  )
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


On Fri, 10 Oct 2025 12:46:36 +0000, Tudor Ambarus wrote:
> Extend the Google Tensor SoC support list of files to include the
> GS101 ACPM clock bindings. Add the ACPM clock driver under the
> Samsung Exynos ACPM Protocol entry.
> 
> 

Applied, thanks!

[6/6] MAINTAINERS: add ACPM clock bindings and driver
      https://git.kernel.org/krzk/linux/c/ad97aba3e64f8e474ecbce0c4e08486023ce8ab2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


