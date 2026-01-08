Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF95D148AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHCQRjVPh84PufW5VGwtzkWEtebIWEjYRwJnRvd9028=; b=auIYTsmDD5p8qrMh4lufJpsnky
	fQdxdcDiBYFCwA6MgK9hNxmkqmYwnaQ+gq7eZ37xqlwB8aWBOryvjGdgHLxHblxHp6YEZdZl+c46F
	Vvgpk+PJgrX7g6a+DNHpA/VM27GRs0F2dNvVnQ151zdmRilyfy9I9ESVj+LjhRNLTzIt4YOufitBZ
	Ae3DDSCQiiX2vuafzFGyWbC6i9fApxxHJsA8O90yRVxyWeq1/uPiW8bc4aM3qNo+KTATmUL0UOtXP
	CFcnqLUrpyREAFENZA835vISHo90tZxsoLd7r6u/nmnwIu18HH55XLdHPgvFOSXlYgHvC5wtbUX8O
	nCUiLp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjtm-0000000G1t0-2Brc;
	Thu, 08 Jan 2026 06:53:34 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjtf-0000000G1ru-2dJ9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 06:53:31 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ed7024c8c5so23125521cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 22:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855206; x=1768460006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHCQRjVPh84PufW5VGwtzkWEtebIWEjYRwJnRvd9028=;
        b=I3yDG7FT2GR5bFItryxxijj7nj8b92TZ3mR70jDuq+Lb3KRdtKA9ug0FEwDssQLNG5
         lTwtOsYmJMKqcNekFeFszcFn3Cbf2lmXzZIZ+VH3lyIcJkIeyiislz8AbLn4UfNOLbhH
         uWFCxPqEqGW+fn7Z+rnMPLj9CuUG2BOQJtOWu4jr7LMgA2wd9bTm72+lKM23IdGEMao8
         H0wwnWIwocXdwjbpLc7OCzCmkh8HMCiR19I8vYTu8zXP22RaAPBiw6lZ0RLI3eqmRDzy
         pU7/BTvXRwAKb5EcTENQ5Weawq2Gk4SRRSkAJbmMWnwBjcqabboi2kGUagjkZuI26sgs
         G4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855206; x=1768460006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHCQRjVPh84PufW5VGwtzkWEtebIWEjYRwJnRvd9028=;
        b=sqOe1tljzvnoD2kqmNlN9alKCs8uZlb0fbTAf8ZXdB2a9OcBH9EBYua7kVRv48MO9n
         DTUZ6+/oatUtPl9fnOkaodak8w050eBFyp8uH38QIuAutm/hZ3c8S5gO8q+lMyukrTu6
         GqsPIRgbs+DZcsKJNboIDLg5ZC8wgulwEknatlMwRd9PrKmhMOD07A4PH4xbp9D82mLg
         AmcWum12ZghhLtHxE2XzJvYAm++/D54XXIkrvXZGSpXMCSMCguOmtn/uGUOfzBoE00gR
         721KJd7o3lWFxg4FWyusVFewIA4KMmKM/dOURvulNYWZroEzSBchjtsrvIcyjKPJymxg
         JKtA==
X-Forwarded-Encrypted: i=1; AJvYcCXyK0ytHz9jqFNvWyo0Ja7Nkrw1vwyvZXd6e06C2kgVhFEjbMIHdksMTfpOk/YPQ4qjr3MtOzzphkrf4XkQFLpN@lists.infradead.org
X-Gm-Message-State: AOJu0YyvIIRZu+YLZE5n9ovjkRXnXGQJOgGE2r4xpqy4clLNRkZJOgfq
	dGijKpCO37xCSOAmUIUD9xMab0Ha7Yzmu9yLg/nrxynK520pe2tADhwqx3PRPzr15kAdaAL2sNI
	16HdtmuhyalEnFSs8hJWBdEoFoTIubbY=
X-Gm-Gg: AY/fxX5akigGUTKDvz8tQvIQBwdLca6X2+tY8e6C9PAGLc4ccBevi5iVoXWkTMmhi2a
	FZcNYqqTqBQCPViTWfIcJ5XyQXUVOANqUcWhCvbG/BrRMN5mo66V46Mm8tgcNX/Q0/nkTSscsLg
	awyJLU5dT8Ex7VbVJfjulLu9/W5JpA8XenV3tHh+Iu5E2jQfHxCV9yjJi/lGS9+EXha+7W0sAPs
	U6NpKK4po41klL5kbKbhCvCcQ3/f4xroB14oS0zp+e80LTvWCoHvM18q7Km+qZVDUhJ+7ZyXB+k
	I0Qrzsrzb6B+MzCXmDECJVQErGs5
X-Google-Smtp-Source: AGHT+IH9Vd164+NcSWABSb3y/jceDxJ9EiANBARK7BIcO0sQPRDFs0KTPHhEmnLU/L5aReuZRIUNPeoHClh200T9PK0=
X-Received: by 2002:a05:622a:8cc:b0:4f1:b742:35c2 with SMTP id
 d75a77b69052e-4ffb490faa7mr73309911cf.22.1767855206267; Wed, 07 Jan 2026
 22:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20260107070322.323-1-kernel@airkyi.com> <20260107070322.323-3-kernel@airkyi.com>
 <b5a3470c-aa03-42d0-a575-b705f709f8e6@lunn.ch>
In-Reply-To: <b5a3470c-aa03-42d0-a575-b705f709f8e6@lunn.ch>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 8 Jan 2026 10:53:17 +0400
X-Gm-Features: AQt7F2oeNi9V8CLPU1jzf6Yw7puNDXDoA7a6GK6Ngj9I0de-SnfdObpeo7UYQ3o
Message-ID: <CABjd4YzsjZXe16XWgrHRG5shNA_DQJF45i1roahvfAfV4xdU0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Jonas Karlman <jonas@kwiboo.se>, John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Yan <andy.yan@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_225328_252910_B239BE10 
X-CRM114-Status: GOOD (  12.57  )
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

On Wed, Jan 7, 2026 at 10:18=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&gmac0 {
> > +     clock_in_out =3D "output";
> > +     phy-mode =3D "rgmii-rxid";
>
> rgmii-rxid is odd. Does the PCB really have an extra long TX clock
> line, but a short RX clock line?
>
> Try changing this to rgmii-id, and drop the tx_delay property.

Actually it would be great if Rockchip could clarify the delay
duration introduced by a single delay element in GMAC-IOMUX delay
lines, which are controlled in the GMAC driver by the {tx,rx}_delay
properties. Maybe we could then switch to using
{tx,rx}_internal_delay_ps for fine-tuning the delays on the GMAC side
as envisaged in DT bindings [1], and use phy-mode =3D "rgmii-id"
throughout. Chaoyi, any chance you could ask around in your hardware
team?

Currently though removing the delays at GMAC side altogether causes
unstable link operation - see [2] for example.

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/net/ethernet-controller.yaml#L342-L347
[2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/=
commit/372f3e9ae62cc62cdf2543391ea57be6bb548a0c

Best regards,
Alexey

