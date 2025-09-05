Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E389CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB7S2EtUpEWZ+xx8MbHke+UE3WWH8zMsnHAoeyZ1ARQ=; b=wD44q6KIXn03qYqq+4eSbv5Kyz
	UZbf7Z/c/aqVbO9MKHjnp+yPNO3cpIioamyZQCaIPVNQqdAF7dZ4sdbSCAzj2/VJYQ5NZzPMQxnPi
	UwOHD4+JObBTtamM4S1Ifxs2QyiRN3ALhyQio6+REfId4cKAhnTdjrwEsGy7SMpPyfNHsWElBxCkH
	75/UCpLeTMajdbHFKOvUr45gKDrZtw5XyvGthfcM9mGgn6EGWlsPu8ZV3BrAfxjAMGp4ho4cTYS5Y
	PnQjgi025vhLybaYsPmKhtYo1BYcbHuAtUWISxhvLMimhYbExhrfCr7Wzvp+mxQgrPlpCZLXp+sJe
	9ymN9yXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYv3-00000002yWZ-2Ol3;
	Fri, 05 Sep 2025 16:04:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVW4-00000001gLx-3x3W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 12:26:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3df3be0e098so1137468f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757075167; x=1757679967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pB7S2EtUpEWZ+xx8MbHke+UE3WWH8zMsnHAoeyZ1ARQ=;
        b=AQWM0sxTrYXo63crhFBXgxaV3UJ+2gu3d/xJCJY7K7uOkh6TSPOzcNGWcffvHEHyn3
         LIjAMAftf/2OlXfXO5xCsFvqr33ppvBM5+dfwausuSfdQYawpzFXPNh+A+rY3ymOJ0xD
         S5cI8tjtuJ8kzQvpNDJphg13njwAeKlmSUq3itFNy4ok6qLcJLO5RhOfAxvvyCW1u3Pf
         8ohKMjicqnXbYM3+wsKvGRIYvecYcfzBDiAvwlblQTyxW2OtZDArVtx0HuIF3Ufn+wVw
         IDGgffP7/GO2tsxSLpgEXlTK1ybjDsK+qxSGIUNEyhfx4D5+SmxS84SlPeC8W7fVUkmD
         NrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075167; x=1757679967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB7S2EtUpEWZ+xx8MbHke+UE3WWH8zMsnHAoeyZ1ARQ=;
        b=AVAvSZ6SNlpmi7ZB14EU/jRKoDp4idQ6sZEXa0NFw8TSCG9WZeLwKiZSdn9OA/VOJr
         lwsoKmy5gJmXrM/9tCUeOh1HGe4v+C4t1iSyxBapsp9+qpuuhQp7WhYdDuEXuom1VKJz
         ofYk03xNricK9lHVpjLOoQDrsttEbtR+YPhW856eE1cb12zsxm+N+9FqbEfF/EiO2jlQ
         j9NwX9zs3PtoWGeg7MD6AcWPh66d+QPK+LPQ9CtahvQi5NsqyH7TTevrEKhUCOuVF66p
         91jccWsy4vwWJo/Ug8+hb+qgdgjbi74OmafupXZySbSsCxYA9RwTSO44yWbHqCHKMeJU
         PAQg==
X-Forwarded-Encrypted: i=1; AJvYcCXYRdfliP8SWsm6dO9AnXktoKRy5DmlGpE/PpIYdn9zzdEpGeuA3x/+L9keBQE2ZO89AUaa1czljZhTD5TLFtmU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywoje83Q+hGHD2+xSnSPii1Umz/alBSmyvZIYz5Yxgb0OE+GkS1
	+uas4wd/cT6MdPHO75O3dCMaDFzYHAHNQt/04/IKfj+/pRvh1VxxiVHQNQpaB5ARhjviRTBrt+N
	6sglNqvJmxEcB6BSCIp+c83rl+8q2WYU=
X-Gm-Gg: ASbGncvZclgV9SOmUQcCKppfnfZ9y4oWK2eIIdnrbpEMtne3du89YtJPPPCpYL/xf5O
	ZzVUukKiY/rqkll+N7HWehsFVn7mQxydImOBtxuEFyZh6ZpF942vHGBvBQLbKL0TqVd8WdNW0C8
	ppaZwbItav7WwclrvkpbUIyTEBH7TTzl4YILuSnbh3rn/6yTWNTKslKzq+F1H41wGON45iAabBy
	FE9cs5d16HICz7LLUq6htHwDJ7t+u0CrAz3M4kNb38PiIZ5PU4=
X-Google-Smtp-Source: AGHT+IEu9qio4sf+nY+2VNCn7hdbR1T28beFwadrX0mqCszsq8S28vScNVJA04OVTxp/easlutUPryntBuwX/WyqQQs=
X-Received: by 2002:a05:6000:3111:b0:3dd:6101:4efb with SMTP id
 ffacd0b85a97d-3dd61015026mr8949421f8f.11.1757075167278; Fri, 05 Sep 2025
 05:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk> <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
 <aLoFIoqT2A2RmrfR@shell.armlinux.org.uk>
In-Reply-To: <aLoFIoqT2A2RmrfR@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Sep 2025 13:25:41 +0100
X-Gm-Features: Ac12FXz8sW_rykJvGGWdLFiauLq7H7TD8fJdnQu_wpMQYelqr_sg2nzux9BatIs
Message-ID: <CA+V-a8ssRu=1aX3VkgoRQioewU-VRs-xT6Z=Qp-RknuwJ0o2GQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250905_052608_980005_93517D2A 
X-CRM114-Status: GOOD (  18.33  )
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

On Thu, Sep 4, 2025 at 10:31=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Sep 04, 2025 at 10:10:32PM +0100, Lad, Prabhakar wrote:
> > Hi Russell,
> >
> > On Thu, Sep 4, 2025 at 9:49=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Thu, Sep 04, 2025 at 09:39:48PM +0100, Prabhakar wrote:
> > > >       plat_dat->init =3D renesas_gbeth_init;
> > > >       plat_dat->exit =3D renesas_gbeth_exit;
> > > > -     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > > > -                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > > > -                        STMMAC_FLAG_SPH_DISABLE;
> > > > +     plat_dat->flags |=3D gbeth->of_data->stmmac_flags;
> > >
> > > You include the first two flags in your new device. I would like to s=
ee
> > > at least STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP always being set. The only
> > > reason we have the STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is to avoid
> > > changing existing behaviour and causing regressions. New stuff should
> > > always set this.
> > >
> > Me confused, STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is set in the new
> > device [0]. The reason STMMAC_FLAG_SPH_DISABLE flag being dropped in
> > the new device is SPHEN=3D1 in MAC HW feature reg for the new device.
>
> What I'm saying is I'd like to see:
>
>         plat_dat->flags |=3D STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
>                            gbeth->of_data->stmmac_flags;
>
> iow, it is set unconditionally, even if forgotten in a future patch.
>
Ah got you. Thank you for the clarification.

Cheers,
Prabhakar

