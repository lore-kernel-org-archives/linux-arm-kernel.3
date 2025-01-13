Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D286C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZUPKPodQRA9UKLrw7YC46HAo7cQohPbJabF4rZYVbI=; b=XgV1zoU0EYLNb2hxSHOXzDOZ4f
	zzD5CLKpo7n4on48H/1HQCBLdm8BX6ML0yG0U+Hc1xAl5tAVMPMdKz4MEOWBY/+bva0D7qTVz70S0
	Jn4CflRkPC7+Q4cmBBUGly7kQUE40Pf3gLL4wOid2u0zKuc5WT2zoiLqA/PvHc/7MisfoEoC6lY90
	WreyJAVocZx9MjtB9ASRUyDY9d8qwZNckQoy5Of+NKQ+Kok2Jzv5vgylN6kRVh4K/eFik89wM4ZsQ
	8a9fOYo6xp/2I++3OHn2ZFl2yoK4Sj6HExy6hh9dIqXWZwwe6Opq2G1jAGj7DaRm7tUhhmcfuxQ6e
	SMehkPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR4H-00000006YXj-0Md1;
	Mon, 13 Jan 2025 20:29:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXR31-00000006YLo-2W9S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 20:28:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385e06af753so2391167f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 12:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736800110; x=1737404910; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YZUPKPodQRA9UKLrw7YC46HAo7cQohPbJabF4rZYVbI=;
        b=DLOgZpM6uCv3ufX8yfG35HRFBL/oizXlgoHcXpQ/FJB/vThxAOizvwTiHxdcwrzH8U
         PAC864caNhst+2yiSn0+qJEHFvP1/uUKQXOOF474wn9vhFmIfFZ5wD5cnig+gpd/WeF8
         JXNJNBSqhKUT5iC3XtNGHTJ35szmpDNqRWhO3LrKkV/P1+lVzmM0rYnHdOu6j2eWZiys
         IgQ+Iz4LmdbCJFJ4AO4QAmbxefOwdvgz34PYi0lFGG4vGgJwss3Y8zgwzo+gsKRggatL
         krGxg3x8sLhi3pIniTC44qmKMbnTxsHc3uO19G06OxaYMB9lFju4KzBISpCUROinRv/c
         pawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800110; x=1737404910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZUPKPodQRA9UKLrw7YC46HAo7cQohPbJabF4rZYVbI=;
        b=ZZ08ZKUWOXQrF7sV+6hgC4W3Xn1rj4Mfrjh8mJmk+tTRKEFGEG3ke4c6FcnAJWubOF
         jJFPxhIe/OmqPKcZm3R9/ESwtvJd1b0pXNepoOiOgw21sEWej/JAWjVN/j+fglG7tswW
         +6xk1D2U0TKantn62kvs9Tewvz2DeKLETLrZgR349lhEWddCvzqbqEe6uyWY3vN52EmQ
         RiAxRjVsvjI22UFyEDf+tSZ6fPYU7QcDAkQ3Infv/GdZ0fOLjPbiRD3zbSHhP59nKZk9
         LQTIJqCQ5B1/BluSGpQGnHojq6Wg3YdN3LIcbvVivzIiZioIF/NBzHCPARU1DoRJbsAQ
         kqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHwZGM0hSxGN4FCwf8ejfRfYMIVCn1eLGzEK2Onqz5UsyscnUXwhDolrr/OdjG6S5XxYL2j/ywUwRAv+5b3FZR@lists.infradead.org
X-Gm-Message-State: AOJu0YwDT1VI4vwBoihbqMB+5vDuM8AEHKQQRV/15GlwDWvCxJvKHNfg
	cHtbqTfvxoZSzRCmLvL1pom1IG6sypH0k2CCGVPIiWKdxXHV1VOzCcK8rQ==
X-Gm-Gg: ASbGnct+ZRe3Ar2vfHGbOBSjfrKCK7YHKVK4F8soe763Tw6aFYmGAWucL8ejtLwu6s0
	8B7nQPob7+Dg0OxkSYn5PRGr7Tq2UfGhd/4rFLOFAmuOFCmbDRAaFpshuOkBHiTBgT53QOf+9bs
	hTlexJ9Hn85hy6/CXWNV+YqlK9qnGeBX9ZqGdTZyi3QHlTk7VrXlKv5buYHja5lfYLVYw8Mz3iT
	gxCmRNbSz59se1ic3WmxCNHh47RfZ5e6LUMduvnpQntDdCPqclRMjL1W+kju57HGZCU5Rup/vPj
	+RWH06c+cpRXCxweGhfXmfC7Dg==
X-Google-Smtp-Source: AGHT+IGaFO3Fpq1npGkSd3mTkGaOivTVZj4V4/IbIrGsqAJL175KbCIlc0anhQ+1WKG7VXpnfzGkjQ==
X-Received: by 2002:a05:6000:2a3:b0:386:3684:c97e with SMTP id ffacd0b85a97d-38a87309ca0mr21715051f8f.23.1736800109422;
        Mon, 13 Jan 2025 12:28:29 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194? ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm13247251f8f.50.2025.01.13.12.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 12:28:29 -0800 (PST)
Message-ID: <261f9fac-82de-4f39-bf5c-cdfcee917588@gmail.com>
Date: Mon, 13 Jan 2025 21:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250109175427.64384-1-rgallaispou@gmail.com>
 <07a7177d-7705-4eb5-a11e-02a9429ffac2@kernel.org>
 <Z4EDKUb+hO0ovV2i@x1-carbon>
 <cfecaa65-f6bc-48c1-9295-9bfe18f13db3@kernel.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <cfecaa65-f6bc-48c1-9295-9bfe18f13db3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_122831_639309_1E4753FD 
X-CRM114-Status: GOOD (  20.34  )
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



Le 10/01/2025 à 13:02, Damien Le Moal a écrit :
> On 1/10/25 20:23, Niklas Cassel wrote:
>>>> -#ifdef CONFIG_PM_SLEEP
>>>>   static int st_ahci_suspend(struct device *dev)
>>>>   {
>>>>   	struct ata_host *host = dev_get_drvdata(dev);
>>>> @@ -221,9 +220,8 @@ static int st_ahci_resume(struct device *dev)
>>>>   
>>>>   	return ahci_platform_resume_host(dev);
>>>>   }
>>>> -#endif
>>>
>>> I do not think you can remove the ifdef here. Otherwise, there is going to be a
>>> compilation warning when CONFIG_PM_SLEEP is not enabled. No ?
>>
>> Look at the pm_sleep_ptr macro:
>> include/linux/pm.h:#define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
>>
>> I would expect the function should be optimized out by the compiler
>> using dead code elimination.
> 
> Indeed. Just tried and no warning. I was expecting a "defined but not used"
> warning, but none showed up. So all good.
> 
>> Raphael, perhaps you could show the before and after output
>> using ./scripts/bloat-o-meter ?
>> (When the config is not enabled: before and after your patch.)
Hi,

I have not used the bloat-o-meter until now, thanks ! :)
Here are my results:


   * with the configuration

$ ./scripts/bloat-o-meter ahci_st_no_patch_pm.o ahci_st_patch_pm.o
add/remove: 1/1 grow/shrink: 0/0 up/down: 4/-4 (0)
Function                                     old     new   delta
__initcall__kmod_ahci_st__384_241_st_ahci_driver_init6       -       4 
    +4
__initcall__kmod_ahci_st__384_243_st_ahci_driver_init6       4       - 
    -4
Total: Before=2200, After=2200, chg +0.00%


   * without the configuration

$ ./scripts/bloat-o-meter ahci_st_no_patch_no_pm.o ahci_st_patch_no_pm.o
add/remove: 1/2 grow/shrink: 0/0 up/down: 4/-96 (-92)
Function                                     old     new   delta
__initcall__kmod_ahci_st__383_241_st_ahci_driver_init6       -       4 
    +4
__initcall__kmod_ahci_st__383_243_st_ahci_driver_init6       4       - 
    -4
st_ahci_pm_ops                                92       -     -92
Total: Before=1904, After=1812, chg -4.83%


Looks like the patch shrinks a bit more the driver. I also tested, so we 
should be fine I think.
> 
> No need to do that I guess. But there are 17 other ata driver that set .pm
> operations. What about these ? Don't they need the same treatment as ahci_st ?
> 15 of these also use SIMPLE_DEV_PM_OPS() which can be replaced with
> DEFINE_SIMPLE_DEV_PM_OPS() also, no ?
> 
> Do you want us to do that cleanup ? (fine with me).

Regarding the other ata drivers, if you have the patience I can do this 
in a few weeks.  There is other things on the stove I would like to do.

Regards,
Raphaël
> 


