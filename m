Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A9DCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=; b=SGLGoqx4eb+GsUl/JBkYSdvXEU
	dB30h/JbMSvqA4ZXR5te1wR+XE7cKGa/HjHDk6sCx9tG7BhgnBJuVwLFFy7eioUv2fc0vaNsAhy2a
	w3PQitSFjUoK1W4ClpVM+QzghFFZWaoc021k6hTQ9fskm6y/hf+iVt2UeDgJ4GViOw9+YqbOJXg8L
	m5qTJN3wtxvM4W2ta9jKf8f1nZz5XjbyfQ5DrhDlKCFzGgtgwn6rI+OU0+XlJKrxNWFQdLxvf4W+4
	ZS/lSe2NDC7QYNyePGUMH2OklOVSSR4vVNYo/dXCqPTiFND7U4Y+l9nX7pAvAdWh9bMYkARLQ9xZU
	uGNFPZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEQD-00000008ZGg-1N9Y;
	Thu, 01 Oct 2026 10:53:53 +0000
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEQA-00000008ZFC-3Hpm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:53:51 +0000
Received: by mail-yx2-x0f.google.com with SMTP id 956f58d0204a3-671563fb8beso6306841d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 03:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852028; cv=none;
        d=google.com; s=arc-20260327;
        b=qmX2UTdhtievRFMJbdaboJaZR0r/zEJnpm7Xalu034WX5d9DFV5tUDtGGWB4V4ENXt
         L7iL9gAZzp99+nYhCq/9kRYNlVv1wkBVByYqhtvbDjAoM9MR378YWpVYIv+eC9HIFQSj
         3pVCqgixat+FJr/p0tKdooPsp4q1PoMe1mS98ekLuW5nofNWrIKNG0kwVh8m9sB3WvyU
         Wx60KgIgrGngoWb9GCW6F0g/Tl+ZvQc1x1X/XH0qBd4WoFTuSywIf+rtz5m+E0sR26Ox
         +gGixf0MghQSqrs9QjHpJtWgZ6hCXoO+y7aPpWbUmxDR050b4fqBTkC09Y/ZZgSktTxl
         WNMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        fh=hK4Q+7uimasL+1WbGp4KN1Maqz6mr8QqIaTpALKgwOw=;
        b=V5MQG8Wp+WUPEu9l6dpIN1oXm+h7uRTZfC+b/Crqcytvqt6H/afZB/fVAjDsFuQbf/
         IsHH2DtRqgrsXR1kMYCctVn0CVVXq58FZKtye2J2T5yDLkaoO+NBFkDeJR3JlmBa9bE3
         HzT3IXoRZI1XDHr1NR0rFeRmifO6nElKdLb6qfrUo0KfI5Up5xMZgDXyp4HEbOqb1PYg
         eQHpEQxfWB0xQGV3M1q1sLW0+GaggyqTGanzu8PetZ+5L9lElUNFvbGVmn/E5vNVkOJ9
         UOlYuDetgjiLZ0N5EXnoVo0k48KFqGjJBVjAf+9XclhFeIw2OH01nKQTNqKpG6dFwYpt
         DZYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790852028; x=1791456828; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=F6lsJG0MdGY7Q6IlclZWkMURnq95KA/DlZf8BXZJSqyl9wmxSq/k1BH11DEd8ht6/m
         7am79JwVIyet88rt/CCu4KEI/tpaeDzwYGE4X+f2uP4FU2TnQCtMt105G+flVoBLQCGw
         qhCirve7R74Pqeu7DFlYoOK6e/79hotBX/GOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852028; x=1791456828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=UxU+uwf9NMrUzVKeIAyZJo6u6JNWSd5Xgzm79VknpX3L2wbGKLBNkA/h93a8xAOJ7x
         bfUqxdyGTPVI6YWuk7z+RBGmNql5/mKW4gdLqhzlALLJv8XBmsJnSuACQjV0IZSLcd4y
         JniwtXgSXYcfOKb7rk+iOSymzamd8h679H21rLT4JYsu2JG+4ShK/g0/rviRGP6/m20+
         o0X6qz8rS9ubWwkLh/BsAFJhygUlW9Vt0k3f3JTy8uLWZE+KI6QkdNTYDuZKM/vHsr8d
         7zcPMVrU7PXa6AJGHkg4grPQl2eM0LvnHFEoikVpfRUayfmiP8GF99uYstcbwOXHHvtd
         Lz9g==
X-Forwarded-Encrypted: i=1; AKwUvBwLQmme1dPzoDqtWTAwrcJ7G4dJpA6uyTMcSqWYUGIc/e0DUJVhUy9FGZ4csede9R5r+2UwCvA+QK9eEH9TLbg7@lists.infradead.org
X-Gm-Message-State: AFq9FYJJL/uY20D0CA3iX4nYrIUji2sFj7/5XBhiERikuPPNEkZ+XgBY
	dmS4dbuibsju+b6Jnlp+nlrogk6DBKRwjTCh5M4PtCEr8AUYBuG3Js+ltvQB5HfxHqZBGJnYCZq
	rebL30dluRG9m++DgEtqCMJjp7zNb68zdokNfJe1M
X-Gm-Gg: AYBFou3/Erwihx+ygIx7cMviYeMGszszT97oVXPDKdBPfm1aIhIFLs0A5vPrgtjyvSv
	JAL0/CaWDTiLOHsMRJ9sDw++bJcaVZ4WFfu9qjNqU2yinfZVICD7hCGrl69CJPEQ1+MyfvCvRzB
	AgFGxqd0xU32wLD7S6Ovc5BaAStn4lM5CDiSNTaL/qfM7NHAYB00+GjGeWPmjChwyDllc4kvoIL
	hb3MuPy7I6scCwRh85KlfseGYQKwGKnebJgjflvbnkBh2Ru7rrAnyLTdtk7vVcDQX8D8OPIB/D7
	Uron1ZhKji4ssUWtzgbRc6J6DipF2HdLX0+qdLjD9ENrfAcWg57u6/G2x8VGuaaeMccpDwT/UiE
	ypX/vC3Fkzw==
X-Received: by 2002:a05:690e:4105:b0:676:9954:81ef with SMTP id
 956f58d0204a3-676995489a9mr323421d50.14.1790852028003; Thu, 01 Oct 2026
 03:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260916075745.3549953-1-wenst@chromium.org> <20260916075745.3549953-7-wenst@chromium.org>
In-Reply-To: <20260916075745.3549953-7-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Oct 2026 18:53:36 +0800
X-Gm-Features: AclHuK_wafiRDk696txMZ3q8q7Qaz4NsP-wYkipLMPcHq1r5tW6zotnKrD-_NRc
Message-ID: <CAGXv+5GdBUafk6niG-UMDx=z6LJQ6iHAWhDpm1Ly2ce6CQDaxg@mail.gmail.com>
Subject: Re: [PATCH v9 06/15] usb: hub: Associate port@ fwnode with USB port device
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_035350_832271_C92DB525 
X-CRM114-Status: GOOD (  32.67  )
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

On Wed, Sep 16, 2026 at 3:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
>
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
>
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Added extra |struct fwnode_handle *| local variables to shorten lines
>   (Andy)
> - Added comment about passing fwnode_graph_get_port_by_id() return value
>   directly to device_set_node() (Andy)
>
> Changes since v4:
> - Dropped unused |hdev| variable
> - Added flags for fwnode_graph_get_port_by_id() with
>   FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
>   ports can be connected
>
> Changes since v3:
> - Added missing fwnode_handle_put()
>
> Changes since v2:
> - Skip assignment if hub firmware node is ACPI node
> ---
>  drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f59..c0a51d9b06a6 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,6 +7,7 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
> @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *d=
ev)
>  {
>         struct usb_port *port_dev =3D to_usb_port(dev);
>
> +       /*
> +        * At this point ACPI nodes and swnodes have been removed by
> +        * device_platform_notify_remove() in device_del().
> +        */
> +       fwnode_handle_put(dev_fwnode(dev));
>         kfree(port_dev->req);
>         kfree(port_dev);
>  }
> @@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, i=
nt port1)
>  {
>         struct usb_port *port_dev;
>         struct usb_device *hdev =3D hub->hdev;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>         int retval;
>
>         port_dev =3D kzalloc_obj(*port_dev);
> @@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, =
int port1)
>         port_dev->dev.driver =3D &usb_port_driver;
>         dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
>                         port1);
> +
> +       /*
> +        * ACPI FW nodes are associated later when device_register() happ=
ens.
> +        * Skip assigning one here to avoid potential conflicts.
> +        */
> +       if (!is_acpi_node(fwnode)) {
> +               struct fwnode_handle *port;
> +
> +               /*
> +                * fwnode_graph_get_port_by_id() returns either a valid f=
wnode handle
> +                * or NULL. Passing NULL to device_set_node() clears any =
associated
> +                * fwnode. It is effectively a no-op here, since no fwnod=
e has been
> +                * assigned to the newly created device yet.
> +                */
> +               port =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNOD=
E_GRAPH_DEVICE_DISABLED);

After AI hinted, I found some dwc3 hardware to test this on.

"port1" needs to be remapped using usb_hcd_find_raw_port_number() when the
hub is the root hub. Otherwise both HS and SS ports end up getting the
same port node, which is incorrect.

Same needs to be done for "usb_of_get_connect_type(hdev, port1)" some
lines above the diff context.

This mapping is currently only done in usb_acpi_get_companion_for_port()
and usb_alloc_dev().


> +               device_set_node(&port_dev->dev, port);
> +       }
> +
>         mutex_init(&port_dev->status_lock);
>         retval =3D device_register(&port_dev->dev);
>         if (retval) {
> --
> 2.55.0.1032.g73a4cd73de-goog
>

