Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12D7C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYYBXc76RfdtU54i/yfZoijMWBxoO6zClIQBh+szfn0=; b=k7ZDDZKlb0+kHzgr2zOrPd1ySL
	iQWvoJHK5iRD5zMJEbmdqvQWVRo3DPbR554XrzJK4uUx9/SUuPyttBNzbDMMr0hhT7TfHwc9xNY4a
	VHRuedTeqW7tgq4C4iSroqExU0+oWuHsalwn7puhBukvugvI0AF37dNmNwkyp2rWeiIgT9JW1sP/O
	Q23hwsdJXalQxTZv00N1988swlLADoe/WFj7cc2REVXPSxWn+eKRBVw0yTXSGAD841nvlMNXB2Mb2
	BEa6pvhgFg7B5ttTiqJGuqeT3dlhHxQY0gFagTm5cdlU3kdpXW3mkLa+RL64KDlAtvUktss87QR0j
	P0yWY7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzA6-0000000BHV4-34ca;
	Thu, 20 Aug 2026 09:34:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzA4-0000000BHUb-191X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:34:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so15486961fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787218450; cv=none;
        d=google.com; s=arc-20260327;
        b=J+h/r2KzF54KukPD40Bd922pLjHNoUj87Q93MHn2sFaZv0jenRWoGf0x8hBVwBo0U6
         spg0f8b5S25H58kfpAVCCewxq2eshp//BHcIuecxBAup9npvZN4d4ZLMPi7ZoknvR9hW
         NU7wLpKSdIseFs7ANDzXcUto0oaJC21e9rc40Cy+JuhIXg049gt0TsYnWiy/ufnQCpqS
         tME5MEHL+K1vVHjqWzh89evbUGBuhhNXv8ktFZhl7vtH2k57kTOgtWNA72UBO2YuT9YV
         Mth1Tba6X9mSREXLgD2o3YzfMAyBKKmZdt1Izd+GlbRTT0I/r85j3B90lmubqzB1akO0
         guPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nYYBXc76RfdtU54i/yfZoijMWBxoO6zClIQBh+szfn0=;
        fh=82b1p9OHgnDRt/RI4o6W9N9SIiDfMBSYg0RyI+dAayM=;
        b=Umm4JWkegUMwkkfD2QPSxakg61NMrAwS1+2jo+NK1tTIv+dW9+8bhWUgdmjkVtc6h7
         fxZ0p2jZwcAoLFfJ/xmh9l8seru5HzPBURr2oczu3rO6Z9XPRCvhgeH9+nMYsHZappB7
         /HA/gkljIrRmryxuoMJMCy9wawovxEu/JJ9rrub7WVpstSKi/tki/AaUZLMRMjDsvAj2
         PhKLOGhEKzxVhr9VJMVfP686INRWwspIT1Z6lEp5FKVm6LLBrvHge4fPd8U+ocJ4MepC
         dTBuvHyIO66aEUWRU3DnLuacrfwEOspD0npuES16XSjIoFnCu+d5scIIRTJ/P6/ez+yw
         iumw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218450; x=1787823250; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYYBXc76RfdtU54i/yfZoijMWBxoO6zClIQBh+szfn0=;
        b=p8YvDJqQUrBw72bY8lIfY6EqkvfWxdZUW9t9Io1bsf6OEXp51bfmYG0IZJqWdN+fKp
         Sp07juS2wnd6c64J9yCIrNv8klPmH4SlXVlcYQvxlAFDVp6VVou184jjMuT3x2xx56+D
         fK2jXxUQ9jGMl/4ltskHT+7YDWZHajd1w31Ko41HiJVJOiX7umaYWRitAm9mLgnMvz7p
         vTFLvvNe5A2ENL529jQ7mmjQGKJyzX8qd4mqyEQTizOXgrj3pNiuUcpxP4KwXXdl0ABs
         RHgMm751VIVIyxQwb+Szn28iKn7kFMILzKwPP+GWJkgCc24Nt1rapLohCKbQAHaWtPFR
         Wuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218450; x=1787823250;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nYYBXc76RfdtU54i/yfZoijMWBxoO6zClIQBh+szfn0=;
        b=do6RSjszyp8pe1jlHzX282hEazBo1e04CD30ibzUM8BgjAakYL3z4VlP3BGJymz68c
         F7AmT+EkMZn2Gb/u19rXK5dwO2WUsgonjN6CXfl2DZGn+d2WYNSg+pW62Ms8Mh93VQsV
         nU85kiOsdUPbJoMX/Cv3sTQunxud1ZBLEntnSXQooo226/2fG0s2i1zfdVcB2V+1i9N1
         bQiQd+AxY8bSDGnABLQX56C1FBRCcAGShhjWc7GH/KxK/8fQJWp+DFVOSjjFbxIPCb33
         UC8oDNRP8hhdj5a1je5Gfeh/7uNPCgoU8PxxGP1BN64JRMoLkoK7TFZC1qVMnliwPJVy
         o4Hg==
X-Forwarded-Encrypted: i=1; AHgh+RrpHmXpWi0vNZwz6IVO3QMJW9wys2dQBfJSLS7GRK6EToXYrqV3EjZfxeEXz0/LAxMCKvY4ljL8R2nMYU747q6s@lists.infradead.org
X-Gm-Message-State: AOJu0YwnleTnj6wQyzzuSOpWgwJU8eQiogAJF+PkoRIrgpgbmTzcBtcw
	Bi45zsCNPTlI3v+onu0Q7Q+CA+bi1Ny0GyMa2mriAeknqmvdtH6OnvNF5hlXAo28+zsVIYPtS8b
	btQFW/eWVMF8aePfgoovGA5vDddFqXt8=
X-Gm-Gg: AR+sD10qWXiX9ya4sW7g/ad1Uz5KkLJvN6MoRClZSUrXGl4KWQJpQRmHZ6vMLeeYWVl
	o/ZQ2ogW9pcl/b9l3bI7ch5611VSGvy19ObniotmrbDn6ue6XXoc6UUQ4EC3JtcffCczNvtqPXQ
	D3cLJQxseA2gNi1OMBy9LH6JChSnzaeKgKet9tkvdvG1UzQWLyfUxBN2QgC47NryWVOIYHwcKf7
	14DSr4BA5yAnujUC4aFNCYGgbJz0aDkQUyz1ywc6dwnNjP/XkX6vB0ZLcxrE360rSvNP9Gb8gOK
	X39cTS8qmvNtDNlPGIlchdmjFN3ZWkGPIFcZl7+ClWtH4e7leMz7sgcr90KHLbfm04+dmZtc8pe
	nSHbKiDVFTahYubHCvG2E2FUG+w==
X-Received: by 2002:a05:651c:2118:b0:39e:a64f:d7a9 with SMTP id
 38308e7fff4ca-3a189725893mr23369941fa.2.1787218449766; Thu, 20 Aug 2026
 02:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com> <20260819-generous-nickel-dalmatian-b6bb08@quoll>
 <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com>
 <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org> <CAGXv+5H7AhZgZ06r9KO3HLZ9Cymkai+Cv9SgVTuSC1PjgGf8hg@mail.gmail.com>
 <d6c8f19e-f154-4b57-9101-cf3b73e9794f@kernel.org> <CADOrJmYxKTyDkKPaKCpH37RsyyZJZ+4uReE--+uvnHmEdNJVOw@mail.gmail.com>
 <c38cb98e-0746-4b28-b0c9-ce59e8338048@kernel.org>
In-Reply-To: <c38cb98e-0746-4b28-b0c9-ce59e8338048@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 20 Aug 2026 12:33:56 +0300
X-Gm-Features: AcwNN1UdyfRyP4qTovLiX62_oFOyy91L008QCKICpAGE3pTfgFyxj68IsFBTyvc
Message-ID: <CADOrJmb8CTkjRFp7OjynfQSFm3fHT87wemUM4X5yJjTtS=C7tA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, briannorris@chromium.org, johannes@sipsolutions.net, 
	andrew@lunn.ch, krzk+dt@kernel.org, francesco@dolcini.it, 
	johannes.berg@intel.com, kees@kernel.org, miriam.rachel.korenblit@intel.com, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_023412_358917_F75B9C65 
X-CRM114-Status: GOOD (  37.61  )
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

On Thu, 20 Aug 2026 at 11:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 20/08/2026 09:50, George Valkov wrote:
> >
> >
> > Krzysztof:
> >> regulatory-hint for me means usually regdb, but even with your meaning
> >> you tell SW what to do - ignore hardware regulatory information.
> >> Property should not tell what SW should do with hardware. Property
> >> should tell what is happening here in the hardware. In this case: what
> >> is the reason behind.
> >>
> >> IOW, why user of a board in country X, where regulatory data says X,
> >> should have the correct regulatory data ignored?
> >
> > Because users in X buy a board for X and the regulatory data says U.
> >
> > Indeed when the ROM regulatory hint is set to US and the driver
> > reports this to the OS, the wireless-regdb restrictions for US are
> > applied. This would normally be fine, however the third radio in
> > WRT3200ACM and WRT32x, reports US on all models including those sold
> > in the EU and other non US markets. This creates a conflict with
> > radios 0 and 1, which report FR and also with my correct setting: BG.
> > With the wireless-regdb restrictions for US, FR and BG applied, radio
> > 0 refuses to start.
>
> So if you move with your router to US, you would need to change DTB?
> IOW, the DTB is per user? This is obviously wrong... What if one device
> has correct regulatory data written and you ignore it? Why would you
> ignore it? If you decide to ignore correct regulatory data, then you can
> as well ignore it unconditionally and this property is not needed.

All radios on these devices operate according to their certified
region. The firmware for all radios is closed source, locked-down and
there is no API to change any regional settings or affect TX power. By
design, the regulatory information for this platform is configured
from the devinfo partition mtd3:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts?h=v7.2#n106

cat /dev/mtd3
admin1_passphrase=[...]
admin2_passphrase=[...]
cert_region=EU
default_passphrase=[...]
default_ssid=Linksys07770
deviceType=urn:home-linksys-com:device:Router:1
devinfo_version=20160121.1
hw_mac_addr=[...]
hw_revision=1
hw_version=48SAM203.0GA
manufacturer=Linksys, LLC
manufacturerURL=http://www.linksys.com
manufacturer_date=2017/12/26
mfg_data_version=1
modelDescription=Simultaneous Dual-Band Wireless-AC Gigabit Router
modelNumber=WRT3200ACM-EU
serial_number=[...]
sw_version=v1.0.0
tc_passphrase=[...]
tc_ssid=[...]
uuid_key=[...]
wps_device_pin=[...]

The intent of these patch series is not to make the radios operate in
a region other than the one they are certified for, that's obviously
not possible. As described in the commit description, the goal is to
allow the platform to use the correct region, which is stored in the
devinfo partition. The hard-coded region in the ROM of radio 2
conflicts with the platform region and should be ignored, otherwise
radio 0 and 2 won't even start. And yes this applies to the case where
the user bought the device in Europe and has configured their correct
country.

With routes that allow the region to be changed, a user can move from
EU to US, set the region to US and use their device.
This is not the case with this model. The radios refuse region change
so the user should not use it in other regions.
For models sold on the US market, all 3 radios report US. The platform
also enforces the US region from the devinfo partition. Even if we
ignore the ROM hint from all radios, the platform will still use US. I
don't see any regression. My changes are carefully scoped to a
particular device which needs them and do not affect any other
devices.

> > Would you approve any of these or suggest a better name for the flag?
> > Should ROM be in upper or lower case?
> > I omitted 'in-ROM' to keep it short, because the driver check line is
> > already longer than 80 characters.
> > - marvell,ignore-regulatory-hint (current)
> > - marvell,ignore-regulatory-hint-in-ROM
> > - marvell,invalid-regulatory-hint-in-ROM
> > - marvell,invalid-regulatory-hint
> > - marvell,invalid-regulatory-ROM
> > - marvell,invalid-reg-hint-in-ROM
>
> The point is that the regulatory hint is NOT INVALID. One device was
> sold in US with US data, so how could it be invalid?

US devices have no issues, because all radios report US.
I would love to ask Linksys the same question.
My router was sold in Bulgaria and radio 3 reports US. Others bought
it from the UK, DE, etc - same thing. Please allow me some time to
install a clean firmware and I will post the output from
iw reg get
so you can see the incorrect regulatory hint and mix of three regions.
This will take some time, and I will be left without a working Wi-Fi
until I recover using UART.

Georgi Valkov

