Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C80ACD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UE1ukep6rVlGvZk5YzSNt1eDdxkKrWNxxGuKxbk0mA=; b=SqQiTBoKkgck8pbLd0HVn+utN8
	FJaMt/h2A7Gf+dqgZjJiYKpG9U1UhV/EmTBo37V27A+PCCkANZhrop7wfnEL0np4PQ0ed0IndbN6C
	f4WZmbj+f4Wr9BGnLJlbc2s29wFHZXPvZhSfFhgwyuEh6lK0O9BEgNFMHz2lvlP3KJlbl7zh3Aiqr
	dud1OavtMdPNNcWhDKVUPKHv0VGQmLhj3Nn7g2/zjgy7BlBBMZ1nqemlMwC5kRYmMM9beG2ajLZOW
	ezAA6MGquMIxvbfEEJLSZgV1JcVeWIGT2Zzr8DPlb0k/w1LheHRDmaEdLgcWrVD7qcCLeI0+2eMH/
	zJaU+4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWBh-00000005Osg-0AMB;
	Thu, 28 May 2026 08:33:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWBf-00000005OsK-3vFt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 May 2026 08:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:References:MIME-Version:In-Reply-To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3UE1ukep6rVlGvZk5YzSNt1eDdxkKrWNxxGuKxbk0mA=; b=j/rjnUO22Ku31uofuCx7uyO1AG
	64BoZLeYrCE+2wlONuvIkiDeWL2sbadnA21HnBAPLWr0rA7CKcROi/B33xHWxmwm0wsLT2utGiazz
	IqTgrXj1Z2KBlgh/nplK7CXd4DK1hkVWOZHc87ZTBacmGvx+FZuIrPc6af8TKUd8TTsrSvzuUE61b
	9FjWiHbt3XThVCcFC0kqk2sa+Sq9aiUDEQdcHtWIJFRgUMkiLjfh3j3Po85QkNnOpXYCs2+tgZc1G
	RSHEtAv0jaUNP6u9wImtzo/LY6sO3nScUTvOii0rF1yQ1B6TBMweg1KJ1La2p4T4TmNTw8f9p5/55
	KgO4Pw0w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWBb-0000000FqNx-2qMh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:33:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2DF24437B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C931F000E9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779957227;
	bh=3UE1ukep6rVlGvZk5YzSNt1eDdxkKrWNxxGuKxbk0mA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BTt3A5I5n0ay2ZpJFPy9zqNZYf0SojnpzrK4eah8mJc1JrtcSKBdyXfYnZKqB7v+1
	 cJLNn4UDEiXORzdYWVSkX4eeLYPzPhaNMqjEvax1BVzK7L1cz0DqXz/UOa8EV+Z6rN
	 yTdE4+WdcYo+gaOQOmxVVacAmQ5q9Gp+5uix2RG02SVi7+pp6OgsiNhZA1+rK74r33
	 JTqMlW5PU0iF2M+895YI9bhzwpqDxkIHY+ZUpczOuSVAnAER159bipf1NKIRzHLe0y
	 fdJJU2LIm6esC8gOEkfQ5MEqX3JovcoLJRyklBoj+9Gg3BWdgsJaGszzzrB4YZ2s97
	 5Ha7lPil6GKPw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393c93a0166so116024231fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 01:33:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+WnXCpbHud3MO8AVDvT23v8D1JSfRLIZZp3siJyU9QB8rea1LFVknfKh64zEfJUHCW3tFg3ZBRiYS0XbCigcBP@lists.infradead.org
X-Gm-Message-State: AOJu0YzvYb+Uf5UE3szd/2dLl1jN1a/++rZbQ3oLUFvV8SKx7nMpeNAO
	/U+3a7NpeIxXtlXIVrngHyTkRh4h4oaZLT+h8oDcN4YJkgjBYohyi8sVvGZYqnLmqeUQXrbLHuU
	ifNdHcnM/vEjyVXsiTVK/sJeDKFbtf18kW0ZVWWzblQ==
X-Received: by 2002:a2e:8957:0:b0:38d:e220:8dc2 with SMTP id
 38308e7fff4ca-395d8cef4abmr68081351fa.20.1779957226354; Thu, 28 May 2026
 01:33:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 04:33:44 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 04:33:44 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com> <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
Date: Thu, 28 May 2026 04:33:44 -0400
X-Gmail-Original-Message-ID: <CAMRc=McADm0F4bwhj5qoigfUT-AV6CVpo+FAaqoBnZ3PrjBc7Q@mail.gmail.com>
X-Gm-Features: AVHnY4JaLBmctUhYgIAJpJojKGEMDv_BBPh6vAfJvyQAFJsp1fEnomeZ5fRkbMM
Message-ID: <CAMRc=McADm0F4bwhj5qoigfUT-AV6CVpo+FAaqoBnZ3PrjBc7Q@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_093352_703603_05238256 
X-CRM114-Status: GOOD (  40.95  )
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

On Wed, 27 May 2026 18:21:00 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
>>
>> On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
>> >
>> > > >
>> > > > I expect some discussion on this patch, because a) it adds some
>> > > > OF-specific code into an otherwise generic (core) driver, and
>> > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up po=
wering
>> > > > on the port twice, which negates the port reset part.
>> > > >
>> > >
>> > > I understand that you do this because the port device has no OF node
>> > > assigned. If we wanted to call pwrseq_get() for the port device, is
>> > > there really no other way to associate it with the correct pwrseq
>> > > provider?
>> >
>> > I suppose we could tie the "port@X" node to the usb port device, but
>> > AFAIK no other subsystem does this so we would be introducing a new
>> > pattern.
>> >
>> > In the M.2 pwrseq driver, we would have to match by port node instead
>> > of its parent device node. We may end up with different behavior for
>> > the USB target vs the other targets.
>> >
>>
>> I imagine, we can check the bus type of the parent device to know if
>> this is USB?
>
> The "bus type" type is probably not exported. However since the DT bindin=
g
> explicitly says which port on the M.2 slot is for which connection type,
> I think the matching can do a special case check for the USB port.
> The next obstacle is that the target string is not given to the provider
> match function.
>
>> > Also, the "port@X" nodes only exist for the OF graph connections to
>> > connectors and/or muxes (this series doesn't deal with the latter).
>> > For directly connected devices, there is a "device@X" child node
>> > directly under the USB hub node. That node is what gets tied to the
>> > the USB device.
>> >
>>
>> Is this a problem? I don't think I understand what you're saying here.
>
> It shouldn't be. I'm just saying there would be different behavior on
> the USB side for connectors vs onboard devices (like hubs) device nodes.
>
> I talked to Greg earlier, and he said not to touch the hub driver; the
> hub driver should only deal with features from the USB spec. The
> "onboard USB devices" driver is what should be used. And this would
> be a proper case of adding an auxiliary device to the M.2 slot driver.
>

The onboard USB device is what initially inspired the PCI pwrctl code so it
doesn't surprise me we circle back to it.

> However this seems to completely decouple the power sequencing from the
> USB core. Take the USB A connector for example, it was recently added to
> the onboard USB devices driver. However the connector has a device node
> that is not a child node of any USB host controller or hub; it is connect=
ed
> through OF graph. At the same time, since it typically sits at the top
> level of the device tree, a platform device is directly created and the
> driver subsequently binds to that device. This is totally different from
> how the hub and other directly connected onboard USB devices work. In
> the onboard device case, the device node is a child node of the USB hub
> or controller, and the corresponding platform device only gets created
> when the USB hub driver probes, thereby sort of tying it into the USB
> device topology.
>

Which is precisely what we do for PCI pwrctl. Though I'm not sure how we co=
uld
replicate this behavior without touching the hub driver.

> If the power sequencing ends up not connected to the USB subsystem, then
> maybe the M.2 slot driver could just check if the USB port (port@3) was
> used, and just enable the USB / BT pwrseq target at probe time? That
> would mean less changes needed.
>

That sounds sane to me.

Bartosz

