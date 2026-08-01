Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85475C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hd3T1xQvNyB/6IyoVuyaA+Q0ZD3Y79BRfJwwvpZwQE=; b=1SkQtI6tA3gdP3yAOiEXn1v/pa
	jmlPQUJrmbXwDapHU9cL47RBct8mdK7/plvKoAF+zKucDqC1LOxVU/lUKpcuUHiGgbevuys8Sp83i
	z9Lw8dchqEHFWVS8s2ujiZJkSk6Oe63HDSZ81MAXAixNeEqO+xtHzPEl//AA+ux41XPa0SZY1UFCc
	nRB4ufKfpJt8O9haPH5bQt2hhjAMPXRE/g0h64+Ynk06eC5HrM/6c/WWrfjhn21jJdJwn4hzLQjPz
	gU9/tvkvCrhIpVHLByX/QO4kCgMNUftkh8IX4VUwKMMNOx7d9X0q1kPFFV9YFxK3phM1ukal+TgzU
	au8GOsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCtX-0000000Et2L-1A2b;
	Sat, 01 Aug 2026 16:49:07 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCtV-0000000Et1w-1qBZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 16:49:06 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7eb787dec99so1414415a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 09:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785602944; x=1786207744; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hd3T1xQvNyB/6IyoVuyaA+Q0ZD3Y79BRfJwwvpZwQE=;
        b=jaGnnaNfhKsHDI+RPj+7XlF8/7z8gov9TvB3MZ9LaSm1eoGtsLZIbqtwmYSrNkzqSc
         frc76M+ZSA1jrCgTkshCUZ30PJnNMpUGDsgneZTr/TzCFGP5A0DVVtc/FQBEImfFyPwq
         SZNvvp24J3mDvj/mvMu/Uo59k7DMUtYj6nXlrBQgOazGsNhvA/Fx3AClyc2cgXnyfwRc
         rq1P/GeBu2+U7dFXeW5KQuPvqlKzvxvqvKmhIglKe/Fo8SCoL+QtDaFRvtVmUwKdnM2h
         sdzWeuL1u8LtdefmwigyDVwWU6wm4ws4X8xPRk09dIfXghuCIPr3t2XeZ8FCr9s2HJdI
         uGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785602944; x=1786207744;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hd3T1xQvNyB/6IyoVuyaA+Q0ZD3Y79BRfJwwvpZwQE=;
        b=GEglk7yNPFAIIAhlRH3xCTQ9ypcFxi6o8MirWRNTN6oFQt3+xVZAv1hRVvE8nNk3yo
         6PYmJkkewplXvOCB7dhivrPuCvxQsa2H6RoHYG1YN6EqTaw1sqrOFeIZVcs2tsFs2RFu
         dn4aCgAoHcR//zSRvioxqJb9BlwIpDA1XPN6/ingnM4Mt9+DWiQ00QdhY3B18/ZM82Zc
         Y9vUkE+CWBWbcQuTQOD34dzj2FZM8NJlrFwa1FQH3lY9/Bvr6nwCk1VEU9XGQVlPGTPH
         lZkMgXQRvO3v77TLmwVtMVit19wrcrdLsD/xuU7uT8Bw7dr1J4sZrkRaRCiMx5eYbBye
         EnUw==
X-Forwarded-Encrypted: i=1; AHgh+RrU3i6mprth8Bcsq4n5oLYvz7+0N2f2lpoRhziUkx/kUqXhFssyWPSmhE/BRLcFy1PUc9lqZ1Wi/tBIY73px9TC@lists.infradead.org
X-Gm-Message-State: AOJu0YwNpg5oE1oZR02yuujixMOhjkwjngeFY2PkIHqspoMWw3OozLuC
	bOLqss9ZbjsAb+StNsgsH6TdiQ9SoWUHf13XqF0aeWMk9T1uStiLHfEkQiq5CJmWh6A=
X-Gm-Gg: AR+sD10AftbZbo2duizs9hlJBvy1DhInMCtU/mI63vedMjJVHJwxCCOeytezAbhMYt3
	XVwt0eaVeyAqLBz0VPey6l1wc7Z9sVxVYqVs04iBmy6YXIyc01JsrjCMkTO0EzQMatt69zLLw0w
	zjXxPsvB8fftmgW5uBogEVUUwWO11lpYQAkQfcbVvxrMo3c6TT0A74xMiPgVJrSgsHzYHB8NwFY
	P76rImccQE2AsX+iEaFSw7MYSuvrCy4eo38WmdE34BpDRvRLmYCD/2lfiSinSGxu5//Cn/cjVOF
	idk4Po6XQ5v84t/KowKWE5Nk8lBcajFFHp/YxXg5iEwLNkLpb5DXbsZdcVClhkJu6InC4eLnpD0
	rPYarHQq/mfUoAdEcraiJH0zGvw50J6F74iJHbCkKs0VUTWRsUTlplYpExGzZsBw6PKmapgffNI
	2bKKtEvehH4844ojyjstxHWg4pqkFeXolowFCjQeEwp6fThFeFg148kMhB1WejIyEUjmpaDlzsd
	q7pKQqF1gBASpy15w/n55owJJCh2fTEWfCNbSQ=
X-Received: by 2002:a05:6830:81fb:b0:7e6:f482:df36 with SMTP id 46e09a7af769-7f196f48cbamr9251653a34.15.1785602944505;
        Sat, 01 Aug 2026 09:49:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:359b:17f1:d4f9:4949? ([2600:8803:e7e4:500:359b:17f1:d4f9:4949])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a586sm3398388a34.16.2026.08.01.09.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 09:49:03 -0700 (PDT)
Message-ID: <4c720f59-020f-4e26-9d7c-e018556b71a0@baylibre.com>
Date: Sat, 1 Aug 2026 11:49:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] iio: adc: xilinx-xadc: Add .setup_channels() to
 struct xadc_ops
From: David Lechner <dlechner@baylibre.com>
To: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
References: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
 <20260729125455.95893-5-DileepKumar.Nagavarapu@amd.com>
 <9d6d0f3f-ca6e-44e0-a280-c07a7d55453b@baylibre.com>
Content-Language: en-US
In-Reply-To: <9d6d0f3f-ca6e-44e0-a280-c07a7d55453b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_094905_492917_B0532697 
X-CRM114-Status: GOOD (  17.01  )
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

On 8/1/26 11:47 AM, David Lechner wrote:
> On 7/29/26 7:54 AM, Dileep Kumar Nagavarapu wrote:
>> Add .setup_channels() function pointer to struct xadc_ops to enable
>> different interfaces to have custom channel setup logic.
>>
>> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>> Signed-off-by: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>
>> ---
>>  drivers/iio/adc/xilinx-xadc-core.c     | 6 ++++--
>>  drivers/iio/adc/xilinx-xadc-platform.c | 3 +++
>>  drivers/iio/adc/xilinx-xadc.h          | 2 ++
>>  3 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
>> index e3b1d5bebe98..d39ff54439ba 100644
>> --- a/drivers/iio/adc/xilinx-xadc-core.c
>> +++ b/drivers/iio/adc/xilinx-xadc-core.c
>> @@ -656,7 +656,7 @@ static const struct iio_info xadc_info = {
>>  	.update_scan_mode = &xadc_update_scan_mode,
>>  };
>>  
>> -static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
>> +int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
>>  {
>>  	struct device *dev = indio_dev->dev.parent;
>>  	struct xadc *xadc = iio_priv(indio_dev);
>> @@ -762,6 +762,7 @@ static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_NS_GPL(xadc_parse_dt, "IIO_XADC");
> 
> This function is only used once. Would be better to just move
> it to the file that uses it instead of making a public function.
> 
OK, maybe it is used in another file in a later patch. The commit
message here should explain that.

