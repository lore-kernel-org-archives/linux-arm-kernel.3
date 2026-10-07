Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39C6CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 17:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZbURIN7PUtX8kqOYTTPfURjX3hnAcmDB9GNBxJTsiE=; b=bx3dhHet1iUv/Syf+NEGoLRHfC
	vyRMlYrbtMUtUIa3T7YnulaLK13gP9jF74tSIPHrjUI7vwqx+3IgGHxlEK/3YLefV6BmOU5ijTD1s
	rComuzn3wkZA0VbOh2WYDY3P2FEsL+scIGDoMgH3fXB+QTgZyQuu2Is6uRM9/8Qy8i0Fz4MchwTw9
	XgfI9IcSfJEXTDve9D1DuJDrVl/wosK/Z0JhfiE9heg3tI+qYry77jR9jERofT3KPd2BrUZckGGgr
	pkWpNXP6xRWg2JCrD+fZrYa/OJZWBQWhLhPKk1CPWrr4UAKf8IjMX95kFrgQOPU3uBRj7L/3C7GBW
	p0rmeB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEV10-00000002n5D-177z;
	Wed, 07 Oct 2026 17:01:14 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEV0w-00000002n4D-1qSh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 17:01:12 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-7855bfd6ab6so182862137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 10:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791392466; cv=none;
        d=google.com; s=arc-20260327;
        b=WBIMOROYtRsb4Gdi1dpl3wXbOK7w0zTfjvxmEVZY+W4OuOhrTQKi/CEJtlCFRMyofv
         ZiILitoI1w7M+3TK5ozPUNVlW6mTWPy/1nwgRAUWdhKZ+pibzz2kXxBwMMgQ95uwvhU4
         S1HB5XEZRuR595X5F9FCGsN5x13eOsoe1hMJ4NuGcMad9O7OmvqvPLd/NdvJhIKydkbw
         3XEYMILFxqPZMLShfhJZKibQxf4TnjOLBiz8XpFq3Dp8mmQjYpX/R8MnMJTFPx1UEId3
         21ONFkOSqif5KSekMul/XazwTdco5TaSyVT9FwfbXhKxdiErbGliI9YigGsdlAPTOVfp
         ptfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZbURIN7PUtX8kqOYTTPfURjX3hnAcmDB9GNBxJTsiE=;
        fh=0dh+gQG4XMeaJ8QkPwCcIXWX3z2TetaUOombIevEWho=;
        b=OOjsnDc/vu/kp+a5jTaDboAgjzZKLkjam8tqZOen9CXSpdPUjIa4YFSjkbdMYnyKsM
         Ww95b9H1CaMwt418IoBroilh6+1tvpHRubry2yBVR+CzUJXhYOTYSqybbfF7qgKmNjWs
         HsrevVH6uphrxDxaqGSvAtw/y/4V15/ompcTlGn/KqHg9mwDSX3BSEGZh6CNBJHXtPY5
         tWuRvk3M1F65mVewoVywYIopyQTBnbfusF45fdlkj1X0GZ1qhsW6bTbivpSs1ngO+5pO
         g/WS0y3mwAhPEBbZUm8+L5WWRNYi2fu7FbWIDI7nWfdQ7J1E9tR/LEt0FpFQAz/l2xnQ
         HGRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392466; x=1791997266; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZbURIN7PUtX8kqOYTTPfURjX3hnAcmDB9GNBxJTsiE=;
        b=I+5KnHnFZDQxQn+mvcGvL7aGqw1vWtEGOj3E5/o7RT58OCnYMtx+WTiHDvWq4cYmK3
         PFCSXEe5ztauovadZP9dVPzaoneEqzrkCaEu0GTOW1d6BPQ9GTFg5NiQyybh9FfPuuj3
         3+bjVwTRW5CbPFzXtv/wIKkzYftJBp/T/FQLT6wtFXf86NmLdEAD4qWEErClIqn72Ai8
         Wx4DYiDbYgyVxf5wD6XKgj8J4Ue/+EIfjfBZFLa0dhBZONY2f6Yk45lJuXzXTJvCP5jQ
         UhE44Pclob2GZY5zhDlMCiWTNRw0sUOlGtvmsvKVowgOx56zCBVw45CID4bDGlHhs9eK
         f6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392466; x=1791997266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZbURIN7PUtX8kqOYTTPfURjX3hnAcmDB9GNBxJTsiE=;
        b=koIjM0/OivIDIjA1PpLlB/Q7evRmMqZ1ooMCGc9sz+14wapbO+EJaXnIH89sSpOZl6
         QIGFWW+f7fyZ7zTxg8CxzUxFESFu6hFkDR/7QMxB5E1awmtQ9IUfC1BpdD8h5gWzu2cj
         hmeo2XnoggXp/KxTEMxmSmk7xqA8eDW83/uXYPLEwVNJgLvhkTFnNT0+9u/rRr207YwE
         l6bNWT6b89H+nMEfD4ch/MMM8plBuhnrTcIIL4M87ihJt8741Wi7W9fuJDsUdM+uXla0
         3m6WrFB6QR03K29JKFzUoXbCMXY+4UF0mPM1iLVit4DxmdNZXGEZkC1fJa3ZgTlNmnik
         edaA==
X-Forwarded-Encrypted: i=1; AKwUvBwJFmUQBrsaY8cpAM4o6XDZzhnnlmnx6Oi0339ZrvkUlu6oOSactxEGTspaa2D12jx0WJvWJUy23f0ebkcC8QCQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKaGm+baRfYWgcgjsUvtdslAqrJd5nhElA8O7dkxCjMlBXI+cmB
	tVChe3iGOD14ehTMMqlq8Pjwi/OYOi4HhabkqEotJtP7rAE+AGy4wY/ooutxTMKxBAXDdvyDkoZ
	blLucBNnegecC6gaFsjh22idur2AZ7qo=
X-Gm-Gg: AYBFou1fFqJ5y2rL4cECHTbD2tO5SkYMSJATb+cbRX3e6Crn9KppHYdk9SjVzFDLZpk
	NjFQwwQV6Eg1txipsmUuxhW6DnXa6KkRiGWJYv+L0/56PyJMTzE90QPusv4aYbgKAeKfqld5nGV
	rU6EcBZjx1CTyRARXgmyKSmUL+D42VNmnJtxXRn9C4FkotA8VJwXFT4zqz1Mz3YSH8KemZ3DfUq
	3AJb35KQ5PHgW91reszfrDdI/V0ab/TOjb8k40KaGaCcJurLE4Y6Tp95ebLiIDk8PfkBaEP9T+e
	81AywPq5iuWAQ6ZzzJCTc1hn3kRD5f/TJjQ3hxfTTl3ek/qGm6uFklKBBGtxdOfjqVWZNu6vaQM
	drXTEdTJ2hMvRn6rVITD7aVdmeuaCYmMbl5hRSupIAZUhcRi7OIpAZjXfYNthMxr4r0sswij3kr
	f1t4JUWWTO2/34fj9t14I10d8XqBp/2t9dZ/uoZ0LW25by
X-Received: by 2002:a05:6102:441a:b0:7c3:a175:b3a4 with SMTP id
 ada2fe7eead31-7ca38e242e0mr699581137.36.1791392466173; Wed, 07 Oct 2026
 10:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org> <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org> <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
 <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch> <CADvTj4pm8fbgGDiyXVHubnM93qOey7o18O+MDU68MSisXVvHtw@mail.gmail.com>
 <f304ee6d-bbc2-4f76-964a-998c3febb8dc@lunn.ch>
In-Reply-To: <f304ee6d-bbc2-4f76-964a-998c3febb8dc@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 7 Oct 2026 11:00:50 -0600
X-Gm-Features: AclHuK_jUgMdUcYYqpUGuap2SPkyQESAVUFApu-SDG6nwRRhv-n0wwBC2Dl8Id8
Message-ID: <CADvTj4pniuLUzsHP_kv03rFUkUD87PD9yVZ=HnW0CsZX78OxLQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_100110_601939_729055FE 
X-CRM114-Status: GOOD (  25.25  )
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

On Wed, Oct 7, 2026 at 6:46=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Oct 06, 2026 at 07:27:05PM -0600, James Hilliard wrote:
> > On Tue, Oct 6, 2026 at 6:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Tue, Oct 06, 2026 at 05:17:20PM -0600, James Hilliard wrote:
> > > > On Tue, Oct 6, 2026 at 4:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.=
org> wrote:
> > > > >
> > > > > On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > > > > > Please do not repost the series just to address the above. In=
stead,
> > > > > > > reply to this email with the missing information, so that rev=
iewers
> > > > > > > can take it into account. If the series needs another revisio=
n for
> > > > > > > other reasons, please include the information in the commit m=
essages
> > > > > > > then.
> > > > >
> > > > > Please make sure you read this paragraph, to the end.
> > > >
> > > > How much detail should I be including?
> > >
> > > We want to decide should the patch go to net, because it is a real
> > > problem which bothers somebody. Or is it a theoretical problem which
> > > will never happen, so we might want net-next, or maybe /dev/null.
> >
> > I mean, it's in an error handling pathway that could be hit if there's
> > an -ENOMEM error on an IRQ-action allocation.
>
> ENOMEM does not happen for small allocations.
>
> https://lwn.net/Articles/627419/
>
> So at first glance, this seems totally theoretical, it will never
> happen. So net-next, no need for a Fixes tag, etc.

It looks like there might be a few other ways to hit this cleanup pathway,
not sure how plausible this is in practice however.

The unwind also handles other request_irq() failures. With forced IRQ
threading, including PREEMPT_RT, creating the safety IRQ thread can
return -EINTR if the task opening the interface receives a fatal signal
while waiting in kthread_create(). That reaches the same incorrect
cleanup without an allocation failure.

>
>         Andrew

