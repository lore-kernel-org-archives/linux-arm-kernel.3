Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7346BCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9Ikcisp0DawIJEHv4fsbvQNKoZVQCvvL3i/2eqE6R0=; b=lZt8+jC2JJiKhJB5pGf85P42KW
	TPZJqHFXWesjKpGZegYUSmmxnVNUyQlqGIqKvTUytQlQzAXXsx7Fw/m5KxPqjbG+XzTl6wtYocZ85
	hj//WbZk18n07VpkDK3M+vtGecX+SacmMIyvh2R92Hsne0ZiNZI3WLRXEV4IzsQH8D+b0Es4PpF33
	iuUjQLYScA7bMgG8AGKqFckVAJCiZCCOGE5yBP6rvhZ8pmkpkid3B80rlA7qReZXGn3QT8GtTMHdu
	ufsAzgrrNtI516rzC3DVbjVetUwmCCRq6qanDfDzYx9XOO72GsNvdsso2hJM8L/CvuERQTUehFYW1
	zYgm0V6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfnF-0000000A4zG-2goP;
	Sun, 31 Aug 2025 11:00:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfiu-0000000A4KS-3hIn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 10:55:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aff08beb8b8so32371966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756637747; x=1757242547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9Ikcisp0DawIJEHv4fsbvQNKoZVQCvvL3i/2eqE6R0=;
        b=tjXFCPrTZSO8HdHT/qnHZJw2G9KV3Wkh/WrirdOl4PTdrOuLZy+p0NrgK+eQIaZMSL
         oXFjRRBn3vyHtUfJP82BUXO/5xh7Ga54RrZB5r2YDOd9Ivt0v1OX789StRR6noSLGvbc
         J0AOKRBZTMruHctSX9YpJNPYYs7JNGlspMnBWlhapK22hQ080FU+MLO5Q5Z29ffoJ/+x
         r/pMIYsjZzlLAS+fOrkDZE2RRvu/Jbh1EjnYHRPgBIwey4YtWqkniNHYEQcOn8p8sT0K
         pFIg0R95H9aiCmYjjXyUcv2AjmKx3xmiOm9YuLQN1p4AThtJpntMhW6S9AhkcJovI7jH
         xlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637747; x=1757242547;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9Ikcisp0DawIJEHv4fsbvQNKoZVQCvvL3i/2eqE6R0=;
        b=G9348cZBukAWpB6CKwQaW3GBHPIQZ/R0zwLApizgDd4FmwmqQG/b0brHmM6DvMAqO2
         fV+DsgS8stn8J33mnY9H/vk3f0QgwhVEuk8nzOgs2tD8YyJ4iply13DwOURePySgQQKN
         xU0MpYrdtQiCu+78g0ULahzbtm7a55koaS7CLephsOtAjXA2ZpJzk0n1XtyzMsoDMXis
         SF3iHGV2GlWMVOF3BwbikpZHw2Nynx3kwqSHBSKLsXMbGC8KRCRrN2Z0Wt3Ij5WafeL4
         yYViH8MYFM9WZLzOtCony9bGS/dWmGahX0LGBc1tGxxBeyY0lQ6ouSM4hJG6E5r/XvD9
         6LeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8p6z1D+3//yxo2pal/Ix9a38spftXCYNBG6ak5peRQ5PW/DPwXbdQ4x6njeukntFi+znkilmJnuroz49GAdGT@lists.infradead.org
X-Gm-Message-State: AOJu0YxoRpH3OLLlKAZpDmHK80D637Ei5YTnP75g3JqgSEPYx6Hkg7Cz
	BoKeFNZbyjX3F9y/nHvRGmj5cOBjLPg8F6zhcT15TZ2d6y/uN4WKVLItykQSDE4j7jM=
X-Gm-Gg: ASbGncvcgO+H14chSetreI5dE9V5HjS/6RjOqqo0FIytKVmPJlvnklJogmHmbwbM/0g
	HnY43ATRTw/GQGEYLCNKLU5hI9uHSdUlOXeIUeEThtMd6PaRiHVg0eH3SGBqwTbVHJniat0VPFO
	CaUWpDo8gaHQC08xoTTDMT1nVjzORXwQvaAyZXzpaRAVTj+vXl0jozsQ1PEs3+kWZLQN5ht4h0h
	7wqoJbyjLF1fxmR6A/4iWNUUiFGBnBGzw9G7Uv/BLwInRG6trg/+ZBwxBoXsdcN0wV+cLK4rRsQ
	lkixzBY1b1QqgoyTXIrcj2LtLMj3QA90YfDGs0k8iaQBDmpmHkftMr1zYv33zwf5VYC/InFmnSB
	X1q/3VCP7nWdRTVqdYta7LacU8sVG0fG9vRNdZ1A/xA6Ea43UTw==
X-Google-Smtp-Source: AGHT+IGQnHEGxYKHduO0rCDVlsbQla5BpUnmcBYqLI8jWWy/4+T75FA5udztvTzcc7SvlOo9rfc4BA==
X-Received: by 2002:a17:907:e8d:b0:afe:d218:3d21 with SMTP id a640c23a62f3a-aff040b2788mr405254066b.4.1756637747009;
        Sun, 31 Aug 2025 03:55:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm468318066b.88.2025.08.31.03.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:55:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
References: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
Subject: Re: [PATCH v5 0/5] clk: samsung: exynos990: CMU_TOP fixes (mux
 regs, widths, factors)
Message-Id: <175663774498.35421.6694005756444857104.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 12:55:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035548_940705_7F2AC074 
X-CRM114-Status: UNSURE (   8.27  )
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


On Sat, 30 Aug 2025 16:28:37 +0000, Denzeel Oliva wrote:
> Two small fixes for Exynos990 CMU_TOP:
> 
> Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
> CMUREF mux/div, and update clock IDs.
> Fix mux/div bit widths and replace a few bogus divs with fixed-factor
> clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.
> 
> [...]

Applied, thanks!

[1/5] clk: samsung: exynos990: Use PLL_CON0 for PLL parent muxes
      https://git.kernel.org/krzk/linux/c/19b50ab02eddbbd87ec2f0ad4a5bc93ac1c9b82d
[2/5] clk: samsung: exynos990: Fix CMU_TOP mux/div bit widths
      https://git.kernel.org/krzk/linux/c/ce2eb09b430ddf9d7c9d685bdd81de011bccd4ad
[3/5] clk: samsung: exynos990: Replace bogus divs with fixed-factor clocks
      https://git.kernel.org/krzk/linux/c/a66dabcd2cb8389fd73cab8896fd727fa2ea8d8b
[4/5] dt-bindings: clock: exynos990: Extend clocks IDs
      https://git.kernel.org/krzk/linux/c/76f1e2ee545b3165e1e24293b59414699118266a
[5/5] clk: samsung: exynos990: Add DPU_BUS and CMUREF mux/div and update CLKS_NR_TOP
      https://git.kernel.org/krzk/linux/c/8c82bb53669b1e82435b5a00a170b7c079940b82

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


