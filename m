Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66F1CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6XnmoS9y/QjExQSUhzgtUPy4+P7HWebJCxAjmxqDoI=; b=WJmVpT9XW6vKmA8AkeFbLYrChl
	uw0AslzXPwM1foRxjrDDs1cPxXG6L9bo4LxhAdehF/bK1KhcTrzMjvgZubKCQq7MPmiDUtgx01/nA
	bwEg+syGcNbuXykO9PHgKOLTBz1uQzGV7Rumfd0uhRvG1nywZE55wLkxqlOQyvsoC9WJ+xpRApttA
	P8j6nFi6D/ea2eq/pptUz5w+rzHJK0/icbr6OQbfTGWpytyftNApGZf1uTToSyMSgGvMkXBJmnQiG
	iKZkSHg/xN16QNwIb9egRLrcRVbNojofWWV9wJYQjPb151UJPE+C7dK7YVje3vookl8Vl11kXjjMs
	8vzulsmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkvQ-00000003gXV-2tTl;
	Wed, 19 Nov 2025 16:20:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkvK-00000003gWZ-45Iq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763569249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6XnmoS9y/QjExQSUhzgtUPy4+P7HWebJCxAjmxqDoI=;
	b=ZdTnngds5WHPXonCpDbfiQnwnIgSSt1hH8rsLFB3l+ae6TnBlpZwk9MTrV9WS1pXhEdDak
	4cjVueWwdGbX4rfx84u5PfPW4UE+KQagA2mmkOsqtGohLEe+SeoN2esAjOIEfFQyL1FoDk
	/uFooaDfQJtZBK3K3qjRrJ6lbplCoho=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-BeyZvB6_PjCEAHcVYM2CsA-1; Wed, 19 Nov 2025 11:19:17 -0500
X-MC-Unique: BeyZvB6_PjCEAHcVYM2CsA-1
X-Mimecast-MFC-AGG-ID: BeyZvB6_PjCEAHcVYM2CsA_1763569157
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b233e206ddso1853014185a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569157; x=1764173957;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6XnmoS9y/QjExQSUhzgtUPy4+P7HWebJCxAjmxqDoI=;
        b=PBg38ruN4NeIowDUatPwGNOUv7uK7qXHc+N8PLsMpDG+oRN4H02W3nu2gc2ak2+h0g
         KhlW7qz0QMRTltQdnnRiQgWdQajs4HAR6/5zumh1jqZ56peHLR7AFpJOJQKhvhPINjGl
         fuwV4nVZq97xdAf9iGmd4hX0RhAMLNCBD+SYFzSFyDl39g4DPnezEJAXHRH7tRyIuB8o
         J7dUKeFrxLLDyR1ER+8Pe+Jh8Oq6imysaKPBr3cBTzErIeb1rAr/RMefjUOFa5T7hAEc
         fhtg8qt/8Emju0xRAm6nFXwaSjepbxJ2IoQ7hWD1ujHoLz8cneaPXpytNNiZlHrN5RNE
         maPg==
X-Forwarded-Encrypted: i=1; AJvYcCVuL8NWuVF9ZNrcLT8V+mqIvgKFxnwk5E0WFYKoxzcL05wW9DXdtUyJoecSC7q8dpMRuWe346BPSaQTweLb5qh7@lists.infradead.org
X-Gm-Message-State: AOJu0YyXxBq5KeJNcwsg4bAdFeYgkINKFvm1/3QZ+q6IBybiFC5ZYr+E
	DVFdegbhZpUN57rWJpyH7VAkkpXnf5+RpUuMjkgGJvi9jVzPlq9Y1dkkT2dIEI2KI0gT4Yh3MKO
	EbJ3btIweOv4tbjGnOkopo1FsqgKPnH8CpM7pF2FVKvk/zRuZ0EFEOS4PzCLKlG1giOLlxe5rNA
	1c
X-Gm-Gg: ASbGncuwhIlsFgr+ML/AvIvP/pC252E2qmJCsyMIGcURL8tq5JncpWYrWhyIdQbCKqo
	Nkmlws9IIXzDOrmgsOKJx8NjfuyP305nf00pxVWcEBlth+seTr/Js1iQ+Iwno97AZ2P2MjDFhg/
	anLC6EHdAFdqbvxhpkXqJ80INaxUvdbqQPgrZs4JOsvhhx75jtD6JaxyuUb67fYcdDaQIFyfDmM
	KN3LCG2XTNKl3IKkyy86L/Fek7DWwAcG5OymhubzjdIuNXg6v1Y0LEf7+PMl/tLpzSOjAWvAXkV
	QadewMXgTpe3zlAeF6/Euov6mibb4dJRhy28kGfTrbH89gUBSgwP9/02xg3p8wWxyRwTCXFD4gY
	9zQJKvh1SIdXfbVxj63x+SJh8pZjO85lelxm+7yE7VGCtLuUb10L/TneDyDXidciH8dpcxSGgPK
	Dj
X-Received: by 2002:a05:622a:54:b0:4ed:ee58:215 with SMTP id d75a77b69052e-4edf20a914amr267335051cf.35.1763569156910;
        Wed, 19 Nov 2025 08:19:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELqiwovxwlqJiYgFVyaJyQQOyrVralmsihXdBDVIMZmS6bJi/KAR2C8mhzRxFKA1o8g2zcpA==
X-Received: by 2002:a05:622a:54:b0:4ed:ee58:215 with SMTP id d75a77b69052e-4edf20a914amr267334511cf.35.1763569156436;
        Wed, 19 Nov 2025 08:19:16 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee4513af31sm7265511cf.24.2025.11.19.08.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:19:15 -0800 (PST)
Message-ID: <d7b6b7de88a374a79c7ed707c74f12797b50cc58.camel@redhat.com>
Subject: Re: [PATCH 1/2] PCI: host-common: Do not set drvdata in
 pci_host_common_init()
From: Radu Rendec <rrendec@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Manivannan Sadhasivam
 <mani@kernel.org>,  Will Deacon <will@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kwilczynski@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 19 Nov 2025 11:19:14 -0500
In-Reply-To: <86jyzms036.wl-maz@kernel.org>
References: <20251118221244.372423-1-rrendec@redhat.com>
		<20251118221244.372423-2-rrendec@redhat.com> <86jyzms036.wl-maz@kernel.org>
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KCZKFLK-juHKtt2FJiB-NsQ07CecoGMzkseOmRswkCM_1763569157
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_082051_265083_B5755C9F 
X-CRM114-Status: GOOD (  44.33  )
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

On Wed, 2025-11-19 at 12:01 +0000, Marc Zyngier wrote:
> On Tue, 18 Nov 2025 22:12:43 +0000,
> Radu Rendec <rrendec@redhat.com> wrote:
> >=20
> > Currently pci_host_common_init() uses the platform device's drvdata to
> > store the pointer to the allocated struct pci_host_bridge. This makes
> > sense for drivers that use pci_host_common_{probe,remove}() directly as
> > the platform probe/remove functions, but leaves no option for more
> > complex drivers to store a pointer to their own private data.
> >=20
> > Change pci_host_common_init() to return the pointer to the allocated
> > struct pci_host_bridge, and move the platform_set_drvdata() call to
> > pci_host_common_probe(). This way, drivers that implement their own
> > probe function can still use pci_host_common_init() but store their own
> > pointer in the platform device's drvdata.
> >=20
> > For symmetry, move the release code to a new function that takes a
> > pointer to struct pci_host_bridge, and make pci_host_common_release() a
> > wrapper to it that extracts the pointer from the platform device's
> > drvdata. This way, drivers that store their own private pointer in the
> > platform device's drvdata can still use the library release code.
> >=20
> > No functional change to the existing users of pci-host-common is
> > intended, with the exception of the pcie-apple driver, which is modifie=
d
> > in a subsequent patch.
>=20
> This paragraph doesn't belong here. Maybe as a note, but not in the
> commit message.

Ack. And thanks for reviewing! More comments below.

> >=20
> > Signed-off-by: Radu Rendec <rrendec@redhat.com>
> > ---
> > =C2=A0drivers/pci/controller/pci-host-common.c | 36 ++++++++++++++++---=
-----
> > =C2=A0drivers/pci/controller/pci-host-common.h |=C2=A0 6 ++--
> > =C2=A02 files changed, 29 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/con=
troller/pci-host-common.c
> > index 810d1c8de24e9..86002195c93ac 100644
> > --- a/drivers/pci/controller/pci-host-common.c
> > +++ b/drivers/pci/controller/pci-host-common.c
> > @@ -52,25 +52,24 @@ struct pci_config_window *pci_host_common_ecam_crea=
te(struct device *dev,
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(pci_host_common_ecam_create);
> > =C2=A0
> > -int pci_host_common_init(struct platform_device *pdev,
> > - const struct pci_ecam_ops *ops)
> > +struct pci_host_bridge *pci_host_common_init(struct platform_device *p=
dev,
> > + =C2=A0=C2=A0=C2=A0=C2=A0 const struct pci_ecam_ops *ops)
> > =C2=A0{
> > =C2=A0 struct device *dev =3D &pdev->dev;
> > =C2=A0 struct pci_host_bridge *bridge;
> > =C2=A0 struct pci_config_window *cfg;
> > + int rc;
> > =C2=A0
> > =C2=A0 bridge =3D devm_pci_alloc_host_bridge(dev, 0);
> > =C2=A0 if (!bridge)
> > - return -ENOMEM;
> > + return ERR_PTR(-ENOMEM);
> > =C2=A0
> > =C2=A0 of_pci_check_probe_only();
> > =C2=A0
> > - platform_set_drvdata(pdev, bridge);
> > -
> > =C2=A0 /* Parse and map our Configuration Space windows */
> > =C2=A0 cfg =3D pci_host_common_ecam_create(dev, bridge, ops);
> > =C2=A0 if (IS_ERR(cfg))
> > - return PTR_ERR(cfg);
> > + return (struct pci_host_bridge *)cfg;
> > =C2=A0
> > =C2=A0 bridge->sysdata =3D cfg;
> > =C2=A0 bridge->ops =3D (struct pci_ops *)&ops->pci_ops;
> > @@ -78,31 +77,46 @@ int pci_host_common_init(struct platform_device *pd=
ev,
> > =C2=A0 bridge->disable_device =3D ops->disable_device;
> > =C2=A0 bridge->msi_domain =3D true;
> > =C2=A0
> > - return pci_host_probe(bridge);
> > + rc =3D pci_host_probe(bridge);
> > + if (rc)
> > + return ERR_PTR(rc);
> > +
> > + return bridge;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(pci_host_common_init);
> > =C2=A0
> > =C2=A0int pci_host_common_probe(struct platform_device *pdev)
> > =C2=A0{
> > =C2=A0 const struct pci_ecam_ops *ops;
> > + struct pci_host_bridge *bridge;
> > =C2=A0
> > =C2=A0 ops =3D of_device_get_match_data(&pdev->dev);
> > =C2=A0 if (!ops)
> > =C2=A0 return -ENODEV;
> > =C2=A0
> > - return pci_host_common_init(pdev, ops);
> > + bridge =3D pci_host_common_init(pdev, ops);
> > + if (IS_ERR(bridge))
> > + return PTR_ERR(bridge);
> > +
> > + platform_set_drvdata(pdev, bridge);
>=20
> Congratulations, you just broke pcie-microchip-host.c again.
>=20
> Yes, I did that myself in afc0a570bb613871 ("PCI: host-generic:
> Extract an ECAM bridge creation helper from pci_host_common_probe()"),
> and it was fixed by Geert in bdb32a0f67806 ("PCI: host-generic: Set
> driver_data before calling gen_pci_init()").

Right. Which means there is an assumption (outside of
pci_host_common_probe() and pci_host_common_remove()) that the device's
drvdata is a pointer to the bridge. This is what I had feared but it
wasn't obvious and I failed to check thoroughly. Sorry!

> > +
> > + return 0;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(pci_host_common_probe);
> > =C2=A0
> > -void pci_host_common_remove(struct platform_device *pdev)
> > +void pci_host_common_release(struct pci_host_bridge *bridge)
> > =C2=A0{
> > - struct pci_host_bridge *bridge =3D platform_get_drvdata(pdev);
> > -
> > =C2=A0 pci_lock_rescan_remove();
> > =C2=A0 pci_stop_root_bus(bridge->bus);
> > =C2=A0 pci_remove_root_bus(bridge->bus);
> > =C2=A0 pci_unlock_rescan_remove();
> > =C2=A0}
> > +EXPORT_SYMBOL_GPL(pci_host_common_release);
>=20
> Even with the pcie-apple.c driver change, this is never called. I'd
> refrain from adding an export until we actually have an identified
> user.

That's fair. I just wanted to provide it for symmetry. But it's not
even needed if we change the approach (see below).

> > +
> > +void pci_host_common_remove(struct platform_device *pdev)
> > +{
> > + pci_host_common_release(platform_get_drvdata(pdev));
> > +}
> > =C2=A0EXPORT_SYMBOL_GPL(pci_host_common_remove);
> > =C2=A0
> > =C2=A0MODULE_DESCRIPTION("Common library for PCI host controller driver=
s");
> > diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/con=
troller/pci-host-common.h
> > index 51c35ec0cf37d..018e593bafe47 100644
> > --- a/drivers/pci/controller/pci-host-common.h
> > +++ b/drivers/pci/controller/pci-host-common.h
> > @@ -11,11 +11,13 @@
> > =C2=A0#define _PCI_HOST_COMMON_H
> > =C2=A0
> > =C2=A0struct pci_ecam_ops;
> > +struct pci_host_bridge;
> > =C2=A0
> > =C2=A0int pci_host_common_probe(struct platform_device *pdev);
> > -int pci_host_common_init(struct platform_device *pdev,
> > - const struct pci_ecam_ops *ops);
> > +struct pci_host_bridge *pci_host_common_init(struct platform_device *p=
dev,
> > + =C2=A0=C2=A0=C2=A0=C2=A0 const struct pci_ecam_ops *ops);
> > =C2=A0void pci_host_common_remove(struct platform_device *pdev);
> > +void pci_host_common_release(struct pci_host_bridge *bridge);
> > =C2=A0
> > =C2=A0struct pci_config_window *pci_host_common_ecam_create(struct devi=
ce *dev,
> > =C2=A0 struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
>=20
> My concern with this is two-fold:
>=20
> - it is yet another obscure API change with odd side effects,
> =C2=A0 requiring to track and understand the per-driver flow of informati=
on
> =C2=A0 (and the apple pcie driver is a prime example of how hard this is)
>=20
> - we can't directly associate the PCIe port data with the bridge like
> =C2=A0 must drivers do, because the bridge allocation is done outside of
> =C2=A0 the calling driver, and there is no link back to the bridge from
> =C2=A0 pci_config_window.
>=20
> I'd rather that last point was addressed so that we could make the
> Apple driver behave similarly to other drivers, and let it use the
> bridge private data for its PCIe port information.

Using the bridge private data to store the driver's private data was my
first thought too. In fact, in the first version of my (local) changes
I added a "size" parameter to pci_host_common_init(), to pass it down
to devm_pci_alloc_host_bridge() as the priv size.

But there's another problem with this approach: pci_host_common_init()
also calls pci_host_common_ecam_create() -> pci_ecam_create() ->
ops->init(), so init() would be called with the bridge private area
allocated but not populated.

I don't see an elegant solution to this. The two options that crossed
my mind are these:
 * Add yet another parameter to pci_host_common_init(), a void *, so it
   takes a void *priv and a size_t size. The size would be passed down
   to devm_pci_alloc_host_bridge(), then `size` bytes would be copied
   from `priv` to the bridge private data area. What I don't like about
   this is the extra memcpy() and the fact that the calling driver
   would have to prepare an "offline" copy of its private data (likely
   as a local variable) and pass it to pci_host_common_init().
 * Pass just the void *priv to pci_host_common_init(). By convention,
   the bridge private data would be used to store that void *priv
   itself, which is a pointer to the driver's private data. So, the 2nd
   parameter to devm_pci_alloc_host_bridge() would be sizeof(void *).
   The downside is that there's an extra pointer indirection.

In any case, your other concern about linking back to the bridge from
pci_config_window would be addressed because pci_config_window has a
pointer to the device (the `parent` field), which (in this scenario, by
convention) has the bridge pointer stored as drvdata.

If any of the options above looks appealing, or if you have a better
idea, please let me know, and I can prepare a v2.

--=20
Thanks,
Radu


