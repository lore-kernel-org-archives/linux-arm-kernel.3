Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9C4CF34A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLwV10lq5XkwvG5if7bPTvaB98hOjyJOgn9Or1ejhfQ=; b=JuzdJ09bfEgTwtNlOV7hoEdD3h
	zeXbX3hKSofOIlRAA5p4XQ/zhOAFNA1PytTK7TsaG9hAwrSaqgFA0U+ixrI+li1D8O+S5jffY2x3j
	zpFWsSi99gy6bq4cSO2bgdc+UMBC1y0GDBrMX2gTRDZ830eIwDfhu2oE64S32j47wecAZLa4QqHKf
	2gi1VRtsGOd9b3hxB5NDd/vEz8FgDvko4myQZGSRgaQQkd7yyt5ZfLFThgwXWGWYleQnSckWlYR8y
	RyKZNkAkQlLiC/ib+ltEZS1DYyoNOQe6JWDWQLFhf6wohWRa96YkTCjCsN8fSBOjb6eFxZAOfRw1q
	hE7Dm7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhsO-00000003Dfu-42oI;
	Wed, 19 Nov 2025 13:05:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhsN-00000003Dfc-2dcd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0756260166;
	Wed, 19 Nov 2025 13:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7481BC116B1;
	Wed, 19 Nov 2025 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763557534;
	bh=bOxV0akRmRQphkd8T9wn2CINlAiaytOn/UCtqXjyjjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBISDiEaSrr5rLUSgmDBtymBsazyAm2s34IBEQ45cPMpZyTiLWiUmqS7bprWzoifX
	 KvJYXxk5aU+3aNgEJr+ZWwIEB+zidOLsZBCEhM0CDlFBfO29CA5otJVNYfGXI78LoC
	 GnFNCuGuFvbuz+22lCpk4Df74S/T0SLwOHnqrdrwrCuXdCBgGCbMQwxRSe02WKBVea
	 1+Iz8LITHTVZpKx3EWnWfwYIjcca0mkfQ+f76myXNO8iRGtTmC1msF8iJE6gp9I9kx
	 dv6NGhIdImfj13lNt41gsr86BXS2xKYB+PP8PlwmcGY9pTq4mxVWyRPGgkVeqt5uFI
	 8bq/sGnMKTdCQ==
Date: Wed, 19 Nov 2025 20:47:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR28aq0xHQOOISYq@xhacker>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
 <m2ecpvm20y.fsf@free.fr>
 <CAHp75Vf=HYugUGDOPdXGaMo9tDLcji0H9ZX7NehN0NoBGYjO+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf=HYugUGDOPdXGaMo9tDLcji0H9ZX7NehN0NoBGYjO+w@mail.gmail.com>
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

On Wed, Nov 19, 2025 at 09:56:12AM +0200, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 12:04 AM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> > > On Tue, Nov 18, 2025 at 2:50 AM Jisheng Zhang
> > > <jszhang@kernel.org> wrote:
> 
> ...
> 
> > >> -#ifdef CONFIG_PM
> > >>         unsigned long   saved_gplr;
> > >>         unsigned long   saved_gpdr;
> > >>         unsigned long   saved_grer;
> > >>         unsigned long   saved_gfer;
> > >> -#endif
> >
> > Actually this is not equivalent to what was there before.
> >
> > With Jisheng's patch, with CONFIG_PM disabled, he adds 16 bytes to
> > the
> > structure. You might thing today, 16 bytes is nothing. True, but
> > on a
> > 64MB RAM devices, it's something.
> >
> > That might not be a reason to reject the patch, but it's not only
> > a
> > "modernisation patch".
> 
> Actually a good point! On the same grounds I semi-nacked the gpio-dwapb change.

Hi Andy and Robert,

I have explained the reason of embedding within the cleanup/modernize
patch. Could you plz check?

Thanks

