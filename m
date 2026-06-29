Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18155C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBV8+Lqv6LzBCkekw0TZncRmTA/42jKif/q/Zf74Sfc=; b=tSJUUJ31P15VEwXerHm9vjcM2D
	2iaol90A2psZofGhDexw6g1mXB6RzroS6KX3nIkhr7pinsBHwXRezm82pMH0x0TM7xKLWQoO223q5
	sfxMFfsXE8zo6B4xGScSWbuCg2C74405NdTdBwmUZFEZIUFrcuNwrrAXy2X3O2UCBlxFTbyimHDaE
	gooyjnwWINK73iVB1v8wvsBqp8kQ04qahjpfCic3Hl+dF9CY+y3c0lB7IkzAqO7w8SqrZV7or8lkJ
	ckExv6HGsTx1PAPpQozzhuDf0qYF89/kk4rkVxOXaDQikT86qZgxQdXg/aBGYjmvrwqqklLzj9Uho
	WB+aWm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6PH-0000000Dt5w-0B6l;
	Mon, 29 Jun 2026 07:27:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6PE-0000000Dt4q-1p7K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:27:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4926fe5be4bso21728175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782718067; x=1783322867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eBV8+Lqv6LzBCkekw0TZncRmTA/42jKif/q/Zf74Sfc=;
        b=U4NO79WA/mAqaMWfSoNTEWVNTs/+4sPobxTSW14G/o7C7I/qcFj3ntoI2lhi0mAVFX
         D9BhVM9OGQ/Db2L+VwnRuDrregdw/vymCb4XsROSLuXZ7/hTeT4IRsv3CQrhaUSx5moc
         hgdHoIYILqYQI1++THRQ721L2I9eoRit0x5VZqkXRlghWiFt1ZrTiY44v9t8DChThXJo
         LQiG8GUy0oK7RvFL9nwwhNlWNi2l/gSbWtBeqsd1AC1TjC+qXaVqdmWu5oyUqov36foc
         9jivSbb7I9Gj1CsaoEP8Tke+3ljds6yThUtz/a2JEZ2lg9woCTw0jK1OjpfAndKwkJgl
         IXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718067; x=1783322867;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBV8+Lqv6LzBCkekw0TZncRmTA/42jKif/q/Zf74Sfc=;
        b=L0H0oNVOG3oE4X5nHOj+gSk+eufR++7aHceLM+QbgLKeg+94+eARgIhQDCwx8ZSmte
         yWYRTykZFFlZGKUpkPnvok1FsegkeKMZVke1CsDP8N6SEpV65ztL6v9GhlKRBEK0HDZv
         VLYPPyJHiPsaBiwIA9QM3KZ+xIpdknUDQU7m+3aZqraTlb05SaS8Qbuba3jCMaDTkOMM
         UywgTozw2vGS4jVoj1COvUtmpA6aLfWwtXCBfGmieBvn3Hvb2To/H5lLsnTWdrNI0fXo
         sNlhk5Y8zOqTYjmkHPxB1hFetbcJ1iKE1yuLrWKsacafF+PBls1n3QlIdHjH7E93v0Ou
         F5WA==
X-Forwarded-Encrypted: i=1; AFNElJ/Rqy3LQJ6r1bQvIT+QSLkI/9nVmXbUWrFcLxXGlGZPTqPFwn9NDMx3AItF/xSXd5L+O446eWinY7B2esOTrWd8@lists.infradead.org
X-Gm-Message-State: AOJu0YxyGqVGSlvHj8aOToEoP3CITbjPG7k5eq0SXZjx9MB0oT12/Dfj
	hn2lv+K6N1mGM8b5a7QuFPBkRrVWxDkXTgFT8lmSle+B05m/0G4zIZzz
X-Gm-Gg: AfdE7cmtsJ2QkQgJZIAbWt6XLEK7pzyvCpAckmylT1YcEH/e0w2lWEOKW6j4jLxBsu4
	QGG1RDR/uk9nnkaWqgHO3UItMsijnqsp1QzIkhAXaC8OQp1zxU1IfR/h/FpUBCfzr4zd8wqNzhW
	cuMeQr+cEh9Mhzd30GwOOxY7cHnUl8/Nn4k/BR16K0n2r6/Tke4a9b2XYp6vrvRFWPJBThrqhGQ
	iCbejg094EFF4tL50GHeVhvJBdmB0tc0hcv4KGPY6bhkEt+8hrVtd3kyjEKPnsxa35xLouYbfhd
	YJjsmMPuu/HrhH4z3Gpbn+qLw1cGpZt9tTOLmWNJ+L8CnIrYUrpfOqZAAsZJ0EkGMzm+/qY5sVv
	mG9A57kMwtsfDJ/7L59Y7ZVwa7PFqcXvpOxO9ao1FoJcRqBelYyIsm7XocZpLOtS4HKybfA1FOW
	7ExPRtUu90X+292Sk0D4XoYQDnKJZ2x2WZiFrI5Q14VCGvjHrBnOe6gW0F2vrpEKy+Aj4=
X-Received: by 2002:a05:600c:8b14:b0:493:b2e8:637c with SMTP id 5b1f17b1804b1-493b2e86404mr14198305e9.1.1782718066323;
        Mon, 29 Jun 2026 00:27:46 -0700 (PDT)
Received: from Ansuel-XPS. (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-472c7bec9c2sm12681213f8f.12.2026.06.29.00.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:27:45 -0700 (PDT)
Message-ID: <6a421e71.39c9bec7.1462ca.d6ce@mx.google.com>
X-Google-Original-Message-ID: <akIebr33n_BgDL7X@Ansuel-XPS.>
Date: Mon, 29 Jun 2026 09:27:42 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] clk: en7523: add support for dedicated PCIe
 PERSTOUT reset
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
 <20260627121450.3529133-3-ansuelsmth@gmail.com>
 <68b43224e0a124c055fc228b3a254fc7908dbcdd.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68b43224e0a124c055fc228b3a254fc7908dbcdd.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_002748_503048_FBBC66D3 
X-CRM114-Status: GOOD (  25.14  )
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

On Mon, Jun 29, 2026 at 09:07:22AM +0200, Philipp Zabel wrote:
> On Sa, 2026-06-27 at 14:14 +0200, Christian Marangi wrote:
> > Add support for resetting the PCIe lines with the PERSTOUT reset. These
> > special reset are controlled by the PCIC register and are specific to each
> > of the 3 PCIe lines.
> > 
> > Notice that reset logic is inverted for these bit where 0 is assert and 1
> > deassert. This is intenrally handled in the reset function.
>                         ^^
> typo: internally
>

Thanks!
 
> > PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
> > reset handling.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
> >  1 file changed, 28 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 1ab0e2eca5d3..c9b21d9bf2f3 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> [...]
> > @@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
> >  			       unsigned long id, bool assert)
> >  {
> >  	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
> > -	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
> > +	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
> > +	void __iomem *addr = rst_data->base + offset;
> > +	bool inverted = false;
> >  	u32 val;
> >  
> > +	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
> > +	if (offset == REG_NP_SCU_PCIC)
> > +		inverted = true;
> > +
> >  	val = readl(addr);
> > +	val &= ~BIT(id % RST_NR_PER_BANK);
> >  	if (assert)
> > -		val |= BIT(id % RST_NR_PER_BANK);
> > +		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
> >  	else
> > -		val &= ~BIT(id % RST_NR_PER_BANK);
> > +		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;
> 
> You can simplify this into a single (assert ^ inverted) condition.
> 

Yep I know but I feel this would decrease readability of the logic. Do you
think it's worth it?

> regards
> Philipp

-- 
	Ansuel

