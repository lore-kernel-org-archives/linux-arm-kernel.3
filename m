Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38340CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DSk2ikmD/TKHxP326DjLJj6TQaKaQdWjt46lW8P0oM=; b=t0N2nh3dSe/3G7soQd3SgruiTx
	YWjCZVLJX55QATpcy19egl1VB6KhjrWFhKsQR7OfPDFdYf7T3yTh4Mo+YbAUo4y9uTiX3AT86y42l
	aiem5Xiu2rp07JtP0bSGV+tjQ7US3Kn32ndLQ8Ipat19B+SLAI4GQT9Z1Mj/i46oZpYgVvo0yTcR3
	gOXXkY+uoY51DZNo38TpIH1fh1T/kohHL/wPbPtXUfQLz4e2NS0qnY80KUkw6WxStCxh8dxL8xOK6
	DUhd6kFA8dNo6ZtH8ZYZig5ApA5o4UZ7Ht1zWU9NVS310gnZsdHKRDDLPM1QRqc3XzH2ovn4wD58M
	GFoOJ0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8JI-00000003vsM-3wI8;
	Wed, 29 Apr 2026 17:02:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8JG-00000003vrp-2twI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:02:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso98171165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777482168; x=1778086968; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0DSk2ikmD/TKHxP326DjLJj6TQaKaQdWjt46lW8P0oM=;
        b=R/vvDTElT8pvx0tJWB5PZrg2ZYIDNCsGR57Nl9t66XrcSvBmtxerj1W14RvUICoGAJ
         1LgYWLMZFViXoLTOUGG0PTIwNz65mxT9IklxwJ6ZikVmnGsQvAiJ2dXf7fcjjup3YsLd
         BYNElmG6ATvUfoJzSmOfr/V+6EfVzcB5qe36ecnIDw8xCdXLG2VhLgjVhDfdUf0lEAau
         69VqU0TaDL8V9NHVsOlS2tVbXWnu8180tYJQFYcipB+Glq2/gJw7QvUqMldMK9astNz1
         3pRbSeBYRLc98r0mgZhdM9TBXFjqaUpnwQrE3xFV7MCN52YOxZfBdE/ULwAuw3c/y8Ba
         +UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482168; x=1778086968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DSk2ikmD/TKHxP326DjLJj6TQaKaQdWjt46lW8P0oM=;
        b=Sld6286hylwaRh5E+0tojW9hXh/OYQEff2u09WhN+ZFOTeE4SGnrcyUUFWuDxoqgBK
         AR1LL4nhr349guoN8si3yIfaOlpt28NzWh0j7oz4FVxl/TZj81CtFVwRawQMCAobFF4K
         pYCMtqmAg3P9UPR7puyLlaS5CsfkpHkqfVI9uwlbiSks771FtldZwPAl3H/Ew7UfyCry
         Y+JUGTN3h7A5QzHe53JL23jp6uIvVML0SwLOg9i7gpOk14Ntpb87ZoXPMlNVHXS/GpCJ
         zHShRsmT8SZOfBZeFAWZDvjnNqc2Umaw3i/fN6SYv9Ixvgo4RXWq5clkaM3WdfcUON/n
         TfsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/l9e+XyU6aWixwYoEhFBBsYxYvnHNgrBnQPcshSYnWFPtxUhq6WlIOGru7g8gJlRrYfbsKjT2I1U0gpuCLYp5f@lists.infradead.org
X-Gm-Message-State: AOJu0YwfGaDWZpiA0xKgsdPmWUwisDdc8nEGbXHeQyVFLqZVXdYPfnU2
	dITOvP4KEGZhXzALuWltBwTnEZV94DRXycxKPYhEcIESzh0M83OLiIL70NuigTseGBQ=
X-Gm-Gg: AeBDietWNYHjxR8KU3LdX/XbTWi4Q2mzCIA0p3yzvuE7EAsqeOw8UrGx1p2XcCkfTK1
	IFnsjxcY1XS8FjXrqptOSo4AdKCTicL3RmJUrV0Cw54Kzh+U9YLKUtR0DJh/+kwVnUNhVMUcj+l
	NMhhSIDetJOfIDw7vOdQjXS0V/u4cs1/iVFsBI+QTQ0BrkXo9MIJG+MhIMWVEP8XSTzHicxOo4J
	OwNPgo4F2F6M0QQO6gs9Ig6+NnpWIrjOO83Hc7dDRb1CvvQD2i+V6EFSrfZPRtIWJHRGhnJM7l3
	8aU+0Bcq4TkygS0vWgLscqLU0GrJXO3erG0dWiat3zC14kloIys2XNNFW1Va++M+UpTrbga1cxT
	DabnaKucBqMncW4idvuLhYfY77nXI7es1c/+C3Sj0SiQqpuT6lz98n33aUeNeFBni8R12rjdfL9
	URPk0Qu+sUVT9C5wCNR6hN8CiXjLzoEv4Xe8eY4gIF6kQ=
X-Received: by 2002:a05:600c:4f0c:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a77ae5386mr141380935e9.5.1777482168330;
        Wed, 29 Apr 2026 10:02:48 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d481fdsm7255405f8f.8.2026.04.29.10.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:02:47 -0700 (PDT)
Message-ID: <83c64dc4-6dd8-4edb-8acf-3c731048d73d@linaro.org>
Date: Wed, 29 Apr 2026 20:02:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] firmware: samsung: acpm: Consolidate transfer
 initialization helper
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <20260423-acpm-tmu-v4-2-8b59f8548634@linaro.org>
 <a63d4dc7-b01a-4da2-ac1f-6679c9030db6@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a63d4dc7-b01a-4da2-ac1f-6679c9030db6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_100250_760388_D146E970 
X-CRM114-Status: GOOD (  15.07  )
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



On 4/28/26 12:25 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 17:22, Tudor Ambarus wrote:
>>  	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
>> -	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>> +	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>>  
>>  	ret = acpm_do_xfer(handle, &xfer);
>>  	if (ret)
>> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> index 0c50993cc9a8..f032f2c69685 100644
>> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
>> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
>> @@ -58,16 +58,6 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
>>  	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
>>  }
>>  
>> -static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>> -			       unsigned int acpm_chan_id)
>> -{
>> -	xfer->txd = cmd;
>> -	xfer->rxd = cmd;
>> -	xfer->txcnt = cmdlen;
>> -	xfer->rxcnt = cmdlen;
>> -	xfer->acpm_chan_id = acpm_chan_id;
> 
> The code is not equivalent. RX bits were always cleared. This should be
> explained in the commit msg which would also provide a proof that you
> actually analyzed if it has any impact.
> 
Indeed, my commit message is inaccurate because I claimed the
acpm_pmic/dvfs_set_xfer() were identical.

There's no change in functionality: in the original
`acpm_pmic_set_xfer()`, the RX parameters were unconditionally assigned
(`xfer->rxd = cmd;` and `xfer->rxcnt = cmdlen;`). In this patch, all the
updated PMIC call sites now pass `true` for the `response` argument.
This ensures the unified helper takes the `if (response)` branch, which
performs those exact same assignments, preserving the original PMIC
behavior.

Will update the commit message. And revisit the other patches when
splitting the firmware patches into their own set.

Thanks,
ta

