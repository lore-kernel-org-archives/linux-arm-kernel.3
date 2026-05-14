Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D41CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJwj6Gg8AyMk563HlPprgVFnntCvbQJUPOML6jrMsks=; b=dJSZhl+/FffCKGm+084GifMdpL
	ZzTAiyPRiThStYPrwSY8NWo2UuPLnkN0obHH/1QaA5wS4w9ZPRV38o/GF0f+NYeUsXAJxf0KYC9sL
	24UOdYD+hP1xktvCFi4IgfLskPDag3+J2T885EybbbOpG/xCQj8R7PfyyL9HEJqkp1cMJo5zvBPhC
	ds8NAtHOKbg8sEXUyPoKgNng/7sYXnwzhMyXq72SxZU+kIxCViPAw/ctsgl1/a4BlR/echig98tB5
	VMA707SRFxpBZTm8YWaFtyHj+/BYSeM2XTmvAjwKEnk1KNob2ago1hmR3xrv1bJG5KQGsH3vdgXzq
	jHha3hfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQ8F-00000004n6D-0ZrG;
	Thu, 14 May 2026 07:05:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNQ8B-00000004n5F-387B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 07:05:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48fde648a71so922035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 00:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778742314; x=1779347114; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJwj6Gg8AyMk563HlPprgVFnntCvbQJUPOML6jrMsks=;
        b=WDdMOT4+rKR1P9E6I+Di/fRK+Wsc8/P0mQh/Cp2HGH254d4DSsbZpdeOjwwc5moiTv
         kodT2Fox94hDDeWTl/UcMTD9DWWPz/N3+A7n5keFXDCa/GGOuIXeGREIJDPanzeRVnwo
         QlxQFTrW2uB7RY6QC7uIEHOAA08FL4sUwJAvh/lu/v2elRaRoDP/JCjncIZFR27RnQ8l
         ypu4MbuGQ+624kO5gM7H1i7BaFOn1FFA3wtWX0XUSqodgr2JuufvLBioK+EH4BJgouGf
         RvA8pZrXyK7e9nJvP7/xhvLDUEC6bg27Zv22Ul68WsrHUh40bn3qveba9XZbd1OmlksF
         86VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778742314; x=1779347114;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJwj6Gg8AyMk563HlPprgVFnntCvbQJUPOML6jrMsks=;
        b=UhZg0Qox673NdlcmBLwejh2YLF+fCdLt/bu0AI7AMu58js3rFWZSBbZy3LMEmTjKIp
         fBA8IKx47B1XhR6QOAxbXqRT9Di2tSJI6jZyXzCel2/ea7HbNPDr7ZVL46vxkq/sD5kx
         onXrktI+Ut6svu/A40TSn9gyvh200JtFHR3uOPX4pPt5oyDi2/IZvUfBZXKrWJGBvafl
         0gHTu4g3Z0C08+HfWGW6uKRWYWfFWWELvhvQ3spc0cCWAldiJA25fPc68DBFMhknDbNw
         1iGQ+aNBt5TeWxTtTNGJ3EcN2NZ/1cgu9GsRBL38Oko4dV3WkplN2Wk7zVLseDXwYxfq
         Ddtg==
X-Forwarded-Encrypted: i=1; AFNElJ8XPSB8o3R8lCQXnSu+HzTW1Y2CVE55PGbUiHOZOFnTZ3PReg3h1Mi47YL4JMxxoAkKcc8B98Mm/PAqIkxVHWXW@lists.infradead.org
X-Gm-Message-State: AOJu0YxSozfz/qCy5wxbjT3TYAQmTdI4WFru3IyE+XwtUP5we0kqKGWg
	KhSBi4iNz76Gfj8PnwVT05OnQkXzTPe3qKmPEV9ZoQUVtVVwUpwu/3bBEFpzUA+ygRk=
X-Gm-Gg: Acq92OEGL6yeJLiYMTwP7Sc2NeTPbdCMkE/8DjCulev+rrrMObo8R59K67UyRh325iT
	JkInthB+tKdTud30+bSiIqwKy1546Y0fhMLGScvpOlJ3VsDB6qJd/XtaFHBZGs2+fYbHFHDnaV0
	zngJq8mIHuwfy8pwz4K3yRmjqMM5AlASLPSWfDpErGjMfOSpCcFnBF7G2DEoLqNRKPls3sshtmZ
	Ku5judR4dRekRqtAoGo5nueovJBGkVbCg53VmI4IOUgCc2/NHyYjlNZc6jvofnrAUPGePaqjKdp
	SQzxUpnQDOjhgLzn8TT/jcTrLe30JVeMlJ+0zdxO9CCKo0wrZYBtFPkfP7N41SMn5GccJOFFbww
	96+g4U3ryGXjadFb1hl/BiMF+KFKGFtG2ad+ALj4nMeo3p1EuA6YiAEo3tS4np8ziJ0nDXh4l6L
	eNzLl35NdcL8SshOgdxYB4XeUhRw==
X-Received: by 2002:a05:600c:41c7:b0:488:a502:8955 with SMTP id 5b1f17b1804b1-48fd6325dc2mr20118035e9.4.1778742313527;
        Thu, 14 May 2026 00:05:13 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm4041073f8f.3.2026.05.14.00.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 00:05:13 -0700 (PDT)
Date: Thu, 14 May 2026 09:05:12 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock name as per
 driver name
Message-ID: <ugda72734f6vn67jp6cz6hpkif55a5m4yey3yo2dswicqbyrdx@zk4lhc7k4dxu>
Mail-Followup-To: Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-3-fcdae50cf51a@baylibre.com>
 <734e2323-78dc-43c7-b5fc-0a35cc72e035@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <734e2323-78dc-43c7-b5fc-0a35cc72e035@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_000515_976281_EC5EB615 
X-CRM114-Status: GOOD (  24.43  )
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

Hi Greg,

On 14.05.2026 11:27, Greg Ungerer wrote:
> Hi Angelo,
> 
> On 13/5/26 19:14, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Later in this patchset, the mcf54415 DAC driver is added.
> > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > DACs (mcf54415/6/7/8).
> > 
> > So updating DAC clock names to bind with proper driver name.
> 
> I am not sure I like naming the clocks here with a prefix for the
> specific SoC part number this is in. It might be unlikely now, but
> what if another ColdFire family SoC member uses this same hardware block?
> That is very common amongst other hardware blocks within the ColdFire
> family. Can we come up with a name more specific to just this type
> of DAC hardware block?
> 

from a brief study, this 12bit DAC, and DAC module in general, is only on
this mcf45441x family. There are some ColdFire with ADC only, as those
mcf5249/53/82. 
The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
So, if i don't miss any existing model, the name may be correct,
unless we want rename it to a more generic mcf_dac.

> Regards
> Greg
> 
> 

Regards,
angelo
> 
> 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> >   arch/m68k/coldfire/m5441x.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> > index 5b5e09ecf487..b724d7fc1a08 100644
> > --- a/arch/m68k/coldfire/m5441x.c
> > +++ b/arch/m68k/coldfire/m5441x.c
> > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> >   DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> >   DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> >   DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> >   DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> >   DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> >   DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> >   	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> >   	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> >   	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> >   	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> >   	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> >   	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> > 
> 

