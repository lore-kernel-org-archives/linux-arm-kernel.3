Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F4ECE7B1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3q07i2Mxp8ymZccHYSaVs1bYwvtotulPZj159o78ws=; b=fK35W/jkBOO3EGVqmXpKH5VneZ
	vcgRbKk88jm4AyYFjBeN+cbdJSi187TFXmEENdEBiEc5vDFqAz07RmxQvYoXoceJ6tKv7gKcGLhjJ
	WiSMp1g/uZosFCIH37tJ1qzrp2PibOlAILkVgMldtNTRRyo5a3pghsK9utiAyVIQ3dcLKTi5imp6p
	ckKhLxpjfqMd0Ae+z+SSWt8JzUBm4Ru+VI4XRtjQ95kRzHjw6aA3SrL1LwdYYHHWR4XMwtIOloZjz
	eRLOAbA/8psqfxfPS8K78S+7bvLmXezNwl0wAwy4oj04g2lmpCBKfYkAkbQlUnW1x5yoJAyHE/z4Z
	tmdVhJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvos-0000000CZxh-2K11;
	Fri, 14 Nov 2025 15:34:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvop-0000000CZx3-1jey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:34:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477632b0621so13639285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 07:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763134473; x=1763739273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3q07i2Mxp8ymZccHYSaVs1bYwvtotulPZj159o78ws=;
        b=eKE5HgPCj3zsQMh0Rol0L2zFsmrOrqckZMXbooIx1yBAvMvph8yWQm8pHAtsQrKZux
         SG9+fTYzMMBWQCCTdChXylhVKnkIIwHDAoTM8QAGSZ6ZTUokuefSdqnlxBOHb/H+TLwU
         5sdUy7nSvBQIojY+5mokEMTe7KJpeipGlyZOP9JvDk25aZ4ABlbr7iucwY1PzhHx/fmW
         2hmt2FA+6ANTGS6Rio436RA7twwCnTjzP40IX2QrsMbOsDO9mq/bFopXb/r+vTLx8pEO
         ipnPUITYcj4Y7lQFmJJcTMxdhEg/jgkSt7OcQ75RCG/wKXIyWGya1OfPSF1ZCSQWOBhf
         GQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134473; x=1763739273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3q07i2Mxp8ymZccHYSaVs1bYwvtotulPZj159o78ws=;
        b=vDFcJ5d7gPNJAKjKXWPe78AVxwDURYENoizsEhdzz3zY1mwYXD+ZAz1PBae0Kr2epd
         +zawkNVr5rRDMhiiOuBJ2+LL8968essrU6SpsfTYgP5sfivyjKolsWHn5VB6BhrAUB5V
         sFyxQgvw+B9Lk253cz6DBTFCjcshsYkesld5k79QHs+/9bq4R+w6RpWmpGJXg1p3JoKN
         TcuYzLYVfqqscFuq2Bq0V+lTO8CPmamGOpcQ8sv8cwHvHMQbgwewnqRkJxEoycvW2ZTS
         MQGEUPi9/9zNGPiF8THriNRsz690rU/Lg8B7CSvDuteePvgRxVdxCLmViUSrJJ+UyVQL
         x+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9crjYzIFt+XnM644pfltzlFjPleE7AydvaofDc0gJXuADwB6C/1hyw4nb97lPciVFFffFAh4DXpQZTpWbTlPe@lists.infradead.org
X-Gm-Message-State: AOJu0YxzCi7RJAAgq5H0jQbcNqIFRSZQ5YF3C67HW7C66m36M4L3izaq
	aWN3vBd/g6A4aYt9i16TzgKD92ExPCxqM8bQAdApomMKTpROP/F29SZqKbT/Oy2IIes=
X-Gm-Gg: ASbGncv7pUOpS46kbsapKtSLgY8UgmuDD+1HwGkf6WCZ2HkPm1BNFQK0d1WwArDTxmM
	t7c1Pre4WM6NSLRL7oQwNBrf3q5ygVRljMkiQCFZrutoYg5J8xtRWY+IHrK6ctaDnGNOcQXWByB
	lpE3ikyQHZac1eUP/ewAwefrzshE++N3YFPdzxM6uyyO4fa3GP3xH0VD0Uek74p8s/S3OoDcedr
	VSx6gNjP8fsoG1U+ELORPY2kqywM5kywWgp8RgPQN++R8hKG5jFCFt5tARvihhi2u2QHyq40tAi
	aay4lUxicthhNGi88U/97G+VxanYZJ7CCLrMu3rZqholg84PGOLgp0IfhP+i25cD8Z2lkAs4Uid
	jnYyPnYfkX96r6e3nhItkhOBtDqceaVJjPsnjEw/SnmLbe4ie09NCjsTqDLR22rk37PekpssHg8
	JDKghuXZEV/i03AvoP
X-Google-Smtp-Source: AGHT+IH8FrMnIJiG2DgEll/+zhTyysVGVgx50Ww0DSAImDg/dmoGOLNaeuBBspK7MALsggi1sXKBPA==
X-Received: by 2002:a05:6000:2509:b0:42b:4081:ccb8 with SMTP id ffacd0b85a97d-42b5934253amr3564970f8f.23.1763134473333;
        Fri, 14 Nov 2025 07:34:33 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85cc0sm11019027f8f.17.2025.11.14.07.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 07:34:32 -0800 (PST)
Message-ID: <0d2d2660-7552-4cb1-b974-87f376f153d9@linaro.org>
Date: Fri, 14 Nov 2025 15:34:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>
 <20251114153021.GH3568724@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114153021.GH3568724@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_073435_485027_A89CA6DE 
X-CRM114-Status: GOOD (  16.38  )
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



On 14/11/2025 3:30 pm, Leo Yan wrote:
> On Wed, Nov 12, 2025 at 03:22:14PM +0000, James Clark wrote:
>> The "config:" string construction in format_attr_contextid_show() can be
>> removed because it either showed the existing context1 or context2
>> formats which have already been generated, so can be called themselves.
>>
>> The other conversions are straightforward replacements.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.c | 18 ++++++++----------
>>   1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index d19e2568a0d1..7272e758aebf 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -80,12 +80,11 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>>   					  struct device_attribute *attr,
>>   					  char *page)
>>   {
>> -	int pid_fmt = ETM_OPT_CTXTID;
>> -
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>> -	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
>> +	if (is_kernel_in_hyp_mode())
>> +		return contextid2_show(dev, attr, page);
>>   #endif
> 
> As said, this function now is only used for ETM4, we can remove "#if
> IS_ENABLED(...)".
> 
> Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Unfortunately it's still needed to make the build work. 
is_kernel_in_hyp_mode() results in an undefined symbol when building for 
arm32 so it needs to be ifdef'd out. I can add a comment though.


