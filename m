Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55CDD3B982
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 22:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iTM1jJlu2UuL9uPyqPKM3hRmqrljCMk5Kax+Fk3Csc=; b=uEqqjSfjle75pCYnLhRL6LkG74
	DGEeMMBE9oXPd80HkTtIwpjnfo3SJDhzcwRRPX7PEG0Za3695qzR4D5E1vrPabfaErm9fL6DLDV+S
	5s9+6+6yzMqbOwET71cpDF9lb9BtZu/GNWuD5wg0B7MI/y8z+ed3LaMhjUZJgWw5b/a6+op45e0Xa
	IgHpQpL8bpmsqa4Fn+Pn+yV0tQK4bX4e7VmJJIolazqbhTZSP36/iEgVgAKd2Ed+CiG2ggLfCENFN
	r5kVlKAVBnM2TsUDU53YtOQgWlshBwiZxEv/cZoZ1j4Klyp6puCL3X01EHOz5vNrbLiAubjw6Jmc8
	EZwScT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6Mi-0000000EsA7-2MBS;
	Tue, 09 Dec 2025 22:39:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6Mf-0000000Es9h-3hEt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 22:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0762F6017F
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Dec 2025 22:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C06C19421
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Dec 2025 22:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765319964;
	bh=/iTM1jJlu2UuL9uPyqPKM3hRmqrljCMk5Kax+Fk3Csc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P1XSvevLH+LAGfJ+NNt8jsWuhl7jCNbwHUN6ZrOiNNS02BX2fz0OdYFqAnJsUF+Kq
	 6LECNtVta3R1EG1eGCx3G8H29PnFFarfb3LIUdn8q9911wtbs1xsW6GTdi6DfyutdU
	 6ImzBIwLlYPSpSG4m66+dxS/01+DEY0/FmfyeyEiuRFgCchOv4QtEPVOaYUoku3vHS
	 5pQPhIEmdExF+iR5O9KS0G/Kf9iYQPjw7iR7KNssbwEIIYU7s9CHOAdk/K5SF0wyyB
	 qp6maRIJ2IpI2IZzqOAj/1IntdF5RPQeA9TlJUBokJXtSoGpQLCq6qyP2mCNhKJ/86
	 V8uY+y+srVeyg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7277324054so918360866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 14:39:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbbGlLOp6Mhcm7r2tFP83VtQgS9G7jMG+THM87vOK2wtWfojC03nb5BoX9ESQf2Kc5TgNTSpfvmzJAcQXWR/Va@lists.infradead.org
X-Gm-Message-State: AOJu0YyaS1tyC2Hoyj8j1Bw8/zg/IZpJRaxPcvB5qzp1oG6YPdkjTcgk
	g72whn8pB9hcdGxKqXqN0RWQOTZVf3NbRSl5S0UZJfJ5j3UMZrrSr7Kd+WqwS4W0eKfiM3yYk8/
	/cguQJt4g6+s35QnUJdm8hyaRwJoVBg==
X-Google-Smtp-Source: AGHT+IGLCH2P+FlmKcufeRRw22NRHRGtlBZRFMM6bDtNw17e/djrmNK9KZ5LhnrWo2I5IjTlQrfxsgzx1701NlakcLI=
X-Received: by 2002:a17:907:2dac:b0:b73:78f3:15b3 with SMTP id
 a640c23a62f3a-b7ce8404f0dmr26213566b.47.1765319963285; Tue, 09 Dec 2025
 14:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
 <20251120-at91-probe-v2-2-8c8592f02e8e@kernel.org> <ece2d53c-3e16-4e5e-9bb9-3ed7bb362b7b@tuxon.dev>
In-Reply-To: <ece2d53c-3e16-4e5e-9bb9-3ed7bb362b7b@tuxon.dev>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Dec 2025 16:39:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ2ghfNKQPhs19F1oxJxyTsrQ47hgPwsa3hUmgbGjpi-A@mail.gmail.com>
X-Gm-Features: AQt7F2pTpyBlT1NDJToDU8xphT7m7aRHUZpyAo2rSEBV3njKup08Munn-uLDhbE
Message-ID: <CAL_JsqJ2ghfNKQPhs19F1oxJxyTsrQ47hgPwsa3hUmgbGjpi-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: at91: Move PM init functions to .init_late hook
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Nov 22, 2025 at 9:37=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
> Hi, Rob,
>
> On 11/20/25 23:37, Rob Herring wrote:
> > Move the AT91 PM init functions to .init_late hook to ensure driver
> > dependencies have probed.
> >
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> 'From: Rob Herring <robh@kernel.org>' !=3D 'Signed-off-by: Rob Herring (A=
rm)
> <robh@kernel.org>

Before I respin, any feedback on whether this series actually works or not?

Rob

