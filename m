Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10879C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DU8rGFe6B3mE/xdQKQTWoBiiNLtj1+ih/vdN/GH7wsM=; b=kyUleSknGMqctjRjZ62MwibMPj
	DvaID8fF6FM3i4aaA/ImywIPF/YErFwizouHg1QgLjGzSb2xVVujMJKTm/6kNElg7+Tt+oLWZeVJm
	gPThnHZIeMCtQWMzpGlo8NLnETiAa9oiL/hu1l3S/bJhUXujx+/+anppEbK+PUGu7KTf07I9gSrKW
	Wubvr+mZv0hFxLC26NVcA/QeIlWLQn+G0u5hD8GWbrMQa6k0xta0QWYFoLSuvPzWSkXWJ1SQ7M/Aq
	PnETXGWynghY9I6hLYfaHlrgkW7Y/ADm1P9/KNtmsQ60l+xcSIX2HaiMDol4kU1AOeMLcdJiXOuPM
	cuavFwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virsJ-00000006prp-382R;
	Thu, 22 Jan 2026 10:25:15 +0000
Received: from mail-ua1-f66.google.com ([209.85.222.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virsH-00000006pqx-00JM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:25:14 +0000
Received: by mail-ua1-f66.google.com with SMTP id a1e0cc1a2514c-9412512e9f3so198357241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769077511; x=1769682311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU8rGFe6B3mE/xdQKQTWoBiiNLtj1+ih/vdN/GH7wsM=;
        b=nQwn7xkRGCQaPaxXHZ27+FAxJKLqCXiyiruVMGLxPry+av9/3Ymn0/Bui1kORUib/H
         BvAGuS9+PBuQ4Ky5pACrrcf3ogpXhinB4nSsxHIbPoCMHAhjdYmMooRHbh5LX7wfgvTT
         tQcDNE4fXZWVlDrUnIsTvYxBKzrCYLItpMQ5jlgdbr8/b+ga4TAKKfr+Inob2vZaxHSF
         uGaL8JD+U7vQGlD9DjKdhZV5nm1bmjRVy4H44qnzwz2gs25ldU3oPPtFsfCmZ1yBXr5E
         uovYzAVZoRxzND8jX+pCvAFSWLpWAq5N2+4n/KZPslcgqJr5nDe6DueMcSN7Nv1vUulp
         azTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDw9hFLsi/Vgu+SChg0W2LrHW2lNQSezf5RXzO9wja9kkHsIkJM1OZLZ6kC8cm6lroSrlopR34rztNpmEJYSGh@lists.infradead.org
X-Gm-Message-State: AOJu0YzayEKmApeLd35WdjrtCjPKfG0/Y7qQx9zkbNAbpwNB9okODuoX
	r0ip1tjc9ZLY+a1mtVWNUbNmRm1DV4EF/R57HZ9RgtLU26eFnNAVssny++yv/uK4
X-Gm-Gg: AZuq6aIb1bnQVwRuA4KFS14teptau2osUU+d98LUCYot987TReQ01JTX1sShYG7LLne
	jWmcuZC799+h/kkbE2bbrCE2yBlz0y7r652NJ8DCdlIBOilWiwd6OCNAKh1aP6KVtJRuaj+Y8fd
	Z8Nk6YrkbVa9QhFNEBfPwkV7++9Tidms2wyUvXGOM6qT+ljGwCznTghbSF0HjvdM/zEgYQrYJds
	f0be7lTZyMGonefajoIXZNzxNwOaibDHRxVBBOPcU7ZyFf+/AycZPiArUTvryusO70g6KcmoZoS
	x3JxVgz1q2JcFc0mI9l0wVDd33kLUs1wor5k4RYJGPsHigFEjEFb9hdjgu1KrKikFmTuFkJtn+L
	p0d1fHnbuzCsXpAWid/KXZaJ4zJEbPosP+Bg34qAOzXe13KpMpv0N1NAZr/6KnYupgYi+ry5m9L
	gAkNF+mYuXXM882rBKT15xRtT5AdG35JoqHUMEDjIWE00f46Fs
X-Received: by 2002:a05:6102:c47:b0:5dd:b100:47df with SMTP id ada2fe7eead31-5f1a6fa452fmr5579042137.4.1769077511104;
        Thu, 22 Jan 2026 02:25:11 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f5337d089bsm376875137.7.2026.01.22.02.25.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:25:10 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-948104feb8eso195881241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:25:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+x9dd6td4N9t3YD8Ns+kX0KJD6SNq+2SZYT2wvyA+GMb/BxBbeR3uB1gSKGOygikPo6hc8AngJOwPAlNHCYj5@lists.infradead.org
X-Received: by 2002:a05:6102:c8e:b0:5f5:3826:3cfb with SMTP id
 ada2fe7eead31-5f5382646b2mr467462137.27.1769077510009; Thu, 22 Jan 2026
 02:25:10 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
 <20260118135038.8033-10-marek.vasut+renesas@mailbox.org> <CAMuHMdWfkHMQFvUzaHpso-fMFAS5u8ABHpEA9ZXq1fxcR-oN6Q@mail.gmail.com>
 <6f817993-1b4a-4600-a771-d6c25efc668b@mailbox.org>
In-Reply-To: <6f817993-1b4a-4600-a771-d6c25efc668b@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 11:24:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0iuyUhGRPFf4x==e_ZEMjaB_dP6mrM81F+yxqwam0FA@mail.gmail.com>
X-Gm-Features: AZwV_QjuP8FSEPCU0Lg3L4U6GH5gFTYqAWXZrFYKPuIZu4sDlAHvOrdK6rQ4B2g
Message-ID: <CAMuHMdX0iuyUhGRPFf4x==e_ZEMjaB_dP6mrM81F+yxqwam0FA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0
 clock generator
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_022513_037851_09595ED1 
X-CRM114-Status: GOOD (  26.77  )
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

Hi Marek,

On Wed, 21 Jan 2026 at 23:44, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/21/26 2:48 PM, Geert Uytterhoeven wrote:
> >> @@ -871,7 +902,19 @@ &usb2_phy0 {
> >>          status = "okay";
> >>   };
> >>
> >> +&usb3_phy0 {
> >> +       clocks = <&pcie_usb_clk 6>;
> >> +       status = "okay";
> >> +};
> >
> > This does not work, probing fails with:
> >
> >      usb_phy_generic usb-phy: dummy supplies not allowed for exclusive
> > requests (id=vbus)
> >
> > Adding a fixed regulator that serves as vbus-supply like in commit
> > fec2d8fcdedaeeb0 ("arm64: dts: freescale: imx93-phyboard-nash: Add USB
> > vbus regulators") fixes that issue (and my USB3.0 FLASH driver is
> > detected, yeah!), but a more accurate description would be better.
>
> This piece of code in drivers/usb/phy/phy-generic.c [1] shouldn't fail
> the probe if "vbus-supply" property is not present in DT. If
> "vbus-supply" property is not present in DT, then
> PTR_ERR(nop->vbus_draw) == -ENODEV is true, nop->vbus_draw will be set
> to NULL, but won't encode error, so the dev_err_probe() won't trigger.
>
> "
> 259         nop->vbus_draw = devm_regulator_get_exclusive(dev, "vbus");
> 260         if (PTR_ERR(nop->vbus_draw) == -ENODEV)
> 261                 nop->vbus_draw = NULL;
> 262         if (IS_ERR(nop->vbus_draw))
> 263                 return dev_err_probe(dev, PTR_ERR(nop->vbus_draw),
> 264                                      "could not get vbus regulator\n");
> "
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/phy/phy-generic.c#n259

Sorry, you are right. I missed the PHY driver ignores the error and
probes successfully, and thus didn't bother doing "echo ee000000.usb >
/sys/bus/platform/drivers/xhci-renesas-hcd/bind" after /lib/firmware
became available.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

