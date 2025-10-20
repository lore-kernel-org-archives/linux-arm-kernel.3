Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1556ACCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaVK8QBoBqs9ihl8Ihmd+vajoOav06YKNVafHor6TD8=; b=RVfW2Fhwksdg3Li3ylc/ewIIN+
	Y7pfac8WBOwhJbAaGUkPr9qAsa6Zr/ciPbj3FF7yubsRhMqozAoakYjE/NUD8QKj3nKJKIXrWgJLK
	6c3hpGZrkFxajzrcfGjlHfW8V0ktBHkOOPFAJnOWGgGdLbQ0P37vMLr9AZQEmUqRzyaOIUCXaF6Ay
	mEK2LVKNLXU/rQi5NFsYlpxK9Zwj5CEOA7Yst3/p/R/wPtOvLInSZdF97CFlw8EmKbGOxgo6m83pA
	XNlFg3u+ogyeuDfsDnCjNvgv2T0rMLWB/GaSLgUzV/Fn2IBPogdAP8ElB0GG8X/FaZQCAhTrmHWs4
	fdIT9T3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoL-0000000C6K3-2VCm;
	Mon, 20 Oct 2025 06:56:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoD-0000000C6F1-1JRX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:55:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3f5a6e114dso73762166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 23:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943355; x=1761548155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaVK8QBoBqs9ihl8Ihmd+vajoOav06YKNVafHor6TD8=;
        b=NgsQRxOMW077yuTSvjmLoG+DCmJfCrtMt5dRjNNd53nzUs7ccTCdHRtxYAo63wlY/I
         okRgCPRjugTPy8uDsoY/Kb1tyS81ZYSBahJmLSNONFK+BdMxXQZNE8FVHAUd+UWj8frk
         T8kRLe0L/FDbsg+5ygi4WPcZEBzj9bBjqQGK2qChGPCb7oFhtS+xc6unnA8dGxqhyL/b
         hM4fPtUMQUIlrtPnKiruFi5t+lDarSegrEwd+MM5WPCOBPLFj8tm1YSXERMwfQcH5zrw
         yP8w/ZvvGmFh2im/zeS/o8qRZx1yVLCffRa1KrhauGuDNKYkVzXwCjNQFoYBF/Zp8gRD
         UCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943355; x=1761548155;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaVK8QBoBqs9ihl8Ihmd+vajoOav06YKNVafHor6TD8=;
        b=qu9sV4A3VLo1zmfVV/6a4YWfigGPoy3WWi/pQCnB997RqBgB6z7wRTzSUsoN7tYPwJ
         yQgzokiPQYOrDL3oueZPtwpup7bvxb9NENuCK+yso1p6MsFjw2pn4/pffWrqIx2l9VTS
         ZGLqUs8x8ThhxT0V8ydgphRxQ4e44H72WZ3xYfCf6dc0eN4WmWzoJVGZJBwQHUgwJa5x
         aNtjE8UlNn7h38kw6mNJJI9RiCl/FT6STAty4KQ9TjOz8MhpBCC4YaLIf3x6P1P77V9A
         vVb06II4VQDysxgeONwxEX8/178HRjspDMoEu4M6jrnmv1zu8j4Lx2O0vGJkJvwZ9T7w
         +i/g==
X-Forwarded-Encrypted: i=1; AJvYcCVpqxd789G+os82f9q8aYduPzuxKnAS5Ow4FjkGa96hLnUr68AHLvt1zBksNiZACZsJCdOoES8vKH/lQxxYpY9b@lists.infradead.org
X-Gm-Message-State: AOJu0YyBFsXNRa9Tb1oakXaC8h8ypTT+wKLBm8rZgfUYAHr9T0vxwyBu
	zyBXzZ03+AKzzXUThftsMlUiGN7cQHInKpKuUSHy81Q202h34D8u9EAZQBtfA0davvX/kmM1ihs
	hbN08
X-Gm-Gg: ASbGncsvbAKHQJavW0pM/l8HK1WibZQLqOPy5TArP6+nsh9ajof6RlNr3ZxUQYqIbCU
	TxtLeXpCnonFs5vjTI3eVsN9G9JSGLUzxDHywiIqgmaomSO5CtSnmlWgNNS2FXcjEs4gSE+2PLW
	sPl5hSKSL8Zfl8ecEiM8BvUqjzQMeErq5A8SO6pfFsUJuUbGGRQM7GMK6UwvcPghW/jTWygzP5P
	7LiovNpVvIBJViDqRo5qCneiCWRNdauPtV1rimhttJ9Jxr4NJtArm90/QBVghJY0r3/Vu6Ktvo/
	NvR23b6Z32A0P6Rxp457DjFhmaDLr8N3lwFi3BEh8gkk28TN2or50HXiBCO76GaR4yDTXnlYB31
	b9BYuSoO3cg3Xq/6JCUKI9APadH7FYOfLPh8kSzs7JDw2GRp2TWSdvz4QpDe7ZOqceLLqg1S8/D
	Gj/IyexVv+gRgiJpfenbmm0sAsdYA=
X-Google-Smtp-Source: AGHT+IEACXSl3jMi8mrVrI9HpYdMwelIyG0kqNi6i/MEHpYubXK9Mls2weDpSKYlpFEBDaF0smnKKw==
X-Received: by 2002:a17:907:268b:b0:b3b:44a8:c64b with SMTP id a640c23a62f3a-b6471d45511mr806758766b.1.1760943355217;
        Sun, 19 Oct 2025 23:55:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:54 -0700 (PDT)
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
In-Reply-To: <20251010-acpm-clk-v6-3-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-3-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 3/6] firmware: exynos-acpm: register ACPM
 clocks pdev
Message-Id: <176094335329.18498.4540786180572368152.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235557_377255_A7DB5730 
X-CRM114-Status: GOOD (  10.47  )
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


On Fri, 10 Oct 2025 12:46:33 +0000, Tudor Ambarus wrote:
> Register by hand a platform device for the ACPM clocks.
> The ACPM clocks are not modeled as a DT child of ACPM because:
> 1/ they don't have their own resources.
> 2/ they are not a block that can be reused. The clock identifying
>    data is reduced (clock ID, clock name and mailbox channel ID)
>    and may differ from a SoC to another.
> 
> [...]

Applied, thanks!

[3/6] firmware: exynos-acpm: register ACPM clocks pdev
      https://git.kernel.org/krzk/linux/c/bad0d1260b6dc229657b942400c5fc4f257f50cd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


