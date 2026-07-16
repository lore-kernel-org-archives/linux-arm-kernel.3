Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE87C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=; b=hBBOE/iEMyV4cJtX1BSGi0rwmd
	qDUS0qsP/g9LMHn2AlQJe7BgFdDBJuXSJVmdvin66qu1ZgavNRyfZpPnKLYqfvrGsdngB54f35SYb
	5qWN75jNa9KkUS5bavEWgVEseBFNA6iQ7rrZK7xXDE7NTtjouM/KN7yuuCLRXVTtNBLn6nlXPsTgL
	SApGfptMCOFwopFVWzIzOoMGOLpyRGm2HFfG3bSeE8tvITLnX1ximLPSRShRwrGkMUmZ/M9K15RD3
	GvnYzUjEHpoYI2UhE5xMOtxhp1l9ACv7lxpj1TTSHEXyeB2zPYM9bIvbhNKPzziN0UMBxv2JLkyV9
	7su1lSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDlH-0000000GPk6-3cpl;
	Thu, 16 Jul 2026 04:31:51 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDlE-0000000GPjB-1b6P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:31:50 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-667ef69424bso4816957d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784176307; cv=none;
        d=google.com; s=arc-20260327;
        b=PPin14qkXhpCO21c0BEH8VW5IBqomIPJDQUuvKE0mJznEMrCBShVAzCWRSS5JOZxxz
         dTCq24x9PIdFRc27DAoNz4TnFKNS/Z0BvaP/hmnpJ/wf1t8RAjWvnMDH80pI8ihG254X
         CgQ2HzlpRdIWhSNFXTCEZi/4vqlmZB2nwwj8XPqBZdgRUMk+FNdr3V3FAeod7lweISfF
         owBAHLg7J/R7+2Imm94vodZohp0Nn4x47eOl0BxGOL83IyIskMxkMBzwQPRfLJnFnVO9
         QdFXE1BsaPgRTlKsVaT+NJPFTz1m/yFLhc6vtSA8Kiv8EjzaGV6uLt0XSVgkVLqA9hT/
         P1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        fh=0irW3zwW+htzrFen6fPq/YxmBeZhF3senSQBo4LpCNA=;
        b=XdRwteoVyWbH5IRnIqUBV/jJ10HolkfVC4RJsOwW+04FAWMHCWuDoBvvKrqm/eEC+a
         95Cpdz3JglnrwL8TXLNoeftqhYM93AR8hmxaCb4swKOnTswQTGxrNkRgHTgoStQTpV+S
         yC2c3ec089vcvjr/I11xnyoP1McAYpYXsMa/0oMbKgPswa3vMCRJ5ZddMgFYK+OsMAJX
         pZszDDxdZPbXWxH9MRh5srnz/qHRqx9ARgRIDRTR+hIRwvfcgDV5Z5q7o6wMi+5hS1qL
         3bkqJ3hEFIzxudw8U3gK9Na+c1AJm7UoP72YJn5ZSI1Eq7MJt9N/yrEkhG5jdBIVYBa5
         rYqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784176307; x=1784781107; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=OnNPH6rjM6U2qS6HwE57ocHqcq5hYS2QtijUfN0zMD0DTEj43AdGvPT7eE0iDem4Wl
         rBmlE0oup4uvj8rI7J8YThox94/2rqguN0/MEA5eQRHk4by2yTikMm+g7xsc4fhewfY4
         ZhlmH0HJu2brzSjJs2d2GrK2EQ6Dx9UyHSa1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784176307; x=1784781107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=Hjo6NPJoCXIasRhLyQuA6Vb4R/khRT5ru0uD+UWRBzVt7EKRvUqs04USrJdg8Ziv+B
         2IfXFw11iytJEXPLnHXsc9bnmjvreypamozJ2rGX1Nzg9JgOc9AGgBBMapv6UeoujdzC
         tiTZrB1737KhdmsoU0NPw0hOx2AmiekKQkmIbZ8X0wlkTC6E0u99xESmoRghu/YFl3VR
         VA3ao9LoLYVG/d/wGNyE9XishSNX5lL9wlSrQxqopqBpB3yBz3H43hKiJPhp/OXwG6Ye
         wABCuoD3MZnCP0obA/KB0+rA974n9Slvq7XTht7WTwOtWkLqdJbD39QLXtMoNCTwfWeI
         njwg==
X-Forwarded-Encrypted: i=1; AHgh+RqQJlMl/muZBFtEpY7zs921AR/sN+w3G+5vqTW4vc1ePj5cdwKDALCMse6W2PRSsSgNU1FZRI0OQSt94oqQI6Lq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4PnTR8fZUd5mjW7eBPkyi/J4rE4J6QX2vgv1FUE53rv1bgv7L
	S07xGotEfOeg3lKF9qIvA9/uf5ik6+5s0mgSOmOn7ptfnmW7NSkxUJL41SYhHhSt4YSqbuHZ2HK
	pUjhYvYsiz3WsKhWnvNdOCvIoJ7rmQFwOJvf4MjNK
X-Gm-Gg: AfdE7cmnef9z21CRwGztU4eDXok4AxGEVD0TvUHNjKYJO+oTDeTB+2Hj9laGq/e+wBQ
	BRuhr9dGFrGNYcF1B7i+tQIeZu3UfesFSwJAW+Sn9dUjlq5wq4sBsG8UWuzef+HASvCSu9rupzR
	s1wZLLR6rhWSSYyA378Y9TIGyRwXCceK93Gxo817QxTM791lpz36HGkjf1gcFWSf7uCOE3f6LzQ
	c5UH+zZvk9hMZUSpBjiiuKAkh2rFluFmVuFyX0gfhdQVSuE6gtUBQLmJKWK1r4J7q6Nb7ktU6V+
	TwHkcoGi6UErcKln
X-Received: by 2002:a05:690e:1c0d:b0:668:19ff:7eff with SMTP id
 956f58d0204a3-66819ff937dmr2943635d50.38.1784176307120; Wed, 15 Jul 2026
 21:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-7-wenst@chromium.org>
 <aldQ5odptfmK5aCw@ashevche-desk.local>
In-Reply-To: <aldQ5odptfmK5aCw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 12:31:36 +0800
X-Gm-Features: AUfX_mzQbv55XMQ4uR8jO2hQgRvrbYnVnLlttvP6FASpWrSMQxMLCCNzy4VYT9I
Message-ID: <CAGXv+5FAHZP-u1ZyWSUkUrOx7R5-YgBs5y9V4mGTycyrJG3UKA@mail.gmail.com>
Subject: Re: [PATCH v5 06/16] usb: hub: Associate port@ fwnode with USB port device
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
X-CRM114-CacheID: sfid-20260715_213148_422078_2DA9671B 
X-CRM114-Status: GOOD (  23.11  )
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

On Wed, Jul 15, 2026 at 5:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 04:53:36PM +0800, Chen-Yu Tsai wrote:
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
>
> ...
>
> > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>
> What about adding
>
>         struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>
> to the top of the function, and...
>
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
dev->dev), port1,
> > +                                                         FWNODE_GRAPH_=
DEVICE_DISABLED));
>
> ...shorten this a bit to

Makes sense.

>         if (!is_acpi_node(fwnode)) {
>                 struct fwnode_handle *ep;
>
>                 ep =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_=
GRAPH_DEVICE_DISABLED);
>
> // Is NULL or error pointer is fine here to be set as fwnode in port devi=
ce?
> // Perhaps add a comment?

fwnode_graph_get_port_by_id returns NULL, but not error pointers.
And passing NULL to device_set_node() basically erases the current
associated node (which is NULL anyway, since we just created the
device) so it's a no-op. I'll add a comment.

ChenYu

>                 device_set_node(&port_dev->dev, ep);
>         }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

