Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B640AE6B26C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF2+2OBqACOiCo6iSElhd5mEow7KLbkSPjlb63HoSsQ=; b=UyHIBKKQeJbSnJEGS5MrpYQEaa
	wSC07f21qZSu6GxXoiYwyqD2dJYmLcLw1bl13Y09LVcX7WsB2zKIgqKwgpV7jVckL17P9/+dVz+ti
	zvcGl2dmi8AOc0cFKcPh6uJmejW32XsAWCWN93R58JLemakTjQuZU6/GKFkF92BHh82vizqI4Qyke
	we55hfhgXsdeG8cQ0+9Ii7O5xAdoC6pMLE+Hx0ujYWCC3Zsfj2oHSxkHWu6VBmv9y58Dhuc2ot1Yt
	a7imFJjdVN/2joo1exefHxBQnPRcwFcrmvHDXZJt/WqvDsxxrfhNPvIJ/UxZHCWdVztpiB/x1c76N
	HJFhwdew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXrWX-0000000EOmP-3W4V;
	Tue, 23 Dec 2025 01:49:17 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXrWU-0000000EOm2-2uZC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:49:16 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-559748bcf99so4015471e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 17:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766454553; x=1767059353; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF2+2OBqACOiCo6iSElhd5mEow7KLbkSPjlb63HoSsQ=;
        b=HCoMrFRDVnGU1kszV6BH8r3XGBgog4MAppq4jqOEbQSK3tIIYPoMKJR9VEEMc6czWE
         E7ZGMRLlWaJHjNwIIBdd39djpA/mYKDmO1sRxKML0v8Qi5qiruvyg0pvZ0GNECERry/O
         j6m39tRd0u8u7R3/hga39LIFoDeDyhVNXd+Y4MBLrvvHryXggxNhsbysMgzE7qeaLrqd
         rT9iNDb0U0cpbGUdWwYeUTdDCbGpOxvFCquvuRgucF+tScTE9vrZ2Xba7bk87hU1cUPI
         VxsI6KW4ptILO/BTe6+s6gniLJKJQWIRSrFgFP2Lato+Fglrr691yUtTsHru5K1wwJoE
         nq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766454553; x=1767059353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YF2+2OBqACOiCo6iSElhd5mEow7KLbkSPjlb63HoSsQ=;
        b=OzMZRPc7SUUtOxzMn6k49PFli0wP38XMnURsUeOyhLoolTKhaY56sgG57OG+P/LJFX
         j+jRYiJsW9YuXbuvHTV5D5EaLqi5j3vUaFMIgUa0G1+kuLRZUw8V+AInFqo+K7EPNjqP
         6GCl5UTRizibyliJYc57IxiaslYQnSczo+PHbFWVRwOTjjebJElfjQmXHJz8jHi33MkD
         GZ2J4KCxQaQI7MkL29ktCgw+9zQx5M37k3ramAbSnPmi74rQVeeT5wM9u6UtN3wfr8vV
         5Ciu8ZaY3WLf47s5U7nqkaRgXaXLtD4Fd6CzNGUanSY+rBr+SXoYd9dGpRRkSpyhzxNw
         lm8A==
X-Forwarded-Encrypted: i=1; AJvYcCWprpZoihQR6TBR3j0AUFNpdPVa0nfJ7yPIoLd5dG1GbeOf7GAa1si/u40NP+7DEp0u1aACdaCGSdxRydT2/ZEL@lists.infradead.org
X-Gm-Message-State: AOJu0YwpcHI2gyd+tgwrdg2Dd0AqZO5jr7B/HuS0l7ANdhATTWCU03jX
	z6yTYkvkxT3fzj34wogF2VLcVnfWCxZ35EdQzkvBNSPH10HD1/5CM3zxpIj1e5ORCfivVZCgqnV
	lB8uIYiJpphbnyg1ln6kchyWnPtVQN6U=
X-Gm-Gg: AY/fxX5LHTF+2MLmwzctq27Sr6GNbhQnxxuzcmgP1HMAf2o0WLmxZNUbkWEIimNdaTc
	Hpsf0yFo6/cmXcEQljTQR1FThqYF+8U9Ag8gZvBHSM2Zc+VAxjCNNfL3ymxSrsTa+bifWMvUWXr
	JqOiIvJGuiFeGtnh6pCeaJugHQ7QKyd6ebmF2jLZl2HlOXqxWkY2u3kFTgTqqv34yFayzOa2H/i
	2JgNfWJS28Q6D7VkrDbaDxfFhTTBv9hSHzJVqadQIAsscozwHlt1spYCH/VBr9578ixrGii
X-Google-Smtp-Source: AGHT+IHBHq5niwB64zOQi9Ir1RYdcuhYIiAiMknQ60wGRGAecKNEstEn4F6joAjyRSSk+aJXifaYWR8qfB82RD9k+ME=
X-Received: by 2002:a05:6122:318f:b0:559:83be:69c5 with SMTP id
 71dfb90a1353d-5615be07d05mr3706682e0c.10.1766454553289; Mon, 22 Dec 2025
 17:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
 <20251222-ventura2_initial_dts-v1-2-1f06166c78a3@gmail.com> <c069b452-df22-4afa-bf6a-c48949f40ebc@lunn.ch>
In-Reply-To: <c069b452-df22-4afa-bf6a-c48949f40ebc@lunn.ch>
From: =?UTF-8?B?6Kyd5pS/5ZCJ?= <kylehsieh1995@gmail.com>
Date: Tue, 23 Dec 2025 09:49:02 +0800
X-Gm-Features: AQt7F2p2os6FavK-DkfJbJKZMaXhN9nltNSiU8Gza--K1TKLdY1MJx6HBIjggPA
Message-ID: <CAF7HswN_jEXOU_9K4LpLnbhvd+RD0qqELAHxMBbp=hGtMjS4kQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_174914_741235_ACBCE15D 
X-CRM114-Status: GOOD (  15.86  )
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

On Mon, Dec 22, 2025 at 5:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&mdio0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&mac2 {
> > +     status =3D "okay";
> > +     phy-mode =3D "rmii";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rmii3_default>;
> > +     fixed-link {
> > +             speed =3D <100>;
> > +             full-duplex;
> > +     };
> > +};
>
> That is an odd combination. You enable the MDIO bus, but don't have
> any PHYs on it, no phandles pointing to it. And you have this
> fixed-link. It makes me think you have an Ethernet switch on the bus,
> and this connects to it?
Thanks for the clarification.
Yes, there is an Ethernet switch in the design.
The MAC is connected to the switch via RMII using a fixed-link
configuration.
However, the MDIO bus is not connected to the switch and is not
used on this board. Enabling the MDIO controller in the DTS was
a mistake on my side.
I will fix this in the next revision by disabling the unused MDIO
node, while keeping the fixed-link RMII connection to the switch.
>
>     Andrew

