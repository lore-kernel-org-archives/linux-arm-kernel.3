Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DE4CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=; b=b6CKR5xZ95ll2DLRyfUPw9DcDi
	pjVw+4umzjUPdCYfpPRnGq59THr7hROIPixeo+dVsMEUG5lud6R7Ek4C0q8vF7YoB8VMioajdvvfW
	ea55pEgzZk/aeJNPSed7hCj7E3rOyROskbz/Wwba2x/kmG4+eZ/H5XBCok2VsegZtJ3oI7YhFmtJN
	WydBUGSqcj7J9xRY1WiaSDp4evCS4s/04FCjdSvIfSsOO5wvbZ9TvhK68mhVVdwBjx5zxzdBWTES0
	Bf7kR+UlCmAmP8eMNqknKCs+Uad7EACqNlIdlGP7I8bUtY8OZbV7X/GE7F/w3rl70I6cKwJ0BEvE1
	x50GgbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPjy-00000005GLi-1LAg;
	Mon, 10 Nov 2025 11:07:18 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPjv-00000005GKg-1njE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:07:16 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso2343144b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772834; x=1763377634; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=LuM/6Bhq3oXpzEHMsJIXBFfmvMrzFVt5IE5raNtXUwzT9FpT2gSOg2xhVPkPbNda/k
         goahtRBjKAUO+lqtHds2prf/OmWWuNjRMfu9VjVG06x4/X5suQj8+NfadBeDRwgbEHMO
         8a4zSd09c4gu6hu6f4Osi2arnNGFQ2vUveLosgw5ZghmCLE7yzXSIvt/LYO0OQUnaAa9
         sm6YaoNhl/nKeAgzgJl7o4CCtzg/0Bg4r17YtyFxhj8wBZ8tNfT6SvjoMBRqiWrvIrNY
         yTP/udV7K0DB39MlFBdmsfD6x3IwCFw3WJp28Gxy2hif8d065NVfuonrdwskUVxp9XqH
         Ir1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772834; x=1763377634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=b1ZfObgeS5Viy49Mp/krHQtWO3W0L6wYvl8CCiOVYrM8mGwpsBN//s7di58CiTQsvn
         bzWGJ1bKtQWhZ6Na7jIMIzwheGaSCvC6y0YlVyGVKv2AG1OniXA6sjrddBTe9S6bAUGI
         rYPUpdTfZ+N/KdB0QWyjY32Arui7JTEVVPsNn3oEINcI5knr5BIm9Jc5yf8G5lMcvN/V
         OXncXs+lJYozejtwtt2G5qy4AaXemNkGpioHk8ej5jOFyKNOkxQaDGTlU3dapZ1eE/y8
         VvrCXpRYXPOum2XjBxlrpyb/S4Ws4L0dKPcil/FfsGDmsk/TyZ8Cp+NoeYW+G8YO2Z5y
         x1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe2+wn5WLMN3/Zdp4z14TzHpsoaZBqWI2vfL392T3Itx2mSY+TFQY0cT5+E+a4oQQPoXDjTywkLz0FL2PxToVt@lists.infradead.org
X-Gm-Message-State: AOJu0YxTHMNv0BOQ4jjjcTK71zYXjcBTGPN9AeNlw+EjsD77YxqgogR0
	Vqharz93Lb/2GQpbEr8Q6Nqiuk0H0oP2hth7MLm0LWkd5mKeliIQMrm5YGeeNAYBwPs=
X-Gm-Gg: ASbGncumGUhW+eTvbXAyktCULK/56yRN0k8ItExR9N1II3Orz7ag3CXZ3FggxUOoY0j
	Hpf33GW8ft68/rSjkRdQJjuzjuxBzuM7ClW0H79YgffZycHGTkgczBuO+Cs340YxK2VUvWlHPpw
	w3IRCKxIfojX52ar2MTAFeg7WIJ23tU8xIudHUdBpI89nXOqOCsyqFdqM3w4gCYfQ4NxKphJnkc
	erCO2ppLiQwY0YEvV11QcCD0WKLlkhkEqdRJDjfTqnkp/DrMCcOlGUqqEnE38oGPuTAOXGNTeWB
	UkCmOTuKeh3l3/EcLQyq+/qr4R3sKIGL/KwzusqETsVN/PoZ9tbn7rJY1D5IvG87IH9B2LQT3we
	z3SFu3WaRsDHQdrz22Z3CLOB+zICmDIeApbcEOzJwxg5JW/RQhNWlevlkWT/6fcZU+hngWUxi2n
	aLBwotqGyOf+k=
X-Google-Smtp-Source: AGHT+IEEBmMVZO0k0MIdHGG3oOt1wzE07GZr0Rosgte3T2/mK8NYjyyq/dXAAAQzolcEZu8MEC+rkQ==
X-Received: by 2002:a05:6a20:12c1:b0:350:d523:80a4 with SMTP id adf61e73a8af0-353a314ff11mr11044525637.28.1762772834004;
        Mon, 10 Nov 2025 03:07:14 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953cf79sm11625705b3a.3.2025.11.10.03.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:13 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:11 +0530
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
Subject: Re: [PATCH 02/13] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Message-ID: <qg6xxh3vwbfnl3z6otlr2bue2paig7w3agbpbauuzmppiof3q5@e4xjlcfu43cw>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_030715_460231_AA5087C9 
X-CRM114-Status: GOOD (  10.38  )
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
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

