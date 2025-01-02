Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D555E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvCmEDFsLCS686ApolvvcDeZQP817WRSTP0JOnjQ3eQ=; b=GTXiRfC9hM/bvUFlSDSN06N0my
	YhrL+Ah29NcF2Ys8mKP8vhi8zcXnHRjN1yKpDuhcCdx3BqBbQp1rVqXeaCe5hMbtJfz7txiYrLwPC
	vWzEvhWeMcdDAAyWmgNzUqFVqnJh5nWHGM/LGpuqJZtY8rX8Kos5dHK9rbrRLZLCz7AbNDnK/ndQk
	P7tmIyApVVqYtSrCDd/JQa6G/xeKzyIPcmFJ9ygjAnuz9wzUsM1/D6M0XbRDY4vzI3h5E/Au3uLgn
	cHqr4sZ1WCZBg5zbYt+kei2fHZEdsY3xdip1OJzGjCreHwIAD7TRLCV8e4K53Hia8Zr6d94mmgSQ0
	lkgXW+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTI01-0000000A6cY-0GXv;
	Thu, 02 Jan 2025 10:00:17 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHyl-0000000A6WU-3uM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:59:01 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c4e74e2baso1933442241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 01:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735811938; x=1736416738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvCmEDFsLCS686ApolvvcDeZQP817WRSTP0JOnjQ3eQ=;
        b=p3ill79Mhpkk2b7rMPtHOlPSyUQePaIwT3U/EUSbk7sjDXV/gPDHBe1NvC+QMsH7Xv
         qLw6QsYdF3pDQZblLw4/za4CdUc4wEo22bbqvQ5SWYbWHUoyUqXDnmkWRfuS+atdnmOk
         82laTWGTmPoIn7UfFtIzAUb0ujAKJ4vRoFXceoHqnLtyxA/nijb8gWx8Z5GCty5MbiUP
         MAqwB+t63D78FUkwTOdaKbhBgK1wS/gIREYWaTBktYrw06nC7veCQdwdBdGE+PzeJCHw
         HcK42vqNSDJqRsTlMkWj1YC7zmSbppBizx6MV3WdbXvoe2K9tBurHuUHvUqcT4u1fE3Q
         pcbg==
X-Forwarded-Encrypted: i=1; AJvYcCXt2IduZnD5g1VoWbsyOnI2+DgJq58OR1wxZbCcKAuFqNcx4uIKtAYskBglHQ8OERaHvU3OultIVLEy4PVBTxDe@lists.infradead.org
X-Gm-Message-State: AOJu0YxXV1/xzBb/+Olfk1ENSgAd/MY7FzcfC2rZDk2lb08KicdTDEYg
	NFzozavFhqpMsV2ZhyPXtZeJquCHeTk7JAFm96tUHaO1xoGKLiARdvcjRgdU
X-Gm-Gg: ASbGncv6OaEs9zQrhpFTqY4GSKCRrf1ZlZlDAPxRwlD3x8P4qfXN+5hjycumIB6rELO
	wkZxc4Jt4nIePXFlp7jaxPsHJS9Y6X5ueQ3DaJyIx18zIBPhYkx6JQ77/FBfh8lc1BWHZ1BCXw6
	Aa1fX8EcExfqv8iP5J/2+62tFX2LWO6guBNo3l5rtvyKP+y1EL80kOKOSvWyeh1nZjByhDqXcsb
	5kvcJPisHESZfM/DE1Htgnw52K1L77V4XozSS8odZVH6OUkO4STMW4A7cOAkj6LH6CuZTltsaUZ
	zPFFK6j9v4EXweOc8uo=
X-Google-Smtp-Source: AGHT+IEaR2Hxpbai5ijmhG0GC31ZEfpXVyfI6pOGTf/ZbC1ITvFlfT/u19gufqHgdtlUDgXuAT3bRQ==
X-Received: by 2002:a05:6102:e06:b0:4b2:5c0a:98c1 with SMTP id ada2fe7eead31-4b2cc462483mr34365012137.22.1735811937524;
        Thu, 02 Jan 2025 01:58:57 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfad130dsm5083895137.27.2025.01.02.01.58.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 01:58:57 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c4e74e2baso1933439241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 01:58:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTRUguUGTfInBpCWkJd6oK+hdm3G5oBtD3Phc9splw6/NEMhud7N9rdmPbGmyoW9vBqrTvwzvKz5qWC2GDQtIM@lists.infradead.org
X-Received: by 2002:a05:6102:809a:b0:4af:f1fb:1c36 with SMTP id
 ada2fe7eead31-4b2cc358579mr37457483137.8.1735811937194; Thu, 02 Jan 2025
 01:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
 <20241226122023.3439559-2-rohit.visavalia@amd.com> <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
 <CH2PR12MB48751A8B003E9E30A9A4CDE8E50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
 <CAMuHMdX57SvuVsRhisF1RDtP+TgQsa2i+hBg334yQUxTMsqDPw@mail.gmail.com> <CH2PR12MB487534FB01A540F33ECF96E4E5142@CH2PR12MB4875.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB487534FB01A540F33ECF96E4E5142@CH2PR12MB4875.namprd12.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 10:58:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZn0FLGXdGhQ-YYksewm8sJK8J5N=_-DQnE1a_xz41yw@mail.gmail.com>
Message-ID: <CAMuHMdWZn0FLGXdGhQ-YYksewm8sJK8J5N=_-DQnE1a_xz41yw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
To: "Visavalia, Rohit" <rohit.visavalia@amd.com>
Cc: Stephen Boyd <sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "Sagar, Vishal" <vishal.sagar@amd.com>, 
	"javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_015859_994613_429F87D1 
X-CRM114-Status: GOOD (  33.57  )
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

Hi Rohit,

On Thu, Jan 2, 2025 at 8:01=E2=80=AFAM Visavalia, Rohit <rohit.visavalia@am=
d.com> wrote:
> >From: Geert Uytterhoeven <geert@linux-m68k.org>
> >On Tue, Dec 31, 2024 at 3:16=E2=80=AFPM Visavalia, Rohit <rohit.visavali=
a@amd.com>
> >wrote:
> >> >Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset
> >> >sequence Quoting Rohit Visavalia (2024-12-26 04:20:21)
> >> >> diff --git a/drivers/clk/xilinx/xlnx_vcu.c
> >> >> b/drivers/clk/xilinx/xlnx_vcu.c index 81501b48412e..f294a2398cb4
> >> >> 100644
> >> >> --- a/drivers/clk/xilinx/xlnx_vcu.c
> >> >> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> >> >> @@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *=
pdev)
> >> >>          * Bit 0 : Gasket isolation
> >> >>          * Bit 1 : put VCU out of reset
> >> >>          */
> >> >> +       xvcu->reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "r=
eset",
> >> >> +                                                  GPIOD_OUT_LOW);
> >> >> +       if (IS_ERR(xvcu->reset_gpio)) {
> >> >> +               ret =3D PTR_ERR(xvcu->reset_gpio);
> >> >> +               dev_err(&pdev->dev, "failed to get reset gpio for
> >> >> + vcu.\n");
> >> >
> >> >Use dev_err_probe() and friends.
> >> I will take care in v2 patch series.
> >>
> >> >
> >> >> +               goto error_get_gpio;
> >> >> +       }
> >> >> +
> >> >> +       if (xvcu->reset_gpio) {
> >> >> +               gpiod_set_value(xvcu->reset_gpio, 0);
> >> >> +               /* min 2 clock cycle of vcu pll_ref, slowest freq i=
s 33.33KHz */
> >> >> +               usleep_range(60, 120);
> >> >> +               gpiod_set_value(xvcu->reset_gpio, 1);
> >> >> +               usleep_range(60, 120);
> >> >> +       } else {
> >> >> +               dev_warn(&pdev->dev, "No reset gpio info from dts
> >> >> + for vcu. This may lead to incorrect functionality if VCU
> >> >> + isolation is removed post initialization.\n");
> >> >
> >> >Is it 'vcu' or 'VCU'? Pick one please. Also, this is going to be an
> >> >unfixable warning message if the reset isn't there. Why have this war=
ning at all?
> >>
> >> I will use 'VCU' in next(v2) patch series.
> >>
> >> Added warning just to inform user that if design has the reset gpio an=
d it is
> >
> >missing in dt node then it could lead to issue.
> >
> >If it could lead to issues, shouldn't the reset GPIO be required instead=
 of optional?
>
> It is marked as optional as few of the Zynqmp designs are having vcu_rese=
t(reset pin of VCU IP) is driven by proc_sys_reset. proc_sys_reset is anoth=
er PL IP driven by the PS pl_reset.  So here the VCU reset is not driven by=
 axi_gpio or PS gpio so there will be no gpio entry.

OK, then optional is fine.

> >Regardless, the reset GPIO should be documented in the DT bindings.
>
> Yes, I will be sending patch for the same.
>
> >And perhaps marked required, so "make dtbs_check" will flag it when it's=
 missing?
> I believe rephrasing the warning to "No reset gpio info found in dts for =
VCU. This may result in incorrect functionality if VCU isolation is removed=
 after initialization in designs where the VCU reset is driven by gpio." wo=
uld make it clearer. Let me know your thoughts.

If the reset is optional on some systems and required on other systems,
there should not be a warning, IMHO, unless the driver can detect by
some other means when the reset is actually required.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

