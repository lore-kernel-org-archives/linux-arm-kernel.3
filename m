Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F7CC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k90VREcyUMcR/OGuKj3U3g7OaZ/zXu0WG1tLumtRQ8E=; b=cZ3pPlSZs2IFXCbKTCIaGuEYTD
	nIbZJqrMrckntvX9ORiDuS/EOINrf81BYolbtaCIVNeZwTqkpAP/o8SbpjyIMaEg0oESAPylxd00r
	C9mlkkhEy1uLGOeb7csRbD7uYSarXfWDtdA/Dkyq+N2rhLIoVu8uFmmeRZp/9DTRRN8c8tC4Ve8df
	7sOyD22S4VJUindiGMwPCkVkgvb9h2boQfbdlB+f9UNVXvMpdOzgnrw4PJ7xEwD7VIIlgGTgnWUfO
	lRLR4sx17JHx94NVc1UqhRRXJ1qkJHgt8m2TmI9QqZJx4B+cxChHkmQvYGaVHGoMrF2sZNQeSdflc
	lNmEq3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR8Y-00000000QVU-295v;
	Thu, 16 Jul 2026 18:48:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR8V-00000000QUi-3OT4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 18:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784227722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k90VREcyUMcR/OGuKj3U3g7OaZ/zXu0WG1tLumtRQ8E=;
	b=WxuWjJ0G4EKXtHEM0S5925dJEeneFsNy/EEreYYwAQGpXRbQURY6V7kpBMk/8Ya6KbBSo2
	ZS3L7snwivR8vadnHX3BZkIiCyEVFBLyGQA9UTnqrC3NkbcV2kKcpzqHeyknQYAaLNtSm7
	uRqTfPggtBLRjXylHgCjZ2g27+BQlfQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-hS14IuVJMB2oZwZ33cr--w-1; Thu, 16 Jul 2026 14:48:40 -0400
X-MC-Unique: hS14IuVJMB2oZwZ33cr--w-1
X-Mimecast-MFC-AGG-ID: hS14IuVJMB2oZwZ33cr--w_1784227720
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec3314f65fso121153166d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 11:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227720; x=1784832520;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k90VREcyUMcR/OGuKj3U3g7OaZ/zXu0WG1tLumtRQ8E=;
        b=MZEYxdbDDtjFUGtdug/VJJDdjz1bKQuG4VMEyUS3f7La3j7lLvrLZv37PeuzgXb6pi
         jqftZkQVjMDBtT9dYsDEpdfM3BFszs/Stz1jR5aaBzBtUfDwMGwXUoVuPhetTmBgTWTn
         LEr6FIBTqkKGocWBjmPjgvMo52CCWFF/THSHdQUlKTKAK8uOq98JqdNUE5+D2DqA35cL
         gdnFPlTojblNCOZ+uIeN/H1zOB95og0RJduiBhoqxLiI/3Xk3KtwxvaMpo9NDBZmVA5J
         CuOQJrnPV7eJkTMfUomSSwlTclSm7M9Q0Ul3t5Mpn7yhKzi6BC2f6e8gP0FDWQ61i5Kg
         n/6A==
X-Forwarded-Encrypted: i=1; AHgh+RqmKH8nX2QNAG4FjvRGO/yMz+RcpDAre6oQt+Otu/vgTeuNCw3iR6U4evk22pfkBvZiU9+rMvS9rqevZvu+QlxR@lists.infradead.org
X-Gm-Message-State: AOJu0YxNfPsowWoCpP0lM23P3g4bTCbYwmf1KfU+it3MdYH8tsU1Du7j
	xbx0ozaDU41C0PH2E9Ju1gSk2QLuKmpTq/V9evQVMx2dLiV1g70L8+2cAWWJEkrC0SEGJmnKWw3
	w3MaQjRsa6yDnyBiHi2heW6OImZyjVlKFm5WxKRAfltd1XoXyCoGk4/vMYVUsXWwiJDfBRY0xRb
	H+
X-Gm-Gg: AfdE7cnzZqL4Km8BHwOq2I4A0y4vIkuyLHevs3X985a0MheB0zFTmcCNM5XkR3/QhA/
	tQzAPGVhyFQ+CPPl2dmBzWB8BzVhw2dM3HxcTkA2QJSY6NfS+HDSrxYN3JYLfyRlpAd1CRSbHTE
	rnaN/rtBw15A034/XQurHEsvwSmC/WyOQZQlW2aATfAm9XYprjoeE56bQeT+WnzXZ0fxOlx3A99
	LIFejpXicRKxX5l/m9XHi+g8+MF2Y03/I6DWMRb5dGtHb4E1fdB7MHLkxaOXZNau+UJQcui6Il+
	Ncwjvw8T0sEdSyv7KjsK1jFLJ6vKZyfDs63TWv5zNrapj7CZrAEikHTvHfvzVPL0ywyP40FAeMP
	ILYsogPKHOHZVmAcFXv+QXNTibV2Y6jFMzmc=
X-Received: by 2002:a05:620a:1a14:b0:92e:e569:dc20 with SMTP id af79cd13be357-930962abddbmr924062085a.78.1784227720199;
        Thu, 16 Jul 2026 11:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1a14:b0:92e:e569:dc20 with SMTP id af79cd13be357-930962abddbmr924057085a.78.1784227719524;
        Thu, 16 Jul 2026 11:48:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf9d9bsm2074490485a.28.2026.07.16.11.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:48:38 -0700 (PDT)
Date: Thu, 16 Jul 2026 14:48:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/4] clk: en7523: add support for dedicated PCIe
 PERSTOUT reset
Message-ID: <alkng6IIkInZjxqA@redhat.com>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
 <20260714115848.8537-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260714115848.8537-3-ansuelsmth@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pYk5rhlyFRatnQf7BmqbnfQitjC1ERxPwyn5r6YBCkE_1784227720
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_114843_926717_3DB9F6C6 
X-CRM114-Status: GOOD (  26.08  )
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

Hi Christian,

On Tue, Jul 14, 2026 at 01:58:44PM +0200, Christian Marangi wrote:
> Add support for resetting the PCIe lines with the PERSTOUT reset. These
> special reset are controlled by the PCIC register and are specific to each
> of the 3 PCIe lines.
> 
> Notice that reset logic is inverted for these bit where 0 is assert and 1
> deassert. This is intenrally handled in the reset function.

s/intenrally/internally/

The "these bit" above is awkward as well. Sorry I don't have a
suggestion offhand, but I see what you mean below based on the code.

> 
> PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
> reset handling.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d3..c9b21d9bf2f3 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -338,6 +338,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  static const u16 en7581_rst_ofs[] = {
>  	REG_RST_CTRL2,
>  	REG_RST_CTRL1,
> +	REG_NP_SCU_PCIC,
>  };
>  
>  static const u16 en751221_rst_ofs[] = {
> @@ -450,6 +451,11 @@ static const u16 en7581_rst_map[] = {
>  	[EN7581_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
>  	[EN7581_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
>  	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
> +
> +	/* RST_PCIC */
> +	[EN7581_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
> +	[EN7581_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
> +	[EN7581_PCIC_PERSTOUT2_RST]	= 2 * RST_NR_PER_BANK + 16,
>  };
>  
>  static const u16 en751221_rst_map[] = {
> @@ -635,9 +641,7 @@ static int en7581_pci_enable(struct clk_hw *hw)
>  	void __iomem *np_base = cg->base;
>  	u32 val, mask;
>  
> -	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
> -	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> -	       REG_PCI_CONTROL_PERSTOUT;
> +	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
>  	val = readl(np_base + REG_PCI_CONTROL);
>  	writel(val | mask, np_base + REG_PCI_CONTROL);
>  
> @@ -650,9 +654,7 @@ static void en7581_pci_disable(struct clk_hw *hw)
>  	void __iomem *np_base = cg->base;
>  	u32 val, mask;
>  
> -	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
> -	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> -	       REG_PCI_CONTROL_PERSTOUT;
> +	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
>  	val = readl(np_base + REG_PCI_CONTROL);
>  	writel(val & ~mask, np_base + REG_PCI_CONTROL);
>  	usleep_range(1000, 2000);
> @@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
>  	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
> -	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +	void __iomem *addr = rst_data->base + offset;
> +	bool inverted = false;
>  	u32 val;
>  
> +	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/

Add space before end of comment.

> +	if (offset == REG_NP_SCU_PCIC)
> +		inverted = true;
> +
>  	val = readl(addr);
> +	val &= ~BIT(id % RST_NR_PER_BANK);
>  	if (assert)
> -		val |= BIT(id % RST_NR_PER_BANK);
> +		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
>  	else
> -		val &= ~BIT(id % RST_NR_PER_BANK);
> +		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;

Could you do:

    if (assert ^ inverted)

Then keep the existing logic for val inside the if/else?



>  	writel(val, addr);
>  
>  	return 0;
> @@ -783,9 +792,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
>  			       unsigned long id)
>  {
>  	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
> -	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +	void __iomem *addr = rst_data->base + offset;
> +	bool inverted = false;
> +	u32 val;
> +
> +	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/

Add space before */

Brian


