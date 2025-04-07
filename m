Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C4FC36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUuYsrCNZuom26Ku72dSBPeeyC8punlJl9ufLVLiqm4=; b=RiVnD/hp6yBu8P/CdnqyArpooV
	lYEApPgVXlB2LWuwbXrCjLME1aQCF0Z33sao+Epn0y+0KTHmTTYkjG1TpFR666FUxNNpCNdzG7feu
	D1O3Niyp5lTjVgFAM6Sv/bfK4hdMEiBMYaBza46Gm5vgGdeVcle4kdPTPFxUuWxb4divRadelwSJ1
	BRCwOfz41rOWrziPmZV/3kWckROZZ2zimpn9IQqyK2Iu5orrlpE/HnibiGQGY5XFVtJR5zmsvb6JX
	O8Awnq6bChtl39fo9zG7KZHLFokVOrHFl8MCIrdzHf7XWu7MbxOX5cnYvqiHfhlaf2nrv1EnEdePn
	iJ9b0xKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ra4-00000001g2s-2cBn;
	Mon, 07 Apr 2025 18:52:24 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qtM-00000001TIu-3GC8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:08:18 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-52413efd0d3so1999230e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049295; x=1744654095; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUuYsrCNZuom26Ku72dSBPeeyC8punlJl9ufLVLiqm4=;
        b=f+tc9fktgV94Hv5FOZ/GVgeVJ8M0YFzppBcv49zp9T4LPhPHmhSJGPRE5OM8p2o6kW
         VN+9igLXpZwq2gzU0cN25OwOhE+yw20eG4hcPU6vExfExAeoK++4Pk1SEs4kOurrg+RH
         imQQ5Z7MQsQqV7dloSV+y7LMkq+QuhPpIOlfBKsm6SJzeLU+3AGEBz7lD1OsjDG7RJ+9
         cAatjrbl/Bo5xF2IN+qI9SasHJ+vD4qb3zC51CZcbUL6aBw6FSB9HxOFllXSAtXGKN4B
         50g7L3Sx/w2tasC0dLQmiCn3RhgGDaW4lCVfH+FJrzputVMlhfQToa66MOUZwDahRl7/
         zKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049295; x=1744654095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUuYsrCNZuom26Ku72dSBPeeyC8punlJl9ufLVLiqm4=;
        b=UVEZMaUZAhCS1yIdzIUdkJcd+1SxKf42OhH1nlxqEZxZxKjm5rhyqKZvNqOOjzi9xl
         /A9c3JnFCuat98oiZfySrWYEbln7W4JgdA8BEKHDrdML0NJCnVrlR59yrThdCRhDOcyL
         c0geo3antoSbS4+V6skZaGE7Ocw7E3RJSB48Lo4SLQ2bHzX/awqvoWf3GoI/rjdgVLo3
         Ciuseyukk1uimzNvKIrxVL4mAozMHdzZqqIXMgLBCxuERq/+jND/5hyZkuWBOcO+r/Cc
         fJWIP2vcoNII4bVwEgEOKyEVkSmMORK8lDCd8T/FrBodG0zWh4jN9OqI0Y9RJnI7VlwT
         QViA==
X-Forwarded-Encrypted: i=1; AJvYcCXP03tZ911Wxd+kiIZEp/igkOsNpKPCPFqiUsqCVceWcNUrqEMiD38lqf9bSF02/dwrv8DUVp7Jy06FrhETG0QW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4ZFGIF1ZW17sdzvrO03SSpUGlpp0byWGQDseXoNvaXlYh4OmY
	BTVes2huwVXP3ED1pLIdk0Xg5cThBi/kWCdKPLQI6InEJzMGZiXRb+iJISkXBWFXyyuNHQbXbHa
	aBGoVdirVnysrGzAfhmNPcCK31LM=
X-Gm-Gg: ASbGncvU3Cmyw8gQO1n8OO8krv2dI9UW3ml0Zk3tgcg4CG33VKOGeIlpur200VBb7Bo
	Ejijpjyw7JPr1XiGB43u3WU83/RTC5YHhfC/p2Z8oKlXvm2HauiOxkVGOgnzKpR39xU2iVpIb9F
	nufPl/t4bUQdWxO90u60TNXMp0L0GQMNRLsLmSk1QNMdSYuXr5pepmnA/sZw8=
X-Google-Smtp-Source: AGHT+IEN6rDHodvyUoowo8BFuQsI+M3qkHprXMun6ue2nFvUns/xZBc98c1/xylp9Sz4+dM00gUNYRdzmCwmGkE0JHw=
X-Received: by 2002:a05:6122:16a6:b0:526:1ddd:8953 with SMTP id
 71dfb90a1353d-527642e498emr8513099e0c.0.1744049295202; Mon, 07 Apr 2025
 11:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
In-Reply-To: <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 19:07:49 +0100
X-Gm-Features: ATxdqUGJm_OgZHRFfu9Amyd2UVOtmAsyuknbI3Y7Xd-HEEICL3GbzjhydkDONtY
Message-ID: <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110816_813618_FECEBAAE 
X-CRM114-Status: GOOD (  20.08  )
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

On Mon, Apr 7, 2025 at 6:58=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_data =
*plat_dat,
> > +                                       const char *name)
> > +{
> > +     for (unsigned int i =3D 0; i < plat_dat->num_clks; i++)
> > +             if (!strcmp(plat_dat->clks[i].id, name))
> > +                     return plat_dat->clks[i].clk;
> > +
> > +     return NULL;
> > +}
>
> In addition to Jakub's request, I'll ask that you hold off for a week
> because I have the following that I'd like to submit:
>
Ack, please add me in Cc while you post this patch.

Cheers,
Prabhakar

> bbc73b8b6dfd net: stmmac: provide stmmac_pltfr_find_clk()
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index c73eff6a56b8..43c869f64c39 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -709,6 +709,17 @@ devm_stmmac_probe_config_dt(struct platform_device *=
pdev, u8 *mac)
>  #endif /* CONFIG_OF */
>  EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
>
> +struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
> +                                 const char *name)
> +{
> +       for (int i =3D 0; i < plat_dat->num_clks; i++)
> +               if (strcmp(plat_dat->clks[i].id, name) =3D=3D 0)
> +                       return plat_dat->clks[i].clk;
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
> +
> ...
>
> which will avoid glue drivers duplicating this functionality. This will
> be part of the first sets of patches I'm going to be submitting.
>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

