Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2595EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 23:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYlUw8CjlWV2yawR9xZsFVoRO8akohuXMo1BK6k/g/c=; b=gHTA2ucgroYSuPQDeGz4z2f42E
	dqBdV+qmAYOY66k7zMCbNAX5X/0lSBm9TnwN/k3hqgFVof5B5AS2oy03vZPb9PktE2hzH6rKCJXBs
	cqWUiU9TrG8na71hMWamH+QKxkDzZwnm9hn2OquOUxhjUF6RQACzzSI9YLfoRSvz9JYr20ticycUl
	y2Ge5pwSo3xktzRf/Ijht9tI32eKSFncuWg44zg3WYGrlaaPVVCeu/F92k4uSVzDAimaJRPv76Ibq
	E7Dhc8W0PAIvv4XFO6DJpX1bIQdmneVoepZeOHm924kUK56CGlKTbk4D4uOfPUY2E6CdBy7J+tmQE
	8bg200Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGmEq-0000000F3YY-1W4y;
	Sat, 25 Apr 2026 23:16:40 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGmEo-0000000F3Xq-0YA3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 23:16:39 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7dca4debedaso7645755a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 16:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777158997; x=1777763797; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VYlUw8CjlWV2yawR9xZsFVoRO8akohuXMo1BK6k/g/c=;
        b=CxTvhZU2tr7A345q8migxnHiBhC7i7Bl2B1o8njr+WDwfmxabTCKcZs6UotixEuQtR
         PmKv36Xq7CfTmO2mYZt+sPt+zMmTY6uXuSz97m6paXNPVE7rdrI/+hMcXNHH5DWc5G8/
         f+dIGDzB4L7RPtacXPrJ9rtUvykoMQlyt1INyMYDbY+n4dl24N0Vbfk1NpMfbf5yh2oM
         VW3XkRAPkeBMJqu1ZgEwTVkUEJqkmFpyOpb1cztVXW+6Y3pE+w9cUN69oECkVPRqhiHp
         B7lIa/gxmoJMI+NGvAIkvUo2UDMTdeLSl0wpgES/ELSWEbCgEF/NPoM5M1Kugvb//GhT
         Zdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777158997; x=1777763797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYlUw8CjlWV2yawR9xZsFVoRO8akohuXMo1BK6k/g/c=;
        b=bHdq7G1QNds4MvI02y6edXopObUU3vg6lJaN6zTIPm1SQ5aZ9MwuwU5qfaVEbP0fX4
         szfyOSPSFhbZqIcxvTzDL4whBSeEOKEvJiRVE1EnJQQlUerXISpxhmB52yncyeDemgch
         I6Of5/b1CpIc2nXwqrdRFw4KICXzSguFprYXty77rwo6MS8dAzmuGTGhhkRurn38Q6NJ
         IocRnjtCBXO4ouW+/R/gKnLHKVsomsMy+4h/LUi9Pua3BO0nG62yzTESzOf+WAa9jZZL
         uTIhPSbTLhXo6wr+Im5BxUdF3N3QSz8wOIOXThTPp2X3JUQSyn0EHiO1/YWoVCbAAltL
         1JyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Lbs30uu1eo9cihZLTrQ368fJ3tCSI/k2CTafJh//DZ1OAYkfP5qF8gL9wsAw9U4hcRizSnQlhvxYetswkcBbQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyzHYqefm8rkX/x5EYFd+QbfqbNFSLY6GdRiuiSiDnkN+0VObXb
	QK1jo0joGtgyzeuBjIPl5kHtGaUmLY8pUfTM+QRSe/CnLUTwaTKlI84HuKx0iqOp4VM=
X-Gm-Gg: AeBDieuiVHkWwkgjaq+esvWucKLJKOdI0tevRvQnCQ8i0PPem3raS8yrqd5sCexxQ0U
	EJsjqcKjPx8LDyT53s4VvbXv+dYJ+0OStYDE6cQ/LydR5UO4UiHyOMpC1PgXg/5dlG0oiZU4T0v
	dlqahgwuE/GDbkaiBP4XsLLA66sTWb/VcT3UCUmeXkzf9tro5j5mlKdHTFdZDvZG3lOJlESbYkT
	W74phHLFYPQbFsxn0USGYmy/mM5MPUSbhOXYqN9+Cyo1c9W+8PtgPWyzbpUQM0EGWmwO4nyAbVL
	v/O/TSG7kpTsv6eX0oHtR7MTTx02gvxo+jK7mpxBmL+xqXs189G8HT8op7nRe8/gT6tjOC0WggT
	tDEHR3CQ3sOQ47P+GxV9W43elA2XbEKrFH6X8R5mD/seKC35uop+GivPDwfJ+I55FQz258I5dvQ
	ceRoitfz+0RHAV9PGUDc757AMuaUPqoTogCc79PyDzisgh9oR0KwyJL9g99axiaeJl+vW4Ds46Y
	+oghlA++OSW
X-Received: by 2002:a05:6830:6603:b0:7de:51f3:e7ed with SMTP id 46e09a7af769-7de51f3f011mr7023717a34.26.1777158996875;
        Sat, 25 Apr 2026 16:16:36 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:81f8:ef7d:a711:d99a? ([2600:8803:e7e4:500:81f8:ef7d:a711:d99a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc97616c11sm22385834a34.25.2026.04.25.16.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 16:16:36 -0700 (PDT)
Message-ID: <754b6044-2285-4694-99d4-18d4fd5d8f6d@baylibre.com>
Date: Sat, 25 Apr 2026 18:16:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
To: Jonathan Cameron <jic23@kernel.org>
Cc: Felix Gu <ustc.gu@gmail.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rosen Penev <rosenp@gmail.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
 <84cae83c-2d67-4927-aa40-6c416d4f862d@baylibre.com>
 <20260425194412.1872eff8@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260425194412.1872eff8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_161638_182006_CB9E1F26 
X-CRM114-Status: GOOD (  18.98  )
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

On 4/25/26 1:44 PM, Jonathan Cameron wrote:
> On Sat, 25 Apr 2026 11:17:18 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 4/25/26 11:07 AM, Felix Gu wrote:
>>> meson_sar_adc_temp_sensor_init() allocates a buffer with
>>> nvmem_cell_read(), but the old code leaked it if
>>> syscon_regmap_lookup_by_phandle() failed.
>>>
>>> Switch buf to __free(kfree) so all return paths release it.
>>>
>>> Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
>>> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>>> ---
>>>  drivers/iio/adc/meson_saradc.c | 10 +++-------
>>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
>>> index 23991a3612bd..9708ddcc4919 100644
>>> --- a/drivers/iio/adc/meson_saradc.c
>>> +++ b/drivers/iio/adc/meson_saradc.c
>>> @@ -786,7 +786,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
>>>  static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>>>  {  
>>
>> Nice to see one of these cleanup.h patches that is actually fixing a bug.
> 
> It's not fixing anything as far as I can see.
> The syscon_regmap_lookup_by_handle() is earlier in the function and
> nvmem_cell_read() isn't called if that fails.
> 
> So this is just a code simplification and so small benefit if anything.
> 
> Maybe there is an old version that does things in a different order?

I just updated iio/testing today and I see return without kfree().

	priv->tsc_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "amlogic,hhi-sysctrl");
	if (IS_ERR(priv->tsc_regmap))
		return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
				     "failed to get amlogic,hhi-sysctrl regmap\n");


> 
> 
>>
>> Should `#include <linux/cleanup.h>` though rather that relying on it being
>> included through another header.
>>
>> With that fixed...
>>
>> Reviewed-by: David Lechner <dlechner@baylibre.com>
>>
> 


