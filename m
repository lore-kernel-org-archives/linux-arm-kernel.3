Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0D2C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjxr0DWMFDYRX+nr+frdmAXuPqrd6N6eH3MNM9mRgUs=; b=GpwNKRLUvGs0tcs/PaOwonhNWa
	u1A3vKrcUxuJw/nVVZyaczeKwKpw+Hk4vD0oLH/zZn1IIv0LE/kCRmpVG3141ijiQ9KW6l9/HTPjn
	lxNGZuI9RnNsqK469IaI9c+Iq+1JZwQhnMX+m9248695RpVTWQpQhlgqrShNJMUgwjKgoLrwmvZya
	6cVpXiaADdzZYXFIIC0v0DOEKCvjNNawAQLWupi2NjgcPN6idK1s0ljaEna3Q7fL97FL8KGhHcIdu
	r9ubREohxj+28ZRrCHWm+BXTKm1PLt0LUsWOYBAcJr6oAlmdUQmxDsMOIckOjJHKL3ZqPxg+s+7aM
	DwEvPcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAjY-00000006pCs-1yty;
	Tue, 24 Jun 2025 20:59:12 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5fv-000000068Xq-2bXR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:35:08 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso11496093a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750779306; x=1751384106; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjxr0DWMFDYRX+nr+frdmAXuPqrd6N6eH3MNM9mRgUs=;
        b=bveV8ItkF0cR7H7sRJAQPF/vRTT8mXU0YhampTFL5BPgHRBzil3sxxjg+uBU7mR5J7
         lDUdxA3nrFAjLJYuPpP4aO19bPvTguIws2am418zgIGt3wCnXrLF+BRWJvBdaUpWzEnA
         TJb89p+7p/861DeMz+qSVC3PTveUed25JrxeLUxkoneAlLpAEazUBZ5F3OlZ6EAUJgzk
         YLGFRGIKA1XUousKQq6rOujS6pUSQXi4spjG+Q2Lj4rh5kIdNWYSmvQJ6spd2Z0l6r1b
         cVMJ/MHCz2HHooiV1jlcuf4rj5non8d2XWVCtGwiEtwxotlDn4BxIs80AFngV3GYSOHu
         yl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750779306; x=1751384106;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjxr0DWMFDYRX+nr+frdmAXuPqrd6N6eH3MNM9mRgUs=;
        b=qJktuV8D1EG9SNh8V+IlrukK+NBOldw+NsG2rN578btpglutQfkpjFV5cfv5qcb3M7
         a0R/V45ha3mKStgKyuw2GAg45KVlvJo2mqc/wrJOxTAs2fVdIMni21lsgrgR/HPZp8PQ
         qRfqop0F0z+H8NmJo/1u0IHgE5CMzCfNps0zrAnzl3iZUMkAP9XvivPQbJ6yeY8hgjD6
         GhYi15tEgxXII12msXHNfVbvzGPBTWLmp8ED+bnr0kE/zI5y6cscxQKcX7B0zF2mkQgc
         LtmMJvFHHAPjAMJT5nrQr3yuyuhL0CYDbNmdA73TQiveDMuyMZKeOUIxkCUOMBkU4LIJ
         eg0w==
X-Forwarded-Encrypted: i=1; AJvYcCUDu/aXj4SIMwv0wH7wtuTltv0drIzRkupMs7ogyIh6FzgeXpEXjafGVa+Df7uT+5hqKaXMItvql6zQbg+5BAN0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs1U0D+9nQhryBnbNpSOW5O4ZZhGDI8eaMekRxhQ3XImb/bf/9
	eb44nylkfCnrng3jywUpwsbhyP47HUjLtYiOxDD3/PLKu8hx/MjI55mA4oqL0w==
X-Gm-Gg: ASbGnctmDGpsO50vJc22WGcM51x22pBSVfh4tybci5+U091E2x7+/0nekKQ3NuIlzlT
	7iwYvNnuhW8Ec2SgkYXckWstSr0aqlvvvgAsuEtEfDr9HwfVgbQgH79/8h8eAdGevI3SiPEZuX2
	uQBgGaPLVDdytaH3cAoHuaihVKkri3k6BveTctHDV6OEhKgAmhLaUk/HYxtPGpvmJRA/v1zRHxC
	oL5a+rar+lGT2lglsuPOwaI6V/yN1GADWkSm3qD11/px8lQdCicU+hTBmQPmE96KMOtLnUHPmjp
	RpUVVRO8zqca5m/JMDYtMPBjjsOoGsdfEYHbEKMfj3UqH4ho04CaC8q+QyaI8KcmIewF
X-Google-Smtp-Source: AGHT+IFMf6c08eRNogrQBTupf94hSj3WK35oGshLvdYZh9ALEZnOXrZJBqFGAgxlC8Ri8V449wZhGA==
X-Received: by 2002:a17:907:7f1f:b0:ae0:ba6f:35b9 with SMTP id a640c23a62f3a-ae0ba6f393dmr79982366b.28.1750779305215;
        Tue, 24 Jun 2025 08:35:05 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0540833fasm902150766b.103.2025.06.24.08.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:35:04 -0700 (PDT)
Message-ID: <42fdeee8-a23e-4499-83c6-77d50418cff2@gmail.com>
Date: Tue, 24 Jun 2025 18:34:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open "list:GPIO"
 "SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)"
 <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-16-demonsingur@gmail.com>
 <aFpnU8EHGt14UMHC@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aFpnU8EHGt14UMHC@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_083507_681128_18881A52 
X-CRM114-Status: GOOD (  41.31  )
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


On 6/24/25 11:52 AM, Sakari Ailus wrote:
 > Hi Cosmin,
 >
 > Thanks for the set.
 >
 > This patch is pretty massive. Could you split it into the serialiser and
 > deserialiser frameworks and then invididual drivers using it (six-ish
 > patches in total)?
 >

I'll try to split it up for easier review, thanks.

I'll strip some of the context so I can answer easier.

The comments I stripped out are things I'll do without discussion.

...

 >> +struct max9296a_chip_info {
 >> +	unsigned int max_register;
 >> +	unsigned int versions;
 >> +	unsigned int modes;
 >> +	unsigned int num_pipes;
 >> +	unsigned int pipe_hw_ids[MAX9296A_PIPES_NUM];
 >> +	unsigned int phy_hw_ids[MAX9296A_PHYS_NUM];
 >> +	unsigned int num_phys;
 >> +	unsigned int num_links;
 >> +	struct max_phys_configs phys_configs;
 >> +	bool use_atr;
 >> +	bool has_per_link_reset;
 >> +	bool phy0_lanes_0_1_on_second_phy;
 >> +	bool polarity_on_physical_lanes;
 >> +	bool needs_single_link_version;
 >> +	bool needs_unique_stream_id;
 >> +	bool supports_cphy;
 >> +	bool supports_phy_log;
 >> +	bool adjust_rlms;
 >> +	bool fix_tx_ids;
 >> +
 >> +	enum max_gmsl_mode tpg_mode;
 >> +
 >> +	int (*set_pipe_stream_id)(struct max_des *des, struct max_des_pipe 
*pipe,
 >> +				  unsigned int stream_id);
 >> +	int (*set_pipe_enable)(struct max_des *des, struct max_des_pipe *pipe,
 >> +			       bool enable);
 >> +	int (*set_pipe_link)(struct max_des *des, struct max_des_pipe *pipe,
 >> +			     struct max_des_link *link);
 >> +	int (*set_pipe_tunnel_phy)(struct max_des *des, struct 
max_des_pipe *pipe,
 >> +				   struct max_des_phy *phy);
 >> +	int (*set_pipe_tunnel_enable)(struct max_des *des, struct 
max_des_pipe *pipe,
 >> +				      bool enable);
 >
 > Given this many callbacks, having an operations struct for them seems
 > appropriate.
 >

Are you proposing adding another struct just to put these ops inside?

What I could do is use the existing struct max_des_ops and assign the
appropriate members in it, and then put whatever is left that's not
needed for the common framework in struct max9296a_chip_info, and add
a pointer to the struct max_des_ops instance it struct
max9296a_chip_info.

...

 >> +static int max9296a_log_phy_status(struct max_des *des,
 >> +				   struct max_des_phy *phy, const char *name)
 >> +{
 >> +	struct max9296a_priv *priv = des_to_priv(des);
 >> +	unsigned int index = phy->index;
 >> +	unsigned int val;
 >> +	int ret;
 >> +
 >> +	if (!priv->info->supports_phy_log)
 >> +		return 0;
 >> +
 >> +	ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY18, &val);
 >> +	if (ret)
 >> +		return ret;
 >> +
 >> +	pr_info("%s: \tcsi2_pkt_cnt: %lu\n", name,
 >> +		field_get(MAX9296A_MIPI_PHY18_CSI2_TX_PKT_CNT(index), val));
 >> +
 >> +	ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY20(index), &val);
 >> +	if (ret)
 >> +		return ret;
 >> +
 >> +	pr_info("%s: \tphy_pkt_cnt: %u\n", name, val);
 >
 > dev_info()?
 >

I initially used pr_info() with the subdev name passed from core
framwork to be consistent with the rest of the prints which use
v4l2_info().

I'll see how using dev_info() looks like, it would be nice if it would
match the v4l2_info() format, even though v4l2-ctl --log-status doesn't
care since all it looks for is `START STATUS`.

 >> +
 >> +	return 0;
 >> +}
 >> +
 >> +static int max9296a_set_enable(struct max_des *des, bool enable)
 >> +{
 >> +	struct max9296a_priv *priv = des_to_priv(des);
 >> +
 >> +	return regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP12,
 >> +				  MAX9296A_BACKTOP12_CSI_OUT_EN, enable);
 >> +}
 >> +
 >> +static int max9296a_init_phy(struct max_des *des, struct 
max_des_phy *phy)
 >> +{
 >> +	struct max9296a_priv *priv = des_to_priv(des);
 >> +	bool is_cphy = phy->bus_type == V4L2_MBUS_CSI2_CPHY;
 >> +	unsigned int num_data_lanes = phy->mipi.num_data_lanes;
 >> +	unsigned int dpll_freq = phy->link_frequency * 2;
 >> +	unsigned int num_hw_data_lanes;
 >> +	unsigned int hw_index = max9296a_phy_id(priv, phy);
 >> +	unsigned int index = phy->index;
 >> +	unsigned int used_data_lanes = 0;
 >> +	unsigned int val;
 >
 > For register values, please use a type that explicitly specifies the 
number
 > of bits, e.g. u32.
 >

I used the type of the argument received by the regmap methods.

...

 >> +static int max9296a_reset_link(struct max9296a_priv *priv, unsigned 
int index)
 >> +{
 >> +	unsigned int reg, mask;
 >> +
 >> +	if (index == 0) {
 >> +		reg = MAX9296A_CTRL0;
 >> +		mask = MAX9296A_CTRL0_RESET_ONESHOT;
 >> +	} else {
 >> +		reg = MAX9296A_CTRL2;
 >> +		mask = MAX9296A_CTRL2_RESET_ONESHOT_B;
 >> +	}
 >
 > I might use an array for this.
 >
 > Is index guaranteed to be 0 or 1?
 >

Should be, yes, but using an array for just two indices would cause a
bit of indirection when looking at the code. If it was more I would have
used one.

 >> +
 >> +	return regmap_set_bits(priv->regmap, reg, mask);
 >> +}
 >> +
 >> +static int max9296a_init_link_rlms(struct max9296a_priv *priv,
 >> +				   struct max_des_link *link)
 >> +{
 >> +	unsigned int index = link->index;
 >> +	int ret;
 >> +
 >> +	/*
 >> +	 * These settings are described as required on datasheet page 53
 >> +	 * for MAX96714.
 >> +	 */
 >> +
 >> +	ret = regmap_write(priv->regmap, MAX9296A_RLMS3E(index), 0xfd);
 >> +	if (ret)
 >> +		return ret;
 >
 > You could also do:
 >
 > 	if (!ret)
 > 		ret = ...;
 >
 > And return ret at the end. It's one line less per call. Up to you.
 >
 >> +
 >> +	ret = regmap_write(priv->regmap, MAX9296A_RLMS3F(index), 0x3d);
 >
 > What are these magic numbers? Could we have human-readable names for 
them?
 >
 > The register names seem pretty opaque, too. Some explanation here would
 > seem reasonable.
 >

They're extracted from the datasheet of MAX96714, the values are
undocumented, but they're necessary to "optimize performance" of the
GMSL link. I'll add a comment stating the datasheet page and section.

...

 >> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c 
b/drivers/media/i2c/maxim-serdes/max_des.c
 >> new file mode 100644
 >> index 000000000000..6a45f42fe033
 >> --- /dev/null
 >> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
 >> @@ -0,0 +1,3108 @@
 >> +// SPDX-License-Identifier: GPL-2.0
 >> +/*
 >> + * Maxim GMSL2 Deserializer Driver
 >
 > How about naming the file maxim-deserialiser? I'd use e.g. "maxim_des"
 > prefix for the functions. Just "max" is quite generic.
 >

max_des seems explicit enough. The max naming comes from the common
prefix in the name of the chips, eg: MAX96724, MAX96717, not from Maxim.

If I intended it to come from maxim, I would have obviously used maxim_,
since that's what vendor-prefixes.yaml specifies.

Although they were initially made by Maxim, Analog Devices bought Maxim,
so using maxim_ would make as much sense as using adi_.

Switching to maxim_ would only lengthen the name of the functions,
types, symbols, macros, etc, and at least register/masks macros are
already extremely long.

...

 >> +static int max_des_parse_src_dt_endpoint(struct max_des_priv *priv,
 >> +					 struct max_des_phy *phy,
 >> +					 struct fwnode_handle *fwnode)
 >> +{
 >> +	struct max_des *des = priv->des;
 >> +	u32 pad = max_des_phy_to_pad(des, phy);
 >> +	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 
V4L2_MBUS_UNKNOWN };
 >> +	struct v4l2_mbus_config_mipi_csi2 *mipi = &v4l2_ep.bus.mipi_csi2;
 >> +	enum v4l2_mbus_type bus_type;
 >> +	struct fwnode_handle *ep;
 >> +	u64 link_frequency;
 >> +	unsigned int i;
 >> +	int ret;
 >> +
 >> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
 >> +	if (!ep)
 >> +		return 0;
 >> +
 >> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &v4l2_ep);
 >> +	fwnode_handle_put(ep);
 >> +	if (ret) {
 >> +		dev_err(priv->dev, "Could not parse endpoint on port %u\n", pad);
 >> +		return ret;
 >> +	}
 >> +
 >> +	bus_type = v4l2_ep.bus_type;
 >> +	if (bus_type != V4L2_MBUS_CSI2_DPHY &&
 >> +	    bus_type != V4L2_MBUS_CSI2_CPHY) {
 >> +		v4l2_fwnode_endpoint_free(&v4l2_ep);
 >> +		dev_err(priv->dev, "Unsupported bus-type %u on port %u\n",
 >> +			pad, bus_type);
 >> +		return -EINVAL;
 >> +	}
 >> +
 >> +	ret = 0;
 >
 > ret is already 0 here.
 >
 >> +	if (v4l2_ep.nr_of_link_frequencies == 0)
 >> +		link_frequency = MAX_DES_LINK_FREQUENCY_DEFAULT;
 >
 > Isn't this required in DT?
 >

Required from a schema standpoint or a code standpoint?

Code:

rval = fwnode_property_count_u64(fwnode, "link-frequencies");
if (rval > 0) {
}

No rval <= 0 case.

And I don't think I made it required in the schema.

...

