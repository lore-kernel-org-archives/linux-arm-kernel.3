Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7704C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZQrdGR+xmrmuCDrTSgiiPo+g13NAGpahm31NYw4FtY=; b=OUcAlSegP7EW3Qq+mpl8YGz8Mm
	AtRa+7yREaATJrMMMKLezXV9FLfBOIATHH8VcRlAzsL9hPtxAhHm1FKoJHmNUgUs3cT2+X2v97eDC
	Q3oIY+JxPI4Gc0GpR5o4/F4ixBC8p8fda8NIac01zgOPSP8b6ddzRrLaMxT30bJPp1a3Cb/OxCjjo
	jScaeeoM3XudZXZN63AwZO32d0j8ChWUaiMFDkOwaso+mVnd41s0kgcUCXN7IDhivkgfDdgEmWJxo
	sTPIgalGmjegvIVm1XbR6y/+5x4VzDfjVJSQPvWOW8jlrmiIoZ0PjFlignQEcwVWiwkP8womUrzhY
	JwmF0qmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuQ3-00000005h0m-1F3F;
	Wed, 02 Apr 2025 09:29:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuJ5-00000005fna-0gbG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:22:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso325837f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 02:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743585765; x=1744190565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZQrdGR+xmrmuCDrTSgiiPo+g13NAGpahm31NYw4FtY=;
        b=c93G+22G2CWvNJRG9QjMjW/2Sn6kPeKFV+Dd4LecfXoJPgGAcmc9ynuYExXmyezQvc
         CiZ3MujQRda3eCpoB8ajFsus2H2GXhpgTKx3NYRE+VAcCY/KZsjps+CVvVMVQxS1aphw
         h2GGnnRY0ne1u22TF9WRM3SU+HZdaXOA8GFEnbOGMp/blMAHDKjpoBx9E6TdCM8h5GDT
         tMrtGgRVjAau/8Pz7+Ms8u7kiBSyaxdXcR4AMg+SkyQkxJTH1cLsP9ChojcjbkcZTOJl
         Zxf9JDQB43/GPIJ/mLF0jUQLdeQVSqa7RTshL/kTuxq4/pwursekPD/WYPS5Gl7RZXKe
         Zy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585765; x=1744190565;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pZQrdGR+xmrmuCDrTSgiiPo+g13NAGpahm31NYw4FtY=;
        b=gXzJ5OxoBNqsi7iL5ME2LYxRd0jY02drTJRl8pJhd+aOT/cFVG48A3jxTkOzC1DVYM
         Kb0h2cJL3Cde/v7kvpyjQNbqFXRk1djUZPFjz4MYdSWtkSdsUFrsqEHQnxq0P4KfLfCh
         g5BU6gUC1Sz94BvxrsCs+QvNfiLwWgsDLnoqJgmDucoDQOJ3eYpG3O5o4oFMLSRyyZBg
         SRMbKqqKqXdOACl77uOCeb5HkPdOyiGWJOVNIERxfWKZhPL5v4QBl2Luv2crv+KxOzFt
         BQ6ZSMX34v7bB8YA81/ZtCypvkYB1qTsovgjhA3/phCAlDTVbYt0uFM20xG/go9wHaHT
         fvBw==
X-Gm-Message-State: AOJu0Ywkv4mcm+QMuUW6vZ4Y+ZaWJMFdXHCY64bz8mi2xvowQpwR4fn5
	dF7cOpXGm4M8eqF1IIXULeV1c49ax8kXvSVO2l8w4/fyPxEEnxajNAbUPO/Xb/Ku5Ah9ig9BF+i
	M
X-Gm-Gg: ASbGnctV2ufTOHTTRhq0Z0kB+5+xKBzLCi1y37+ii8os0Tx3jpG+jZOoRUu5fCwDoHt
	IM/LK/BsfQUVR53HXzgekh0XQ20fpXsOV5HKHhfSuZogbD8yybkqrSgEJW40c1nf52A+1Sp+gfW
	2nIbbE4Uy2EaAgI0VnAdFkV0iXuNJLda+dN/R9rZ8SCFAW1X9HXfTNni3XjHkyu9zdGVI9eM0QI
	0kKf9DRCCNlUvB4Q4kTuq3ykkVfqDOF0+0+nr9tbokjQokUMz6g5fVGYn0ePKTmC93zVXd/weJ0
	T36OBM9ou3C5ypSdedUXoArwWXzF7U94P10iDf7kjwikRp/d+yajQVnkzbZljFnkkkrnsA5wQFN
	ouOD+mKlui6dCkViJkTSaRQ==
X-Google-Smtp-Source: AGHT+IFL4TgZbnJRCkpEk7VNctRay9zuto9OvdQQZuc5ZPiTz4kCQOL2utBV6/RBKCvEDMHBgFdmwQ==
X-Received: by 2002:a05:6000:22c4:b0:391:9b2:f496 with SMTP id ffacd0b85a97d-39c2a35c589mr1172758f8f.16.1743585764935;
        Wed, 02 Apr 2025 02:22:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca59:43e0:210c:afcf? ([2a01:e0a:3d9:2080:ca59:43e0:210c:afcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0ddeecc9sm15149440f8f.83.2025.04.02.02.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 02:22:44 -0700 (PDT)
Message-ID: <fe647204-0827-4bf5-8355-80d7e1b6685f@linaro.org>
Date: Wed, 2 Apr 2025 11:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize the memory size of
 clk-measure
To: Chuan Liu <chuan.liu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
 <774d1a84-cc35-418d-9a84-867888b843da@linaro.org>
 <57355917-8191-451e-b297-d5a9c50749d9@amlogic.com>
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
In-Reply-To: <57355917-8191-451e-b297-d5a9c50749d9@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_022247_202581_14BF9E59 
X-CRM114-Status: GOOD (  18.51  )
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
On 02/04/2025 10:50, Chuan Liu wrote:
> hi Neil:
> 
> Friendly ping: This patch has been approved in review but hasn't been applied yet. Has it been overlooked?😉

Sorry forgot to queue it, doing it right now,

Neil

> 
> 
> On 2/10/2025 5:50 PM, Neil Armstrong wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 05/02/2025 08:58, Chuan Liu via B4 Relay wrote:
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> Drop "CLK_MSR_MAX" and replace it with adding a member "msr_count" in
>>> the structure to specify the count of msr_id.
>>>
>>> Mark the table of msr_id as const.
>>>
>>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>>> ---
>>> The number of msr_ids for each chip is inconsistent. Defining a
>>> fixed-size array for each chip to store msr_ids would waste memory.
>>> ---
>>> Changes in v2:
>>> - Discard the global variable and restore the "priv" member in the
>>> "struct meson_msr_id".
>>> - Mark msr_id_table as const.
>>> - Link to v1: https://lore.kernel.org/r/20250123-optimize_memory_size_of_clk_measure-v1-1-06aa6a01ff37@amlogic.com
>>> ---
>>>   drivers/soc/amlogic/meson-clk-measure.c | 86 ++++++++++++++++++++++++---------
>>>   1 file changed, 62 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
>>> index a6453ffeb753..39638d6a593c 100644
>>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>>> @@ -33,23 +33,26 @@ static DEFINE_MUTEX(measure_lock);
>>>   #define DIV_STEP            32
>>>   #define DIV_MAX                     640
>>>
>>> -#define CLK_MSR_MAX          128
>>> -
>>>   struct meson_msr_id {
>>>       struct meson_msr *priv;
>>>       unsigned int id;
>>>       const char *name;
>>>   };
>>>
>>> +struct meson_msr_data {
>>> +     struct meson_msr_id *msr_table;
>>> +     unsigned int msr_count;
>>> +};
>>> +
>>>   struct meson_msr {
>>>       struct regmap *regmap;
>>> -     struct meson_msr_id msr_table[CLK_MSR_MAX];
>>> +     struct meson_msr_data data;
>>>   };
>>>
>>>   #define CLK_MSR_ID(__id, __name) \
>>>       [__id] = {.id = __id, .name = __name,}
>>>
>>> -static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
>>> +static const struct meson_msr_id clk_msr_m8[] = {
>>>       CLK_MSR_ID(0, "ring_osc_out_ee0"),
>>>       CLK_MSR_ID(1, "ring_osc_out_ee1"),
>>>       CLK_MSR_ID(2, "ring_osc_out_ee2"),
>>> @@ -98,7 +101,7 @@ static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
>>>       CLK_MSR_ID(63, "mipi_csi_cfg"),
>>>   };
>>>
>>> -static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
>>> +static const struct meson_msr_id clk_msr_gx[] = {
>>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>>> @@ -168,7 +171,7 @@ static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
>>>       CLK_MSR_ID(82, "ge2d"),
>>>   };
>>>
>>> -static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
>>> +static const struct meson_msr_id clk_msr_axg[] = {
>>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>>> @@ -242,7 +245,7 @@ static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
>>>       CLK_MSR_ID(109, "audio_locker_in"),
>>>   };
>>>
>>> -static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
>>> +static const struct meson_msr_id clk_msr_g12a[] = {
>>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>>> @@ -358,7 +361,7 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
>>>       CLK_MSR_ID(122, "audio_pdm_dclk"),
>>>   };
>>>
>>> -static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
>>> +static const struct meson_msr_id clk_msr_sm1[] = {
>>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>>> @@ -489,7 +492,7 @@ static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
>>>   };
>>>
>>>   static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>>> -                            unsigned int duration)
>>> +                         unsigned int duration)
>>>   {
>>>       struct meson_msr *priv = clk_msr_id->priv;
>>>       unsigned int val;
>>> @@ -573,13 +576,14 @@ DEFINE_SHOW_ATTRIBUTE(clk_msr);
>>>   static int clk_msr_summary_show(struct seq_file *s, void *data)
>>>   {
>>>       struct meson_msr_id *msr_table = s->private;
>>> +     unsigned int msr_count = msr_table->priv->data.msr_count;
>>>       unsigned int precision = 0;
>>>       int val, i;
>>>
>>>       seq_puts(s, "  clock                     rate precision\n");
>>>       seq_puts(s, "---------------------------------------------\n");
>>>
>>> -     for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
>>> +     for (i = 0 ; i < msr_count ; ++i) {
>>>               if (!msr_table[i].name)
>>>                       continue;
>>>
>>> @@ -604,7 +608,7 @@ static const struct regmap_config meson_clk_msr_regmap_config = {
>>>
>>>   static int meson_msr_probe(struct platform_device *pdev)
>>>   {
>>> -     const struct meson_msr_id *match_data;
>>> +     const struct meson_msr_data *match_data;
>>>       struct meson_msr *priv;
>>>       struct dentry *root, *clks;
>>>       void __iomem *base;
>>> @@ -621,7 +625,16 @@ static int meson_msr_probe(struct platform_device *pdev)
>>>               return -ENODEV;
>>>       }
>>>
>>> -     memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
>>> +     priv->data.msr_table = devm_kcalloc(&pdev->dev,
>>> + match_data->msr_count,
>>> +                                         sizeof(struct meson_msr_id),
>>> +                                         GFP_KERNEL);
>>> +     if (!priv->data.msr_table)
>>> +             return -ENOMEM;
>>> +
>>> +     memcpy(priv->data.msr_table, match_data->msr_table,
>>> +            match_data->msr_count * sizeof(struct meson_msr_id));
>>> +     priv->data.msr_count = match_data->msr_count;
>>>
>>>       base = devm_platform_ioremap_resource(pdev, 0);
>>>       if (IS_ERR(base))
>>> @@ -636,45 +649,70 @@ static int meson_msr_probe(struct platform_device *pdev)
>>>       clks = debugfs_create_dir("clks", root);
>>>
>>>       debugfs_create_file("measure_summary", 0444, root,
>>> -                         priv->msr_table, &clk_msr_summary_fops);
>>> +                         priv->data.msr_table, &clk_msr_summary_fops);
>>>
>>> -     for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
>>> -             if (!priv->msr_table[i].name)
>>> +     for (i = 0 ; i < priv->data.msr_count ; ++i) {
>>> +             if (!priv->data.msr_table[i].name)
>>>                       continue;
>>>
>>> -             priv->msr_table[i].priv = priv;
>>> +             priv->data.msr_table[i].priv = priv;
>>>
>>> -             debugfs_create_file(priv->msr_table[i].name, 0444, clks,
>>> -                                 &priv->msr_table[i], &clk_msr_fops);
>>> + debugfs_create_file(priv->data.msr_table[i].name, 0444, clks,
>>> + &priv->data.msr_table[i], &clk_msr_fops);
>>>       }
>>>
>>>       return 0;
>>>   }
>>>
>>> +static const struct meson_msr_data clk_msr_gx_data = {
>>> +     .msr_table = (void *)clk_msr_gx,
>>> +     .msr_count = ARRAY_SIZE(clk_msr_gx),
>>> +};
>>> +
>>> +static const struct meson_msr_data clk_msr_m8_data = {
>>> +     .msr_table = (void *)clk_msr_m8,
>>> +     .msr_count = ARRAY_SIZE(clk_msr_m8),
>>> +};
>>> +
>>> +static const struct meson_msr_data clk_msr_axg_data = {
>>> +     .msr_table = (void *)clk_msr_axg,
>>> +     .msr_count = ARRAY_SIZE(clk_msr_axg),
>>> +};
>>> +
>>> +static const struct meson_msr_data clk_msr_g12a_data = {
>>> +     .msr_table = (void *)clk_msr_g12a,
>>> +     .msr_count = ARRAY_SIZE(clk_msr_g12a),
>>> +};
>>> +
>>> +static const struct meson_msr_data clk_msr_sm1_data = {
>>> +     .msr_table = (void *)clk_msr_sm1,
>>> +     .msr_count = ARRAY_SIZE(clk_msr_sm1),
>>> +};
>>> +
>>>   static const struct of_device_id meson_msr_match_table[] = {
>>>       {
>>>               .compatible = "amlogic,meson-gx-clk-measure",
>>> -             .data = (void *)clk_msr_gx,
>>> +             .data = &clk_msr_gx_data,
>>>       },
>>>       {
>>>               .compatible = "amlogic,meson8-clk-measure",
>>> -             .data = (void *)clk_msr_m8,
>>> +             .data = &clk_msr_m8_data,
>>>       },
>>>       {
>>>               .compatible = "amlogic,meson8b-clk-measure",
>>> -             .data = (void *)clk_msr_m8,
>>> +             .data = &clk_msr_m8_data,
>>>       },
>>>       {
>>>               .compatible = "amlogic,meson-axg-clk-measure",
>>> -             .data = (void *)clk_msr_axg,
>>> +             .data = &clk_msr_axg_data,
>>>       },
>>>       {
>>>               .compatible = "amlogic,meson-g12a-clk-measure",
>>> -             .data = (void *)clk_msr_g12a,
>>> +             .data = &clk_msr_g12a_data,
>>>       },
>>>       {
>>>               .compatible = "amlogic,meson-sm1-clk-measure",
>>> -             .data = (void *)clk_msr_sm1,
>>> +             .data = &clk_msr_sm1_data,
>>>       },
>>>       { /* sentinel */ }
>>>   };
>>>
>>> ---
>>> base-commit: 1e1fd26ed4ca05cc1f0e5857918da4dd54967f7d
>>> change-id: 20250123-optimize_memory_size_of_clk_measure-f9c40e815794
>>>
>>> Best regards,
>>
>> Looks fine, thanks !!!
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


