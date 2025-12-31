Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17565EE645E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+hPaZspsreAv3BlbsaDeG27kbGxsQkCDH5b5xlUDn0=; b=Rqu0idpmQVVpPJVxgzBvqUKDQ1
	4sbraWvrxh8fB7WtF9A/sngiyoKeXilTu7R4oAW0VJYWBR9QpNe/c3Ql7FTO6mJge60/ugTh55VzI
	eNdI296qy6jQg+PCHWGGRiM1TI9qUG6oXX2IJMeDwuABPN+fvx99saoMFBEp20Iy6pLizr4RYedui
	gw4EF/IkYwBL0zYnt8eD89icUnRACqnNyO3bRPUpFnB088Xs6mduJ33Uas85FtpT4ax6NpMWH8yEQ
	LbNeta2y0zwJSggtfXaVTEWUZYUebfVEllOzSA3KBXnkc0UR/NdWQAoc7WB4H/BCSKglWoZTZwntU
	W1rgwmIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb07R-00000006Cba-2gPD;
	Wed, 31 Dec 2025 17:36:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb07O-00000006Cay-33RL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 17:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767202575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+hPaZspsreAv3BlbsaDeG27kbGxsQkCDH5b5xlUDn0=;
	b=dUaCXPC00STyPH5dRgaZrCDA6oegajlm3h5WhS69DffIGceHIdORvuBCtq8RLiz1jvvEE4
	ts6KOuwujVqq9PNtCY4J/PfYTbVVRQVIxgIHkTKPSPYrZdvCQTdwgfrpUqJTiJL99Lbvx1
	jAM2qkE/WDXb24v4g7cRkj6mBAL72Sw=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-vy6lIpwUO8q0u6zGVEcPJA-1; Wed, 31 Dec 2025 12:36:13 -0500
X-MC-Unique: vy6lIpwUO8q0u6zGVEcPJA-1
X-Mimecast-MFC-AGG-ID: vy6lIpwUO8q0u6zGVEcPJA_1767202572
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so18327711a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 09:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767202564; x=1767807364;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+hPaZspsreAv3BlbsaDeG27kbGxsQkCDH5b5xlUDn0=;
        b=YPynJvbdAWNYMAZVR9L780KBxKK5hbxI91G2lyVuNP6dwHPPwZvToCF77F1O7EyE+F
         zVWSCes2/35HtdVrI6mqynsMupOCGzFEgDdJQ+aHmgIEm52mvk+kHFX6iGxqIoYrO2CA
         LCugzNfOrtjGyJB/sWuPcEKV1KwYNJlDt1oQ9a3lGxqWZyPc78e4vdfkVnW3OJ2rXcwe
         MisCxxm+QkHlFDV9SCiqpqv/DVb+t+I2kgCY20ZZYWuYsgH54G6gYEVYOl9qvE9rduy0
         e2H1quCKvRtubyKJfUv9+XqeBGqvjDssL5HN49lwMrPUq3U1DRv5bgv2/SiPZd2M7DAN
         WOfA==
X-Forwarded-Encrypted: i=1; AJvYcCUw28R8zh99kHzxZT1yj6k4vad/N/tkKEIdFjA7QM99876NecMUf2991JBhz6pL75FZhYauYLSaFJJugrPV5sMc@lists.infradead.org
X-Gm-Message-State: AOJu0YyMh3HLwRi8jq5XBBWJi85d6pIsZTOJLctwiQdWOiCjSRlSDWZY
	Te6j6apFkLLBNJxsh2y9xl/2npV5Nv8a5bGN+QeXY6V/W9AmBJC+PTFzK8NNc9BalKzhxgQerLR
	AgPtekGvPbVZWcqHIpyd6aIycFekk5DLavuglglss99fIozUQlqSJFhz9f9paIfquvpZ1BJIoxj
	6K
X-Gm-Gg: AY/fxX5tvYR/Iq9xypBSL+tdrfGPMRPIjhQ6SfvNMRbojBKPpDOMeQEKeCoWgs6Tz7v
	yAYJEynktYnTgAklXbKnya6ZRZ7+8gpQfIGEHfPwsqtDkaKDQZ4fsNJZzS2QNARU+OcoV97cFFn
	PekuLjcLQfghmzrBDD3qaNm89xKHrGthQiHQg+C3UNnj73bkjjSVr5uGhI1SuW8zJUQgXuhEik7
	xLr/xn5xaJW3rS2KZti/0CP0S8pWITTNKnxF3JnvmECWV6GthXgBInoLWAb+voO+Ny1NEyBiR+F
	bEmngxhjKV1mMl2IdGT1MieUypACE+gTRF3gnkPLEJJ9wAujP1+AYS1nLP/R6cEQQu1bIfqGqY0
	5RAaVDoW6TNbY87maOjq8bCnvWSEWGy4WFWLERf+MfwPB8Lkc
X-Received: by 2002:a05:7022:6722:b0:11d:f464:38b3 with SMTP id a92af1059eb24-121722a9757mr33784171c88.2.1767202564098;
        Wed, 31 Dec 2025 09:36:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi3paBF328Dvc54FaF7ePmfKoOt8e8CqfUvXWomZaBGFhC0nmzfA+IqOZP166rR45yxweuTA==
X-Received: by 2002:a05:7022:6722:b0:11d:f464:38b3 with SMTP id a92af1059eb24-121722a9757mr33784129c88.2.1767202563623;
        Wed, 31 Dec 2025 09:36:03 -0800 (PST)
Received: from [10.61.55.87] (syn-184-074-098-043.biz.spectrum.com. [184.74.98.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ff8634csm87792829eec.3.2025.12.31.09.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 09:36:03 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f4228e20-62ff-4701-b6ce-59c99188d7b5@redhat.com>
Date: Wed, 31 Dec 2025 12:35:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/33] doc: Add housekeeping documentation
To: Frederic Weisbecker <frederic@kernel.org>, Waiman Long <llong@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chen Ridong <chenridong@huawei.com>, Danilo Krummrich <dakr@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Phil Auld <pauld@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Simon Horman <horms@kernel.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 netdev@vger.kernel.org
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-34-frederic@kernel.org>
 <370149fc-1624-4a16-ac47-dd9b2dd0ed29@redhat.com>
 <aVVAfb2eaeyd7l-h@localhost.localdomain>
In-Reply-To: <aVVAfb2eaeyd7l-h@localhost.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 18LkFCtHxX8wU-0vv6VFN-UN6NK3NwnjJuI0l0LHCw8_1767202572
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_093618_842497_DBCF82F8 
X-CRM114-Status: GOOD (  14.90  )
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

On 12/31/25 10:25 AM, Frederic Weisbecker wrote:
> Le Fri, Dec 26, 2025 at 07:39:28PM -0500, Waiman Long a écrit :
>> On 12/24/25 8:45 AM, Frederic Weisbecker wrote:
>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>>> ---
>>>    Documentation/core-api/housekeeping.rst | 111 ++++++++++++++++++++++++
>>>    Documentation/core-api/index.rst        |   1 +
>>>    2 files changed, 112 insertions(+)
>>>    create mode 100644 Documentation/core-api/housekeeping.rst
>>>
>>> diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
>>> new file mode 100644
>>> index 000000000000..e5417302774c
>>> --- /dev/null
>>> +++ b/Documentation/core-api/housekeeping.rst
>>> @@ -0,0 +1,111 @@
>>> +======================================
>>> +Housekeeping
>>> +======================================
>>> +
>>> +
>>> +CPU Isolation moves away kernel work that may otherwise run on any CPU.
>>> +The purpose of its related features is to reduce the OS jitter that some
>>> +extreme workloads can't stand, such as in some DPDK usecases.
>> Nit: "usecases" => "use cases"
> Are you sure? I'm not a native speaker but at least the kernel
> has established its use:
>
> $ git grep usecase | wc -l
> 517
"usecase" is not a proper word by itself, but people do use it some times.
$ git grep "use case" | wc -l
694

Anyway, you can keep it if you want. It is not something that is worth 
arguing for. :-)

Cheers,
Longman


