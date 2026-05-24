Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=; b=PoVULUsBakb0d4CP2yBisoCWzD
	t4ccujxbM58pzS2+IvoW4VrxZuLDAlwFmaC3vEibuNP5v1PTbYCwlMAUJTzF7LvDp1K4wd5EzQSGI
	DHMleJnBHo3hnM1g55nkqIo/If8LToRDt6n/5iYrID8+78kOBg1zSOLP3gZLpXE1mXZbdR3IoJBJ5
	JRTpyIssJrZq29AmC4oXV1XRm8tlCcUi13xjExOr4LOtaqW4McQPqmjxIVLMoMtByHn7OsEZuQnPt
	ERnVGAgVeqc31EPQmyiUR0kocrwzv0Y7pRt3xjbsvCiHz0ax+5mxET2UZW4YR5Om0kSbUMu+N7A4P
	o5YmN6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3r9-0000000EfCL-0TkI;
	Sun, 24 May 2026 08:06:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3r6-0000000EfBM-0nh4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 08:06:42 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a8c94cefcdso6623176e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 01:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779609997; cv=none;
        d=google.com; s=arc-20240605;
        b=U+4tBWrF9tf/vTQy8br3bUlqlzTIsX0iaN6Dl1sWiWzcI2TtP3/S1H3jzqHQfMfjQk
         VhO9Ca/UAXTntKS8GeMR0b/22nfTJOEGcTkpdrI9QOQJOm+B3L5df4hUNn7MlndjQYY0
         CNz31AOaU3+BHlfu/CMO4/dWlKm5i88Sco6PdwJNb3VGj0jEgl95p0x72w100+KAh8u/
         TK9P+8IPCyNoaXJ7RcN2cYyFraTSlATltSMQ6hDqDvgJ6vzmUrt9sL8NemCiQnQsMM4k
         pHda117MpaoQw8QC0rOjgyToDbM6i/0cjHFRDEP78xVVDUkIp0kf+FenauiDtBlEc1ou
         2lbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        fh=iwuMAQhpXcwtIIGzpR3DIwQPrwWH40l36i6mQQUL+r4=;
        b=T+23HiCcHPPtwFQHKH4R9S49032Palq4BKM3oC0UrV6dQgv09Yzz2w/qFqtHMp+S/a
         JXTD7XNtQ22FNJdIP8hkcwZhiQVIJY5byE67iCoA40Jg1Xf2o8RUWbe0eQfnPs4wdeK8
         Sw4jeGH4MQmavp30gea+fT99lZ4ktlJvaaYMGqfStWncJJY4sxjaLmXDXgxMduJckc57
         ZzpR4Gv8iRni/Ea+n2bdB9oL/IccUX6MgZq2ulezeBEFzmc3DatmUckUUR3/bcG2XHhw
         D2vk6IO2/m3ZCX2yCmID2vNsRO/DpH8b7ioIuBjjfahx4aGILxTl2pvgRU0jqBOYYpL7
         KPRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779609997; x=1780214797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        b=VjzeJho192ayUzD1D9eJOBDIVzUAw5mGn77fL5JcIlWeFMPfbdZxzcaitYFYZc8nZI
         coaULb5SwfDWd3tjtwnYQ/5FFN8ppLu2kFsIVE+GHUqjtTLk9nqHHQwI5L5bWPo1r1CU
         TIcQqHKBfAaprRkE7vRhlJ7oITucx99nrTfxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779609997; x=1780214797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        b=iWQ9opCGYWXra4nWQbozC/3qz2VI75zf9YhR6FK5Qi/C3vsxS8vqHKIsYK17G2E5Ya
         st4EhF0Tdlyh1UH3SHOF+eozbEPvf8fLyY6zlKzL9GGbWB4OIy6gaunnBBffAiU5KQDH
         /kTuqvT66aYWejfWT8v0EGvOm/y5Sagp53YWSZEDo5SPzOA7Cym66u5lvE6DfQZB30LV
         tYFaXY8bOLdstYmgkgAA+/g9Otc9k9bu16mdJnwL2MNbwfEBhhrI8VsTd5wDIIuPW7ir
         Vr8VLU4pNHOvFJfn1zxi1F7lbmOfel+0WWqlLu40mR96YNh89ZAcqZIoqotbqqmTTLiu
         V6Sw==
X-Forwarded-Encrypted: i=1; AFNElJ8rTsZ5kuYrXoJGeVuTe5FDgDKYF+pVKhflaGjhWEndzYMQF09kxPDT5eKrHRDfA6e6VhSfwX3Q64aSfwVJF8vU@lists.infradead.org
X-Gm-Message-State: AOJu0YzkJ1rzqOK487yzQeU9aULA3c9hYa3HZka+b3Ipns3sbQ3TOO+b
	WagXW8TjFP0fQRkP0zpFiYURAqmfDnHwVVokG/F6t5iG2plEMBnZZpVXhrOodOUjKaJslJ8lKfc
	X+RbVGmY+LMWoC/VdyH6mkb7m3lTTE4ThBs6gdMSW
X-Gm-Gg: Acq92OEZefgyrw0ouWVkeo4EsCDbQj1ZrQ+4Jhav0q8sIDmt29kWYwFryrT9MGoidLm
	w8XEmWlhmY/CmTIofWNIKQw2FpTdHF+qfKxEfxFI+GnGzuScWSTiN0/PfEpQg9Eg2t9FXCeppdU
	STS1Zg2Q41r6VkZS2mdoG4Ufd+lyyp4m3BoxfzgfjwL8lwn/YWs1tYAwuMqQiylxMgmmsXVEQeo
	7UPvlMhzkddKMl7Dvyw+e4Ee+dWUbHJywVXACNdEZ9Efrnw4xk2vXCcmYhc2xRdAEWBOU7qaP1j
	p+Imt5H829AIo717
X-Received: by 2002:a05:6512:1548:b0:5a4:52e:5933 with SMTP id
 2adb3069b0e04-5aa3235c913mr2060405e87.5.1779609997332; Sun, 24 May 2026
 01:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 24 May 2026 11:06:26 +0300
X-Gm-Features: AVHnY4KQQKvEna3YmFG3JiRUMuMCSWWGPOX7GZHTMr-aA0Q2R8PaQnONHyygdDE
Message-ID: <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_010640_408674_EFDAEA0F 
X-CRM114-Status: GOOD (  47.17  )
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

On Wed, May 20, 2026 at 7:01=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, May 15, 2026 at 11:02=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > Hi everyone,
> >
> > This series is my attempt at enabling power sequencing for USB to suppo=
rt
> > the USB connection on M.2 E-key slots. M.2 E-key was enabled in v7.1-rc=
1
> > with just PCIe and UART supported [1].
> >
> > Most of the series is based on next-20260508, while the DT changes also
> > depend on some other DT cleanup patches I sent [2][3].
> >
> >
> > Patch 1 reworks the power sequencing framework to allow matching agains=
t
> > different USB ports. The consumer API gains an "index" parameter (which
> > is the USB port number on the hub), while the provider API is reworked
> > to pass the index to the matching function of the providing driver.
> >
>
> Sigh... I would really prefer to avoid going in this direction. IMO
> it's not very clear what this index actually refers to in generic
> terms, given that pwrseq is flexible on purpose and there's no
> specific, well-defined DT property which could have an "index".
>
> > Patch 2 implements the index matching in the pcie-m2 driver. Matching
> > only happens when a valid (>=3D 0) index is given.
> >
> > Patch 3 reworks the power sequencing targets for the E-key connector in
> > the pcie-m2 driver to add targets for USB and SDIO. The former is used
> > later on in this series.
> >
> > Patch 4 reworks the USB hub driver to return the actual error code from
> > hub_configure() in hub_probe(). This is needed in the next patch to
> > correctly return -EPROBE_DEFER.
> >
> > Patch 5 lets the USB hub driver look for power sequencers for each port=
.
> > Currently this only works for M.2 E-key connections, but it could be
> > extended to cover other cases. It should also make port reset via turni=
ng
> > off the port VBUS work, even when VBUS is not directly controlled by th=
e
> > hub.
> >
> > I expect some discussion on this patch, because a) it adds some
> > OF-specific code into an otherwise generic (core) driver, and
> > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powerin=
g
> > on the port twice, which negates the port reset part.
> >
>
> I understand that you do this because the port device has no OF node
> assigned. If we wanted to call pwrseq_get() for the port device, is
> there really no other way to associate it with the correct pwrseq
> provider?

I suppose we could tie the "port@X" node to the usb port device, but
AFAIK no other subsystem does this so we would be introducing a new
pattern.

In the M.2 pwrseq driver, we would have to match by port node instead
of its parent device node. We may end up with different behavior for
the USB target vs the other targets.

Also, the "port@X" nodes only exist for the OF graph connections to
connectors and/or muxes (this series doesn't deal with the latter).
For directly connected devices, there is a "device@X" child node
directly under the USB hub node. That node is what gets tied to the
the USB device.

> Does the child index in hub_configure() relate to the port index as
> defined by the unit address of the port DT node? I'm talking about the
> X in port@X?

Yes. The downstream port numbers start at 1. I believe 0 corresponds
to the upstream port.

> > Patch 6 reverts an incorrectly modeled OF graph connection for the
> > MediaTek XHCI controller.
> >
> > Patch 7 then adds a proper representation.
> >
> > Patches 8 through 12 enable the M.2 E-key slots (used for WiFi/BT) and
> > USB type-A connectors found on MediaTek-based Chromebooks. These are
> > provided in this series for reference. The USB type-A connector changes=
,
> > while not directly related, have overlapping context, and was easier to
> > include. They were also used to test some extra local changes I tried
> > to convert the USB A connector from an onboard USB device to a power
> > sequencing provider.
> >
> >
> > As this series changes existing power sequencing API, and also uses the
> > changed API in subsequent patches, I think the best way to merge this
> > is for Bartosz to take the power sequencing patches and provide an
> > immutable tag for Greg to merge and then merge the USB patches.
> >
> > The DT patches can go through the soc tree once all the driver and DT
> > binding changes are merged.
> >
> >
> > Thanks
> > ChenYu
> >
> > P.S. I'll be at Embedded Recipes if anyone wants to discuss details.
> >
>
> I'll be there too! Or should i say "here"? I live here after all. :) Let'=
s talk!

Sure!


Thanks
ChenYu

