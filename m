Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254D4CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1URFBCQFkCLKN9AgsB1caAKF9WTg3pIgR98LDqqD60=; b=1w48bOpwZQM5jiVNTZA9DIj73o
	ZNiP8NeBlTiWvplOMZiCHshKsdiPs50LvY+j54tSw+EdNBclAQOQw6eBRYu54DLpu73jdog1CRZkP
	nMZJxiiO3UZibYg4Ab/qstlU8Ac+yMhPA2OzqVdZpnv3AEB6ZmgaomXMMjYzWBeE+Ue0rZ1jHqgg0
	sV4nKixs1H4BpWVS5tkCsDKc4K0C3GcTQLQuINmN8DpTjul+JKtxYsCWQ65zdVRnxZ60uLnEVuwnR
	nrS/ijRfRIUIKluzKEaH7eLX1OIMTXPki3gW1A13dUYBknepBG4I5kKEVCFl0gDKcleOnADSfcPX7
	h2dfkePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKkU-0000000A8yu-2tA8;
	Fri, 22 May 2026 07:56:50 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKkQ-0000000A8y7-2A8n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 07:56:48 +0000
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-63a3977145fso2237514137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 00:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779436605; x=1780041405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1URFBCQFkCLKN9AgsB1caAKF9WTg3pIgR98LDqqD60=;
        b=AMWbc8vuHkI15kx5Zit2tpeqawltRMM6Bks13ohdJ2Rz2KWQgGRJmQ65pxom/qvCQl
         enVF/3YIH7pDE3XtB4cRVrr/roFvqZVzlxKGk6stMfioGOS0pLwd+9x9RO4YcqgPRdPT
         F4pWZ6uXp/1UR/4ry1yL18fALgE80NrTowCGZoixTltohQJu7x7EquiXAx9zNs3JTqKW
         dq8g/SIj1hLiPR0ukOcCXXePKPNA4Yol5HBJZjCfrougAjdrkkjG9JycDRhhQhWVFf9P
         KQGOh4kvabpAF5BDh9msed08Oo7KI0rKJhmOTIAWjjCvwaMFV/8V/GGr/I9PtrVbaiJ+
         MevA==
X-Forwarded-Encrypted: i=1; AFNElJ8/4tJXA/+DIA0gdhbNdX9Joe2+pW2tSIoSNtSGmvAbso5aY0mPRHyEFCWKcKaVDwpSPZFbIX/8gwIsUnNVtkSf@lists.infradead.org
X-Gm-Message-State: AOJu0YxMXTKiNr6M/Zb1OQML+Uwi+KxJx/boFDEbO85wGHllXSnVDENw
	a0JqXXW4d6KTgfyoU7PxQKiZlG6OTBdgfCnn1+HLG8V2T4sJCt1ZH0/TGm6/hZty
X-Gm-Gg: Acq92OE21ql/jQG/2K6KZcFl7yDLCKLdl/HdNhC5NRQpzF6cbZit9IR1GXCumqh5hfM
	1DmVNoqvClJrPvcXwDKZbRzOLlECI090lXg6iIcr2ykTXHB5Z261GZsmVeBUG1Y6M/Lxytf7012
	UbX1p1s0/SMgCn+txZxoq/ALvYR5KTpmrfsz4J+do1ts6TJi/gB9pdfvChMfcfR/YWaYNPrVYVW
	fo52luv/Xk+QYEj8qNp+2bIBIJZzgRCb0wCuLhJRRkIfFIhOaFm1nOuK6M43ReiEDviU8ba3BxP
	yfZ2rKLZYs+wlZ97BvcavAzC6KH34riZMSKVHNcEog06ZsfAVf4Td1A9gmykYwC8p4BzryxYOdS
	Rbt2dRsog5VvWnTKXg3FXyZ8Ks5pNAQwzLMx9rqSFfQ/kH8JzH1hfff4TN0YuTAINyP3ap5ooYS
	3SLRf1ZZCKmXw71w5b0kgMNbjD8k5VpeCpcWjF5KZ5yD+wtGVMhiXZNs3Zkpf22NO+pOU0fUQ=
X-Received: by 2002:a05:6102:3ca8:b0:632:4af0:4133 with SMTP id ada2fe7eead31-67c7c0765b9mr945904137.18.1779436604522;
        Fri, 22 May 2026 00:56:44 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961737bc134sm761375241.1.2026.05.22.00.56.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:56:43 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9617940274bso26334241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 00:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/v1Kjf7hxbh5KKdRDy//pilMrHhgE1NbMWXEaADcUfaDcYsBiYbam5akjOuog0jbDtBWAOxiyRrv9vdaeYGtXL@lists.infradead.org
X-Received: by 2002:a05:6102:580d:b0:631:4191:6f7e with SMTP id
 ada2fe7eead31-67c6f273735mr1076501137.4.1779436603553; Fri, 22 May 2026
 00:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <20260521-loutish-lurking-koel-229bd9@sudeepholla>
In-Reply-To: <20260521-loutish-lurking-koel-229bd9@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 09:56:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWA1UpZSiN26fd71LUMYatVOwJos6bGb4zR0bnPUqBF8w@mail.gmail.com>
X-Gm-Features: AVHnY4IbACGIPx8bzoPdFLB4YFVUiG1ESnLSjpbPYX_MILNqEuLBdTCR2tWqAP8
Message-ID: <CAMuHMdWA1UpZSiN26fd71LUMYatVOwJos6bGb4zR0bnPUqBF8w@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_005646_569786_522CA650 
X-CRM114-Status: GOOD (  32.63  )
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

Hi Sudeep,

On Thu, 21 May 2026 at 18:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > scmi_power_name_get() does not validate the domain number passed by the
> > external caller, which may lead to an out-of-bounds access.
> >
> > Fix this by returning "unknown" for invalid domains, like
> > scmi_reset_name_get() does.
> >
> > Fixes: 76a6550990e296a7 ("firmware: arm_scmi: add initial support for power protocol")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/firmware/arm_scmi/power.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
> > index 3aa84ceb6d2bab68..4a7215e02dec035d 100644
> > --- a/drivers/firmware/arm_scmi/power.c
> > +++ b/drivers/firmware/arm_scmi/power.c
> > @@ -204,8 +204,12 @@ scmi_power_name_get(const struct scmi_protocol_handle *ph,
> >                   u32 domain)
> >  {
> >       struct scmi_power_info *pi = ph->get_priv(ph);
> > -     struct power_dom_info *dom = pi->dom_info + domain;
> > +     struct power_dom_info *dom;
> > +
> > +     if (domain >= pi->num_domains)
> > +             return "unknown";
>
> The only user of this function must not call it for domain >= pi->num_domains.
> However, I am thinking if it is bit inconsistent within SCMI core now. I like
> the way pinmux/ctl handles this as I don't like the alternative for this
> (i.e. ERRPTR(-EINVAL or something)). Worst case if this ever causes issue
> we can change the signature of the scmi_{power,reset}_name_get to follow
> something like pinmux and update the users. Thoughts ? Happy to apply this
> for now.

You mean returning an int error code using return statements, and
returning the objects using passed function pointers?

Depends on the number of returned objects: if it's just one (e.g. a
name or info pointer), then the valid pointer/error pointer idiom is
very common in Linux.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

