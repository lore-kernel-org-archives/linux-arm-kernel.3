Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9A9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1tz7BJRUwJXSa3Suo3gJKXsFFPCsySj/Okq0VxzRW4=; b=0w2eOeOOindXgcSUuesyBxzNC7
	3btqj2r7u9VvbCKgVWzb4ddHYogeeiDhOsBAi7bjsAWQVK6Hxnu5vh7WGnejfgE1jI5ZBGKiqXkcr
	gKYexnoZj8RkKC/ih5EpL69kf5BIXP2c5jU+Izlo5tyXE/GoRNRieYn/p3EU3vXVm8wWN1BCH1VG/
	7rAbshCeJI0lOqADh9sdMvJXyNYpfIEMktlUhRP1eCovon1VMaJfF3gZtKHWyPbypYZPJl75IgtKQ
	zsI+huVSSbGSTGmZxOuBHRuXl3WABAVRxWPjgabTfvK0s/Ic0Jpa0k0y0QwLWa2w42/9ya+xjQ1ok
	mw7TUVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYyE-0000000DqLd-1Gjf;
	Tue, 17 Dec 2024 14:54:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYwj-0000000Dq0t-1cyK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:53:15 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2729432f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 06:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734447192; x=1735051992; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1tz7BJRUwJXSa3Suo3gJKXsFFPCsySj/Okq0VxzRW4=;
        b=gB2YJ/L4BjXTf8cOM60X9mFeGx4NhSNnZuXZSsE3lBP/Ik9e6qTOvkuCs1VOM2NL9P
         L9m84VLYfJWFGkPIWR+H7X6XiAzttz193rPqWMTCpBrGj4x70qZxyuWoOn/QVlEekCTj
         b7OZymL9jk0/ddXp+8bbO0oSc5+F12bngOwyF+uIGzRGjW8KpSZ//1dR0tfU5vKu0t0b
         DD50++KDMzKxLpPa+Nx/Y3EpHSW7xPzGlBM5kdUkaTIDeo4Q31eP6M65GqXujgxJVI73
         wnqRbEl9nYIV7EXSqIXyG56WCYkY18xXCfV9E/DnFuuEIKnvpWJg+04tTx3wTmx5aVrI
         adzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734447192; x=1735051992;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j1tz7BJRUwJXSa3Suo3gJKXsFFPCsySj/Okq0VxzRW4=;
        b=N05Ym4qR+4VKNupC3LaboZqG7CzLT1IF9WsH/ItmDkZbkODaA83bBT6dOydul653Cj
         8N7Fm70fZWOclSvqphCI1JYz2ffA3dMFDebpEmGmHd7XDURxPhe7Ccr9VXjBmQSLEVPY
         TN7OMQwzKly7ctU9aRz+x1BJZbhyRAsH6Y9BXWPwjGhTNEM0qQtni+CjE3rzii4MquvC
         TMJDjH0mK5Jkmgbju0l9OgAnJv+wToO728Kja7A2d6gybECQlng0dFxciv1PZATes+dl
         eVMioCm8+FD5NPeycDY/4YXCdgJxhFheRXuXKIupRlXzN1o6yaYvRSc91A37c8EbHzFG
         ii8w==
X-Forwarded-Encrypted: i=1; AJvYcCWx+cHbxe0ktDuKU6uoM8AkWoLiC7Jjvr0KHf5hGT+0EKwoNPGoFDzLwqe7HHpTo66xnPYDGdDdXFZahYAidCh2@lists.infradead.org
X-Gm-Message-State: AOJu0YzE9DjmtTsSwehSVNN31ZDLVlQtm8GbqgVHPKVqTbcdCBiCSwGq
	OgbGp72MVsZbewZMQqatMXNnr9kqb4qpaefslLKHfinPco7YNNKfqQSo1P8jdus=
X-Gm-Gg: ASbGncs2qzzQg4AzaYgPCMFML9+MOCf+2fTVttNRCy4g7ehT+RW7g3a3vfaMTpSf6Yv
	VpJ4KWxQUvXuEhUUu0svNinR7Ys0JC8DrM+XmUCdnUvMsKVqjnK2L/8E5mShODZXwIBnvzGhdq/
	+9sF2bo5hpDaKRgCC0pROId0QN0ukslJSSgvuOpImeOXo5veVn6gnG96Jm8QIn4179RVDWd9Vta
	NkW0/4UGnR1DzpuxyJSn8L08I8U3bXuGsK+KobVDjRRH6orTMWJvNFK+Lt0QY54GkFEKHPV6ZDY
	lqi4HbTdXBPB4F7da6ensa8/NXdvNT4=
X-Google-Smtp-Source: AGHT+IG5GTGpPbAS3DHo+ja0XGeUh4sbl11Qq10hVbOptwLvXE2zJoBNLuQgiep+WuXjibhAmUjEng==
X-Received: by 2002:a05:6000:1544:b0:385:f060:b7fc with SMTP id ffacd0b85a97d-388da3a1286mr3600391f8f.25.1734447191589;
        Tue, 17 Dec 2024 06:53:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:167:46b9:e709:12b5? ([2a01:e0a:982:cbb0:167:46b9:e709:12b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8012105sm11290506f8f.16.2024.12.17.06.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 06:53:11 -0800 (PST)
Message-ID: <168829c7-fd56-4fd2-80b0-07c768779559@linaro.org>
Date: Tue, 17 Dec 2024 15:53:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: Linus Walleij <linus.walleij@linaro.org>, xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
 <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_065313_427374_CA7EC9F7 
X-CRM114-Status: GOOD (  30.07  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 17/12/2024 15:49, Linus Walleij wrote:
> Hi Xianwei,
> 
> thanks for your patch!
> 
> On Wed, Dec 11, 2024 at 7:48 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> 
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add a new pinctrl driver for Amlogic SoCs. All future Amlogic
>> SoCs pinctrl drives use this, such A4, A5, S6, S7 etc. To support
>> new Amlogic SoCs, only need to add the corresponding dts file.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> First: are we sure these new SoCs have nothing in common
> with sunxi? Because then the sunxi code should be reused.
> 
> In any way I recommend:
> 
> - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
>    so we keep this sorted by actual vendor, sunxi is apparently
>    yours (AMlogic:s) isn't it?

Sunxi is Allwinner SoCs.

Neil

> 
> - Also fix MAINTAINERS accordingly.
> 
> - Add new driver under drivers/pinctrl/amlogic
> 
> - Do not change the Kconfig symbols for sunxi and
>    we should be fine.
> 
>> +static int aml_dt_node_to_map(struct pinctrl_dev *pctldev,
>> +                             struct device_node *np,
>> +                             struct pinctrl_map **map,
>> +                             unsigned int *num_maps)
>> +{
>> +       struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
>> +       const struct aml_pctl_group *grp;
>> +       struct device *dev = info->dev;
>> +       struct pinctrl_map *new_map;
>> +       struct device_node *parent;
>> +       int map_num, i;
>> +
>> +       grp = aml_pctl_find_group_by_name(info, np->name);
>> +       if (!grp) {
>> +               dev_err(dev, "unable to find group for node %pOFn\n", np);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (grp->num_configs)
>> +               map_num = grp->npins + 1;
>> +       else
>> +               map_num = 1;
>> +       new_map = devm_kcalloc(dev, map_num, sizeof(*new_map), GFP_KERNEL);
>> +       if (!new_map)
>> +               return -ENOMEM;
>> +
>> +       parent = of_get_parent(np);
>> +       if (!parent) {
>> +               devm_kfree(dev, new_map);
>> +               return -EINVAL;
>> +       }
>> +
>> +       *map = new_map;
>> +       *num_maps = map_num;
>> +       new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
>> +       new_map[0].data.mux.function = parent->name;
>> +       new_map[0].data.mux.group = np->name;
>> +       of_node_put(parent);
>> +
>> +       if (grp->num_configs) {
>> +               new_map++;
>> +               for (i = 0; i < grp->npins; i++) {
>> +                       new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
>> +                       new_map[i].data.configs.group_or_pin =
>> +                               pin_get_name(pctldev, grp->pins[i]);
>> +                       new_map[i].data.configs.configs = grp->configs;
>> +                       new_map[i].data.configs.num_configs = grp->num_configs;
>> +               }
>> +       }
>> +
>> +       dev_info(dev, "maps: function %s group %s num %d\n",
>> +                (*map)->data.mux.function, grp->name, map_num);
>> +
>> +       return 0;
>> +}
>> +
>> +static void aml_dt_free_map(struct pinctrl_dev *pctldev,
>> +                           struct pinctrl_map *map, unsigned int num_maps)
>> +{
>> +}
>> +
>> +static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
>> +                            unsigned int offset)
>> +{
>> +       seq_printf(s, " %s", dev_name(pcdev->dev));
>> +}
>> +
>> +static const struct pinctrl_ops aml_pctrl_ops = {
>> +       .get_groups_count       = aml_get_groups_count,
>> +       .get_group_name         = aml_get_group_name,
>> +       .get_group_pins         = aml_get_group_pins,
>> +       .dt_node_to_map         = aml_dt_node_to_map,
>> +       .dt_free_map            = aml_dt_free_map,
>> +       .pin_dbg_show           = aml_pin_dbg_show,
>> +};
>> +
>> +static int aml_pctl_dt_calculate_pin(struct aml_pinctrl *info,
>> +                                    unsigned int bank_idx, unsigned int offset)
>> +{
>> +       struct aml_gpio_bank *bank;
>> +       int retval = -EINVAL;
>> +       int i;
>> +
>> +       for (i = 0; i < info->nbanks; i++) {
>> +               bank = &info->banks[i];
>> +               if (bank->bank_idx == bank_idx) {
>> +                       if (offset < bank->gpio_chip.ngpio)
>> +                               retval = bank->pin_base + offset;
>> +                       break;
>> +               }
>> +       }
>> +       if (retval == -EINVAL)
>> +               dev_err(info->dev, "pin [bank:%d, offset:%d] is not present\n", bank_idx, offset);
>> +
>> +       return retval;
>> +}
>> +
>> +static int aml_pctl_dt_parse_groups(struct device_node *np,
>> +                                   struct aml_pctl_group *grp,
>> +                                   struct aml_pinctrl *info, int idx)
>> +{
>> +       struct device *dev = info->dev;
>> +       struct aml_pinconf *conf;
>> +       struct property *of_pins;
>> +       unsigned int bank_idx;
>> +       unsigned int offset, npins;
>> +       int i = 0;
>> +       int ret;
>> +
>> +       of_pins = of_find_property(np, "pinmux", NULL);
>> +       if (!of_pins) {
>> +               dev_info(dev, "Missing pinmux property\n");
>> +               return -ENOENT;
>> +       }
>> +
>> +       npins = of_pins->length / sizeof(u32);
>> +       grp->npins = npins;
>> +       grp->name = np->name;
>> +       grp->pins = devm_kcalloc(dev, npins, sizeof(*grp->pins), GFP_KERNEL);
>> +       grp->pin_conf = devm_kcalloc(dev, npins, sizeof(*grp->pin_conf), GFP_KERNEL);
>> +
>> +       if (!grp->pins || !grp->pin_conf)
>> +               return -ENOMEM;
>> +
>> +       ret = pinconf_generic_parse_dt_config(np, info->pctl, &grp->configs,
>> +                                             &grp->num_configs);
> 
> But can't you just move this code around? grp->num_configs give the
> number of configs, so why do you have to go and look up pinmux
> above, can't you just use grp->num_configs instead of of_pins
> and npins above?
> 
>> +static int aml_pctl_parse_functions(struct device_node *np,
>> +                                   struct aml_pinctrl *info, u32 index,
>> +                                   int *grp_index)
>> +{
>> +       struct device *dev = info->dev;
>> +       struct aml_pmx_func *func;
>> +       struct aml_pctl_group *grp;
>> +       int ret, i;
>> +
>> +       func = &info->functions[index];
>> +       func->name = np->name;
>> +       func->ngroups = of_get_child_count(np);
>> +       if (func->ngroups == 0)
>> +               return dev_err_probe(dev, -EINVAL, "No groups defined\n");
>> +
>> +       func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups), GFP_KERNEL);
>> +       if (!func->groups)
>> +               return -ENOMEM;
>> +
>> +       i = 0;
>> +       for_each_child_of_node_scoped(np, child) {
>> +               func->groups[i] = child->name;
>> +               grp = &info->groups[*grp_index];
>> +               *grp_index += 1;
>> +               ret = aml_pctl_dt_parse_groups(child, grp, info, i++);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +       dev_info(dev, "Function[%d\t name:%s,\tgroups:%d]\n", index, func->name, func->ngroups);
>> +
>> +       return 0;
>> +}
>> +
>> +static u32 aml_bank_pins(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "npins", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
>> +
>> +static u32 aml_bank_reg_gpio_offset(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "reg-gpio-offset", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
>> +
>> +static u32 aml_bank_reg_mux_offset(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "reg-mux-offset", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
>> +
>> +static u32 aml_bank_bit_mux_offset(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "bit-mux-offset", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
>> +
>> +static u32 aml_bank_index(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "bank-index", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
> 
> Do we really need helpers for all of this? Can't you just
> open code it, at least if it's just used in one place?
> 
>> +static unsigned int aml_count_pins(struct device_node *np)
>> +{
>> +       struct device_node *child;
>> +       unsigned int pins = 0;
>> +
>> +       for_each_child_of_node(np, child) {
>> +               if (of_property_read_bool(child, "gpio-controller"))
>> +                       pins += aml_bank_pins(child);
>> +       }
>> +
>> +       return pins;
>> +}
>> +
>> +static void aml_pctl_dt_child_count(struct aml_pinctrl *info,
>> +                                   struct device_node *np)
>> +{
>> +       struct device_node *child;
>> +
>> +       for_each_child_of_node(np, child) {
>> +               if (of_property_read_bool(child, "gpio-controller")) {
>> +                       info->nbanks++;
>> +               } else {
>> +                       info->nfunctions++;
>> +                       info->ngroups += of_get_child_count(child);
>> +               }
>> +       }
>> +}
> 
> This looks like a weird dependency between gpio chips and
> pins that I don't quite understand. Some comments and
> references to the bindings will be needed so it is clear
> what is going on.
> 
>> +static struct regmap *aml_map_resource(struct aml_pinctrl *info,
>> +                                      struct device_node *node, char *name)
>> +{
>> +       struct resource res;
>> +       void __iomem *base;
>> +       int i;
>> +
>> +       i = of_property_match_string(node, "reg-names", name);
>> +       if (of_address_to_resource(node, i, &res))
>> +               return NULL;
>> +
>> +       base = devm_ioremap_resource(info->dev, &res);
>> +       if (IS_ERR(base))
>> +               return ERR_CAST(base);
> 
> This looks like reimplementation of
> devm_platform_ioremap_resource_byname(), can't you just
> pass your platform device here?
> 
>> +static int aml_pctl_probe_dt(struct platform_device *pdev,
>> +                            struct pinctrl_desc *pctl_desc,
>> +                            struct aml_pinctrl *info)
> 
> Because there is clearly a platform device involved.
> 
> I guess I will have more comments as the series progress, but this
> is a good starting point!
> 
> Yours,
> Linus Walleij


