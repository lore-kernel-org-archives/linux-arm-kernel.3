Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C96EFB7EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 04:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBfxSWDoYDKpj5OHs8p3tr8Knq8WyhFiqvowRNbNglc=; b=GgOytRkEFX8AAn4+nEf8MZ0g44
	gJRYEqeETjYuC35J9v/kPQR9ki/txpxSM+grQBzifTDl/bwLz5hw64Oad67GJ+J1SF92v87/W2FGo
	Pg6FZSMyjKNopH5h9wm7v3BR5CLX5dTjR7M5LDCag8wGPWFaBa2jT7C+qGU+V5GX5VvE9o7YDXYOm
	91P7SGulHguRR05fJ0YiEHsQa3CTcWX87NxWcMjDSx1dmSagQVQLJWzgzhjdoIkoyHoqIoEwmSysK
	unmN4M7RqeXpt9EID7ADvhSThDjfd+pXSAZefVGX6gjeJSgmXUfKD5wldQTH3Fn+MkU4X/+h0xpwZ
	FJKxO4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuk6C-00000001RCE-1jbw;
	Tue, 24 Feb 2026 04:32:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuk69-00000001RBu-37RF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 04:32:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 384F5339;
	Mon, 23 Feb 2026 20:32:29 -0800 (PST)
Received: from [10.164.148.47] (unknown [10.164.148.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 152023F62B;
	Mon, 23 Feb 2026 20:32:28 -0800 (PST)
Message-ID: <a9cc7306-f80c-4fe8-bd6f-95bdeea3c9c8@arm.com>
Date: Tue, 24 Feb 2026 10:02:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pfalcato@suse.de>, lsf-pc@lists.linux-foundation.org,
 ryan.roberts@arm.com, catalin.marinas@arm.com, will@kernel.org,
 ardb@kernel.org, hughd@google.com, baolin.wang@linux.alibaba.com,
 akpm@linux-foundation.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <yfe2xbb6qwthg3cf4yr7zszpw5o3mx2v4bv32iwnm7yzxqjsvl@et22s2nuwzzk>
 <a778d249-afea-4488-b045-beff3492a48a@arm.com>
 <aZxv0mEd2BA3Mq-N@casper.infradead.org>
 <e7af1815-3028-4530-8d62-6004e421e35b@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e7af1815-3028-4530-8d62-6004e421e35b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_203237_833483_31701054 
X-CRM114-Status: GOOD (  14.40  )
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



On 23/02/26 9:58 pm, David Hildenbrand (Arm) wrote:
> On 2/23/26 16:18, Matthew Wilcox wrote:
>> On Mon, Feb 23, 2026 at 10:37:55AM +0530, Dev Jain wrote:
>>> I didn't understand the reclaimable reference, but yes we need to make this efficient.
>>
>> this goes over 80 columns so much and so often, it's painful to read.
>> so i didn't.
> 
> I just found out that Thunderbird was lying to me the whole time.
> 
> If you're using "Toggle Line Wrap" plugin you might think that mails are
> properly wrapped, you know, like *they are displayed*. And even lore
> displays them properly.
> 
> But in the back, Thunderbird set "format=flowed" and screws you.
> 
> So, if anyone else believes that they are sending properly wrapped mails
> with Thunderbird, read
> 
> 	Documentation/process/email-clients.rst
> 
> and make sure that "mailnews.send_plaintext_flowed" is set to false.
> 
> 
> Thanks Jens for the pointer!
> 

Thanks for letting me know about Toggle Line Wrap. This works, along with
mailnews.wraplength. If I set this to 0, which is what email-clients.rst
sugggests, it doesn't work. Thunderbird is confusing.


