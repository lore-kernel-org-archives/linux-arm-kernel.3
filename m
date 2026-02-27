Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E958FD530D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRbyV6rB0ACPTuZRlxL65vpkYib9H0d5lAlAjAED1c4=; b=RTJ6kgUILqG9Li2bkMFqdpEYfs
	dWdPq37UNEcwpyLjUwYqFB0BW+Ebr3m3J99zA6Ciep3kKoN6Bew1QPOG9S6caYEpsPVa7qCX4BIEl
	cqFAfsi1FbClyR/jmar6Dhd0UM4fHL1I3+WOZGP9RV+ddeHLxhXt85ncoUi1h38YANE5BstQQkV/w
	nWSKqurQULwzqALc/czD43GdwiR7XaaKUnBpj+DBjhfTca/YfK+Nu/swam8f0nk28OEtOfJe3D1eE
	evKbhlAKaOsiDZIinfBvUteAQdoIJF90yzu3cyUCoZL2t1Mhm4s1tX36aRZpV9eiWNYO5I/rNPg1K
	JoTaERdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvt82-00000007yiu-1bCs;
	Fri, 27 Feb 2026 08:23:18 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvt7z-00000007yiV-2z5Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:23:17 +0000
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-896fb37d1f0so29247096d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180594; x=1772785394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRbyV6rB0ACPTuZRlxL65vpkYib9H0d5lAlAjAED1c4=;
        b=lDkVxfS+i6UvgMgvl/J4+I/tACD0TodA/eo4qIIWZlRovyyRtSBPkAtEcL8HluDf6b
         4RY1vrm8y8ktHc/pg4rpLeJGsv0GGT+vMcFQuGAP//Ae/HUxZtNB/yClo8sqsOpajgLm
         wAaMyjK8H0+gVI+Cx/doKLOaBfVJf2G8g8ARd010uEizKdQ+6ze8yYR7TcgedbYEjZJn
         7jrWMaTttj5k1OGEdiAezhfXLT9ehE9sKE3pvBocsDCq890Ed4qhc+DbFURvDwO/6br9
         X47ZampQGaXFeHePywtlwDbI451Fco6i75WuLPFJga7jIr2ZScT/OvbH91/VvXQ4LL31
         QCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2r610ir4eIpNlVGXptt0xy9pJqHSJKRfLUhr7qWy9OZDjYAIOkAriSVnQsb0djXMisDDuhXKvlX1YB6dMrZ1O@lists.infradead.org
X-Gm-Message-State: AOJu0Yweu6E/dwaf+i7E1gWTnu7kIz5DNJFZRtqHfjl4eLJSl3LY1yUJ
	EnsI1ON8NOnkQOVByPL5s/g+lZ4jPP0ftLfrpdOf8MWorDD1fzzYDC0DbscE+zxDitw=
X-Gm-Gg: ATEYQzxSUY4H80mXL7nSbus3tZqkq3CbB2ePBXSQ2ZWdN7ADMoPA95MluyjFYXkedgz
	Ud4YfFtnXE7xQ7sDdsf4qKimgDILMNviyM4YzcmAhrqbzubtfybB1zkU94P7ZUAVLllAA+iE/CH
	aQ/IsNI1z05jNMNZ/XOs4qiyIhYRXPC3fpnaaUl6rnm5Hd0wQ1GTWKKUNcfejcsWEYIcbh6EZ2I
	7TkGcZMBxJIWPW1Np0LVZgixSCkDy0+8XDE4nVrmMbyRe1qQx+mzu/L8SNISq9KimuAuE4eTC26
	xg9XUj0MlZZUcaC5QtbMQNq4AStPYTwpgmV9b+DBb3myvInO7wEojkLH7L8NrbLJlT2ot+1as+f
	QXIkTSbZ2XPfTgkTYMutAdSrAXNXuIKG5Q85K8aabLnYTJzQiaeDlrwu0aIHBPyhh+8cLp93/BZ
	tFdkDRvTKq3Ge7YhepWItOKY7IEVM/kTJGhCQjiN9XlTKWJz53pBpewSCri+CkPTHx
X-Received: by 2002:a05:6214:2021:b0:894:7852:9bd3 with SMTP id 6a1803df08f44-899d1e3dbe5mr26838456d6.42.1772180593947;
        Fri, 27 Feb 2026 00:23:13 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7374dd7sm39689776d6.32.2026.02.27.00.23.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:23:13 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c70ab3b5fcso246408785a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:23:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPwEQ0RShOnO4XI4fPlHvdbEfqxZI2qQ78I2TlkJ2GXG95E9niV+5fIYJq5U54H5vVuDLa2sIPIV+8gqbU4IQI@lists.infradead.org
X-Received: by 2002:a05:6102:3747:b0:5f5:3619:8bd1 with SMTP id
 ada2fe7eead31-5ff32494193mr1107329137.25.1772180228608; Fri, 27 Feb 2026
 00:17:08 -0800 (PST)
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com> <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:16:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
X-Gm-Features: AaiRm52todzA8Sr5byokA4vkDZ2E-x17wtaWy3OW25tgrEahH799QvmVZU00ayM
Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Andrea della Porta <andrea.porta@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_002315_762357_6F315ECB 
X-CRM114-Status: GOOD (  19.67  )
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

Hi Brian,

Thanks for your patch!

On Thu, 26 Feb 2026 at 19:17, Brian Masney <bmasney@redhat.com> wrote:
> There are some clocks where the rounding is managed by the hardware, and

s/hardware/firmware/

You got me totally confused, also/especially in the cover letter! ;-)

> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

