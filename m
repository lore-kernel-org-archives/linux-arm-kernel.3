Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B55CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndD6GFhIDsyYEQSTuUmCfWcKYqCeLVrqI/SLqnCg8Xg=; b=YaIZQJ3b6xlj4zVnTXf8nhsVK+
	hgCYTeAt3S4qBBGKuOJBzzEMhi/pK1FVH7Kk4q4/wP4qXRY+wpEOYag01HMMMc5Agg5n06Fj0EWc0
	RvOgdFIvOvWHJ+Tjxu5qDyXUC65YZJN1IiQliHnRLhFCO4qWaVXW7daWAIPhZ2Et9bdQ4ceXZSHPA
	05KwWrWVNzrwCKjdMr6C197KBgMDLdTwnanumOzrEcOYtv0AYHHjORHt16xHA8CxUtTy0pcHqgPTg
	a2nZ8dGO2+USx1mgj3taVDbTf+GzU0M2rTau3zv+gJb+6bhygKi0/PHUvKjMetyo4nwT2p/OtXvSH
	0vTTEpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTuq-0000000BQuJ-0HV1;
	Mon, 24 Nov 2025 10:35:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTun-0000000BQtj-2FyB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:35:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso25086245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 02:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763980522; x=1764585322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndD6GFhIDsyYEQSTuUmCfWcKYqCeLVrqI/SLqnCg8Xg=;
        b=SMqC2Z3edLX3lMCi1mBkdA4fTAg9Egtci8WdjF3r2GHlL9//VMJL36W96f20ybRwm7
         8rdQvfoD+2kXBFuqn8baF6h1oiUh2hqYxToJximvDClAMk9QbNvzSJUiwm+wbVWBrRIe
         NxdoxH0zmTc2NqU/bUfUcuNgoxn1/jtrmdIGfxKscSAeTjo2ZKStxhMmX8Y57MJLM9VJ
         wVCLmpupyuznF8X36Z2aAicaaQ88x4emXYKDTYdKdKtBvNrwO4+ojUxtBrn7wkek7wGS
         UyZ6jKxbSvDP6I1sRkSokLHujVHrrqs8bhmEIOysn5ej0kjKcsigcfAVZD15tTJDLNnz
         gHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980522; x=1764585322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndD6GFhIDsyYEQSTuUmCfWcKYqCeLVrqI/SLqnCg8Xg=;
        b=RiN52cmYSmh+3A8svN/nOLaXvbZNX0WR1HKmJOee2xo62V4TrY31vGUIx5TpzI/W7k
         +ETP7PXAZguA1AfeoUsIf3THrjC/A1teY9wiXVamyYkL705Feyon6XeiRDAp+AxfQci2
         44WeQ3FL1FRzmjiAnu3w3O81bxkfblrZw2cJ90cP6YKwAJw7Yb6SA0zeGUfvpygLpv4B
         n87k991dGcfJ+c7Ptyd4kPww+aGDZB/SQwci7JzIPv1P24TQJRCSsxkHQ22tlaf4/Aya
         nk2EZ6EkAJU+t8cu7C2r/bmKnYK16vu4Vc4NRa+66L/3TWXsyu6VzC0Q3XGklsIISu06
         Feow==
X-Forwarded-Encrypted: i=1; AJvYcCXI4I8fbOTaNeoV1P1blHPC5G3DLkdabzNwtEdRSsn2+yU03nHdc+6CWSiZVWOpMXP/GBDW11/HHc40uISJHwww@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0VjtiqtCpW819a5hGUFEPYujdtm48BLYCYezJ9lny28bo508t
	pygp91qxqt/E/p6akrxFZus15lPVfyCJcpN7U0qjB6PTQZgZe5kRijZNS8o2piMOJXI=
X-Gm-Gg: ASbGncs3Jm0ZrWpt5jRB/TpyzZ28cRcRhCVyJPq01zF0cSr+eyOfPPHyImtKoFmRmpY
	Ms56soaZe5br1ohprPt0KlA5E+/BHfD/2bYSxjVADsE/g1BWBY4k6U8RQKFrHLsirJmZJRB8BW3
	crZQ69DKEMJxgoYzeiBXJbcC65Uv7XDm788G319FvyUhX6ba6CJsbaz4phJUgBg4GJbQirZD1Kx
	mErkNFtebhH+XLX3IICLBTU14G6ZLLPewh0Ed3GoP7I04sP7kc0noYao38Dv3GJBL76a3lglYCd
	hSysMQ48cmowrc06N2hZ5e3P/kKqSCdkB27R1TuivuMtBCNvBFkwKGFNH0NtBHWyD6r4+TBWSpx
	mD3xRFaugWo285oGcKlgkfAxwsiEnmuaQA9ubPW93gQ/V7AWsMGrb+E71x1UxBWKvX+ixGWelR4
	pNaeu9bcrbT0506EIaC+EUk5NvkbWl3sXECp43CPyKjCcCs0ujIUaMebFMVA6EM9pM0g==
X-Google-Smtp-Source: AGHT+IElNEZ5h3JUQ/4nKEFrG2nnJ9W9xdmqEYug4voX9K+dF3FjdDILyhWbdWr6Fd3WQPE4haywCg==
X-Received: by 2002:a05:600c:3511:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-477c112f7b1mr105073885e9.29.1763980522164;
        Mon, 24 Nov 2025 02:35:22 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:a756:bb6c:7b35:af9b? ([2a05:6e02:1041:c10:a756:bb6c:7b35:af9b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf1df3d5sm188767955e9.2.2025.11.24.02.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:35:21 -0800 (PST)
Message-ID: <ab35c20e-390c-4479-9bb1-9f5e49cba2a0@linaro.org>
Date: Mon, 24 Nov 2025 11:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>,
 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>, 'Zhang Rui'
 <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
 <2180a854-8ba6-4424-add2-eb34637530c1@linaro.org>
 <000001dc5d2a$0697bf10$13c73d30$@samsung.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <000001dc5d2a$0697bf10$13c73d30$@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_023525_594913_C71B2F49 
X-CRM114-Status: UNSURE (   7.44  )
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

On 11/24/25 11:06, 손신 wrote:

[ ... ]

> However, since ExynosAutov920 diverges significantly from the existing driver,
> Would introducing a separate driver instead of unifying everything be acceptable?

So this driver is one controller for multiple sensors while the others 
drivers are one controller for one sensor, right ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

