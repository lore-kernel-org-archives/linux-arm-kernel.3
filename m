Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7F6EFCE20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/prTTpQhW620yX2PYVk5yWIkWxklh3YEhELl29vkzfw=; b=mYT0JGrhnQkfLoQAQA8cYKk3ug
	eK831XerFPvaXeb6oe8rLasABH6D/Tkxtgjelk27175N4/+CzIL9PzCH4yT10QZvp65AAcQDEnyDp
	ZZVravrZDVnejHnc+OEn6nf1GmraByTUgPo2KwkU6g8bP01rv52QXYgJfjoaRcDbj5zgH85Opn5Iy
	RAiXjPjzSWmWg4Rp9/FhP4tV4A6dm3OqWmKhJgjVhrDGWLuLS1agfl2b+mHIpHVFiTXRSwBQfjVev
	agQfxTSim+uRMpvLxs1k1M+08hYpxlFQjAjRNRisN3KINprSKy+Qi2XvFQ1xImjubhM3oWHaa89Jq
	qKu7L9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpml-000000009jM-1ORm;
	Wed, 04 Mar 2026 17:13:23 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpmh-000000009iq-3ZQK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 17:13:21 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ffc1e25d6cso78531137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772644398; x=1773249198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/prTTpQhW620yX2PYVk5yWIkWxklh3YEhELl29vkzfw=;
        b=Y8x42T4mCpqRvQ4WpWbR/oH67wInX+LWPyma+UL5KB6ysCUltT1lULNB9EYpi5M503
         zGqeaRkH18DdUtFkuhPsk+ZWGn4BvUpD17IFCwkWd2Y0ScdQs+7+nVZRA7W6BzAF3XnK
         Cvf7aJxlOgfGI3llmZnc2Hh8YLSfa2+mF+5Iym3IjSQ0Lbm8jFLcp2+61f/kW3Yw0xEZ
         0MHULR2lik6HQsCFl7oBkLtTcHJtYm2h/3qY/HvT+z9GMWL+z15KtjIyKiaGHrcnmuTJ
         pkRt2PDB6TXV1AuY7LG8vD8be+FnfOmNJ9Jk+DoIYVpMFdO9S8Hlp/QVM1Ik5df4Zj07
         qUOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt2hHbSjdCqQcaAnK4pmFzJjaYljLVNdkzLq6JiVInlZ87JIBtDrgmvxR5aG9pPMIwuI9oWiOiaDHpffYcZkRs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8raS5LQJQIxIg2tbxqGEorlfAPG9gXmkXv5sB1QELny3PNZIf
	XsxdPg7g0FiDTuVS0d1p0nXLfTgjCbMeRHEvTpbtYsijKhj7wz3c9ZRosIDrf57m
X-Gm-Gg: ATEYQzxul4ox9n/O39voI742gTBgcdHD0PAhhFytFFyjfy3h959mdYNKSY0rzhCB2DC
	eHvypy1pOSYoViDSgASIUsF2ymUWyaMqsTXVx6/3TU1GgS9pte0VAdEAw6S3sNEApa4jyMsG/cs
	EB2VzFaiI4rlctYxlO9VcgBqpA+gpZ8RlkyYWy4a3y1GW/9ysAL6T/BY2Wk3CU0zcTelYfCZ79B
	CG5EkUpF7YBa5b36+9uHManMGNXcLv9IcbpVi8Tm0y/ap6h4oKxXR0/5tZAW1tkzqoqM6KulRT8
	dpmv96ipeFs7h71LpWPBlpucIy6P4QKVw406ssnIZu1/RwXN2rfkGufdTz7FPeMEpLg3celXT2D
	G2tCfeNNZuIWExawtGgW0swrvc75GDZGz5sW+FDCZKEeu9SNcjByMtqupmktxIPU1pkmTyMNBqb
	QKx77vWr8VA7Z0ZT2zJkxJP9LGgBvZx5uZvLhsgJrkbwIgTyWFN5zh3NPeaCQS
X-Received: by 2002:a05:6102:c8e:b0:5ff:2963:52dc with SMTP id ada2fe7eead31-5ffaaab190fmr1243343137.4.1772644398029;
        Wed, 04 Mar 2026 09:13:18 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df63d8abbsm18329135241.2.2026.03.04.09.13.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 09:13:17 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso2137486241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:13:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvR76q/EQEMNRceQ3NtOmDYo4OKSDQZAPlhgIbzf37LLxgEDJR1D1AN+9XkLuVCBFfIgNrQkKGLi+Ykb2O4o8Y@lists.infradead.org
X-Received: by 2002:a05:6102:3e86:b0:5f1:b7b2:8929 with SMTP id
 ada2fe7eead31-5ffaac72c15mr1143974137.15.1772644396647; Wed, 04 Mar 2026
 09:13:16 -0800 (PST)
MIME-Version: 1.0
References: <62b849967d71d73e028fb65efee717986ef847e6.1772641758.git.geert+renesas@glider.be>
 <535cfe49-4f70-4ed9-ae4f-92215140e6f6@gmail.com>
In-Reply-To: <535cfe49-4f70-4ed9-ae4f-92215140e6f6@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 18:13:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVhznozaH8=jPGBf_aKEged+pjtAeDTBmukd2B4KMJkwg@mail.gmail.com>
X-Gm-Features: AaiRm53SGuxzi6WBseORNxFfXVIwmT8pmyVVW-tzwjBIYdQXKlr-Hu8waR2QV74
Message-ID: <CAMuHMdVhznozaH8=jPGBf_aKEged+pjtAeDTBmukd2B4KMJkwg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/gic-v3: Print a warning for out-of-range
 interrupt numbers
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_091319_899596_101C9B16 
X-CRM114-Status: GOOD (  29.46  )
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

Hi Sergey,

On Wed, 4 Mar 2026 at 18:05, Sergey Shtylyov <sergei.shtylyov@gmail.com> wrote:
> On 3/4/26 7:31 PM, Geert Uytterhoeven wrote:
> > gic_irq_domain_translate() does not check if an interrupt number lies
> > within the valid range of the specified interrupt type.  Add these
> > checks, and print a warning if the interrupt number is out of range.
> >
> > This can help flagging incorrectly described Extended SPI and PPI
> > interrupts in DT.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This would have prevented the issue fixed by "[PATCH] arm64: dts:
> > renesas: r8a78000: Fix out-of-range SPI interrupt numbers"[1].
> >
> > [1] https://lore.kernel.org/1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be
> > ---
> >  drivers/irqchip/irq-gic-v3.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > index 20f13b686ab22faf..d75163e71bf22473 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -1603,15 +1603,27 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> >
> >               switch (fwspec->param[0]) {
> >               case 0:                 /* SPI */
> > +                     if (fwspec->param[1] > 987)
> > +                             pr_warn_once("SPI %u out of range (use ESPI?)\n",
> > +                                          fwspec->param[1]);
> >                       *hwirq = fwspec->param[1] + 32;
> >                       break;
> >               case 1:                 /* PPI */
> > +                     if (fwspec->param[1] > 16)
>
>    Not 15? Don't PPIs use INTIDs 16-31?

Thank you, that is indeed an off-by-one bug.
Will fix.

>
> > +                             pr_warn_once("PPI %u out of range (use EPPI?)\n",
> > +                                          fwspec->param[1]);
> >                       *hwirq = fwspec->param[1] + 16;
> >                       break;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

