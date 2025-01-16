Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A7DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnZJOy5bzgvezrncP1A73JI9x0GgO7ui8qp7tf7OJkU=; b=fvaCQbpDSNRqMeUW0i1uZS1+x7
	rBBmUg49/Bglkb3xo2T5hCKfozYGluxnDswW+x4akgOcImku1Jj38NdC5tNkNqMkFZw1D0F7qabuY
	HftqpoJ4KB/63wFL1WceI+pm2zpyK2lxyDQs8GNuCEdK1XmGhvT+UwLv5iAXPmBX6JaeG0CCXWCCY
	tgQEWgsGUVN/J/RafusoBuJziKw67IZJq+RlSmhSIqw59R8db0NqL2STa74eWRrJB99lH7DP2MJP+
	yUI76dLq3/Jun0x+8fza2voQIt0jE0RM6wOArAA/7vcXofV97GT6o0HahW6xsz1PMmiT66ssc+9Es
	4b4P2JlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPkL-0000000EzTg-2b4J;
	Thu, 16 Jan 2025 13:17:17 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPi0-0000000Eyxq-1QQB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 13:14:54 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-3ncg.prod.antispam.mailspamprotection.com; s=arckey; t=1737033286;
	 b=J9U7PbTLwFKebIPikCu34ZlfNzeJkC0KIGUjQ52mX6M51efi5BeT5glfNesFqlmSAY+xHk0dM8
	  Lx0/iZM6LjBOMnvHoNpGqxB30XAmoMwkRXVMSeMfjEEf0CwDIQn5o1801WwyIWJBjOES/L0XQ6
	  Wpfxa5hD3BEjWLy7+RRqmxWhT6TNyuhyS9PlpNASm+rustqVWbdLenAKnw0bm3SAMZa12W0oRa
	  2RbJFdtQqcSNSSxQrBlwf9zETrQoU6r1yBH3Zih97nd1AP1EkkOE1m/bLhtB9ChhdRmth8janr
	  aco/lHuYHZOvGG0ujQcdmHhA3HKLIqYa4lTfSwKFuM8lkA==;
ARC-Authentication-Results: i=1; instance-europe-west4-3ncg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-3ncg.prod.antispam.mailspamprotection.com; s=arckey; t=1737033286;
	bh=y+b3MbpKg998YOh+8hcaheF9u7y8tE6HmG7mjeRFtBY=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=jJdHk9uXOMh0yPj2v10sj5aEv8JhExX5VE1XN42dBvM+gpYzVCzZsiL3cmBNT9Y9WKtCHTyfAP
	  SjmwmSJNXo5KUfRFk3LS4zGr2znyqvQV6JT0aAGJjMxiL8cOYwJbjWvz48YQGhGhOk33n3orKP
	  +Uiu25LGHZMcvZMtyyuIiucPaQo7I6yskRKKQBkVz13VKTny1uqsARSN1felxS+ai5swzqvwrk
	  1BPzw2vKSOAMxV8Ll0iBAYPa6M6HRbdUu9Oz+GHydaVUmu2z0f2BiLPfuh8Ia7q9AJBjjAg5Wp
	  6wVuWGGJla4NWFNn9ALyZv1LB9lyCVWRblR8s85jBj6Pow==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-3ncg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tYPhq-00000006cgd-3s4W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 13:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=wnZJOy5bzgvezrncP1A73JI9x0GgO7ui8qp7tf7OJkU=; b=ISBMi7glIZ6eFqNatQjoacEMZX
	tM0pxX8pVT0Ke9SkPUKx9TGCnxrQQf7jAkvXDKXczHJLHAxHOLdR9dl6RVE9fIvx+/XBrwcJTGopb
	wt7VUfrM+YQCekEmHcnB0IRybiMiN9VN+e92SHKJURYgN1Plv+CSW0SBA0ExacCpfvh0=;
Received: from [62.18.83.152] (port=39313 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tYPhl-00000000Ee2-2BHZ;
	Thu, 16 Jan 2025 13:14:37 +0000
From: Francesco Valla <francesco@valla.it>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Roger Quadros <rogerq@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH] bus: ti-sysc: mark AM62 wkup_uart0 as non deferrable
Date: Thu, 16 Jan 2025 14:14:37 +0100
Message-ID: <2726767.vuYhMxLoTh@fedora>
In-Reply-To: <25491f79-323b-421f-8053-36d5655e5323@kernel.org>
References: <20250109175211.113945-2-francesco@valla.it>
 <25491f79-323b-421f-8053-36d5655e5323@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: b6979164dfa1cbddae9cf1442aae5329
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-3ncg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_051452_563921_8B4E91DE 
X-CRM114-Status: GOOD (  25.36  )
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

Hello Roger,

On Monday, 13 January 2025 at 19:08:43 Roger Quadros <rogerq@kernel.org> wrote:
> 
> On 09/01/2025 19:52, Francesco Valla wrote:
> > The ti-sysc driver implements a probe deferral logic to be sure to probe
> > the parent interconnects before their children, postponing the probe of
> > interconnects not marked as "early" instances until one of these is
> > found.
> > 
> > Since the driver is alse used for the wkup_uart0 block found on the AM62
> 
> alse/also
> 

Noted.

> > SoC, but not for other devices on the same platform, this logic forces
> > the probe for it to be artificially deferred 10 times and can lead to
> > the device not being probed at all. The missed probe was seen on a
> > BeaglePlay with the kernel configuration stripped to bare minimum and
> > no module support.
> > 
> > Add the ranges for wkup_uart0 to the list of "early" interconnect
> > instances, forcing the driver to skip the defer logic entirely for this
> > device.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/bus/ti-sysc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> > index f67b927ae4ca..917b7168fbd0 100644
> > --- a/drivers/bus/ti-sysc.c
> > +++ b/drivers/bus/ti-sysc.c
> > @@ -687,6 +687,8 @@ static struct resource early_bus_ranges[] = {
> >  	{ .start = 0x4a300000, .end = 0x4a300000 + 0x30000,  },
> >  	/* omap5 and dra7 l4_wkup without dra7 dcan segment */
> >  	{ .start = 0x4ae00000, .end = 0x4ae00000 + 0x30000,  },
> > +	/* am62 wkup_uart0 */
> > +	{ .start = 0x2b300000, .end = 0x2b300000 + 0x100000, },
> >  };
> >  
> >  static atomic_t sysc_defer = ATOMIC_INIT(10);
> 
> While this is probably OK for now, we need to ensure that sysc_defer_non_critical()
> is not called for such devices that don't have an interconnect managed by
> the sysc driver (i.e. non OMAP based systems).
> 
> Maybe this calls for a new compatible for AM62 sysc?
> 

A new compatible would be better in my opinion, but I didn't want to introduce
too much change at once. However, if you also see it more appropriate, I'll send
a different patch set with the new compatible plus the required devicetree
modifications. 

> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> 

Thank you

Kind regards,
Francesco





