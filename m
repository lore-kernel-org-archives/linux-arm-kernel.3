Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB964E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NDdZ7criVQVdKqHwJ2Kal6Xww02rI16R8MBCBHunDE=; b=4jrjpgUFgbPSYLRCbHPcyNXWwZ
	/CVQlGEIEheZ8Y+6mbkX13W3yPMQD2jv98w9hLZHGMwG4UCSNDjIG9rSnPkZXJiWQx+wMqjCG1S4l
	wo+zefJr2kzP7KJyuDqOg8MxSLZ4QymKw3t0RN1q1yo0UzcJzo1I8XCNXtdgysQGnl9a9BR795u01
	ZOWrS4TSi7Tw3lbao4/Vt3JvvniYY1jLK4qMui6pCv8BuAdOsUpJeftJzAIrmfCt1FNl0M6Pyvaws
	H9bDV8s4vKfoZBoAB1rU7AsqWYial1KGEH9VZkIbzX/D9xDkV8CoBz5DRweofy7UylX52V2qLofyL
	aJUyRFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPaK-00000006BhQ-16Xg;
	Sat, 14 Dec 2024 10:41:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPZF-00000006BcO-1T2p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 10:40:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38625aa01b3so256121f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 02:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734172811; x=1734777611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NDdZ7criVQVdKqHwJ2Kal6Xww02rI16R8MBCBHunDE=;
        b=gUVVZzWX3HYdJIgxODJcBpdPcwqjaofa787AcnjZmV1SnRlHrHBTnsbL/SjuFT8X5X
         Vi0F490v/FHgHBBqIzIfMOWs+i2peilw3sC3Bc9NrLm0mLmA0O2GTR1knwgEjl20UB06
         PUv2zh/gaEn1+kBX++sPl2f1AZD+CWkOdGEXaE+mZAouTC4YyFJU5HTRGoKztD3Un5+c
         1hLciC+UQsG+6h+q7unSuv7AoxmNMZKC3VIU0nS+SSoslm4J7RGdvCUKz+C4mGZ5D3KZ
         RetjGKpqedKBFRDWKKh8BFvANqKqFdESCaN2jB2lN/ZvxPiJeiqx+VixRAuG42to4ALR
         x+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734172811; x=1734777611;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NDdZ7criVQVdKqHwJ2Kal6Xww02rI16R8MBCBHunDE=;
        b=jAcSJG7eQayXRJyRRcGFcyIdTO7mSp31zNIdfcN5Vdgde8ZUcURnCnln57Z97v7pi9
         +y/akshxgLpjlrOMuuk5+O7bZfQWAUEmySHz4O7XQTQbGxNfL1cV/l9SSoLbflU+kcpt
         QZrWc6w/kckTlezkvwoKLnQTgHvl/JjGGw7gPxW3F4AzALbRcl2Uhm+Pdp9k42g7MA0A
         AgqnNld6NiZBhfJzjIijhHsT2uR2N2ru6PyZyWNOb5DlyNbfbz/yM7havVSb602yW4hN
         siL/+mHJEL+NFDd7QwxQELfhE8vzZSbllO1WA7tM6Ypt/vXVjWVfoLLqoEGT7GrZyz36
         hbbg==
X-Forwarded-Encrypted: i=1; AJvYcCVZPG4PIdvV+z8VByk1Upd5XuyCXe5mACdqBmv7G3D2X8GzOi+qReR1DFfRtu5Mv8DTNTH2UIWKSyBrU7JKfEWz@lists.infradead.org
X-Gm-Message-State: AOJu0YwktYujJAh6BaQVINAHOMcEM6xn/5kIXPTyUQh0fHgp5MIBjgxp
	RWl84AiRT4VzY7jY3JUEZgxYxYQbCWFM3g96OLslT6xHvFBGKk8R5P0yMYw1DR0=
X-Gm-Gg: ASbGncurULwg07eXzPJPl5DxILslgStIJmPIpDavpRcvbWTqUN4BKlOGXXK2gMCqiuR
	MjEMTI7O1siVfsIOglvtTT1CeGbli60PMPkolztQxQbV5kPTli92dmU49pIH+1rhcHKiuvfJopN
	4mvuVaJea4paGW8ahr8JFqcgrp/ScpK5ApocUuyjTNvCEIFin6kNCHGyOSeypWPx60KtFbOFJ3h
	xmcLo11Tgo/vJjAmKSVmhON/C3NmJlrC/ay2NCWiFYcB4Pj+ZFFI5y9I+0efy1mJLyrqfkY
X-Google-Smtp-Source: AGHT+IGr1iG8RISOHOiTTg35lGNZDL66gDIhEtHLO3gjjE3O+P7pn6cBHt0y4vmKD6qwOfGi/YuUXg==
X-Received: by 2002:a05:600c:5493:b0:435:192:63eb with SMTP id 5b1f17b1804b1-4362aa3a034mr19610635e9.3.1734172811452;
        Sat, 14 Dec 2024 02:40:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c357sm75366345e9.10.2024.12.14.02.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 02:40:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
References: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
Subject: Re: [PATCH v4 0/3] clk: samsung: Introduce Exynos990 clock support
Message-Id: <173417280888.20557.1392916695437038027.b4-ty@linaro.org>
Date: Sat, 14 Dec 2024 11:40:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_024013_442100_D4B6BD99 
X-CRM114-Status: GOOD (  10.42  )
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


On Mon, 09 Dec 2024 15:45:20 +0100, Igor Belwon wrote:
> This patchset adds support for the Clock Management Unit found in the
> Exynos990 SoC. This CMU allows for clocking peripherals such as USB, UFS,
> MCT, et cetera.
> 
> Currently there are two blocks implemented, CMU_TOP which
> generates clocks for other blocks, and CMU_HSI0, which generates clocks
> for USB. More blocks will be added (hopefully soon), like HSI1 for UFS.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: Add Exynos990 SoC CMU bindings
      https://git.kernel.org/krzk/linux/c/5feae3e79dbe2d357b223fc48ae907ba0aedb271
[2/3] clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      https://git.kernel.org/krzk/linux/c/4a450ed26c580316d720154e7ffb5e9b4763a11a
[3/3] clk: samsung: Introduce Exynos990 clock controller driver
      https://git.kernel.org/krzk/linux/c/bdd03ebf721f70df1458a720b25998a489f63297

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


