Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13F2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 06:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=; b=lcKNqjAtV54EF/qcWSj0Q4nblz
	aFwMy1g2xSU5bibaZcit3POKFL3RogiNchrRl3MhS/frP4jGYtNH65yIQbRFYnG+Fz+UlJDcDbbHv
	rkGUgudTKORX7Zvb0l/a/dSflcLRWjqoM6aE5c0wLm6PB/KVFTdBO5vh4Qx+kyPllPF/PciahZG6b
	EXC1IRJrpV/zY/JZVdog4aVJcAjqm32lbp14zKalXfMaP0nLIlzgBSuI6zstTx1QEDk9pYm6rxD3D
	TTpYg8/bj27C7QcW26SxAkXVkXfAQTYJixJIDosKGrn5bYVZsy2wUTublRPqV9KhWnW9/zoXGlBrb
	NykxtgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjALo-00000008I1a-2v4p;
	Mon, 13 Jul 2026 06:41:12 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjALl-00000008I0Y-3ebK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 06:41:11 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-664c535f1a0so4699882d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 23:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783924868; cv=none;
        d=google.com; s=arc-20260327;
        b=pEvIUbozE1aSMQBmbOC3XRAbP1Wi2AGA2ih9ghhYRisA/LIAD2+8lBSwFph2upu2yj
         Fkead7ASWiZSb95inGhzgWgD/dVKlLoKdvbp3+cUP6mNDA4GL1l59ZzZHGnkA1HotJGu
         Ka9pfESw/srd93ffp5OV+MbpBC4201001osavYv1u5ulDMhYq5oO9hBA7FtEYhBtMU+4
         04IkGbCCKzWlzIdJzRPRLq8Jpfgohi2pRJeYx5DcyZrU8GAcvXyJRv9B9NQe7F61CCf7
         wh9/mIjMZhl/ScSMNiS5/XPPTLHSDWz3Dm5SMnRzMcLcL1Z1OhMoLPCcZL+am0N4msLk
         UY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        fh=705PUXFg+BEu5de7U1GuiUsPEFXwE+Cw3kHX0PnWYhQ=;
        b=GpGqhyTHWlK+kh8D4DVtoLgLO9dVKLSVbIXJpSBXfRLBcTR70Cmas5ditbBOS0yZtH
         pzMEvpK/tfJb7/zBIi5nu+lQ5uva0hbl5qx57a+KiV9utk/ef2h020F/DhwQLGZsdf0a
         YyRROmbKw031JutKMkE/lwcsq95DpKJH1nrnY1NZuTh9pwM++E/mcdDfct0kCSfVV/jj
         UnIFqdRzmwTAK53Ruuj2ULQUUegYLEKv/ellbrndzFJLivYz5HNlwunHtPjHixNkmaqh
         v6RdPwwEghls9oeO9IrdBs9xRKcqlhI9hjy2dQondCHj+rm3vFig/OQkReGwEPKcP83t
         9LGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783924868; x=1784529668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        b=jRnadhR0Y7x0WqkAhoJH3xrpjdNnoB0i9Z9kymLzccLe6BcI/asl6Yk6IKxBQdUmD1
         uNp4pzuYSu1uR3KS+ifCnA5waoVncrC9e6hiihyAamLxMisUT8XMalTq9yV2Cm1yVL1J
         UmnVgdZ4EqTBtq2mfBHPTygnr6MhKPr07YFeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924868; x=1784529668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        b=ptk3DgFXq+PPiYR5nHGYuzBxGHRkoKahd13EFzavvlJntCNhFhZ1vLSbcopI9fc7l9
         B0juUU+3iLBPdGGOXypBF8hFPU70uWQSPx54iwPR4dTxkX7NHcUq3sLBBNfeUDD4xXex
         O9jnVBpCcpbo0EH9GuyBHh2KFQQUHGVGyYosYWrsxGjaisvmz6HrD5vnCmX/9d0HAVLz
         2JWdW6RBW+KINP5Y64SIhusoq+Cm+6Bm1OZiQ98CEiFJxtdTqLU42H+LCYSsPOsa5MHd
         o4i3fPs0sZ9FCTfwrYmLMkPc84GQAsn37DNxTNDccQMhdI3bIt8IOOK+l+kXvbQQnzEs
         sj1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpfd8AU03nomuWY/pKGXx8eOCgVr3cJv9ZBZp71RFfLfXWSBDXxz6+jaxW/5wDw2HGLE6wqCw3KCmjngKjvNbdV@lists.infradead.org
X-Gm-Message-State: AOJu0YyxciAsUfxW5QFMndg6JCTH2oPPGzxHkQ6TQb4Qu/vczPmBR0cM
	jwP5G2IK0PI7VfHqyQseTCadL42hZBc1FQGoE/7Yn17leK1noV4B76aTXWDOLJ3GBwbP8YODIcJ
	Nd6+FM9gpDjX7NTxE74zHsOopW394dbUtpRVNkjML
X-Gm-Gg: AfdE7cmJENn5N9+0bxJaC8gSybPeTX/hCqtS2IFRbZw3jFAAIkmQ5RSjqQPCu4cvy+/
	GyiWAjZqwRHQgFu9+OZedvNUwu+qXBcJ+VmH7AKg0qYc11aFSKx56DOgaYl6FIWiExM1ReYwxpt
	tm4/ROCYh81Fsrrh1j7SP+Q+RzxUxDRlBn+EQHD2io26chAbbvbKUN7KXk7Un0OECt856v83/El
	n/ZycFEmWDslo/z+9oRbwqSIeKuYkUVDux4sN7t4CJ5RFXQ50l4QATqeOWQyRVTyxnqGlr83FTT
	xlrBKGMf7o7lBlY9vYZ0DakAACO6ZNBoDCy5
X-Received: by 2002:a05:690e:138f:b0:667:db66:eb59 with SMTP id
 956f58d0204a3-667db66f471mr5286970d50.22.1783924867897; Sun, 12 Jul 2026
 23:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260709095726.704448-1-wenst@chromium.org> <20260709095726.704448-6-wenst@chromium.org>
 <2026071025-diffused-jersey-0d94@gregkh>
In-Reply-To: <2026071025-diffused-jersey-0d94@gregkh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Jul 2026 14:40:56 +0800
X-Gm-Features: AVVi8CffSvw8dKrdOHbSnASMEsx0puSGrR918doi02cLaaF9gK20T18TFDW9zpc
Message-ID: <CAGXv+5EyJ3WewkWfEy=XNA=VoU4Fuhi2K6evkvFanWhVe8J=ag@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB port device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_234109_930070_D9845DDB 
X-CRM114-Status: GOOD (  31.10  )
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

On Fri, Jul 10, 2026 at 8:08=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 09, 2026 at 05:57:10PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v3:
> > - Added missing fwnode_handle_put()
> >
> > Changes since v2:
> > - Skip assignment if hub firmware node is ACPI node
> > ---
> >  drivers/usb/core/port.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index b1364f0c384c..e8fb2acd77be 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -7,6 +7,7 @@
> >   * Author: Lan Tianyu <tianyu.lan@intel.com>
> >   */
> >
> > +#include <linux/acpi.h>
> >  #include <linux/kstrtox.h>
> >  #include <linux/slab.h>
> >  #include <linux/string_choices.h>
> > @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device =
*dev)
> >  {
> >       struct usb_port *port_dev =3D to_usb_port(dev);
> >
> > +     /*
> > +      * At this point ACPI nodes and swnodes have been removed by
> > +      * device_platform_notify_remove() in device_del().
> > +      */
> > +     fwnode_handle_put(dev_fwnode(dev));
> >       kfree(port_dev->req);
> >       kfree(port_dev);
> >  }
> > @@ -780,6 +786,13 @@ int usb_hub_create_port_device(struct usb_hub *hub=
, int port1)
> >       port_dev->dev.driver =3D &usb_port_driver;
> >       dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
> >                       port1);
> > +     /*
> > +      * ACPI FW nodes are associated later when device_register() happ=
ens.
> > +      * Skip assigning one here to avoid potential conflicts.
> > +      */
> > +     if (!is_acpi_node(dev_fwnode(&hdev->dev)))
> > +             device_set_node(&port_dev->dev,
> > +                             fwnode_graph_get_port_by_id(dev_fwnode(&h=
dev->dev), port1));
> >       mutex_init(&port_dev->status_lock);
> >       retval =3D device_register(&port_dev->dev);
> >       if (retval) {
> > @@ -852,6 +865,7 @@ int usb_hub_create_port_device(struct usb_hub *hub,=
 int port1)
> >
> >  void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
> >  {
> > +     struct usb_device *hdev =3D hub->hdev;
> >       struct usb_port *port_dev =3D hub->ports[port1 - 1];
> >       struct usb_port *peer;
>
> Is this last variable addition not needed here?  It's not used.

Indeed it is not used. It was left over from me figuring out how to release
the fwnode handle. Will drop it in the next version.

I still have some other comments to cover. And I want to go through the
code one more time to check Sashiko's concerns on the main patch
"usb: hub: Power on connected M.2 E-key connectors with power sequencing AP=
I".


ChenYu

