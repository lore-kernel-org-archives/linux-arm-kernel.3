Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9DFD13578
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 19:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27FjbLkvpsH6g9Edehxh385tMv9CQXY+0f2sWNF8DhE=; b=cech+DkWYW2oE76b7Vu2a9HRGV
	SkGaZmWjmzSAT7qMOhm4hEn9Tg/OMD0El2hpiTIcNFY9GM9WTzUBk3LCSWBYwW0RdUATWPqNJ3xSW
	pIE2D9Yi0vtJhRPAtAUlM0h9+6EWGEA1w4avNdrgLR5OL3OuX5bzfO7YslLjLeatF44rk4cdnx1Lf
	CWif/3ashtlKRzUWimU4U4RVgHan/KIpZ5VE39vJQmuuEskWUoiXoROhWzta0mHWJeOfDlP5053K5
	mr6N2GJV2P7fl6/yYR5qMT2fZ9BVW2nPjBXYQYle3UCa8DmCRM/6c+t6S4lNwR6l+NPvL79b/Uf3S
	/bAOU6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59O3-00000008mAV-3XAw;
	Sun, 27 Oct 2024 19:57:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59MT-00000008m1M-0MuC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 19:55:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315549c4d5so4251875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 12:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730058939; x=1730663739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27FjbLkvpsH6g9Edehxh385tMv9CQXY+0f2sWNF8DhE=;
        b=dFN3GTojxKydQYO7HNrlYsTA9DN2y7qcwf0TwM8/l2Mfa4Wy9YeptfdFkzvbh3JKBf
         Ow7dXh2PDGrfJOFr4RJKjycdFOysX3MLVg2TpOD3KaMr6LsxSgOgh6a6ux3sJNklGDkx
         LTO2jCd+WnbbPYAleAXWSFZoR0Oig99PiPLlBzoTkei15fDblrVlqm4gICKlukHcFc1n
         IsmZ32aK2Qp7et6tcM550FoxkS9eO/Qo6BgwTtlmLtrExUrKQGVusEZ8WAMwtHIEK+R1
         RVEBbfYq4KTFuRDyjemyPPCNjl79LbJ9wIb+qKUSVtZO9/Ao6vQDvMzishLQ9Tc8bGh0
         Mr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730058939; x=1730663739;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27FjbLkvpsH6g9Edehxh385tMv9CQXY+0f2sWNF8DhE=;
        b=dNK2yfNhlUfFheof5r2cZEcyey25L/cKbSY5Z6+6A8jXJVz11D+lK164T/9a/6wcQC
         yaOFC/BP4VlrfhrjlwLhbNupVdLqpbPN2RkR4gyy/KPHbtYfGutcTaJenBU2A6xETb0P
         crFlwjACAX9CX4lqcynFG3xm7zbYu2s66/cfiSPX2yjkF7lZ1+hw0vm8ZEpM2wNfLuFM
         B5QSR0w/cTQXuiLP17RFyKhUk4KOcFCCoWdxVHVIbWpZSyJvkntOKD9ejdkiVVYfRlGS
         zEfF13BxC4O6I/arnG43wSBkMpoR3jiodnV4wpiBa5y7T22acohC0BpQCXw/kHEof8pD
         1F/g==
X-Forwarded-Encrypted: i=1; AJvYcCX3tMsv7GqJa8xnM+3zgiMr5k6ddjl/DkWykSs+wvzovj2SBwLD/izdONeYwwAKZE1Buj9N7iFytURVjqq82pXo@lists.infradead.org
X-Gm-Message-State: AOJu0YzYgIWpPj8r6J4P4S5U1+6IiP/pUzGs0pz8X+whRyZEixitQI2K
	3SXvj9A+5G4KfHVgj85e7Er94q1xFfBI7nfU2MjpaGTh6+uIw4uffw4oFCM5Veo=
X-Google-Smtp-Source: AGHT+IEYf9GlikS+9SRXkW34PJ/4J9ZywFzKp4RfuuNjQIqBExM3fQopO3FwUg5OJt8GXxV7i8FZgw==
X-Received: by 2002:a05:600c:1d1f:b0:42c:df54:18f6 with SMTP id 5b1f17b1804b1-4319aca7abdmr19494075e9.3.1730058938975;
        Sun, 27 Oct 2024 12:55:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431934be328sm85548215e9.0.2024.10.27.12.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 12:55:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241026-exynos9810-v3-2-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-2-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 02/10] dt-bindings: hwinfo:
 samsung,exynos-chipid: Add Samsung exynos9810 compatible
Message-Id: <173005893509.10219.7382293678249920610.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 20:55:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_125541_196802_9362C37E 
X-CRM114-Status: UNSURE (   8.69  )
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


On Sat, 26 Oct 2024 23:32:33 +0300, Markuss Broks wrote:
> Add the compatible for Samsung Exynos9810 chipid to schema.
> Exynos9810 is a flagship mobile SoC released in 2018 and used in
> various Samsung devices, including Samsung Galaxy S9 (SM-G960F),
> S9 Plus (SM-G965F), and Note 9 (SM-N960F).
> 
> 

Applied, thanks!

[02/10] dt-bindings: hwinfo: samsung,exynos-chipid: Add Samsung exynos9810 compatible
        https://git.kernel.org/krzk/linux/c/18910d6b16bb4e71ee5aea5986a6577f347d69ec

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


