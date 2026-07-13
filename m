Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6012EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiBB2AvjwEgMU9ZBqIUAymdVhyVC0dkURlNDosko2JY=; b=1gGIPTmjCB/89mFOc6Z9B3L8Cx
	w5M0RgRVQhep7YW/4lNJCw6smtkClMSvebzTzaRQObb9d6dwYZ5DXAVC16RqkY9XLIN96DuD645p1
	dzgG/niKAOReo4ECSJLYwiUacHdjSaT+ocwCuHJmWGncDgdaw9C723ytjM7375zyEeTT3qqxK2Xfl
	N2H2YxDunKAY6srsO/Qd5DzS8YzIMoz4UQIJLRmasHGh0usQaEevrhPHkVt27vwzM6UTRW/tqkSUR
	WlmWdfoOutKrRtUSRxxTSxGis/3GJEKCLjjMN0dviHe6oxb8qVWHl8ke7PkAzvr4UPJpvM+snPYaI
	4kTSWjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFQy-000000097Kg-24Q6;
	Mon, 13 Jul 2026 12:06:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFQw-000000097Jz-1Zun
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:06:51 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc6dd436c6so37373245ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944409; x=1784549209; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiBB2AvjwEgMU9ZBqIUAymdVhyVC0dkURlNDosko2JY=;
        b=TbQqnuzbHyGg8BZvUtPtG2KZO62Dqua1ltazdUWHHbo4K9VCJrb3absUNacG0mjiJT
         AC5UNZUhtPLC3Wfq8CNZ4g6YiTk7TYKmSLLU0pRn3Ej9+KuuBS/Kib1+FKHFXLlBUH5G
         M8lZvV5UCAmQkEtJ0208Is4doBOZqnlykZS8DmFMjdDt65Bf/XWCC6oaqvXdSgyK3QQL
         4HD1TE4B0EidNwuLMZQFxO8ZLCdWsKNUDHNa/uLtkUiUVMpp73F+HPc6MUT0OeO8t2az
         aRoH0ruAoHx9Jf/okE6cDRsPQzhCS2t8FrxED1/1kFW1mswg/UiV5BvvaJO1hIrb2NXc
         8ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944409; x=1784549209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiBB2AvjwEgMU9ZBqIUAymdVhyVC0dkURlNDosko2JY=;
        b=cjv9Ous0cJi6kyfqaazuoHuMNciNNP7Cp/z7iQ5l1jVkTP+XAaJaMQ17mFjV89Qh7p
         pL9YYFL2cbRC31TI4MbD8NMs7wXu4Lq/eKahpgIcM4IlYRethm2lcFB9d+A4JoG5Rlwz
         arkRB/D6xZhYtWwt5NLLtehCH3IosbknkcGVk/epGjehaA1Ygj9QzzLCXtBPiF61e3I8
         NENEJufWQ7T3FqXiqLM9ePLryR+frTDFkI8QaFQI3HqSdUQIqcRZdcxm0FAq7ln1N2Qz
         XTwg8eaLVQqMsCaeQjVuVJ7bFz1ZEfoN5ZD1Ry+GoQ8+kwteIJdYhx0K3nVVnJDwQ2HW
         22Sg==
X-Forwarded-Encrypted: i=1; AHgh+RpXecsgDpuTKizw//UgfkPDWc9N7JJ3Gdq7CXZoxGWOsV2vtLB9LmkiZ9ZwYb3VZZk5f8FHgxUnszws6p1ue3TO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5s2u6wLYIgLqZZ98Hi/0Oy3sOGWAZhTNvj92D+WxP2B14F2qj
	pbRnYbT2ZMnFoXC8VMJFkWpNihI6zBLwvYz+FzvQz4okVEBim1A9iNTL
X-Gm-Gg: AfdE7cl2AuK1O3pJDMH/Xyxdl5LIolmkK4SBXrUPRPPHG1gQFGoSqkVf0NCsPIU3RJF
	UFVql9MUgki2dBUxEObhoMSU9qpVH341dCLl9YEvbsw+VsxIGLR7INcinU0Abk4D1Jatlmv/HeY
	MdpXxSGUW78ixTSejkr8cuiZh3hmxXJ8Z485bw5Y1POqEo9monORm0jbMQG6aLj5AIkOl1vQ/F2
	cB381ml5PjmSvBpaDeFSfke8424NQaIYyX5tNZB00quopKQh7/WkQFg3/i3dLih3SRmVAyGWgw1
	oiZtMUbz3xKhUIN9JqRgrZ+xi/5loNHwBexSqMLp06+7Tu7zVEvtZ5LOw7eMaB88d4x1Qe+p5R9
	DMlWRz8z1bjJNDSPU4Ore76ydiBbPylo52UaloYwmcg/eAiMPodD2jT499q29GcZwGagzhX/MCg
	tkpx8rRmLwdTD++4zY6WuB/LFzW5+kTVszMX6RIYytKIPRHOffczHoYupzHEioAQNB
X-Received: by 2002:a17:902:ea03:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2ce9ed181f6mr82457095ad.21.1783944409251;
        Mon, 13 Jul 2026 05:06:49 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm99687915ad.39.2026.07.13.05.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:06:46 -0700 (PDT)
Message-ID: <cd0aa9c5-6e24-4b8b-92d1-630cf47b066b@gmail.com>
Date: Mon, 13 Jul 2026 20:06:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-3-cwweng.linux@gmail.com>
 <alTJPExu9b3lRtx_@ashevche-desk.local>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <alTJPExu9b3lRtx_@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050650_424579_67CEE05D 
X-CRM114-Status: GOOD (  26.75  )
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

Hi Andy,

Thank you for the detailed review.

 > bitmap.h implies bitops.h...
 >
 >> +#include <linux/bitops.h>
 >
 > ...so you may drop this one.

Will do. I will drop linux/bitops.h. I will also drop
linux/mod_devicetable.h since platform_device.h is enough here.

 > Please, make all register offsets fixed width, exempli gratia
 >
 > define MA35D1_EADC_STATUS2        0x0f8

Will fix all register offsets to use fixed-width hex values.

 >> +#define MA35D1_EADC_INTSRC0_SPLIEN(n)    BIT(n)
 >
 > Useless? Can't BIT() be used directly?

The field selects which sample module raises ADINT0. This initial driver
only uses sample module 0, so I will replace this helper with a fixed
named bit for SPLIEN0.

 >> +#define MA35D1_EADC_INTERNAL_VREF_MV    1600
 >
 > _mV (yes, as per SI).

Will rename the macro and field to use _mV.

 >> +#define MA35D1_EADC_REF_STABLE_US    1000
 >
 > (1 * USEC_PER_MSEC) ?
 > If go this way, include time.h for the multiplier definition.

Will change this to use USEC_PER_MSEC and include linux/time.h.

 >> +static const struct regmap_config ma35d1_adc_regmap_config = {
 >> +    .reg_bits = 32,
 >> +    .val_bits = 32,
 >> +    .reg_stride = 4,
 >> +    .max_register = MA35D1_EADC_REFADJCTL,
 >
 > No cache?

No register cache is intended for this MMIO ADC block. I will make that
explicit by setting .cache_type = REGCACHE_NONE.

 >> +static bool ma35d1_adc_valid_diff_pair(unsigned int vinp, unsigned 
int vinn)
 >
 > Wondering if this is just
 >
 >    return (vinp >= 0 && vinp < 4 && (vinn == vinp + 4));

Yes, the valid differential pairs are 0-4, 1-5, 2-6 and 3-7. Since vinp
is unsigned, I will simplify this to:

     return vinp < 4 && vinn == vinp + 4;

 >> +static int ma35d1_adc_set_bits(...)
 >> +static int ma35d1_adc_clear_bits(...)
 >
 > What's the point in these wrappers?

There is no strong reason to keep them. I will remove the wrappers and
use regmap_set_bits() / regmap_clear_bits() directly.

 >> +static int ma35d1_adc_setup_reference(struct ma35d1_adc *adc)
 >
 > Add a short comment with reference to a datasheet table/section/et 
cetera.

Will add a short comment describing the REFADJCTL/PDREF and VREFSEL
settings according to the MA35D1 EADC reference control description.

 > With
 >
 >    static regmap *map = adc->regmap;
 >
 > this becomes ...

Will use a local regmap pointer in functions that access several
registers. That should make the code shorter and easier to read.

 >> +    ret = regmap_update_bits(adc->regmap, MA35D1_EADC_CTL,
 >> +                 MA35D1_EADC_CTL_DIFFEN |
 >> +                 MA35D1_EADC_CTL_DMOF, ctl);
 >
 > regmap_assign_bits()

Will use regmap_assign_bits() for the differential mode bits.

 >> +static int ma35d1_adc_update_scan_mode(...)
 >
 > This is interesting check...

I will rework this to explicitly accept exactly one IIO_VOLTAGE scan
channel. This avoids depending on the last bit found in the scan mask.

 >> +    guard(mutex)(&adc->lock);
 >> +    if (adc->suspended || !adc->scan_chan)
 >> +        goto done;
 >
 > This is usually leads to a mess in the compiler...

Will fix this by removing the goto from the trigger handler and using a
scoped_guard() block instead.

 >> +    chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 >> +                     BIT(IIO_CHAN_INFO_SCALE);
 >
 > Broken indentation...

Will fix the indentation.

 >> +static struct iio_chan_spec
 >> +ma35d1_adc_timestamp_channel(unsigned int scan_index)
 >
 > Useless wrapper. Just put _SOFT_TIMESTAMP() in place.

Will remove the helper and assign the timestamp channel directly using a
compound literal.

 >> +    if (!num_channels)
 >> +        return dev_err_probe(dev, -ENODATA,
 >> +                     "no ADC channels configured\n");
 >
 > I would return -ENOENT...

Will change this to -ENOENT.

 >> +    channels = devm_kcalloc(dev, num_channels + 1, 
sizeof(*channels), GFP_KERNEL);
 >
 > size_add() ?

Will use size_add(num_channels, 1).

 >> +        differential = false;
 >> +        vinn = 0;
 >
 > Make it an 'else' branch.

Will do.

 >> +    adc->vref = devm_regulator_get_optional(dev, "vref");
 >
 > It can be unnested:

Will unnest the optional regulator handling in v3.

 >> +    adc->vref_mv = ret / 1000;
 >
 > (MICRO / MILLI)
 >
 > instead of plain 1000.

Will fix this as well. The regulator API returns the voltage in
microvolts, while the driver stores the reference in millivolts for
IIO scale reporting. I will rename the field to vref_mV and use:

     adc->vref_mV = ret / (MICRO / MILLI);

with linux/units.h included, instead of using the plain 1000 constant.

Thanks again for the review. I will address these comments in the next
revision.

Best regards,
Chi-Wen


