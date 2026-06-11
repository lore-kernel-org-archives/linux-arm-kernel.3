Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E0CCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1t0eMpqsT9YaBJXmjRvQgx584lO6Eznqq7E3RTSQxs=; b=DeI1vcKK8hNdYLw51wFJPhuLOM
	cKMQQ+QYLfEVxb01VKh1M7Tug6uAtPBAI+oVATIjsTK/w7+zvYK+zHRwWSyFFn6WXU5ihxf0824h6
	IyOKW59AnkO25Bix/nxPtpxdOOrSjbsy2fyQal6xlOJ2zNCrfKKI0cefbOnsHzTuFmD03NsTJkJ2A
	dRQUXN9HYU8JQpKWKSlX9Mt5r4OgLaKuZczttn6vx0CeGbvA3UCDrEcXq5QKJxEsiqrf/RlV/TVuW
	pqZFhLYwmgQa7RQJfwygDu/vUovsTaHIUxOgvZerOULEaK2ZUN/J7RS+wkAlAtH04hU3uJUgovCMn
	+e3xcT2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbS5-000000096Dg-3o4k;
	Thu, 11 Jun 2026 09:11:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbS4-000000096Cu-2LK6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:11:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC6C6600AB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6821F008A2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169111;
	bh=B1t0eMpqsT9YaBJXmjRvQgx584lO6Eznqq7E3RTSQxs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bSUSCOOlUoqkjxfDipdP4ZN06c+kGoam+HOQDbIvwgi3CyDkonEwORRznXaYiPTg3
	 LYiVzvjqTLedwOJohBXfEpJGHs0daYzk4JuF/vsucz8NGce0N4CCtgT+b0VuWlIVF2
	 Nm5xBnbizAA8pmP9frj9IdPeljD4n7wwJruC5jnaHkJ/YXmiMxC2u6kXjQIbT4TKwq
	 k/tCiNYYQLbiHyx0O5zC1cDUbv2OJF9a6wrVlbTHgu8Wb+ZYP7Kf1b8YjmSXXg9oHm
	 9O+RhqNu2KRj0vB3DiSTCkVshTiw2TU9x4iLP0mHiJn/4iTPM5PrRTjO8Yz5wzvIpi
	 RlGk03VX6ULGA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39666f49929so67478581fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 02:11:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8R3py6TZ6CxePyYoCBFz1y1Iy9gwEaGYKo7GXAQWwusppAvzu/DpIJL4KnfJaV49mcMkNwzHwmiscec9iw2UCl@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ65KiXX+dEs47gPEnn4nBiAZD6WtQHK2glrQGKzTXPqZsED5K
	olXVkcnzzb89RRGk9SIodqgq3KcHDDhhoOiNWPZ79rxkxvBirhMUIV8+nUoBX9wFKdn+5X2iQAC
	gYtIl9kkD8pMnjvR3AuL0Sxh7ZH9MqF5DioW9ueVObA==
X-Received: by 2002:a05:651c:1545:b0:396:7fa2:e095 with SMTP id
 38308e7fff4ca-39919f96cbbmr4986331fa.6.1781169110130; Thu, 11 Jun 2026
 02:11:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 05:11:46 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 05:11:46 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610084053.2059858-8-wenst@chromium.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-8-wenst@chromium.org>
Date: Thu, 11 Jun 2026 05:11:46 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
X-Gm-Features: AVVi8Cf4NRlpEgfQOjedOZVIy3kDaaZ8Xbtl_Xw4Hfg6m7nAFQEWNEvJmcMEnDE
Message-ID: <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key connectors
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The new M.2 E-key connector can have a USB connection. For the USB device
> on this connector to work, its power must be enabled and the W_DISABLE2#
> signal deasserted. The connector driver handles this and provides a
> toggle over the power sequencing API.
>
> This feature currently only supports a directly connected (no mux in
> between) M.2 E-key connector. Existing USB connector types are not
> covered. The USB A connector was recently added to the onboard devices
> driver. USB B connectors have historically been managed by the USB
> gadget or dual-role device controller drivers. USB C connectors are
> handled by TCPM drivers.
>
> The power sequencing API does not know whether a power sequence provider
> is not needed or not available yet, so we only request it for connectors
> that we know need it, which at this time is just the E-key connector.
>
> On the USB side, the port firmware node (if present) is tied to the
> usb_port device. This device is used to acquire the power sequencing
> descriptor. This allows the provider to tell the different ports on one
> hub apart.
>
> This feature is not implemented in the onboard USB devices driver. The
> power sequencing API expects the consumer device to make the request,
> but there is no device node to instantiate a platform device to tie
> the driver to. The connector is not a child node of the USB host or
> hub, and the graph connection is from a USB port to the connector.
> And the connector itself already has a driver.
>
> Power sequencing is not directly enabled in the connector driver as
> that would completely decouple the timing of it from the USB subsystem.
> It would not be possible for the USB subsystem to toggle the power
> for a power cycle or to disable the port.
>
> This change depends on another change to make the power sequencing
> framework bool instead of tristate. The USB core and hub driver are
> bool, so if the power sequencing framework is built as a module, the
> kernel will fail to link.
>

That bit needs to go away I suppose?

I see Andy has some suggestions but in general I like this approach much better
than adding the pwrseq_get_index() function. Thanks!

Bartosz

