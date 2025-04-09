Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1F4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRjvqUTYovkYw+WiUkgsWp2p1ZMUvIdDIVCIeyGbJz0=; b=M1CMv7bS7fV541xxjo9sI4ccLh
	gbMPGh1tGMi6NRy3VEbek1H76IMCCy3te1SqJUs6H2vGC9bZoThp29D11N0hoTf7gBkO+N3yNRbLV
	poJNhpHEMtEzeJY3nPJrKjeKdR0xUzXMAGfhpkpXt2OlOa63RFuRdS5qtja1hXywclN2vNVoFXUH0
	5RQHOHcCQFVWkm5VDpUEMSaz6bh1ODJafTWwF1YpndKsXEq5y3Ek2VOe4t2/4WjHuqPctdj/17Pj5
	iNQ6+okDl/cbsAhUyeR5/rMVrcnw3P51Stm7kJz6KLrDlZ8yGUmiIvUS+dqauP5vTAC8One1r5cDS
	LJu7wTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Uih-00000007B0v-1jSE;
	Wed, 09 Apr 2025 12:39:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ue9-00000007AQM-0S8p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:35:14 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39149bccb69so6305722f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744202111; x=1744806911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRjvqUTYovkYw+WiUkgsWp2p1ZMUvIdDIVCIeyGbJz0=;
        b=ujDspOHwkudoMN3gj6oC/PqXtbI/eex9zwulUlt3fvW/99PQcKG6gh+7asrhGiKqiT
         n4JcsBLBmjUIJPWPcvUEx2TLg+SrCoROBUDnhEMim8y+b/rJrYuzY4WJB8XrnDvxmzZz
         j5CgROz+gujzE5A+LL/lDSUt8rC1QQY+Kv4n+hq2PgeWktpiPy1xR+wJZCv8TNNYuGKv
         c4OB7E3mJSpV5iKf6lmOtPyyn5XV/LB1vj2wMJsiCCuSULhLZOSxhO1jEMS0LIM06ne8
         G3gXfxqFK5VD0Lr1g7XUMnpQm/wx8fbptNyMlwxQdJ9yAqePG2TjQsGsiMczdtZb97M9
         K8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202111; x=1744806911;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tRjvqUTYovkYw+WiUkgsWp2p1ZMUvIdDIVCIeyGbJz0=;
        b=NKTRyBwsdGd0NArT6ecLCurovfy/lT0crUdRKF5UdKrz7UwMwRGh9SnpJY7vMOyRkj
         aYPAnH/tBgkG9/MJE1dMnwoqKboMfMlRmIzddBfEFv58m5G/2Nlnn9CgO3CYCa5ctUGw
         9g1/Ucd0TDngoorjZ+4m2L1CN4t1lP+YEcCUbPlaSPetlqvrkGXrUSWNEyOvw6J1sgfb
         PutrMn/pl6Sc5kf5aEpYPBIYuep+cfHfDDsbzMGLmK+APLJtdDY8gXWU7areo7dA4gNQ
         LxNwYRUquNY3f88OkD7UgY25QH0aKpFIkbvf2AFz4Po35P8umV/dVlqyziAqrjBWydd1
         HIaw==
X-Forwarded-Encrypted: i=1; AJvYcCUQMLWGiSBvr1Lv3aRYN15/lAorfOG+lDUXUMpjO4zFvmuds44SFFaRflKmcN9rPFYNA6ZzeuntnnEBQpW6oahW@lists.infradead.org
X-Gm-Message-State: AOJu0YxT8q+pz9Nq3mb3Ll6WwZfIrBJSbaZ5ff84xT3npqmkL6R71fIC
	qgAbG6PMJ2nOzTHzhR1F6pnWbcE0CykF0KCIES+8MT9dbERLFKo/4xZ3cEiKGfI=
X-Gm-Gg: ASbGncuwQ8v8JJTcy9Xl+EnYJvMEsqhIL9dglZw8hLgd9kyWyRp/clRAXF6+m5X8Pm1
	GxZh+wJLcEUShVRe/vL5aLyLndlcY40wH2zWYMyPtQepKztAV5kCnDmSni0pXsz5c+kRWjlF/sS
	RY1ipatzwUQvwcQzy1wRQ2l+Jov323WcXewBihrjVSdjqRy6oNhAvCSAMMhckDPOLBYE4QTatXG
	LxxrzMwbRpSM/6Ad6m2X9QRn9je019VBow9/sDUo8abPPvVr3LOWAIcNRNo4OzRIAHaCVSBfkN4
	4m1IROPDRiAtry+HBRNLQC9FiJlWHYmG6+1xAJQJqWb26aNtP4SFIkTMrr0lZZ+oNV8Xs46MG7Z
	Gpc2Ek9O64+gYqAP+DA==
X-Google-Smtp-Source: AGHT+IHVsOawwdiJy2sziChP3ExoSdK0tjE96AWxpntKvy2nAzzOPADmcyhSzcjHQtpvTyABGElrQg==
X-Received: by 2002:a05:6000:2486:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39d87aa8211mr2677000f8f.14.1744202110831;
        Wed, 09 Apr 2025 05:35:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:87d9:979a:1261:ab65? ([2a01:e0a:3d9:2080:87d9:979a:1261:ab65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf8fsm1506595f8f.91.2025.04.09.05.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:35:10 -0700 (PDT)
Message-ID: <d9d81cb4-12b4-4db3-becb-4578548986b2@linaro.org>
Date: Wed, 9 Apr 2025 14:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] spi: meson-spicc: add DMA support
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Mark Brown <broonie@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sunny Luo <sunny.luo@amlogic.com>
References: <20250408-spi-dma-v1-1-3c38be62c09c@amlogic.com>
 <c29a8c28-996c-4e94-b0a1-0e4a37f0bebb@linaro.org>
 <aebccc51-14a2-40be-8d9e-20a55ce94459@amlogic.com>
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
In-Reply-To: <aebccc51-14a2-40be-8d9e-20a55ce94459@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_053513_166252_C43320FF 
X-CRM114-Status: GOOD (  31.36  )
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

On 09/04/2025 03:49, Xianwei Zhao wrote:
> Hi Neil,
>     Thanks for your reply.
> 
> On 2025/4/8 15:41, Neil Armstrong wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hi,
>>
>> On 08/04/2025 09:04, Xianwei Zhao via B4 Relay wrote:
>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>> Add DMA support for spicc driver.
>>>
>>> DMA works if the transfer meets the following conditions:
>>> 1. 64 bits per word;
>>> 2. The transfer length must be multiples of the dma_burst_len,
>>>     and the dma_burst_len should be one of 8,7...2,
>>>     otherwise, it will be split into several SPI bursts.
>>>
>>> Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>   drivers/spi/spi-meson-spicc.c | 243 ++++++++++++++++++++++++++++++++++++++++--
>>>   1 file changed, 232 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
>>> index df74ad5060f8..81e263bceba9 100644
>>> --- a/drivers/spi/spi-meson-spicc.c
>>> +++ b/drivers/spi/spi-meson-spicc.c
>>> @@ -21,6 +21,7 @@
>>>   #include <linux/interrupt.h>
>>>   #include <linux/reset.h>
>>>   #include <linux/pinctrl/consumer.h>
>>> +#include <linux/dma-mapping.h>
>>>
>>>   /*
>>>    * The Meson SPICC controller could support DMA based transfers, but is not
>>> @@ -33,6 +34,20 @@
>>>    * - CS management is dumb, and goes UP between every burst, so is really a
>>>    *   "Data Valid" signal than a Chip Select, GPIO link should be used instead
>>>    *   to have a CS go down over the full transfer
>>> + *
>>> + * DMA achieves a transfer with one or more SPI bursts, each SPI burst is made
>>> + * up of one or more DMA bursts. The DMA burst implementation mechanism is,
>>> + * For TX, when the number of words in TXFIFO is less than the preset
>>> + * reading threshold, SPICC starts a reading DMA burst, which reads the preset
>>> + * number of words from TX buffer, then writes them into TXFIFO.
>>> + * For RX, when the number of words in RXFIFO is greater than the preset
>>> + * writing threshold, SPICC starts a writing request burst, which reads the
>>> + * preset number of words from RXFIFO, then write them into RX buffer.
>>> + * DMA works if the transfer meets the following conditions,
>>> + * - 64 bits per word
>>> + * - The transfer length in word must be multiples of the dma_burst_len, and
>>> + *   the dma_burst_len should be one of 8,7...2, otherwise, it will be split
>>> + *   into several SPI bursts by this driver
>>
>> Fine, but then also rephrase the previous paragraph since you're adding DMA.
>>
> Will do.
> 
>> Could you precise on which platform you tested the DMA ?
>>
> 
> aq222(S4)

Will you be able to test on other platforms ?

> 
>>>    */
>>>
>>>   #define SPICC_MAX_BURST     128
>>> @@ -128,6 +143,29 @@
>>>
>>>   #define SPICC_DWADDR        0x24    /* Write Address of DMA */
>>>
>>> +#define SPICC_LD_CNTL0       0x28
>>> +#define VSYNC_IRQ_SRC_SELECT         BIT(0)
>>> +#define DMA_EN_SET_BY_VSYNC          BIT(2)
>>> +#define XCH_EN_SET_BY_VSYNC          BIT(3)
>>> +#define DMA_READ_COUNTER_EN          BIT(4)
>>> +#define DMA_WRITE_COUNTER_EN         BIT(5)
>>> +#define DMA_RADDR_LOAD_BY_VSYNC              BIT(6)
>>> +#define DMA_WADDR_LOAD_BY_VSYNC              BIT(7)
>>> +#define DMA_ADDR_LOAD_FROM_LD_ADDR   BIT(8)
>>> +
>>> +#define SPICC_LD_CNTL1       0x2c
>>> +#define DMA_READ_COUNTER             GENMASK(15, 0)
>>> +#define DMA_WRITE_COUNTER            GENMASK(31, 16)
>>> +#define DMA_BURST_LEN_DEFAULT                8
>>> +#define DMA_BURST_COUNT_MAX          0xffff
>>> +#define SPI_BURST_LEN_MAX    (DMA_BURST_LEN_DEFAULT * DMA_BURST_COUNT_MAX)
>>> +
>>> +enum {
>>> +     DMA_TRIG_NORMAL = 0,
>>> +     DMA_TRIG_VSYNC,
>>> +     DMA_TRIG_LINE_N,
>>
>> You're only using DMA_TRIG_NORMAL, what the other 2 values for ?
>>
> 
> DMA_TRIG_VSYNC and DMA_TRIG_LINE_N are used by VOUT modules in certain partial TV SoCs. These DMA triggering methods rely on special signal lines, and are not supported in this context. I will delete the corresponding information.
> 
>>
>>> +
>>>   #define SPICC_ENH_CTL0      0x38    /* Enhanced Feature */
>>>   #define SPICC_ENH_CLK_CS_DELAY_MASK GENMASK(15, 0)
>>>   #define SPICC_ENH_DATARATE_MASK             GENMASK(23, 16)
>>> @@ -171,6 +209,9 @@ struct meson_spicc_device {
>>>       struct pinctrl                  *pinctrl;
>>>       struct pinctrl_state            *pins_idle_high;
>>>       struct pinctrl_state            *pins_idle_low;
>>> +     dma_addr_t                      tx_dma;
>>> +     dma_addr_t                      rx_dma;
>>> +     bool                            using_dma;
>>>   };
>>>
>>>   #define pow2_clk_to_spicc(_div) container_of(_div, struct meson_spicc_device, pow2_div)
>>> @@ -202,6 +243,155 @@ static void meson_spicc_oen_enable(struct meson_spicc_device *spicc)
>>>       writel_relaxed(conf, spicc->base + SPICC_ENH_CTL0);
>>>   }
>>>
>>> +static int meson_spicc_dma_map(struct meson_spicc_device *spicc,
>>> +                            struct spi_transfer *t)
>>> +{
>>> +     struct device *dev = spicc->host->dev.parent;
>>> +
>>> +     if (!(t->tx_buf && t->rx_buf))
>>> +             return -EINVAL;
>>> +
>>> +     t->tx_dma = dma_map_single(dev, (void *)t->tx_buf, t->len, DMA_TO_DEVICE);
>>> +     if (dma_mapping_error(dev, t->tx_dma))
>>> +             return -ENOMEM;
>>> +
>>> +     t->rx_dma = dma_map_single(dev, t->rx_buf, t->len, DMA_FROM_DEVICE);
>>> +     if (dma_mapping_error(dev, t->rx_dma))
>>> +             return -ENOMEM;
>>> +
>>> +     spicc->tx_dma = t->tx_dma;
>>> +     spicc->rx_dma = t->rx_dma;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void meson_spicc_dma_unmap(struct meson_spicc_device *spicc,
>>> +                               struct spi_transfer *t)
>>> +{
>>> +     struct device *dev = spicc->host->dev.parent;
>>> +
>>> +     if (t->tx_dma)
>>> +             dma_unmap_single(dev, t->tx_dma, t->len, DMA_TO_DEVICE);
>>> +     if (t->rx_dma)
>>> +             dma_unmap_single(dev, t->rx_dma, t->len, DMA_FROM_DEVICE);
>>> +}
>>> +
>>> +/*
>>> + * According to the remain words length, calculate a suitable spi burst length
>>> + * and a dma burst length for current spi burst
>>> + */
>>> +static u32 meson_spicc_calc_dma_len(struct meson_spicc_device *spicc,
>>> +                                 u32 len, u32 *dma_burst_len)
>>> +{
>>> +     u32 i;
>>> +
>>> +     if (len <= spicc->data->fifo_size) {
>>> +             *dma_burst_len = len;
>>> +             return len;
>>> +     }
>>> +
>>> +     *dma_burst_len = DMA_BURST_LEN_DEFAULT;
>>> +
>>> +     if (len == (SPI_BURST_LEN_MAX + 1))
>>> +             return SPI_BURST_LEN_MAX - DMA_BURST_LEN_DEFAULT;
>>> +
>>> +     if (len >= SPI_BURST_LEN_MAX)
>>> +             return SPI_BURST_LEN_MAX;
>>> +
>>> +     for (i = DMA_BURST_LEN_DEFAULT; i > 1; i--)
>>> +             if ((len % i) == 0) {
>>> +                     *dma_burst_len = i;
>>> +                     return len;
>>> +             }
>>> +
>>> +     i = len % DMA_BURST_LEN_DEFAULT;
>>> +     len -= i;
>>> +
>>> +     if (i == 1)
>>> +             len -= DMA_BURST_LEN_DEFAULT;
>>> +
>>> +     return len;
>>> +}
>>> +
>>> +static void meson_spicc_setup_dma(struct meson_spicc_device *spicc, u8 trig)
>>> +{
>>> +     unsigned int len;
>>> +     unsigned int dma_burst_len, dma_burst_count;
>>> +     unsigned int count_en = 0;
>>> +     unsigned int txfifo_thres = 0;
>>> +     unsigned int read_req = 0;
>>> +     unsigned int rxfifo_thres = 31;
>>> +     unsigned int write_req = 0;
>>> +     unsigned int ld_ctr1 = 0;
>>> +
>>> +     writel_relaxed(spicc->tx_dma, spicc->base + SPICC_DRADDR);
>>> +     writel_relaxed(spicc->rx_dma, spicc->base + SPICC_DWADDR);
>>> +
>>> +     /* Set the max burst length to support a transmission with length of
>>> +      * no more than 1024 bytes(128 words), which must use the CS management
>>> +      * because of some strict timing requirements
>>> +      */
>>> +     writel_bits_relaxed(SPICC_BURSTLENGTH_MASK, SPICC_BURSTLENGTH_MASK,
>>> +                         spicc->base + SPICC_CONREG);
>>> +
>>> +     len = meson_spicc_calc_dma_len(spicc, spicc->xfer_remain,
>>> +                                    &dma_burst_len);
>>> +     spicc->xfer_remain -= len;
>>> +     dma_burst_count = DIV_ROUND_UP(len, dma_burst_len);
>>> +     dma_burst_len--;
>>> +
>>> +     if (trig == DMA_TRIG_LINE_N)
>>> +             count_en |= VSYNC_IRQ_SRC_SELECT;
>>
>> Is this the VPU VSYNC irq ? is this a tested and valid usecase ?
>>
> 
> Yes, it is VPU VSYNC irq, This part of the code is not completely. NO tested about it. I will delete it.

Thx

> 
>>> +
>>> +     if (spicc->tx_dma) {
>>> +             spicc->tx_dma += len;
>>> +             count_en |= DMA_READ_COUNTER_EN;
>>> +             if (trig == DMA_TRIG_VSYNC || trig == DMA_TRIG_LINE_N)
>>> +                     count_en |= DMA_RADDR_LOAD_BY_VSYNC
>>> +                                 | DMA_ADDR_LOAD_FROM_LD_ADDR;
>>> +             txfifo_thres = spicc->data->fifo_size - dma_burst_len;
>>> +             read_req = dma_burst_len;
>>> +             ld_ctr1 |= FIELD_PREP(DMA_READ_COUNTER, dma_burst_count);
>>> +     }
>>> +
>>> +     if (spicc->rx_dma) {
>>> +             spicc->rx_dma += len;
>>> +             count_en |= DMA_WRITE_COUNTER_EN;
>>> +             if (trig == DMA_TRIG_VSYNC || trig == DMA_TRIG_LINE_N)
>>> +                     count_en |= DMA_WADDR_LOAD_BY_VSYNC
>>> +                                 | DMA_ADDR_LOAD_FROM_LD_ADDR;
>>> +             rxfifo_thres = dma_burst_len;
>>> +             write_req = dma_burst_len;
>>> +             ld_ctr1 |= FIELD_PREP(DMA_WRITE_COUNTER, dma_burst_count);
>>> +     }
>>> +
>>> +     writel_relaxed(count_en, spicc->base + SPICC_LD_CNTL0);
>>> +     writel_relaxed(ld_ctr1, spicc->base + SPICC_LD_CNTL1);
>>> +     writel_relaxed(((trig == DMA_TRIG_NORMAL) ? SPICC_DMA_ENABLE : 0)
>>> +                 | SPICC_DMA_URGENT
>>> +                 | FIELD_PREP(SPICC_TXFIFO_THRESHOLD_MASK, txfifo_thres)
>>> +                 | FIELD_PREP(SPICC_READ_BURST_MASK, read_req)
>>> +                 | FIELD_PREP(SPICC_RXFIFO_THRESHOLD_MASK, rxfifo_thres)
>>> +                 | FIELD_PREP(SPICC_WRITE_BURST_MASK, write_req),
>>> +                 spicc->base + SPICC_DMAREG);
>>> +}
>>> +
>>> +static void meson_spicc_dma_irq(struct meson_spicc_device *spicc)
>>> +{
>>> +     if (readl_relaxed(spicc->base + SPICC_DMAREG) & SPICC_DMA_ENABLE)
>>> +             return;
>>> +
>>> +     if (spicc->xfer_remain) {
>>> +             meson_spicc_setup_dma(spicc, DMA_TRIG_NORMAL);
>>> +     } else {
>>> +             writel_bits_relaxed(SPICC_SMC, 0, spicc->base + SPICC_CONREG);
>>> +             writel_relaxed(0, spicc->base + SPICC_INTREG);
>>> +             writel_relaxed(0, spicc->base + SPICC_DMAREG);
>>> +             meson_spicc_dma_unmap(spicc, spicc->xfer);
>>> +             complete(&spicc->done);
>>> +     }
>>> +}
>>> +
>>>   static inline bool meson_spicc_txfull(struct meson_spicc_device *spicc)
>>>   {
>>>       return !!FIELD_GET(SPICC_TF,
>>> @@ -293,6 +483,11 @@ static irqreturn_t meson_spicc_irq(int irq, void *data)
>>>
>>>       writel_bits_relaxed(SPICC_TC, SPICC_TC, spicc->base + SPICC_STATREG);
>>>
>>> +     if (spicc->using_dma) {
>>> +             meson_spicc_dma_irq(spicc);
>>> +             return IRQ_HANDLED;
>>> +     }
>>
>> Make meson_spicc_dma_irq() return irqreturn_t and return IRQ_HANDLED.
>>
> 
> Will do.
> 
>>> +
>>>       /* Empty RX FIFO */
>>>       meson_spicc_rx(spicc);
>>>
>>> @@ -426,9 +621,6 @@ static int meson_spicc_transfer_one(struct spi_controller *host,
>>>
>>>       meson_spicc_reset_fifo(spicc);
>>>
>>> -     /* Setup burst */
>>> -     meson_spicc_setup_burst(spicc);
>>> -
>>>       /* Setup wait for completion */
>>>       reinit_completion(&spicc->done);
>>>
>>> @@ -442,11 +634,40 @@ static int meson_spicc_transfer_one(struct spi_controller *host,
>>>       /* Increase it twice and add 200 ms tolerance */
>>>       timeout += timeout + 200;
>>>
>>> -     /* Start burst */
>>> -     writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPICC_CONREG);
>>> +     if (xfer->bits_per_word == 64) {
>>> +             int ret;
>>>
>>> -     /* Enable interrupts */
>>> -     writel_relaxed(SPICC_TC_EN, spicc->base + SPICC_INTREG);
>>> +             /* must tx */
>>> +             if (!xfer->tx_buf)
>>> +                     return -EINVAL;
>>> +
>>> +             /* dma_burst_len 1 can't trigger a dma burst */
>>> +             if (xfer->len < 16)
>>> +                     return -EINVAL;
>>
>> Those 2 checks should be done to enable the DMA mode, you should fallback to FIFO mode
>> instead of returning EINVAL, except if 64 bits_per_word is only valid in DMA mode ?
>>
> 
> I only support DMA when bits_per_word equals 64, because the register operation is more complicated if use PIO module. The register is 32 bits wide, a word needs to be written twice to the register.

OK then leave it as-is

> 
>>> +
>>> +             ret = meson_spicc_dma_map(spicc, xfer);
>>> +             if (ret) {
>>> +                     meson_spicc_dma_unmap(spicc, xfer);
>>> +                     dev_err(host->dev.parent, "dma map failed\n");
>>> +                     return ret;
>>> +             }
>>> +
>>> +             spicc->using_dma = true;
>>> +             spicc->xfer_remain = DIV_ROUND_UP(xfer->len, spicc->bytes_per_word);
>>> +             meson_spicc_setup_dma(spicc, DMA_TRIG_NORMAL);
>>> +             writel_relaxed(SPICC_TE_EN, spicc->base + SPICC_INTREG);
>>> +             writel_bits_relaxed(SPICC_SMC, SPICC_SMC, spicc->base + SPICC_CONREG);
>>> +     } else {
>>> +             spicc->using_dma = false;
>>> +             /* Setup burst */
>>> +             meson_spicc_setup_burst(spicc);
>>> +
>>> +             /* Start burst */
>>> +             writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPICC_CONREG);
>>> +
>>> +             /* Enable interrupts */
>>> +             writel_relaxed(SPICC_TC_EN, spicc->base + SPICC_INTREG);
>>> +     }
>>>
>>>       if (!wait_for_completion_timeout(&spicc->done, msecs_to_jiffies(timeout)))
>>>               return -ETIMEDOUT;
>>> @@ -853,10 +1074,10 @@ static int meson_spicc_probe(struct platform_device *pdev)
>>>       host->num_chipselect = 4;
>>>       host->dev.of_node = pdev->dev.of_node;
>>>       host->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_LOOP;
>>> -     host->bits_per_word_mask = SPI_BPW_MASK(32) |
>>> -                                SPI_BPW_MASK(24) |
>>> -                                SPI_BPW_MASK(16) |
>>> -                                SPI_BPW_MASK(8);
>>> +     /* DMA works at 64 bits, but it is invalidated by the spi core,
>>> +      * clr the mask to avoid the spi core validation check
>>> +      */
>>> +     host->bits_per_word_mask = 0;
>>
>> Fine, instead please add a check in meson_spicc_setup() to make sure
>> we operate only in 8, 16, 24, 32 & 64 bits_per_word.
>>
>> So not need to clear it, the host buffer was allocated with spi_alloc_host() which
>> allocates with kzalloc(), already zeroing the allocated memory.
>>
> 
> Will drop this line, and check bits_per_word in meson_spicc_setup.

Thanks,
Neil

> 
>> Neil
>>
>>>       host->flags = (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX);
>>>       host->min_speed_hz = spicc->data->min_speed_hz;
>>>       host->max_speed_hz = spicc->data->max_speed_hz;
>>>
>>> ---
>>> base-commit: 49807ed87851916ef655f72e9562f96355183090
>>> change-id: 20250408-spi-dma-c499f560d295
>>>
>>> Best regards,
>>
>> With those fixed, the path is clear & clean, thanks !
>>
>> Neil


