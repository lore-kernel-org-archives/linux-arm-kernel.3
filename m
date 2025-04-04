Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10C8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vi+0cSJTE6iZRGZetauXjMyGZcNe7axFfDHJbW+LGCg=; b=3crKSGXaYYE4XiStiR5vy3ybhm
	sqNn89Pujt2KRVx65ynvNk+22VnbdTITeSYZn35BoI5Z6l0M6Y5QOPBNbDzCn2u1IJlwfgFe7Unp6
	y7uAP7g81Y9uI8uKJ8jMsQgq9+0pqwXXzMKzCObwP7IjF9ROFI7CibBQlVkCwB3SIWZ1zqro0AuQN
	zqHjpH+pTeygJTw+lxAG1Lj4QdMOs8K89jr8cXKrl1LgrFs9t9Ytmb56S1MrWQMcREijqB7e0YoZs
	7ZKn3Zg94AeAcnOsV5U3QHJBTRu6PwzHvGQkPcd8A5Mt1dPay/P8ZSXkls+CQiD9RU6baKdgpxmea
	WgDCgMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nWK-0000000CmCm-4Bgc;
	Fri, 04 Apr 2025 20:20:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nUY-0000000Clxe-0kpP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 20:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743797897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vi+0cSJTE6iZRGZetauXjMyGZcNe7axFfDHJbW+LGCg=;
	b=BjcOZQvYF5NtjZrLz2Kf3WyNWiyXg8IfIIJ0SZw5JtA0C+jTK+sy0bCxFSQX7kj60qdCvn
	DfevsiF1ljN97iiQANZwt8MKAVPlu2h7k2bRM95l7ZhBfmpSqEk+rfE2wwZ0TCPo/Drtaf
	gDw/vV5gaQLcp84jPVKscnyIN0QTVco=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-5tLdWu4EMbKBUQvrvCK42w-1; Fri, 04 Apr 2025 16:18:13 -0400
X-MC-Unique: 5tLdWu4EMbKBUQvrvCK42w-1
X-Mimecast-MFC-AGG-ID: 5tLdWu4EMbKBUQvrvCK42w_1743797893
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso12738215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 13:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743797892; x=1744402692;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vi+0cSJTE6iZRGZetauXjMyGZcNe7axFfDHJbW+LGCg=;
        b=tSwDMhsKTnqzhdb8JsXgJgT/xf4WFjPWqTKVxMESH4zM2fUoZykVqdIPwAh+M6QNWJ
         9Hlsg67yIBb8vJvzeTJROCCVJlZUHGgGRYTJJi/rwHbqPA//etroes3hWGXPu5OgWdae
         mq2P8E6GkK7yQuGibdJKwer0M9fBaDmyS0W6Qv3jVZ7dZkmTimZzClXVe3TwpujZJClZ
         YGLEOc/RODJnuMLQIqKDjX5ttzlqscEjx0N5YNzKmEYcHDdXCCwDc6BIQkF9LGoqJm3Z
         brHtdWxB6KRSdAY17LCV8i7pUcJsmtkrTQMlVPPJa/688kPBhS9kaQGR9Ucx77Ssh+MX
         kmBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdgLD8fmwJGcp0LxOu6VF75DGetVxj6tpwskG5l3GZv6CiDGmoNPP8dAWb9aXXYqkG15bEBFxtzXqmRHAdEfxb@lists.infradead.org
X-Gm-Message-State: AOJu0YzpxwIQRV3d6JFKI77P/d0OJcnUu9b0/D9yQEdlRiP29BOUm/8A
	PK4ucVRDGAZqrC3/FzSh6TJ1E2PLE1cEs+MBnuAuhmRgLZILyNBRQD5qi+cGhy6O92iCPpCBuDi
	CBtLTBnWEg9YUQapwMpMz/KlG9fHUTUU4XC7pkn9/oDFjdYXbZhAntSCwFfWlqtQGhjggNiZ+
X-Gm-Gg: ASbGncvJZ3276KDG9Mo6MXD66vXVUe2yl6+GD6Mz76CDpXwJfQAAYpZ4N5Fepxt/9dA
	01IZWkTaWPAZJD0IKNrssgM0X+J8VM2mPgA4xLps0rd0qKGZbMLHqiwvAmSbw9pU47F4ngndYZu
	YVbpf48RueZwqq7NNbQpPq0N53lqGtCPn7pVzq3q5rq/WKzd11DaqPopLbZ9dqgXdyPtYaoUzA0
	1zXLRrayXtkOxSToQFjFhh5kjLIFoqZrzI172Mt7jfitpaYx6uupbUqhqB2MgUR+NBLu8+lsmbn
	WBbL7lsUy5/OwYTZJAi5zDt7iDMm5MBpoGxEnbzJBa9z8sYEmE9Qcahzwr8fuag+6ldr+DkcjYm
	BCbyQJyhpHlP1o7ob/d5czAhZWYmqxvSBx1QIJJuXkwM=
X-Received: by 2002:a05:600c:1e0f:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43ebee7417dmr99071605e9.2.1743797892631;
        Fri, 04 Apr 2025 13:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH71E37FWqlUk0xsBgnBlJF2qjX7NqJqBhqH/W1b2t3I8kJZkGQcK6qSo10KHCgRRFmG7x9vQ==
X-Received: by 2002:a05:600c:1e0f:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43ebee7417dmr99071495e9.2.1743797892282;
        Fri, 04 Apr 2025 13:18:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm5197359f8f.60.2025.04.04.13.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:18:11 -0700 (PDT)
Message-ID: <b9bef969-249a-41b6-8a28-a34be4318be7@redhat.com>
Date: Fri, 4 Apr 2025 22:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] support FEAT_MTE_STORE_ONLY feature
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
 anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, frederic@kernel.org, james.morse@arm.com,
 hardevsinh.palaniya@siliconsignals.io, shameerali.kolothum.thodi@huawei.com,
 huangxiaojia2@huawei.com, mark.rutland@arm.com, samuel.holland@sifive.com,
 palmer@rivosinc.com, charlie@rivosinc.com, thiago.bauermann@linaro.org,
 bgray@linux.ibm.com, tglx@linutronix.de, puranjay@kernel.org,
 yang@os.amperecomputing.com, mbenes@suse.cz, joel.granados@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nd@arm.com
References: <20250403174701.74312-1-yeoreum.yun@arm.com>
 <1618bf36-7f7a-4d32-a6a6-242323007d67@redhat.com>
 <Z/A0HJNtUkL+THCk@e129823.arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z/A0HJNtUkL+THCk@e129823.arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rELHfQmpnnLyAOy8mE1hQZjCpgvoFukUWsKOi_uYyA8_1743797893
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_131818_299515_8966B7DB 
X-CRM114-Status: GOOD (  17.25  )
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

On 04.04.25 21:33, Yeoreum Yun wrote:
> Hi David.
> 
>> On 03.04.25 19:46, Yeoreum Yun wrote:
>>> The FEAT_MTE_STORE_ONLY feature provides support for
>>> tag check for store operation only. read operation is considered
>>> as unchecked operation so it doesn't raise tag check fault.
>>
>> Can you add/share more details of what the implications are, how it would be
>> used, who would set it, etc.
>>
>> Just from staring at this short paragraph leaves me rather clueless.
>>
> 
> Sorry for my bad.
> 
> ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
> MTE is built on top of the ARMv8.0 virtual address tagging TBI
> (Top Byte Ignore) feature and allows software to access a 4-bit
> allocation tag for each 16-byte granule in the physical address space.
> A logical tag is derived from bits 59-56 of the virtual
> address used for the memory access. A CPU with MTE enabled will compare
> the logical tag against the allocation tag and potentially raise an
> tag check fault on mismatch, subject to system registers configuration.
> 
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.

Oh, so other operations (read/fetch) will not check the tag.

> For this, application can use PR_MTE_STORE_ONLY flag
> when it sets the MTE setting with prctl().
> 
> This would be useful for debugging purpose
> i.e) finding memory courruption point, use-after-free and etc.

So what's the benefit of this relaxation? I assume it's faster because 
less memory access has to perform tag checks, and the issues you mention 
here can still be mostly caught (not all cases of use-after-free, but at 
least the destructive ones).

-- 
Cheers,

David / dhildenb


