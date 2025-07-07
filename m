Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E4BC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GF8vc1c9D0lLEMqMMZKCgAxa6DKwsWgtBoqT1qS5YRs=; b=ROmfTQb9UvrsyknL7P7OB2/iAG
	0v8FdEbKwwa+XerjcCf4B+1KPm1IOkuVPt3ou6wXoMxeanU5X7XzODXa1um4Xz3Ztb8Ebdmxa+QyZ
	IwPEvu/LPjwMwxxSErK1VsQnVpS3qtY91x+BPh6PolcU4bmT+CSg6dn1y+jZkRP4YGCTjzmnh9f9g
	/Jh8cdx0ZyGf4If7QUCRTqGg5A9szZwCAY3M+Abg4+/yUwJoVYxgyeXE0sR1wIaaZadD4IQRjC3Tv
	ESu/XJ4yJdO/3MmPRnMhjLMSK08UtaY25uOHy7lspFRdOERvnfS3HecujriOrNyIUjU8nrM+DMNxy
	BMFmO/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkG6-00000002JVu-1E4I;
	Mon, 07 Jul 2025 11:43:42 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYidk-000000024ms-3LcQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 10:00:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so2707499f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751882399; x=1752487199; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GF8vc1c9D0lLEMqMMZKCgAxa6DKwsWgtBoqT1qS5YRs=;
        b=aPTDFw0S7GLG3z7PL2vfQgauyzZl0RNG6KUnOXf7Nm6ZEIRh06u7p/dCahxB72sUVM
         5Gw6zmivcya8SXYshxZitS78Lm/sU7noy3a3WbWUdhDqjxa63AeVtNll1YibB1GEx/F8
         ciYQQPu/dJ8lOVF1Sjjhvf3JxNc8TsMtZzMh+B6P+NTlw/aeZzAjmXGvfiFNLG3eQEKP
         NJJZ9pWDVhjcC2Q38+CnkHrVs6rO+6AkwyR1aSFnZF+lQHEqp1tQ4st7ySzftJqcf6tL
         p0to+X+x09S1s8vCP83//d83JkJNLp7+86THW/i3QJJADYREfLANM1kedXGwpWwRD3ZM
         ZNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882399; x=1752487199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GF8vc1c9D0lLEMqMMZKCgAxa6DKwsWgtBoqT1qS5YRs=;
        b=W1AH84IbArEUjvTbhFb4983w24dRXfD/tZqibLGHiw/oYjRqdweLKgsD78sgOZWt6w
         1cnLWUE3ZEMNc1jWLcqhTbwkbgCHOpT6K37mqqTenGBp0heCtZ/IPLMyiZjJnPsOSCMG
         XUxYWOSv0Lk7Cx1nZdZ8gKmv0nvaZfmMPOHa7Uga2WZs0F/YQWF6YW4tdT9v1sGkdTpO
         flDGww3Zj2iAM3YNLI9Gr4KdlWD74LuZBUYq3GKS3qSVBBvt4+MJfE3m1QEdnwEWEGGs
         XBUlJ3CPocpcHUCyt7k3klX/X9x2mKBdWt8lQhp4sTjdfN6uANHvO9/Kw8DXr4ty1Vk9
         7RCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC+et80lPz0HNK1z+9byU7UdZ2+22eIQMYK8nMpVrnnMXlgUmEuqhU3rlfR14jnX0m8zBPhG3Se2I9urdtifJ9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsl8pziiFMjf+0hZXq7Z4AR9UpJc4mfVmHrVSw/ngFq33Oad4O
	LKWYVgYhxtrM7cCA5eSblM4GSYeZ6IlISnyydoPpseKGAMv8dbcmPuxvCqxhPPUK8WU=
X-Gm-Gg: ASbGnctd6+B/oQ0sKPMqOwODrh1EdJoFqlmOIhlXHSfN0uaKwwPH+uQcYIkYmgknnwd
	RlECqaXY+b2TBiORtrmgL0qWDMPb6A/F2NZv8ModtMDL1PiVD6ZA3XQgBXTyD3IW1XiUGQRHMK0
	BGDQCJceNz+pbLp0oMcG+87mlA9hU8WZGa3ba68AiOzV3S/cerxu1mk29y0vq+luysKGqIaZJZn
	Vha8iiBlPzKAtZu+9qTSXjTLzWPCLk/7qZzYHOop8Hm7Z1GBrw++8yVbnk53dHDmvjdwd78AWBm
	ZO92HyDgJ1Q3VXghk61xCcjVHkmdE/JzKKuJ6qzjKxyEpy1B1wLZ2Vn/KiAsQh/MtiZ4bAx7Ed6
	yrWVdv2ixEFF2MJ2AFJJhJ077H6fLlXhCEg==
X-Google-Smtp-Source: AGHT+IHvlmHP0oa9KgbeYWJUl4MCBGVkpFuuQN5yKMcqWRZ/ketGUdB/VWArjJjtYOPvEISWj77cWw==
X-Received: by 2002:a05:6000:26ca:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3b497036356mr9229115f8f.54.1751882398533;
        Mon, 07 Jul 2025 02:59:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:1a22:119c:5b1d:302e? ([2a01:e0a:e50:3860:1a22:119c:5b1d:302e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285e241sm9798553f8f.94.2025.07.07.02.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:59:57 -0700 (PDT)
Message-ID: <5d179842-12ac-4b5d-b87e-098643e7cfd2@baylibre.com>
Date: Mon, 7 Jul 2025 11:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Nishanth Menon <nm@ti.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux@ew.tq-group.com
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
 <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
 <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
 <20250703122813.jh2muwzwe4ok6b6d@process>
Content-Language: fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <20250703122813.jh2muwzwe4ok6b6d@process>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_030000_912741_1C545515 
X-CRM114-Status: GOOD (  18.32  )
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

Hi,

Le 03/07/2025 à 14:28, Nishanth Menon a écrit :
> On 09:25-20250702, Matthias Schiffer wrote:
>> On Tue, 2025-07-01 at 20:57 +0200, Guillaume La Roque wrote:
>>>
>>> Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
>>>> On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>>>>>
>>>>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>>>>> select on ARCH_K3 are not needed anymore.
>>>>> Select MAILBOX by default is not needed anymore[3],
>>>>> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
>>>>
>>>> Hi,
>>>
>>> Hi,
>>>
>>>>
>>>> what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
>>>> on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
>>>> not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
>>>> enabling other unneeded features to pull it in.
>>>>
>>> With master branch if i apply this patch and i do make ARCH=arm64
>>> defconfig and check in .config  both TI_SCI_PM_DOMAINS and
>>> PM_GENERIC_DOMAINS are enabled.
>>> with linux-next it's same. i don't really understand link with  PM part
>>> in this patch and boot issue on your SOM.
>>>
>>> I probably misunderstand something.
>>>
>>>
>>> what is your problem exactly ?
>>>
>>> if you can share log or link to jobs
>>
>>
>> Hi Guillaume,
>>
>> with arm64_defconfig, this problem doesn't occur, as other CONFIG_ARCH_* symbols
>> also have "select PM_GENERIC_DOMAINS" (with or without "if PM").
>>
>> We are using a smaller config specific to our K3-based SOMs however. I have
>> attached a defconfig that shows the problem - if you use this as the base for
>> .config on linux-next, there is no way to enable TI_SCI_PM_DOMAINS, as nothing
>> selects PM_GENERIC_DOMAINS.
>>
>> So unless I'm missing some other configuration that would actually be useful on
>> the K3 platform and that would pull in PM_GENERIC_DOMAINS, I think that part
>> needs to be reverted. I can send a patch to that effect later.
> 
> Is a better approach to select PM_GENERIC_DOMAINS in
> drivers/pmdomain/ti/Kconfig instead of depends (similar to what
> drivers/pmdomain/qcom/Kconfig or drivers/pmdomain/arm/Kconfig does since
> TI_SCI_PM_DOMAINS requires PM_GENERIC_DOMAINS?
> 

I send patch to do this :
https://lore.kernel.org/all/20250704-depspmdomain-v1-1-ef2710556e62@baylibre.com/

Regards
Guillaume

