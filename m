Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8A7CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:In-Reply-To:References:
	MIME-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C54WbketwFUMnlhWt0X/x+0i291DYrFlSIzr7u5PmQc=; b=4EVHCXqbaiNZvhE2PYs9Z0rbAd
	L/D5mKPnAV1I149TdBKA4bSloSfhLQWQkhAG9XEwiXWCupz3sUNdct82D3/6TFf/uecEP9Ms+uv0f
	MSf8Le6OiT6jjSxLGCSdU5w4AfYlx0jhq5/gTf0dKks6wwbbg6xPvzYfaJvE5+9MCfw+S2kaYHoia
	DlrkhLv+Ad0ckoEXCKdurni85IL+bIYYjVIaIhAXlHe9P3klk2dfIH8yYdcAYEN+0BaAMZd/xxd+e
	dUXJ/eVLCqbc9Obej41lp9fhnuZcmI2YUmewKFA9vmQS2Gucnz8nehbeXrR4bgoR1AHJ9z/Bsd3CF
	c1Nv0FUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkxE-0000000GnOg-0kkr;
	Mon, 05 Oct 2026 15:50:16 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkxB-0000000GnO8-3t21
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 15:50:15 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-98c5876f2b0so1197812241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 08:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1791215412; x=1791820212; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C54WbketwFUMnlhWt0X/x+0i291DYrFlSIzr7u5PmQc=;
        b=Sr7O3XcxJwhEp57iIWYOwJ8y+8ETroBfeo9bNTtyXpjWQKfZOA4mpa8sZKsIxD3afs
         YLdX/5Me6nPiEA9JcJd3olj4YJPt7BcW/DnfLBF+kc/k1YUy/u8b/q2ZHFWAtYYHwd/h
         a8cr3tuYRtW4PELPtzlgauy8n/0nlVK63OF7QQPlKo7FPHg2pasYS1D2sqnl0BzFH2Fg
         SJmjT2UXhyVA+115k06MslKZoWgGbgYh6AgJGbEI0aJUmzoTOd1ZyJFEhG9UtdXW3wsk
         78ZXS1WlpjOppMMnO1IQ1q4enlcS5LoILerZhhF/CBoFL5kOERZk+ExfNpYHzzT8RZR8
         jMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215412; x=1791820212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C54WbketwFUMnlhWt0X/x+0i291DYrFlSIzr7u5PmQc=;
        b=y88hM+FdvKtGCP5wrNpI2OlbZk+D7ImIgf3cKFFFcHkr8X5czaHtc+UXym0rEaEkK5
         y4bnXM3i26nVnTUh00gi/0S4ul423eUBWQUO0u+xvJYWskyvQ+OaK0p09MoQvAoSyJZ3
         BX4TWppIOnqK6HrccnJ5FTNT3vqigBxIMmzxVP61I0E1l6n8DE4lc8F2YVZKYJV5SHda
         WMLxtQsR+vQLq4iL3ad54YFcquWxi4setdhB6fvaf25E/m5vLjSxwRtZTEbXbVEcBcUR
         QmrsnFPr0IfE+8cdVGm3ysuQIOvf0H8zWVkyZIouOiU80FC60hDSg/025F1P2W2rUVz+
         BiLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/Fo5qc59dZBHi/Q04GETUs7zMuDmDw0dWi6MwPNx6w82D+GqEwz540S65Srjee/NHvk62G4P2IFNZDs93CNdN@lists.infradead.org
X-Gm-Message-State: AFq9FYK1O8IjTni1mMzCapjpqDaoe6Oxr+57MXjiucbwKXsFiCWTFtfX
	Z2G7sm+mvyDLPKB5bIFnt3k9f/ofdbP/xILFOvapI007BStSh1tFowbBFShO5oR0SSdhHZv9CUH
	dKFxLuhc=
X-Gm-Gg: AYBFou0chvmMbpCtwEfW/04rI41ttW3v9Xhq1Nm6EFmCjn8S5YBhc6LUjjaL8AU6ZBS
	os90OvJ/0i85zy+AIrD1I7jjMvUrq9M0Ctp2pfh5PkIMJ8Oic4ihkpEOQYAV6/gKq2flxKGAvwv
	aHE47spJSJ1aYGNZtc7O9p7czQAVsJyiClM9JJdCmAP8aQkgnar5TNVyHvZJ00TsSPfFOC+EV2f
	4PGswz/aPNM5otKXgW08pe1tLs97GBc0vkZ6EOnoGyDeDtMY7i2pH0iHzK0IGHDS77S5FFLeFvM
	Gz2CyG/h+SeJUhIu4eE6TnbHu+j2XR+Vn3Io9psWoVLLQp8Tb3UMqfdR/3C51AoP0Sa7ujgPoHd
	YUuZ6blCcJVVZDGbd1aaRdYsQQZLAEcSm8Fsg1ZxcBWLof4gGxqAjCo3oqBOWY7kQx2WqCTJnuU
	4OErDyj6/p901saWdfl6bNR+Tr1CDk+xAZ4gRo6TFkdGpS+ZP6TtMZyzMwd1IvHniREwwG+6Uqn
	9IY7fbEsIZdPLoBLin7tl/Xjehk2HJhv55QvDrCWE/tgBO2Lj4r
X-Received: by 2002:a67:e706:0:b0:7a1:dca9:8563 with SMTP id ada2fe7eead31-7c24488ad37mr2548384137.12.1791215411685;
        Mon, 05 Oct 2026 08:50:11 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c0ffaeb6d0sm10496536137.6.2026.10.05.08.50.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 08:50:10 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-988c94f1c07so1109066241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 08:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBybTM19J4bzjTSvw5569RkPdg9U0TXFLIJsJ6QNuAd6EgBE7eq81QcJBARzj1Q3Ajw/TpECubOATo87Ha/xRHlX@lists.infradead.org
X-Received: by 2002:a05:6102:50a1:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7c32f13da5fmr1970603137.3.1791215410224; Mon, 05 Oct 2026
 08:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261003012534.418820-3-otavio@ossystems.com.br>
 <20261003012534.418820-5-otavio@ossystems.com.br> <2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
In-Reply-To: <2c75983e-5e63-4613-a9a8-055015d04bbf@arm.com>
Date: Mon, 5 Oct 2026 12:49:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
X-Gm-Features: AclHuK9M-oP6_gI2ooGV7CYgI6qML-uXhAEOVd9YWl1vJlrxk84aNQ57MoMLtgc
Message-ID: <CAP9ODKr2FQ2xeg-u_UQ-krUGsaU3mcWjWYfPAPd7V=ks2=GwzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS calibration
To: Andre Przywara <andre.przywara@arm.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_085014_009304_0AE6C547 
X-CRM114-Status: GOOD (  22.69  )
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

Hi Andre,

Thanks for the review.

Em seg., 5 de out. de 2026 =C3=A0s 06:02, Andre Przywara
<andre.przywara@arm.com> escreveu:
>
> Hi Otavio,
>
> thanks for sending the patch!
>
> On 10/3/26 03:25, Otavio Salvador wrote:
> > Without the calibration cell, the THS driver leaves the sensor
> > calibration registers at their reset value (0x800) and the reported
> > temperatures drift from the real die temperature by a chip-dependent
> > offset.
> >
> > Add the SID node at 0x01c1b000 and wire the thermal sensor to its
> > factory calibration at eFuse offset 0x40, one 16-bit word for each of
> > the two sensors.
> >
> > The R40 user manual gives the size of the thermal sensor key (32 bits)
> > but not its offset. The vendor SDK key map names 0x48 "thermal_sensor",
> > but that word is zero on all the boards checked. On an A40i running the
> > Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
> > eFuse word at 0x40 (0x08780875), which confirms the location.
>
> So in some U-Boot BSP sources on github I see
> arch/arm/include/asm/arch-sun8iw11p1/sid.h putting the sensor at 0x34
> (like the H3 or A64).
> Can you check the values there? I see that Tina-Linux puts them at 0x40,
> as you reported, and it's probably more reliable there than in the
> U-Boot sources, but it's worth double checking.
>
> The rest looks alright (checked the manual and how the compatible string
> is handled in the driver), so if you can confirm that it's 0x40:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Yes, I checked 0x34. The BPI U-Boot sid.h for sun8iw11p1 puts the
thermal key there, but that word is zero on every A40i I dumped: three
boards on mainline with this patch, and the Boardcon board on its
vendor kernel. 0x48 is zero too. Only 0x40 holds two plausible 12-bit
values:

  board 1: 0x08780875 (vendor kernel, THS_0_1_CDATA =3D 0x08780875)
  board 2: 0x082d0822
  board 3: 0x083d0838

The value differs per board, and on the vendor kernel THS_0_1_CDATA
holds exactly the word at 0x40. With this patch, CDATA on boards 2 and
3 also matches their word at 0x40. So 0x40 it is, matching Tina Linux.

I also compared the MMIO window at SID + 0x200 with the register-based
readout (the H3 method) across several boots. All 64 words matched, so
the R40 doesn't seem to have the H3 readout problem.

Best regards,
Otavio

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854

