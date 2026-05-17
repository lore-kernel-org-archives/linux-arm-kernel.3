Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6260CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvFaQsXKMAFdsiEyGScw9s1oo3v187U9mkI8d4FQAZc=; b=GLcC/ZfcUlQvTZU4A3D5Db6tMB
	fycJUd+CXoEjjK+yeNcB0M5Tnd0p4lVMcQr7uQ8/3iG8eSqTX0Us6Wips8IYPlKF9GEDwYkomVEMk
	I5brF0bwol3bfCWurN9FAP5EbhHv7v0xOUMQJre9EyKZobwdSHlI8BqDq9jw6wLDSShtPSZhz4LPP
	qKAgUCjecsw+eR6BWF1Jy+T91y+S4sNmwToWUJKYTKL0Uo3IDLYYguVGEcsmTfBQ3/djpp5gb1RXa
	YRRQpz4fDxIWASUrTqZsM8fb3VbKqcWY/r0l3+6mPLJgCbUg7ZfrwL0sO5AEY/AgE3/t+h4U/MVkG
	Y0iKt+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiCC-0000000DQ7v-1Qn7;
	Sun, 17 May 2026 20:34:44 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiC9-0000000DQ71-1wG7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 20:34:42 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo3476924a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 13:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779050079; cv=none;
        d=google.com; s=arc-20240605;
        b=S4bSh1FaPzpOnh8RgJxwqKMf014mPbqBz5SQcx5EEGlB3m0dZnWOiM9N9kXbUxdI1F
         6z66mcyfNhHTQdjRaLHA95iCj82fdJEfykl20HqLjGTZqmKp4qTAC0i5lMrUu5PzvSYb
         6PdsfaketBvGmqS7TS/07tRGoIFh+fwLNhGJO/mkP2ZLiBPPsbU5s4HOp79JtEC379+W
         zB2+TMXYMqVe/LmBjQUxMKsdesmy+C0PV6S3bbubaR9BC1Nuu3KcZY+jX5kl+60hKUX6
         vfpkjWGKs1tjq4iNthlLEr/rgQ4XdU0alUVKOcQfI9+gPpYEkFILEXGJ93EutKFLo5ax
         QRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pvFaQsXKMAFdsiEyGScw9s1oo3v187U9mkI8d4FQAZc=;
        fh=3t0rleVOq8GoGKWeSLdyGd6W/KMqbHKRFpx372+Kdq4=;
        b=fmS1+BElEp9ETLgJnbOp5RQ4DIeL32m0JPFZeyg+H0HdgxruQj6eh9DXSEIf4AEn0U
         rJogdcWaEcnBghEh6Z8HbC2x3LICp6unodFMjWdgKUPxBw6O3OxagdfgRTiMXUwSJLBH
         0PZiteVCEogdQsZoIycb0l/k3f3eGwajikkJFacJkO+w7/cSllHX3TIB9IjGWZwrFV1p
         udA01QSw+4XztMlOutVL/jJqdzlG8AZLqntAmGun+waiLhhya+YnVOCIy7rmURPvtSJg
         G5ooqY2O9tUj9VvP0Ty30OUcVerlQoCHFyFjyojGSie6bdHhgkWYmYqrbIFYsrJ/YDCN
         +gOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779050079; x=1779654879; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pvFaQsXKMAFdsiEyGScw9s1oo3v187U9mkI8d4FQAZc=;
        b=XJMOfKAn+Fx0/UNAt9ZRRk7H3iglOq5YmUDTIAf+W7rzHm7zg1lcwdwBaLdpjuGoQ0
         aXuewFRL2/M3+QiXsp7AfGVUelF1lXY+EnrsrsJmPKrPLRte8KWS53kN4SmeJW7KvbUl
         Gla3dKyXb9MgbFNbplBDdZRN+v/F5BSWN9s1NbIyELNea5zx9wn68W/tUJ9/YI6GVe3B
         lCoTNZrvAkwBiurmqsPVxdTunAx0mkyyXs4KA+hIyCSHurD8ptvfTZ9CopmuDDF6hpgs
         ovl26V9Exe7pMHLnyo1vUCZKgCStLWa43NLaWhl9SlDV/CJvw0oZIORAklHyODn1FCAn
         vcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779050079; x=1779654879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvFaQsXKMAFdsiEyGScw9s1oo3v187U9mkI8d4FQAZc=;
        b=iTb8Qx2sZVijr07qlZ0zJJHF3nE9T/1qUqtbvclBJOPnlbFyQR4xJADSsoVd+huYlC
         U0Q5Ho0CF4uLFMoZ8PD7WXPWnFPlpsbM9mjixZFYvVXbdj/heK3yTo/rKUsab/Oyh/zy
         /JL8i/fgJwSL8PwjmFuLMiCwVAZ+3l6AYeX7w8loDoyD0F+guMH0KVhtXXn3I81p9Z5P
         j0YZn454fuCJ0lUSUwPvcFCCU/duFZEzwPqbCjEyXEdEnTSH9WXKlVszngxjKMWZ1agD
         Nm66cLMdcbA1HvwB8IW2RlvwAuXx0iCoPHWfZ07FIOlIpv5+c4WmiJZebsX8Am8DnZx4
         XfSg==
X-Forwarded-Encrypted: i=1; AFNElJ+kLR+/MZt7HlBaw1QKg+DKspKJY1klhH5OFwWFixVb/w2MzqKuLsUNRlDSghxNPgABO4leXOXEMo9MlWTXAttI@lists.infradead.org
X-Gm-Message-State: AOJu0Yznkd3qtj8JZXSPkzOo3XYcloiNPmu5b/nl1SBA2o7EFAqVBrxt
	MY4S1cvMVnevmePhuLrm7IWoHqtjeUUsWdMDjImqeOmLnjPa8K96aisZpfn2dR6pv9w9wr/WqKa
	qVP1JcuHBPShid2+XR4BfhGGpW2Tx5to=
X-Gm-Gg: Acq92OHhuDrl54nEYRBQljWlBvATzQ4rHH88Du3VU6b6S9k9Zqjh/LxtzXREThWccjK
	7IKrr/TXzq4iHriCVB/zz+AfSirNMXqcesUEuijydd5eka2yWe3vcoeSuWBLOO1edojvaGOqNsO
	8aseHyhUeAYpynN5do8AKazV9MdDJZMRpHVYUtvSyNM/S12836TOr/xhtAyrHU5FBJ+szzXHgr6
	ByLycTVnLzagNXWpouRKyzBSAwLVYUSfuw2ykKbwbAQLbDAS2nY/r726F0XOg6WKwI73QvXL8UN
	e622FyA=
X-Received: by 2002:a05:6402:249e:b0:684:95a:4d05 with SMTP id
 4fb4d7f45d1cf-684095a5202mr4796563a12.8.1779050078758; Sun, 17 May 2026
 13:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260513233139.659956-1-dbgh9129@gmail.com> <067c55c0-d56c-496e-bf75-5c3491524256@microchip.com>
In-Reply-To: <067c55c0-d56c-496e-bf75-5c3491524256@microchip.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Sun, 17 May 2026 16:34:27 -0400
X-Gm-Features: AVHnY4LZJOMeJaLZu4hTErugOA3pPaUKx_QVLxhWugGqRJa5iBBxf0p3f7LEaEs
Message-ID: <CACrCO_XibQxWzt4uv8gVJTYB9eiG85=KCE8H-o8cP6cwybgSKQ@mail.gmail.com>
Subject: Re: [PATCH v1] irqchip/atmel-aic5: Free SMR cache on init failure
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_133441_519653_F0527377 
X-CRM114-Status: GOOD (  21.52  )
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

Fair point. I submitted this from a general code hygiene perspective.
Thanks for taking the time to review it.

Best regards,
Yuho Choi

On Fri, 15 May 2026 at 05:58, Nicolas Ferre <nicolas.ferre@microchip.com> wrote:
>
> On 14/05/2026 at 01:31, Yuho Choi wrote:
> > sama5d2_aic5_of_init() allocates the SMR cache before calling
> > aic5_of_init(). If that fails, the cache is left allocated even though
> > no IRQ domain was installed and the cache will not be used.
> >
> > Free the cache on the failure path and clear the global pointer.
>
> No aic5 = no viable system to run on: I'm not sure it's worth
> considering the case.
>
> > Fixes: a50ac562ef48 ("irqchip/atmel-aic5: Handle suspend to RAM")
> > Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> > ---
> >   drivers/irqchip/irq-atmel-aic5.c | 11 ++++++++++-
> >   1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
> > index 1f14b401f71d..58650eb16880 100644
> > --- a/drivers/irqchip/irq-atmel-aic5.c
> > +++ b/drivers/irqchip/irq-atmel-aic5.c
> > @@ -358,13 +358,22 @@ static int __init sama5d2_aic5_of_init(struct device_node *node,
> >                                         struct device_node *parent)
> >   {
> >   #ifdef CONFIG_PM
> > +       int rc = 0;
> >          smr_cache = kcalloc(DIV_ROUND_UP(NR_SAMA5D2_IRQS, 32) * 32,
> >                              sizeof(*smr_cache), GFP_KERNEL);
> >          if (!smr_cache)
> >                  return -ENOMEM;
> > -#endif
> >
> > +       rc = aic5_of_init(node, parent, NR_SAMA5D2_IRQS);
> > +       if (rc) {
> > +               kfree(smr_cache);
> > +               smr_cache = NULL;
> > +       }
> > +
> > +       return rc;
> > +#else
> >          return aic5_of_init(node, parent, NR_SAMA5D2_IRQS);
> > +#endif
> >   }
> >   IRQCHIP_DECLARE(sama5d2_aic5, "atmel,sama5d2-aic", sama5d2_aic5_of_init);
> >
> > --
> > 2.43.0
> >
>

