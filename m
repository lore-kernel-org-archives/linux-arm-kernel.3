Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EA4D6204F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnYFnM2sFhC5wfCK+6fZ2Ja9fZiE3XOnCzCCHGI4GG0=; b=f3oTcNStnFCLXkJ/2iuGRvuFKT
	7vivFYs25/UuTM1Ihl2ExqWWS1cbs3Rt/5T+2Vpo3v33AZLQ5a1kx6YOzwP2rlE2p/UEag/3O3EuK
	XAUxjixMg1TIjc6LRWkG4ZSw5iPzR2tX4Am45cDfZo2rFHg2UuKZKhV0Gvf6pvXurgmDu9miyRMen
	+3gHTFHr9zbwUrPWyqNS7lQqRk3tTKyiucpnW184bvoe2XzL1peN7ojq8i6+gXuQyrSH47wK6ggIE
	U1hegPZxZYpYDDYX1i+TJ3fG92c/wBp3Mnmiuflvd19vEl1dGIOGynX85Eg4J6VR/uPAsCF0WmNhY
	quUvyV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKfA-0000000Bucu-1pDZ;
	Tue, 19 Nov 2024 09:36:48 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKeE-0000000BuSL-0Fdv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 09:35:51 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-83ab694ebe5so22623339f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 01:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732008948; x=1732613748; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnYFnM2sFhC5wfCK+6fZ2Ja9fZiE3XOnCzCCHGI4GG0=;
        b=LFkF5/xuxl++/Cc4ur5beADvuDWs/XYroYJa9zcz2ix7PMHK3nMIlizJyDWlJ/ILFt
         BXSDWmQc3zPvaM1PW4Er5WHtuPLn/CaXAHZkW7ydhJG6cZ8Fq5KdItaGZt8fNea2mgKG
         mCYPTs6APwb141zmAI9l0KGGXzlDjEWaWnX1FIVt0G4K6RM2INcWipQZlSawnMrvbYPF
         k8CLOAgjpHxyKOxkwEjycAqbvttzMMDN/0vySOYpk6FkuTX1rCXPaKFm2ENQrnikwVab
         YSzmi/Wp+VDM6rG+J3Jafc3A4RvLN9RD3StPe1KbgKN6T5bwnIAAcgWfDL2r0C8EHpF3
         XoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732008948; x=1732613748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnYFnM2sFhC5wfCK+6fZ2Ja9fZiE3XOnCzCCHGI4GG0=;
        b=ofkm5T8A+RlCpWIg4NqJh6U8TykXGn2AazxV/QRVzb5HjoZOfJoZ2fmAzqaejqHxua
         dHeCGc+GV/H4jvI7tgGg6key0NDIyrh9J1Hl24Jd0ImilSB29pgG7f4q7jsSbWMG/HEr
         hiztOz/8KF+PeLFETEo6Ea4axx4rh8BqcZ+YQ9fhXoZQkZguiipNebXoBhnn0n3lhAx1
         yFVa5yTLcYPwNdE1Q53Le5UxIujNtUefzg2XoMiLh8y4sOirwsRYivVm7rdrhlTKwzAN
         lz2RdBqHyvm2nhgInHVnXLp0/nLjHPvtkn4PeqabiAYvkozzgjnfEzBOfYs95tUOmruP
         tz4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVv88yLU9e8/h0fAF2007UDt+mkULcVFkfLwYCI4gOrTHaGvDXHY6vx37eXVo0fgk1JPifBlrO1nEOaNt/Ryuw3@lists.infradead.org
X-Gm-Message-State: AOJu0YyuTWkLhQPrVqjeGJrIvuR5Db4tV1TOSpswAbWNLy0kev7e/Uhn
	7kwYL12wWrnjc6fTK6c3TK7pLF0jlnPKeFKEa8wS6ozMgfzPDDJ/IRILX3uxfx63vchYnTfhraz
	YnF5htwIXnhXnKQsFTM4xfmpGHhc=
X-Google-Smtp-Source: AGHT+IHbK7ZHvwSeOtWJ3a+S2WJZt3wsFdIwJInxf7s6NhG7VuTWPA8z9cbCUhbcQ9pqfV4z4beW5CW/veyMnZgCR10=
X-Received: by 2002:a05:6602:3403:b0:82a:3552:6b26 with SMTP id
 ca18e2360f4ac-83e6c2ea511mr1433295139f.15.1732008948402; Tue, 19 Nov 2024
 01:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20241007132555.GA53279@francesco-nb> <20241112075958.GA8092@francesco-nb>
 <20241112092054.GA18139@francesco-nb> <CAA+D8AO3a5WsZ4=V-9CDifDZYjJjwQmQQDDQM7ZKgZ6_-CNDPA@mail.gmail.com>
 <Zzde9xS0zGJhcoUb@gaggiata.pivistrello.it>
In-Reply-To: <Zzde9xS0zGJhcoUb@gaggiata.pivistrello.it>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 19 Nov 2024 17:35:36 +0800
Message-ID: <CAA+D8AMx14hp51aH7Y=Sgu+X+_KxQ8zdJdrQHFY84nKtQsKKrw@mail.gmail.com>
Subject: Re: clk_imx8mp_audiomix_runtime_resume Kernel panic regression on v6.12
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, abelvesa@kernel.org, 
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Adam Ford <aford173@gmail.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Mark Brown <broonie@kernel.org>, 
	ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_013550_098816_4E2321EF 
X-CRM114-Status: GOOD (  26.56  )
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

On Fri, Nov 15, 2024 at 10:47=E2=80=AFPM Francesco Dolcini <francesco@dolci=
ni.it> wrote:
>
> On Fri, Nov 15, 2024 at 11:13:58AM +0800, Shengjiu Wang wrote:
> > On Tue, Nov 12, 2024 at 5:20=E2=80=AFPM Francesco Dolcini <francesco@do=
lcini.it> wrote:
> > >
> > > On Tue, Nov 12, 2024 at 08:59:58AM +0100, Francesco Dolcini wrote:
> > > > On Mon, Oct 07, 2024 at 03:25:55PM +0200, Francesco Dolcini wrote:
> > > > > it seems that an old regression is back on v6.12, reproduced on -=
rc2
> > > > > (not sure about rc1).
> > > > >
> > > > > The original report is from https://lore.kernel.org/all/202404241=
64725.GA18760@francesco-nb/
> > > > > and it was fixed with https://lore.kernel.org/all/1715396125-3724=
-1-git-send-email-shengjiu.wang@nxp.com/.
> > > > >
> > > > > Is it now back?
> > > >
> > > > I was able to reproduce this issue once more, this time with 6.11.7=
.
> > > > As I wrote in another email the issue is not systematic as it used =
to
> > > > be.
> > > >
> > > > Any idea?
> > >
> > > Frank, Shengjiu, could it be that the udelay(5) in imx_pgc_power_up()=
 is
> > > too short and therefore we have such non-systematic failures?
> > >
> >
> > Francesco,  it seems hard to reproduce it on my i.MX8MP-EVK board.
> >
> > If it is easy to reproduce on your side, you can try to enlarge the del=
ay
> > time to see if there is any improvement.
>
> It's hard also for me to reproduce, we just have a relatively extensive
> test farm and 2 times it happened while doing unrelated tests. I was hopi=
ng we
> could have some idea on what's going on, I'll see if I can put together s=
ome
> kind of stress test, being able to reproduce it more systematically would
> certainly help.
>

With my test,  the issue reproduced with delay 5us/6us. but hard reproduced
with 7us.
I think we may need to use a delay of 10us for safety.

Best regards
Shengjiu Wang

