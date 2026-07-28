Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4EDC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkiuYMKfTZUCAQyXJDsyAYrYbc3+oqsrPiHuKHrbdH4=; b=TFW7Br/pg8FZhFqL6KKWt97BDg
	7ssG0D4XJIh4kynGU/zTnTwokOh69PO5d7c5NJyic5H4VmRNKBAJ/S9jWGfJ2yD+K6s7v+7oLNJi1
	lHaZi14H0VhCJi9M4eVAlsJG/eJUBHxR3RfjJmV16hn0ABLerwJ0UdncZnQgFI5DIBCd/pL5yPayY
	KkB6fuO/9+KBEJDs6pHErefthvqCnQEg9GLxxQEj1J4PU2u0DsLBZClgtzlLPQC2xVpnky+dFd6Oy
	G3GWStH4Aw4dUBWYJuCFVOv5zEAZlE0BjG34CjZm1tRmlJeaaDamog+8nYse9QfjBqzfPmuZUfO9q
	luxPmGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woi4V-00000005NXq-41LL;
	Tue, 28 Jul 2026 13:42:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woi4T-00000005NX5-2pjL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 13:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785246132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkiuYMKfTZUCAQyXJDsyAYrYbc3+oqsrPiHuKHrbdH4=;
	b=Cos++RpNFJaS8FQ05BZeyFDCeSTJeE5m5uG00yb1vu2yx140eF6A0t8OGWsaoIEE4kZqZZ
	WKO886/Ku2++cSlX+Fm75W2Pd/BRPdVVuxFvz6W2ySHnebnOG6PWAlxZq/7ElVHxCHxXVQ
	1+R1vQsVKh1r3JhRFZGD2yaKhsJ6QUM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-QQJQdGBpNz2S2vy_p58TBA-1; Tue, 28 Jul 2026 09:42:11 -0400
X-MC-Unique: QQJQdGBpNz2S2vy_p58TBA-1
X-Mimecast-MFC-AGG-ID: QQJQdGBpNz2S2vy_p58TBA_1785246131
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f45dde7595so47514436d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 06:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246130; x=1785850930;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zkiuYMKfTZUCAQyXJDsyAYrYbc3+oqsrPiHuKHrbdH4=;
        b=pzwPO89wwokJuMmeutSKHs3yRZHarUkCzhDBGStZpR0kzPoSYBx7s9319737L3M0+a
         SMBVRLIn4NxTNC8ykrIgwjZe9e85PY2xsmYpgJiOfMJcdJEKpEvf6t5DNfrK0pK5lEnw
         gbS8oFkWB/7GtBMpXIWin6gF422iIClQkCvHJFE63rMBDr4G7wGf7VIOLpnLLuvNoRBK
         GHFXtGUhjAKeQFd/LRA8N9d8hDcS3GjzZo+mcWfV7IYBeL4RzI7zaqwSNPweoydwBN4q
         Cd0gr4oWDDVSaU+jbqAGS55IKkScfTpst/ndMIDL0bdhHlKyJQDMh971rAqAHanAmNzD
         xQbg==
X-Forwarded-Encrypted: i=1; AHgh+RrOzQfZtRd8T2VS3A8ZQ0lyolWSq4meBXfetm4ed6tsQoc9i4ywWqvO4XiJ31/6TBvIoYgMknbL59Peg/4tXeS6@lists.infradead.org
X-Gm-Message-State: AOJu0Yym55lnNRFXJuHv7jxU2TQsGOQKGLvRrSfUU9bidMaFMIm9HEE9
	uNGfHkZe5PrWEOF4nNYd/XZFt4QTWIit0uV5+kOcZP8dxlaCt+flzoqpTLZsc3grxVxX6cPEXBz
	m8aqqlNXeYSHRt2bWKwNBx2vbj2gGHZtDhne5qm9smTFEvznF1xTX0E8AwhhJmXtKTiFslPiVsx
	pW
X-Gm-Gg: AR+sD11FHu/Ce/eSr8LT3/9bDDo/7nAOKw0d6mYg775cxPI1Vw/dK9ZBqnblpXaet70
	CgO4ZlNxPsnt/fjOwn1P56TwVGdfwNcksWmk3MjhVpxHYapZvTEZ8F6zeA4Jl7/TxUTdZ7HMd1p
	yCwr6mvmEq/YEVLhu26h91FCD2ABmF2tYCq65xMBWQBZpJ5wYAI+DPGnE1XBEPXGUCVELOKsrbB
	vAeq88uygKvy2vS5xsAfQG080l/6eor+yublDHDVj0KhS78gFLy8jM/U9l6ZvQIy74PLyN3rbkl
	gLRjSPJxOVZgvnU0WySORE1janHqK2soQuCwce1/vHMnuUGxd0TkO9UBp1/STtHLErCML1IWsAY
	uI6lZdx7+BrzbU5K0gbpRKx1DkpGbYKMtmYw=
X-Received: by 2002:a05:6214:5545:b0:8e8:7de7:ec20 with SMTP id 6a1803df08f44-90816f640a7mr25742586d6.4.1785246130277;
        Tue, 28 Jul 2026 06:42:10 -0700 (PDT)
X-Received: by 2002:a05:6214:5545:b0:8e8:7de7:ec20 with SMTP id 6a1803df08f44-90816f640a7mr25741856d6.4.1785246129549;
        Tue, 28 Jul 2026 06:42:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e86d499dsm87767676d6.42.2026.07.28.06.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:42:07 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:42:06 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 06/12] clk: zte: Add regmap-based clocks
Message-ID: <amixrkffNj_JuXtU@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3njjfpe6NCT_ZzouCFlF-eCSTND4G44kyXbitIhb538_1785246131
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_064213_799013_BADCCDCA 
X-CRM114-Status: GOOD (  30.62  )
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

On Mon, Jul 27, 2026 at 09:24:21PM +0300, Stefan Dösinger wrote:
> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
> 
> I see that numerous clock drivers have their own incarnation of regmap-
> based mux/div/gate clocks. If there is any version of it that is likely
> to be elevated to shared code like clk-gate.c I'll copy that and try to
> use it as unmodified as possible.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.
> 
> Version 6: Remove stray regmap (Sashiko)
> 
> Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
> ---
>  drivers/clk/zte/clk-regmap.c | 218 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 215 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
> index 984abeb45ab2..671b81bcda4d 100644
> --- a/drivers/clk/zte/clk-regmap.c
> +++ b/drivers/clk/zte/clk-regmap.c
> @@ -7,28 +7,240 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/container_of.h>
>  #include <linux/device.h>
>  #include <linux/regmap.h>
> +#include <linux/types.h>
>  #include <linux/errno.h>
> +#include <linux/bits.h>
> +#include <linux/err.h>
>  
>  #include "clk-zx.h"
>  
> +struct zte_clk_regmap {
> +	struct clk_hw	hw;
> +	struct regmap	*map;
> +	u16		reg;
> +	u8		shift;
> +	u8		size;
> +};
> +
> +static inline struct zte_clk_regmap *to_zte_clk_regmap(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct zte_clk_regmap, hw);
> +}
> +
> +static int zte_clk_regmap_gate_enable(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	return regmap_set_bits(clk->map, clk->reg, BIT(clk->shift));
> +}
> +
> +static void zte_clk_regmap_gate_disable(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	regmap_clear_bits(clk->map, clk->reg, BIT(clk->shift));
> +}
> +
> +static int zte_clk_regmap_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	return regmap_test_bits(clk->map, clk->reg, BIT(clk->shift));
> +}
> +
> +static const struct clk_ops zte_clk_regmap_gate_ops = {
> +	.enable		= zte_clk_regmap_gate_enable,
> +	.disable	= zte_clk_regmap_gate_disable,
> +	.is_enabled	= zte_clk_regmap_gate_is_enabled,
> +};
> +
>  int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
>  			  const struct zx_gate_desc *desc, unsigned int num,
>  			  struct clk_hw_onecell_data *clocks)
>  {
> -	return -ENODEV;
> +	struct zte_clk_regmap *clk;
> +	unsigned int i;
> +	int res;
> +
> +	for (i = 0; i < num; ++i) {
> +		struct clk_init_data init = {};
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		init.name = desc[i].name;
> +		init.ops = &zte_clk_regmap_gate_ops;
> +		init.parent_names = &desc[i].parent;
> +		init.num_parents = 1;
> +		init.flags = CLK_SET_RATE_PARENT | desc[i].flags;
> +		clk->hw.init = &init;
> +		clk->map = regmap;
> +		clk->reg = desc[i].reg;
> +		clk->shift = desc[i].shift;
> +		clk->size = 1;
> +
> +		res = devm_clk_hw_register(dev, &clk->hw);
> +		if (res)
> +			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
> +
> +		if (desc[i].id != ZX297520V3_CLK_NO_EXPORT)
> +			clocks->hws[desc[i].id] = &clk->hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
> +						    unsigned long prate)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(clk->map, clk->reg, &val);
> +	if (ret)
> +		/* Gives a hint that something is wrong */
> +		return 0;
> +
> +	val >>= clk->shift;
> +	val &= clk_div_mask(clk->size);
> +	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);

Newline before the return

> +}
> +
> +static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	return divider_determine_rate(hw, req, NULL, clk->size, 0);
> +}
> +
> +static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +				       unsigned long parent_rate)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = (unsigned int)ret << clk->shift;
> +	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
>  }
>  
> +static const struct clk_ops zte_clk_regmap_divider_ops = {
> +	.recalc_rate = zte_clk_regmap_div_recalc_rate,
> +	.determine_rate = zte_clk_regmap_div_determine_rate,
> +	.set_rate = zte_clk_regmap_div_set_rate,
> +};
> +
>  int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
>  			     const struct zx_div_desc *desc, unsigned int num)
>  {
> -	return -ENODEV;
> +	struct zte_clk_regmap *clk;
> +	unsigned int i;
> +	int res;
> +
> +	for (i = 0; i < num; ++i) {
> +		struct clk_init_data init = {};
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		init.name = desc[i].name;
> +		init.ops = &zte_clk_regmap_divider_ops;
> +		init.parent_names = &desc[i].parent;

Use parent_data instead of parent_names

> +		init.num_parents = 1;
> +		init.flags = CLK_SET_RATE_PARENT;
> +		clk->hw.init = &init;
> +		clk->map = regmap;
> +		clk->reg = desc[i].reg;
> +		clk->shift = desc[i].shift;
> +		clk->size = desc[i].size;
> +
> +		res = devm_clk_hw_register(dev, &clk->hw);
> +		if (res)
> +			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
> +	}
> +
> +	return 0;
>  }
>  
> +static u8 zte_clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(clk->map, clk->reg, &val);
> +	if (ret)
> +		return 0xff;
> +
> +	val >>= clk->shift;
> +	val &= GENMASK(clk->size - 1, 0);
> +	return clk_mux_val_to_index(hw, NULL, 0, val);
> +}
> +
> +static int zte_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val = clk_mux_index_to_val(NULL, 0, index);
> +
> +	return regmap_update_bits(clk->map, clk->reg,
> +				  GENMASK(clk->size - 1, 0) << clk->shift,
> +				  val << clk->shift);
> +}
> +
> +static int zte_clk_regmap_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	return clk_mux_determine_rate_flags(hw, req, 0);
> +}
> +
> +static const struct clk_ops zte_clk_regmap_mux_ops = {
> +	.get_parent = zte_clk_regmap_mux_get_parent,
> +	.set_parent = zte_clk_regmap_mux_set_parent,
> +	.determine_rate = zte_clk_regmap_mux_determine_rate,
> +};
> +
>  int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
>  			  const struct zx_mux_desc *desc, unsigned int num,
>  			  struct clk_hw_onecell_data *clocks)
>  {
> -	return -ENODEV;
> +	struct zte_clk_regmap *clk;
> +	unsigned int i;
> +	int res;
> +
> +	for (i = 0; i < num; ++i) {
> +		struct clk_init_data init = {};
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		init.name = desc[i].name;
> +		init.ops = &zte_clk_regmap_mux_ops;
> +		init.parent_names = desc[i].parents;

Use parent_data instead of parent_names

Brian


