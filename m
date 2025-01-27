Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E10C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3fdf68cKnEaIGamBbArQHWaVBKPqUrbMqE+m1JNXYk=; b=nBZTB3sefZdYTNPFiNzKrsjNGD
	adhE6+ARk2aHrvqzsonK8x184qsNbvTGvF1gZblhr3+9eW4vGZO3L8N8CCDVHHAXEtFmCKSrzw30j
	QY3mPbsudc9fCB5fGBOo+gR3seQyAR3E0VjMHoCIV1RGDD8e78qDq2WCRXcpFe3VHGWZ2hRwQGNNm
	GDjUPlM8hdag6GlkPDsz/ScnopTILPpzbIm09VmPrqdepPpX70rXxa2s3dFLAade31xqo2dD1iBN1
	i49dl0GWbWX2PnCKsPZpAhV/FsSvDLiI6+rcSV+IejfSgpEQXR6UYT27FJPispQYKGnnAl5Bzg8YW
	wjGhWZ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcQro-00000002ZwG-3lhX;
	Mon, 27 Jan 2025 15:17:36 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcQqT-00000002Zeb-3TwS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 15:16:14 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e549a71dd3dso7759164276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737990972; x=1738595772; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3fdf68cKnEaIGamBbArQHWaVBKPqUrbMqE+m1JNXYk=;
        b=LO/r0+63ZMl+ex3ZsFUVzafXuUKJvWU1PtPdTeEJ1mvWlRqMdnh8S8HM7ZrULG9uqF
         1xYUGaZTdsiF4fk6aWhO4vGby+2krZSiHsw/qZsqTt1rAH58utt5joQaLt7mGjVHJgci
         sguQeccMDhGQ963XHJ4+M7lRCtprJbNiCmywSVC6m63x3UnqnekqS87VUR3Bw0BCLmeN
         Bno9OFshc5S1oGpaDhoH2q7XfFiD8iv8Bj9FLGWpgQPi3e/rGYrgBTqbPrTn6/17s+ui
         40ATiJzq83aXkKbK9JbV2GpYaLMBTuLhrw4Z2JTO5My27tYvJWTWgZtb5eOhmnUdQ6bM
         5bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737990972; x=1738595772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3fdf68cKnEaIGamBbArQHWaVBKPqUrbMqE+m1JNXYk=;
        b=NHKAn+64Pc8bOKu881oCfVnG1tpM69Thk0ApnQ4tYlrRwjADgr9V6Q7plNjvp5T0N2
         CylziN9kDr4WeTS/QO7LnAVrvQo2LqpylvjqqJKESLBFVF9ur0tKHvgbNYrkw+PJi1J9
         HzTwGIoxB6PKgLcFC6rjEWKRiIAUCIIiEJl5HBqiEb4Z3bXDAUSFq9ShAifNa7gAzQ9C
         ABSzCoXK1eOeCu1e34rlOYZ/lfD1kF7cn0XS4bkeVpioM9wZ5RmfiubpyDo518QHn7sA
         5ZxnoZIEcI1+Yyg6JpyZULw7CSQyXXz+FpifIwsdOwTKTgQpIFGN89N6mLqBFrG0oPfl
         gopQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVK+SaXfZsRX27Ubf7I29KyzI4nYb+kS/ToFmqfSkX51uZpmk7Yj0fxK9hNF5WfPdcZdWNOQu6MlcYyMVOtJMJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0GooIgD8tdOpZ75IUsYLomn1NI/OPk+To/BOegFgJqwugDpDu
	T1rcRYww+jA3HHV1p/6sKq9BPyck628cD0MeJ52zvyRFTs0wAoK4xR/51W1yTw4yl1dm4rE7M/8
	5enMF6RI8xa7lQBY/DqaK9k12ASwiI9MjSuXwlg==
X-Gm-Gg: ASbGnctJUgsIHsGmXvVM0GKhmouMFHNBt1Gi2HdHrQfipIw3FkYPHuRWe1W6jJTV6FW
	F87HDKnYkSBtWXUg2/TjjU8ELFjfJRNv9Zm0JTNmmaMuLuaBmE4CvHlm9UHkKt44=
X-Google-Smtp-Source: AGHT+IE7Vja9677she6CObvFAbVBiI5Ys+p+eByoUyFiITh4qV3MJatrF8vKcAYHzhv31KbUMJyT51BBZJ0PLRNDtTM=
X-Received: by 2002:a05:6902:150c:b0:e57:88a0:3ca with SMTP id
 3f1490d57ef6-e57b1344ac2mr27218044276.40.1737990972298; Mon, 27 Jan 2025
 07:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20250120184728.18325-1-ansuelsmth@gmail.com> <20250120184728.18325-2-ansuelsmth@gmail.com>
 <20250121-zippy-umber-fossa-abbfb0@krzk-bin> <679770d8.7b0a0220.b6f23.38b4@mx.google.com>
In-Reply-To: <679770d8.7b0a0220.b6f23.38b4@mx.google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Jan 2025 16:15:36 +0100
X-Gm-Features: AWEUYZnk9Xh1b_Hveu4tndN_oObnjQYSeVJzcpRRCX5DJCyFhAmHsJWAlWuduBA
Message-ID: <CAPDyKFoEDbSfQA3xPCUPsJCOdiDVdAjB1Fno=S7yrqJXSqnfXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: mtk-sd: add support for AN7581 MMC Host
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_071613_878550_C3DBF4D3 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon, 27 Jan 2025 at 12:41, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Tue, Jan 21, 2025 at 08:59:19AM +0100, Krzysztof Kozlowski wrote:
> > On Mon, Jan 20, 2025 at 07:47:02PM +0100, Christian Marangi wrote:
> > > -                   pinctrl_select_state(host->pinctrl, host->pins_uhs);
> > > +                   /* Skip setting uhs pins if not supported */
> > > +                   if (host->pins_uhs)
> > > +                           pinctrl_select_state(host->pinctrl, host->pins_uhs);
> > >             } else {
> > >                     dev_pm_clear_wake_irq(host->dev);
> > >             }
> > > @@ -2816,9 +2835,12 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
> > >     if (IS_ERR(host->src_clk))
> > >             return PTR_ERR(host->src_clk);
> > >
> > > -   host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > > -   if (IS_ERR(host->h_clk))
> > > -           return PTR_ERR(host->h_clk);
> > > +   /* AN7581 SoC doesn't have hclk */
> > > +   if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
> >
> > Please avoid coding compatible in multiple places. Not only because
> > above check is slow comparing to check on integer, but it just scales
> > poorly and leads to less readable further code. Use driver data with
> > model name or flags/quirks bitmask.
> >
>
> I implemented this in a more compatible way so we don't need an
> additional compatible anymore. Soo this series is not needed anymore.
>
> Should I flag these as not applicable anywhere in the patchwork systems?

No need to, just send new versions.

Kind regards
Uffe

