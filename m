Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8AEC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=; b=zl9Q1cy/JBR3siESwvrAGBrlo6
	8vEo1q/DAKjbX6ZQpyVzuGyQ3yIguhL8g5koEFUoQqx3ckIjKYZv3uQ7birFJM/PBvEwUKp0eDtQl
	or8lFl57WWNs5PlLAD3BUivm7t68cpoaqh6xUtZSQKJtWm32Igp6ml4KvXP0l7bQHjqCu+53jV0/l
	GCPzOqgf702MWiZEtrj55r2RO4QuRE3Tksuq1YNjRZ6vqZ+dw11Ms/wIFGm2ZtRKNH2XwffxzCkyk
	rhD67aauJ4BAOiJfEgeaIU3ULCSgkAXQM+ZnfiY63P8GmGjQacHIFOlG25VmeKnK5ZvtgtbMJDM0k
	QRcNmlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke0C-00000001edt-1u6Y;
	Fri, 17 Jul 2026 08:33:00 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke0A-00000001ebI-0wiK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:32:59 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-667bae10ba3so4053131d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784277177; cv=none;
        d=google.com; s=arc-20260327;
        b=JzWbW/dHKP0vQCOWJACkLXn8WPmMkwbWzfkvIfwT48Bc+Btqf0YEKfVHMuKOPX3DFz
         r6e5eDtbmQGX4xQe42Otdt7ijHb/V0eaeW9I2MR9Bg+rgbA6Rt+qhk9uqUZNwQRE31UD
         8MNw0Kgnjx+Kn1gwH1pnR4mCd9wUXQx5PQcPXpOGpNCm6IhwUfDyfDOrF1uz7Slgxj4u
         q4PZdYHmbudIhoEBp3+EjQ809Nkm2VRP68RIo7GT/9B4zzcnmezMzOHU0mZdMFgDS7rr
         qB6N4Q+P8lBrDMT4hr6L0DSDamcC0wSLrFUNXf49u4aynMzm+E9BdnSe3LtUtP+e2G12
         s10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        fh=HgkqPRQ6r8h3cziWrkDXJ4KVHJfXEWZ6E0ge1GaZUMU=;
        b=ihMw1J2j2SIOwoB/Upr74cxOoQmV9KeN0PnwiaJQtLFNHTksCa4/pLT7287GWUAOwn
         EoqB/rMqIhCrJTw7i6cRbw1UJl88tIfGdmWpn5h9/g2ZpUDByRw8hV4+GoMCK1O3mhpF
         iDJCW7sW2zTIwNkB0lfLDsGLbNzha2PHKbdeTvJt+H/LZqi2CcMxKSaGiLlKn/ieII2u
         ar2FkBTQYlGDB/6gjvYpv/RNzNgQpmjBJXPpx1JCeVgqTM4fLSvfMJR2zZnnGcGvlwh5
         Kw/AXabAfrRcTQSYD/SS0fRj04YJ3EBL+TrfcVtUEnBn8WY3XxCyi9aDCOLR2k+0mcvA
         pPog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784277177; x=1784881977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=faF+zrQ1xK0EYUHX6g6wVKnsv4/yQ41WVGc7KEjRkgSbCXkOi9iH5Dp0oCiltULYlM
         EJeDyF+q8zVe4+IidDaZ6QHzBm+KGLlsgcGLkRTIfv7VDiVOeq0db5LXe/7xOXTXF0o/
         zRcuI4GfFoy8BvGyqEUPsa8/e/Whq0jzRBCWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277177; x=1784881977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=j9/3k3nsDo6A88MOnlrTPmUJqxebdi+6f/zndoXqbZ+046GLNLPFS6kdvOp4P2oZoR
         etQ4ftNARd1OLYZinR5bi6H9FL90wRi3/WSrQcksjQZ6NnW4yoo6BVdH6f0SPx7zK5zd
         jhaiD+8Azvz2SAtSzzPFyr8a0BC1s4pNHaNXDUE+kTCrdBBMNjdzGYbaylfn68iDSvXd
         w+WOC7LmL4BBctwngVAWkr5qL+9coaWJcIZ3wGLdg/ojtt/3cIq6wxliz32+Km3t/6yo
         BezaIe6x/lPXZq6AXoUmQYOSjEH4OU4g+7rB+EceWIv/7OJQPpU2nxaaMuwmvfv0i/5M
         Z7ow==
X-Forwarded-Encrypted: i=1; AHgh+RrfgRaVj8ET0Z5DNFgxK9wQCgPQFou59bgHCwO8aSCZmMDFLrspUEDZKRJ3rMShKF/VuKveIVGOUj/MmfXQzudH@lists.infradead.org
X-Gm-Message-State: AOJu0YwR7LdHVWKCvBotyZkp+WiD2xbnw/VPSMvu7EOCwnzG2y0clHuF
	oa3PefB1aSLj24fyjtuHLlBTnSLfCTb+hxxFXLjXuqkhIoclvv4JqzgnuqK9fZD1aU2jTUpN5iW
	NCJoxnPpqtERHzjAm42TMrAIzQihcU60+Ka3FDvat
X-Gm-Gg: AfdE7cl2tLNtKu7b0J0vkcOwVtwKg27GwJKSSDQAAqK2EBehZnhn4PIwZ7i0CPgkxmh
	awlpuId24K+GC4Xaz5bO89DBk7gV2++1D12JZktO6VzfOPpYk4OuGPxhrVVJV2FL7D2rkH99bi+
	zsXkP81wZIiA1wg52qBJj2t+/iedN9eVXK0qcX2MwK4bHKrS/B8M9019+7myP5nPStzrANzWnHa
	QtnhVYtu91fAR3qL17oMC5NsVXOfF9bp+N0XYZvDo4ktm7dHz1vuUDdGLeXhm+JXiMdbX7nnoVo
	pi9DwWg7jRWh
X-Received: by 2002:a05:690e:1644:b0:667:af05:2e8d with SMTP id
 956f58d0204a3-6683bde30b0mr341998d50.79.1784277176987; Fri, 17 Jul 2026
 01:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local> <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
 <alkWE-bQ9gGIXIJj@ashevche-desk.local>
In-Reply-To: <alkWE-bQ9gGIXIJj@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jul 2026 16:32:46 +0800
X-Gm-Features: AUfX_mzoGIeMcv7EV_g3RqR3VRvLvguofP9ZSODwjiLGO0JAlL2g0unPo14vZls
Message-ID: <CAGXv+5FJkmOJgpwRBp4nAea6_moF=gH6wGmNpP+g8URNd--jbQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260717_013258_417401_ABD0C259 
X-CRM114-Status: GOOD (  27.55  )
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

On Fri, Jul 17, 2026 at 1:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jul 16, 2026 at 06:02:38PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Jul 15, 2026 at 9:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
>
> > > >       fwnode_handle_put(dev_fwnode(dev));
> > > > +     /* usb_hub_create_port_device() could leave an error value */
> > > > +     if (!IS_ERR(port_dev->pwrseq))
> > > > +             pwrseq_put(port_dev->pwrseq);
> > >
> > > Hmm... I would rather make pwrseq_put() NULL and error pointer-aware,=
 so
> > > it will be no-op in such cases. But I think Bart has his own opinion =
about
> > > this.
> > >
> > > >       kfree(port_dev->req);
> > > >       kfree(port_dev);
> > > >  }
> > >
> > > >               put_device(&port_dev->dev);
> > > > +             hub->ports[port1 - 1] =3D NULL;
> > > >               return retval;
> > > >       }
>
> ...
>
> > > > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
> > >
> > > > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > > > +     if (IS_ERR(port_dev->pwrseq)) {
> > > > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port=
_dev->pwrseq),
> > > > +                                    "failed to get power sequencin=
g descriptor\n");
> > > > +             goto err_put_kn;
> > >
> > > OTOH, how pwrseq can be non-NULL and at the same time port be created=
?
> >
> > I assume by non-NULL you mean returning an error?
> >
> > device_register(&port_dev->dev) is called some lines above this.
> >
> > usb_port is weird in that usb_hub_create_port_device() does a bunch
> > of stuff that is normally done in a driver's probe function. However
> > usb_port's driver is just a stub driver add for userspace compatibility
> > reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects=
").
> >
> > So at this point the usb_port device has been added to the driver model=
.
> > Or we can just zero out port_dev->pwrseq instead? I guess that is clean=
er
> > than having some weird check in the release function.
>
> So, why do we need to assign the error pointer to the field directly then=
?
> Make a local variable and assign it if and only if there is no error poin=
ter
> in it. Would it work?

That's the next thing to do on my list. :)


ChenYu

