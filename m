Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FB2CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 05:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3mngTSiQ9G4QDQdoy3QdNFGLu5UDTjPqyOy5Rx/Ffg=; b=cEps2ssW3WTenDwvfe9sSec/4e
	IbUFl8sxjsrxdA8RGCEByyJrtC3iTWc6ZK3OmzU9AD38n9EojT8dd/OITVJmYBl7dy8VeSHSQCeV7
	QpA2HXLdb5MgRKhCVdQKcVALQOMh52xOi94Afr89d8SuEr1yeLulnssCfQeVk2JqwRCkprpl2DSeQ
	nBDSLbohhqipmW7qTHoKseIdwTThHmQN9bMnybpi5Rc0jNPiuYh3sE74dphgMMIJ6FPEwUHXMp8GF
	JZO06hcKCEtKvJ5+GyaxwfJVT01pNz73xUyRnwDuZlzKiYurOi5llJyN+byApghCvzFK8KQ3OgOdR
	cIKU7ZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSpuA-00000006lcX-0u04;
	Fri, 29 May 2026 05:37:10 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSpu7-00000006lby-3Gov
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 05:37:09 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1363e78746eso9885046c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 22:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780033026; x=1780637826; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b3mngTSiQ9G4QDQdoy3QdNFGLu5UDTjPqyOy5Rx/Ffg=;
        b=oLXJgKCz60TFiV/hPMJPa4jqe+8RPoGfVt52WAO/wFc05sWVFORLAeIJNS6du/iTwS
         LCphhyVwrjD7edBORljVDsWWsEUclGg9sEcWJFDOSUCT3XqZW7rqdLQ1982PXENXUPgz
         X43hAwpvFINO7NLZbraBHSW13nO1JAtR167uAu79FG1fFpIW6NfFgwI/DB58W22VSk2t
         ck/kw9gwmoPPpeoKrvPOk8UB/MhBtivj/j2Ttiea/iMhx5cw+uqWbWpsE3sls/SYloGS
         0uxcVxp+bp1x6bwDTiZdIyJXS8l2Rvz0J7ompJyYyEJ72pK8aK3TBWobyHq8l/z0qhB2
         ebdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780033026; x=1780637826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3mngTSiQ9G4QDQdoy3QdNFGLu5UDTjPqyOy5Rx/Ffg=;
        b=hKPo49Of53RP4Mpj6bCXl6fAy2JJ5QofeuKZRFu3PFq5LQLFatSNR4S0fhadj7AWpV
         nn1DIdO2C31KpTzc78x/JDjnZIYoXQbeqS2UGnU6Xy+STedXraOYeXhGqnfJwZSMXX9r
         lqgjQR1nJHRmr9T5JrIWvqxiGFyWB/NyP6gNlIsoIQ/8h4EQaqRfrsgSWFLDkHXB0HJG
         WzrD0LLEeat26Z+Wg5tKghSxpsEbx0EpxJi8L1LMHag6TJB8hFeoKbGdxvw70FilWeoV
         JVUdKhkgqA+XWEjYp76Zft8w1tpGwnxyvlnaVhBlKnaXtCHPS+hLK1Aymc0lxjV52XvD
         srww==
X-Forwarded-Encrypted: i=1; AFNElJ9/hazn71pstAIMiNLtli7fHcXlF0ywRvOZqnJKNfUP79ZS4e2CqYK7qqql4r1vvoIxppXNsfkAikjg1ni+sSDe@lists.infradead.org
X-Gm-Message-State: AOJu0Yw63Kk6fkVZlYRHAbNeda2QbgmCFuuyoAITZJDMtlwetc1o9Cs0
	W/Yu5mzM3nCV0Tfmc5JcmRlfg/fY+CIX7wPCUbx/4duJolW/OoZnqxqX
X-Gm-Gg: Acq92OHEUs+/ZPmm+lpClFI/jUPgganWLHtO6pbzQweWD2ErYhLfXi0YcYFtGH2y8Ss
	tJh9cf5i7Yyg0P4PTIqIFuX2/0v8IYtsPQEYuzIuM9y4RJ6etw/3qiuJ8TfbncJMwAoG+nwqi5Q
	co9Znj401qZEPYJiiZ4xcBoGLOvpT0ymQj+vzlg1616jnDZ+jFEXDewuhAZcUk2MEiPKGUijRjX
	0cbDGYeywkf/7Cvl86pjmvFOsCj8FO5uSCdIHMWQamwZT+/HJhP9PlaNLAbP47H74PNSgZZAkIn
	6I3rwVqc9CMRWcBDU6EWgTL7FXEJRVRV3yWK6/VEekZR6+27B6dIt2AJUb4X7MN1aUWVOgzBBz1
	xzASKnqI9o6lCk2EYSlVxEMghldVNzA+BtsQ4ZU//Yvsvzcg9xly/9AMgQg1q4VzYiYj2UAwsfa
	A+lhXiwFgYMlaBrHhzST9DGqwIO+wGqebdTwqC+rO1DsiAa4zQZYi2ZLeRZMBUEo85bHVroSSO1
	DI=
X-Received: by 2002:a05:7022:2223:b0:135:d76a:aedc with SMTP id a92af1059eb24-137aeee5faemr536827c88.33.1780033026219;
        Thu, 28 May 2026 22:37:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e169:a62b:d3ca:e8c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b2d04287sm832719c88.0.2026.05.28.22.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:37:05 -0700 (PDT)
Date: Thu, 28 May 2026 22:37:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Christian Lamparter <chunkeey@googlemail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
Message-ID: <ahklyAUMaOxy3Z9X@google.com>
References: <20260520183815.2510387-1-arnd@kernel.org>
 <20260520183815.2510387-3-arnd@kernel.org>
 <CAD++jLnYeh3GfEfNXfCYdcdg_j2RAU63TYewwaTx3tm0tM531w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnYeh3GfEfNXfCYdcdg_j2RAU63TYewwaTx3tm0tM531w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_223707_821870_0E612FEE 
X-CRM114-Status: GOOD (  19.18  )
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

On Mon, May 25, 2026 at 10:57:44AM +0200, Linus Walleij wrote:
> On Wed, May 20, 2026 at 8:38 PM Arnd Bergmann <arnd@kernel.org> wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Most users of gpio-keys and gpio-keys-polled use modern gpiolib
> > interfaces, but there are still number of ancient sh, arm32 and x86
> > machines that have never been converted.
> >
> > Add an #ifdef block for the parts of the driver that are only used on
> > those legacy machines.
> >
> > The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
> > passing an IRQ number instead. In order to keep this working both with
> > and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
> > the gpio number if an IRQ is passed.
> >
> > Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gmail.com/
> > Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>

OK, if Lee Acks MFD changes I can pick this up.

Thanks.

-- 
Dmitry

