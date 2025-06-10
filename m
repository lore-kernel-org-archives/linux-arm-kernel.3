Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91A9C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbFRS50PxBtzhNgDQ/26OkD0E53SIgINiCNYBdMhaMs=; b=NZTvxaJORpbyGHGNkFZ7OekuRR
	U6K8U7umyi+YHIklFEeEvY1nz/RumkPoIn1tICXY+xJ2BRLY9/MmEB67UC/G95244KW39WQ+Uz8Nf
	z+gK4fiYk+KlTlWcdecg0iALTNVALvvKIkJlpQXMkPZ119W9fmKOj6MhxeAlTeajyZB1cA+UtwWLp
	nbYJkus9MSdD2bgSMdF2C2O8Q51W8BkQnsEacbRfk++YLoSvHNrdjD0TZo8CJ5p8jmLvurb2RQQTu
	QfsXkxBCa+yfCuMSnBTRCosS5nwHbMOQfmhOfptTtr0VuBVjINYaiIhZ+s6Ib0nJVacUmMTMNHiy1
	xt+uoB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOubL-00000006DJR-1bdK;
	Tue, 10 Jun 2025 08:44:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuGa-000000069wu-2DgW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:23:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-450828af36aso2335675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543810; x=1750148610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbFRS50PxBtzhNgDQ/26OkD0E53SIgINiCNYBdMhaMs=;
        b=evef0E5PCYsDta2Q8k7bIW4YJRNom9+0k0eh2v6EqEYY61SwakMUCrJhHh/vi93xrr
         IpAl7w5AhfffomA48wyKdGCT+ETc9bhZqr0z+zNcE4nAK9JEjDjpTcSH8J/0zwCHd+08
         P2ifSRcigmcmBH6kg2aJI0K4FfwqqESnvoZExXA/j2jhdOQSt9e93j07PW7afKNAuFr3
         NgCkcUnjs2oPSPRIOaCQj1Cv3FUlMGAX73xAUQdd4GA7NGhDCXVSFE4gBGhLCy98n5Ct
         iL27+XlvrqRiR3O8PoCaQOXdVlrj6BWtbwR6XIeUong4CnDuP8ESA2Dv/lPn/MmuQfTo
         K7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543810; x=1750148610;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbFRS50PxBtzhNgDQ/26OkD0E53SIgINiCNYBdMhaMs=;
        b=f8m8bnO7Y7Z/LRd0sUUk1jmpUCe0BA7B0SIxj+fzZC1GoqSXNa5wyRjhkpDAMXwTzx
         fMIYEUwThfla0C3wNJdecAafKskdEIrUQSTjKQ5XlZyYZzkKCroQVT4CFa8fFKTx9Zb2
         bfKdntJ/AGWiOeKmwpwS/LPhE3lRGR5e/t/4sgz0S0gWB0Pb94d4BAik71dg6Damo2cn
         1f+FIz9zzqtH2gAk2fb5gA7ha8BvZF7cVDHe8unaSTLO4bwDvufc6wiW30DZ71GUAjgt
         sJynIOhkt7xx1ZjHKNX3zgX+iI0rE2DtAuvjtH4Dy6Ukcp3XsCaZBc8SUNeCw0+Ku1qQ
         EB8g==
X-Forwarded-Encrypted: i=1; AJvYcCXzEgbcVAVfRXJ+9/SxRwBcP+LtKYxr2JMBxQhPJiNIWeTArxhYWErtlUrp39jhCxLqhDA+Cjv+9UijpAZYn8ij@lists.infradead.org
X-Gm-Message-State: AOJu0YwQs/Mkk1HKjeXU5ydDueL+qlgHiuGXp2WtkmpsG/7g/RshEfAh
	68RhU/+bHPIyy6twtQzfwRfHyMnCzG+kypyIdIn+88AWaUEKFM0cBZYfLL3e8k8zrd5a7TC56X3
	+P58zCUg=
X-Gm-Gg: ASbGncupF1WRhyNMRPHWe0jk0gEz0qnrP+M4PqwkFdYt+/VWwpEKU+6C/Tii9AP+Nxp
	odUrktlAkLSqAoNrYpK1w3nDU0R7y8t9LsxZys5JIp6L35z41JHs29rLz2vtZJTcX+5ln7XmRuW
	BaXcVnBJRAfUN+489RTpqFymUDqOAGR2XkNF94u6tNJLtpn5y5zCaAbpv9S+iDLyVqberPyMpiv
	zaAzp9sQDxN0XqAW8mimcMrje7agNRrpS9mjjFI4VBL/r85+GNKPD73oRkA4xZ07CNIx0JlgL4r
	oWDc4dWyPX2jebSIut6rpwLf56/fs4m4HLOYqolwqQyOv3AQfzoejPz2HjHxIRwfYqhlWvXOx2h
	hSv6xyQ==
X-Google-Smtp-Source: AGHT+IGuYXZh60MnbA75lkN4+EYNXF7PNeMVfx0sLkMy+S89GOUa8ZzBhu0Y6PM8zBmmRjjQtSKupg==
X-Received: by 2002:a05:600c:c491:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-452014b3fdfmr47660345e9.4.1749543810522;
        Tue, 10 Jun 2025 01:23:30 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155ce7sm131726125e9.10.2025.06.10.01.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
References: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] memory: stm32_omm: Use
 syscon_regmap_lookup_by_phandle_args
Message-Id: <174954380836.117761.16870623685676642048.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_012332_570572_111151B4 
X-CRM114-Status: UNSURE (   7.78  )
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


On Sun, 25 May 2025 21:13:00 +0200, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> 

Applied, thanks!

[1/1] memory: stm32_omm: Use syscon_regmap_lookup_by_phandle_args
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6d8b18ae647bb456d2a2dac9771d007f243537cf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


