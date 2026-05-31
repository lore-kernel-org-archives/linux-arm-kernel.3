Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E39CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:MIME-Version:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=; b=XuqHxueWPMr3rPKwLAg2wgCC10
	CvHoHkn1VZL/BfJNaEsF86g6akH6s/i1IEVNuDubeKk6LU1cB4YYNmT22xCFsSLVyqKRKgEpUPXM5
	SMizrBVlDYCX1Veehowfr4CGcI4IDo28naJKgdDf81Tkcmu2pO8igheaRnQ2863gd/z7ltfrtwW9x
	Qj9MIxmPTt81DxSKqpKvvqoCKdm3Om16SfQ7oFE50sUM171PjqQdjN03wZBSmyFQCqPv68sV5fqSZ
	6zTnVrzoafXb+QAYukoz0X9+Ux9fx3O7MApzfPj2wfSYr9rW9tFJT4q+YBuVmvPKc77GeaxBg/XGT
	CL502fJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiEJ-00000009hzc-0JLq;
	Sun, 31 May 2026 15:37:35 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiEG-00000009hz2-0Rpv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:37:33 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-bed2b9bfa02so20995466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780241850; cv=none;
        d=google.com; s=arc-20240605;
        b=MRC75iO24TS0Px6pAqdFIn8MJVYWNJZodR3aJmhpsiw1Gc4WJr/T71vcNyrlrbPH4w
         q/KH4fjjPjuuGUNs4QxPj7LfFBq5YM7yGiAcQUbn9AqR/7QIsFSeeyzhFnfJX394vMsc
         bv6EnL6JOeliBZkNXMgM0BCQdLXDJnbcCR9UgFclE80rZmOQQlONfSWWYBvBrG693DzC
         pFq8e6aBApTka1LpxAoyacPqKyHxOJI1qTRKzKb/PLtVHtNbEJPGTSuhRiz9WJvGODBS
         BsSIwNG+4KWNwOWhSwxo4Y8EDsxtckQvQyTX27QL31eL//QsfXwU1ihftZNsglYopVJp
         A2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=;
        fh=ncNlg9K4Y+4NR3+nv/4vywTi8fFu7t3e+l4z5jEvka4=;
        b=c+glHDgOOG/3FDRiB2qNa+szf+wagHEw+DtrcHH8mYJvdKcBfOvMeLgOWR/33xjcap
         RYGm9hV14+VJSXFNor+caLmhhiMAFC9Gl6gsqyfNVVOjb+LTGemj/CAl/XtJL8zqkmyO
         FTPkRDr8UHnQ19rN7+OaoGk3iQoMbFtjTYJbI8yf9p/HuUBj3VYTe1vya2qkWahoZM1Q
         wmyLkEb3Vp94rQaTe6z23RvBnFpsFaa66lmno/fS9g5JBgmVvXcesryc6TyqnyjH0h3w
         DhBiANfTrRLRznuDHfKXd5vwrpwtK5QG8znmLkskAApwfHpaM0OGlgd3NzmcdB7BX1rJ
         SYBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241850; x=1780846650; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=;
        b=YSsW8cvReKkDKyEwUj7mAhNYfNpPg5igU/7YnTpjywrAtmjiUPDxaGmzqEvtttjESx
         o2SesRG4aYeekv1zTinCS+faatfQymT36zjO6IyvYPZM+vtrzf6C3UBJIYG03a20biXZ
         C0rrG9DWTkVqgvr04wIS+ogGJs0J2jGRA8yCUAVelko5soaNSoQT2wQCcCz4esnjIxI+
         5eAkKF9ljm4H0xZ/AaLJrL7ibc2nhFMnbQbExY9h4Bq70hKDyQjUukC6AY0matbJGfek
         +k/W3VYqQDr2lVmDLW3aF5lli4M1HQd9BoxtusU/bMtbb13BuPHmLRTgG7Pha6oJlEAR
         8UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241850; x=1780846650;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=;
        b=GkmxgI2oQJJNCMH1alDBcHTWNJrOmPBUMCL418Kdc485/iArVchoHZYnNCslwcRTi/
         LBcGdFp7KxzV/Hb4Al5mfxdXX+IxYf4rEdSXXlcJbGFmLu7pPmnJrkql4wrFnJlD05u/
         8SDc7Kk3wSGdjkHOdWSJ6ZlXscWO65V7jjU9Vs2xRynbAi2LPxs7aYdm8FGf79Jf1bIx
         zRcZ5icy0ptn5RaGusJfwiqBOOO4kTJy263QCWUFqLnTXj9ivg5tyMDZLk5ycAONGzaY
         jhB2aAmYEkXDo4KZLM8gYK2D35Xbyw+IiHWKPHhU5vC2XA9sSr5KyfJgFdEsT4uYcs4+
         ntSg==
X-Forwarded-Encrypted: i=1; AFNElJ+lYbtn5JBgfrA+7OAxhULS+hPsKceHp5ieH1NpLAMVBqecUNkeXz0c5QUj4GFEqD9dMKEccEcyWVlaGKtCpTBg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8ht1Y0PV0IKFOc2HWpDd14oi5izgV48VopP2DIbdWsSfyfKd/
	ITHR4IMTLfdAPGF1rYVpqokuzcepON5zDLQ47YN2nmwwGfovYvPIlqWcyvXsVIFfODXwgZePs4e
	mxe59OXrqywHxpcyDKakZdW1wMn7xIUbfJX8jucVUGQ==
X-Gm-Gg: Acq92OHMh8Ub8eik6DyrvXs0rJ7+SrG1xL1k6/1bvPos9XZ4IOqIWFCIn0nn2dUVWMA
	RliKJlpOld1AK9G9cjlgG91OEktvdM4FiqpRM2a7fpbVo8o2h+DOzCyAIN0DbXakmNuY65/ODkh
	GlIoDqs7D7ZNWHFNrZQ8R8Az/ydqrR8yyea7ptKYUFVXAylAtF6ArPWAhoougHMrPhNEKMgelbX
	8m+fEFN2uCrI3MUKCDYHRErbva9G/GMvQYVQwgkAek8Zivz0eOd5phRfVaXO+gtNcjoLeoGaUY/
	YpM/ruOdCRVpj10FYLx4VCv3ab7iYcnN+o6E46rwoDaiaNg=
X-Received: by 2002:a17:907:1c0f:b0:bec:228e:26ea with SMTP id
 a640c23a62f3a-bec228e2c86mr154675966b.13.1780241850051; Sun, 31 May 2026
 08:37:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 31 May 2026 08:37:29 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 31 May 2026 08:37:29 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Greg Ungerer <gerg@linux-m68k.org>, 
	Angelo Dureghello <adureghello@baylibre.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
 <20260522-wip-stmark2-dac-v3-3-16be0ad35a67@baylibre.com> <ecf346d5-a65f-4507-b277-40e75ae89442@linux-m68k.org>
MIME-Version: 1.0
In-Reply-To: <ecf346d5-a65f-4507-b277-40e75ae89442@linux-m68k.org>
Date: Sun, 31 May 2026 08:37:29 -0700
X-Gm-Features: AVHnY4KfVAiFLMBLt8OCHtOET5j_xWQ5bRSDD33gmCDJzuWhX0mLUD1pV9Eh9I4
Message-ID: <CALSJ-wAiLgFWStDtymqrysx=4ZFGgY+SjYC+wjiMifVKgW7QoQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] m68k: mcf5441x: initialize DAC clocks by iio DAC
 driver name
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_083732_168719_03023AAE 
X-CRM114-Status: GOOD (  20.76  )
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

On Sun, May 31, 2026 at 11:15:43PM +1000, Greg Ungerer wrote:
> Hi Angelo,
>
> On 23/5/26 07:20, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> >
> > Later in this patchset, the mcf54415 DAC driver is added.
> > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > DACs (mcf54415/6/7/8).
> >
> > So updating DAC CLKDEDV_INIT with proper driver name.
> >
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> > Changes in v2:
> > - none
> > Changes in v3
> > - roll back clock names as they was originally
> > ---
> >   arch/m68k/coldfire/m5441x.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> > index 5b5e09ecf487..b02ca2eb55a4 100644
> > --- a/arch/m68k/coldfire/m5441x.c
> > +++ b/arch/m68k/coldfire/m5441x.c
> > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> >   	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> >   	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> >   	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
>
> I thought after the last discussion on this that we would not change these
> clock names?
>

sorry, seems i seen this comment just after sending v4.

As a change i rolled back original names in DEFINE_CLK as they was, "mcfdac".
While i cannot change these names above, from tests i did they must match with
the driver name or driver does not find the clock from his code.

Or am i missing something ?

> Regards
> Greg
>

Regards,
angelo

>
>
> >   	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> >   	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> >   	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> >
>

