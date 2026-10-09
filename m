Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF20CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 05:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHcCOJlfDk2kf/nYjNk1wm3um6Oe/oxI7EYgEHDQ21E=; b=PVws0iNPL/eB/F
	DtQqWbczwkMDZ42f1PKF8k6DXEYkOsPNI2OCq4H2/j3sE/5+uq14xvjWTZGx60+ouP7JjO6GCWxhz
	bmAAPj+0gQ72HGUcgWCq9ll+F0Fcp+XsNVFAfbggNdsVTi8qkRYEmdGDZpmnC9G5h0MRekf2na4Um
	GjuKvAvWzPnWIG45/dP4FOkdV/g1yaiHLhWY5ZAUt6WFlUEFMZOJsZfu9M7PitjWKm7cR1wXMKAxs
	YaotMTPRruq5M/WYzSW2ksdMEEp4xu0PIMlCClcPUYI0owOkhVBZ3MHX3haBxyLGIMeJpUdYX7q6A
	Zo6qoG4m7NF+MItXjRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3ce-00000005Zbz-3eR8;
	Fri, 09 Oct 2026 05:58:24 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3cb-00000005ZbY-3TyI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 05:58:23 +0000
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53504882980so53756531cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 22:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525500; x=1792130300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHcCOJlfDk2kf/nYjNk1wm3um6Oe/oxI7EYgEHDQ21E=;
        b=BbsnSrr3Z3sstPRjMjq7j+LfLRLEqQRKv1rUTgZOBdqn9C/Mll9uu/IB8lmnx5dk77
         LaBMbpNf3TkKl0uFbWIADr+oDn1+x9UFgQ+cAE7sbkzOSBta4Qh6/AHFwAI2CY1GZ7Rl
         oKhPDkwvVyUKabDin2JwDIKPG0BAAQj7gy8uzD/AyMNksirPX7Xg6JtOsVfy6ZIhZE66
         E521LeUDx9bj1zRJQF8lK4WFIYjxGgG7NQF+Ngxi0D7Y9IJrnrYAzYQo/cY7m9Rykcpa
         DSoz+cdZtKlxba/GzyqovVeobkx4mwQrfRhAqDT0fgTReIixbasH+Q0rtG/q5H2mWX1R
         4KCg==
X-Forwarded-Encrypted: i=1; AKwUvBwc5WaIRdltmikJCPylflBuZUyzUb2qlnJAnWUBGXGxnc/wZaKZTmv+yiJVS+qwa5LqUuuFepZYoCp+7SlT3stU@lists.infradead.org
X-Gm-Message-State: AFuF++mpbLUfJ0QcQO9U1x29wLbrjPpysGqNTAn+auQxhCkd8gJz1wSk
	BAG4oXZw4JNs/dhrI4/Y04htbubV0xOdX2BJ9eLnwDtgg70AW/7mYOvUwOxhTbd/cfo=
X-Gm-Gg: AYBFou0zHj5yKxKURA5S645RCAVTcZmYVip73mk8c7Wt8LYnc88Sdlnl+B2eN8iEGr+
	yM3rD2HgAkMSgZoT2sB4KdlJ00XeVBlsicthSDiB1KrGrwavxvBjAb4TFss+JdLO5l1uuzFtRka
	0lmnguSwgFXWjQrUPELZpBE2LBBZgHYDY2iLfzN1iug1F+lkW07tEsj/1i70wHIOsyR4I2z8J11
	r7l5BYwCVjKgp8J799yC7gFGNCwq4P5LkgrrCrPFD1rQthnLJD4YY5pZRMY8MNe9M1kxeAd2QNz
	O4vgiVZc/kucUhjVGcYz4cRL54TPX06JvKgA35rYwGwvC9Cd+umjvz+fZ6DdYb5ju/6XwfbHzIA
	Hjj1QqpkEcyJMl3lo95NDfzsFXysyy/hB5Ux1q6Av4Dpdd5pBxuKg4LeDXWi/7ewJ32CCVGa3Em
	KsIUPvOXFP4mj+xu5p7+yVpfGcTz/k9pAIT4FobF7/YcRgaDDkr4+ndlztl6cj/cl3dSDBDEfGI
	UNPeVzKWOzXmI7ltZEoSWmKFe8RZdbJc8dj2yVYrmSRGLlSJDQOjV/fPPLS41lGzP4=
X-Received: by 2002:a05:622a:2445:b0:535:a5f7:d58c with SMTP id d75a77b69052e-535a5f7ddb2mr1289221cf.70.1791525500463;
        Thu, 08 Oct 2026 22:58:20 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7324c9sm11380751cf.12.2026.10.08.22.58.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 22:58:20 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53504882980so53756301cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 22:58:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZgKQDXj6SUel1jhfKTW6rRPi93hy/ctAZ4S9ixPtq6h2u+fqDjQFwK2Ty6EmDDtlSkHm2jjnk5KTJVVS5IgMl@lists.infradead.org
X-Received: by 2002:a05:690c:e:b0:88f:62ba:512b with SMTP id
 00721157ae682-8b07ee3297amr3678357b3.42.1791525154408; Thu, 08 Oct 2026
 22:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <20261007082627.63807-7-tanure@linux.com>
 <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
In-Reply-To: <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 06:52:22 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+1BZky6KUtqZKm7q8bDfWKV47xSZtK31qdYBWx_e3uwdQ@mail.gmail.com>
X-Gm-Features: AclHuK9uJycl8wPMvbL9js8yfzmf_wvwEi-NV4Dy7HnHzbbgfaJpxaRVEvgynGU
Message-ID: <CAJX_Q+1BZky6KUtqZKm7q8bDfWKV47xSZtK31qdYBWx_e3uwdQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_225822_055779_8CDE43CA 
X-CRM114-Status: GOOD (  18.98  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Oct 7, 2026 at 2:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Oct 07, 2026 at 09:26:26AM +0100, Lucas Tanure wrote:
> > The SoC has a Synopsys gigabit MAC, a block of glue registers that
> > selects the interface type and trims the clock timing, and a
> > multiplexer that points the management bus at the on-chip 100M PHY
>
>
> > +                                     internal_ephy: ethernet-phy@8 {
> > +                                             compatible =3D "ethernet-=
phy-id0180.3301",
> > +                                                          "ethernet-ph=
y-ieee802.3-c22";
> > +                                             interrupts =3D <GIC_SPI 3=
40 IRQ_TYPE_LEVEL_HIGH>;
> > +                                             reg =3D <8>;
> > +                                             max-speed =3D <100>;
>
> It is a 100M PHY. What supported speeds does it report in its
> registers?
I cannot read them. On the VIM4 the MDIO mux points at the external
PHY and the internal one never probes, and no board in tree uses it.

The line was copied from meson-g12-common.dtsi, which has the same
max-speed =3D <100> on the same PHY ID. Dropped in v3.
>
> You should only need max-speed when the PHY is broken, says it can do
> more than it actually can do, or when a 1G PHY only has two of the
> four pairs connected to the outside world etc.
>
>         Andrew

