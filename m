Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867C2EFCE22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 00:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0JXk9p5V1fGz1+f2197Ws9DW9uXumXoOAEt9xBTer0=; b=tATtfKW0YO/KWmBbnNE2gJ/oIW
	XsUZzDukyFqRzWzy3HtkWZmqRwNdPiNl1XopQkZA+dNNO02blaStlyMxkYAxIR1k4WW77QvX6pz+C
	3moKGCadi/qVJ7BB8Y8qE1X82YzXW04FOezQH6MUyETra2yaKNEJX4kUKnYtCP7Y4mojWxaZ7EnjD
	sp/6c5eSHvLJCDxV2lYXnpvjC0GUHvXjWnHECohZ/ecRrhdDmLtTmxYl0DRK1BgpwjJgUqEk+tUw4
	5XXmfftFdrEc/AQ0Mvqcq4qZLlM4edoGYtdURK/OGksynIvv1f/3Zoxr+qu8L+y36HmAddZ/UZTzr
	VEiaHSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxwNi-00000000gnC-1sGR;
	Thu, 05 Mar 2026 00:15:58 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxwNg-00000000gmr-0U9p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 00:15:57 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8cb513e860cso763698285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 16:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772669755; x=1773274555; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g0JXk9p5V1fGz1+f2197Ws9DW9uXumXoOAEt9xBTer0=;
        b=aUq9drzW4Pxdcd9809N+c67PCICQqMBbjrCQzTB1+muTm/35wvZ7bmRjXvnmjS+iwK
         xGcH4xPALhpHuH5dLEIgFeSFyaqG75JukBdgdjbnuX1Wv8PMJ7aSBepYu40fLKjyHmgd
         PFBNGYSmEM/5xaAe+xnrqWCl3cdkSrRNpypHIvP49JxkZrLBKR2KquJ/rvXbgR7PVemb
         0WpVT+iIPtuoYDItmB50gvRJXSOXeiN+PPSCC8JUdKtwEQh++N9iS1G0Nrr5tuc0ILNe
         LYPTNtNujtx2kmMNhdYOA77ZGO29vEOxlCxHxdNeMAq+jHSvL7Y1haZih/QiotkOCMfz
         Iv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772669755; x=1773274555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0JXk9p5V1fGz1+f2197Ws9DW9uXumXoOAEt9xBTer0=;
        b=iyqkx0lE1Av5CCK+C2k8ahHGY5Ii7YWf4U8joQsA1aaF16gZaiO+EoG4SUgmU8vKR4
         limT0AVHrmmLbP0+ALsH5JaWK5spyInr7nDnT16PBFEGJJ3vTmBs3WuZYxyw3MKgLlSQ
         QiUOS/To+BQz7CeXk708xB/+U4d4m3eaaSAr8VZsYCnDcU7hUYKKg6f0LeagKefFzxzJ
         85dKq14GZMny72TvOUaap9vBbyIPhTtUWs9Y8I7S/9sC8cuQGVgpq3CNN+i9c1BjgZaH
         yIecg0/6hAN687b8jrtB7KrkGwVqYBK4UnibmJAmqDJYB12eJMH+iqM+jf1YhQudaxrA
         WmXw==
X-Forwarded-Encrypted: i=1; AJvYcCUZR/N6YeUajkVhlNVXcEQi1QJ8OzThy/HK0RfM3EW0T5yYZd7XgPA4l4Wo5/ZYj9Wq7Cv71z6n5ZgQUgL8uz7F@lists.infradead.org
X-Gm-Message-State: AOJu0YxA6iSMoKHhZHSOzLgjyBYl9TdfCq9SmwqlGnKA/Nt01JSjS/vq
	/Oj6vZ+b8o7t31FdZ2QyraeRlHaGDqBslM8UcSDztvDwANWqgAfhrfrV
X-Gm-Gg: ATEYQzwrUOjgDKavq+H+ZDKNCCNtPN64xv2+2uI5z0jWyEfIkYErOsiUj6qYS5xblwA
	6FJFz6VpG432WK33digFAQdQumpdJPB6FBGIip8hYuS6pQgDekvvrH6Vh5d2SCzYrJF3e21/wPb
	Z6wQZgLlvuea+S+g1Vdw4d9KZvNjyp6NxxAIwY5UCAChXe8xpAo94bSDT0bjQaTnDsNgvTnqrF0
	CSGmxo7FjXY3O/HbamnoRlSI+KO1yT6ZKC+zyJ42uk4rcniGhIxRVVYFrbcr6lh6cdB4lrxQr84
	YGX50geWCF+zeYOcO5/WthySBxGc+SwlJS61GbFFgTQkjc/qkN46Ld7F5ooQRFNdbsST1d76WjH
	znDV62pBd58cCWMBDvrpd1mlbmWA+zgYilFS2w2C0/kfF3fhTr2qPEvRCsdbImWFRabWLnfRW81
	5xCln7W02FP6p+GBEIr7Vu6U7c6FM=
X-Received: by 2002:a05:620a:4405:b0:8c7:fdc:e872 with SMTP id af79cd13be357-8cd5aef1d4fmr466089985a.19.1772669754629;
        Wed, 04 Mar 2026 16:15:54 -0800 (PST)
Received: from c67c70be8272 ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf7319bdsm1775385585a.43.2026.03.04.16.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:15:54 -0800 (PST)
Date: Thu, 5 Mar 2026 00:15:51 +0000
From: Yuanshen Cao <alex.caoys@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] pmdomain: sunxi: Add support for A733 to Allwinner
 PCK600 driver
Message-ID: <aajLNxYvDrpT-qqC@c67c70be8272>
References: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
 <20260304-b4-pck600-a733-v1-2-2f54efdb8cc2@gmail.com>
 <CAGb2v64n_8RyWDieUKvbpkTikipB9ZvqEscYRRLowe+rvaJKCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64n_8RyWDieUKvbpkTikipB9ZvqEscYRRLowe+rvaJKCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_161556_202253_6CC3E350 
X-CRM114-Status: GOOD (  28.32  )
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

On Wed, Mar 04, 2026 at 10:33:23PM +0900, Chen-Yu Tsai wrote:
> On Wed, Mar 4, 2026 at 12:44 PM Yuanshen Cao <alex.caoys@gmail.com> wrote:
> >
> > The Allwinner A733 PCK600, similar to A523 PCK600, is likely a
> > customized version of ARM PCK-600 power controller. It shares
> > the same BSP driver with A523. According to the BSP provided
> > by Radxa, unlike A523, it doesn't require reset.
> >
> > Make reset optional in the sunxi pck600 driver and add support
> > for A733.
> >
> > Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> > ---
> >  drivers/pmdomain/sunxi/sun55i-pck600.c | 53 ++++++++++++++++++++++++++++++----
> >  1 file changed, 48 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
> > index c7ab51514531..8f9fdc3915bd 100644
> > --- a/drivers/pmdomain/sunxi/sun55i-pck600.c
> > +++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
> > @@ -52,6 +52,7 @@ struct sunxi_pck600_desc {
> >         u32 logic_power_switch0_delay;
> >         u32 logic_power_switch1_delay;
> >         u32 off2on_delay;
> > +       bool has_rst_clk;
> >  };
> >
> >  struct sunxi_pck600_pd {
> > @@ -151,9 +152,11 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
> >         if (IS_ERR(base))
> >                 return PTR_ERR(base);
> >
> > -       rst = devm_reset_control_get_exclusive_released(dev, NULL);
> > -       if (IS_ERR(rst))
> > -               return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
> > +       if (desc->has_rst_clk) {
> > +               rst = devm_reset_control_get_exclusive_released(dev, NULL);
> > +               if (IS_ERR(rst))
> > +                       return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
> > +       }
> >
> >         clk = devm_clk_get_enabled(dev, NULL);
> >         if (IS_ERR(clk))
> > @@ -193,7 +196,14 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
> >  }
> >
> >  static const char * const sun55i_a523_pck600_pd_names[] = {
> > -       "VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
> > +       "VE",
> > +       "GPU",
> > +       "VI",
> > +       "VO0",
> > +       "VO1",
> > +       "DE",
> > +       "NAND",
> > +       "PCIE",
> 
> No need to change this part.
> 

Yes, I agree. But since A733 has more pd_names, that line will be too
long if we stick with one line. And we also used this format in
sun20i-ppu. It might make more sense if we align with ppu. Please let
me know what you think. Thanks!

> >  };
> >
> >  static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
> > @@ -206,7 +216,36 @@ static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
> >         .device_ctrl1_delay = 0xffff,
> >         .logic_power_switch0_delay = 0x8080808,
> >         .logic_power_switch1_delay = 0x808,
> > -       .off2on_delay = 0x8
> > +       .off2on_delay = 0x8,
> > +       .has_rst_clk = true,
> > +};
> > +
> > +static const char * const sun60i_a733_pck600_pd_names[] = {
> > +       "VI",
> > +       "DE_SYS",
> > +       "VE_DEC",
> > +       "VE_ENC",
> > +       "NPU",
> > +       "GPU_TOP",
> > +       "GPU_CORE",
> > +       "PCIE",
> > +       "USB2",
> > +       "VO",
> > +       "VO1",
> > +};
> > +
> > +static const struct sunxi_pck600_desc sun60i_a733_pck600_desc = {
> > +       .pd_names = sun60i_a733_pck600_pd_names,
> > +       .num_domains = ARRAY_SIZE(sun60i_a733_pck600_pd_names),
> > +       .logic_power_switch0_delay_offset = 0xc00,
> > +       .logic_power_switch1_delay_offset = 0xc04,
> > +       .off2on_delay_offset = 0xc10,
> > +       .device_ctrl0_delay = 0x1f1f1f,
> > +       .device_ctrl1_delay = 0x1f1f,
> > +       .logic_power_switch0_delay = 0x8080808,
> > +       .logic_power_switch1_delay = 0x808,
> > +       .off2on_delay = 0x8,
> > +       .has_rst_clk = false,
> >  };
> >
> >  static const struct of_device_id sunxi_pck600_of_match[] = {
> > @@ -214,6 +253,10 @@ static const struct of_device_id sunxi_pck600_of_match[] = {
> >                 .compatible     = "allwinner,sun55i-a523-pck-600",
> >                 .data           = &sun55i_a523_pck600_desc,
> >         },
> > +       {
> > +               .compatible     = "allwinner,sun60i-a733-pck-600",
> > +               .data           = &sun60i_a733_pck600_desc,
> > +       },
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(of, sunxi_pck600_of_match);
> >
> > --
> > 2.53.0
> >

