Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CE6D4415E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBPalY9b5mWlkTSpEFxpCuN7/q0yodTJdlXJYJftjf4=; b=w1HTjMI8zujpgp0jF2xxEErFnc
	5YAy+JMVnC4m9xWjy14Z9Lx86URIKd2ttfzVC1SxDDY7NvqEPGrRSmR4P3KTCw47bYxPsdJEcLpTl
	9jZSp3BUcbOPF3/SKLndJ+it20S3y0lw+qktpW7xH9KEdCTkIkTeaufkBJw+/s1z/25WrTbqydvXl
	La96u7z/MfNO2OgWClU3JIPnKqA86mTY+ilPkrTu6sw98u2nleQB8eu7bja+63K2FnDTvvyn8AUIT
	I/ujZ7YNHJVkd5elV1YxrWpyfydF0qw6RquhZAmrp9eAJhCwJ5mgAgTtQaEjbersAy9+NdbvVMewu
	HeRjOUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOs3-0000000Cd0r-2j00;
	Tue, 19 Nov 2024 14:06:23 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOr7-0000000Ccum-1DoZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 14:05:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ea499f264fso2000727a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 06:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732025123; x=1732629923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBPalY9b5mWlkTSpEFxpCuN7/q0yodTJdlXJYJftjf4=;
        b=f3e5WHEMv+HE9f9wx1MDaHiYdSdPDok8y1EGryB7D6vBE9GF80rPeRPsT/VQpe8Eib
         e2HGGnN+7DvZOMacTQhFQTusoW+YI3koUiVI57+HwIeSfmau9NFB+PFif2SVm5stZGud
         wBBnt9PcIGIoyb1yaYSCnBziG89lgPAOmYPALc8p4EmpsqXhBhlU8zKJsbhdN1uIVTl7
         9l+8jtWn7TD7SVMhWt/MCPDtT8c3IhfMtHSkPDnSntLyv2210Kpa8HJm8obw3DkRj14d
         ALXpH+4Zp/pOSJb+5M7uq1zm449bdLGIUyXXGBF+vHMbWdX1jbkopvsTeqFXrs+GUNHZ
         1B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025123; x=1732629923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBPalY9b5mWlkTSpEFxpCuN7/q0yodTJdlXJYJftjf4=;
        b=E2H1GYUSK9EsJTRThwSFi7eugmtVsykww50bRi3ZIbOZFc7OGXhxeJ9ioPA0+hlFIR
         /SF9n910zEC8emarxyqF3KgW5j8l2BAv8u/hVNs6sOmqwXyBrz2zllsm4Qlj/31YMFOf
         G0G9PnP2Fa8khyapMq9WRio1TQfNFMHbbPg4dt63Hx8Zu5ZRdcKK8dXt7sG4BXz2gbT6
         ilwBrLXNa2F4UB650L1SrUgspUTZl873cyu4cKT24pD1nB2x5PklNcNsQXZ/3o0RJDL7
         QPVdJ1z0YbyWuALhQY8ZKxjkSNMIzI5BUt/dSk+y8GOya62muQ+K8ZFfa5qfUxpXVeL8
         x6GA==
X-Forwarded-Encrypted: i=1; AJvYcCWjAoyBBtwQhMccqgzpZ/EJKWwmrFDii38bWHbRTo9Sux8IQeJBHs6c804DEqlzUTtOTpEId9YZ+KupwIPAG1pJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzukwy1p9VwI1V0xkCrNCYypjk/YZEHYyLohV7Z7eBFQrwKbcgD
	Dcoo8baJIaKbuDKupCoXAcAxOPNPB3dUwdVVr78O9iHvFruXYBMLcBW/qpJLLK5+5DZ2TQLZNZ4
	/mNsU8UreOCf8JIHKHhKfI6cS+fs=
X-Google-Smtp-Source: AGHT+IHky1OvgLHwzwgiLW/QNIajFXu1TBxWI4HEOm7TpfDRvYiij2GU3eyxjDv2GEFkYwJe1zG3oZP6GKeX5/y0ZtE=
X-Received: by 2002:a17:90b:1809:b0:2e0:7b03:1908 with SMTP id
 98e67ed59e1d1-2eaaa78b464mr5012734a91.10.1732025123370; Tue, 19 Nov 2024
 06:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20241007132555.GA53279@francesco-nb> <20241112075958.GA8092@francesco-nb>
 <20241112092054.GA18139@francesco-nb> <CAA+D8AO3a5WsZ4=V-9CDifDZYjJjwQmQQDDQM7ZKgZ6_-CNDPA@mail.gmail.com>
 <Zzde9xS0zGJhcoUb@gaggiata.pivistrello.it> <CAA+D8AMx14hp51aH7Y=Sgu+X+_KxQ8zdJdrQHFY84nKtQsKKrw@mail.gmail.com>
 <20241119112201.GA17768@francesco-nb>
In-Reply-To: <20241119112201.GA17768@francesco-nb>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 19 Nov 2024 08:05:12 -0600
Message-ID: <CAHCN7x+AU9-xiZo4-Lu2A_0M5XaEYgYtQbumFkmpvJ2AAbj0rg@mail.gmail.com>
Subject: Re: clk_imx8mp_audiomix_runtime_resume Kernel panic regression on v6.12
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Mark Brown <broonie@kernel.org>, 
	ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_060525_332680_15777D9E 
X-CRM114-Status: GOOD (  34.27  )
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

On Tue, Nov 19, 2024 at 5:22=E2=80=AFAM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> Hello Shengjiu,
>
> On Tue, Nov 19, 2024 at 05:35:36PM +0800, Shengjiu Wang wrote:
> > On Fri, Nov 15, 2024 at 10:47=E2=80=AFPM Francesco Dolcini <francesco@d=
olcini.it> wrote:
> > >
> > > On Fri, Nov 15, 2024 at 11:13:58AM +0800, Shengjiu Wang wrote:
> > > > On Tue, Nov 12, 2024 at 5:20=E2=80=AFPM Francesco Dolcini <francesc=
o@dolcini.it> wrote:
> > > > >
> > > > > On Tue, Nov 12, 2024 at 08:59:58AM +0100, Francesco Dolcini wrote=
:
> > > > > > On Mon, Oct 07, 2024 at 03:25:55PM +0200, Francesco Dolcini wro=
te:
> > > > > > > it seems that an old regression is back on v6.12, reproduced =
on -rc2
> > > > > > > (not sure about rc1).
> > > > > > >
> > > > > > > The original report is from https://lore.kernel.org/all/20240=
424164725.GA18760@francesco-nb/
> > > > > > > and it was fixed with https://lore.kernel.org/all/1715396125-=
3724-1-git-send-email-shengjiu.wang@nxp.com/.
> > > > > > >
> > > > > > > Is it now back?
> > > > > >
> > > > > > I was able to reproduce this issue once more, this time with 6.=
11.7.
> > > > > > As I wrote in another email the issue is not systematic as it u=
sed to
> > > > > > be.
> > > > > >
> > > > > > Any idea?
> > > > >
> > > > > Frank, Shengjiu, could it be that the udelay(5) in imx_pgc_power_=
up() is
> > > > > too short and therefore we have such non-systematic failures?
> > > > >
> > > >
> > > > Francesco,  it seems hard to reproduce it on my i.MX8MP-EVK board.
> > > >
> > > > If it is easy to reproduce on your side, you can try to enlarge the=
 delay
> > > > time to see if there is any improvement.
> > >
> > > It's hard also for me to reproduce, we just have a relatively extensi=
ve
> > > test farm and 2 times it happened while doing unrelated tests. I was =
hoping we
> > > could have some idea on what's going on, I'll see if I can put togeth=
er some
> > > kind of stress test, being able to reproduce it more systematically w=
ould
> > > certainly help.
> > >
> >
> > With my test,  the issue reproduced with delay 5us/6us. but hard reprod=
uced
> > with 7us.
> > I think we may need to use a delay of 10us for safety.
>
> Great that you were able to narrow this down and confirm the issue.
> I wonder if you would have any information on what is the actual delay
> that the HW would need, instead of guessing numbers. If not, well, let's
> go with 15usec, or 10usec, your call in the end.
>
> Will you send a patch?

Peng (or anyone from NXP),

Do any of the clock speeds have an impact on the propagation time?
If the clocks are running at overdrive speeds vs nominal speeds vs
underclocked, could this time be adjusted accordingly somehow?

adam

>
> Francesco
>

