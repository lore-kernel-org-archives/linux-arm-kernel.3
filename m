Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69A3C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfVnT7zto9fIU0SX/IfnPhW6n2xIqa2B7dlheARLf4Q=; b=bjhMEYBXFZKSs1QkBQ5ym1yMCp
	D9BmCe3U3/gw1k8X6PG/Jf5y1U4aQ+2pfS6MdF9rMrDDxlJZqs3BV5/DM8oz4G/YsccYcRHHNT3LS
	ZPPygGa/I0RC+I8kWusW7S2zVaEzcgOTyqmMfIQbdx26A12tH83n6rrFI2Ssv6hzjvLbDr03fGLLX
	G33FvBZGtN9oQQd+GjCUiJgivRv/7MiqdULcuQE/ZwfypuAaeoP/YLxduzUnAwNP9eMy/zvSZQX6N
	rH4PKkZrZ0mYiHV3YmTYG7AhO4/9Fr7MtVk9vys609Y/ZB3foGwJrQ62uWHAHadCePAMTtFg0yr8A
	hM6NEdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Kpe-00000002ODx-3QSo;
	Mon, 14 Apr 2025 14:30:42 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Kdr-00000002L4K-35hv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:18:32 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2c764f2c223so1548995fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744640310; x=1745245110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfVnT7zto9fIU0SX/IfnPhW6n2xIqa2B7dlheARLf4Q=;
        b=P4P3MsKuOeCxGut9CK7AwUNTfQtsKx0AASVdfZgmu0dH8ezKDPLeE39XKWp+raEWIk
         5NfqOtuNGSitjjLwSSmqtF4MUNaC6dxBMbAqp4X2VPblkeEtUt/p2ehdVQq0iJNQn6cK
         L0Se89/ILyuihLr6t9MtgJorquDbWYY/aeICiL/+ArfdtryIuge/DXEzmiNT09e3P+IJ
         6NGh6ND53uYutVN/gZikT4wdU3ewAlDDivf2qS50tTp+I/S6+h5en6krIExZ3Q8wD4Ci
         xu6pMMboy5R8B99x8kDqAq/83R28OXuW9wbRtwbJRPn685XU1Wu2VrcyS/tzyTbJn72B
         Dpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640310; x=1745245110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfVnT7zto9fIU0SX/IfnPhW6n2xIqa2B7dlheARLf4Q=;
        b=G8VOTn0ofdRls4MvTrUM0Oxqut265kVBS0/NQUXOkCnlDfFlkL39bo2DyLX6H8pE9q
         Q5/sGtc8xJYZhY6PuK49SF78d/4O64tiRYTCvxuNEIcWDs5uwMoYwaE8flaMrKmX+EKb
         KXkx/53q+WlYkX9w+Z3EqM0U6psBpYgTelkKgJfOb7dBhkgKgXZ/CqL3LSqw3Vpa+Y3k
         8rHDHAyS8cuknhu2WRzHDT5NmT4JWgnNP5r+NMs69qRheyJtRmmNS/b/GtuZ28xX9RjW
         wlKuCJg0zwGmgp7h7sb4l1bjeQpYzdqwCM1K8sz50ccDu+OCSoam4wQQUGueW1nnPqxF
         qppA==
X-Gm-Message-State: AOJu0Yz/CJIckldVSJX0tPMcTVcaDzaaEjinadqv5/mmkbN9vkd9XQ93
	hwPx2TPThPNo11ibEprypwd31ciyd4Z8x89HOP5beFdlb2Z9RQPl
X-Gm-Gg: ASbGnctG6PLBhX8eusr8TnkDLt9KACiDM7JBEfzeq/lR9bb7+7CzBuAWWCvd1crq6vq
	8cw+9Xk21j7q3Wddmv9Qffx5lhBWiKNPVQEa4SGE5Cy/YOmWPGkZzC84mOkfMUM1HCjc6kDwrPN
	PfcjwrPHAVQjhNSooYbcJqXWwFbEYX41cEnsu+QG/sThsCceXN1TVxlT6REd+0CwF5TqKN85b2s
	3/fh9oXei4a47yH7ZSzleXkpasY2K3+GAsSt5J3VDhBpCV3z2i8IX+fS/Yp3P4atfovh1Z3KiJY
	tpSmnxvY86figFLQ7fSCIW+vwTNTtCeRaVSExc7YT+E=
X-Google-Smtp-Source: AGHT+IGrGIv9+tHzBbFDrY/OgsyEegZmR/zRD35s6mF0qYYRRIOMTdft6Y8aGScRga8UiruK67c+TQ==
X-Received: by 2002:a05:6870:2199:b0:29e:503a:7ea3 with SMTP id 586e51a60fabf-2d0d5fc7469mr7070651fac.36.1744640310211;
        Mon, 14 Apr 2025 07:18:30 -0700 (PDT)
Received: from [10.30.57.29] ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e689c6sm1991322a34.69.2025.04.14.07.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:18:29 -0700 (PDT)
Message-ID: <8f7a84af-444f-46a9-b518-4fb010b7fba0@gmail.com>
Date: Mon, 14 Apr 2025 09:18:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm[64]/memremap: fix arch_memremap_can_ram_remap()
To: Catalin Marinas <catalin.marinas@arm.com>,
 Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Russell King <linux@armlinux.org.uk>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <Z_0SfqQHsKs3S1cn@arm.com>
Content-Language: en-US
From: Ross Stutterheim <ross.sweng@gmail.com>
In-Reply-To: <Z_0SfqQHsKs3S1cn@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_071831_779563_F7A6EF52 
X-CRM114-Status: GOOD (  10.50  )
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

On 4/14/25 08:49, Catalin Marinas wrote:
> Please cc the maintainers and the original contributor of the commit you
> are fixing, otherwise the patch may not be noticed.
Thanks for adding them on your reply. I will add to V2.

>> diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
>> index 10e246f11271..48c38c986b95 100644
>> --- a/arch/arm64/mm/ioremap.c
>> +++ b/arch/arm64/mm/ioremap.c
>> @@ -51,7 +51,5 @@ void __init early_ioremap_init(void)
>>   bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>>   				 unsigned long flags)
>>   {
>> -	unsigned long pfn = PHYS_PFN(offset);
>> -
>> -	return pfn_is_map_memory(pfn);
>> +	return pfn_is_map_memory(offset);
> 
> This is already correct.
Will remove on V2.

--
Ross

