Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A525CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=; b=T58BY2yaEoUY2oVtkj/Tl5Mwsn
	qIknDXbr/ajQzhsO5q6L13DYvu/xkOsHzDqTx5fv52jEpGpi5J9oRg7TLz9mD+m2EuSCcCLNo6G2v
	79synEM9hNas2uK0k6R3ndd9S2tleJIsQ6EicarQWTwgs13NAxDXDwGM5QPSFTAhQkXM7J78YijSM
	kYP9Ze53Kf1/KpcpkNhVToL4SHemWoEN8Rz9Lm0bKWr8zWRU7tDYvGtk3r3jrRpmU3LIdxMCkTy+9
	zHj5t5suUaL1kP5HmRh7Vn+Ri7r3fH10tNM6mTXociX631q9t296YLYr1fdsHSre2qyXtEbwoTTBJ
	URkT6JlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvF6-00000003NlU-1lEf;
	Thu, 07 May 2026 09:42:04 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvF3-00000003NkU-32IG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:42:02 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-82748257f5fso1103140b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146921; x=1778751721; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=;
        b=ITBpeySW6a6eibrRTB32ZR65rtLEkeVANQMTTdWQJPbt/1kMTVPveWzWNfPnC2cBMU
         WYFKebZw8YSOhHQH79tt6o9e3LI0DziiE9kjmMQSSa582fpRFUfKRZqzPYlIgagkvwVs
         ZAvgr6hUyWVDtyL9lGxRWs08DYrHB12h7tUewr1hZLFn5nISFAwyHzLz4fHb/HE4q7Uh
         s4a3CdvqRoFPDNsjMEqoo3KwtSZC3bVistUGZgbwHphEb03dF13LZVkPhFWzhF9XERfo
         M7kjknavjxi3X52Y1SzTiGVtyvewEPAbII2I4ygTJsi0csKBf5lfQJJDIrPUbNkbD9J/
         bh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146921; x=1778751721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=;
        b=LFe2TFFPK/Jr2n2F04SBfsYE6eBJ/xSwshAf0/i1TIIymbyrnlIzWEUYmROC3x5jYY
         UR1eGcDrhzUQfuo43Wl46TDGXb+P5s0wMImZucqx5iuU+ONMZE9tAYRf+OTGvDduVqXH
         F3btQ68fv4SSYFOrtqtJoneotkwtM5QX1oGL1U3DYxHMDPVpQiZU2kvGDdYNFjpv7QTL
         N0A3YQ7kkBW41T/YT91aK67aB2pBD4D8rXjnm2rTKcVbodaL/0sb+uhwCuoD6zi9tyfl
         00Znydl/GdxNiytJV1rm/55uvvu+Ei62EAurUVO0yZMgHAP6rOecPW3m2Fk5afs6S76Y
         sYrw==
X-Forwarded-Encrypted: i=1; AFNElJ+syVq5C66vU4cqZw5JKEaOy3ugh7VPjTCfiWsAdbht16cUM2SLTNeyXGgr2o1aeQzSeuMyLNjbUkzbMoC48KJt@lists.infradead.org
X-Gm-Message-State: AOJu0YzrkXT+05MFYWS0XWs+WTeFHM8gcNHJ0vVhKSYczRN8HR8JMwpA
	R4GAvC0DyElRmgTg890Ixb1bgyKBZY2h+3P5eH14UeQre/uR2Mb/hbwJ
X-Gm-Gg: AeBDieuz1bilXvNcUj87HQV4DWi4+4eKDhmiz28H1AOhagA69wDCP8i1G9oMEXUInxD
	0Ju2cwjeEyksMiGiPV+CsKay/pflQFuQFq4B8TZ18GbIWB55ElJ/xAWstktZgHXQ60S1tDvFy4z
	ukCNJ4QoZgBXEM4vK7WIfppqZBy22M2ESfqlnNZBhF0EMzcTJBhaw56viETb1JNbxZBuSIy9p/g
	cxzEvAQhg2IpxS8SWodBgbz6Lp2lO2Tc+utqqf65jUuLOgI/eUn3/UQ5Lgtw6WQBzDQ/aEOQjja
	nUBtOCaeaA7hjdknrr8Nk4t/6EZOnvqTrjJpHu072na2ZmQmokcOpeJx/e2+tm4rnP/Ar2V2Olk
	PfIaj+28Q0SmP+lhxCuV23c3CBvjEzXtojD5k73kAoJnw8WIXL/gUfIn4AZTTejAAay21zbVZNd
	E3wlzhoYgY+4kkvdU4W50EsIfu1jQBeTem9Dm1FVrYxpl5BZg9GCSF
X-Received: by 2002:a05:6a00:4093:b0:82f:3e9:7bec with SMTP id d2e1a72fcca58-83bb7abceeemr1949432b3a.12.1778146920796;
        Thu, 07 May 2026 02:42:00 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm10264549b3a.21.2026.05.07.02.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:42:00 -0700 (PDT)
Message-ID: <eece7690-634a-43c5-9b20-0afc174a89a0@gmail.com>
Date: Thu, 7 May 2026 17:41:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] of: reserved_mem: add linux,no-dump property
 support for reserved memory regions
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-6-chenwandun@lixiang.com>
 <20260506144542.GA2072596-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506144542.GA2072596-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_024201_761677_B0EF0BA8 
X-CRM114-Status: GOOD (  19.63  )
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



On 5/6/26 22:45, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:25PM +0800, Chen Wandun wrote:
>> Add a 'no_dump' field to struct reserved_mem and parse the
>> 'linux,no-dump' device tree property during reserved memory node
>> initialization. This property allows device tree authors to mark
>> specific reserved memory regions that should be excluded from kdump
>> vmcore dumps.
>>
>> Reserved memory regions used by device firmware (e.g., GPU, DSP, modem)
>> typically contain data that is not useful for kernel crash analysis and
>> can significantly increase vmcore size. The 'linux,no-dump' property
>> provides a declarative way to indicate these regions should be filtered
>> out when constructing the elfcorehdr for kdump.
>>
>> The property is named with a 'linux,' prefix because kdump/vmcore is
>> Linux-specific and the property is an OS hint rather than a hardware
>> description, matching existing properties such as 'linux,cma-default'
>> and 'linux,usable-memory-range'.
>>
>> The 'linux,no-dump' property is only effective when the region:
>>   - Does not have 'no-map': these regions are already excluded from
>>     vmcore since they are removed from the linear mapping (MEMBLOCK_NOMAP).
>>   - Does not have 'reusable': CMA reusable regions are actively used by
>>     the kernel for movable page allocations, and their contents are
>>     valuable for crash analysis.
>>
>> The no-dump status is also printed in the boot log alongside the
>> existing nomap and reusable flags for diagnostic purposes.
> I think this property is the wrong way around and probably not needed.
> The default should be exclude the regions, but if Linux is using the
> regions (like CMA) then it can decide on its own to include them.
>
> With the restructuring that went into 7.1, it should be possible for the
> CMA code (and code for any other regions) to set some flag for the
> region.
Agree that the property direction is wrong. Rework in v2:
   - Default: exclude reserved regions from vmcore
   - CMA (reusable) setup path marks regions as kernel-managed general 
memory → include
   - No DT binding needed; linux,no-dump proposal withdrawn

Thanks.
>
> Rob


