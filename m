Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE70EC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 07:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkwC4yo/St1MU9GrbOiGWT5f1H9mKSQMNgvX57ikxsY=; b=FbPp5T3+x0ll88xwv1D4HjfOGA
	JhVGUU1U6oE1ZrU5QxArykib6WXsM16nCq1UQnnDkAg5gdG9FQcblCzpmbN0uhxuH5zR51sYcXeWu
	y0VTsefwDskblFPWDnwO1sEdPLmjfkBD3PtLBvmJA9BypOBQFALardhRMPJS1wOkNu7FqsrZf1ruz
	W9Hji7crSVoP9cKW3dR8ri7Vs30K3UabTg9dBMpof81a6sUlFyNwMrlcVtwoqOaFy5LXbtA2YTwAG
	e7sy8eyzhMnrBZ4J39DBI6z9M5yBezhGqdk5YQc7IOyvG6W0vMq7bsRvRMWcGNJEP5WVxmb+zX/TO
	4A35D2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7Gr-00000006Uwy-0Ifa;
	Wed, 12 Feb 2025 07:34:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7FR-00000006UkE-0f9m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 07:33:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21f55fbb72bso84174205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 23:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739345605; x=1739950405; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkwC4yo/St1MU9GrbOiGWT5f1H9mKSQMNgvX57ikxsY=;
        b=iej+E1zUWoRAJAUTLS9BQdeH5TXyJFqSsHER3THtV2HMknmXFeNDmnnMXZ/UawbqgY
         rjeu+UhN+Ben8gxczvBmSXyoXe0QodbsOK78R0tQCiM4ASqb13z1kKFoKY7R4AyO6sla
         c/rydPsIW4cLJu5zKkAmlAwNkO7h1KDQ2ZJuxybeIGbx0+mSWi5WFmKVBB5IC3MzbOdd
         piWNRvBdsdqnNYQNzzHAJ1b97KMC+5GIJtVzwLWCbVLrkcFy0V8wUQuU+ra12AEliYyl
         9LilqcVrl/sDM8gj9wsfReW87ntRFXP3tvRWJaKdPVD+gGp6CxEwcBUzn0DEF2A5IB9J
         GaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739345605; x=1739950405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkwC4yo/St1MU9GrbOiGWT5f1H9mKSQMNgvX57ikxsY=;
        b=UgFNFKlz6U7t4DHZsS6buBNg5ZxtqmweRHTMLU051oOXAmctcQZFyVkaiG55/7c/Bw
         YA2FDpqdOEDtlEZlqzLZlp3TBvMK6EEN8NZzCzp9ZO0/OZh1zBYyVqsftujYnMvGjS4u
         z90CSUyG/Y9p8B+foaAs0Fe2Cw74VQIyKzrHtjJjpeUJO40fpn3IM+ui9z4+9lS6Mt5E
         kiCaE4V5Z2r5frNzWvvi6EOmqiNsia/2dOqOVXTSb4YjOizh/KIOQe5OCJxBBhU7AXqC
         y9VjI4m7fHoPn0q83rha++Qof3OiHWEc/Ls3j05Ze+Olm/fJlnmFeXLlA5cjRDU4uyQ2
         m+9g==
X-Forwarded-Encrypted: i=1; AJvYcCUEx882az8sVceRRj7KXvbbqlIW4hmv9x8G1MQYD4kTuf5V+Pqy6E0JkLwB/gXKJ/Yg6aHtoTK3kgf4sTU2c6d4@lists.infradead.org
X-Gm-Message-State: AOJu0YwzB8UDQQRq0GxGRMtutYnEj3hi+m5qNYO3F48ry8j2hX2IUVZC
	94fAj6b8ewACQZdVJl05NsnVv2gCzjZv1fpmx0B7n/+xYSpNr4Hh9LPhgg4QWlY=
X-Gm-Gg: ASbGncsKFjd1m4fvmGOuOcmtBgNbbJHHaLVaT8iyGdsl3NDg1kzjA/mgHlYKIm7+nXq
	VesiPBkeJ0JXtAilyV9ZKBIgD+BhuQH7yFszzi7CgykI/jMwAz/WGmGISITcUEq2loEFvfTDt4d
	TTk68G0A7QBGIYQIaljY8T0nrJBTjcctK8YpxEC5U9dHkPAMXJ52ul5fNm0kt/WCegCZ+I8MQ6R
	2BA9K6qGRvssw3yreAvMmY+1axyXN9OwVc2SIMvcgNNlcdkJA5JzkF7ObEgC/EmVhnBJqLNOpiR
	Mz2CoLpRgT1JMS9Zn3sdedVNdljQFtsa31FRViuWmw==
X-Google-Smtp-Source: AGHT+IGiuGc7iBWpCw3G4pXH50ZiqqPYc7UNNfOGWQ0h2PpQXVIqAav7BnmCxlwuHgBLLmHBduzIkw==
X-Received: by 2002:a17:902:fc4f:b0:21f:7821:55b6 with SMTP id d9443c01a7336-220bbae2543mr35144095ad.13.1739345605349;
        Tue, 11 Feb 2025 23:33:25 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650ce0bsm106755595ad.21.2025.02.11.23.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 23:33:24 -0800 (PST)
Message-ID: <2e194c31-c177-496b-8e53-a20625e20a2b@bytedance.com>
Date: Wed, 12 Feb 2025 15:32:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: pgtable: fix NULL pointer dereference issue
Content-Language: en-US
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux@armlinux.org.uk, david@redhat.com, hughd@google.com,
 ryan.roberts@arm.com, akpm@linux-foundation.org, muchun.song@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <be323425-2465-423a-a6f4-affbaa1efe09@bytedance.com>
 <20250212064002.55598-1-zhengqi.arch@bytedance.com>
 <CAM1KZSnWFivV-7nc55MBAEtdP1LXfW4eLKa-94HPZaTP0AOPrg@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAM1KZSnWFivV-7nc55MBAEtdP1LXfW4eLKa-94HPZaTP0AOPrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_233329_194964_55FAF994 
X-CRM114-Status: GOOD (  14.44  )
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

Hi Ezra,

On 2025/2/12 15:27, Ezra Buehler wrote:
> Hi Qi,
> 
> Thanks for the fix. I will test it as well as I can.

Thanks!

> 
> On Wed, Feb 12, 2025 at 7:41 AM Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> When update_mmu_cache_range() is called by update_mmu_cache(), the vmf
>> parameter is NULL, which will cause a NULL pointer dereference issue in
>> adjust_pte():
>>
>> Unable to handle kernel NULL pointer dereference at virtual address 00000030 when read
>> Hardware name: Atmel AT91SAM9
>> PC is at update_mmu_cache_range+0x1e0/0x278
>> LR is at pte_offset_map_rw_nolock+0x18/0x2c
>> Call trace:
>>   update_mmu_cache_range from remove_migration_pte+0x29c/0x2ec
>>   remove_migration_pte from rmap_walk_file+0xcc/0x130
>>   rmap_walk_file from remove_migration_ptes+0x90/0xa4
>>   remove_migration_ptes from migrate_pages_batch+0x6d4/0x858
>>   migrate_pages_batch from migrate_pages+0x188/0x488
>>   migrate_pages from compact_zone+0x56c/0x954
>>   compact_zone from compact_node+0x90/0xf0
>>   compact_node from kcompactd+0x1d4/0x204
>>   kcompactd from kthread+0x120/0x12c
>>   kthread from ret_from_fork+0x14/0x38
>> Exception stack(0xc0d8bfb0 to 0xc0d8bff8)
>>
>> To fix it, do not rely on whether 'ptl' is equal to decide whether to hold
>> the pte lock, but decide it by whether CONFIG_SPLIT_PTE_PTLOCKS is
>> enabled. In addition, if two vmas map to the same PTE page, there is no
>> need to hold the pte lock again, otherwise a deadlock will occur. Just add
>> the need_lock parameter to let adjust_pte() know this information.
>>
>> Reported-by: Ezra Buehler <ezra@easyb.ch>
> 
> Perhaps a detail but, maybe better use "Ezra Buehler
> <ezra.buehler@husqvarnagroup.com>" here.

Got it. Will wait for your test results first.

Thanks,
Qi

> 
> Cheers,
> Ezra.

