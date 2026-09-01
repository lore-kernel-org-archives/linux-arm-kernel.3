Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A03C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfkumJrDF1tZTAVRjvzgDO3hMk1gGG9KZ2g7tgv7l7Y=; b=l/fuHvtdWRmE71IQGkHBdQ44rf
	y7GyH+l2mDJ1gl52dy0O12wBb1S/6Zd9ugMmeFsHS+G9IWdu0rlPn8l1v+zRKcPqYWuFJXG6qlB3o
	93K7u8seCdHlBs0ZOcUpxjLwKXpCfraIG0SFxgg4HVYqTBlNAs8y1n+aTqiCLLp13XQhJCekQgT/z
	ZiML2j3cnMgc3L1TGKnJCkSbNfqk7snI96qnuyMWl2n/y2OW+rmub1p1vYXsNedbR7Qa7F+jn4ufS
	5CulHTpNp1FqzPx6ojlnKFx/B6+9EKFmaleMCbWUFHPVlZjpHXK58zCb4MBg0usZtKeex+dGJtoXQ
	9Q55JYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K6V-0000000BK49-1NZ6;
	Tue, 01 Sep 2026 08:44:27 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K6S-0000000BK3F-42RN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:44:26 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c207cb16cf5so738728066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252263; x=1788857063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfkumJrDF1tZTAVRjvzgDO3hMk1gGG9KZ2g7tgv7l7Y=;
        b=gqbnJUOydr6GA9eNRS4Re9dJ1I8boGPAinLmX0Up9/fBPO/5mvR8cAjYQciuLGQAhf
         z8GvDwpP5fhoZSELpA67Q/oe7COUi4k80F9lWKzLi668nLX8ijgvKrcK1edmi7GyhuNz
         MfN8L4FOzNfssUcxBhU6RIXTNARRu3WNDcQFO5aWnoizy5B4jQ85Uol5KtntGhjuhqeY
         ytiWFjJMz712755AvXoXJWcDfTjrA6F4enQsKeLz4uXq3efYBobhL1GrenS/VUY9qHYL
         ZLQ40DjPbEpq3Z8Z4qdG8ltTztqSAihf3uReFcCO5zK+ul6IB5JM6oGPUt14EjAHowd7
         0jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252263; x=1788857063;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfkumJrDF1tZTAVRjvzgDO3hMk1gGG9KZ2g7tgv7l7Y=;
        b=Q82+JeMCyvMi93jWWOw0UsrEm2kFMozIrZMqNSe6AuWKjR9+gCx7jMxAFERPcaxPHP
         KbnaVDZ9EBL8GAuzqCcFgraZHGiRUYv64JRzy9wALozF5abYlVonZtmLtyExtMhHBBD0
         3kxG2yNvWh5Be5T1P/0Z37y51SKRT8hqah7RaN8yS4I+aFZELjC38ff+Fz9zUPnWXnrX
         qLE0FfmrAzqtlRDnmjy/QHHx3qYNg6ZqUSMlccN6slP6BwV0SBbZWSJcatzRY70SZ4Is
         lFlTxY5hWHkdmt0tF0y+dyxQGq4lK9jTqYI08aRV7mdpm9GWr3hZJhsnBDKjxh9Hho8I
         UrCw==
X-Forwarded-Encrypted: i=1; AHgh+RqFcRAu+O6y817QRirFFHiMoVNiBzOdF2Ezw6Wj51V/NLUvKTeY0ju0ooq3SiGqemo+fN+SpG0m6MBY8TFuAaBg@lists.infradead.org
X-Gm-Message-State: AFuF++nDrby99oWHlrLyc9MjwEeoZ0ANTj7hf4J+rB5eSbuN8Zj3ZvIq
	c7BSPFjOhVmIhYV6rAaFDc8SvdiNmAmXMeHcmjmWCrRC5trtlv5Y7Kop
X-Gm-Gg: AR+sD10+69ISuX4j/FXDuNxH1FD3seHN4peTpOBw+V17CGSOgrMG8hYccNHEUztDope
	quGqv1Q3HTKlUOgeoeS4hJeYNfCBnQQoPFxQ/kUPyqIvKsWIHWaU18VUn4ZKJaxI8TFOVBqj63t
	HSIjHw3gzvMKPOol+wgTzq38ApQAFvMg1/EScLblcJhpd5DwtowbW6gtsJN1seEVOOpx6dp/1K+
	yhwDPSytxTiGSIVXo+MH/IoSIXfB5C86uN7LVDTYN/m0qDb0WFg/4JtANfvST9eBhrGhnw5tLz0
	Sq/UuGT9FJTf1AwsE2jAW4vnkauTf6T5NL9NmrnBbMjiUARUNS5L9K1lJbHWG3VgF1LWs07u3Yv
	cuQ2wG1kr0Qq5ALglezp88tsAPcuOeirklSoX+ydTT8o8kY+CeSq463P8ybnpEhhS4DlJl235p/
	Rw3WQOOl5SDL8qDsfOHBZ0wsqea3uQ8mddagELT0uD6WAJxXZmF4sE6oJVk/Yk5pKO8p8FXPudZ
	2XFvXS5uk9w8TGifIJfIMo=
X-Received: by 2002:a17:906:f582:b0:c24:c22c:6372 with SMTP id a640c23a62f3a-c25b3affecdmr382949666b.5.1788252262902;
        Tue, 01 Sep 2026 01:44:22 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255eacf6bbsm527267366b.0.2026.09.01.01.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:44:22 -0700 (PDT)
Message-ID: <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
Date: Tue, 1 Sep 2026 10:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>,
 David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin> <apaF1HUtJnstuUN4@kernel.org>
From: Eli Billauer <eli.billauer@gmail.com>
In-Reply-To: <apaF1HUtJnstuUN4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_014425_019959_1E0C001F 
X-CRM114-Status: GOOD (  16.41  )
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

On 01/09/2026 9:59, Mike Rapoport wrote:
>> Would it really make sense to allocate the four buffers separately?
>> And/or use vmalloc().
> My understanding is that the buffers don't need to be physically
> contiguous and vmalloc()ing the entire fifo->mem in one go should work.

vmalloc() is an interesting point.

fifo_init(), fifo_write(), fifo_read() and fifo_mem_release() implement 
a FIFO in software that the XillyUSB driver uses internally.

The memory for this FIFO is allocated in fifo_init() by calling 
__get_free_pages() with requests for up to 64 kiB. With the maximal 
total buffer size of 256 MiB, we have a possibility of 4096 allocations 
into an array of buffers. And if __get_free_pages() fails, the size of 
each buffer is halved in the following attempt, which tries to allocate 
8192 buffers, each 32 kiB, in this example. And so on.

This mechanism with an array of buffers complicates the implementation 
of the other functions as well.

So why not replace this with a single call to vmalloc(), possibly asking 
for 256 MiB in one call? That would mean simplifying all four functions.

When I wrote this driver back in 2020, I avoided vmalloc() because Linus 
wrote "vmalloc() is NOT SOMETHING YOU SHOULD EVER USE!". (See [1]). He 
also noted that vmalloc() is a restricted resource. But that's from 
2003, so maybe things have changed since?

Questions that arise in this context:

* Does vmalloc() guarantee that non-pageable physical RAM is allocated 
when it returns?
* Can copy_to/from_user() be used with memory allocated with vmalloc().
* Is vmalloc() guaranteed to successfully allocate memory in the same 
situation that __get_free_pages() could have been used to obtain the 
same amount of memory (in smaller chunks, as with fifo_init() )? Maybe 
they allocate memory from separate memory pools?

And most important: In what way, if at all, is memory obtained with 
vmalloc() practically different from memory allocated by 
__get_free_pages(), if it's never used for DMA?

Does the API offer clear answers to these questions?

Thanks in advance,
    Eli

[1] https://lwn.net/Articles/57804/

