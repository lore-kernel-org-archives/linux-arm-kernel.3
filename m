Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91957C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 02:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPJrUAVVU255VluMM4NRpdJMTLeQod8b802zAHP71IM=; b=yBUvLWPtrwu2f0FV+SzE8tjRsN
	P64YS0FNFZgERRSso+PO8zZNkykeqmXBlp1U1MZws2eNheR081Rkkmrg3E5PRWEDZMcPTTSdnXz2W
	WqxCN2ly7ce+j5PF8nkDpNHbFeirVGv/PPA55CzQ7LT8T+3vIhrQIhzaBjcGds7JA2o5RxPo++m6s
	MqL4rjleuszes300o4RERv9+ztG8k4QUluVD/1DC7QpHHBEgTLJkcmT3d0TjKoxtNECfi7tNOYvgy
	cuYhLQh7HdWK9jI/0qe72L6r5FCtUK81SJpQ0Qbv/iTMKm9RNGjbRSd8k7QvIzIdBLMmicthf08ya
	lFppf6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkw8u-0000000GIvt-2uqu;
	Thu, 20 Feb 2025 02:18:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkw7P-0000000GId7-1Bwu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 02:16:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220ca204d04so5269295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 18:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740017806; x=1740622606; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPJrUAVVU255VluMM4NRpdJMTLeQod8b802zAHP71IM=;
        b=KLV5ykzn6zylBP+Dd7uvZ2HUvHHx1azMujjxTH+HIPTS9or2BLkWWPLHJ748NycoPO
         YGnr3Nyc/uEk75Olw5aClpaPejwlkIJQupxPyywxN9nldBZgntzQwFJUxg2/IDAjIBSy
         RJALJyxGviB01saUPi99SmyHkDGTJLC9gnt8ngkPH/hX64xuqiOkCyeyrE8ljCQPRBDO
         26QdT4ctmzSup8Mi3LlM9UH50NJwyLHGg8eNWGVO2tZRmKROV9Lvhu4djv5Ll0UFYRP2
         Uid4CgkI0L/WAwZ4KewhiEzdshupcoFoqYje2r9i3c6LYpk0P2rN/lmCHtwSh/A31tn5
         fAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740017806; x=1740622606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPJrUAVVU255VluMM4NRpdJMTLeQod8b802zAHP71IM=;
        b=g8X6qFjbQijWr6apvmBmcdj9jrJJ7jtFrYeONBEA3AJEwhOu4Z1WMnCIlo2W8Lt6aW
         sxamjiKnpcdgYcT7sFDS/46jTHHJVGiEWp/sX5LL0NPRB7+5eQ5v5xCsAlQA9n4cYBgd
         ZIL85tiHoc2FG1etBDBRgCcSoGyzKiTRmSewtpv4gxPbgzUKUI5zOSpDt2PHJgjWCiar
         /oT6EE62KBeJdaR+DzonMb+NFI9DfzE8F/zeNdyvOTmtSHbk2hxIDBD/F+5Norc2MrwS
         xhdZGFnJK5Ra6Y9AEefrmJrRQOvL0cAySPh5a5ZwJU/kGbu9Z61dKJ+KJpX+EYsVKlW4
         AV9A==
X-Forwarded-Encrypted: i=1; AJvYcCXrZYHzJDVX5GgmLgY53IrU3DxZwNtDzsdzB/xu1PE4nETwgl4P3xwklOKjKKoLhwhziLJclc7lpJ/zDd2D2qRn@lists.infradead.org
X-Gm-Message-State: AOJu0YzoqZq1IDMM18R3wAuXks1ooqatI2We+ETRMK5HO0sr8yrihYO8
	mA81R9oetL0pGwBuPUO04sBEy0CDinP3oJ5emUSdPy0S7r5nsa01wGBXz+fnpLg=
X-Gm-Gg: ASbGncsiZNl2WOHVdj8VCteccJuIEmyYZ3UFxOXNgQNAf3Mv6jeTGJM34N8WwOSV8GP
	oInapX/ECZTLt92A4r5NjR5HRywZ4Eaqs63tbGzqqnknce9fTU2BKrPxJcyDodGIRfoWatfhNLT
	saB/wB73hKfX8rHLjlxOul7I83nVHQr5MytL94jPSHcjQSzbuntNTP8OIGmPgagtKR7Rf8/yGmZ
	C0PynnrlgQbHEtcP7/Vm8j37yN/JlSLtmKo1vTDMZp7HtpPu47luY6obA7iz7RbiAje4vITTb4v
	mBLQ728atXyu7GDX8SthRG9l4ZVTDj3oAGkYCCmL
X-Google-Smtp-Source: AGHT+IHsrTf+2IUgEuka8Rdp79QumYTvBN07QjGvbatNc0HfOYKuhS5UhceZtzQLSBZ2eikrfT+dcg==
X-Received: by 2002:a17:902:f609:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2217119ecc7mr89900345ad.42.1740017806519;
        Wed, 19 Feb 2025 18:16:46 -0800 (PST)
Received: from [10.84.150.121] ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22116f0c907sm69252675ad.222.2025.02.19.18.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 18:16:45 -0800 (PST)
Message-ID: <5c5232ee-4b4d-42a1-9be9-3489f93f7590@bytedance.com>
Date: Thu, 20 Feb 2025 10:16:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: pgtable: fix NULL pointer dereference issue
Content-Language: en-US
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux@armlinux.org.uk, david@redhat.com, hughd@google.com,
 ryan.roberts@arm.com, akpm@linux-foundation.org, muchun.song@linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ezra Buehler
 <ezra.buehler@husqvarnagroup.com>, stable@vger.kernel.org
References: <20250217024924.57996-1-zhengqi.arch@bytedance.com>
 <CAM1KZSnM-imYwM5Gf4gw8yXr1+6PXyLvbpKbBu_KJmPR0WS7cA@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAM1KZSnM-imYwM5Gf4gw8yXr1+6PXyLvbpKbBu_KJmPR0WS7cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_181651_656861_E9AA125A 
X-CRM114-Status: GOOD (  16.00  )
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



On 2025/2/19 18:58, Ezra Buehler wrote:
> On Mon, Feb 17, 2025 at 3:49 AM Qi Zheng <zhengqi.arch@bytedance.com> wrote:
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
>> Reported-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>> Closes: https://lore.kernel.org/lkml/CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com/
>> Fixes: fc9c45b71f43 ("arm: adjust_pte() use pte_offset_map_rw_nolock()")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
> 
> Tested-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> I confirm that this fixes our issue on the AT91SAM9G25-based GARDENA
> smart Gateway.
> 
> However, unfortunately, I do not have a 4-core ARMv5 board at hand to
> test the CONFIG_SPLIT_PTE_PTLOCKS case.

Got it. And thank you very much for your testing!

> 
> Cheers,
> Ezra.

