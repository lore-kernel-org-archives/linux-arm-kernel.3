Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F34ECD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO1E9F7wgo/77mIm8rZU5i8TCq+arHzjaWY5F0pap6s=; b=bYqRpkeRmkMnbQlFHZTHNL6aDS
	kGzR9i/ySLT2lrRdF8F8ApuOn39ZFoDgg2FAJZSo42i/iepAG0sMhKsFkPjLhYvqpcLh/uj6A+WMV
	5G7JDAr0pHxa/OqfZrMOYUoKO5tLChwPiIVakISIUIOq1irqDersTrQxgadwK8/t+u9b5VzP1IURg
	nQpP5sam6WplQ8zBttAkbYm74GCYRGRL8zNuZ/isyP0mOL9NuDwi+S4DL1Q91fsC2/LPg8NSKOmm9
	p5XqkrqbeGXpwXO0R6qPNzwUTc9kOaWvChoddJWwEB9dP9lNTzcVaJ92ryHR2NAg1lWpC6DxqPBer
	/AZM7gew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3BG-0000000Dvvu-3JAT;
	Mon, 15 Jun 2026 09:00:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ3BG-0000000DvvY-06XK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 09:00:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B3A9444E5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 09:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2181F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781514029;
	bh=kO1E9F7wgo/77mIm8rZU5i8TCq+arHzjaWY5F0pap6s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Jyn7pVSq85LsQmK/q0tyyFAHEfg8UAN4YckNlIfPsCFOWmtcOiwbMENAt2D6pI9lZ
	 1ZorXAjBJjrkQz8owCkA4UA4UCls87SqapCtOpTjavhlpFhAWsyKP2BqohWLJK7DkY
	 MrYZV3Cl7tRD/0xwTljASOpfcNSQn92Cepxz5NPg5BPXxvPIDeToSaPQ+HcehqiSJ9
	 hQTBvUnmcKv+I1kJiRvWlWP2+bDGjG3X0QrpTadESyGemGgW0o3BCPfo+Xlko62peE
	 OKTPMIABFzTo4x0+O0u5e+/RnwbJvxWzMEOQJBMGE8JtTPfG5COXJjHKljhzLU4nbW
	 7EwntvamoA/UA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so2599642e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 02:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+XqupcM9J6VztDf2h0nN89MIvPwG6HwooEdfhT4J7LPv/kKmmx5wiyZed/an5qfc9Fo25cNkOlUWppdWh6RmEm@lists.infradead.org
X-Gm-Message-State: AOJu0YxutIpVzjTqHMrbKyxiiG1ZRroTSKVxQ/peUHcZUj8IkMRT12uB
	yUqvI9AToofxkdDJhBTymah1dLeilaZScjTYBy+tWbgmxklv8Ut160BoiaeRJItq/YJpNPV2eQA
	9EQ1pw5X3dNJL6jqe53H1Sb/nDOqQ79kglKAoAhpJxQ==
X-Received: by 2002:a05:6512:40b:b0:5aa:8822:c944 with SMTP id
 2adb3069b0e04-5ad30dd50aamr1888691e87.46.1781514027973; Mon, 15 Jun 2026
 02:00:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 02:00:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 02:00:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5Hf_V4=mkAc3pN8_K9i+FfH2Wv7HVJBq71-f8sMFYL3fA@mail.gmail.com>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local> <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
 <aipz2zMFcdnZYTxS@ashevche-desk.local> <CAMRc=MdRN7YitmMX8PknbzLh+MdsWm+dDg0MLtCVYOorqNobTw@mail.gmail.com>
 <airY6IMz2KFz_z9j@kuha> <aisEccAOm3qoXjxd@ashevche-desk.local> <CAGXv+5Hf_V4=mkAc3pN8_K9i+FfH2Wv7HVJBq71-f8sMFYL3fA@mail.gmail.com>
Date: Mon, 15 Jun 2026 02:00:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcr2oMRQv_FPds=7QEF=7Q6+keqo_AzJ4iNBnhL+v_NNg@mail.gmail.com>
X-Gm-Features: AVVi8CfllpqpnNK5oNjDe5YaMrrIp_PMpqlIec8MT94CN56JvkF5jdb538qT0FI
Message-ID: <CAMRc=Mcr2oMRQv_FPds=7QEF=7Q6+keqo_AzJ4iNBnhL+v_NNg@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 12 Jun 2026 07:46:26 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Fri, Jun 12, 2026 at 3:54=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> On Thu, Jun 11, 2026 at 06:48:56PM +0300, Heikki Krogerus wrote:
>> > On Thu, Jun 11, 2026 at 11:35:13AM +0200, Bartosz Golaszewski wrote:
>> > > On Thu, Jun 11, 2026 at 10:37=E2=80=AFAM Andy Shevchenko
>> > > <andriy.shevchenko@linux.intel.com> wrote:
>> > > > On Thu, Jun 11, 2026 at 04:20:58AM -0400, Bartosz Golaszewski wrot=
e:
>> > > > > On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
>> > > > > <andriy.shevchenko@linux.intel.com> said:
>> > > > > > On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
>> > > > > >> When a USB hub port is connected to a connector in a firmware=
 node
>> > > > > >> graph, the port itself has a node in the graph.
>> > > > > >>
>> > > > > >> Associate the port's firmware node with the USB port's device=
,
>> > > > > >> usb_port::dev. This is used in later changes for the M.2 slot=
 power
>> > > > > >> sequencing provider to match against the requesting port.
>> > > > > >
>> > > > > > Okay, would this affect ACPI-based systems? if so, how?
>> > > > > > Can you elaborate on that, please?
>> > > > >
>> > > > > Is it possible that there's an ACPI device node associated with =
the port like
>> > > > > on some DT systems? I don't think so and there should be no impa=
ct IMO but I
>> > > > > also don't know enough about ACPI.
>> >
>> > There are device nodes for the USB ports in ACPI, and I think they get
>> > always assigned in drivers/usb/core/usb-acpi.c.
>> >
>> > > > The API is agnostic. There is a possibility to have software nodes=
 associated
>> > > > with the port. I think the best is to be sure that ACPI-aware peop=
le who are
>> > > > experts in USB will check this (Heikki?).
>> >
>> > I can't say what's the impact from this patch - I'm not an expert with
>> > this side of USB. Is there a danger that we end up overwriting the
>> > ACPI node for the port, or something else?
>>
>> Exactly this one is my worrying, but I haven't checked the actual flow.
>
> Looking through ACPI code, ACPI_COMPANION_SET() is used, which boils
> down to
>
>     set_primary_fwnode(dev, acpi_fwnode_handle(acpi_dev))
>
> This is called through
>
> usb_hub_create_port_device()
>   device_register()
>     device_add()
>       device_platform_notify()
>         acpi_device_notify()
>           usb_acpi_find_companion()
>             usb_acpi_find_companion_for_port()
>           acpi_bind_one()
>             ACPI_COMPANION_SET()
>               set_primary_fwnode()
>
> Looking at device_add_software_node(), all swnodes are secondary.
>
> set_primary_fwnode() seems to be able to make the ACPI handle / fwnode
> the primary, keeping any existing fwnode as the secondary. However
> if we do end up assigning a primary fwnode to the device using
> device_set_node() as in this patch, set_primary_fwnode() is going
> to complain loudly.
>
> On another front, the ACPI representation of the USB ports looks nothing
> like the OF graphs, at least on my X1 Carbon:
>
> For a usb port device on the root hub such as
>
>   /sys/bus/usb/devices/4-0:1.0/usb4-port1/firmware_node/path
>
> looks like
>
>   \_SB_.PC00.XHCI.RHUB.SS01
>
> while a usb port's firmware node link
>
>   /sys/bus/usb/devices/4-0:1.0/usb4-port1//firmware_node
>
> resolves to
>
>   /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:19/device:1a/dev=
ice:29
>
> Neither looks anything like the graph "port" / "endpoint" node names.
> So maybe we're in the clear here.
>
> Besides the loud warning from set_primary_fwnode(), the major issue stemm=
ing
> from a wrong node is that power management (through ACPI) is likely to fa=
il.
>
> If we're still concerned, I think we can skip the assignment if the fwnod=
e
> is an ACPI node, i.e. check it with is_acpi_node().
>

Agreed, I think this is a good compromise.

Bart

>
> I've never worked on ACPI systems, so this is just me checking the code.
>
>
> Thanks
> ChenYu
>

