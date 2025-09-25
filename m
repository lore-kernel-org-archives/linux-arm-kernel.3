Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506E9CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=it1xa6zCsSImRY+xGhkMLXcJ8czGI9ZV2cO7XzXjMBU=; b=b9jqbGjT5I5UPCLiyHHgWo+E9k
	D4uXh2X7K4wo5cr9oTNevrD67JdCI1X9yVY/kdKp8gRjK7M51OVXE0OCod9tALis2EV+Ko3fCdOgm
	TkzygBMs0B5dD6l1y8zkVxG/4k2bTyNOf2gnZvEReiB16IQPZizdUpMSZgpUHJV4fLWJtPylbw71a
	QDA8St5VqKbVQb4NWydyJz9RR/ClinAUW/jcW8diPfFvB90ivwWAvs2a/boU6HXqeLKL5Ul20K5Ab
	q6KQ/Mu6cC+NYrqn9qT2kfB1xeXKxAbLbHtFunSfUq0QEbEqXdGvI4Iw2hXzc1BLKUUmd6bqnDDhX
	pmR8HsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iR6-00000007iLl-47AO;
	Thu, 25 Sep 2025 09:38:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iR4-00000007iIp-0hbB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758793125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=it1xa6zCsSImRY+xGhkMLXcJ8czGI9ZV2cO7XzXjMBU=;
	b=LmWnD79QMX//6h8MG1gcxG9ReTbGAuwuD1E1yjwXayDmIj1vSL1mcbmp0qEXmrVKHZ8dJc
	9JamP+EqFLTqggTMlsogF2LpBQXqBoPyULKGrOO5XfnLKhCZLDlsph9IVZnBkFcHJ1ZP3r
	ejg8O/dEofXo5GwoIpXe5lpMjqm3y20=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-HysctraKNkaFxdS1N83vIg-1; Thu, 25 Sep 2025 05:38:43 -0400
X-MC-Unique: HysctraKNkaFxdS1N83vIg-1
X-Mimecast-MFC-AGG-ID: HysctraKNkaFxdS1N83vIg_1758793122
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46dee484548so4305835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758793122; x=1759397922;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=it1xa6zCsSImRY+xGhkMLXcJ8czGI9ZV2cO7XzXjMBU=;
        b=HwpHGIDP64eWUtHonybw1byO/wIJCaBQXv/O0bltUtxi9di3Rgh8OvrZTqWMald2Wt
         MGWzBWCkZfyhWVJH7lk6zCKXuN7BkTvP6iS+Xn6VMOHnq0fm0WL3oZt77I8BOnaqR3db
         oMZ0hiEi/Ie5LYqLpkQcNiew6CmYcih+dFnZPpJQMPFuoANl8YcivwkzTD+F8JOLRvRa
         0CaWu25Ss7OMZZfzK3Hmi/S2JkJPU0UVRSPWvF0noKIDgdOFGzleKk1bVAZZesXSBbVL
         7tgPdpc6UPFH1JX294VKEwnaVHkYsJEaHOtztxH8eDsGa85oFyWAyNQj0s3wkCnxRuD4
         6k6g==
X-Forwarded-Encrypted: i=1; AJvYcCV7HQ9tAVwANUzoLVVbcknv68c9w7tqAIIrqelJI/9cVenaZnUaeFte/6wRS9WlVnPbWP2yJYyIoV1O3Hy81Ted@lists.infradead.org
X-Gm-Message-State: AOJu0YxWe3VwRXuNZHIiYFNU//N7AJB2TI3n+4cLYLWvSjMHI/XnnK3b
	7KCy7CJc6sF8OmBTr9SockVS3d1Ix0jaRiiK7qcy0yTsOnz8kJFHNusR5rgHxrutFwATC9NZTTD
	VWGWTurX/IdkOFM4HoheQ1AjDuij0iGj5VimyeuEc4WCUXCKTnEYb1hBetqCEAszlNbDSmXCVuM
	aH
X-Gm-Gg: ASbGncu1z1Vz5cmzo/I8jDs31loPWx8ZyPu5Ojvw+fWSZPz1aBhI9GLfdphf3/ocs3G
	RB5oMB9K0LW/DAkl01oBcZsPp3zPwA//m0PEUtNC1Zmqe/BwQDeKMG0lG+tYuvX6gL73Zk0TMFS
	S2hDh9FhyV+PW9rsZ+cqaDazHs7iqw7AKAFX9Lsxrnr9jH+cyJbO1DPpkn0MNtvSIX8uyog1IlR
	ZvZZ6Ei9WUi+gw3vsH09iK46PSbvKHSfoI5pTp0tkdHP0HiEEOgkYipGxZfXdbU5alN9jlGZIjb
	EEw5Dhk/ZtFoOE5ecZhu1+7Ywkhj8hRt0v9uZOVpCueeJGFBToy8K/4W6N4JEI9g1HL26CkMmro
	Ek1rAbxI4BIxAtfif5eZSCM9zRyeTB2FgPMQ0D0eac0D379Bb7SnYiFloZUaDr+i6gemt
X-Received: by 2002:a05:600c:8a1a:20b0:45d:f7f9:9822 with SMTP id 5b1f17b1804b1-46e329b27c2mr24051045e9.12.1758793122214;
        Thu, 25 Sep 2025 02:38:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVxkfcKZdBRrn77cRbQGAcPMp2dfiwtZjiOl6HprH7JU8Dt7NVvFTN8NqQoWgRk2N1EMDfHw==
X-Received: by 2002:a05:600c:8a1a:20b0:45d:f7f9:9822 with SMTP id 5b1f17b1804b1-46e329b27c2mr24050635e9.12.1758793121780;
        Thu, 25 Sep 2025 02:38:41 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08? (p200300d82f3ff800c1015c9f3bc93d08.dip0.t-ipconnect.de. [2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5602dc2sm2225863f8f.32.2025.09.25.02.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:38:41 -0700 (PDT)
Message-ID: <54195a6a-7cc6-4df1-a787-45d8f564c0bd@redhat.com>
Date: Thu, 25 Sep 2025 11:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] mm: add PMD-level huge page support for
 remap_pfn_range()
To: Yin Tirui <yintirui@huawei.com>, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, anshuman.khandual@arm.com,
 yangyicong@hisilicon.com, ardb@kernel.org, willy@infradead.org,
 apopple@nvidia.com, samuel.holland@sifive.com, luxu.kernel@bytedance.com,
 abrestic@rivosinc.com, yongxuan.wang@sifive.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Cc: wangkefeng.wang@huawei.com, chenjun102@huawei.com
References: <20250923133104.926672-1-yintirui@huawei.com>
 <20250923133104.926672-3-yintirui@huawei.com>
 <f8571506-30c0-4dc8-9995-41a6469f8fc7@redhat.com>
 <8313b0c1-bf62-4257-951c-fd7e29193ae2@huawei.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <8313b0c1-bf62-4257-951c-fd7e29193ae2@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bHhjL-kyZqwE_SR--lsZyQ4836Mqjvy_wVFpYc_yXV4_1758793122
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_023846_297241_C950EC14 
X-CRM114-Status: GOOD (  10.44  )
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

On 25.09.25 03:43, Yin Tirui wrote:
> 
> 
> On 9/24/2025 5:50 PM, David Hildenbrand wrote:
>>> Introduce pfnmap_max_page_shift parameter to control maximum page
>>> size and "nohugepfnmap" boot option to disable huge pfnmap entirely.
>>
>> Why? If an arch supports it we should just do it. Or what's the reason
>> behind that?
>>
> There's no specific reason for this - it was just intended to provide an
> additional option. I'll remove it in the next version.

Good, then let's keep it simple :)

-- 
Cheers

David / dhildenb


