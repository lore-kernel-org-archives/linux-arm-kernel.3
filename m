Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AADBF419B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcbF3rKrTIYUlxquwtwJBdRMB8TU6zntVRfT41or7CA=; b=nURTOXQ7xytlBOw1WhfG+057L1
	gE8ZHrDsBaXOw7apO0qaF6kJMuhvc4Fo9HpOVLh0F0IRkS2vg5Upsr4hc9gKrSre/Id28jqcoEFC5
	m0aXcNAXuaqosGRZafHylRStuL2FQgdlm94fVFM/uN3KOVvTv8FTp6po2Bhq6CX0EI3kPRnlZUZHZ
	C/HM7qJvnyQz9dUql6yTFs5o4Ok7GWScLTxofXA9cyWa+a21s4jG6W/5Pm5dGFkwoPS3RKy/vyEx9
	Eq9On8+OkMACfq1EsQJC1pzGGlU///Pe8E06lpKJqHqGLV+WCnxgzbqbZhgr0mZyFNGFomMMjj0mM
	E11/dkPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4CM-00000001Sra-2uxr;
	Wed, 15 Apr 2026 17:38:46 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4CJ-00000001Sqq-2QXN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 17:38:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso86249995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 10:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776274722; cv=none;
        d=google.com; s=arc-20240605;
        b=AdWq16W1xmexA5nvSxa0/tGHerJUbnTyZV51iQmGMYPupJA6YUKbQ5cLpzzf/RY12W
         P6x8XEILy1yZzGZsUYKyPx9BKG5i2RdYm1545ZKIVjXnzW3yTiyDEoBWXDcIuoZrcGnU
         Og+8cVR9ZrB9k240XRMJMZVmOs1u8HXURdZ3VTVt5s8AsZ0I8npwpJTcYRGvtsRUQutH
         ykvNa2xwxVZXVShAM/2HD1Gw3A18gipy11Hy1jE8uz38Sgn8TWVB3s/ud//A9utxDcHJ
         AJL5lYDcHLv2f9rXewF4dplGcvIj9NuSCClnLH4cKPRZyn8BIa1WIRrRowmE2cGOSlC2
         is6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zcbF3rKrTIYUlxquwtwJBdRMB8TU6zntVRfT41or7CA=;
        fh=wkFUhiVDK+EySmf+ixlpHGllhWEsAE+imvO0ifrv6sk=;
        b=km5Z+HboNDnf2lDb8scwzdy8mWXFZZ+51L/nNUwIKJIMpUWl6Prjw11QdfD7Lvsvt5
         tvqEjE4JIxK67Qz/lmtIO2OepPd3Y/xYYZYdv599ATDYZ2Ub/e+u0eLoIBgcxaKVqUAt
         IJp8ehjHmR87+teOTXblw1QPECNZzWrsRvmEdpxb8l+8ZFQh9wJptWGH23JpI5ks8B8d
         TqBptXkQWMQhCm+LTr8PdImJP8pi1Bd8cez/I59/FXWjzVAvbllnVrGrmG5jHxSWgBZe
         Fp5NLPQM8ttnDCe/XN/G3YJ5dkS7g4c8NDLnbdnK7rj1yXQ3c5jBKIYZajHFCZymckG9
         cvyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776274722; x=1776879522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcbF3rKrTIYUlxquwtwJBdRMB8TU6zntVRfT41or7CA=;
        b=OfpbyWsRNcWxcIHrDejPObeHLpafz8omQ1l9YKxIDbN7z1dP7DabWurDJId/0BuvTl
         NAvNVf0m4hFQqTI2Qg9Aaw6A+Y7B2t9xua4U10wJKDPOyVxnx+jBuhL668uWRXelNfXk
         JzABYTu8u7OQnomAhGfvMlIQLLDgKmeeqhf0Yh48/hSg+rGhJ2pNB6xsBUBgsQPEWtP7
         dr0gW4P216fW7tqfsL07KsIjSFMOkiEEFtINAohBxS1/Pkn4WrP/MvQpS1V++pv20wqX
         5g45O4Fi+ZyxKL2JtGvRW/94IiInTrn8T8KLbdnF+4pSeVDCvb5Mfb8nij8tHc2uvItE
         /DkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776274722; x=1776879522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcbF3rKrTIYUlxquwtwJBdRMB8TU6zntVRfT41or7CA=;
        b=RVB+nIO8hAKpZQHB5xxAF+CA+MrTEzfzRqwLr8BagzWwEtZ6IAYGzMLB5SNaZz+/2P
         XRoWc2AyDlE/sgH0nvuzVzydkoLoU/L6K8yf4gwo4qT+380tS0rH/TliOuoPDrRSO7vR
         J8OBmb3LosAwPflGt5ceLtuG1ijQoi0zIhuD6c+UB6no9B9vBf2uLVXNvgPI9HyHUB0a
         WudWeLcR9bcguw4ehKRJHMMCh58hpNtZi0fgdX59PRsKdoFdlaKXm3BIxz9gbqbRkTiq
         9A+Hqp0pvZNuL8YybrzVouKHj93Uy6cyAmIlI9DwmSRPqdHlnEeFoEFkw0DEQbNpWpmh
         qTTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EJsQF41R8lAtrsV5obPiI1kYrpwAYfyOqiJTauRcfY/ST6JDghjInSXFcYYhwniyvu5TkYrut+GDWu6d6akZU@lists.infradead.org
X-Gm-Message-State: AOJu0YxcYOFeWYvtrBUg7b2RA8MT2AOKy6KXAEtAj/hsOFx1Ihvj05Gx
	BRP5Q7utUItAycwoyd6Tq39OFeckDzD+bSnJeW12yTkcL3F0q1n/o4SiW3iIHBw9H0SMTmvN1sV
	XfOZ1QNdShqLJcTldC6cfozZz4GGwJwc=
X-Gm-Gg: AeBDievV2uoW1vCDQfJjczZELDAWBWj49X7/bGRA1MvSBI2Kamv7pkQOhxLXNC2MTxn
	KRABE3S4mGT/IKw7eVkfBNpmwGfEBIrJ7I2eiS3cSGfZs9zQe8k50CqhNtU+j3zljUjhtiLNoAA
	PFDNCAUlBo+dKnJPEULZco/rA/jSUtjvlPHRLlb7qylSVcDO7zZq46SRjNWhlha40qb/gtHgc24
	bqLM5D9ocWji4IrvJAK75ZbxdVjibKiDWY4wnr2AplXQIAYZLt4vpIoiBK3yYpNWiAQDwrhjL26
	E9GSN3U27VX46BszfgfqxOblwB+PImM33DUP5smvJ0DPLq0AKMw=
X-Received: by 2002:a05:600c:c0c9:b0:487:1826:d89b with SMTP id
 5b1f17b1804b1-488d67e262cmr213788065e9.9.1776274721328; Wed, 15 Apr 2026
 10:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org> <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk> <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
 <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com> <ad-ID2WaPgPJqdsa@shell.armlinux.org.uk>
In-Reply-To: <ad-ID2WaPgPJqdsa@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Wed, 15 Apr 2026 10:38:29 -0700
X-Gm-Features: AQROBzAqIK7tccp5Nve5YPfldbVfMbcjsC1bB4J1LveWBztJraYfNbIwTcXSd7s
Message-ID: <CAH5Ym4jKdzDeYwCfkMLmUz0FsiD2vFwfuAvqFE=uvMtPmakeMQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Linux Network Development Mailing List <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_103843_677777_9A307B5C 
X-CRM114-Status: GOOD (  34.71  )
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

On Wed, Apr 15, 2026 at 5:44=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Apr 14, 2026 at 07:12:34PM -0700, Sam Edwards wrote:
> > On Tue, Apr 14, 2026 at 6:19=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > Okay, just a quick note to say that nvidia's 5.10.216-tegra kernel
> > > survives iperf3 -c -R to the imx6.
> >
> > Hi Russell,
> >
> > Aw, you beat me to it! I was about to report that 5.10.104-tegra is
> > unaffected. And my iperf3 server is a multi-GbE amd64 machine.
> >
> > > Dumping the registers and comparing, and then forcing the RQS and TQS
> > > values to 0x23 (+1 =3D 36, *256 =3D 9216 bytes) and 0x8f (+1 =3D 144,
> > > *256 =3D 36864 ytes) respectively seems to solve the problem. Under
> > > net-next, these both end up being 0xff (+1 =3D 256, *256 =3D 65536 by=
tes.)
> > > Suspiciously, 36 * 4 =3D 144, and I also see that this kernel program=
s
> > > all four of the MTL receive operation mode registers, but only the
> > > first MTL transmit operation mode register. However, DMA channels 1-3
> > > aren't initialised.
> >
> > Wow, great! I wonder if the problem is that the MTL FIFOs are smaller
> > than that, so when the DMA suffers a momentary hiccup, the FIFOs are
> > allowed to overflow, putting the hardware in a bad state.
> >
> > Though I suspect this is only half of the problem: do you still see
> > RBUs? Everything you've shared so far suggests the DMA failures are
> > _not_ because the rx ring is drying up.
>
> Yes. Note that RBUs will happen not because of DMA failures, but if
> the kernel fails to keep up with the packet rate. RBU means "we read
> the next descriptor, and it wasn't owned by hardware".

Are you speaking from observation, documentation, or understanding?
I'd define RBU the same way, but you reported:

```
[   55.766199] dwc-eth-dwmac 2490000.ethernet eth0: q0: receive buffer
unavailable: cur_rx=3D309 dirty_rx=3D309 last_cur_rx=3D245
last_cur_rx_post=3D309 last_dirty_rx=3D245 count=3D64 budget=3D64

cur_rx =3D=3D dirty_rx _should_ mean that we fully refilled the ring. [...]
[...]
Every ring entry contains the same RDES3 value, so it really is
completely full at the point RBU fires (bit 31 clear means software
owns the descriptor, and it's basically saying first/last segment,
RDES1 valid, buffer 1 length of 1518.
```

It would seem* that the kernel isn't really failing to keep up with
the packet rate. If RBU is firing with a ring that's not even close to
empty, that tells me there's another way for it to fire. So I suspect
the hardware designers implemented it to mean:
"We couldn't read the next descriptor, _or_ it wasn't owned by hardware."

(* However, if bit 31 is clear everywhere, wouldn't that mean the ring
is actually completely depleted, not full? If count=3D=3Dbudget, wouldn't
that mean the whole ring hasn't been visited, so we only refilled 64
entries and not necessarily the entire ring? Maybe the kernel isn't
keeping up after all.)

> That has:
>
>         const nveu32_t rx_fifo_sz[2U][OSI_EQOS_MAX_NUM_QUEUES] =3D {
>                 { FIFO_SZ(9U), FIFO_SZ(9U), FIFO_SZ(9U), FIFO_SZ(9U),
>                   FIFO_SZ(1U), FIFO_SZ(1U), FIFO_SZ(1U), FIFO_SZ(1U) },
>                 { FIFO_SZ(36U), FIFO_SZ(2U), FIFO_SZ(2U), FIFO_SZ(2U),
>                   FIFO_SZ(2U), FIFO_SZ(2U), FIFO_SZ(2U), FIFO_SZ(16U) },
>         };
>         const nveu32_t tx_fifo_sz[2U][OSI_EQOS_MAX_NUM_QUEUES] =3D {
>                 { FIFO_SZ(9U), FIFO_SZ(9U), FIFO_SZ(9U), FIFO_SZ(9U),
>                   FIFO_SZ(1U), FIFO_SZ(1U), FIFO_SZ(1U), FIFO_SZ(1U) },
>                 { FIFO_SZ(8U), FIFO_SZ(8U), FIFO_SZ(8U), FIFO_SZ(8U),
>                   FIFO_SZ(8U), FIFO_SZ(8U), FIFO_SZ(8U), FIFO_SZ(8U) },
>         };
>
> where each of those values is the RQS/TQS value to use in KiB:
>
> #define FIFO_SZ(x)              ((((x) * 1024U) / 256U) - 1U)
>
> This doesn't correspond with the values I'm seeing programmed into
> the hardware under the 5.10.216-tegra kernel. I'm seeing TQS =3D 143
> (36KiB), and RQS =3D 35 (9KiB). Yes, these values exist in the tables
> above from a quick look, but they're not in the right place!

True, but:
a) I doubt 5.10.216-tegra includes exactly the same version of the
driver found in this random GitHub mirror. (My intent was only to
point out that they don't use 5.10's stmmac; I should have been more
clear that I wasn't trying to link the same version, sorry!)
b) This is vendor code; I don't know how good their testing/review
process is. It might not run the way it looks. The intent seems to be
for RQS > TQS (which makes intuitive sense), but as you're seeing the
registers programmed the other way 'round, they might have gotten them
subtly mixed up.

> Now, as for FIFO sizes, if we sum up all the entries, then we
> get:
>
> SUM(rx_fifo_size[0][]) =3D 60KiB
> SUM(rx_fifo_size[1][]) =3D 64KiB
> SUM(tx_fifo_size[0][]) =3D 60KiB
> SUM(tx_fifo_size[1][]) =3D 64KiB

I follow the math with 64KiB, but surely the 60KiB should be
9+9+9+9+1+1+1+1=3D40KiB? This seems to me that the "legacy EQOS" simply
shifts with smaller FIFOs. Since dwmac is licensed as a soft IP core,
perhaps the FIFO size is an elaboration parameter? That would mean
this isn't an issue with dwmac 5.0 broadly, but with Nvidia's specific
instantiation of it.

