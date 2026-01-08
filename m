Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59762CF6C15
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+Glvnfd6LAUkE51MfIE7FcPhOQSX7v4Jbr+9HBdyoY=; b=tpxsNiuZPUQFJXEdu9ek+1jiCo
	m3dhIFuV7KMublZanWBfwpnklAAXrHQ7Z2nAKVTz6jDrbMypNtG1vQXB5sOEpZ24z99hN+lNG02zh
	tNSfM9gJ5VedwcEUv5WdEEaqni4oWUUgqbc0j9Y1ogmSpQu/whGxeKNa+C2Z4NN3xUwhhjCY8JUwL
	4xiGkBDfN+1JRhPDW0gq049ZqtGMZiTfQiKOFiaK52rEFseLgHMCIXd8YW2a5bq3ByMieuiFxEtCE
	iMHtnBWHkjoT27cCRYFvC11kfwF0qezXbY78iR7vQWkYsPJZt9Z2j5RzRh3O3p76/sUlIk4C+CGAx
	G7onQ4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl6y-0000000GEIa-1Zz8;
	Thu, 08 Jan 2026 08:11:16 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdl6u-0000000GEGs-48RN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:11:14 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8c0f15e8247so393759985a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 00:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767859871; x=1768464671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+Glvnfd6LAUkE51MfIE7FcPhOQSX7v4Jbr+9HBdyoY=;
        b=DOvsz1mnk8MHhZDl9YcIse4zxSeuLKaiO4w4Yj8vAPY9HLMBxOG18MF5eFwG8W9MvC
         EL3gNNWjUCk57c9Uzx9LtjZLxsVxfx4ADKjjoVsqPKn8XHCJEzEyhfAeHKCa2nfFPDfI
         Vo7eAbeZrEb3+d8Tx2zohp0jRFyrauxnJr1aRpD7PO7CTedGLEA1/0+zb5uK6BvEdPWm
         tpLpV0cIwC+Rj8yuhGPU3j/aqf4dCsY0vLSaomJzuKvUASzoivDxUw7k0ItDTb9LdD/H
         8IFQvHggxgvQTE9cGOP4IXGUTBg0hAXHeIc/MiflfYH1dijQoIrtBm4tkemviI2zaDya
         ZIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767859871; x=1768464671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+Glvnfd6LAUkE51MfIE7FcPhOQSX7v4Jbr+9HBdyoY=;
        b=wkfK143ODz1mCoatuxxeGzgJJQD+V7SYIK0LZqcRwHJUcO01H6IBokCPy+6c1bKdNd
         3zaqwQTAUbm/PD90i2aAyVEWgksdqhfvoDHv60KFhDq3W3+CrmPGRt99+NX2pUR2hB9D
         IAKuBESK/9X6CYaT3kmgKOtwKLZBGVZ6kemw61k4WwR/sMu+KQIXq5tYPiJHY/Tw+3jY
         b6Y6jas39QDwW6iMbt3FC80EVNIlm7i/lu9+QFb2Jp9bPAXqwLN5GRybwSHq79dIS6jm
         RHkzc9D+32UdmsyJBe3IYpl38RZbW78rrw4cBS2te3QgEVwTHoJFmSZhMqD2e9VLeLcP
         6yLg==
X-Forwarded-Encrypted: i=1; AJvYcCUByW5Fe/QS6PHt/LeOlJ3eh9ORCrplvCnCI4kuyM+/MKhBn1H72J2T1iHWCVMuCmtc+zXdgBwvjO9qxU72p3ut@lists.infradead.org
X-Gm-Message-State: AOJu0YyI8aVjQZ0w+ezslyoZczjIOMLJmoQUVsAY9oRgHXKEG5Am4ggz
	/v+rNazALpoGnpoPyj7kuP7zX9N7LoN14RJfJbYdBp68TTdM5FU3ouNIc7T/FKy6cp3tMH9vpzh
	VWX3I5OVGUGsisd2pE0t77S1Tt5dXGvc=
X-Gm-Gg: AY/fxX7JS2Hl6pATUX/u+sYeL3NERHxayf6WfD1m1Teudti5Div/i1bfywIslqT6U3V
	/EaFEKY+JarOYdsaYadJYaNjMwlSR/Mgt3MEpDqh8hzr4122CV1PiWH8OuHGTG0X2rJkVZTe2IG
	1bMV+lcsxInE1Ev7DLR8jkzxYly1+s5UOuf3G50+rptFt25vQ9nbJ+Qs6knNK45IohmSl9uei7K
	Aab3hVqUXHQZXGA9IXG/DFbDzwo/aCbKS+qEJvK0wwB14srnTplA/F9lrieO90fAiC5KQFASVwx
	XPR62GW9k5tdO1TvJgG/4aCqQE7xS3c1q99f/AM=
X-Google-Smtp-Source: AGHT+IEdAUONxF+e/EKeQFSKSnMmXdXqTd3nqcmKjl1wsNzyIlWHOka5hlCEOh+2jDUpz0UQJe/gsSFaF+VGtSBhkSM=
X-Received: by 2002:a05:622a:351:b0:4f1:def3:cc00 with SMTP id
 d75a77b69052e-4ffb4a2b7c0mr65492071cf.82.1767859870974; Thu, 08 Jan 2026
 00:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20260107070322.323-1-kernel@airkyi.com> <20260107070322.323-3-kernel@airkyi.com>
 <b5a3470c-aa03-42d0-a575-b705f709f8e6@lunn.ch> <CABjd4YzsjZXe16XWgrHRG5shNA_DQJF45i1roahvfAfV4xdU0Q@mail.gmail.com>
 <a545fec0-cb30-489a-b5e6-4ee87dcab41c@rock-chips.com> <5FFFBA7FAF5745A7+e0381969-800a-4bf6-9aac-81cffa3469a1@airkyi.com>
In-Reply-To: <5FFFBA7FAF5745A7+e0381969-800a-4bf6-9aac-81cffa3469a1@airkyi.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 8 Jan 2026 12:11:02 +0400
X-Gm-Features: AQt7F2rIL0j1pGTpV955PkaH5TbgcjPMfDl1RCgaVeY4cqitQ7C4U5-dQqanFs4
Message-ID: <CABjd4YxwD_q_FrEuPw_GY+vG6700Vd_weWqdcFn2C3V0fqpO-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>, 
	John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>, Jimmy Hon <honyuenkwun@gmail.com>, 
	Dragan Simic <dsimic@manjaro.org>, Michael Riesch <michael.riesch@collabora.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Yan <andy.yan@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_001113_035998_63AD3951 
X-CRM114-Status: GOOD (  27.59  )
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

On Thu, Jan 8, 2026 at 12:02=E2=80=AFPM Chaoyi Chen <kernel@airkyi.com> wro=
te:
>
> On 1/8/2026 3:42 PM, Chaoyi Chen wrote:
> > Hello Alexey, Andrew,
> >
> > On 1/8/2026 2:53 PM, Alexey Charkov wrote:
> >> On Wed, Jan 7, 2026 at 10:18=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> w=
rote:
> >>>
> >>>> +&gmac0 {
> >>>> +     clock_in_out =3D "output";
> >>>> +     phy-mode =3D "rgmii-rxid";
> >>>
> >>> rgmii-rxid is odd. Does the PCB really have an extra long TX clock
> >>> line, but a short RX clock line?
> >>>
> >>> Try changing this to rgmii-id, and drop the tx_delay property.
> >>
> >> Actually it would be great if Rockchip could clarify the delay
> >> duration introduced by a single delay element in GMAC-IOMUX delay
> >> lines, which are controlled in the GMAC driver by the {tx,rx}_delay
> >> properties. Maybe we could then switch to using
> >> {tx,rx}_internal_delay_ps for fine-tuning the delays on the GMAC side
> >> as envisaged in DT bindings [1], and use phy-mode =3D "rgmii-id"
> >> throughout. Chaoyi, any chance you could ask around in your hardware
> >> team?
> >>
> >> Currently though removing the delays at GMAC side altogether causes
> >> unstable link operation - see [2] for example.
> >>
> >> [1] https://github.com/torvalds/linux/blob/master/Documentation/device=
tree/bindings/net/ethernet-controller.yaml#L342-L347
> >> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/lin=
ux/-/commit/372f3e9ae62cc62cdf2543391ea57be6bb548a0c
> >
> > Sorry, this problem has been discussed many times before. It's because
> > the gmac on the Rockchip platform currently relies on setting the
> > corresponding delay via phy-mode [3].
> >
> > [3] https://lore.kernel.org/all/mqoyjn7mnq6tmt6n6oev4wa3herjaxlupml2fmc=
ampwiajvj4a@r5zs4d3jdm5p/
> >
> > The delay introduced by the delay line is not absolute. In reality,
> > it depends on factors such as the chip's design and process technology.
> >
> > And for RK3576, you can assume that:
> >
> >       time(ns) =3D 0.0579 * delay_line_count + 0.105
> >
> > For example, tx_delay =3D <0x20> means:
> >
> >       time =3D 0.0579 * 0x20 + 0.105 ns =3D 1.9578 ns
> >
> > And I believe {tx,rx}_internal_delay_ps is indeed a good idea.
> > I'll try to add them in v3. Thanks.
> >
>
> I've also see some dt that use {tx,rx}_internal_delay_ps inside the PHY,
> and compared to doing it in the MAC, which one is the better choice?

Your PHY defaults to 1950ps in rgmii-id [1], so adding anything on top
of that on GMAC side would land you with a longer total TX delay than
you currently get according to the coefficients you've just posted
(1784.1ps). I would say go for "tx-internal-delay-ps =3D <1800>" on the
PHY side for the closest match.

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/net/motorcomm%2Cyt8xxx.yaml#L36

Best regards,
Alexey

