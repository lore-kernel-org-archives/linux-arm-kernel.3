Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14D1C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=; b=PYTb+74j9bYb7gwOWAdMPkKBmW
	j4wP0apkZiFEFdp26X4gw79eE0xG6peyaA6gNmQFZ68Lwgm1HUqleDv9mPqKnOGW5+fEK70Ss7irH
	DUV8fCQqReUQX2PBJ1dkyZm9Dvd8nDJSun1jr006mpRybsa3sBwhj9WGko92ddyNAmrfzloUE6OX5
	432WyRZ1nDoExwBlVd85uY1rD8VsrQG1AhKJ2rRcmmioAVTS1Ywayq9NCKQ8P/eFE828OggmQfAaM
	zSVaLH0LPJLy44UxQt1k4+rWEJZd/05mr7Pjk9/XZRxw4igf4TJSae34ly0pLKAFmgLdZ/ASvXL7a
	Ukuo7Tmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxsq-00000005nV7-2mGV;
	Thu, 06 Feb 2025 09:09:16 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxrS-00000005nOz-3rqQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:07:52 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-307325f2436so6000541fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738832868; x=1739437668; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
        b=EFdCwAcAI7p+rPcLVRNIvkkP0Fvbj2wc55Wfi/UdP22DTSpQVxk4j9nP7ZvgICEAay
         mcT00TwudlzLJSg26kyrp9oQTumhbLRLo1jHZWmA+a1V/W9ajPeMmg4eGJGcD86Lk4ko
         l9GCkrchmdRQT0pgis2KfpD60YrrhH3h0+Pb7iXy1YYE0F/1QHVT8s3pW0geYrET3H6m
         BNomvcxyR7aaMqhkuGlsy+SvosJFVPt2mTWbf84PGdfZjrjD++RgNwJiRwDDDY1dzGUK
         Lx137lJjQeULjdQcgDe8t1iM9WAHpQS7c/tdN2JcPvlYjeFSx6NgymtgrO1EorwdOorp
         Oo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832868; x=1739437668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USBL3Bi8iE9n2Sl7YVwR873K49AsaDipUTVzCmvsvW0=;
        b=JxlCRxmBfKcVx1h/Jvtkou6e3iBYTpUqxFcn5G68XhMScgIkcJEB5/Yf2WaRuWtCtd
         RX6NLWRYvZ1D83lruyHXp8XuGTUOehsnng1U7V4hw1Mqwf49J6HZtKpH4iodmv5QVNyH
         XodWYf/jLOw/rIWbzV9EAlYKCrs5R2Ww1A+Wj8Ra++Z32/I7J5JOjbyFXdBsFsICX0l+
         XxAOrskxr1RLbfuctEkiPWM8df9ak88o/J+4PjPCxZHIX2F6A80/REltgvHZ6OT3iusx
         iNNn7ubeGfJ1TS0INebivulNIRQl4qt9tDfATjF+xmxITaJc47HZ/XetXjIgsN2rvdiz
         WJuA==
X-Forwarded-Encrypted: i=1; AJvYcCXp523uAeUmOdjkdOeGnJM1vul3AhtD7i7XYOQb68VQGLI+exjbFOJ4ryOLLz1K1FGCalUe/d9PJmuDdTD67nH0@lists.infradead.org
X-Gm-Message-State: AOJu0YxtXNbgl5D0M68DBNdsaWu+hIaK+3fsEHe5VE5xtZasiVCr5g5N
	eGWlkI19L0BIv/twEI0+vIaGkUmeCvKIz1XhYtYSQQktvj5hvemO6KF6lzwXrYMdUzfZn/rYh0t
	9pvTpQQrY+wGY+uvISG2DXw9uL9RIk5EXKiChyg==
X-Gm-Gg: ASbGnctxA2g2ElqCSQuAVjyBTzXg/tpQTlV/F/BD0j1xKJqDAro8oOy1HAmylDzFV38
	Lv9ocESAF7VPs9Dc96zrYrRzDjefyQV+WxTS/hIDMl3nynhqr/bR/hMopvRMsUQUgOKb4Iq8=
X-Google-Smtp-Source: AGHT+IFMvokVoCNJp7A3lkxgigywWrPi05v98IDrumPEAYrql6H51kRCzThn+r8IlTxIEYbaKMGx7LiQg6tGfTHRK7I=
X-Received: by 2002:a2e:a917:0:b0:300:1c9a:80ce with SMTP id
 38308e7fff4ca-307cf385308mr20165081fa.33.1738832868506; Thu, 06 Feb 2025
 01:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <PAXPR04MB845925677F9AB860552A421988F42@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845925677F9AB860552A421988F42@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:07:37 +0100
X-Gm-Features: AWEUYZk9rGC_78qVqTxr81SNDU-6p5M6XpnmcdwLF8h4Nn9OhqhPBv8W52Ra8WI
Message-ID: <CACRpkdZ1zBkagd478Ee+JAUWrXF1z-Hts=dH+_jgT3Vi26W84g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce allow/block
 list to address devlink issue
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@google.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_010750_959542_13E3F782 
X-CRM114-Status: UNSURE (   9.12  )
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

On Tue, Feb 4, 2025 at 4:31=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce
> > allow/block list to address devlink issue
>
> Any comments on this patchset?

The pinctrl changes look OK to me so for those 2 patches:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
in case you want to merge it through some other tree.

Yours,
Linus Walleij

