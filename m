Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4D5C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=444nNZztaKWrtZLx1q7kQKh1w+9LbHm/QlTHTnrzmNI=; b=LvpsTi/zOMMIV2qsOqXwdvgeOl
	2DfscvIbfBCuTwtC+Jh/Tgs9S/BbRF4oO/xIxmEjf9EGj5gLeic6Ye5ZG2BWBl0JItlvEwiLIkV18
	QXOZa290mEOe4v/QI39U99kqx24YyMiERx3OXHaKqC9/91NGQXuPiG/RfnC/o6luRd4QDCk2ECw4g
	ebRqVfvICQwGxv6e2psMAh04CXFs43Gvi/qQ7cmV004uDHRRVtHVMBQ54ZC6hCKkJ4TiWZ2fsiTBP
	ml0yyJ+8LFCo8mVjcdlRXMbwPmsdYWIZJfWQ2WL4Gxt8Idfg8XwYhznwoaq/lfh/j3zUK8GjeYKSR
	qgNgvobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26al-0000000HInB-0BjP;
	Thu, 03 Sep 2026 12:30:55 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26ai-0000000HImE-3WQJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:30:53 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a7e0ff423dso676867a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788438650; x=1789043450; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=444nNZztaKWrtZLx1q7kQKh1w+9LbHm/QlTHTnrzmNI=;
        b=Ye+LzxPvGbW66H9vS4rj0ZBb6nbSaXCHppZ+Dz8H+zLo6qQJqwn244Pv6mdM1nwMaB
         0B3gQaHFM8Ix5RRRNNGsosT/W0CUMeTdY7BYxGterr6L/ZTOGoqr7xO6NGa1nC+x9Sjk
         dlnDTwmO2jClllLd3FVuLeKSPIvGvGD/BiSXU8Yo6n9D4ETs6SCEwwHP8jVMN6fqQfS2
         XWOOAvsOorjerABWmB4HDvKQ6yvflynf3UOab/ysUjvZL2LjhTqQA10Qy9a1l/mXFZHb
         O75xDdGIwV1Mu/T8MeoIinivmB4DNisYgClqABIp1OR/9BcZhuAkGWyGVCAbO4tprkL2
         XhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788438650; x=1789043450;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=444nNZztaKWrtZLx1q7kQKh1w+9LbHm/QlTHTnrzmNI=;
        b=Kv20p84ch2r8bGa3Gy0DxmoWQWS6V5ypWwb4sDka5fhb+a3uA1odkpEPwIMWzYJmWZ
         M/ZiYQ9AsXYOdn8IezfEC10kJ91rB8dOxt05qn/F1MCXcbYlziq1P6W8mmjnx15qqP0M
         FUGVMvePu55fUI0aqH8X6KuprfzZ2V8/7SxIdvWY3n403LyhXvhcw7bSzwTFTF0bls6f
         Gxxh8gfb5Q1KQBU2Mh+7ew9SDEWMCpB+/4n10ivj0rgU/Kn6eRAZNqZQcXkW0L+Oy0oC
         tFykmVaXuSSZBbVldxEH1+pepHHBiKwnyXJL9SuHPhPtG8DjyseUw2t7yYtHvk7VK3aY
         WPfg==
X-Forwarded-Encrypted: i=1; AKwUvBx6PLPyypbPkMCD9pzi5+vUCkG9qYXVGVWMo6AZNlHffGC9veNqv8ystkEynX2PSi2uY3FXixfO1ldmFMcO9hz+@lists.infradead.org
X-Gm-Message-State: AFuF++lbrl9ehVgEz7tauYu3MDDvZSviV6dZFPRuESIOF/P87JiIteX2
	V1+LriYvxqWc9MgWGhYi13o2wcwAaEKQAmyuaL1p8/v8u3TsBhvNuDO9
X-Gm-Gg: AYBFou3gAj7HwufLD2YQ05pky99M/Bu6/0m2FFWbWFx2zqBOOJwLbp6nbeNfs4JUCUL
	B7vHXYUXHC/VAP6dE+eI4pbqknCU/VUxmVxrzRyj5CiUF6bAMByNJRD8lohZoY2Z7chdDofGvQJ
	lOYz3BXqDeaaLAb04sKxMudnlrprRPBb/8niojjfGNvWnjH0Q0s4GskIh9WaKnKVuEXuJAA2pZQ
	bEtdiuoM7qhlHt9AuzoiSZYlJD0mM5R9qxzIMh7T6ty4a2tqQG1JeEZtTeO5V0238MdIPejhp6u
	v1M7Qoy80n1qq6QPKcIjsumO0KI5CyI5lZzXp1axXHmPuNPaDmF5paqpFzKPRJsujtiQS7LxKci
	sww2iGImf6wGfRHDvzvfOay6v+RKshAz/nzkprmsFZBFhjlVpHWYe0ulEWuD11I65UMt/izPwBs
	6FM+HhI4zBf3N3ml3vvV5fUOr5HGHJ6xcNshmFB/HRUVqpqhL8DWTJ0WbsQpCcqZmIXsSGbfrW/
	/jNGMs4Mva/IUul96jJNQA=
X-Received: by 2002:a17:907:8323:b0:c25:f7dc:2e0 with SMTP id a640c23a62f3a-c25f7dc0985mr85901366b.33.1788438650154;
        Thu, 03 Sep 2026 05:30:50 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm2265294a12.4.2026.09.03.05.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:30:49 -0700 (PDT)
Message-ID: <1d7f8806-f4a0-fda0-a361-a011460ef308@outbound.gmail.com>
Date: Thu, 3 Sep 2026 14:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
To: Mike Rapoport <rppt@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
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
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
 <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
 <apgSCyj-h2xVc2ss@kernel.org>
Content-Language: en-US
In-Reply-To: <apgSCyj-h2xVc2ss@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_053052_916718_66AA6D54 
X-CRM114-Status: GOOD (  19.22  )
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

On 02/09/2026 14:09, Mike Rapoport wrote:
>> So using vmalloc() may result in a malfunction in the data transport where
>> the __get_free_pages() would have been successful. This outweighs the
>> benefit of a somewhat higher probability of success in allocating very large
>> buffers, and surely the improved aesthetics of the kernel code.
> kmalloc() still works, just like __get_free_pages()
>   

After these few days of discussion, this is what I make of this topic.

The memory allocation in fifo_init() is somewhat ugly, but this driver 
has been out there for five years, and no complaints from users.

The vmalloc() option may be successful sometimes where the current 
allocation will not. On the other hand, there is a possibility that it 
will cause real trouble with page faults. Plus, a large allocation with 
vmalloc() may be a weak spot on a platform to which the kernel is 
partially or poorly ported.

With __get_free_pages(), there is no doubt that usable memory is 
allocated right away, and that it will work that way on every single 
esoteric platform. vmalloc() leaves us with "we're pretty sure there is 
probably no problem".

So I vote against vmalloc().

As for replacing __get_free_pages() with kmalloc(), it's a matter of 
taste. I think that if you're after a buffer that has a power-of-two 
number of pages, __get_free_pages() is the natural choice, and using it 
makes it easier for the reader to understand what you're doing. 
Replacing it with a kmalloc() is confusing in my opinion, and requires 
that the reader is aware that kmalloc() falls back to __get_free_pages() 
in this case. So we actually want __get_free_pages(), but call kmalloc() 
instead and let it fall back to __get_free_pages() so we don't have a 
cast and don't need to save the order, and assume that everyone knows 
that this is equivalent.

So I vote against the kmalloc() thing as well.

If this patch is part of a larger kernel cleanup, I suppose my votes 
don't count for much. But for the record, this is my opinion.

Thanks and regards,
    Eli

