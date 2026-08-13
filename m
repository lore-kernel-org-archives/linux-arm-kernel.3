Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E14C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TClEoJsq0ggVTCXaYTDr62G718iMq9uV18dUpEwxTBg=; b=Amney9gTX4xont4KxcyuIxo26k
	uoDE9auEgJWvy9B8iLaQ0yZ19jNHhUQLWZdkAr/1j5JOzM+BhWrcGdQxj4bhxsSYIq8DZ6pjaOEZ7
	mfkIYih32Nc3twySGYoYP3oNG+6+XPyY63L8hg9AoWFb4gnan/LY4kaZ9RjLUHChM+H14u2WC57qe
	90zH9IjAJg7Oar8O2vK9Me/2LjjcZwvaZofP9GfkiY8im8QmVUfyOLOHQlZ9iyiFrcrglQ8WVsmDQ
	DVxdPJUQ8Wc5jvtaKjj0zfglDvugGK63WjiGkL4e93gJjBP0NRChy8TL4VkX9eBrGyyeG6fGixHpe
	33RjrqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQzd-00000000BZ9-1akG;
	Thu, 13 Aug 2026 08:40:53 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQzb-00000000BXI-1c9S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:40:52 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a18d89e4d9so315483a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786610449; cv=none;
        d=google.com; s=arc-20260327;
        b=gTRB8SdCEekp0TcM1ANtXQoRrdwIp6EPADcKXIFSQCpy2laAWF9AIsYLpRdJJlWH7m
         rZ/A+pJK8iPAFlvZnDY8jSvcfBSgl6K4jc9BWoV1NlMIsCbhKOxNwD8o98fV79G2s9mz
         U+uZjtKVnCwIkIV0ybE8rD2PdAtlEoT0QKx1ty5kYBEKiDiN66Jwkeq6Sm3OybdZoUsQ
         TZ1Tkh0NVt/fHimXOujsw2MslR6RuKxbDnupQDSEb9y98LDrm+CuZSuroZvhnv+c4VR7
         LyB1YhK6v2qgYvvLVHmwWLnoYiGkn7/VS16DjjNsfCa67Wf5xAMUfeGXP/GCwzswUZaO
         M31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TClEoJsq0ggVTCXaYTDr62G718iMq9uV18dUpEwxTBg=;
        fh=EDZI1emcxEC2xHyEtGOpI9fGBo0Ia4EKZ3PSlQS17TE=;
        b=ntMukaiDAHXs5OISxZrO4qyQW9g2an8Q33ynL1UzddHiAxPGdmBzMVsyyXJSgNu+MF
         etNyPn9HSqRdQOtSmsA84ySKF/J4uN6SNcKd9gSGuNxzW2GZ/6EMYubVdOYCjB+zSTWQ
         /+lakbIKFAMsRgBOsl2egGBeBuoXL9/wAU/UsULJzv0FaFd7LoMXu3wswQnjGTha6lS7
         7BTkRJ/v7w6LW6yILWK1o/WoDe9KZ6cjeGHF4CmoLf/sHemdO/EnwW9sroOAnU1b71pQ
         IWCGUTxznf9ym2t8YDYZMboVXrsVWADwAlPbrqirAGFsvMgCFYcGLm4pzoGA0uVRybA3
         TuQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610449; x=1787215249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TClEoJsq0ggVTCXaYTDr62G718iMq9uV18dUpEwxTBg=;
        b=Gw27tNjapMS6DTpdnSLf3ZyrIXZl1HR4bV3qvG+OtewWtiYxDOSljAewqoMZdsjIT8
         3eV1rvPLHI8XvSyFGS3ZzaFIgugWjp5gJUNAhwjYmVhNfepV3vK29xTZqvZNUGWLjTlK
         yAq5EdHrlXfZibOe6LEZvHJGLd83yXWrE9iysNEtdJKIhRcutUxCPTWKmdTkHX3LiHtM
         uuwKt3joMd7AhGqIQoxD3rGPf+KdmThvdx9V6/r6oydbwz7zOIufmN7BlBWIgRjJ3heQ
         lggxb9LyEQexw3aeBHn8eeN2CQhxCvh48MXWjjrC7EhKSB1LAxhv7H7e+WQApzWIWZqL
         MVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610449; x=1787215249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TClEoJsq0ggVTCXaYTDr62G718iMq9uV18dUpEwxTBg=;
        b=UKu7isIkzd/BOVuHBO8CI5YIeB6LinWgbncZYbs/uPoxZ4W9NlDTJ7CO8+O5JPWzPM
         HKgKKkD2bU07blJbg4dLficULokqe1zB0SGxN7UwK33vsMHCfJR3ve49sCBQ9DZG52og
         1x4rWlzmx54T8IfCQHoxGzzcuHPqLtQtAQjfE249Imee6B5WOnek4r+vYBpHwHuLr+sR
         hIs6eoyE+udWSTAMuD4fE4Xr3fWwQkrOWVYezZakenL6DPk/tgQK6WY9jy8DUOsvwyip
         0h76/OVsC/AXC2GbRTTriEsw2kVUfb/Gwx2QBIt2nntytT0+vZvNlZTSEqCDUdNlkYq7
         tRCA==
X-Forwarded-Encrypted: i=1; AHgh+RrnT7i+GCXI2d+EOCCDevqSLxnKWSKxJsbXWH8LmDObEKsO2e/SNXW0C+6iYxQA6L/jA828plk64VfmLyRY46U9@lists.infradead.org
X-Gm-Message-State: AOJu0YxYvUyWgJmiorvYBTZnTuOnoVW8O/tp683/VXsXKT2XdQBAeN6q
	JvWY1YEVPjhVs7uaERU8U7g7r4Q8tIW/2simqTAN6AT+3m9WNEyjKzr5TTG4C1FRbV/d1r7A81u
	7Q4y9B0CfsMeAn5Hhx0/NVznTmcm4Y2w=
X-Gm-Gg: AR+sD132L1c0Tegj94f67TykDFwf8No5eirwSh80E2l4To93jWyJTTyeBvDoCUhWa6v
	O7UZE5soHFhSBXHKvigPs72oxzPtt6DshejqUXDI+SKnnG+OqkvDhzYWZGHMQnR7HlDCl6TLnLW
	VTYgNwSmw0SaqBjoBwC2kr4VIcee6wUqKKelC1cyxjsbGzVsaw7NxScc7tQ5HfqQjin9pj0OkTP
	iLqsxdBUTF7Cy+AtVYJ+3jQ5aolS4u04fCDqRS9x62wZ8vjErA9sp8B8+OSKtdfkPNI737HdZD4
	JTnwq42TEZoXGOX5xx/zKpxuY1f6hbz+hwiT288x8d6EyGOvtJys4w==
X-Received: by 2002:a05:6402:1f86:b0:6a0:19c8:f9c0 with SMTP id
 4fb4d7f45d1cf-6a381bd91aamr837533a12.4.1786610448674; Thu, 13 Aug 2026
 01:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com> <20260812-refreshing-rampant-gecko-b38ef9@quoll>
 <CAPwA33KM-sWkPVrP1h+swLinvrCZHzxPeS7h25KEO87Q_6WZuA@mail.gmail.com>
 <an0FMnDSWbud8hPc@venus> <CAPwA33+7k7HMC7ezwH+MGn64iRHT6tVNK55t6gaC0nkkqWoE4w@mail.gmail.com>
 <20260813-imposing-cunning-raven-fcad40@quoll>
In-Reply-To: <20260813-imposing-cunning-raven-fcad40@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Thu, 13 Aug 2026 16:40:37 +0800
X-Gm-Features: AUfX_mye9jktuvnjIqJR--jOE-SjnI1mJ-tyZFHa_AmY4WZ5Toj9QFewcV4UoB8
Message-ID: <CAPwA33L-x=H+FU6-c9A8uKqhKbsfxcAJaaG49rUfnjvWk0f5mA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_014051_457535_61AE9C9D 
X-CRM114-Status: GOOD (  26.17  )
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

I am sorry about this. Since It's my first time to commit patch to the
kernel, I want to make sure my code and reply is correct,
so I actually paste my reply to AI before I send, let AI to rewrite my
words. I will fix my approach, and make sure V4 and afterward work
is worth to review.

Best regards,
Jason

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=8813=
=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:59=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, Aug 13, 2026 at 12:33:52PM +0800, =E6=A5=8A=E6=99=BA=E6=88=90 wro=
te:
> > Hi Sebastian,
> >
> > Thanks for the review.
> >
> > > Your new binding is lacking too. If you select <&mipidcphy0 PHY_TYPE_=
CSI>
> > > you defined the direction of the PHY, but will it operate in C-PHY or=
 in
> > > D-PHY mode?
> >
> > You are right, and I am sorry - this is a regression I introduced in v3=
.
> >
> > v2 already described these as two separate cells: the first selected th=
e
> > electrical layer, and the second selected the direction. Michael Riesch
> > suggested using the generic PHY_TYPE_DSI/PHY_TYPE_CSI constants for the
> > second cell instead of the Rockchip-private RK_DCPHY_DIR_* constants [1=
],
> > and Vinod Koul agreed [2].
> >
> > In v3, while making that change, I also mistakenly collapsed the two ce=
lls
> > into one. That is what lost the electrical-layer information you pointe=
d
> > out.
> >
> > For v4, I will go back to the v2 layout and only rename the second cell=
.
> > This keeps the two dimensions separate, with each cell describing one
> > thing:
> >
> > /* MIPI DSI host - the transmitter */
> > phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;
> >
> > /* MIPI CSI-2 host - the receiver */
> > phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;
> >
> > The same applies to C-PHY, so the binding can express all four combinat=
ions
> > without any further changes:
> >
> > phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_DSI>;
> > phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_CSI>;
> >
> > The driver accepts all four combinations at phy_get() time and returns
> > -EOPNOTSUPP from power_on() for the C-PHY combinations, as it did befor=
e
> > this series. Boards that only wire up the transmitter keep
> > '#phy-cells =3D <1>', so the existing in-tree device trees remain unaff=
ected.
> >
> > Before sending v4, I will go through the code and commit messages again=
,
> > so that the reasoning above is captured in the commits themselves rathe=
r
> > than only in this thread. I will also re-test the series on the board.
>
> What is with this practice (third posting I see this week) of pasting
> as reply prompts/tasks for AI?
>
> All this is just wrong approach and your patches will be ignored if you
> act as a proxy and keep playing with us that way.
>
> Best regards,
> Krzysztof
>

