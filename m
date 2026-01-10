Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220A0D277EB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=; b=RHTUFQxODk8t4P6MiGDQAeBMub
	PnNbKp6SYLDhSqxkoOJOwySZKzZv6W9GgLj4EkSsNwSlrddkbPXyQg7NuS7FETZ1quQW/U1OycWsW
	4elDoVc+SsJJSDDpeDWKhJ/+05ICGsoyL332W0wEJ7//rcumDtFxWe6BWb8kVNpSjkJzg26gY3vwC
	UkylR72ahJg4Zh/cCaerNqIFdx3VKynQypL8CTB5j47UMwFiFDVqcLFnllgf9mj0XPl8sauq9DBgL
	UmBeIMITnKcbMkpclVva86j0itvwp602Gs/ONkQLiV9j5j6p6o1S2hpM2OwGv7XAq2U+hKI7J/CAZ
	8lqi/n3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veaH4-00000003VDy-0mgX;
	Sat, 10 Jan 2026 14:49:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veaH1-00000003VDd-1fLz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 14:49:04 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so2851815f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 06:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768056540; x=1768661340; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=csV5ibzlU4bbJqo5eFcUFMwiTZZZHzxDtiLLn/KVn25vhl0BBQlH7RpQSM4dRnGbBf
         QRhZNHy+XcNyfcTFKOeYCnzbEoypPL0bVoy5Uj2MUBBwu9oKRRCEfPGVuNJmAUII8aqz
         SDw3NB5j1J+3x9NPuBeifnBBVhJRdFdRmYH38ebajgJKTDg902YtqDFjmhEDxbZUHiea
         hQBdiw3bXT6WpUApWjDGWthSctnww2ogEb0wgwcN8tRiKRZ8UH5Q9sjiuVJGejSOGpZZ
         6MOHRQrsiecn6MvKr0WYjKjEgg1ZV/DgPVvSUlYETKPYhX9wdSlCVHUZhKxw9L+sSgh9
         iBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768056540; x=1768661340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=l//IvdWtK7HqtOVY8o/J4/OJx5SBuiubvLWJis8meAA1SS/CILLXudjmvlbpki2mdp
         I1UbPIEzywab1BrlG5RkbVtz3hwLROZYkauhPk3mzlqEaqKghBtTX9hn6LQznI5L7rZ/
         qWr2lQ0OLS5nKS9TUPdO7NpieQaaK23SFc5vr/iJenxgw5NwLe8A/fvRSuOxueyIKDwl
         Ts5Q5VEHjFpHnpljtPcdqAMEWDto44Q/Q+9k04uxRoxSgjOY4W+HC5agiPIn6JQLw7cw
         LE7tn4PA7euQFrxCREN8lDdoyrklpsHqlMGuj/kEAi7NurEDyQoJNNac1fsZkSMKtSbe
         3PgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQmmQCHgm2qjTaZVi2TU46ggB1mQM4G973SngEVbnLUXDYLGQ4XDSRblCYMPL40o0Uwe3T8wWCYaEX10tTSVT6@lists.infradead.org
X-Gm-Message-State: AOJu0YzHONNj6m+n75p8udXUbATsi9aqV8WA3xlvVjqnRDWbHz7m1E0o
	Ed8DZ1tWTBIk8zyVKnBjP4BufMNnn3kyiirx/PqBrdsShmsefgVlsQT5vDNfqxvpsnQ=
X-Gm-Gg: AY/fxX6ZXuYqiX9IpmluiCEz4qfrGCJJhBkojggmxyoYvGQ1PXrfv3qr0xvVIKN/a3M
	R6dh+wlgCsmaxTyrYidcwpAA++esA/ykAdLmEq3gZZ8XD8SD+EPlJ/phutQv+59OMc1Xb4CNcv2
	NGzp5wf6zsJCEYSymv6dHLx1BLkp+cFaMP/qJDmqrwSkYB4m9eKJul+3k4iPFho4QE2Kb9RtOdL
	dUbGAGbVXalR3gdif83Pi62iqEsFvCIN2P2GpyFFEiGOBwCeEQSokpbsq9zOWn/0KmU018XYyLb
	6YPSbPfkBSkLMcz2nerqUOQhZbm0I+xIAPLXdGeJw+EaMFsee1O5nSc2Q5Mvd7yxIhRH1l6qBjK
	gZ25I9PmsZvbRDHCOcjkXLUQUXJK7G/fN85Kezm89DJ/M8g+27pKoMJK0GRywWvuX+okQcfdhVM
	ok8pS/qh87g3R9WiALAGVEdhTIOn2m
X-Google-Smtp-Source: AGHT+IExDiyl6+cMqnLU0OScR46v/DhXxaFlI7KfbIz5c0gjBYd8wiO/Eo5iH1Cn00OMlkpwekH3Hg==
X-Received: by 2002:adf:f54f:0:b0:432:e00b:866f with SMTP id ffacd0b85a97d-432e00b8b14mr2891143f8f.60.1768056540373;
        Sat, 10 Jan 2026 06:49:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm27764794f8f.4.2026.01.10.06.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 06:48:59 -0800 (PST)
Message-ID: <b0dec3fb-51df-4bcd-ba13-c2049695266e@tuxon.dev>
Date: Sat, 10 Jan 2026 16:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_064903_570166_3BE193BC 
X-CRM114-Status: UNSURE (   7.89  )
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



On 1/5/26 15:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

