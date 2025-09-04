Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD03CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAUp29zeM6Eea+iEGcle/fQhECh+9aNVpzcpnyZ4uZ4=; b=pb+37B3OM0Rqce1soc6zC/fW+L
	Qe1f2LBhM+ov5rokZt+cYpRnAU14b5ojb+y07BTOrrhXQV2baOMNV31k53OYKnKoEu2zYlvBor0PE
	8iGhZijEGsy2NA1D9e90FYkkMyjiPIs3X38fZn4on+J53T9xWp4YtsUlK4EEQIF3yoStlgfIqdt8N
	qtEgvn6ujZ4pZtxbFLaOtsgbNY7qHux7xLQDt+5VKB33iXbanGX1al/BM1NLy+zni4ioc+SMFWnWM
	ovyI+5cI6FyudAOhzCWG8AJb2Y5WsFtr45YlyfQgAWesOiu36mZXXWf/8Fo/xrErF7IoOluIowj8O
	sVuGv0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM3q-0000000G2n9-1uOY;
	Fri, 05 Sep 2025 02:20:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHET-0000000EU8U-05Xz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:11:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so1116586f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757020259; x=1757625059; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAUp29zeM6Eea+iEGcle/fQhECh+9aNVpzcpnyZ4uZ4=;
        b=ajxWvkESFjVJmjuIiz9gf0+laVFL940Qe7o5DgoAoJ4+jgfEkQMyzmDAkz6+NSyN4G
         KRceqIxgQHt18xlnsWg4PNpUCq7bVviaqdOV5vWjpab6O+B94tWHSot6aCyKER9o+tCy
         va61aAGtJxdmtyZiwyYGgQbX4JuRXqCaeN9x4/GKrGTgIzOSuYU+t+NHh63fQLd5YlUi
         oDqNMTcD7qtx1GyfOp7hVk7DHPabO6GVucodId5qhrOQxYhGzDReI68Ea7HEFqoJIn3o
         eclEjRePMCf1xyCWsj3bCYvqq2j8umVN+LUKtrIQTP4vpOckliPHcyMjA1Y38lTDWehn
         FLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757020259; x=1757625059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAUp29zeM6Eea+iEGcle/fQhECh+9aNVpzcpnyZ4uZ4=;
        b=KRXrbynKyZhuYSTrPYnJhvtaK99KIcDTbHhuuM9n2eQHzIhXLZSIGmUdK7W7uGLuhe
         KYKD0oF2+K0Xj1kOZky2X03CuR/KBxTtKbYBC+2k0yn/EwqhyPAWyc1e6n3vUBGmqGB+
         5z4Nf8gdtDockqMlLMTArqNoz8ZqEukYRGqB9ea4wmfJCckfWojJC1hxYeH7rx+yxUUv
         fAcAC+425Fypq/arfCmiZ/jdvosI/B6BKhOC0ihIdG8YKQ5ES48L3dj48zCfmE+2sT1l
         8435/Radft2cmFP8pjwVstPPDZFElM8nopSIGjuwADH4VyKjiOhIQHnAlGvmCMEcP/y6
         rO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkGlZa9BO0INtIckFhypv+KBH7wUK5ZyyCLFHIXpurAVki5Tgub9ZZt6/s/L2lMxQilF6GKfvl3MaMott7q7Z1@lists.infradead.org
X-Gm-Message-State: AOJu0YwNmKYNe90jEVFc8h8fU8Zwx2s9spw/rZb/kDnwZS0SHyoW9hHR
	+MCE7GwF2+X1fuIsZR4Kb9cWJT1n6cvLVy51hp8LWleZMITyTAf2eIDqJ7cPOKPqAjN41Lo7eUy
	4MDlbEYHKUHLXOGxXcTWnNaew1IGyqJI=
X-Gm-Gg: ASbGncuzag5X5xsvZlzcX/D2ZeoM2+5THGFVYuohmYH4zSfNq8TQFXgvKYGrw6pLWb+
	eGyKLUCCihXDAY8Fq2zOT+911gotX5LLxD2AF1MVj0iPUxqa0XuxrKAo3dbO/hJi03MJ27kr1zP
	tHAzXPT4iXWlxdHUQ+qFoLoXkyuPrCgDKauXMGMgU7061OWtUOuLhiyL/+NGbHUBrH1hDvOKfd/
	ZVmH7fia+QcSq4YzzLT0Xkhz8kbDRpdHkBK1rno
X-Google-Smtp-Source: AGHT+IFl5pt+oDPr0Ohssl2A7YuW3oT77c4wgZ9dmvatNAp/vfqg8+n2yH7G5lllCD1SADyzzMeQZBHdc0g8MZ6xLVk=
X-Received: by 2002:a05:6000:2889:b0:3e3:f89:ea31 with SMTP id
 ffacd0b85a97d-3e30f89f5f4mr720584f8f.61.1757020259089; Thu, 04 Sep 2025
 14:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
In-Reply-To: <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Sep 2025 22:10:32 +0100
X-Gm-Features: Ac12FXzTh_QwLSBZNVL4Qmae4bCfLKKdSn-hnwmDHrHtfF7DVr842_KM4NBa2lw
Message-ID: <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] net: stmmac: dwmac-renesas-gbeth: Use OF
 data for configuration
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_141101_064642_A0D267F7 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Russell,

On Thu, Sep 4, 2025 at 9:49=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Sep 04, 2025 at 09:39:48PM +0100, Prabhakar wrote:
> >       plat_dat->init =3D renesas_gbeth_init;
> >       plat_dat->exit =3D renesas_gbeth_exit;
> > -     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > -                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > -                        STMMAC_FLAG_SPH_DISABLE;
> > +     plat_dat->flags |=3D gbeth->of_data->stmmac_flags;
>
> You include the first two flags in your new device. I would like to see
> at least STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP always being set. The only
> reason we have the STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is to avoid
> changing existing behaviour and causing regressions. New stuff should
> always set this.
>
Me confused, STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is set in the new
device [0]. The reason STMMAC_FLAG_SPH_DISABLE flag being dropped in
the new device is SPHEN=3D1 in MAC HW feature reg for the new device.

[0] https://lore.kernel.org/all/20250904203949.292066-4-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar

> If there is a reason not to have this set (e.g., PCS doesn't support
> it) then we need to make that a PCS property and extend phylink's EEE
> support. If there's something wrong in the setup that stmmac does for
> EEE, then I'd like to hear about it as well.
>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

