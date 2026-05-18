Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E45CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=; b=q6x/PjORyNGmzHtj+lfmto4Nfm
	W5x0Di9NVyzTK/yeHoRcMkCswKacjI7zRB7iTCpa+/mHIcMD8/bSQioaqr2MromgsJIjKIS5TNIzR
	0su8GF/UwwqWf0X3mb+HGpx3eAlKr5mMadRySH26UbCnPWGsA5ptUavovHaXjDXUOPoqP6j0iGOp6
	vCVT/ppsizLAyznUKDYHN1xv0KWi1YyHMJzWXDG6Q5IKcVLLNGcQ4PxY4cvCg3DoHiu+bDyEim+2O
	GUe51hrW1LiWbChPeK4w3An6G+P1ek9ctveRJjUtPzbc57xVi9QDQYgkxgdOxGsDRWcWr+KNB2w/p
	zjkO0O6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOu2i-0000000EyGp-13gR;
	Mon, 18 May 2026 09:13:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOu2h-0000000EyG6-0PM2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 09:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=; b=p6M8/dnUEWiLW1yxKW/FqhCUV1
	U1YNidCzaCvxOVgHIzlW4m6NJ6UuWgrjhZj+RkU1MN7lzGFUboLFbumF9+tnPzqYIEI2gXeaL92dQ
	xFMf6Jn9p7xgDlw6kPQ6MQxjRlIeg6BOaSHlFBg5+61nbbnn6/hAuQ7HuRKWRKrwKk2eAcbgU2LEu
	IofvrldJLcAW8Ae5uJJNOmyZUJoNI2FN+E25T45Vvnm+0Jyzb+Qy/YatAgfs7MuzpWmirMCESrDRV
	Ql1k4nb3HPGxLt9kabIIafyOvAJGNOi5AKx4bIilmqIKTHN+t86cScFMJegmtkSyB56d8t5G6O9Q5
	qKssUd3w==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOu2d-0000000AWvx-1qOH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 09:13:42 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-394413a63d3so18170841fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 02:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779095617; cv=none;
        d=google.com; s=arc-20240605;
        b=WJ0BKEgwXCDnUr6j3i7w6o7kqYay8k+oJzLuMQ2xWwQz9gkRdDG7Lbd+LD+gM7bqie
         DsFiLE5PH4jy6we5UTl8vrDfsG2XVyi/Ebr5Uc7r57wV6c+ct4nxzxOTb5r7J8eJ2q7g
         ZZzXdchgF2SderZV18n33ejKEyZ9e08qvN9QUIJ1J014lpJ8KNbpXLigrJ2bJ/yMICyQ
         4iIZbCsgMfUPktXdh7mvFj5T7waq77m30srZUUXuTABnriXAS2kS0aAwNXzii/Lf2RAe
         tC1xskfoMQqpnDDbod/2EtlccUwSW29pu7JBcgRoF4oGf/4yC/z1ZivxcZmKTCIsbcmP
         Fe2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        fh=JiwpbZde40UcbxmJ5uWojEmbFUKdL6wPe+OpsziVfsk=;
        b=QRPJSXgOoUFCkhQ2mTnXY/TKHRRbrDLSuH8/CcUvldQvEGE6bg+BwZvdi/Ep9W5YRB
         gB1z7b+KZdSpQ1DDC+YX/Dj6kGbXF3Y9rvDDHK1IUtwP/dtViy8PcXhZ0YIXTXXconSY
         FjvfWk34qDs2F3USD73y4ECHGU9psfzWJgx6FyNC81pOrUUX+97ux6OX3htoEbpzBVdi
         jNLlDv1C5LHPDyBDgsoD2+N4oaUmxZu2gW3bIwZKKkGIH2/7ZQqgEkUy9FMA/oN7GzRb
         1mK0DyfmK1T6KAQUyapgbebSPVXIJIQQLZ5RRjlZTM3KiDw5wpUu5SGWhOpefB4Mj/Qc
         m4kw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779095617; x=1779700417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        b=JzvTGOW3Jer8YCCzwCyrmwxGijP+B46Er23jQBZVtQhLs/0V2qxNvk6yfRtkILtOfl
         x9DAyWpishqPyrgLAuv50mOgU3Pp/dVydEY8E/goc+ub5fM7algpaVRR4MOCg75JtzJn
         UZlI0xKJgyyniQ3BHWYg3JPd/897taKbmjxBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095617; x=1779700417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        b=SzLC+3ckkpzwjq36pBDAqN/kFig8jTNKuiBqR47q9KOyaoqrx3N0M8f2q0xSV2229S
         0zB3Z7RV7JzQw2Xxx2GnzKkAgK1VZw3z2GnbDvLx1LIg0OnLqR2gEufvw+K93ePMfr4u
         g+yQroRqEVvEqCEk4OjFk/s0rfuQgVZbLvNzVvUPDX5ev47WOy1qFO/k0NSycGmtEBHw
         2EvOKyg2q2UOXehBZEJcs/kO32xdt/R2nDetPr/oKgho68xxix54AreBtZgdCspHXrv9
         oAYJ2y2fthu0RQr8gznmhPvdj2MIZBfZA8pskQcAmLB6/Q/1ZpQjr1x67xYusDqI+pB4
         C05w==
X-Forwarded-Encrypted: i=1; AFNElJ+RSW+4ziVXdcVvOgC3fG3/j6vtxHtOHpHip5AIma3v+EZ4OkxzqAuQjQC08OqjWomhIC4IMybFfNeWfaXRUQ/f@lists.infradead.org
X-Gm-Message-State: AOJu0YzXHzKJb+a6v0RWxh7YDab+w0y+mFGDQfaMHoms3B3ZDc7ulFGo
	ZDbKjEp4wJ5A9r5Qre2wP2o/zcvQTESLpWl8ZNLIn+FMUDbaSGiIqTN8zim5GfnIYDClzjs56Qy
	xxC9+6Lbu0kiOCkbQoX4Fhu26cjCKJkrMBcCXe6Uc
X-Gm-Gg: Acq92OHbjMiMPuv9fiTFRJKbEqWI9XhJMAvEXqnfnnOzjwT09b4PhjRD9ORT9CD1hSR
	NVEk4OOmaAL2gFDBDIyFL3JlJRnIxBpFr1LVGXUg7B7lZR8WIVKBsv2hsZoDC5ARRjt4OsiXfIC
	OMLrFQ4s+ufvU1yicwKNuvOv9GHHXh6MiKc3NodoHec2w2z6MhY9gKw8nrclscAKZKBZRnucJuy
	VcihlLRFEcSjYtS8fvkTrY8Ui/mG7ajX5YTqwrwHDsGQNZPzZtNLUJ1PRMbKpHNTY17V+jFiHqt
	7b5D86emtFfodD6SLaMx9tDa6LKsvKmfyn3vQrSJEcxjd8Ab
X-Received: by 2002:a05:6512:3e14:b0:5a8:9f6f:3212 with SMTP id
 2adb3069b0e04-5aa0e741fd0mr3969603e87.34.1779095617441; Mon, 18 May 2026
 02:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <20260515090149.3169406-6-wenst@chromium.org>
 <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
In-Reply-To: <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 May 2026 17:13:25 +0800
X-Gm-Features: AVHnY4KWMoq2C1egFaF2o_wZ2pbZmcxOkUhi_AoDtPCF3Cwz3jQrR0zfOzxPPG4
Message-ID: <CAGXv+5GT8vS87owuNJvMxWBnwCELCV28SbwsUXFr-Ne5O3EgsQ@mail.gmail.com>
Subject: Re: [PATCH RFC 05/12] usb: hub: Power on connected M.2 E-key connectors
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_101340_045466_C3FC1C9D 
X-CRM114-Status: GOOD (  26.73  )
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

On Fri, May 15, 2026 at 10:39=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Fri, May 15, 2026 at 05:01:41PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 90ea597d42ae..4165f71e212b 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -31,7 +31,9 @@
> >  #include <linux/minmax.h>
> >  #include <linux/mutex.h>
> >  #include <linux/random.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/kobject.h>
> >
> >  #include <linux/bitfield.h>
> > @@ -888,13 +890,25 @@ int usb_hub_set_port_power(struct usb_device *hde=
v, struct usb_hub *hub,
> >  {
> >       int ret;
> >
> > +     if (set)
> > +             ret =3D pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> > +     else
> > +             ret =3D pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (set)
> >               ret =3D set_port_feature(hdev, port1, USB_PORT_FEAT_POWER=
);
> >       else
> >               ret =3D usb_clear_port_feature(hdev, port1, USB_PORT_FEAT=
_POWER);
> >
> > -     if (ret)
> > +     if (ret) {
> > +             if (set)
> > +                     pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> > +             else
> > +                     pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> >               return ret;
> > +     }
> >
> >       if (set)
> >               set_bit(port1, hub->power_bits);
> > @@ -1867,6 +1881,7 @@ static int hub_probe(struct usb_interface *intf, =
const struct usb_device_id *id)
> >       struct usb_host_interface *desc;
> >       struct usb_device *hdev;
> >       struct usb_hub *hub;
> > +     int ret;
> >
> >       desc =3D intf->cur_altsetting;
> >       hdev =3D interface_to_usbdev(intf);
>
> This change is totally useless.  Didn't you get a warning from the
> compiler when you built it?

Apologies. This should have been part of the previous patch.

> > diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> > index 9ebc5ef54a32..6039e5f5dcd7 100644
> > --- a/drivers/usb/core/hub.h
> > +++ b/drivers/usb/core/hub.h
> > @@ -85,6 +85,7 @@ struct usb_hub {
> >   * @port_owner: port's owner
> >   * @peer: related usb2 and usb3 ports (share the same connector)
> >   * @connector: USB Type-C connector
> > + * @pwrseq: power sequencing descriptor for the port
> >   * @req: default pm qos request for hubs without port power control
> >   * @connect_type: port's connect type
> >   * @state: device state of the usb device attached to the port
> > @@ -104,6 +105,7 @@ struct usb_port {
> >       struct usb_dev_state *port_owner;
> >       struct usb_port *peer;
> >       struct typec_connector *connector;
> > +     struct pwrseq_desc *pwrseq;
> >       struct dev_pm_qos_request *req;
> >       enum usb_port_connect_type connect_type;
> >       enum usb_device_state state;
>
> The fact that hub.h uses struct pwrseq_desc indicates that it ought to
> #include <linux/pwrseq/consumer.h>, instead of making the .c files do
> so themselves.  Then you wouldn't have to add the #include lines to
> hub.c and port.c.

I couldn't tell if the existing pattern in this file was to include
the headers or not, as it's missing a whole bunch.

Regardless of whether this header file includes linux/pwrseq/consumer.h
or has a forward declaration or nothing, I think that if the .c files
use the API, then they should include the corresponding header file
directly.

> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index b1364f0c384c..2d09037fee93 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -7,11 +7,14 @@
> >   * Author: Lan Tianyu <tianyu.lan@intel.com>
> >   */
> >
> > +#include <linux/cleanup.h>
>
> Why is this needed?

For the __free() in usb_hub_port_pwrseq_get() below:

    struct device_node *np __free(device_node) =3D NULL;


Thanks
ChenYu


> >  #include <linux/kstrtox.h>
> >  #include <linux/slab.h>
> >  #include <linux/string_choices.h>
> >  #include <linux/sysfs.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/component.h>
> >  #include <linux/usb/of.h>
> >
>
> Alan Stern

