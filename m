Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C4ECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=; b=S0dml4e2KKS4RONa+Nb2CuvQ3P
	Bc65+ZwDK70M2KDBu/DIJwzr6eYf6+ncxWWG3AD012UBH6UGeijRZLt496fia3/24LhgDsN2Lj32f
	xV1dvje2zm4osRf38sRprfw3W66VfG98Sg3IBj9x5cyv+RkDDwT7b3DH10jTYL+zpQ4fDUi7am6L+
	uyyjdkj8UOwj5mZxbokN5jL9y9z05175Jt10F8IrYKZtUjO+d2EDCd/xnFLnWTbTSKITnxFMGo93p
	sxqxZuNVhaCXe0NcybPd/1CyW4VC5jW+bXew/nyc7K0fkvLpwQ5VwRYXApSmb2L+sp1+TxayGz22t
	tY5ZPCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH0R-00000004UeF-1c8i;
	Wed, 27 May 2026 16:21:19 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH0O-00000004Uct-3gv4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:21:18 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5aa4a688f6eso1052733e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 09:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779898874; cv=none;
        d=google.com; s=arc-20240605;
        b=C8DwQOPWsrMwu8djepvuWvzdOsSq85mAarzRC+3bGGiKefzxnmSvflq+NPDt/0WVtm
         LRYzorsugpU5BuKG2iIAjH2QHQBm/F9GDY2JgE3uDhYcHbtqeOgmUjgni5NYpPk9FQdt
         1grFElltJnS0jYItWr9FouhnIa5yuK/4a7mINy5YT1kOElkGdNU/olLRoj4+aHEdCGZU
         QswvthQH3pNg+UeD9aEgAhKneODcSd23V1impo/vaM8XOAUbHHM2SjG2CC9jdUwKTjS4
         hQqZh8pMKV2Cud7RGXZ+H6njYoqdlPh6m9r8zjN5V2+eMuPP85MQU6D838s+D2jbHSF9
         29Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        fh=Ybqpv0LxWgpMdx9jPg7PYmhrBW64dk6cOXfhVflEzWk=;
        b=cqCec0pfNtbKJVjSefnfPLzn8+bgEynVmoZtYIGIqGP492gIz3yXodnHkg1LdX6dsv
         91YR/7nHoEcAUN9SLsH2WvpRMS2/A3tJ/55EYhCbnSalKQEqN4mKY9m43T3kJkOGFo/k
         Aj3+Mo2a4S8SE5OcUWHBCOpZSaoL/ihQi8IuwuEmUb5I5hcNedvym1gBv4Nsg9M7J3oW
         cGTUyvjWo+f8sfs73u6n8WaMs1I8Q+UFm2scWPMvaWavxFRfLSw6LjsbD8SbGDN36CfB
         P/jzE1ptb6QaGIvUuJbkXVitHS6gosCp7zqSeR65Ox4FqFGopUOHaSQ8220ZmfapEcbf
         AfTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779898874; x=1780503674; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        b=K5DhtC8B+dzwYuhVAFjXVDw1RygposiZ5SHd2uOs2TDnYQdpTeuS9wTBWN1hePfQC0
         nv6JbqJw/2xXfxjAadc6Oww7SWAEKnN3Xz602M+SSckIZU1R4LT23q/K83Ml6eUzOGM1
         npB/rHVYwxgwAfw04aJWOpfhhEA50j9Ve1sGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898874; x=1780503674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        b=MdV8pAwMh22SK5H+vIKU0x3khwiONit4iZ0m8CK/DAfMJEX0D2SEAYSfOiAiVCY4wn
         3wv7AnQasXmqKtfG7BkTyKf3/y4nysx+gVPvVAJN1yQ9bkmC3pqGBO0ZsGgeC4+UjbIk
         /3yAvQluKzk2uvDGJURSsy+EwynCB0OrdPu950PL24BNG8RcyPTufZtxBDOWd9cO0598
         65GeIqzChYzckrBth1tbh6dqYUTxwugII38y6jTRbtDt/fWh5K0q27FLapmfp+4E1fua
         hzHX5TlQk/4eHry91cuB2W2zVLkd+BgfVHJMjwsycyLKWXiDAbKsOiYy0S1gocbBZj6m
         k0yg==
X-Forwarded-Encrypted: i=1; AFNElJ93D8dn6Qar7iZ0PpUINaJByK+uKtUan/wb8HHl0Um9oAYUEEdXP42tPlHv5/RoHzMbUC/xMQ03W87m2aONexLK@lists.infradead.org
X-Gm-Message-State: AOJu0YzCoT4dCDbqwXhd40BkKZXs3bKyfzlz6EPS/dfbT4GC0gfxhMwL
	5ne5Vrq4eYCgvIE5gUU/vLOHRZLWABm5LkvxHorS60wJRhJmRUF2xiFViJ16q03Aj3fFnYIcvyy
	cv2FM9LYkR1Ft1ceIzrOHQ7nKrZK1zEyOKlcpiQcA
X-Gm-Gg: Acq92OE+JqXjZh4OXjLW4CAH/nDMgzHv1ZaIYk0yHsMsMMWLjo1e1MEPJFZ14B3uy79
	ZjEeOzMakli8J45d5iO9MUIVMwWSt9C/k5ktIMMEeke2eV9mtU6RJhmX8iWg/QKt0TaV/TODM3X
	ug2ZzouBWV5btLmWEHIn3pbI7sJ8OW+Qm+Sjc9BRizhXOb4CQKp2FdDEQAWHpgQGVK5t4CiKNWi
	k4LQgpu1jHKWmx6IW/6f1zLPsEdGH9DKaulYBGql6km8zJiROs1cgjl+erBk2Qfmjjo5uXdK+3B
	BBhK2302Tlrsldnc/w==
X-Received: by 2002:a05:6512:2204:b0:5aa:b6a:9257 with SMTP id
 2adb3069b0e04-5aa32393ff6mr7614476e87.44.1779898874134; Wed, 27 May 2026
 09:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com> <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
In-Reply-To: <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 18:21:00 +0200
X-Gm-Features: AVHnY4LzsI5n_9iqirzC_of7SGIfiJw_kQ6vIsCvh5Qe5puVB03Deb7QvAn9uiw
Message-ID: <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_092116_981833_BFF5DA51 
X-CRM114-Status: GOOD (  37.11  )
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

On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > > >
> > > > I expect some discussion on this patch, because a) it adds some
> > > > OF-specific code into an otherwise generic (core) driver, and
> > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up pow=
ering
> > > > on the port twice, which negates the port reset part.
> > > >
> > >
> > > I understand that you do this because the port device has no OF node
> > > assigned. If we wanted to call pwrseq_get() for the port device, is
> > > there really no other way to associate it with the correct pwrseq
> > > provider?
> >
> > I suppose we could tie the "port@X" node to the usb port device, but
> > AFAIK no other subsystem does this so we would be introducing a new
> > pattern.
> >
> > In the M.2 pwrseq driver, we would have to match by port node instead
> > of its parent device node. We may end up with different behavior for
> > the USB target vs the other targets.
> >
>
> I imagine, we can check the bus type of the parent device to know if
> this is USB?

The "bus type" type is probably not exported. However since the DT binding
explicitly says which port on the M.2 slot is for which connection type,
I think the matching can do a special case check for the USB port.
The next obstacle is that the target string is not given to the provider
match function.

> > Also, the "port@X" nodes only exist for the OF graph connections to
> > connectors and/or muxes (this series doesn't deal with the latter).
> > For directly connected devices, there is a "device@X" child node
> > directly under the USB hub node. That node is what gets tied to the
> > the USB device.
> >
>
> Is this a problem? I don't think I understand what you're saying here.

It shouldn't be. I'm just saying there would be different behavior on
the USB side for connectors vs onboard devices (like hubs) device nodes.

I talked to Greg earlier, and he said not to touch the hub driver; the
hub driver should only deal with features from the USB spec. The
"onboard USB devices" driver is what should be used. And this would
be a proper case of adding an auxiliary device to the M.2 slot driver.

However this seems to completely decouple the power sequencing from the
USB core. Take the USB A connector for example, it was recently added to
the onboard USB devices driver. However the connector has a device node
that is not a child node of any USB host controller or hub; it is connected
through OF graph. At the same time, since it typically sits at the top
level of the device tree, a platform device is directly created and the
driver subsequently binds to that device. This is totally different from
how the hub and other directly connected onboard USB devices work. In
the onboard device case, the device node is a child node of the USB hub
or controller, and the corresponding platform device only gets created
when the USB hub driver probes, thereby sort of tying it into the USB
device topology.

If the power sequencing ends up not connected to the USB subsystem, then
maybe the M.2 slot driver could just check if the USB port (port@3) was
used, and just enable the USB / BT pwrseq target at probe time? That
would mean less changes needed.


Thanks
ChenYu

