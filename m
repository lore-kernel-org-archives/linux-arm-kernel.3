Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37ECC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ELG0oVhA+BqzmcxJHQfLXvm4d36xTv4jodb57FoDL0=; b=ITHrmXbJ0nk8Sig/cKIA/rX1n5
	wr2yvFCelyu40M0Qlr57561OlYtKIbZuJuYrRQtRyVTvDTrWbM7xIFSQucXgkjFnlMpDM5964BSVB
	VCp9WqAziNY0Plb8e7zLI4K8kMcViWlAR6A7SFj4qsQKN5PabYEWiLpn4KuZ8Y6F4+6noSTIY5d0q
	1fZTjr9AxITF/Uufa7LVS2vfRAQP6Jj2PujO3ITYirHy+mrVka9/Lg8x72UK7yBGPYvziddHQxUh/
	VjZm2lfFDtC+56U3gG64MN8WgP2ZxhNCe50bggIxAdrnC45xbsEOuYCymYN505ouc7u29SiuZ+11V
	L9ermzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZGp-0000000EXtr-2foZ;
	Fri, 07 Mar 2025 15:05:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZFB-0000000EXYW-28W7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:04:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso120468f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 07:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741359848; x=1741964648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ELG0oVhA+BqzmcxJHQfLXvm4d36xTv4jodb57FoDL0=;
        b=cmyP8EKi8kiz63nEJE7RIVV/mk8JwQHh1TkKAw/Sfbw2lbB9oAMEfHsjCxEEAmptF7
         TZ5oeYN+89u+sKL60nCrWEjjRWMTtGoHWEp43HMwWjaptbgG+DQxfi+LK8Z2HcMXHoEz
         iTS8BySTK5KaO45JKzwMK/yjsAgfQDqRHik7kVECT/JqHcAwPaUGYnkkPRX5zr+arzgT
         oeFbC2x1ax48P4hZbkAod0IpLAsNBjAlIbyYO90EEHMvOaeYg5H3U1jICK6BB/rI71mE
         5kErUXqRSBcDLk5CCaNCnyNr3FdR0cyA8frRRlyyTDjnp+XMpFAzGC/4wwAB68RsXAZA
         tjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741359848; x=1741964648;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ELG0oVhA+BqzmcxJHQfLXvm4d36xTv4jodb57FoDL0=;
        b=mEngiMHBJWx4HHR5JuFqb1fQeBmdJQuiMzRMqpQffymAteDodWqDGfdBYG9eyjV529
         YUnkB3dPW0+K4rlm/Dz33zR5+3SzlqpCiD/vvYIHlARNaeGT2v8A8VLuEodZG3c02WWh
         gLIgXWGr2zURO6MAcmVbo6lql9mY8XoZsU35hjVygPToI4BAbUBBmfwhJKEJOLoleA1j
         QaArp2y7+tDBxNW9zv3yZHoLC1C3jv37PInM4OAfSH7NX1Jf1VDJjYq9FiBpFVbEaeTO
         X9fzoVFeaEaFXBBg7IN58bgCbFwHt+1pcSD+GPhQWKgsHvXjs6VVvzW2Ipyx1iPI8heP
         qcPw==
X-Forwarded-Encrypted: i=1; AJvYcCVuLEBVIbHeQEXnaQoE0UsDAI+K9wRRa0nQGSLEIG7JtGrCeO8q4O5DtPi4w+UcmEEyVxzNUGrzxtTpwsgOxfW+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+bnU6nhALM1fTeVG7JzKT+h15svR972FBTpSUEhC4gZBSddAP
	9NsBN3qRL6j3LRKCqRGNwOH3eCKT/EPDKzaABLNnOrqgHnVFJzp545Bz9vSEqQA=
X-Gm-Gg: ASbGncursx54Avewa0Hp6r1FzkstVmIxljQDKF2eSCgHv+PcvDWslf/EnCOPeHm+8tz
	GbLTkRJZkvUYz815bFO6t1w/knOX+Ji44BHh0PJgI+GS8blDj2EONw0rSFGolTznCBw/t2s5U1u
	0jZhgzYt7RCRLEbDxBvxOn4Ap40lM3YFrzrmiydqUlLHi/p4M5p3qjhhqeUYFV8N+IASBDsnCKD
	Bkle6h95VptatYghDjoD0hjW2D8JJS3ygemLpsbBDUcaXohvLkHZdQMGisdQmk93xXgtADnMMpk
	Joz66zP7DSd/cGAO/ch+qfolLaDkjP7i/JuWUujj09GtPQuWpTuKbhzJacyh
X-Google-Smtp-Source: AGHT+IGeiraKGeEqa9VGhWaeeNF9N+Kf66ORaln0VM6PqpULNSWjc+LqFVea7mhvmFHlhfc4guuJvQ==
X-Received: by 2002:a5d:584b:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-3913a8aeefbmr51698f8f.11.1741359847652;
        Fri, 07 Mar 2025 07:04:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfa52sm5444573f8f.21.2025.03.07.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:04:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
Subject: Re: [PATCH v2 0/2] clk: samsung: Two header cleanups
Message-Id: <174135984582.202251.7619477733984588971.b4-ty@linaro.org>
Date: Fri, 07 Mar 2025 16:04:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_070409_556308_1430BE87 
X-CRM114-Status: UNSURE (   8.49  )
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


On Wed, 05 Mar 2025 21:03:42 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - mod_devicetable.h: also clk.c, clk.h, clk-exynos4.c,
>   clk-exynos5-subcmu.c, clk-exynos2200.c and clk-exynos7870.c (Tudor)
> - cleanup: clk-exynos2200.c and clk-exynos7870.c (Tudor)
> - Rb tags
> - Link to v1: https://lore.kernel.org/r/20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: Add missing mod_devicetable.h header
      https://git.kernel.org/krzk/linux/c/f32f5b0ec0f6eec0186de0607ab12f9cb1ecab73
[2/2] clk: samsung: Drop unused clk.h and of.h headers
      https://git.kernel.org/krzk/linux/c/017bbc922a09630579ff7b5b314fb186b8c0efcf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


