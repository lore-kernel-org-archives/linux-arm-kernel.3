Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5062C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=; b=dVv6HBK51hoIEHFPdzH+P8g7Hr
	64pGXnjSqobMF31fipTdd8+Z5rYIlEkYfsj0mY3OZTom+NXuw1AQxtuzoISPmcDWo7cwoE+RjCyoO
	hOCzskJCmHOAmCH87Wo1Es2hnAQQNUC2EMXq5FFeavVWqJ7Er/wHW7wUJJWFmSWPRH99RnV6F6fKb
	yQrsuBEvtIN63gHqbCjPC7YlV8EAlPcSFSzq6nwHrKD/44BvBgqUgmuRZH+7hHms0yLsUn895nW61
	ceYVRR9CHvhzo1GUGZzGYh/Zo2Iem2QPSKci4Gtutz8cD6oEJC1FXF5gSdnR9MaMl48SNsF9mxarW
	1t3X7zng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIve-0000000Gx8A-0ilj;
	Thu, 16 Jul 2026 10:02:54 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIvb-0000000Gx6h-07Hi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:02:52 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-66810946e63so2127407d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 03:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196170; cv=none;
        d=google.com; s=arc-20260327;
        b=QnLTPEmHT16dxe+zTIJcUVLs7TpgUAsNCL8bWrSrw0AqHBEvmDLlWb2KgOCWGkAuxz
         LLEA6PC9fRbXwBEQXKbGwBLlX7qr3EkNq+1v6ycAFcMLEBhURflQ/CSkJ8vhRqkyklJf
         KgF+0zm4tY3k3TFWibHe3RxAGMC+U4EaJ/v+PfPnxRUAo8F/OItFCJ3AgfkH5yGu8yqW
         x8QqoPIQu4boN/B/uqJmhj3mpPVIOEXlMN9DVIV4QHp4AB2fbIWH6Vkxiq2IrmtmrN23
         tUskt5F94rdAeMMyPH0aU6TkAFdNRWjs55PjHG2n+S3INP0w59LE4E8att3D4n1UyKFh
         xt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        fh=J3OK/v8OYwiU9Qq2Rch6BlKMlPCOH5d2AOtk1ukpuRw=;
        b=VJVNKqsxpirdQUA1jlf7EDVVhqZIbYJsqwzFInECxSAdk/xr4dU467PZF6oImc29eM
         lh8L87l2XREBGZaehsN3CPOtn5A+lsPJAbpRazun3XVnqkT8B4rwyGxs8X36NJIoCY3v
         8tTeP29rOdzw/UZiSF6k5+ZeT/19Wkv03qOLwE5XsOkgxd+iOhJDBvRLkbhzKC+EckvK
         RqgUJ/Q39bJkZXg8HIezQI/xx29RlBS2Amw7QnNrIjJq3G1mvhnL7vjscU7n8uIVPadW
         O0pz4PPlUhHFeKE0HU4xvMTr1qNS6bu1kQy2NTMFiXbCgyet/Q2Br2tiH/7w9YLJwoGS
         MIsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784196170; x=1784800970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        b=DfODuXDyrSk/332aLVvFp6R3NYc6LDtbWc31C8IJum4mCb4X1NMIyemI1EZ1T0lcYG
         VrJIlBe/yRPc83mcO39QvjkADhrhheLJvliP0/NIZCVxbnIIYakBN1tVz+gO2Mwz9weC
         E2ILvHtthBw7sgOhWXyilQJ0ihUC5iIgAVYfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196170; x=1784800970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        b=HeIY8GGiS/ys3ClJELahSU7ZAdncBLJLx/CsR5t+HaEqXaWG5jIi+1HUEYj3Kp/j+s
         PudWied+2hXUGf/dWUVRdMPr6j3uEgXPOt25rdPx3YvmZjFsJ0eHFYxaXro6c3Lyn+xt
         AK94ElzTcKNaHGZ++wzPPs80vd6riuHNHxo6GvzoeF6WlgmTX2KLkmm/8KnMmC+TgsK0
         aWSAP70LBNL7ODFQF0FiPQ6u4rI2FV0KacCohiAkalDPtrfxwP1X1A0wGH7c8nQGWCQx
         gSuvLMYip6MIlMAdjXzbRIj9R0p+QVOkCTx59LFgNMHNlDK7AYBjvVICpMyM25DUwuBg
         vzWw==
X-Forwarded-Encrypted: i=1; AHgh+RpPCiVEj+RKM37mKwTPbmvO0AtTNYW/E11VroafIPt8av38XKE8gbelnCWKKJiDqWqmrBC1KhKALWrJs+Jy7zvI@lists.infradead.org
X-Gm-Message-State: AOJu0YxKoLDc/CCmMIcg4IjB0Z9r/uGuEsKGZsX5btPRfbNmlIl8+8Ms
	wDQ8mU7gxqQEO95F8CujWCLp/7goTXAEGEH5DFViYS+OnJAFg+jCxQNT6IRvRV/+TfWFYm9QuAS
	fAMrxPpC2O7W0hqkff9IYeJ0LQfqFLx7ZVIfpCOwy
X-Gm-Gg: AfdE7ck9eogLL1W5iKtL1Ra/szOFC4moAC5HhpRJObpXoVS2uB/QJygkYvjkI8AOelu
	HPmhciZC8q4SgxtWMAtxhtgzgOK+Nr1ED2R4sZJj8ba9+Pii8bhyhuo9kW+afL10Sa0dcS1hHmu
	9lT63HlsuXhlgCHy+tqZhvQx0aQDseCZkDBelzPW1OkQJpV4hMqVVnoCh4cCPIlt9J2At/HnQno
	gu5DflxFaIdWrNqYsQ1+/JiuTYKMcMPcUmeO12dtaNEbOQ4R1zQvZwW744zo5TffBA+/X7hB6iq
	K17ADlBF8fCqg7wc
X-Received: by 2002:a05:690e:d02:b0:668:15cc:bcc4 with SMTP id
 956f58d0204a3-66815ccc501mr4350974d50.53.1784196169785; Thu, 16 Jul 2026
 03:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local>
In-Reply-To: <aleKQKH2V-ck-SX6@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 18:02:38 +0800
X-Gm-Features: AUfX_mxuW_5D4-j7y5auPPMU8fitwu4GAwXYmX14uCHTJY4CutBJo0OlCAdX-_s
Message-ID: <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_030251_112027_73EC5C9E 
X-CRM114-Status: GOOD (  37.04  )
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

On Wed, Jul 15, 2026 at 9:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
> > The new M.2 E-key connector can have a USB connection. For the USB devi=
ce
> > on this connector to work, its power must be enabled and the W_DISABLE2=
#
> > signal deasserted. The connector driver handles this and provides a
> > toggle over the power sequencing API.
> >
> > This feature currently only supports a directly connected (no mux in
> > between) M.2 E-key connector. Existing USB connector types are not
> > covered. The USB A connector was recently added to the onboard devices
> > driver. USB B connectors have historically been managed by the USB
> > gadget or dual-role device controller drivers. USB C connectors are
> > handled by TCPM drivers.
> >
> > The power sequencing API does not know whether a power sequence provide=
r
> > is not needed or not available yet, so we only request it for connector=
s
> > that we know need it, which at this time is just the E-key connector.
> >
> > On the USB side, the port firmware node (if present) is tied to the
> > usb_port device. This device is used to acquire the power sequencing
> > descriptor. This allows the provider to tell the different ports on one
> > hub apart.
> >
> > This feature is not implemented in the onboard USB devices driver. The
> > power sequencing API expects the consumer device to make the request,
> > but there is no device node to instantiate a platform device to tie
> > the driver to. The connector is not a child node of the USB host or
> > hub, and the graph connection is from a USB port to the connector.
> > And the connector itself already has a driver.
> >
> > Power sequencing is not directly enabled in the connector driver as
> > that would completely decouple the timing of it from the USB subsystem.
> > It would not be possible for the USB subsystem to toggle the power
> > for a power cycle or to disable the port.
>
> ...
>
> > static void usb_port_device_release(struct device *dev)
>
> >       fwnode_handle_put(dev_fwnode(dev));
> > +     /* usb_hub_create_port_device() could leave an error value */
> > +     if (!IS_ERR(port_dev->pwrseq))
> > +             pwrseq_put(port_dev->pwrseq);
>
> Hmm... I would rather make pwrseq_put() NULL and error pointer-aware, so
> it will be no-op in such cases. But I think Bart has his own opinion abou=
t
> this.
>
> >       kfree(port_dev->req);
> >       kfree(port_dev);
> >  }
>
> >               put_device(&port_dev->dev);
> > +             hub->ports[port1 - 1] =3D NULL;
> >               return retval;
> >       }
>
> ...
>
> > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>
> > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > +     if (IS_ERR(port_dev->pwrseq)) {
> > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port_dev=
->pwrseq),
> > +                                    "failed to get power sequencing de=
scriptor\n");
> > +             goto err_put_kn;
>
> OTOH, how pwrseq can be non-NULL and at the same time port be created?

I assume by non-NULL you mean returning an error?

device_register(&port_dev->dev) is called some lines above this.

usb_port is weird in that usb_hub_create_port_device() does a bunch
of stuff that is normally done in a driver's probe function. However
usb_port's driver is just a stub driver add for userspace compatibility
reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects").

So at this point the usb_port device has been added to the driver model.
Or we can just zero out port_dev->pwrseq instead? I guess that is cleaner
than having some weird check in the release function.


ChenYu

