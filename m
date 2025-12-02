Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C061CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6M1ZL8AhCWhQ32NYFxLlrVbyh+vQ6L6egI6jqd0HlhA=; b=cGRX2kDdfIQmj3woeTpJgh1TE3
	BWMZd1rEeLPP/+m6+2WUP2w4+37Ba1FJ1MDcx1ytmL8PNqAEDH7CCkHEIrErbT8jJcUNtbt8Nn0IJ
	8dKywJ0PnjhLLGa1E7EjrrOHLahSTLcFrvORgeJXqEgQaV/WGr9POTBeIkNrsqcEodAbL96hTvdwo
	hOlaumI/iSsxMkyDuyc1fN83GDHbO+Lx+57amhsMYOb7Q9ZR6poDvg9pQ6b4+dsHr4DVYh9u3gare
	ofoRKsr9M2f6xxvYpmw0cmuthgeljJqF7HU1Xp0hVqw2OwXbAPyPwenBUZ5ARTBOou/mF8k1ZDBWc
	ZKvrAheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQM9f-000000054eA-3w4B;
	Tue, 02 Dec 2025 08:54:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQM9e-000000054dj-024N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:54:39 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso8031864a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764665676; x=1765270476; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6M1ZL8AhCWhQ32NYFxLlrVbyh+vQ6L6egI6jqd0HlhA=;
        b=NFtEW/z6Zyz2yeiZZubZOL5OfphU8Ax7gMjg9C3yO0QLYGUcEoI9Nv6zVVR23JKXtW
         e8VhKtW4VnC5R0bOf/AhrzjzMJyxjY4hswE1eUd6Xx0hXc6Sv14C9YsWoy0aValdk9e3
         gg0QJoeBPmeJOdhvWhdoYaGueToQ5MiOKnNolf329/k9AozWhofKpEFqCgVrFst/3VEc
         15m7PVDTu+pEy0q/XmoEOgquTWkygE8aehpynq42Pync5kD0YYx+307b8Psbo3qt7eEb
         FNHu0bveKOp1VRA9w6CN7DFrgWE1A1/pSAAOBN34gF+r6xd+pzEEzHggqYNBseRZNhLF
         EI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764665676; x=1765270476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6M1ZL8AhCWhQ32NYFxLlrVbyh+vQ6L6egI6jqd0HlhA=;
        b=Qpzy/bNA8elPb8CWAWfXtpzMQouBUShqfrAXlNO6CZQnGHufSTVpswNRAjBLsZusT/
         RpmEHtJQ4AGz6JgHhzFN0XA6mitWmWmjQ0+SyMOk8Lfkh7XHChJ0qA87xmXkqrRhZOiN
         4e/nHmwhXgm8w/vqXol++aiaU33cm1xUrz5OKMHz4HQSHKD90pyZ89BCOEuTeapmxxnu
         3OpmrM3t73U6Ybwg9i3vVYi+7lOZlUxCHBMnVSt4QDh6x5wclbDtHDaIrSLSSWB6NwTE
         VnMzMuXJl6dmuswmiZBec0jwX0zo8g3tZ2Ph/NBFuJcY54MVX94+HSrm73pVWe4b8urZ
         K61Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmL10pWYTMni+019zzFKYUkechJuIcMgOIPRCKtNnaW1pNsa3nIedUDlNF6otZjfoA5T5Jm1mCxIQ8gJRm726t@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4p8WhSMQhhJjJt4mKk1JK9B+RMY3vYfexY1IHCcP3m7Yy+EGM
	rXjjqXjcSo00UJM9cRFfpqyBsNI0xZcy3VbKEV5KhJmluXnCEEy7K4GOncwY82M/EZHh8+6xfTv
	IfIrDdY0RJNpbQ6Qecb2ayQVeXUK5HBxWk3Qjp0XLgw==
X-Gm-Gg: ASbGncutPTw6Qkq+Lk9o1Nn/vS5cnaE9l9RJImisANbKxDAVf5vSvHdW2w2os/J4Euu
	WbFVwvGrLyoBXl1ldxFRkarZhTAOmSL7YfeKFu4V1CDSCIF7NbZFOhph9nZr/xnOuC6kXLLO8zB
	MnNUmLNsmLpypp/rbmfho+c1st+p9R1M/7k8/T+vyLGGUsFPx0ocW7kxH3orOrvvYUQtbOJMWap
	sVxuaIj+6bGJ1X9FA/IqvpI35Dwb7NSodJ7ZkM9AVEkye8leVzyz6geoNvsFVvbivM+/ttSgRlq
	5iTDKjPefx/gbuAGrBDkYbY=
X-Google-Smtp-Source: AGHT+IGWnwcbDjhWT0x9H7sIzIa+WZkvafF3BehhPLR1uxm6/AMNVV3pUklD/QKk8hx3Gw45sSksLu6R8c7rGcUXEQo=
X-Received: by 2002:a05:6402:5113:b0:640:980c:a952 with SMTP id
 4fb4d7f45d1cf-645eb228d07mr27645261a12.11.1764665675613; Tue, 02 Dec 2025
 00:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20251128162928.36eec2d6@canb.auug.org.au> <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
In-Reply-To: <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 2 Dec 2025 09:54:24 +0100
X-Gm-Features: AWmQ_bkF5XtGr8F9ahjDdeghwGPaVkXlZCwEv85iEB2fw7LzWAo9ryRojtgxNZU
Message-ID: <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 28 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
To: Manivannan Sadhasivam <mani@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-pci@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_005438_058129_9486BB67 
X-CRM114-Status: GOOD (  12.40  )
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

On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> + Vincent

Thanks for looping me in.
>
> On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> >
> >
> > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20251127:
> > >
> >
> > on i386 (allmodconfig):
> >
> > WARNING: modpost: vmlinux: section mismatch in reference: s32g_init_pci=
e_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: .ini=
t.text)

Are there details to reproduce the warning ? I don't have such warning
when compiling allmodconfig locally

s32 pcie can only be built in but I may have to use
builtin_platform_driver_probe() instead of builtin_platform_driver()

> >
> >
> > --
> > ~Randy
> >
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

