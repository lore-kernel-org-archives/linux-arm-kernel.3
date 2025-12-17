Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F09AD6407A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WB9IDMyF7C6rUTb7bWFFG4m+8S18M2qqzE6q3X6CiU=; b=1FpLynWKRl3xo+wu/JDeoG3Bcu
	3TaOV6jg07WSB4j2GypjIQaNJVuVUB4Q9yUJL1j8gjdGWu1NiSyzgn+2VDvPnpZSvCiT/VXpsKvSY
	HhPAx/V7bk8OzP9fNwaY9AhcolVWWfK+Ws8fCv3NagK6XKbrypqHeElSaTvzkVcG5pq7jH8EmGBVd
	GnzOPLi3NbACOUQG9f8vRcuYeIG1olsbjah2l+gmOeHEjkgKsxtB30bhs4waUcu26tV7hWJ9V2Qt8
	enYVcFp4aVhTqn7LaPy/zIWywjKpCmsMXOAom2/wVwlSivvPelXp5l3aNnes5hvQusQLWFufpiBIp
	r8UkqqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVr3S-00000006ovE-3XAW;
	Wed, 17 Dec 2025 12:54:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVr3Q-00000006ouU-2NQj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 12:54:57 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so6125720b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 04:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765976094; x=1766580894; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WB9IDMyF7C6rUTb7bWFFG4m+8S18M2qqzE6q3X6CiU=;
        b=LPsox6mSq99uOatfJUSD/4uQBuQTeDfzCT/MiouMjUMqLt8Y/UXwWXww+c6nFCervY
         JNPgZyGIsosPEI5WVHM2QWxdxN9EBFYLeKlSqxecxzUrO60kzuR34/Elvb8XOg8qSRvW
         C0Lh2NzUWssSYCmpaiGyFRtQ/Z98hml1cmTL2DtF/h47EiVDSPlGTo5ZbpWekx9rxGJR
         6b1uSmRg2e/d6VMWRv3bjbtdm0GKGe88S5+pBEgaQOoWbyRteB95d8fCEKEAngPbM3tN
         YwG+NNbzWXfSla0ZWi6kjMLcKItAzY0ApxD31qrAUIxpFRxMxe3HzHV+yvfJxI7RGqkl
         U0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976094; x=1766580894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1WB9IDMyF7C6rUTb7bWFFG4m+8S18M2qqzE6q3X6CiU=;
        b=HVnw+J5WUNkIo/zFnjr0qLMu47Zj5ZoocKqq5F9MKHA35QHeeriRY/4f55lAomuE1L
         BTPfKV99wPxrOgEF9XWkr8ARlReuR6cHp4LPYpl9avjLUBrUOQq+DlYSD76OieOmXxeb
         uVRmcE/7UPoWiBxL9eqXSX3+8nk6J9CDC0BGxAKZqaksSDo1xRWDKQ8gNQP49SSeKXxX
         Hupx+5oqI8LRPpR3+QmpmqSF1PaCz4CwdapGEDQALNx/fGSrErpMBUAOAPR2p25bTYn9
         DNqSDarGkppVVGTfrsf0OQI94mzMCoumk6VCBAMF2IW9/cCApdIWq9+WPC9kuTRbCZJ0
         un0g==
X-Forwarded-Encrypted: i=1; AJvYcCXtZyY5GrT5Kkiz/l6dh6hCbtDg/RggC7OmUBoJuIwug5//i0sO4NYsKVhx/R9ubhLmqt4RQAwRXZ/anmD0PKpw@lists.infradead.org
X-Gm-Message-State: AOJu0YxYy2KAJWvGpW3wVRXXW3p1OtySdEO/Uh1ZTIStOjiRyJ0Qck9a
	z5q5w5dyyQg8NgQxim15G5Xx+9QsC6P0bS3bp8bv6+eIzzdnyi3TBozK37nmrZvh8y9wEkSPsDW
	vXfX+mqpUwHauy9cGzWY0+NfqL7PM1xkypplU
X-Gm-Gg: AY/fxX6Hu4y4OUI+1KeOvgEg7yA2pQjlPpovNIzKDOIrPDC6ml2WXQlDsqmfC5bRilE
	cqmo4RU5OXRaTZGIzIu9QYETi9jqaO7wbM0rJFG/f7lXB11fuqUO6+JnTimVtLofJ2KcA/madFT
	D7CucNdCtJSiQtbe+SnhjvszS9Bp29jKd2qZWsx8vhDzAXCqUIh0rYYnmt6VYjFTl/QvoPHsIe8
	9IBTpYBF6iXM1a1FR+4cRQDRjIdnGUNUDl4Tc5i9Vwj6fLUG4FoIOcDPGDWCDC2dv9DUAUrnOq5
	5sr30PoDua2L5XDIRkHkJc9mFbegMEAqXmv+y7xvJ/1ARWRdnFDLxt5R2Y/wgiLtmN1YJ5B5W0t
	IyJNsqT2/+w==
X-Google-Smtp-Source: AGHT+IFCVxVZKfQazz0Hf+zlDf4DPsGc7oERAwp/C9jL/RfYpJUNkkyKQjqWAoT+yyXwjrVLjDdhD4cpWBi7QA+Z/RI=
X-Received: by 2002:a05:7022:4393:b0:119:e569:fb96 with SMTP id
 a92af1059eb24-11f354776a3mr16162731c88.5.1765976094025; Wed, 17 Dec 2025
 04:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20251210154906.99210-1-daniel.baluta@nxp.com> <aUHZaapZ1IAs_mRE@p14s>
In-Reply-To: <aUHZaapZ1IAs_mRE@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 17 Dec 2025 14:57:24 +0200
X-Gm-Features: AQt7F2pCrjbzUdKtcqyy6UJ2W0Ki6ZTb9uglvOiXJFQ03JP1g08LOHMbnAHpvt0
Message-ID: <CAEnQRZC0WU+MGfZ5z3yJCz==MBCcFG4BUwNs2v1ABOMkiRbPrw@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Fix multiple start/stop operations
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org, m.szyprowski@samsung.com, 
	shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com, 
	arnaud.pouliquen@foss.st.com, robh@kernel.org, geert+renesas@glider.be, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_045456_643963_9A815DF6 
X-CRM114-Status: GOOD (  31.30  )
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

On Wed, Dec 17, 2025 at 12:13=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good day,
>
> On Wed, Dec 10, 2025 at 05:49:06PM +0200, Daniel Baluta wrote:
> > After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> > functions for "memory-region"") following commands with
> > imx-dsp-rproc started to fail:
> >
> > $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> > $ echo start > /sys/class/remoteproc/remoteproc0/state
> > $ echo stop > /sys/class/remoteproc/remoteproc0/state
> > $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> > -sh: echo: write error: Device or resource busy
> >
> > This happens because aforementioned commit replaced devm_ioremap_wc wit=
h
> > devm_ioremap_resource_wc which will "reserve" the memory region with th=
e
> > first start and then will fail at the second start if the memory
> > region is already reserved.
> >
> > Even partially reverting the faulty commit won't fix the
> > underlying issue because we map the address in prepare() but we never
> > unmap it at unprepare(), so we will keep leaking memory regions.
> >
> > So, lets use alloc() and release() callbacks for memory carveout
> > handling. This will nicely map() the memory region at prepare() time
> > and unmap() it at unprepare().
> >
> > Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* function=
s for "memory-region"")
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> > Changes since v1:
> >  * https://lore.kernel.org/imx/091a4f29-5435-428a-9a1c-ef82465211cb@nxp=
.com/T/#t
> >  * took a different approach and instead of partially reverting the
> >   faulty patch, used alloc() and release() callbacks to handle memory
> >   region mapping.
> >  drivers/remoteproc/imx_dsp_rproc.c | 50 ++++++++++++++++++++----------
> >  1 file changed, 33 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 5130a35214c9..83468558e634 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -644,6 +644,32 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp=
_rproc *priv)
> >       mbox_free_channel(priv->rxdb_ch);
> >  }
> >
> > +static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> > +                                struct rproc_mem_entry *mem)
> > +{
> > +     struct device *dev =3D rproc->dev.parent;
> > +     void *va;
> > +
> > +     va =3D ioremap_wc(mem->dma, mem->len);
> > +     if (!va) {
> > +             dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> > +                     &mem->dma, mem->len);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     mem->va =3D va;
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> > +                                  struct rproc_mem_entry *mem)
> > +{
> > +     iounmap(mem->va);
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * imx_dsp_rproc_add_carveout() - request mailbox channels
> >   * @priv: private data pointer
> > @@ -659,7 +685,6 @@ static int imx_dsp_rproc_add_carveout(struct imx_ds=
p_rproc *priv)
> >       struct device *dev =3D rproc->dev.parent;
> >       struct device_node *np =3D dev->of_node;
> >       struct rproc_mem_entry *mem;
> > -     void __iomem *cpu_addr;
> >       int a, i =3D 0;
> >       u64 da;
> >
> > @@ -673,15 +698,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_=
dsp_rproc *priv)
> >               if (imx_dsp_rproc_sys_to_da(priv, att->sa, att->size, &da=
))
> >                       return -EINVAL;
> >
> > -             cpu_addr =3D devm_ioremap_wc(dev, att->sa, att->size);
> > -             if (!cpu_addr) {
> > -                     dev_err(dev, "failed to map memory %p\n", &att->s=
a);
> > -                     return -ENOMEM;
> > -             }
> > -
> >               /* Register memory region */
> > -             mem =3D rproc_mem_entry_init(dev, (void __force *)cpu_add=
r, (dma_addr_t)att->sa,
> > -                                        att->size, da, NULL, NULL, "ds=
p_mem");
> > +             mem =3D rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->=
sa,
> > +                                        att->size, da, imx_dsp_rproc_m=
em_alloc,
> > +                                        imx_dsp_rproc_mem_release, "ds=
p_mem");
>
> Was there a reason you kept those here rather than moving them to probe()=
 as
> Iuliana suggested?  Note that I would be fine with this solution since th=
is is
> how it was before, but if we have to go through a refactoring we may as w=
ell
> take those things into account.

Tried moving imx_dsp_rproc_add_carveout at probe() time but it doesn't work
because stop() will clean the carveout list and then the next start() will =
fail.

at probe()
imx_dsp_rproc_add_carveout
-> rproc_add_carveout (adds allocated carveout to the list).

at start():
   -> first start OK

at stop()
   -> rproc_shutdown
       -> rproc_stop
       -> rproc_resource_cleanup ;//cleans up careveout allocations

at next start()
     -> CRASH

