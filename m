Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DF6C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/7bb++1x3K8R82/vHvBTybNECeoo2FfhBX5a5/oxy4=; b=zd9sMdFUbPW1FJOQYHkoK/zZqE
	9T+VikvdquozgAdVOd6fqRzmYXW4MnreLviEWyAEi9hc5S616T8tOUeMCZZD7RulHGPakVphUL6z1
	8L1qymBFeVy/2kg96SZF7sewfUGq5dMjDoX22apsVrdOwKfdF9BjsHaPdd0qYBgS7YXaso1hCVRow
	WcCILZHTaN3zWgcLCab1sLi4FstDvYGp+IpHtWcLwfcjqJ2AWoaXeuh2rNHbfiv4JH/Os0K+KRbVu
	iZ6+HOZLejJr844lTyOYkfxq0twW95mLdtwBh/ISZWa8E+X1qj/rtGdFniRfx5R05ffLS5hqyf/mI
	4Zt+Ml2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvfa-00000009GW5-2Tsw;
	Wed, 05 Mar 2025 20:48:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu45-000000091RD-2d6e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:05:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394944f161so8748525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201556; x=1741806356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/7bb++1x3K8R82/vHvBTybNECeoo2FfhBX5a5/oxy4=;
        b=icGYDsBSIm8ohdKDYwEQoipgNTGrRaYyT8ep34Gukxco7Xxzz/WDxjepLiQaRtyvu3
         X3D76KYEVoHuKHWTNBraP6Oq7BKcy/K9o8CHMQ5AWxyQzKfJJjodFXq2Xo/Gffl+ZT2V
         STF5cZ27wp8lf/U7jyvN2kAe+memqNYD5iZMDNUPZRipfdjkXghEFHSA8ZBwKmzL0yVr
         ggdXQjmir6upQvN6OV9pMXzKmyLh/rPYzKAPVp3csaDk3l8hkWSRAe8ns5oU6NnX9lB5
         mOmWpIZ0eeq8sp22DNbB7FHrWiVr37xqPDXPcRXs7lpJSiBR099q6tBJkvaPGzfl1BKt
         Ln/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201556; x=1741806356;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/7bb++1x3K8R82/vHvBTybNECeoo2FfhBX5a5/oxy4=;
        b=t3cKMk9X/PJblIaBIf+u9MaJ7Zz+YBKl3W74p25LFYK1ZhPwyXMjds5P2T36c1EQLB
         YksNIzspZ/A1q2PDE63TqBzJVmJ8N5kZs54vmC1AA1gJiKFzATlECWSHabZ8LbEqDaQ6
         bCXpO7aGhNyU7G1NRjQNoxzvT/luTZps4Z6YvB7s+qTq7cIx/Bi0EudieojPiLJoTJy0
         nol+f95BCmdRLR3s1esdUgHdJEjXB8W6ch+SeJ6B0YSNHC2qbgchTP4Hf9SRpqbu8dr6
         XVF9OHBvnT15tl6WR+zH2DZtJ+3901WTfSmS1Kxm9k+SBe8U4B0IXJIrazwVyIJNEZ+i
         KuVA==
X-Forwarded-Encrypted: i=1; AJvYcCUfstwdajN8lazwK/N5eOzfgxgeRFm/cQniIzYC4R343AKN/8gH3zvABUtzeZPGGV4TnOXMx139XnbCVZge/QH/@lists.infradead.org
X-Gm-Message-State: AOJu0YwvPURFN2AvJ9FOR5TssMuOggfVE7nr9wAUTm3KPy1UoAkcOD4+
	q3Kq4eNg5hNE1QIOB0H5novyOkz7KLWmF5pFsm27cpzT5JzS5IdB2iuTs8FwoRY=
X-Gm-Gg: ASbGnctwuBfN10U3INnAUpx6M32Kb4ojvzyuO1EnuWgoFpHB+l1Fr8jcn8rG2QqoZCF
	QGprp1RWJgtnuuGEw2nHIa3oJeuIbT/Q/q8mZg4ra7BUMdT52q03D8XbFqj7wS/aSlKB8DUqJIl
	5iCpyUaq+zUSt5n9aC64tGslPw3QgpwHsBiX5MuAelMUlOgLCzNOkpL/AYYj3qejnkXKsu/Rdgs
	AO93b8NNWLLE/CdKpa46QsGXffBkcoUnQquoaqdq3gA9cHbUrNYcsN6r3BpA/U+tpDKqXFRSajQ
	t6WLj6IR+HxVu7w+c5tFOKvW38NwRUP2WC8U4uTXJP+a2w+xLArQOAdcP28b
X-Google-Smtp-Source: AGHT+IG2bHpjMm5lR3ttmKg8e6SD4XfgjQ/Sq+OZGDiXmqknlKp3DfcVARj9uD/iCvt9N4GVLWP9Hg==
X-Received: by 2002:a5d:59a4:0:b0:390:d8ec:1779 with SMTP id ffacd0b85a97d-3911f7bedf1mr1576634f8f.12.1741201556285;
        Wed, 05 Mar 2025 11:05:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47965e8sm21491662f8f.1.2025.03.05.11.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:05:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250301-exynos7870-v4-3-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
 <20250301-exynos7870-v4-3-2925537f9b2a@disroot.org>
Subject: Re: (subset) [PATCH v4 3/7] soc: samsung: exynos-chipid: add
 support for exynos7870
Message-Id: <174120155205.74217.13161571019009381202.b4-ty@linaro.org>
Date: Wed, 05 Mar 2025 20:05:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_110557_666986_4509C352 
X-CRM114-Status: UNSURE (   7.54  )
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


On Sat, 01 Mar 2025 01:16:51 +0530, Kaustabh Chakraborty wrote:
> Add the product ID of Exynos7870 (S5E7870) to the existing list.
> 
> 

Applied, thanks!

[3/7] soc: samsung: exynos-chipid: add support for exynos7870
      https://git.kernel.org/krzk/linux/c/13a24175005fad410464bee482ed58af144ba250

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


