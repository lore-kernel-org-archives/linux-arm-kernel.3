Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8837CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=; b=hXhEjIwKDC2/t0lDPt0gQoBglx
	6yQjuXDwFKx0t30NPBFA/94t8JZKht2Z8JWS3IKbVtqhYdN3jT0B/jvRvvb4r4x7zEGsRij3rHBfE
	+Bd01BYpaS+8F64tuOH4EM4qx5KI5eEX00wS4+/OUPGVwONwRV4CL62ULz+E7snCmM44pofZrgQal
	0kUIdHGMqU7jYms6FNYGnG3rT8MHfqLzFPBrV3hHZKbGI6eX3LHh8EwdqdMCvvA9P0C1iWKz/w5Ri
	9/94lgkiVVI5h2T++rCEQeJ8ibDhGDUyz59x1hCfk8/UC3adwsbIDuSHjar1GoSM/sOt7YyMnyqM1
	zyLX7x4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxfy-0000000ActG-0sIA;
	Fri, 12 Jun 2026 08:55:42 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxfv-0000000AcsV-0W9O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:55:41 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7dca5a81be2so6939137b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781254538; cv=none;
        d=google.com; s=arc-20240605;
        b=an4h4+vOG+qwFlVxsxryy3qrszcStDlSadcJ0hW62fFUpf0iwrd/QhXxcLN0bPZDJh
         3M/tpunVY+gA+q0lMs7dkX+EYFEcFjg8k14Xg/CypKtAHwv3VDu4CpV9cM6Fb1awmwsx
         MAYuO7aEuBqi0XtnoFfM5cuVUfejDG9Vo+6jJPv9rqmuio5a5Ypl2EAwfIA3DjrhcIqH
         eRynDT1qrqJSCocI3V/VQhrrEgcmQRC3A1BupRKl1tvRyYsY6zx9g7n9s8JA5ooBF9X2
         Rix7PbPoIodGcD8fTC3oPjTKSsx9GmdnSWsHAO9zdM4gRNmC2BeUav8CvT2nwrEfj10Q
         bMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        fh=0CYPzVs5HxDI20qdbrFYKuqPOMueD/0ecad1Em8op60=;
        b=Af+AxuBltcYdysNUrtHUmdrZb8GRaLPZ7U0ZRjPNM5BX/8bqmhhgv3LNmNXg9d5nDn
         b4mKqJR5QoyIaEzC4SLLCkR0qCJaOxby8OSafdZRgHMtE0W0/qeR1B1nczuPCgwzb5FW
         R8x2TH7WJXgBReY/heZ2esbC+y3jJJFBlc2QhuYIXjdLNnrS9u2D8D8suEEkSn3+FDaL
         dAHa8LpYS1bI3K5rlpGCTKpq0LXKUTqk5XWaIPLPHHpooBzh2ybOOvAdzcATPrY36Nwz
         aQTAuAIzNZb+7myRQb/PpxLnNzu9aJygdV22soMzrEDpi3BoaXJWtp6++zJnj2FZmyGn
         wfBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781254538; x=1781859338; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        b=NYxOIgXVOP+kHJFcSfqDyBME5fpy3aPNQhHYzQwmbsGAg8j3kv2FaGI6FRiYI6Xm+5
         WhAeF/mdytZ+tblbE7hHyKwzKJlVAwV2BHZec+mwdnO2pvht5TouhFt7whNacKSQ5wD7
         DeS0vzzAX7Hs74gWo/6weQkSczq6jchA2io6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254538; x=1781859338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        b=q83BsBQwe9CMClJSXEKLzOtPqrD0yodzne0ROXu5Jhq0LmD+tQea5+XDWKARIF9Bsz
         3u3Vns5LZHQg6RM+lAPbOUBqx5g9MUtsUYF7ls2443RtupMbPHQ2R0UEEGMx8MurYk35
         GZZ7rmyeBMQGL0u6CEm0S8fDNyA6fOc0ovYdmcETud82+SyU57NPTq/GPtWF3E7e4czy
         bXT/pM8skPYQ+1zOfv5HpsHOufizJEE47iA4mYBwN44hM/q8U/HaU72fLxLvR+zjUhNu
         Uw7LNFvCXc/xtdMMWRulAkk5fCGYGNEWjf7rWhIU0CrFssoNMqMlljWOrYIgpRBx/U+v
         MeiA==
X-Forwarded-Encrypted: i=1; AFNElJ8tRN/IQjSGlOPDkp0WOvyHfm7QuE1+2sNN4hRUojlIFp4SfB6Kck1NXnGxQQx/ir5JHiCO5IcL95SAnrHjsUMZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzan+qI4qEvii8e9UkoxZXeHfKF1V4SBkJUySsmFY0YXnDv47Zj
	eOnmfRFCWz4oqYpCTnXE173iQE2MDGQRhoUgsEBVdkZ+i5WxPxVOH+3Tddazgv1AT4BMKeq24nj
	QvJAnbVbyuDaPCGtQwCGR7tNi/gvVh/90VrUxE6bK
X-Gm-Gg: Acq92OHQj4yevTexel5UJawS9WTkNehOzXZyJkB0Ceto7Qew+KbRl/caS4oDuFmxn4C
	t44CRwxy+5JTr7EPj9rFF8MAJrWnAADWPmYLYNX1FIRlPMqHb+fbLnHiIoXgyYnv/VVIFjPr+sC
	Z8V13IVqu9e1pw0e14nzsgGQCnOkUcw94RtXGef3DWRAdr//VRdsiOLzo++2KfUuqHGBzsb31Q0
	Henh99KZM6NyicDyuiFnNwy/Ic26CjKEsegKXW3DcXNzi+UZu1GxR/I5oU3biNuz+MwtcWwZoLA
	P/vXu63q
X-Received: by 2002:a05:690c:e3ea:b0:7f5:87d3:c38c with SMTP id
 00721157ae682-7f7b7c3b073mr16472667b3.21.1781254537877; Fri, 12 Jun 2026
 01:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-8-wenst@chromium.org>
 <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 17:55:26 +0900
X-Gm-Features: AVVi8CcqxBgWwqPnctKiq9OR5bHp6we8pjEGtqp_ZFOZvY5Ttt7Fwncjoqrnmf4
Message-ID: <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key connectors
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_015539_239002_4D950E19 
X-CRM114-Status: GOOD (  33.26  )
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

On Thu, Jun 11, 2026 at 6:11=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
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
> >
> > This change depends on another change to make the power sequencing
> > framework bool instead of tristate. The USB core and hub driver are
> > bool, so if the power sequencing framework is built as a module, the
> > kernel will fail to link.
> >
>
> That bit needs to go away I suppose?

Yeah, instead we need

    config USB
        depends on POWER_SEQUENCING && !POWER_SEQUENCING

But I ran into a dozen or so drivers that have "select USB", mostly
input devices:

    config TOUCHSCREEN_USB_COMPOSITE
        tristate "USB Touchscreen Driver"
        depends on USB_ARCH_HAS_HCD
        select USB

Kconfig complains about unmet dependencies.

> I see Andy has some suggestions but in general I like this approach much =
better
> than adding the pwrseq_get_index() function. Thanks!

Thanks!

ChenYu

