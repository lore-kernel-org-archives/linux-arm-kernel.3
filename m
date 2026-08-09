Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6CBC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 17:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=; b=XvtmuzEBpcqvpEMHbP1B9KvcL1
	cl+7wB8f5eTemACgHq5yJBLtlHoQnMXVojEVwHDIQ16ox+nKWWUt6Tx6EFajmTvCB2rxL/b+6iwRM
	luclkfJduCcMM55O5rTDbc/+M9HOEnofSSlzCrNqasl9nHFagOkiXfooU1rC5BIoJRUYvNURPHPY+
	pdsJqJE1LOg7Fm05kgGl3TS6W5mC8nU03wtY2eytUN+Iy163QAmrg0Y35ZUsJAQypx43cR6TgN+d2
	0rWOL5QA3JbhFNrLKYUV9IqgjTQqQscdolKgqaw9tdbDOq5+fefon15om6bB422jsi68wRDBsrTM0
	XV9Ddfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt78m-0000000AXCH-2KuJ;
	Sun, 09 Aug 2026 17:16:52 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt78j-0000000AXBV-23kE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 17:16:50 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-8efcef23d21so8311846d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 10:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786295808; cv=none;
        d=google.com; s=arc-20260327;
        b=MmeHchjEPNCNDDs0myk+XQLoYE19SW8YDcPBB7MIuqwjxG3l7P6fTjB4DhaovO6g/L
         pEDUdITyAiabS+SxrSYnkcftQIovqj5fr8MEstRd4i/zfUOxehizd+UE6qGtCJZBYIb7
         tEGLMmckLPIvGFe2fN+GwBCalpyIG5exrB6iW4X+7pA+N9qM1aZwG1AwFuqwG3m8XmId
         8DWTvt45FwblLGa59fJ/CTbpLxyA/s8lceyL1MAZ711DT7066e3TWcRmVRlIjMtyHWV2
         Hcmk5TUkqhcMA+xV49pYUIDLdEBnkiBXDg80Qy1MdP5qVbf6/Dggrh0cFDtED/FNuwbu
         9iDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=;
        fh=AzOIrAoTBfNjshHLYC4cJlhQ5vj9UuFc6L1t4ck8mKQ=;
        b=Prb0B6qarYJyvLwupqWEdSLXIdkkq3C5BTuJyW/akg3XvKeUkIZNQ+DNIxBCWzEHeE
         A6U8BiCiqtVt2P11Mr4vVRtfK2yJNtKMncnrNuTK16azmfcNwDCfeRcUxDcJCWgxCA0M
         84p8aezUWh/NMPHYDuwN0EbeaYSEYsmL4B0HFez5rliA1ubye6SbVIQIeBy6uD+LdtbS
         c0RLd/OnYyCaqGudorlEfsSHaWWZUe7bf/FxY9kDUAg6kNhCa/AgJXhzxQYumgr8L8vq
         Z0FXKOWIfPzG06y7Xjn07xkF6GK5Zg3u3993UzbuWd8unxcOcT/F9QTL5q7InHq4r67r
         Pqpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295808; x=1786900608; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=;
        b=Jc+0xSZ/nvbS/c/Ffny+BesxqnlclrfZ7gD3cJn8ajWz4Bpwld9pcOkFDpmOUO93Ri
         Zz6ObrWBY5h4JcbcwmcR55wIr5hedTwGaLINZgvDCpmjxZDoyisLIseBL5veUl9jp5k4
         SU8pQVTfm8aVVODLY71fKTzc5U/rYH5xhWIhej1IK9zuOG82rVH280UlsVx69j+fbNce
         PEEJAcBj8C3km+Zaf2kyAKTd2Amdi+Kg3sQ+goFEjLYdCGRuhXipYVCrwGW5FkFGHIRV
         dJjjlfFZNGNEx6KRxKctLsIdPdF4hmtoHfCTr7jv/gqP3gspFhHCFiucf+WToHfzUrDm
         r2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295808; x=1786900608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU7Duwnzym7o6H9C40VXv2V+HHIGH6Z448XVA54zyEg=;
        b=YswRFQ1BieqRNEjCoeu2PVb9oQyl8vQr3S1CpFHR6WDVJOBU4/56RTPGsLB3EOOnW+
         Op3rFKK5NcBvQ7YT0G02PA1gG3E0/L5LPOjVkVAfeMZ59iqFTFxSVI4F6icZU58VAPt8
         8HMXngKgjsF97ZAxiLbVpeOR64f0fSxpUjRoXm+eJ+z/JPW/xglrWw8rJFnVx4Q1RNXt
         E6MwVbPPZ+Pw+InXLyGL4LguaDKGYUhOyFzoUpfsiQ0uhrnM30oofY1xWu3Uxno5RdvK
         OQ0B6xS7yUkGvnnCrXMAZTXP1pAoWMCibSTQeUFVxgTuwTMseucRrKG8+EFdm3JXEkeg
         ZFhg==
X-Forwarded-Encrypted: i=1; AHgh+RoNPF4HA+NL15PZYilB5EGmyT+mUgdCfc6OZ1Tu4eDlKReDqhZLDC5GeF3aXaRct8Ecfqvj3CLYE6k0o6soC1Wd@lists.infradead.org
X-Gm-Message-State: AOJu0YwUnjrnA0Mw1rVrZvhVtdS25fzTjhTbuJv6k6nfnDYTkfsxw1RM
	j4ju0KJu3kYlRa2Pi9P41Deb+1UHdSDL+t7qzJiHV/U5NYMN1V2FcWnK3xJW704YEvhvD+08KlZ
	PBLlbsHSAVlpu4i4slKwxmtqb0jbQ15o=
X-Gm-Gg: AR+sD12K2ZyMC5OaqY7cZlrzFGnVf/LlyIBHCuqqGklxW9h+0cwhhNYR+SDlKWHj5dq
	oE3F7DzupLFSH/Hvg/MJlRTEaI9nMeV8v20BnaSUTRtp4zUjb3+9hMuBrsVnqYy8MOdAklLCo13
	3L6Qk1bcyK/DMO95oWwdIjs+UIasZIQhIzE0e/BU6NXXT2cZjqGcRmUi1QrfPKl5qG63R0/7hDo
	gQFQUF2kH64IOUf1OpVpmy4DSTtXVLQVqwUqRQwICveBHcFNTgzQgq0JLQ43QyUpfZGzkfnQUuk
	DewmNPQvOVknJWk4AGbTeBjfaVWsefH1C/z+J3sFrV0tdaQmxM4E/eFF2o//LOA=
X-Received: by 2002:ad4:5945:0:b0:8ea:fb8c:2e0a with SMTP id
 6a1803df08f44-908813800camr422497886d6.28.1786295807862; Sun, 09 Aug 2026
 10:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-4-l.scorcia@gmail.com>
 <aniv5B4jz07mI70D@buffalo-ssd> <CAORyz2KJMY6OvFQEB2GU0P7CkxothuXOCXgCcRvtiUhhPaK1ig@mail.gmail.com>
In-Reply-To: <CAORyz2KJMY6OvFQEB2GU0P7CkxothuXOCXgCcRvtiUhhPaK1ig@mail.gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Mon, 10 Aug 2026 02:16:36 +0900
X-Gm-Features: AUfX_mwSw9EQyRpwAxS44Dmd7O80H1Xy4wdfZq_kCKddFw7XIYHyFdFWMPL0V3c
Message-ID: <CAKr_iV5oi5VbnXZD-7b4XCaUuimavqYNBDO=2oM39JvYwzkwmg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_101649_563787_3EC9254A 
X-CRM114-Status: GOOD (  19.90  )
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

Hi Luca,

On Mon, Aug 10, 2026 at 2:08=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> I apologize for the mistake - if a new revision will be necessary I'll
> correct it with the Acked-by tag.
> Thank you!
>
> Il giorno dom 9 ago 2026 alle ore 19:04 Akari Tsuyukusa
> <akkun11.open@gmail.com> ha scritto:
> >
> > On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> > > Enable the toprgu reset controller feature for the mt6589 SoC. This
> > > allows generating reset signals for the 12 subsystems managed by its
> > > top reset generation unit.
> > >
> > > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > I provided "Acked-by", not "Signed-off-by"...
> > https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
> >
> > PS: I am also fine with this patch carrying my Signed-off-by.
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Sorry, I made a mistake in my previous email.
The Acked-by I mentioned was for patch 1 of the series, not this patch.
I did not provide an Acked-by for this patch.

The Signed-off-by was not what I originally provided, but I am fine
with keeping it for this patch.

Sorry for the confusion.

Best Regards,
Akari

