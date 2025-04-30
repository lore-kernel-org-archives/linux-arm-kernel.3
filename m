Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3199BC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8p7Pv/AQU5RzinQRXhOmBpGF3PncV2+ClGXaJ1wYs8w=; b=pFAmSPZkNJf4OHjG31l6POghG4
	2w7V92ST256kpWSxX9b86brdNXscBtu/WYjAICoGrq+JDbngNmt/9kERslILmjllxlRMkvNvA0drD
	s7fpNQiynb32PYT84q2HThNDO/tB3fVYrSGjncgK0wxKsv8Etgmz+J4ML4RRPHvC4KJjr9jc2e3Iu
	NcZ6o1zkL36jM71GDhuT1K+2BaN1vMdME2tQs4eSz0/TYBylzsukhPQr6MKb0xWarr4uv49TjodIa
	lnylq9E9c7sfc3YDUMVtiKy2CGco0IfyYPyJ1hRHJVW7vcrFO/ftWyw9APhEMYxoLYBcxa4N8wMy4
	514x9k2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1z0-0000000C0rG-40vj;
	Wed, 30 Apr 2025 07:35:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1s2-0000000BzPp-2Gtx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:28:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso4946945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998121; x=1746602921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p7Pv/AQU5RzinQRXhOmBpGF3PncV2+ClGXaJ1wYs8w=;
        b=RDHi0+CoiYLxiCojrz6jyhxU56lj/UohnVluaTILAM0su4yDqT9jNJNgnUQ321R4NY
         PfuLYaVrjwnaoYXxUYNar6ogbkYMfxG8PgNAux7H4rZiS/vNT3urIYQQ8hkgetDmR+jP
         SKx9G8M4cRYrtGxHyXS68ClfFzY/XeTXmSkXIbowUmjOo/KgC1NM/ey9jyBpICuVttg0
         8PNEjGsVfRm2jw3qxHseSreuQ/v6FOzkuZqas3PjRCn6+KH6OJkiz7QhdyLziiMBZX44
         GhYddGKZ3eBGhkNl+pq3ie4H1s2tTo/k0ZAmRqxqyM24a8rnhOXuNt7tWc+JNbcqj6eS
         uMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998121; x=1746602921;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p7Pv/AQU5RzinQRXhOmBpGF3PncV2+ClGXaJ1wYs8w=;
        b=kkOauqyrc882QU8eDDKEAXQajgrUfNtQCR93CFuEumv67D7tHxd9IeOUmk2nPxPz0y
         miHRm4jyVGAMf0SM31A9CcOn4k8ZGvfBQKqA2MPjhhSQ7C3Uft8QyMLjPw3QrRwXz9t2
         f67TGGJ9V0kok4D1Sh7SAVkIYvilLq89lUN7Sp2/xrFzCB3Of2IEaqcW24eZ28ItPI9B
         UneCXPYwa2aNxDBIO4UoRHKJAYEy/U+J8fUDsfdRkL75W/J8c6TcZ+IgUnukQymi25/v
         FVL7X4wcKdhbkfMue5kwHAArfcIjImOQieQm26knJIEYEObT+OhII3ZFdq5nxzlYVX/b
         IYMw==
X-Forwarded-Encrypted: i=1; AJvYcCX7WcehF1e9BaVUSKQmmClVtAi2M697L1KyrpZT2xoCCElVwcinrbZQfmm9O/N7QQelimR2cEkBi7Fgew93sR1x@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt154MoQeP7JqjiqaEs04CiNrpWiFzpH1B1rNTc5PKMJiwZDxn
	scD3hNztanIJoBb+GqupU9biNkXjNB2ApcBYcH0iRuGe2JZfVM71+HG9oYe+ayk=
X-Gm-Gg: ASbGncsl9lcEMwh2L81U3Sm1Qh85pzoZPLz/KHnEBC4OZgG09jIrmBwFhjRPkWuuIH3
	AlX/JCg3zghGYIF3Bi9kUIXNVKs78wuqaMyh5FhgyokAncGTZJHRdRfaE7YRMJjrQFvDqlcA+Zo
	4K0XIisQQ+XswILRW4KK2WQ32P13I4NH6EFZCDUWwUXC0vOlR4eyE2rwjmUdlEklrETyXejCTtO
	YMpjctwo3LdEC+l7usJm1McmAtuFK7sl41ev/Xqm9ToWI4AtBFctSMG6xTjhiWHl32dWd9y9HjG
	a1VDJ/odmvZVbbl8juM48FY4xUmImt1hkNWQH0TcKVhM4nyXZ4YlUom8whE=
X-Google-Smtp-Source: AGHT+IGrVsof/wIDybs3QwM9wHFkyf2SoOTy/a2O4W4oYL7B1nHSN5cZorob92KX44pZ56YDgWr94w==
X-Received: by 2002:a05:600c:4f07:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-441b2df81d6mr3954545e9.6.1745998120821;
        Wed, 30 Apr 2025 00:28:40 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:40 -0700 (PDT)
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
In-Reply-To: <20250428113517.426987-3-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113555epcas2p2416815cf6a41e0004f56c0a26b7be5f4@epcas2p2.samsung.com>
 <20250428113517.426987-3-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 2/4] clk: samsung: exynosautov920: add
 cpucl1/2 clock support
Message-Id: <174599811943.45412.14873339958379580394.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_002842_582434_803EAF5F 
X-CRM114-Status: UNSURE (   9.63  )
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


On Mon, 28 Apr 2025 20:35:15 +0900, Shin Son wrote:
> Register compatible and cmu_info data to support clock CPUCL1/2
> (CPU Cluster 1 and CPU Cluster 2),
> these provide clock for CPUCL1/2_SWTICH/CLUSTER.
> 
> These clocks are required early during boot for the CPUs,
> so they are declared using CLK_OF_DECLARE instead of being registered
> through a platform driver.
> 
> [...]

Applied, thanks!

[2/4] clk: samsung: exynosautov920: add cpucl1/2 clock support
      https://git.kernel.org/krzk/linux/c/84d36f26d0314a089405af3df9e213dcfb8ecbc0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


