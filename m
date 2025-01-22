Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20A0C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 04:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjR45zsGj6w233X5TymR6ZZoZTNg2y2cJLrxHA10oRI=; b=04WJ4K6xRauifF8JlazvIocjS6
	wjtoOdV3JYaVESWWEYweWOowZt7VxKqyhS5/YNgWH7vn9YaHhZmqhdH44FOWD5e/PPhlQ0m9VS2sH
	4HUajEUFQlIcup2X5SHvp++VUx/Z7JNPUSaLmhVe/HAfRd6XyNLQVJre9qukDzE0/cn81o2wi653A
	fUk7SZU7lRUXDLgwm3AmMNFIb4uQ6BfTDNKtSIpXDYFLp+C8kXKRJMsmEFpcoO1Nduc6uXwUy1aq9
	Gf4JcYWc1Jv1mqPxgle3JbNQdE4jfwXeS3Wu4kQalhrZb3yPcuiBFVWZ+/h7+Opw1x7HINI8IIAtC
	gC/2pM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taS3R-00000009MEf-0Yfw;
	Wed, 22 Jan 2025 04:09:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taS1R-00000009M3b-0lMP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 04:07:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5FCC5C5967
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 04:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92656C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 04:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737518839;
	bh=LmVFa7+rsczkSeaam0lpFKFM5NAG/xrl389XXjfwFyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s0Bv2SInDBYUDA0dquHfwvSs6sDWP7pgGegBG/CTjnyu8YzVC4iizkTx1csr+9Fil
	 ZSX1J7RvvSrgJO/idvK+MkSnI3ENKpld5p1382mASDYiW8zUu9SoPtHSFxlJ7jgCPv
	 wpNz6+DRFvSknoh+H+6QSPQ+1AcNTKUxpTrTUyK28tRofEEtMQ9Nx/nFAMsS7WiwFZ
	 SvV2rUp100x/RSnH4tXvXXZF8tthWs/bzOTTeQnPBCzzl2JDyKAYETU9+sugOcRRRI
	 BcemDRbG3T/BTJdFN0lMQyk67Ets0EMjX3cRHB6JKW4p1JQY8lLtH5nSDVZj07ABW2
	 oJFTqJqPgejag==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa6b4cc7270so984026666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 20:07:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlUUnN2XBE7mxEx/sLrMGhSEENSqUBmML5QsDaeXjnHd6hoEG+FAHbg8+UE3vh/SwlwdRMxiuQbO+0gd0HECvE@lists.infradead.org
X-Gm-Message-State: AOJu0YzeKh+xi20n5cpdzCIkLhsDzx9G27DqWEio9sVh5TfPIrluafe/
	3MYiwoBhbNzije/w8/wYJ7Uufspc1/yGaknl41TzmkHIF+GezVbjRveeEHaxegUi3jkOMEnSNyi
	T1fBZeaNPiXRvZ9WDE8teyAfX0+Q=
X-Google-Smtp-Source: AGHT+IH83euRaIbr8Kiv3H0t0U/K5dEsWA9P4TmWerd02oA1XpuDA1ifRCyHX0MTZ/ZxXdVfhs+PSnb2PFcdbAY09n0=
X-Received: by 2002:a05:6402:4313:b0:5db:f5e9:6760 with SMTP id
 4fb4d7f45d1cf-5dbf5e96a10mr1862552a12.2.1737518838103; Tue, 21 Jan 2025
 20:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
 <20250121044138.2883912-3-hayashi.kunihiko@socionext.com> <07f2f6d0-e025-4b21-ac41-caaf71bb6fff@linux.dev>
In-Reply-To: <07f2f6d0-e025-4b21-ac41-caaf71bb6fff@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 22 Jan 2025 12:07:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qrr5x9PL5NjmvT0AF9XYtOpZBMjBj-QkTF2V6h6_Vhg@mail.gmail.com>
X-Gm-Features: AbW1kvaIG0rIpsEVvPRfxgbYSjwLxqw5Bd0bCr51SyrGjTbJBRNoxlLrUYz_02I
Message-ID: <CAAhV-H4qrr5x9PL5NjmvT0AF9XYtOpZBMjBj-QkTF2V6h6_Vhg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/3] net: stmmac: Limit FIFO size by hardware capability
To: Yanteng Si <si.yanteng@linux.dev>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>, 
	Joao Pinto <Joao.Pinto@synopsys.com>, Vince Bridgers <vbridger@opensource.altera.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_200721_302463_24EAB2FE 
X-CRM114-Status: GOOD (  21.32  )
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

On Wed, Jan 22, 2025 at 1:15=E2=80=AFAM Yanteng Si <si.yanteng@linux.dev> w=
rote:
>
> =E5=9C=A8 1/21/25 12:41, Kunihiko Hayashi =E5=86=99=E9=81=93:
> > Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
> > stmmac_platform layer.
> >
> > However, these values are constrained by upper limits determined by the
> > capabilities of each hardware feature. There is a risk that the upper
> > bits will be truncated due to the calculation, so it's appropriate to
> > limit them to the upper limit values and display a warning message.
> >
> > Fixes: e7877f52fd4a ("stmmac: Read tx-fifo-depth and rx-fifo-depth from=
 the devicetree")
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 251a8c15637f..da3316e3e93b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -7245,6 +7245,19 @@ static int stmmac_hw_init(struct stmmac_priv *pr=
iv)
> >               priv->plat->tx_queues_to_use =3D priv->dma_cap.number_tx_=
queues;
> >       }
> >
>
> > +     if (priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
>
> > +             dev_warn(priv->device,
> > +                      "Rx FIFO size exceeds dma capability (%d)\n",
> > +                      priv->plat->rx_fifo_size);
> > +             priv->plat->rx_fifo_size =3D priv->dma_cap.rx_fifo_size;
> I executed grep and found that only dwmac4 and dwxgmac2 have initialized
> dma_cap.rx_fifo_size. Can this code still work properly on hardware
> other than these two?
Agree, this will make my below patch not work again, because
dwmac-loongson is based on dwmac1000.

https://lore.kernel.org/netdev/20250121093703.2660482-1-chenhuacai@loongson=
.cn/T/#u

Huacai

>
>
> Thanks,
> Yanteng
>

