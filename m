Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3428CF5A8BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqGedFnT3teWh1lHSoLCTJEgghEUYXuwf2j/pOcO/3c=; b=h4dcV0yDs1qAbICplWU+rVYD7/
	l5xCrsZ3cXBOrgxB5VkTxC5vfIZcbNW4MtD5Ow+Ak3SuttjkxFDK4LgNM0C3wDhmYppz/reS+d1wf
	TpcBNCAR++VxS/pA6yFjMOl9tfq4gIUWcrOB1QIpIfWa/gMAUNUO9y42IIBi27KiCq7j/5JlBRv7h
	G3Pjt3xjWDUxw5DlOBlOu6Oa3btuAJ0hXTqt4QaYWG1dG/OQbby0r53/AlImHqzM2AZ7i2JcDoo9l
	sBR7aNErN738e9/9TPIY/QP7S6A+Znqq4SFzSsxZM9alXUjeGoCaL9RxqoPFbqILFYaZLS1WQ+MaD
	CmP1tceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvDi-00000007d0F-2ggX;
	Mon, 20 Apr 2026 20:27:50 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvDf-00000007czP-3q30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 20:27:49 +0000
Received: from darkstar.musicnaut.iki.fi (unknown [83.245.248.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fzxqh24dhz49PsK;
	Mon, 20 Apr 2026 23:27:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1776716849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqGedFnT3teWh1lHSoLCTJEgghEUYXuwf2j/pOcO/3c=;
	b=iMJAkfjNWMJ/t4l0tl7Skz/7+NxghitzKZ73RRZGdOdocvREghbnFpwaz/dOmd4DFMLRGP
	GekgwjWoxTR+cIuD62MoZL96Fykm4DO5UUCjPwo2hO6TGpz/XN2fyRXjl1qf6iaCcPXJ7r
	5yu/oJf2kXJVvVmpNzNv19eNXT7z0gGDTd2O6Uijc6nF65z+Nn7t1H9ErwAtiX/3srx7Rc
	JHgJV2UX645Q2lcKPvIFUsf0OO9XwAA9gqHBWbe8BwKFx78VfBUUYbnQRoJcV2YFqudRYm
	2bN7kJaeUsG50Txo8SYj8WB/zh63tg7O5DsEVnZgML/B+KdJ9i0JWkTLBJbcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1776716849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqGedFnT3teWh1lHSoLCTJEgghEUYXuwf2j/pOcO/3c=;
	b=ikKwXmpmObdgy/1/HFNmvxtjM8TbTeDriMJxEe01qtWMvEgLZgXKxbF0Zxcitcc+Aiylla
	LQY9DZCdCB2u9TkglHyohmaQu0r7UZXJrGDXzEwBNGEB6wMMkykVPIcBG5zAgxK9eYysSz
	A0BGTA0Z+uuIbrw5Hwagno5u/AWc7ebqCrEBARxb0NJx+sc2nQpwx9pAu8mvXUepUkjLQ6
	uFJgOvdqYRhaGUeMjCCDrZLIP1Qmj3meQ8fG+r7xeCGudI29e7jEAJMF1iol454PmJe4tB
	wnn08QCfAdX8asgB+W+xDpATpwhlZyiqV1w+pLWgmhR86wDJaFuZvzXluYPB6Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1776716849;
	b=ZEMTNW0vb+/jCFIKwzM0bjWOt3tzAgJ7lN5hMe4l/Uhn4zKWRV/miVLv8RrEjKp+4fuuRD
	iVPQVawli0L16/OHiIzRZS7JVbo82k6kTWZ+0OqQO0gMW94ktTIfeiyRYHGnS3GBXogvE3
	wmLYpiDXvaGNEBhlrw1laoRgqE0FFWYS8I/S1DGvhk33kEnyaWbJ6K+X4cIdfyEgRBYxIz
	yhsgiPU+Tqy5VjhswqIHf2UvcgaxegnOmvkQr2zILFbfsKunJGBzOamM48GyeygANPhVjz
	zuRw4qA+6G2H63dDPN+bNjIy6+bYnVEKWJLHUCxSu3Sr/Yk6m/J0vQ2lJnDVxw==
Date: Mon, 20 Apr 2026 23:27:25 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
Message-ID: <aeaMLfrDCoyTrWet@darkstar.musicnaut.iki.fi>
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
 <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWeXS3ytgozp-mSrW4jcMRCW7_tbDTbMoEdXdbVj0dqJA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_132748_108948_D8369211 
X-CRM114-Status: GOOD (  21.29  )
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

Hi,

On Mon, Apr 20, 2026 at 08:50:06AM +0200, Geert Uytterhoeven wrote:
> Hi Thierry,
> 
> On Fri, 17 Apr 2026 at 15:15, Thierry Reding <thierry.reding@kernel.org> wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Peter sadly passed away a while back. Paul did a much better job at
> > finding the right words to mourn this loss than I ever could, so I will
> > leave this link here:
> >
> >   https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u
> >
> > Co-developed-by: Paul Walmsley <pjw@kernel.org>
> > Co-developed-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> > Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
>    "every Co-developed-by: must be immediately
>     followed by a Signed-off-by: of the associated co-author."
> 
> https://elixir.bootlin.com/linux/v7.0/source/Documentation/process/submitting-patches.rst#L506
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

You can also change my Reviewed-by: to

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

if needed.

A.

> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - add more missing entries
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

