Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C22C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aE/pHIcq+J7yahftKLlbjX02zfDr0tucuYbmauN0PGo=; b=GMxv2sceyTAAo+QpYxYYH7XdW+
	ZJ1ly//GrGCt//Gx6grHJRl4c2LB9ZZink9HSR8Kd6harI6/fzFLBy81H2F3g4pV1PiGE/zmZqjC3
	iwtWsCTkmFo8rR5xnvAGBYXai5bXWtyRh9rl04LR3d2eGxg3kleMG8Q1+RU27NgYGud6aQD02iYoC
	GExEeymEK1nrQhu6GpISYNT1SrITx6y/bkAAz9LCI2WeAso0EBpUr3WtH/8/6LEYjEO81kkO5u2e6
	OrzQv2QH+PfkluuwRIgdZWbtDrEfcy+5de0Hpjq2q7yWF1aqQgd/3fFJVqsPvQm3wGKH9dwJCg+X/
	IRlOTGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQyL-00000008wC5-1QbL;
	Wed, 25 Jun 2025 14:19:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNos-00000008OWq-0RdD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:57:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 527A5106F;
	Wed, 25 Jun 2025 03:57:15 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ED4E3F58B;
	Wed, 25 Jun 2025 03:57:30 -0700 (PDT)
Message-ID: <9cc06930-2671-4534-ac30-6d3ae3e472d3@arm.com>
Date: Wed, 25 Jun 2025 11:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
Content-Language: en-GB
To: Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
 <aE51cWMkSfNJ5i4c@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aE51cWMkSfNJ5i4c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_035734_185966_5573012B 
X-CRM114-Status: GOOD (  10.99  )
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

On 15/06/2025 08:25, Mike Rapoport wrote:
> On Fri, Jun 13, 2025 at 05:27:27PM +0100, Lorenzo Stoakes wrote:
>> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>>> -/*
>>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>>> - */
>>> -static int __change_memory_common(unsigned long start, unsigned long size,
>>> +static int ___change_memory_common(unsigned long start, unsigned long size,
>>>  				pgprot_t set_mask, pgprot_t clear_mask)
>>
>> I wouldn't presume to comment on conventions in arm64 arch code, but that's
>> a lot of underscores :P
>>
>> I wonder if this is the best name for it as you're not only invoking it
>> from __change_memory_common()?
> 
> Could update_range_pgport() work?

Sounds good to me!

>  
>> And yes this is a pedantic comment, I realise :)
>>
> 


