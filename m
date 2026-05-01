Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD7BCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFKgnGVpgDshMV7VC8MHuBkzlplZIxMD8nfPKak4+2c=; b=W16GtH3lhPMrzoGFmV/9JDYTjv
	5NQ0uHx2zjrdLNU6QhaGjzZcKD0N0RKVURZXZzVnuGHn31s4/hOzWvPk8laq9SatK1jvk1m/VezNr
	PwRHT/jMXsKJjJfOvcHFN5eWkW71dBacQQpimkHpjU8/CTeGnmrsKVHmyqAD+OF2H1degvMhPXR/j
	AKgQIyoYItSyA6wMyDDmQ3sfmy8bfPY6l9iimnnNDwKgpCWl2gzLemerXWboLqQwRJ8qYxdetIFqZ
	RPt7tNQXYxuHDeSTWLL0/KppT2ITTXmXewQYQ/HXVGXf8Z9+nJQKsjQQZiOsZmUN9MkwdDpb535KC
	iAl20hTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqyp-00000007QKq-0ObZ;
	Fri, 01 May 2026 16:44:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqym-00000007QJx-3Y84
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:44:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso17498035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777653879; x=1778258679; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YFKgnGVpgDshMV7VC8MHuBkzlplZIxMD8nfPKak4+2c=;
        b=TKkJh24uER1Xgz7qA6NPAsFQAV32kXugskO1zBxxGecXWCMQkA3PRzia+1mkUPnp8W
         V2Lc5HLI2jETY0Np7GPhXm2LmqzpDsURhDTb338S3ptoXUvajf+2QUEEv7WKOKfpP+8u
         nL1nZP9casBnXuIrPhBcwElMUJRSrQAzZxnnHDcPwqc06gY+j5jX6ZSZ/f1ZWFiJCMTP
         e/M7aL7zVYhFzW7aORmsODoq5neeL50r/sThqURVWuujrFViETfLR00GAi7qV4/OlQF8
         4DjRCzgsDKn/GbPTAyVP1fbauCDAuYy4yTW82NMIbRoo9Y/gvH1mvwi/e7tgxDkjgTit
         DZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777653879; x=1778258679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFKgnGVpgDshMV7VC8MHuBkzlplZIxMD8nfPKak4+2c=;
        b=et/XkOhVu7vwUO5YchWcY0k4Vd2gS+fqBKgfCmzPVhPbilbOoFVQkA+U5CvLI9ZHZM
         3RkBZzurUu8hH/4Mh89ei5QqG2lwC8ihyPL5yFw0IMaDARuF+o9ecsmfZ55U9W42gqqQ
         +HeNIWfit4Zgi4QEhEhYFc+MY/uSps9PodBl7TvcyK53OfIDGkzgq/MqqJrIZCqrOK76
         6fmZdm55VKuZcmR9NsBodXypkJbZgb4zAWq2YJCcS9mA3qH5bZSoF0R9K8xH94JuLbfK
         WGED8K5qPnxgHygGlDkgK3mtY//SXUU7ygA+KFMdSPr99kHSkukpTxj1GQjzyk0Qnohz
         1PAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8N6OEJW+YIIuxHGcEHRnQ/hBK516ROqRNXGNkrIRnP2py2m2hGPgTBKfw2sIEwf3E6Ug7pQFKOSs6PDtBPKqfV@lists.infradead.org
X-Gm-Message-State: AOJu0YyE6Cl/HISe+gv+WDNs6GbFHUJe84q91CKbO8eXHRvypNcl52nl
	GGRJpJf75XdaTNwXcylK8oL6nRMJcVJB4iTW5j9FEV+3Zytb71kTaER12wu1Q7TkIBY=
X-Gm-Gg: AeBDieuuoi/TAQaDWtE5xdKs/CPkOczjn5MujcoJ1IFt+7JdvDJg2gTr/KlC7dvaTKZ
	SZF8BwDilmeISdu0TitZxZn6G+7lYrmJx7zYQ4ljiEXg/HGZaMmIdl/6PVjP4CUe6N23DIQKuIB
	bGoAGIdCPiRghQRbAyL/dJsbMVB6YlMSS/1jpdZK6HhuDjR6kA3MBQ6JV6A4qYR6RmTS1XPNhMP
	WJpEiOvN0YK2JvlxHTKMdoHG8aPX63SMPJToFfcZVxmO3joeVB1MVOLJ5YYHMfceqfr+NP4JpPL
	29IYmZFwbwoNKGKghzpA/3lRfluvbPFjR+n5lMqWYUd7cGThrhy2CfpF0k5zQAluCNiUhmuiRVk
	/0QcRPdN8ATTKDTv/9Ps+/3/WWFEyyGS7JUDMbbZPeT97qntnuSKrjbcgiLG3j6QNAfXFcOaGuG
	FJzP7DhugUpwZSbxDW0iDg5WG5Ea92ghcf6Apzqmg=
X-Received: by 2002:a05:600c:3e87:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48a8eb991c7mr59860665e9.19.1777653878734;
        Fri, 01 May 2026 09:44:38 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8feec2b6sm16014105e9.25.2026.05.01.09.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 09:44:38 -0700 (PDT)
Message-ID: <700f09c7-c9a5-42e2-b9f9-31f9f703890a@linaro.org>
Date: Fri, 1 May 2026 17:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] coresight: ete: Always save state on power down
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
 <20260428-james-cs-ete-pm_save_enable-v1-1-c7a90ca6f43b@linaro.org>
 <bc9f873e-4919-4617-bb6f-1f495a6a508b@arm.com>
 <be6bbfe1-cd51-43d8-84c7-34de929118f4@linaro.org>
 <20260501135053.GA2674113@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260501135053.GA2674113@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094440_912451_01459C35 
X-CRM114-Status: GOOD (  23.72  )
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



On 01/05/2026 2:50 pm, Leo Yan wrote:
> On Fri, May 01, 2026 at 10:43:09AM +0100, James Clark wrote:
> 
> [...]
> 
>>>> +static int etm4_init_pm_save(struct device *dev, struct
>>>> etmv4_drvdata *drvdata)
>>>> +{
>>>> +    if (etm4x_is_ete(drvdata)) {
>>>> +        /*
>>>> +         * Always do PM save for ETE. It always uses system registers
>>>> +         * which will be lost on CPU power down.
>>>> +         */
>>>> +        pm_save_enable = PARAM_PM_SAVE_SELF_HOSTED;
>>>
>>> Should we do this instead based on if the ETM/ETE is accessed via sys
>>> instructions ? That would cover all implementations?
>>>
>>>
>>> Suzuki
>>>
>>
>> I did discuss that with Leo but we thought it might be a riskier change as
>> ETM is older and nobody has reported any issues, and there is already the DT
>> option to fix it that way. Turning it on by default could cause some
>> performance regressions. Although it's only if the ETM is in use, so the
>> impact is minimal.
>>
>> In reality it probably does make sense as it's highly unlikely that sysreg
>> ETM wouldn't need saving, so it might make some platforms with misconfigured
>> DTs more stable.
>>
>> I can send another version if you think it makes sense, what do you think
>> Leo?
> 
> If extend a bit for ACPI context, it is fine for save / restore based on
> sys reg implemenation. This is most nature way for support ACPI?
> 
> We can limit "arm,coresight-loses-context-with-cpu" for only ETM +
> MMIO mode.
> 

Does that end up looking something like this? ETE is always !MMIO so we 
don't need to check for it explicitly:

   /*
    * Force PM save for ACPI as it has no way to enable it, and for
    * sysreg based ETMs (and ETE which is always sysreg) because they are
    * likely to lose state.
    */
   if (!init_arg->csa->io_mem || is_acpi_device_node(fwnode))
      pm_save_enable = PARAM_PM_SAVE_SELF_HOSTED;

> BTW, when respin, could you consider the approach for not changing
> pm_save_enable. We simply take it as a global parameter, and calculate PM
> mode for each CPU. But it is not necessary to write the PM mode back to
> pm_save_enable.
> 
> Thanks,
> Leo

Yep will do.


