Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31AEE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfIG31bng2HxoyJWuXm1aKqR+Q5i5Ik2oXWCciq8hzg=; b=3q07cNz3yWM+Jcw+1P4u238TdC
	Geq6ZirpTzIb1WNf02Ld0HjICTQ9OoQzru6R6dwCBr7ou8Q28Ezpu66Jrj8mqjIZ8QW94+8CBfAgc
	pQBOZ+wV8UbzpwQoWb+EEJ8fqWKY0CRmMX/0rQa+nM4lBccFxwm703yLb5T32mE0rucvu7RCqFKon
	f4OPcLI4hivEFJBSRLQJC7YA7dfumxuTKp+h82EkFOPJDnAxAgR2f0SiHh3ffSkphqqUizjjB0IaW
	OYRt7oTMvjicCGjr6fVb+GM2SZ0mcBHtXTonHJIz8CRj176SlGzkGKTIusHsUoQJQyJQr4UXPtgiW
	sku3B6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD94-00000005nYn-2ap9;
	Tue, 07 Jan 2025 17:13:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCjb-00000005hUO-3AGN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:47:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43635796b48so95511565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 08:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736268434; x=1736873234; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfIG31bng2HxoyJWuXm1aKqR+Q5i5Ik2oXWCciq8hzg=;
        b=up+r7l6vVzJ91gcGhrFJAOjtnbtzC3sMXGvR7jNV8Y34IzlZuPxc7aHCpH28mnFPQi
         Dy6nHBSbj6lC060mJkeRCA39OYq3SwcjWNhUnLYk7opXbiyGy0UJAhkMnZ+DEMXyEXzc
         1ewjNiM2Ikywtako6BHpzzhnpyTorjm4QvNCTrmBNkRYdg2M8HdUgub7Y/24J2lN6aqg
         eetPr8bXUHZgoRYjwLx+gOTd6hjLvaRa26hfQ8zo0ARVwciWF0uBYjRMqhdElmlp71eY
         YgM23/yGBZ/siFfZfPsw0B/5b47rQehZ7N3/VcW5J0dW7M7x3SunxT9g6kYBRCZka8Ak
         PHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268434; x=1736873234;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfIG31bng2HxoyJWuXm1aKqR+Q5i5Ik2oXWCciq8hzg=;
        b=pu8Z5pu2Pa5r/1PpmGy3nBOXH2q3E5pkOiBV9GdBwNzRt6PKTefGKGNsW4GielznAs
         G6MeRYPbSLBOVHV1Q7/P2U/W9Yd/J303davbfeXf/INdxvA7n7dabme5h4wTUJL/7FM+
         EU3QT3uKwcoHKvoDiRCfgbwxkgdSq5/Yok8kqcd5dx8FjoUDoDwDJvOtiLwIW6K8CDBf
         HhsC+D/xK45l4FANtxID/89v3tmRSmajV+03mb+U0i9vjLqUv3gplKjrSEUGVubUcoH8
         iBtbAut3Xmmg41lmNN2ueRCTD9l+n+zDjMQlrpsVCV6bBldvIG+SJa77SC8RYR06nCjC
         S6Og==
X-Forwarded-Encrypted: i=1; AJvYcCV9X58+QWfhypiaIhcGsLKDbFVU0vJFEdNvyzXWb+I8PqIKKVd4MRPRvV5/N10JgmYu9Twr62mls/hzwNwcDxDI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6KA9WIXx/48VWrbMzhDI0GzOPFYX3IPxNJeNfIYu/HnrzKHeY
	KwVB0rEmlNV/RQ3kiDlmqX41S7GlXyC07WfexU5uZ46aaC+m8Iylsdfvzcsn2vM=
X-Gm-Gg: ASbGnculbkRuyMk7MOvDaTijwit5YcydW979oylp9+1A450PPxbA6jHRJv5/4znVQOX
	q4XQu6/AY2mqTplpIuWTWiHeMoY31kAyQ1iPznPaeYReaiZE88iAdtfUXnGHAd7SPJsDi2RM6BI
	7Mfm3fdE623l1kxOB3XTuoypLmJIjIK/X1jP9QqwNl8mDcR4MovEffL++KgDx4b3ajzy/2C3XPW
	jx/Tg82tBii0V5c4NFX8/O9k+ajDC8mOt++A9caUoOgnhqNIBeyJg7j
X-Google-Smtp-Source: AGHT+IGmQTKGo+jGOC4/fXhjIYb21MrLqy9TVlZ6yFYHitFQZAEUoZmuJBC1Ro0j7d1OAph9GOuU3g==
X-Received: by 2002:a05:600c:3494:b0:434:e69c:d338 with SMTP id 5b1f17b1804b1-436dc1dd4b0mr30072175e9.5.1736268433736;
        Tue, 07 Jan 2025 08:47:13 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:834b:735a:a2e8:9e7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm630609295e9.12.2025.01.07.08.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:47:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Bartosz Golaszewski
 <brgl@bgdev.pl>,  xianwei.zhao@amlogic.com,  linux-gpio@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux
 propertity in DTS file
In-Reply-To: <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com> (Xianwei
	Zhao via's message of "Thu, 26 Dec 2024 15:57:42 +0800")
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
	<20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 07 Jan 2025 17:47:12 +0100
Message-ID: <1jed1ea7vz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_084716_059899_C871FF86 
X-CRM114-Status: GOOD (  27.22  )
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

On Thu 26 Dec 2024 at 15:57, Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> When describing pin mux func through pinmux propertity,
> a standard API is added for support. The pinmux contains pin
> identification and mux values, which can include multiple
> pins. And groups configuration use other word. DTS such as:
>
> func-name {
> 	group_alias: group-name{
> 		pinmux= <pin_id << 8 | mux_value)>,
> 			<pin_id << 8 | mux_value)>;

This representation does not seem very generic but more tailored to
your use-case.

> 		bias-pull-up;
> 		drive-strength-microamp = <4000>;

If you want to add pinmux (aka alternate function) selection as a
pinconf prop then I think there should be a single pinmux setting per
group, and as many groups as you need per function defined.

something like

func-foo {
	group-a {
        	groups = "pin_a", "pin_b";
                bias-pull-up;
                alternate-function = <2>;
        };

	group-b {
        	groups = "pin_c"";
                bias-disable;
                alternate-function = <5>;
        };
};

Something similar is already done to handle different pin bias requirement
on single function on amlogic platforms:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-axg.dtsi?h=v6.13-rc6#n421


> 	};
> };
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pinctrl/pinconf-generic.c       | 130 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/pinconf.h               |   4 +
>  include/linux/pinctrl/pinconf-generic.h |   4 +
>  3 files changed, 138 insertions(+)
>
> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
> index 0b13d7f17b32..a4d3c12a80c4 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -233,6 +233,67 @@ static void parse_dt_cfg(struct device_node *np,
>  	}
>  }
>  
> +/**
> + * pinconf_generic_parse_dt_pinmux()
> + * parse the pinmux properties into generic pin mux values.
> + * @np: node containing the pinmux properties
> + * @pctldev: pincontrol device
> + * @pid: array with pin identity entries
> + * @pmux: array with pin mux value entries
> + * @npins: number of pins
> + *
> + * pinmux propertity: mux value [0,7]bits and pin identity [8,31]bits.
> + */
> +int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
> +				    unsigned int **pid, unsigned int **pmux,
> +				    unsigned int *npins)
> +{
> +	unsigned int *pid_t;
> +	unsigned int *pmux_t;
> +	struct property *prop;
> +	unsigned int npins_t, i;
> +	u32 value;
> +	int ret;
> +
> +	prop = of_find_property(np, "pinmux", NULL);
> +	if (!prop) {
> +		dev_info(dev, "Missing pinmux property\n");
> +		return -ENOENT;
> +	}
> +
> +	if (!pid || !pmux || !npins) {
> +		dev_err(dev, "paramers error\n");
> +		return -EINVAL;
> +	}
> +
> +	npins_t = prop->length / sizeof(u32);
> +	pid_t = devm_kcalloc(dev, npins_t, sizeof(*pid_t), GFP_KERNEL);
> +	pmux_t = devm_kcalloc(dev, npins_t, sizeof(*pmux_t), GFP_KERNEL);
> +	if (!pid_t || !pmux_t) {
> +		dev_err(dev, "kalloc memory fail\n");
> +		return -ENOMEM;
> +	}
> +	for (i = 0; i < npins_t; i++) {
> +		ret = of_property_read_u32_index(np, "pinmux", i, &value);
> +		if (ret) {
> +			dev_err(dev, "get pinmux value fail\n");
> +			goto exit;
> +		}
> +		pmux_t[i] = value & 0xff;
> +		pid_t[i] = (value >> 8) & 0xffffff;
> +	}
> +	*pid = pid_t;
> +	*pmux = pmux_t;
> +	*npins = npins_t;
> +
> +	return 0;
> +exit:
> +	devm_kfree(dev, pid_t);
> +	devm_kfree(dev, pmux_t);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_pinmux);
> +
>  /**
>   * pinconf_generic_parse_dt_config()
>   * parse the config properties into generic pinconfig values.
> @@ -295,6 +356,75 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
>  
> +int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
> +					  struct device_node *np,
> +					  struct pinctrl_map **map,
> +					  unsigned int *num_maps)
> +{
> +	struct device *dev = pctldev->dev;
> +	struct device_node *pnode;
> +	unsigned long *configs = NULL;
> +	unsigned int num_configs = 0;
> +	struct property *prop;
> +	unsigned int reserved_maps;
> +	int reserve;
> +	int ret;
> +
> +	prop = of_find_property(np, "pinmux", NULL);
> +	if (!prop) {
> +		dev_info(dev, "Missing pinmux property\n");
> +		return -ENOENT;
> +	}
> +
> +	pnode = of_get_parent(np);
> +	if (!pnode) {
> +		dev_info(dev, "Missing function node\n");
> +		return -EINVAL;
> +	}
> +
> +	reserved_maps = 0;
> +	*map = NULL;
> +	*num_maps = 0;
> +
> +	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
> +					      &num_configs);
> +	if (ret < 0) {
> +		dev_err(dev, "%pOF: could not parse node property\n", np);
> +		return ret;
> +	}
> +
> +	reserve = 1;
> +	if (num_configs)
> +		reserve++;
> +
> +	ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps,
> +					num_maps, reserve);
> +	if (ret < 0)
> +		goto exit;
> +
> +	ret = pinctrl_utils_add_map_mux(pctldev, map,
> +					&reserved_maps, num_maps, np->name,
> +					pnode->name);
> +	if (ret < 0)
> +		goto exit;
> +
> +	if (num_configs) {
> +		ret = pinctrl_utils_add_map_configs(pctldev, map, &reserved_maps,
> +						    num_maps, np->name, configs,
> +						    num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
> +		if (ret < 0)
> +			goto exit;
> +	}
> +
> +exit:
> +	kfree(configs);
> +	if (ret)
> +		pinctrl_utils_free_map(pctldev, *map, *num_maps);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pinconf_generic_dt_node_to_map_pinmux);
> +
>  int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  		struct device_node *np, struct pinctrl_map **map,
>  		unsigned int *reserved_maps, unsigned int *num_maps,
> diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> index a14c950bc700..a171195b3615 100644
> --- a/drivers/pinctrl/pinconf.h
> +++ b/drivers/pinctrl/pinconf.h
> @@ -138,4 +138,8 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
>  				    struct pinctrl_dev *pctldev,
>  				    unsigned long **configs,
>  				    unsigned int *nconfigs);
> +
> +int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
> +				    unsigned int **pid, unsigned int **pmux,
> +				    unsigned int *npins);
>  #endif
> diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
> index 53cfde98433d..1bcf071b860e 100644
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@ -232,4 +232,8 @@ static inline int pinconf_generic_dt_node_to_map_all(struct pinctrl_dev *pctldev
>  			PIN_MAP_TYPE_INVALID);
>  }
>  
> +int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
> +					  struct device_node *np,
> +					  struct pinctrl_map **map,
> +					  unsigned int *num_maps);
>  #endif /* __LINUX_PINCTRL_PINCONF_GENERIC_H */

-- 
Jerome

