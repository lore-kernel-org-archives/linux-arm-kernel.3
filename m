Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA0EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X068z0NbW+UCr4NJbVvlYn7QHVQGnW6I19hKbAd32M=; b=IS5w6iehTWHRh4g2T9E60X2NWx
	J+PrYsKRvPV6LFMmsYVsN7g4E2yV/ml0NG+BOQEcIk9lr9N7K1woz8tB2auko0i2rjDzsQOYsAByK
	YZ0xkNdEdkjvDOU+HgnOdyd/pm+mNRC5qWTyloxpgcnvQPU6OScadh+YOD31sXxSbD8rwMUv7Ud9J
	vuT/da4TH/BGfXC0FsC/vbFhRNdPJZHK9NB5wV1bWad537X11iQUNBR76ywdzgl7Zn69MF7R1trsV
	U6sEYXspgMkSI3HnvXFR0T+aHc+YT1LY3PZSbF7x6o3XucRDbP9dLJBYhnkVwpUxalZv6vQtUNnjW
	kKjnKH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkFD-00000000qld-0B6I;
	Mon, 06 Jan 2025 10:21:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkE1-00000000qYv-1dGk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 10:20:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso93989465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 02:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736158843; x=1736763643; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8X068z0NbW+UCr4NJbVvlYn7QHVQGnW6I19hKbAd32M=;
        b=I8NVPh1LMsHzRZdgfltnHadGYbnzycYsyBWlsmw2W0cbxutHc1QIAHKzxW0ZOVgW89
         5D+Yni0lFsQol12a4nWBgZloTodSjoCkAQ6h4xAKnFrnPMCXOfgNbxF/Aj/1yli4cX96
         GMEsCp5XgYwlgPqN+b7lsicaYo6+ftSlL43gyrIyMfGLdV0uybtSJCsy4vqyv/4swsRG
         iD15e6UMhPfpPGa8JY7r8V8g4Phq5JELK9+NFsvsf00H/PqdWgYUWaY3g/zxIwu2DZWs
         5qjygvWkdUAAUkQ1KrPJVi1dB7qXp4ZSOoMrQE25Th6LePW9mrPXSAj3a477G1EXXlby
         0kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158843; x=1736763643;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X068z0NbW+UCr4NJbVvlYn7QHVQGnW6I19hKbAd32M=;
        b=Dbf1ywmOJ+0+nwjkETB8LdVTrAjc2OGrhtd/dzVhGzb3jmYWDJE89lrUG+Xz0EzcNp
         08t1NOFAJ5zEi4nktbcM69pmqU63IPolkBWgZL+OEm0N6cxcewafLB49yr/CgNd/kp6K
         pBu41mh/J1sXsy1VBKFGHEHr0aV4KjvpnT6Uhz3CpS8GMgrWcEZvHkA8QlAkASDm9oTG
         dIBGpxQh+eJKUdc9/ksMyhp/bE0nPFn+KDhq0i5wiYgefxqKdlsnNI50I1TZcqSUEPZ7
         lUEsrAXsLt+TxhGNCODirXJcvZmDuy4JpxiJUHipqVCa2po7NFxx9t+nLeteew52VsEv
         OC1A==
X-Forwarded-Encrypted: i=1; AJvYcCX4KmpcIhkqQKthVRzfV89PBQBOVbSqOY1SeCFnlkqw1f12wjQbSw0NITEqswNtyePMve5ib/8UygZefLIYD8oZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1jMLH3ikTcHNXhGALxQNhPvBSXdO8xtBEdlyV16Cw4z0jXvWK
	O/wDEsIISxF4x2PRPeVnMBJGwkzVioV6STh+kjsyp3jvDvHgmUQoUXP8vYT4qR4=
X-Gm-Gg: ASbGncv2INWzNqZY+tQ+EPU5j+FJf9baQV5mA3cEBR75JMdKHrKPBGkQA7kSMTmsbRC
	NPCIIdGxMlbaOFg/A3b0Y/lNaeTdcTBysA1VupKp3OU+7DfLhx0tmoSwtokJALSxiEaGLMZ1v3c
	0szrpCehgG9IM6M+O/++9ttqe9KLjT/oBkGSMbo8n+nBQqx08yBQkxCOkIbRsHWKPxH4bGWIQmy
	t3RfZQNSWi+S/VkRH3CPqoCVAoz436BdsmMxpi7U4Sh+tAPWbpkYfZ67NVwQb8z
X-Google-Smtp-Source: AGHT+IGIQDLi1xgJhO8rn+2nlOJ0KwWuo5zVeFcnrcbdiIPBRkk+WzLUuK03bXiGURyPSGYNm5Z3Sw==
X-Received: by 2002:a5d:5848:0:b0:386:4a16:dad7 with SMTP id ffacd0b85a97d-38a221f2f00mr54847241f8f.10.1736158843338;
        Mon, 06 Jan 2025 02:20:43 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a2311b3c8sm44640950f8f.25.2025.01.06.02.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:20:42 -0800 (PST)
Message-ID: <d41fd615-2e6a-4cfb-90c9-fc0122ea992f@linaro.org>
Date: Mon, 6 Jan 2025 10:20:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] firmware: add Exynos ACPM protocol driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
 <20241220-gs101-acpm-v5-2-4f26b7fb3f5f@linaro.org>
 <8e6bade0-5184-4bf7-b1f0-103a77d0f98b@kernel.org>
 <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
 <24963d4d-9d53-4d07-a756-3eb1fc50c3dc@linaro.org>
Content-Language: en-US
In-Reply-To: <24963d4d-9d53-4d07-a756-3eb1fc50c3dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_022045_454869_CAABD016 
X-CRM114-Status: GOOD (  25.10  )
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



On 1/6/25 9:33 AM, Tudor Ambarus wrote:
> Hi, Krzysztof,
> 
> On 12/31/24 2:32 PM, Tudor Ambarus wrote:
>>>> diff --git a/drivers/firmware/samsung/Kconfig b/drivers/firmware/samsung/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..750b41342174
>>>> --- /dev/null
>>>> +++ b/drivers/firmware/samsung/Kconfig
>>>> @@ -0,0 +1,14 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +config EXYNOS_ACPM_PROTOCOL
>>>> +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
>>>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>>>> +	depends on EXYNOS_MBOX
>>>
>>> Is it build time dependency? No || COMPILE_TEST?
>>
>> There's no build time dependency, I'll drop this line.
>>>
>>> Is it fine when EXYNOS_MBOX is a module?
>>
>> Yes. When the EXYNOS_MBOX module is not loaded, and one tries to load
>> EXYNOS_ACPM_PROTOCOL module, the later will defer probe when requesting
>> the mailbox channels, but that's fine.
>>
> 
> I'll need to select EXYNOS_MBOX, I explain why below.
> 
> cut
> 
>>>> + */
>>>> +static const struct acpm_handle *acpm_get_by_phandle(struct device_node *np,
>>>> +						     const char *property)
>>>> +{
>>>> +	struct acpm_handle *handle = NULL;
>>>> +	struct device_node *acpm_np;
>>>> +	struct acpm_info *info;
>>>> +
>>>> +	if (!np) {
>>>> +		pr_err("I need a device pointer\n");
>>>> +		return ERR_PTR(-EINVAL);
>>>> +	}
>>>> +
>>>> +	acpm_np = of_parse_phandle(np, property, 0);
>>>> +	if (!acpm_np)
>>>> +		return ERR_PTR(-ENODEV);
>>>> +
>>>> +	mutex_lock(&acpm_list_mutex);
>>>> +	list_for_each_entry(info, &acpm_list, node) {
>>>> +		if (acpm_np == info->dev->of_node) {
>>>> +			handle = &info->handle;
>>>> +			info->users++;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +	mutex_unlock(&acpm_list_mutex);
>>>> +	of_node_put(acpm_np);
>>>> +
>>>
>>> You also need device links and probably try_module_get. See clk.c
> 
> I find these necessary too, will add them. try_module_get() must be
> called when the module exists and is alive, otherwise I get a NULL ptr
> dereference. I need a module dependency between acpm-protocol.ko and
> exynos-mailbox.ko.
> 	select EXYNOS_MBOX and
> 	MODULE_SOFTDEP("pre: exynos-mailbox");
> shall do the trick I think.
> 
>>> clk_hw_create_clk() or of_qcom_ice_get(). Interestingly, none of them
>>> perform both operations, which I think is necessary.
>>>
>>> I think you could also avoid entire list and mutex by using
>>> platform_get_drvdata(), see of_qcom_ice_get().
> 
> Using platform_get_drvdata() will simplify the code, thanks. It still
> assumes the platform driver exists and is alive, otherwise we get a NULL
> ptr dereference when getting the drvdata. But we'll be safe if I add the
> module dependency.

Ah, MODULE_SOFTDEP is a soft dependency, so I can't use
platform_get_drvdata(), because if someone removes the exynos-mailbox.ko
from the file system for example, the acpm protocol will defer and its
clients still get a NULL ptr dereference when trying to get the handle
(where try_module_get() and platform_get_drvdata() are called). I'm
better off with the list and mutex.

