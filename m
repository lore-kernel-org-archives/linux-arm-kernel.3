Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F1EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 18:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ab8qgY0wYeMeF9f8GAqkiU/85dkzWksm0Y+DavzpAGg=; b=Ot0l5kll3MiZdpPrzOAa32M/wG
	H9+rFQSB3eETOQJSp6d/9nJzdw8IndvLY0pMR/1cidFzShsRzAFyoKjrGwHAFIzJ4SUqM2DFgS9vE
	7p6S9oD+8ReNg/5huXPSerhGsWaFatV+24Z7OPz614e9Kw9DY/rCKemzW09ncKrCQs/hgTtURDa2g
	3qUELC4SvabpwJIVVpWY4RI+vN8yZFU663hRhSj5VJgwuf4rjIz9mXI4XffWypYHnWc7gvDPeL84P
	3GL5t+CBhWAPwXZVESaS56Hq9BRet47ieRjETgLu63V07cY4Z2W9US3wHDuxTxUwCSgbvBR+pTYLF
	eR6H6xzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OUR-000000035cI-1PNV;
	Mon, 14 Apr 2025 18:25:03 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OKr-0000000345u-3Cak
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 18:15:11 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-523de538206so1678337e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 11:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744654509; x=1745259309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ab8qgY0wYeMeF9f8GAqkiU/85dkzWksm0Y+DavzpAGg=;
        b=Hz3plUwQslM1Z5axejSQAH26rrwIRO1IA10U4x5d0haGxZ9s95LFwm4iUff/4dI2uQ
         kB4XxBFalgLltQ6scGFC+Ie+ntxQZK87HNCqHPIX722SPtuU8v8988nNFlpFtIdqZK7M
         Ao00Lr5fgtfR++6yKXPom8gwQYsC7jUFa9Ht6IibQVBRU8zURzEfuyr6O2scIoNPy25b
         djvVmHtpRfzD/feXSJTkOGM3eohfRTZ8R+CRWImIMEICAv1nPjibTqcOQ7eUdBGdnMfU
         F0XGWikWRsLPY86sOhOt5cFByDHLDyR5R+Ce2TLjhbla58DKiKhxYr2DSA1IiGZWvwVL
         kXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654509; x=1745259309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ab8qgY0wYeMeF9f8GAqkiU/85dkzWksm0Y+DavzpAGg=;
        b=Ah0OclNlgWPM2wMYzb+rz4WNdITrVCrCtiq1Zzt0QhAHA75mireJ37Exis2NR6RYe/
         R1m4GVxuAPrp6HQXoiJV8A9dA6HeSLLrihIedgVI5PkY0EFa/MpJ1ibBCiKgy5iNb+3K
         NnOq0O3YDtmxKnSAt6OS3YG5eZvKibCUZ3Cf0ihIUL5t/FU/DkxwW3EsD7gDKwRYEEIy
         D0C+Vi73bS+UtS/Av9FmMCZfrtUWPFT86DDqnAuaglmX2rQJS9JWbUhUV7rvKgNdTqsM
         qVjsaRECJQmWu3oRRRuQtx3su1+swGrUK09as65BTgOEqK6zGgaSK5mEqXwa78k4xAep
         53uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmUpNxIsya0CWM5FrEsztQe408fk3Ng1zou/FeZVqixAdDIoX6tIiLiztM7NzVn1bP5/Ci1XS6Kw9/mfv6b3wp@lists.infradead.org
X-Gm-Message-State: AOJu0YzRBDkUHcGW5tuLICDgIMxjvWDkPLoyVJEpINv8jdGsvQe3qLvp
	K91oL9pVmwICn36bup5CD3LQaf1ewl9Vcu0lals0huwEckx5i7ikG3h229KgX+L0/uSjr8ivi+a
	hye3fi/hCYhGQVPXhvXUFkxHhxqM=
X-Gm-Gg: ASbGncvjgbo/luqeMp/Sfdt0v2xvPfhRCis10LgVluw9vnor2fmbEu8mOjOSOG54xby
	V9N+wm+hxMaSyqKeuH1lrKF1UNDSEHarCiRLKQ/nDiPOOcXOrqXaHCildV7q9+wuPE95FPfnIJz
	3ll1U5bz+5z4NN9go2IA67vI3AwjCRs5+XBK2vK0ttFdsc90UoucqksQ==
X-Google-Smtp-Source: AGHT+IGQY2h60f8WJYp88UGsGy+zjKZoZ77MuV/wdekbtzAvVIiA03PukMvok77iK0iUI19EfMYr3Th7THvYja4ZcDE=
X-Received: by 2002:a05:6122:7d0:b0:527:67db:9cb2 with SMTP id
 71dfb90a1353d-527c34d1d3cmr9206320e0c.4.1744654508673; Mon, 14 Apr 2025
 11:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
In-Reply-To: <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 19:14:42 +0100
X-Gm-Features: ATxdqUEl2MkISqtCUulKnIjkTEEvAI8jUFwXWbR4ZrlJPw4rcSyDREbiYNsOOl0
Message-ID: <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250414_111509_804896_B2553D8E 
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

Hi Russell,

On Mon, Apr 14, 2025 at 5:57=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > +     gbeth->rstc =3D devm_reset_control_get_exclusive(dev, NULL);
> > +     if (IS_ERR(gbeth->rstc))
> > +             return PTR_ERR(gbeth->rstc);
> > +
> > +     gbeth->dev =3D dev;
> > +     gbeth->regs =3D stmmac_res.addr;
> > +     gbeth->plat_dat =3D plat_dat;
> > +     plat_dat->bsp_priv =3D gbeth;
> > +     plat_dat->set_clk_tx_rate =3D stmmac_set_clk_tx_rate;
> > +     plat_dat->clks_config =3D renesas_gbeth_clks_config;
> > +     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > +                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > +                        STMMAC_FLAG_SPH_DISABLE;
> > +
> > +     err =3D renesas_gbeth_clks_config(gbeth, true);
> > +     if (err)
> > +             return err;
> > +
> > +     err =3D stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> > +     if (err)
> > +             renesas_gbeth_clks_config(gbeth, false);
> > +
> > +     return err;
> > +}
> > +
> > +static void renesas_gbeth_remove(struct platform_device *pdev)
> > +{
> > +     stmmac_dvr_remove(&pdev->dev);
> > +
> > +     renesas_gbeth_clks_config(get_stmmac_bsp_priv(&pdev->dev), false)=
;
> > +}
>
> Would calling renesas_gbeth_clks_config() in the suspend/resume paths
> cause problems?
>
> If not, please consider using plat_dat->init() and plat_dat->exit()
> to control these clocks, and then use devm_stmmac_pltfr_probe()
> which will call the ->init and ->exit functions around the probe
> as necessary and at removal time (and you won't need the remove
> method.)
>
I'll test this on the platform which can support suspend/resume and
update accordingly.

Cheers,
Prabhakar

