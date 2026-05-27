Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB5FCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 21:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=; b=WE6rzT1/9xitkwdQG/l7YHuSfl
	5uV6fZBrGYh3sngAsV5EMZyftZjVYqPZXc1gHETxszYOEsqUI2ZfqHUO+VDwN5aZcfQhXQhZpRbow
	P72UtxZ39WBRWhXLlzJaW53NDHVxYZOC2AbPosAV4zAzRCga23gy9iBiKSfdYDE73D+BkNar7MLEV
	NIFbpRJ3Wr+t/rE2B7P1XwVqT00C1jOybMeYIlnDNByMxwO8L0LIi4JhbKWcCR0/kOTl2Ug2OJgy0
	XAk5wa5b0PpYox0BLbeNmI9l9y5UPxKu9uZCXXQeyN4vdAFIcNStuhQlTCIeGZY68l90dD8szc9g7
	Djjs4TsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLjf-00000004kqC-0oBY;
	Wed, 27 May 2026 21:24:19 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSLjc-00000004kpO-12WX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 21:24:18 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a884815606so13277202e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 14:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779917054; cv=none;
        d=google.com; s=arc-20240605;
        b=PW22L+l4zDdxizW69L90Y6GvpE+e15pSke8qyeqQkODJphyAMCM6zjHzA5ShfwAgA9
         naw+I85p+x+0ehdVh9koO5QwO8l0R30n7sVup77ZlZRaG7Nk8CSii8ZecBYUOtbnuG3h
         cCOeqKEtuL0TMxOW1nkan25rhFXxSeysaWQFe8eLUxrqD+MKsI5G5x9lP7xsO2Kz8tzR
         aWKwF4S9vlHk0dK32kZPK5PafE13JbGGGbIxxAeMm/5Ml1IS1E3j4oXmCdo6ERKvdLh9
         4vI7CLHJegCbmlG/qOBzRwTiuZwhlmE5zStP0bK33LYAwBFPxumwWF73Qa1newTqoREc
         HiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=;
        fh=fJP7M1gDWNAzh8v5bcE+QCE7SSEeQyOG27cG2VIK+hw=;
        b=e5YkSD1nisr3TTr9OG60DcrXFN1QYPwGbfba1sfaJ5j8NbGbxXs5hiKxd42c19ow1w
         /da7nZABLnRb7xpgbqxSLyfqUeutYj2fU05iUv0J2jmu/TxfpFs6JAvAtAkMFng3lYV1
         5W2KZU3yD2vNmC66r2wVzJktv6I4XZFOOTcYtKEseYXq9NB07KfWpXlXnbxUhFcBmj0A
         0NGrJenDr76mThsW8QgSW0eVM+PtB8BBDTDbYj3znErh5EChL2QtVPfq7vXtS+jn0MLk
         nxA1SJYkagdem4hEbmhiidNbHjX6g6M0+0xeEaEXrkWe16XTYH/JQXBivTn5/FdtFeSk
         6G6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779917054; x=1780521854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=;
        b=eqvi8CCSDUuOXofeXmEzyWmpyXgY5xz+hyMuOFcloj6DxzTKPyyrAx/qGqiUHW0mur
         2AWYMmgEtRdwIpoRzUm7+jQ7oMcD68MqhJ+7L5EUI+hH50oqN3JTRx0Z8SK/qyCdrcg8
         93ip25fpvat85zyF4PKjW02NWUtk2zkV385wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779917054; x=1780521854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNa7dgr+T6R1ukhKHHLy6CJqrOmDsV/gnRDcoFC7IoM=;
        b=Dyh9+4ite08kJQVEDBchCbhhF/V9OMhxJIgiOR0+IhdHOY85s0KlSixkpcPW2blGUW
         mEjqj4+je5b6ebQW+qrR+kSjH+zPZ2Q2dN399CGqx7HkO5xKGkb57P/brFO8ep1BOOw0
         bkRlKX+14z4g6zFddjpQBDIaW7IoL846d/0GiT7EFoujT8uFkiRt99WKFdX40UmD3lPo
         AI5B6qoSKdGF29UzRZJRzHpSKFrq/gFE8razpGxYoI3C39iniq+mKl/q+j/wf4Ra3iaj
         U1s7eLF9k6w6R/uVaIEDEGijRfDc4M/2oWe3tIIYqET5ZPTtH/py3hTamSaHyUFAlG5O
         L6mw==
X-Forwarded-Encrypted: i=1; AFNElJ/x+0oWnzu5TtLt6IMht1BROwAixIn7gD9TcWYZMyiwDcSrHSvlOJkeZdlkPivUMG3BenCe7lzMnaj17q0Sumd5@lists.infradead.org
X-Gm-Message-State: AOJu0YwG5Qt7mN7XNas23Yu1LGbZs7XOzzLg5e2K3P90mbbSXQM34fsR
	YvH7znfi3dkTWYm7EGxJqUNCP2fys1VXdqXWyeAQKlqwR1woAWIUYOHeRkwgLwBAKQ4cVSErwwr
	u6eLInmFKl37UGLAgFpwYVf4lv9V5X9b4GuaRJhXz
X-Gm-Gg: Acq92OG19NtmM//pS36NT3tRy9+PlzKszeILaDCoDfXikHuq4XAqYT/4lUEecjSMaK8
	PRpK9Buj6aCJ5hubMUmhHVefgpP5T3/pgIONV4pkfwlfWqKRAR2Ix/hns6HfBCfd6bMP+bkPt0I
	iBcsyEeD62m3oF6Yg4vYnyvUfONDCyXvpznLvzc/jiR1wKQiSLVTvbSoG+/PENhzB2KNBloVo8K
	wpmg4FQJR5zvUKR/SqOkz1kBowkVN0VdN8Y7yCJx8qKnBtOT/KU3htfFVsF4xj5UpMsErLpCoi2
	/T0DYEkwgkmYMC+XAg==
X-Received: by 2002:ac2:4c50:0:b0:5a8:65ce:e83b with SMTP id
 2adb3069b0e04-5aa3238bcc6mr8479844e87.7.1779917054041; Wed, 27 May 2026
 14:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com> <2026052710-flagship-unsmooth-ce82@gregkh>
In-Reply-To: <2026052710-flagship-unsmooth-ce82@gregkh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 23:24:02 +0200
X-Gm-Features: AVHnY4LeDHWwGMjgnhSmei9PL68DdRKYxFo5lLp-irYNZJy9WYHdf0RaNUwFV18
Message-ID: <CAGXv+5HdrKjFe=jZFYQzanmHOgCNOXRydLCvsM6o=DGhoO1HBA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_142416_367624_9C8E113C 
X-CRM114-Status: GOOD (  53.31  )
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

On Wed, May 27, 2026 at 7:42=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:
> > On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> > >
> > > On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium=
.org> wrote:
> > > >
> > > > > >
> > > > > > I expect some discussion on this patch, because a) it adds some
> > > > > > OF-specific code into an otherwise generic (core) driver, and
> > > > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up=
 powering
> > > > > > on the port twice, which negates the port reset part.
> > > > > >
> > > > >
> > > > > I understand that you do this because the port device has no OF n=
ode
> > > > > assigned. If we wanted to call pwrseq_get() for the port device, =
is
> > > > > there really no other way to associate it with the correct pwrseq
> > > > > provider?
> > > >
> > > > I suppose we could tie the "port@X" node to the usb port device, bu=
t
> > > > AFAIK no other subsystem does this so we would be introducing a new
> > > > pattern.
> > > >
> > > > In the M.2 pwrseq driver, we would have to match by port node inste=
ad
> > > > of its parent device node. We may end up with different behavior fo=
r
> > > > the USB target vs the other targets.
> > > >
> > >
> > > I imagine, we can check the bus type of the parent device to know if
> > > this is USB?
> >
> > The "bus type" type is probably not exported. However since the DT bind=
ing
> > explicitly says which port on the M.2 slot is for which connection type=
,
> > I think the matching can do a special case check for the USB port.
> > The next obstacle is that the target string is not given to the provide=
r
> > match function.
> >
> > > > Also, the "port@X" nodes only exist for the OF graph connections to
> > > > connectors and/or muxes (this series doesn't deal with the latter).
> > > > For directly connected devices, there is a "device@X" child node
> > > > directly under the USB hub node. That node is what gets tied to the
> > > > the USB device.
> > > >
> > >
> > > Is this a problem? I don't think I understand what you're saying here=
.
> >
> > It shouldn't be. I'm just saying there would be different behavior on
> > the USB side for connectors vs onboard devices (like hubs) device nodes=
.
> >
> > I talked to Greg earlier, and he said not to touch the hub driver; the
> > hub driver should only deal with features from the USB spec. The
> > "onboard USB devices" driver is what should be used. And this would
> > be a proper case of adding an auxiliary device to the M.2 slot driver.
> >
> > However this seems to completely decouple the power sequencing from the
> > USB core. Take the USB A connector for example, it was recently added t=
o
> > the onboard USB devices driver. However the connector has a device node
> > that is not a child node of any USB host controller or hub; it is conne=
cted
> > through OF graph. At the same time, since it typically sits at the top
> > level of the device tree, a platform device is directly created and the
> > driver subsequently binds to that device. This is totally different fro=
m
> > how the hub and other directly connected onboard USB devices work. In
> > the onboard device case, the device node is a child node of the USB hub
> > or controller, and the corresponding platform device only gets created
> > when the USB hub driver probes, thereby sort of tying it into the USB
> > device topology.
>
> Hm, did we mess this up?  If so, we can always change it if you think
> this should be done differently.
>
> Hubs should be dealing with the power issues for their ports, so maybe
> rethinking this might be wise.  I'm just loath to add hardware-specific
> hacks to the hub common code for obvious reasons.  Anything we can do to
> pull it out to a separate driver is best so it doesn't affect the 99% of
> the users that don't have that crazy hardware :)

I understand. The way I have it in this series is that besides having
the port powered up initially, usb_hub_set_port_power() port power
control also extends to the pwrseq target for the M.2 slot or USB A
connector, just like if VBUS was controlled by the hub itself.

M.2 slots might be somewhat rarer, but I think many embedded devices
have USB A ports with VBUS that are controlled via GPIO, not wired
to the USB hub's (if any) port VBUS control pin. This is also present
on Chromebooks.

I think wiring up pwrseq to the USB port and using it for VBUS control
on these USB A ports is an improvement over the recent addition of USB
A connectors to the onboard device driver, which just turns on VBUS.
It would make the power cycle loop in hub_port_connect() actually work
on these devices.

Is it code for stuff outside of the hub itself? Yes. Is it crazy hardware?
Maybe not.


Thanks
ChenYu

