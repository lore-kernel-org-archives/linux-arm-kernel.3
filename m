Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0651CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 02:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k91NTUDhUssUji9MJhdmtkiC7VaqJjlsTCOYLX42i1g=; b=k9BIM5BuEfXOEv
	Xnq/3BaoSg7aQBlhcr0bETIs3GA0IHJOOfgTVtKI5NyoSK98NBfMCULDBhzURsakAawO2D/3Gm/Cw
	2VD2m+5+QkdEMRo1fd70f+E6TIUCvE6KyhZMfaXbBPIjRWaIofnSp3MmnyBmod9Q/zfwrQuQHnlbt
	JswGFfDnhQx4rhxZn4wBiCyICGS+n8YT646b1Q8GaLTBzx8G1KCTvIlfDf87qn0HLlKNHtKV2CLRw
	NWSkjUqdXD2JG4ycfCelPDogZJ+8hgaOMef7HZ+hF7+LEr2lYBE+jsB/JdVSDvS8C0edGjMCzBYZd
	VSiCfC/JXa0NrBnsTFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3mpN-00000006azt-2tFY;
	Wed, 01 Oct 2025 02:44:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3mpL-00000006azV-1llp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 02:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72B3844A81
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Oct 2025 02:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479ADC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Oct 2025 02:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759286662;
	bh=k91NTUDhUssUji9MJhdmtkiC7VaqJjlsTCOYLX42i1g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ttRgAU+re1QfOgTUsJYEGBkaY5sJkurfUuoKPafm22hee4mBvUsfCz8+lnPzgv8d4
	 ZOdgnV8fba3mPfHIywenzEHUDYZIP6vODhYrMcHJhSLdDPE2HjSFGBcgL9m1yi7LmE
	 W7n+1yOtllzOEImsPbhBak+kD93G4zlgR7UkMNidvOgQcMplPmuKroueK3CHorgKyn
	 CtjDLwmqqEmAxVu1+9/A4A9BrY1j+7n9xbmw+OyXSKiMcP4Dv6vu7kN9MibVjJsSje
	 TSyEQyAq1nHm7QtDoRmOMwnpTAefVibRt4KoP7xFveey6CHlXTPwpNO4u0bMThDA1S
	 sTMaZgwlFjwDA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-36453927ffaso62109751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 19:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULtnJQZMxeOc3w2PdxVBsRHIQnAHjYiTHIM93/DxS05uyH3lQqsXILAGiThEoXWzzNKAo9fi1xNp4VwSiBVJX/@lists.infradead.org
X-Gm-Message-State: AOJu0YzN3WtATMpNapJM2g1n75N5WAUagvaFVvqq1v19Ft3mNewThnYp
	hwio3rW2zTJqhz7AiyCwwD+8Wt2LqOUEBji63mEHarZWkci4tr6Ake/E0SFp2s/PvhlCwN+Ji5h
	8IEC+RR29SDfgR7y82p89M0PIBjX+MB4=
X-Google-Smtp-Source: AGHT+IFQFAiOMKqVsvDwjwivvtKNdu8wmiPuFmG09MeyicmCKH2vmN2UpLtpz/sWXcpxHK2OBBrDx4wW/jvYc7IHYT4=
X-Received: by 2002:a2e:b8c6:0:b0:364:45a:5159 with SMTP id
 38308e7fff4ca-373a745e30fmr5133711fa.30.1759286660527; Tue, 30 Sep 2025
 19:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250925191600.3306595-1-wens@kernel.org> <20250925191600.3306595-3-wens@kernel.org>
 <20250929180804.3bd18dd9@kernel.org> <20250930172022.3a6dd03e@kernel.org>
In-Reply-To: <20250930172022.3a6dd03e@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 1 Oct 2025 10:44:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v66AKNyV0YegdnZPOV+bh6dNU9ecmtKRqw4HnBO+ZCrBDA@mail.gmail.com>
X-Gm-Features: AS18NWA7fKCmJOgwyIEYi5Cp05qNoNNJdcUopK8PxdgcLYDSihGbZiKbNoeO0vw
Message-ID: <CAGb2v66AKNyV0YegdnZPOV+bh6dNU9ecmtKRqw4HnBO+ZCrBDA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/2] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: Jakub Kicinski <kuba@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_194423_500707_55021CFC 
X-CRM114-Status: GOOD (  21.30  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Oct 1, 2025 at 8:20=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon, 29 Sep 2025 18:08:04 -0700 Jakub Kicinski wrote:
> > On Fri, 26 Sep 2025 03:15:59 +0800 Chen-Yu Tsai wrote:
> > > The Allwinner A523 SoC family has a second Ethernet controller, calle=
d
> > > the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 f=
or
> > > numbering. This controller, according to BSP sources, is fully
> > > compatible with a slightly newer version of the Synopsys DWMAC core.
> > > The glue layer around the controller is the same as found around olde=
r
> > > DWMAC cores on Allwinner SoCs. The only slight difference is that sin=
ce
> > > this is the second controller on the SoC, the register for the clock
> > > delay controls is at a different offset. Last, the integration includ=
es
> > > a dedicated clock gate for the memory bus and the whole thing is put =
in
> > > a separately controllable power domain.
> >
> > Hi Andrew, does this look good ?
> >
> > thread: https://lore.kernel.org/20250925191600.3306595-3-wens@kernel.or=
g
>
> Adding Heiner and Russell, in case Andrew is AFK.
>
> We need an ack from PHY maintainers, the patch seems to be setting
> delays regardless of the exact RMII mode. I don't know these things..

AFAIK the delays only apply to the RGMII signal path, i.e. they are no-op
for RMII. Also, the delays are unrelated to the 2ns delay required by RGMII=
.
These delays are more for tweaking minute signal length differences.

ChenYu

