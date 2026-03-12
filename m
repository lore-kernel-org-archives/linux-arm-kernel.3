Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21D4FED2D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIO8XUP7143gVJLUd0FUXnb9BilWdnCaidVriG8lVsM=; b=SjFHlpxn/Y11F+HeHYDWuLnh1T
	CPgwsMkFwTmTrT/Pl31HcQsO9K0xi+3Q8RZEDqKgfi8Bw8mIatH1Zut39jikEYeEWt2vucRldNlXc
	8sEo+fLL6AVckgo7XW9m9OiwsEEuBUdki5qfa9okr0kiiOWHpKNtDWt9Iq0r4LHapjoN/4DjWKTd0
	XYmVSfBPyKhDAr2EtT/aUnIJjk15JuR8bByocxbYl5gkEhoy6hktOUXzXHmvWhtGUnZjB8ttZwch8
	VVu9VSko+mpQDyTNiTPhqbmUl5ZE9wTfKrFz3drHR6WsYHyHmozE0FZOzC8gfTfsFGWfSbswk6luv
	TaUp+25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0aBH-0000000DWAc-20Lf;
	Thu, 12 Mar 2026 07:10:03 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0aBD-0000000DW9d-45vv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 07:10:02 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b941d924534so71390266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 00:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773299398; cv=none;
        d=google.com; s=arc-20240605;
        b=CSaFTnzHWKMdoAWO/5Bs7NBIHHKdS5iWp9APyExj4YSHs9rmDB6pxF48FNfPBmeWId
         ulBsTZvTYSK28gkhVeb5waON0xApmY6Z9H6fZ13iqJwiI/jFmQzUjBIrLePy++c9Mn1Y
         7a3Ofg41i5s8lP7spNQxvcuUQTYpQLn20wbV1pI3QhWAiBWMnOdilSRfH+klyOCh52i8
         APTT6apJH5QGnaMNcm7nIy9HlQaZolTiQRhcaZCzxHQ//loZZo+nTqsMkvmYLaIfK5VH
         mWABVcVYAZzDHhfwHuhCTaRZzwu8Fxy3D0WvYN6/eO/X1tNnatcXz8cyXEqu6xnEDvmz
         oZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rIO8XUP7143gVJLUd0FUXnb9BilWdnCaidVriG8lVsM=;
        fh=EGS1x5j0XIDRcconaRYi/I16V+XeG9rLUHsl3Pi/TNw=;
        b=gvuXg8tSCnMrYz6knw1RFnCJ0jxQaHIq2ijOLwMaUtfYoz8DigQxHVnx1EyBRSVXOf
         PHWdIAElOOhasNZBk92SEBelwafl/TtUatp26VXvVIKOyBqzMSVUVXlHGYD6ae1jnD8d
         B+Vlp4GDpepq4GzMsImlc98L4bBjcLqyXakAYR6y+dmfy/5aDXhZUbLeeio/A0KbE/7K
         nVQ+5SyOOY/GuR75zt8iz/alzdqDswIfqeAgqNH/syfAVaCz98hFnMviqIdWHO2bfni0
         ihxfSpIpgHpdAaWxYFTQ+xH1w4VNSBQ+Y1pFR+MZJjNWL3nKzs4ZoXpuRqABy+rVm1EF
         P0Jg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773299398; x=1773904198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIO8XUP7143gVJLUd0FUXnb9BilWdnCaidVriG8lVsM=;
        b=QkC70zmKDQdPL/DISvSC5hdmupHM9eKvcW1I5sjZE8TyYN1AOfSNGtghoqvY42yGuj
         HewaIlKe1EqUplDYqU9HCrRcDG9azlwuPmYvZe3IIcpfUAcUfn2RT/y6IeLk2LFYO05M
         +Kc6ovNGNKrmzaPR3BzIsJl+t+dSH9u800s61VT7qDX47gNUitPhS7FJ/i0bCNNAUuu7
         sZ4uYIskplSdvNEw1RfQJvc9u23gN/bnt9GYgxpkXhi8GCQhJU0gv7ewZ5D2uFqB1+PR
         zaH6T0TUzeY81ng4rNuKAupPBk4Omc4KfcZlEO56aYooApBD+cIZmGUYY388/QAs4Xpg
         X+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773299398; x=1773904198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rIO8XUP7143gVJLUd0FUXnb9BilWdnCaidVriG8lVsM=;
        b=LYzy1D8fE9QPV9KOQUF2Vnc/qTESBt95d45MooDmEhHsyu8KCQASN4ZJuUA/55TXzv
         8ORbEcXGqgme5RFnD4cPcw3yeoNTF97C5tyJc4mcsbqSr3ERR4Pzl2RruQ4gJuZBy87f
         6I7cPguoeLDLVLBw9/ywsn3wAc36X0vFc4Bv3HP5FU/i9urC9PNHgBYtD3R4co0f0Bn5
         +Hm+eznqoBZv+SfvdOiiOESOJeY9/FUODSvV2u4K1SizVpgkYXMgfQzQHhMShXAaWsZo
         2m/UpfmoT3eNPZPoByrPZWGaBp30A/pYBW76Ka6dlTWC6aVGLqeNVMsPwmUvO/Tugfn4
         71yg==
X-Forwarded-Encrypted: i=1; AJvYcCXoXd8zPS+lyaAXTPx+LAD+CkCNfpKNvvABRktzGEqrQ0xrMKwhr5QHCvSePRB/qeLSiepjmv07Tj9U4cPBpfwK@lists.infradead.org
X-Gm-Message-State: AOJu0YyvJRE3YukGK217aAmSG5GKKuu1iDi/wJ7NJZTsrT0bjnCK0MKY
	vLpvRK7p7wQcNW9oxkx/hOOfhuJLRYCRZJgNwZh5hCMqqT3AZesGKsJGOnUbIFNMH2mCMLV+pKg
	XIv4TWTgCobbOYs8SnGy2Wu3mJ7hM2otjdZaN2O4O9A==
X-Gm-Gg: ATEYQzzCt954XAiPgIpxtKV093Pc56dcVi3rJzHBgY3vYT18ZnVi8ZUOevaHPzG/7w3
	e3HrP6b1kVVUcAoSyj9foSu4M1W4X9VHK3wnx88m/6DUHPrvYCW++XR5+VriI5fdD661EDN6/l5
	S9UDn30FhHWKFskOYLVCqRLTKh/03QoKm8ZsZM770W+VLHk64MwA74dMmkNBaZ3yuEnkCS/p4ih
	yRO64S3xIPAeCtRx/ODD37G6mZMKNsAHTDhRoPOSFRoX436xaN81WF5OU8qAf6HsAiXywAIUVc8
	F3ki2d0=
X-Received: by 2002:a17:907:d20:b0:b96:dd1c:9408 with SMTP id
 a640c23a62f3a-b972e5a7e72mr299557966b.54.1773299397660; Thu, 12 Mar 2026
 00:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
 <20260311-husb311-v1-3-f25bcb58cff7@flipper.net> <20260311-married-democrat-f6eb1c651e97@spud>
In-Reply-To: <20260311-married-democrat-f6eb1c651e97@spud>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Mar 2026 11:09:43 +0400
X-Gm-Features: AaiRm53JoSVHPKKchRGU0H0o0pu24aIAgKHDs-WeWrrs5xSsEXLakFZd28fKT1k
Message-ID: <CAKTNdwFQnySkhpLDrFh5kwX=_tvci=g0Y6Q5y-15Qsogd=FxOw@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add support for Hynetek HUSB311
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gene Chen <gene_chen@richtek.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_001001_196584_3881B563 
X-CRM114-Status: GOOD (  25.65  )
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

On Wed, Mar 11, 2026 at 10:33=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Mar 11, 2026 at 08:20:46PM +0400, Alexey Charkov wrote:
> > HUSB311 is a pin-compatible and register-compatible drop-in replacement
> > for RT1711H, so add its IDs to the existing driver.
> >
> > Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4=
f09-bacd-0440d2c21088.pdf
> > Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Bra=
nch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%20202105=
26.pdf
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec=
/tcpm/tcpci_rt1711h.c
> > index 88c50b984e8a..ac5917c1e253 100644
> > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > @@ -18,6 +18,9 @@
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> >
> > +#define HUSB311_VID          0x2E99
> > +#define HUSB311_PID          0x0311
> > +#define HUSB311_DID          0x0000
> >  #define RT1711H_VID          0x29CF
> >  #define RT1711H_PID          0x1711
> >  #define RT1711H_DID          0x2171
> > @@ -55,6 +58,8 @@
> >
> >  struct rt1711h_chip_info {
> >       u32 rxdz_sel;
> > +     u16 vid;
> > +     u16 pid;
> >       u16 did;
> >       bool enable_pd30_extended_message;
> >  };
> > @@ -308,14 +313,14 @@ static int rt1711h_check_revision(struct i2c_clie=
nt *i2c, struct rt1711h_chip *c
> >       ret =3D i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
> >       if (ret < 0)
> >               return ret;
> > -     if (ret !=3D RT1711H_VID) {
> > +     if (ret !=3D chip->info->vid) {
> >               dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
>
> Why are we checking vids and pids here? Rejecting a non-match prevents
> using fallback compatibles, so I'd like to know why the code exists.
>
> Is it just here for the sake of it, or to prevent some actual issues?
> Not really familiar with USB devices unfortunately.

Hi Conor,

It looks like a relic of some original vendor provided driver code.
Rockchip's implementation of a HUSB311 driver [1] contains similar
checks but I don't think it adds practical value in the world of
Device Tree (after all, it's just an I2C device - I haven't seen many
I2C drivers reject a DT match based on hardware IDs found in
registers). I chose to avoid removing them with my patch though,
because I don't have any Richtek hardware to test such a change.

Maybe the error could be downgraded to a warning though.

Best regards,
Alexey

https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/usb/typec=
/tcpm/tcpci_husb311.c#L217-L244

