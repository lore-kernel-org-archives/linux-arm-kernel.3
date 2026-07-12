Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D59C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fbs/vqVzKn+85kzPKYeZ1NqmstNGnGRdCkYCUYt2Io=; b=V0mJ3sg/IuYUo4hbVJYLFPA5Q+
	q2xTjHjKOcU2XvIeHsN4/az70+S3FWS/c8ZGU36HqbtMcTji6S/1yk9mRXb2sP5L3EYrwQa2qgHwZ
	oG11+JIaMdgiQ4mh/r3n7hgs9AYg1Eu3rqdA4ivx5MVwtpucNGLoeQpxVEA6MgbmWmpr0wOciWSOm
	ClHpeYqHQVAaVhZofOsLXVMCIyxpZEwwBDnDIVXAL52ODHFClClU/UhHJUknmukCkEvi4w+uaNif+
	sHqFzHmVWjEkAbMq4VxQoLPUgQ++Jbcn1/9q/gCV4ZhJaTfkICX2SMa/jCSpThs3P4zQyecQBVN1O
	lFJ+JOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wis9X-00000007Ohy-3DM8;
	Sun, 12 Jul 2026 11:15:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wis9V-00000007OhZ-0041
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 11:15:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEBC31682;
	Sun, 12 Jul 2026 04:15:10 -0700 (PDT)
Received: from [10.163.128.224] (unknown [10.163.128.224])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C6C83F85F;
	Sun, 12 Jul 2026 04:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783854915; bh=Vcd4S0/n1YBbjJkz56jbHGzwyr7k7DTjasJ05V+hMWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nNp3n2hPRF8jFhWCZX6wCuIbywwiB3hYynuZDcOYT44BI3Z4iB+WamOKaMhu7Ztkm
	 aoEdfHGxwxX+AoMnBbwN1J2wesaWqnIwAMByMteWUpiVRBSOApwddXXMZIzJyah/iQ
	 jM7CyliCS7kY/pAOTFvQv0J3UCJFdtZjR+aYOmNU=
Message-ID: <91dbf255-a549-42e1-846a-a9c4d290fa2c@arm.com>
Date: Sun, 12 Jul 2026 16:45:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/vmalloc: acquire init_mm read lock on huge vmap
 promotion
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 David Carlier <devnexen@gmail.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-1-5b3794c113fe@kernel.org>
 <d47ac961-4767-4ce4-9c75-f281beb24e42@arm.com>
 <2026071252-sweep-quirk-a068@gregkh>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <2026071252-sweep-quirk-a068@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_041517_276284_DB815EE8 
X-CRM114-Status: GOOD (  10.36  )
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



On 12/07/26 1:31 pm, Greg KH wrote:
> On Sun, Jul 12, 2026 at 01:13:12PM +0530, Dev Jain wrote:
>>
>>
>> [-----]
>>
>>> We also define a guard class for mmap_read_trylock() so we can use
>>> cleanup.h to make the scope handling cleaner in the implementation.
>>>
>>
>> Will this cause backport problems, I think this scoped guard thingy is
>> not that old?
> 
> Don't worry about stable issues until after the fact.  Fix things
> properly in Linus's tree first.
> 
> And scoped guard has been backported to many of the LTS branches
> already.

Nice, thanks.


> 
> thanks,
> 
> greg k-h


