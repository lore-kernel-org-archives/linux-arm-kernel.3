Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8011ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=; b=TMI1HM2l+y4b1KSx6rUF+ISpsE
	IynXEEWsnz/drK27UHBSshOtHDyb8MRC8PI4+uIAGMGeDSXxcHT/D98cYHg3gsXKkByvWUEIo5PL2
	oLg8BocKFaPZjP2eyyjxcNLwstdyS07qZyMpZsWhILrPbWpMRytkXQ6wEpFc1d6TWArTVJQL9Ya8f
	DzrmD81sxiqG7GRkST30ttYe3qsh1vdLnBagVAiuFnaCPBgGqM4QHLhZEjX04a2sVAPK5I3CAIygB
	hcQhY69k8rImINrIetmqziulq2E8ns0l1etrMtxbSpVo3pWSYnnK26abSSGyaOIL7ZO7daRzhw3XF
	YuTTHcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPkB-00000005GPE-3gOY;
	Mon, 10 Nov 2025 11:07:31 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPk9-00000005GNw-1Cp2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:07:30 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7afc154e411so1642347b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772848; x=1763377648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=mFcsEQNGaLNFD6AVPADkmXqXXDFl1Sn136+owGpMOxly+kSWs49TN4HcM/KwWFD4FG
         QJbpkoUmqofLn7EjIy5ytVRe9+6MzxZ+ZPCrTGAEjJ+T8E/JVD9OqQyeKT/0H9n+YAq2
         T4oYrOARnMqDDF1MnoWPzBaoC1vRJFGGAyx6YN1hfeJF+i7cMDxyyYDxdzrwpU4WLC1m
         3Vtu/crHGwAxL0TsfCjqfsdNcW2wuBlF7Ek9yvRUn8R0HmqowpjHWj68Zotdi4f/+k2N
         YGNtiPQDA788XrhfK3z61Vb/FDHLIgRb3zLCJptH9/6lrbXWLti85h8G4FWUV/ry9nyA
         usDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772848; x=1763377648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=NYeOlOCnxjPPoZxFLKf2pscoCroQZ5tKRGWLSrIbAEadDh6BMyoRASy4VDlywbsTsA
         ub7Scj1DxMMkfIu+bImwCZhCz/HY99gdez1kDCIHSr5ZEOhwSLIVCJvfKhEf2Q+D9GlM
         gUS0qimC7Uj6q8LZqkCtSpveMXWPgk1GLDYnqPgKpLZmNCcsbuaj7AXX3af+RXjUxDls
         lESzFQLu6UBA4wUeGGYejarFHp8lS9I8FJojvUAn7DZuccPjphlArp3+4kx9rbaKquD9
         hb+jOIg7CSNjnUetWCqbTCgtbRhLYprH9JjhI4k/PvT6BexkWRwvjb+EWDYwr5eiDoGj
         a8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCU7ducUXZhzCVufQV7ao8yCn2+/LgICoFJCdpQstq+hN98VUSXjpjUi/ZjlF5hF+t6AhXfD4tcES5kRQLixcpzk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2tBDJerifzbPwovCHDEDdJt6iKT+FfUS8daXbTbdkYibs3Jsl
	UbH1ZgZUO9tkLz9fID7IgD9CpDDD8LyRdhXM8TKIpOllYkaOEp7/YhYyvuyAqCy0b/4=
X-Gm-Gg: ASbGncupglSAAkswpXzIXyT0t4Xy+cTFbxFj8EKb5u4MvBcPmd2KduHh9457JRDgQec
	GEB92BEBZDwqMzBBgnwtifqxBBAcSJo5PaChpENzX8YfvaHNqlcYV7baW5dLM4marCu6iEF5g0A
	9cqiEcSQfChE/1N6HeEBIeypQ5jjonRIPSTnww43aFsrsaD/CVU3ENVnnHHWiLooxDx4hJ0rGZl
	+D4qfbRv7M3LrOjOjbuhNhowiEZTbvniSAdd2q2L4hmG+B/mH0XAaPkp/9P+yNt1yXYcJ7GIyD8
	DFG4oQkrsL2joi4TLGs7tWQQEE4HYP9z2D32JINdEaWP5K2juqboN9SOEyfYBV09rYuDSK3A/iT
	2jrj1BAJD8DZ1b2KXlKNEB1zFd56w/c2dsT8XbGw4Mv+IS3WX37NPwRy2/doLi76BdLHLPLfPGJ
	P6
X-Google-Smtp-Source: AGHT+IFLmvoREqyCOsxdVYWioPfB8QTyekqamyvK/6SevugbTh8+Sr7Hzt8HMarNXUtUBmALUpoibA==
X-Received: by 2002:a17:903:46c5:b0:295:fbc7:d282 with SMTP id d9443c01a7336-297e566886emr96785235ad.27.1762772847847;
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c8ef47sm143941675ad.74.2025.11.10.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/13] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
Message-ID: <elghyjazfcsbwh4tmyfgfrbstfgpijgmlfu5kytbg7yvjtx2rf@v3riwtqr4itv>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_030729_331898_E2851604 
X-CRM114-Status: UNSURE (   9.77  )
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

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

