Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB06CF6A87
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+mR41nzWCIkR7vEalH2Z/Nd2Y2pgD8cS0T18/wjMnw=; b=s7xYmg6fvKVlyeSqj4f6hoCWIg
	JUOzLH81FFYoN++j3NR/8tOjXXPZSReZCx0Rm6F3a3ktXnSkA/pK8aFNimKBlTC6KZYfs/kppBIx1
	/pPe8fNYz+hh78uK6nkPHngnbdBYhF7lDHx5b3zFhm4wEBR9ELC9UZd/keD5DGg7uGah2szRDUlXd
	PxC7+Ikzws0QX85md6twSc4F75+rM8h91ifhyLuVoQ0RtGqRFoIw6V5jBBIjm7ZTTmAERyrUj5AtP
	7ws61nnB0qenFWaJWhhBa6sVQ24BiKbVPb6cL9tr0G9yexZpnrVZTWGhs8d9GFW1ISOL9tJMA79s1
	geZt1KOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdliE-0000000GLTD-3DWL;
	Thu, 08 Jan 2026 08:49:46 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdliC-0000000GLSQ-1YlL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:49:45 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4fc42188805so31204451cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 00:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767862183; x=1768466983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+mR41nzWCIkR7vEalH2Z/Nd2Y2pgD8cS0T18/wjMnw=;
        b=mC+Mo9MDvhHsP73oQWiOk8K5037DqIhQOXraczhyNK2Xy3d1y5N64mPu3e7b6hwZXz
         uftJfS6bAdBE60jiQEoM+V5EiXCsGzJMHt7qFSTgaEgLaPGw6Zy3GwRulXBYjWSE9Mrw
         efFcbOMIkP3/o2O5ZdO3nqBDAyLgCjhZfChaX0Lu2pvsFJLQ3ztOiwCh/uqj+5Is88z+
         MvDP0UC4+9GQ0hnOIvYstafAPBdsP+Hfqg4wqoxzqevw5xx8Bjg59JGsRjUftZfEf5y3
         BHXoC81M3FzB/jmkBxrTfduHjJcZ9y/VaXt7fkhhqBOHMOD4swtOcO5mToF4I4N80bxY
         Cnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862183; x=1768466983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+mR41nzWCIkR7vEalH2Z/Nd2Y2pgD8cS0T18/wjMnw=;
        b=tDWFIm5W2vg9hZm8rHhHrkduL01+QiFVIsfFbnJYYTq3UINcW2RjDvQ6wo7PWYHYFa
         k5v/AYuZqnCMODsoi3315e5tlwb10IJErg6phw3IjpXjZxmMmH5zFOCTQXjyLt1QOAVP
         7eUWC1W6biRl9BaMdFguAIaNSW8bFSZl7vk/DshV2dJztlha9aNNKmEoc3x+PHT410RF
         3LZ6nlx83RkH2ujC3DM2jzh/QJMJuThwtKbEqB/A+qJDyLAen3IjhMRSpSZC/M0XPSiH
         inXVVDYLVpvwckn+pZQ9QD4rnrFRFYnmebnq08FPzELLCzDAu7ue+yIs7T4qTLan6urS
         4t/g==
X-Forwarded-Encrypted: i=1; AJvYcCVcYf2zAK4JQnONfDguprGhV8j9hFEt0KQH0qnkJxM8aFuQybpf0qdpx5EWCzvvXYNlgZ5SzxDgO0eGz9EAv2Zr@lists.infradead.org
X-Gm-Message-State: AOJu0YweXgalvmabwnJkfuhXYxSoqliFMXmL8LkQBe1Swa+q4ZvQPyvg
	ldJ6Ca5rU3PDDBuVW3BEFocrUXKqhQNF2lB+vellMv37B8lDl75UPI1QrEdoiMiyKCJ60H/PmDB
	9rgJzxgQEiMmt/XC06dF+Drpt1VgZ7U0=
X-Gm-Gg: AY/fxX69YlAiijZpd8/rm3oftWPIm2dywVYzYI/2XddNx96Cf4ojb748a8iDpbyDZNQ
	G+q1FRAgVNDtp8irD3OOcb1CZAQQPsy52kEAoyjNiUL30Pmimco7X10DjmQL2FTuFAnrL2+/ZFj
	d+tBnDL/Ol51pX3bXxgGGb5LN8e1mEdDWfmLPISgO5aTLxM93jHZkI3i7zwBzw57r/Sd8Xl5yWE
	jKvn6mljDAhUV5+hVodDz9N7jlbIbswBiuts970wQcLqVmcfdpHmYrxlO4B8Sd0KV+fUKPWTgXt
	et6ZRzL16/nao60rknpkRDGItbh6
X-Google-Smtp-Source: AGHT+IE/YI18F1nhJhEFmTsO58DLq0QMKXZtevsfEeQsCPnd9cic8/shsfNP/db84QRndLqHAtrqtJq7ITmw6U4bhhE=
X-Received: by 2002:a05:622a:156:b0:4f1:b3cc:2cec with SMTP id
 d75a77b69052e-4ffb499cc01mr73331881cf.52.1767862182928; Thu, 08 Jan 2026
 00:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20260107070322.323-1-kernel@airkyi.com> <20260107070322.323-3-kernel@airkyi.com>
 <b5a3470c-aa03-42d0-a575-b705f709f8e6@lunn.ch> <CABjd4YzsjZXe16XWgrHRG5shNA_DQJF45i1roahvfAfV4xdU0Q@mail.gmail.com>
 <a545fec0-cb30-489a-b5e6-4ee87dcab41c@rock-chips.com> <5FFFBA7FAF5745A7+e0381969-800a-4bf6-9aac-81cffa3469a1@airkyi.com>
 <CABjd4YxwD_q_FrEuPw_GY+vG6700Vd_weWqdcFn2C3V0fqpO-Q@mail.gmail.com> <6f55c325-6b2a-4fe9-a487-5f1ae7969d9d@rock-chips.com>
In-Reply-To: <6f55c325-6b2a-4fe9-a487-5f1ae7969d9d@rock-chips.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 8 Jan 2026 12:49:34 +0400
X-Gm-Features: AQt7F2r_KkIckRFZ0j1WkhT1Wr9YTLBcdSnJhRs0ku47wXCJ9eTlpAtdn-fs5LY
Message-ID: <CABjd4YyMj=1pQBwqo9suu0W_HD=MG=zb5wo9dheguMBxi+oNqA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260108_004944_427141_3D01EE39 
X-CRM114-Status: GOOD (  28.30  )
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

On Thu, Jan 8, 2026 at 12:38=E2=80=AFPM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> On 1/8/2026 4:11 PM, Alexey Charkov wrote:
> > On Thu, Jan 8, 2026 at 12:02=E2=80=AFPM Chaoyi Chen <kernel@airkyi.com>=
 wrote:
> >>
> >> On 1/8/2026 3:42 PM, Chaoyi Chen wrote:
> >>> Hello Alexey, Andrew,
> >>>
> >>> On 1/8/2026 2:53 PM, Alexey Charkov wrote:
> >>>> On Wed, Jan 7, 2026 at 10:18=E2=80=AFPM Andrew Lunn <andrew@lunn.ch>=
 wrote:
> >>>>>
> >>>>>> +&gmac0 {
> >>>>>> +     clock_in_out =3D "output";
> >>>>>> +     phy-mode =3D "rgmii-rxid";
> >>>>>
> >>>>> rgmii-rxid is odd. Does the PCB really have an extra long TX clock
> >>>>> line, but a short RX clock line?
> >>>>>
> >>>>> Try changing this to rgmii-id, and drop the tx_delay property.
> >>>>
> >>>> Actually it would be great if Rockchip could clarify the delay
> >>>> duration introduced by a single delay element in GMAC-IOMUX delay
> >>>> lines, which are controlled in the GMAC driver by the {tx,rx}_delay
> >>>> properties. Maybe we could then switch to using
> >>>> {tx,rx}_internal_delay_ps for fine-tuning the delays on the GMAC sid=
e
> >>>> as envisaged in DT bindings [1], and use phy-mode =3D "rgmii-id"
> >>>> throughout. Chaoyi, any chance you could ask around in your hardware
> >>>> team?
> >>>>
> >>>> Currently though removing the delays at GMAC side altogether causes
> >>>> unstable link operation - see [2] for example.
> >>>>
> >>>> [1] https://github.com/torvalds/linux/blob/master/Documentation/devi=
cetree/bindings/net/ethernet-controller.yaml#L342-L347
> >>>> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/l=
inux/-/commit/372f3e9ae62cc62cdf2543391ea57be6bb548a0c
> >>>
> >>> Sorry, this problem has been discussed many times before. It's becaus=
e
> >>> the gmac on the Rockchip platform currently relies on setting the
> >>> corresponding delay via phy-mode [3].
> >>>
> >>> [3] https://lore.kernel.org/all/mqoyjn7mnq6tmt6n6oev4wa3herjaxlupml2f=
mcampwiajvj4a@r5zs4d3jdm5p/
> >>>
> >>> The delay introduced by the delay line is not absolute. In reality,
> >>> it depends on factors such as the chip's design and process technolog=
y.
> >>>
> >>> And for RK3576, you can assume that:
> >>>
> >>>       time(ns) =3D 0.0579 * delay_line_count + 0.105
> >>>
> >>> For example, tx_delay =3D <0x20> means:
> >>>
> >>>       time =3D 0.0579 * 0x20 + 0.105 ns =3D 1.9578 ns
> >>>
> >>> And I believe {tx,rx}_internal_delay_ps is indeed a good idea.
> >>> I'll try to add them in v3. Thanks.
> >>>
> >>
> >> I've also see some dt that use {tx,rx}_internal_delay_ps inside the PH=
Y,
> >> and compared to doing it in the MAC, which one is the better choice?
> >
> > Your PHY defaults to 1950ps in rgmii-id [1], so adding anything on top
> > of that on GMAC side would land you with a longer total TX delay than
> > you currently get according to the coefficients you've just posted
> > (1784.1ps). I would say go for "tx-internal-delay-ps =3D <1800>" on the
> > PHY side for the closest match.
> >
> > [1] https://github.com/torvalds/linux/blob/master/Documentation/devicet=
ree/bindings/net/motorcomm%2Cyt8xxx.yaml#L36
>
> Ah, I thought it was something like this:
>
> &gmac0 {
>         phy-mode =3D "rgmii";

phy-mode =3D "rgmii-id";

>         tx-internal-delay-ps =3D <1784>;

Drop this, as recommended in the lengthy note at the bottom of the
binding doc [1] (the GMAC shouldn't be adding a delay that is close to
2ns).

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/net/ethernet-controller.yaml#L342-L354

> };
>
> But what you actually said was this:
>
> &mdio1 {

&mdio0 I guess (but same applies to gmac1+mdio1)

>         rgmii_phy: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-ieee802.3-c22";
>                 reg =3D <0x1>;
>                 tx-internal-delay-ps =3D <1784>;

The PHY binding [2] says it can't accept arbitrary values here - only
150ps increments. So you'll need either 1650 or 1800 to get close to
your calculated value above.

[2] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/net/motorcomm%2Cyt8xxx.yaml#L36

>         };
> };
>
> These two `tx-internal-delay-ps` things shouldn't be the same, right?

They add up, which you don't need in this case AFAICT.

Best regards,
Alexey

