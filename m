Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C474CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 15:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uU2ek87LjjL1jNDt+iYTmSSnmmr7Z48twFZ1D54C/G8=; b=i6Oi2wftBH90X9Pq8HAXy5VObc
	z/eMLN3fel13NCXO800Ku/I6zm1sdajucr50JHiISLFaL8D/bH+DeTHj7fg+delcMBaOetnVNCI8D
	Z4BIBmt6ml8oJ022F5oCdiTdbzIxLm361udDfLT8qOmgw6ofyEKDaBTeuv2wxUhHexCogMoJgJswG
	ICezFABlZ8NJ28M9qizayHKxYskExDA8zg94mFd+aLNj+umEETu/gsACGfjNCD6ZFM0MMOOlekuJE
	IohFFIVhiQRuj6fhDhesthrZvOhXB3XYDSUorbxe/U+KWNHlU473ME2gx0fGx2NPF6aOeKPelPImy
	6UDEvZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOJA-0000000F0JY-2bNa;
	Sun, 04 Oct 2026 15:39:24 +0000
Received: from mail-pz2-x15.google.com ([2607:f8b0:4864:3b::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDOJ7-0000000F0JA-0Dua
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 15:39:23 +0000
Received: by mail-pz2-x15.google.com with SMTP id 41be03b00d2f7-cc4c3304784so308694a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 08:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791128359; cv=none;
        d=google.com; s=arc-20260327;
        b=IWjin5tNV0qLECCRHhvqptusRzWU/5g5MV0Ui9eOkDyJ5V42p6ZCLaMkKnjSBl5euT
         iU0VKcYRSmOaSDbx2JWS/sKch4kDxKM3cZtiYAC9jAFqvWvF/cDN0LYNEsOErIUe9E1j
         55ukKcxrpja8I1V83kPjgIkxW6DeQCV7Lu0A0B3PccqSwl6PWj08WxLP+/fmwHKg2VXp
         1AlCQwymoT0crtW5iHrFO1EJu+6ITBbz0ZXGVkzSTuIroaOfjrtpiWnA0zKQzZZENUmP
         j+c5ePjmp7Oqo5478QoO7zu5bF7PLl2aSI6u9A44Si/fFOdQ1vRopUgbhR7HbRP7kIuv
         aC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uU2ek87LjjL1jNDt+iYTmSSnmmr7Z48twFZ1D54C/G8=;
        fh=IMLSfIU3LhlqSQlGREyEtFzxiiIRAucAKZc9dnHtd0s=;
        b=CFIFFe1nN1w9k7KHlD7zdI1382wBmmWYrXo13egiu3eqV6oCH+PMwyv03t8EbkG43+
         rx8MCVda2fXVPrl2IhPpbD0Zc8Ij22CTDUPJa+7j4nAVoTD7r0PmvjawGRqRbnBz358U
         f9jC4Ize9C3g3oTb0BqxLypSWVb7Ke9/LaCWzZOsgdJV42De+7eNUoK1/fojwT4MoWSr
         acPnX0RGtS+aIZVlq6PN5FHq/89yr/I2rM5i94jSxoVkXAkYKlb9gFgmSrDVV4Euulkv
         bR2V33CXb5L5qmvSkrha33mw5DXUwShE/c36youMtXSw/jC0pJFzJG5vNfAj4srrt/UO
         wzuQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128359; x=1791733159; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uU2ek87LjjL1jNDt+iYTmSSnmmr7Z48twFZ1D54C/G8=;
        b=IEMOwi7+f7hikL+8YzBlt8VbfoYmrlHdXIwmUEIHGp+oZjhuPlzW4j+wkd3JcRaz67
         GVxdNMY/Ae/YVnQBu5f6uAEL5uTv42qnLv10QZcMd5EenXk1CENfh8Hcdc2HnYSGFHb1
         JVI4ebPCBBNQ7PhoCwnUPnDPBKMMUJ/ZqysGqrfZ13gKM+khTGRGxXaiAG9VLYPcm/WE
         9vFVLYwPjm8vYUICppfN5ZRYg4TewDC8OhHXK33HY5xvE5hlj2u5u1CqMSAB0m0OO5mj
         5RsoIa7CKbwCx1D52/VJR9ZIs7+mkcsJjH0aCEtlVTXe+Z89OMVdhFHGjvm4FAi3ELgP
         4SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128359; x=1791733159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU2ek87LjjL1jNDt+iYTmSSnmmr7Z48twFZ1D54C/G8=;
        b=Xe6cTk0BiQKGrp7QtuA+EZG2Lxog5hTYpsnNwKkpC2Ihdf18HHriDJzyDc6l0g0EPG
         prqjNmmAUGilI+tjiSXkMGJr2s7GLvUyHZsu/YfQSHBNob5180NyDuXitIeFfXLSEXPF
         TOgBBuYYO6HvkF3W1lsJwrPS9pWDoopwHtepC6K4BzRJkSlrAYbwFcrL1tPhID6hQ+8S
         vqYHb7SDvR5SRWkKm87GHeVi5iCEN9hu2FHu0pXFqMv2XeNwkPd694EI3mkGmm0JArNU
         xB/4oxuPQv/xl7jtNTBcVg0cMQn7vxtoCp/hzSMCGid87TaBME8ul17C15sgvXoQXKt+
         ZJAg==
X-Forwarded-Encrypted: i=1; AKwUvBz7eYOs3OhgzsLXPgvPaCXS2CkuMbaIsr7hjzpawfyu6SVugrwuc+O7yszKp36SuX8DlfbcqPfMNgKLb0JZNcFy@lists.infradead.org
X-Gm-Message-State: AFq9FYIq6p0W58OvzDm4bbtiKwzqjJ4YYfC+GjZwkcoUq0JmVBPVDlzH
	/YkjSlyMdSsncgsAARtVt8Tn5XhGCfOjd2fk+czJL6rIdBl6fzIJC/G7jyMbJmfNGVV2MYVDCg3
	5kexZzI04dN8xNBjHG8roicg/7edZcQg=
X-Gm-Gg: AYBFou0riKL2MPOi3RL/Ojw81HwgmXrs291aVSSFujhiTcMKaPFJFKq+kd5rR3DHGnd
	phIGUM4XoLL9Xht3LstqSiwlSt9o4x1mFzPW09f7HFZb/XcZG7r33IYOjAYWapOSD58aN1igUoW
	aSPXH8F1+o90FpgtQhSbuBG4/d/gkOzG5/Lzk79PU+EHmkIqWeF0aLPZP2ptLzrkp4vbJXIOV+Z
	rVQxqHWh387iM1SR8j9VBI3KswawXvS077N5uDiSqpL4HWPOhqbWLueAHgpw1/nYlBrUIUR7T3O
	nu/ocLFknYoASDRV+sD5CYx4L0nrqpB2KbH4yteiPl/Zy86GNCrvsz+Jhg==
X-Received: by 2002:a17:902:da84:b0:2dd:c100:7cbe with SMTP id
 d9443c01a7336-2e49b6dca4bmr75707755ad.58.1791128359433; Sun, 04 Oct 2026
 08:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260922171942.201947-1-sid9.karanam@gmail.com> <8cb23b44-027d-4d81-b342-7eaca0248f63@ti.com>
In-Reply-To: <8cb23b44-027d-4d81-b342-7eaca0248f63@ti.com>
From: Sidd <sid9.karanam@gmail.com>
Date: Sun, 4 Oct 2026 21:09:08 +0530
X-Gm-Features: AclHuK9ZGYlY4040N6uy7-lCOD-y_fYZ0mAfz4ke5Z9n9mwfFspUkB4sIuVJ618
Message-ID: <CABM86pxDca--BxNFUjdZy3Z_t7qpd8a9A8FpnYc9r=VGag9bXQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-mcu: Add power-domains property
 for M4FSS
To: Andrew Davis <afd@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_083921_095717_423C5B6D 
X-CRM114-Status: GOOD (  23.80  )
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

> Anyway, the reason we don't use the normal "power-domains", and instead m=
anage
> the power using `ti,sci-dev-id`, is because the normal power domain frame=
work
> has a nasty habit of unconditionally powering up devices before the drive=
r can
> probe. Which in the case of remoteprocs can cause the core to start runni=
ng
> and executing random data.

Oh I was not aware of this issue, seemed logical and a straightforward
issue to me, I'll drop this patch then.
I also figured this would in turn nicely move into wrapping all ti sci
handle's device ops through pmruntime (such as get_device and
put_device functions) but I believe that won't work as well.

  > * Power up subsystem
  > * Set reset line for core
  > * Power up the core
  > * Setup the core (load firmware and set boot address)
  > * Release reset line for core to start it running

Right, I see, thanks for the input :)

Thanks,
Siddharth Karanam

On Tue, Sep 29, 2026 at 10:09=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 9/22/26 12:19 PM, Siddharth Karanam wrote:
> > Assign the power domain to the MCU M4FSS (Cortex-M4F) node by following
> > the device ids info published in TI-SCI public documentation.
> >
> > This will be useful in future patches that will attempt at abstracting
> > ti_sci_dev_ops's calls such as get_device and put_device via pm_runtime
> > calls.
> >
> > Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
> > ---
> >   arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/=
dts/ti/k3-am62-mcu.dtsi
> > index 68e906796aefe..1ae0870893c16 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
> > @@ -181,6 +181,7 @@ mcu_m4fss: m4fss@5000000 {
> >                     <0x00 0x5040000 0x00 0x10000>;
> >               reg-names =3D "iram", "dram";
> >               resets =3D <&k3_reset 9 1>;
> > +             power-domains =3D <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>
> The surrounding M4 subsystem's power domain is 7, but the core's power do=
main number
> is 9 (see below in `ti,sci-dev-id`). Enabling 9 should also enable 7 as i=
t is a
> dependency. We probably should have modeled the M4 in DT the way we did t=
he R5[0].
> With the core being a subnode of the subsystem. Then 7 goes in subsystem =
and 9
> goes in the core's subnode.
>
> Anyway, the reason we don't use the normal "power-domains", and instead m=
anage
> the power using `ti,sci-dev-id`, is because the normal power domain frame=
work
> has a nasty habit of unconditionally powering up devices before the drive=
r can
> probe. Which in the case of remoteprocs can cause the core to start runni=
ng
> and executing random data. We have to do things in order,
>
>   * Power up subsystem
>   * Set reset line for core
>   * Power up the core
>   * Setup the core (load firmware and set boot address)
>   * Release reset line for core to start it running
>
> Andrew
>
> [0] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/=
k3-am62a-mcu.dtsi#L178
>
> >               firmware-name =3D "am62-mcu-m4f0_0-fw";
> >               ti,sci =3D <&dmsc>;
> >               ti,sci-dev-id =3D <9>;
>

