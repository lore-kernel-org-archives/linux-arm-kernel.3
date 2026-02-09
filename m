Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C91DE7E0B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/HI5x7xNhQziBALUFqM7+9EP3vRvEnVExedUVbP1Ww=; b=CJKKaKSrdH0/kQ+ZwRRIbBTXjx
	MmiWr/QfDfpM7RXF8PzOMCS1HnFvA1a2Oo7mZc3U4v26pnikobiAPv7Fdyn52PdKoVh7844t3mzwy
	pCYoFegRYsIokpt+PBhUNB4QMRCDpqxELCke5r6u+yppZpye4tfOoimXP4z7eqhj58wkgfskGRRY/
	0s4BrcgbBlqLs7hQO0KMG3b3MX+U5DKRlALjoRCiW8BaLVOTUf6EBVH3ZXNt0i5sA7aHF8elgNyjt
	hbkiNOvHoIQimUgFvrscSHVrl4GCQ9UXaDqGgp5NtLtA0W19J8gccwIeSZlR/j0kqDbT408wOBOhq
	6w/MCvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNv5-0000000FBRH-04K7;
	Mon, 09 Feb 2026 09:51:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNv2-0000000FBQB-0EJq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A75844451
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Feb 2026 09:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA03C19424
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Feb 2026 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770630659;
	bh=xCi6ubXgKmasEcdXHAMMG5PC/CNlxGY7PcTKXlTNTI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AklN6AE5thhQ9moJMbKv4ABgOBvrKniCX6UalMGworhvE40cE7NdHfuiKmLNRIuba
	 m7paA4/qSxD2NRAAhCKiKown6BbsAhhuPvhpoNB+yPmitQq+LeWqeJ9NqWgZbnFAON
	 9UH4Sscm9ZheOH1sgGhSMAIB2Dy+I+Wq/Ji41l1xfcvbh7dVZcFTRgIjHhC8wEY5y5
	 FnzTZW6qkTbxQwPNApe4rDFDnWM88elaL1C3pGbBeYF0A32sk/hn36gkD4o03qS/4G
	 lhJ4Ec477OMdUwjTXfklT1qoI8DPfWuMAuKPCE56gPQxc3G9xNWVmaof3Loo+x9FbH
	 IrBoz6N+LNd3w==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ad019bbd4so2204988d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 01:50:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpBCE89lS3CVr56Tit/irWgCjUysV7bWR9voKnG06/42TDVL42xqx04Xy9OfdPHUvTBvvywfwXMUPe+hm1eXMz@lists.infradead.org
X-Gm-Message-State: AOJu0YxEsp5/YZMDz+MwyMrQ6zsMwnpdtBagRYtmtMqLvZlEwc/TS3Dr
	6YF7Ieu8RnSF60RABX47GFhRAUoF/QCReKfIiy+ZCASRJivNWjSw9p2c/vO2Pl0NSJG+hGO27/i
	2diDVKYbLzsScJM32JMyyrHh+Vgjc5r8=
X-Received: by 2002:a05:690e:140d:b0:64a:dafd:2d49 with SMTP id
 956f58d0204a3-64adafd302bmr4654383d50.47.1770630658832; Mon, 09 Feb 2026
 01:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com> <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
 <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com> <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Feb 2026 10:50:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
X-Gm-Features: AZwV_QgbghYPe4WNXN5NblKdatayN1hvGLYaSa9NTwtL-Nk8oW-Brvg1nLBjte8
Message-ID: <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility, probe
 robustness, and consistent pinconf offsets
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, BMC-SW <BMC-SW@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_015100_568818_08E31910 
X-CRM114-Status: GOOD (  14.85  )
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

On Mon, Feb 9, 2026 at 3:25=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:

> To make sure I align with your expectations:
> 1) Would you prefer the new driver to be fully standalone (using the
>    GENERIC_PIN* helpers + syscon/regmap-mmio), rather than trying to
>    refactor/export helpers from pinctrl-single?

Yes. Conor improved these helpers so now it should be possible
to use these to do a very simple and slim driver for what you
want to do.

>    Action item: Introduce a new pinctrl-single-bit.c driver and DT
>    binding, which can also cover the existing bit-per-mux logic currently
>    in pinctrl-single.c.

Sounds about right.

> 2) For the syscon/regmap hookup, is it acceptable to add a syscon phandle
>    property in DT (e.g. "syscon =3D <&scu>;") for the new driver to obtai=
n
>    the regmap, or do you prefer a different binding/property name?

This works for me.

Yours,
Linus Walleij

