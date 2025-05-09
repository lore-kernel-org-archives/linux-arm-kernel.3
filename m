Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C59C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UptzkckGGe6JRswL/8UtUucPFjfcOJ9lUow8fGoTkk=; b=0sIGbtBHqGuUDprjB4ZrX4H081
	9rhTM85idda0DcNHTXww0rfqQAb8TLI28bUctIYx9+8kVgmksjo1RM/Ot6rzTnAEO1ab6/ySTIVOu
	k6GomiHllqESAEqnsxrc0IBbPE1Z/qFyYSlAEIVkdEYKTgzNhPQ/tKUJvVHdJdlmhZFkacxJ7FKyf
	aBhLGHqxd8jTcT1fQE5hOuUG/CMCp2Sdhu5nGIv8QZZ7kqD6uU5b29Ek4s0EinSzbcWL9A9Q43jIk
	15BBupatifAl5p9K4JhXAodAsyoSfZ3tug2lnrc8YLA6CF8g+IdD98eweHJVHhCnZLFWjR5PxH+MX
	h/BqGQPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDO0u-00000003o4h-3vrG;
	Fri, 09 May 2025 13:43:44 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDN6U-00000003czc-0GM5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:45:27 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-70a2a42eb3eso23206917b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 05:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746794725; x=1747399525; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UptzkckGGe6JRswL/8UtUucPFjfcOJ9lUow8fGoTkk=;
        b=dMdVvlznfxJMjg3RX4oGDwfv5ylZ0A/0R0lFqmjt5916Q5kPYnFegUNo3GsZgpv/FA
         viN8jPFLfaZNfx70fMouse4Yvxx1yQQW3LeNiMSyhQijrUyauFQxGSg0b2vMEo/HhbE6
         PzJkO4PUxAJlHQtXOfY+dj5T7IJzldgRiiPI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794725; x=1747399525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UptzkckGGe6JRswL/8UtUucPFjfcOJ9lUow8fGoTkk=;
        b=A8QNizlMHJmwKTYBws+sg8nMLv2mvM0whApnhkkceAtfiq7sF4OBLNbgg1xCPtZM1c
         yGVwcc8I/nbVC0698p8K2i8uMZ939ULf6vktL/GRBOH6HS4j62x+QF2F3JaWMOwosGqv
         vcTykmoQ+ZgsavLrCTSBakzAFxR/HyFpwTVLty/qP1BAXBXFd3FNfaGWMGrduYrXhyH1
         SA+aRdqjlHiDHcFxeInVffmSS7mCAjwd3wYgg1AyoI7ThTDzuWv5U4Wz5RTqOXGyPB/O
         JLdIY1xR1UtI6jWytToKHB63HXH6lD9RgOk5p1SoEpeXEdHxSZB7XWdFM6Dhw415axbL
         XG8g==
X-Forwarded-Encrypted: i=1; AJvYcCU951gMTvXvXRBijJ4crg0nZ+gXRPIUYh0yUXuuhcJd//M9z6S5Pmn95dXPMcOjDsipg3rBR1Y/CVoJFkJTmv3z@lists.infradead.org
X-Gm-Message-State: AOJu0YyFA1FxoRZIdVJi4ePZn9euYuM1pSznH1gG2HeHcTbZQCQ+7c4Q
	Xgnw3wADj7H2gqboWuNHrUHavZHMkS4jLOvwBIk1P04TgheKe0io0nojwyznr5vO08GwTJoh+jX
	HVLP6n1TzMPIz7ztZuFePDvHaJ0gQtmcUqnG8OQ==
X-Gm-Gg: ASbGncvlnN+4kubxutT2ojBPd07riuR8UAFuaV9I8lZ4o1QsxguMbr4gZpNc2nOic5i
	7SnHZjXve8cJUkUTvMbfNG8/OFugkhgsFoYShRF2CenELza1lWRWpNKZopfwTmcakJJ/6A2fv0P
	Z2zijRIn4pkh7RTSV8dA==
X-Google-Smtp-Source: AGHT+IE+ZAuLmkz1arQbVX0YZvJVLhQ7nxcEKZcFN7pYHPM6BXlBBzNkNPkqSg4yVC9lFIj68cGkI7vjB1r4wxAuYWQ=
X-Received: by 2002:a05:690c:2506:b0:708:11c7:d200 with SMTP id
 00721157ae682-70a3f9e3f61mr40837627b3.4.1746794724940; Fri, 09 May 2025
 05:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
 <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk> <CABGWkvqySQugJpaj1s_jqGHkA5BONALJY5jn7JjZe=iLc5x60Q@mail.gmail.com>
 <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
In-Reply-To: <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 May 2025 14:45:14 +0200
X-Gm-Features: AX0GCFsMhC-bZIQbroR-iMbqMxImzouNrdaQ9uRaQFjqPmIkXBI_CX0YvsjmbY0
Message-ID: <CABGWkvq+FQZ2A9vpv2XfDmbHgpNOSnZhCMdkKaeqhCcvdjzdAg@mail.gmail.com>
Subject: Re: [PATCH v12 11/19] clk: imx: add support for i.MX8MM anatop clock driver
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_054526_097650_B7985AAA 
X-CRM114-Status: GOOD (  18.34  )
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

On Fri, May 9, 2025 at 11:00=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, May 09, 2025 at 10:34:38AM +0200, Dario Binacchi wrote:
>
> > From the log I see that you are testing a board with i.MX8MP, but it's
> > probing the anatop for i.MX8MM.
> > Is it possible that you have the CONFIG_CLK_IMX8MM option enabled?
>
> This is an arm64 defconfig so whatever that has set, including the
> above.  Note that arm64 is supposed to be single kernel build for all
> platforms so we shouldn't explode due to config options for other
> platforms.

Ok. I'll fix it asap.

Thanks and regards,
Dario

>
> Current -next defconfig:
>
>    https://builds.sirena.org.uk/f48887a98b78880b7711aca311fbbbcaad6c4e3b/=
arm64/defconfig/config
>
> > I have personally tested the patches on i.MX8MN and i.MX8MP
> > architectures, with only
> > CONFIG_CLK_IMX8MN and CONFIG_CLK_IMX8MP enabled respectively, and I
> > didn't encounter any issues.
>
> Given it's wide use for CI the defconfig really needs covering, any
> random combination of options that can be set ought to work though.



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

