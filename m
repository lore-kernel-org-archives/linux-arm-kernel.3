Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA79CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvn0FJnM0oHov5zPpBvGu+w6iU83uhyZvGXgOUSdZDE=; b=jO1aedYU3/g08MqwvXP4k5D4gw
	n694qCW4UDCAJHZflGC4iXhkuD1ko2UZu/SRBOma/KWbQUGQ3Xf5qVnDGYiHrqNAlzNKrCI4K1QuA
	2UKt2ZhwLzL40nE1xhIKB8XH1lVoWyvYVhp7/I6e88cb1A0VK7wcIP8eciSrpo8TRwelj+oUnZp6+
	1qYyu9EfokadYanqQT4hoEBvjfTFAb2AhBTJSkCDTmbH/3rPtI2SvYOIk4HYKQi1PxFRTX6hdeGza
	8EDQYwkwcoCZVqTaPyiLXEt5yttkcrh3aIWFnsPFhzuM0Ek4P1Gf+5/fSJ/nsrrS4yuyivm/igaLB
	hWKTawEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uza12-00000002n8S-0u7h;
	Fri, 19 Sep 2025 12:15:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uza10-00000002n7Y-0tvC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 12:15:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27447169C;
	Fri, 19 Sep 2025 05:14:51 -0700 (PDT)
Received: from [10.164.136.41] (unknown [10.164.136.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1F23F673;
	Fri, 19 Sep 2025 05:14:55 -0700 (PDT)
Message-ID: <b93b0cca-04ac-402c-b522-cda8f39a52bc@arm.com>
Date: Fri, 19 Sep 2025 17:44:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com,
 quic_zhenhuah@quicinc.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com, mark.rutland@arm.com, urezki@gmail.com,
 jthoughton@google.com
References: <20250723161827.15802-1-dev.jain@arm.com>
 <aMk8QhkumtEoPVTh@willie-the-truck> <aMrXBArFNLTdwWs3@willie-the-truck>
 <839ac455-f954-428f-b1a7-89778c57ee8b@arm.com>
 <aM0yQwt3_8WuxBC2@willie-the-truck>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aM0yQwt3_8WuxBC2@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_051502_305318_FADC2342 
X-CRM114-Status: GOOD (  13.78  )
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


On 19/09/25 4:29 pm, Will Deacon wrote:
> On Fri, Sep 19, 2025 at 03:58:46PM +0530, Dev Jain wrote:
>> On 17/09/25 9:13 pm, Will Deacon wrote:
>>> On Tue, Sep 16, 2025 at 11:30:26AM +0100, Will Deacon wrote:
>>>> I'm currently trying to put together a litmus test with James (cc'd) so
>>>> maybe we can help you out with that part.
>>> Here's what we came up with. There's not a good way to express the IPI
>>> from kick_all_cpus_sync() but it turns out that the ISB from the TLB
>>> invalidation is sufficient anyway. Does it make sense to you?
>>>
>>>
>>> AArch64 ptdump
>>> Variant=Ifetch
>>> {
>>> uint64_t pud=0xa110c;
>>> uint64_t pmd;
>>>
>>> 0:X0=label:"P1:L0"; 0:X1=instr:"NOP"; 0:X2=lock; 0:X3=pud; 0:X4=pmd;
>>>                       1:X1=0xdead;      1:X2=lock; 1:X3=pud; 1:X4=pmd;
>>> }
>>>    P0				| P1				;
>>>    (* static_key_enable *)	| (* pud_free_pmd_page *)	;
>>>    STR	W1, [X0]		| LDR	X9, [X3]		;
>>>    DC	CVAU,X0			| STR	XZR, [X3]		;
>>>    DSB	ISH			| DSB	ISH			;
>>>    IC	IVAU,X0			| ISB				;
>>>    DSB	ISH			|				;
>>>    ISB				| (* static key *)		;
>>> 				| L0:				;
>>>    (* mmap_lock *)		| B	out1			;
>>>    Lwlock:			|				;
>>>    MOV	W7, #1			| (* mmap_lock *)		;
>>>    SWPA	W7, W8, [X2]		| Lrlock:			;
>>> 				| MOV	W7, #1			;
>>> 				| SWPA	W7, W8, [X2]		;
>>>    (* walk pgtable *)		|				;
>>>    LDR	X9, [X3]		| (* mmap_unlock *)		;
>>>    CBZ	X9, out0		| STLR	WZR, [X2]		;
>>>    EOR	X10, X9, X9		|				;
>>>    LDR	X11, [X4, X10]		| out1:				;
>>> 				| EOR	X10, X9, X9		;
>>>    out0:				| STR	X1, [X4, X10]		;
>>>
>>> exists (0:X8=0 /\ 1:X8=0 /\	(* Lock acquisitions succeed *)
>>> 	0:X9=0xa110c /\		(* P0 sees the valid PUD ...*)
>>> 	0:X11=0xdead)		(* ... but the freed PMD *)
>>>
>>>
>>> Will
>> Is the syntax correct? I cannot use the herd7 command to run this.
> Weird, what happens? It runs for me:
>
> $ herd7 -version
> 7.58+1, Rev: e39a86f5d59dee3174d08d9ab5b13155c75936fd
>
> $ herd7 ptdump.litmus
> Test ptdump Allowed
> States 5
> 0:X8=0; 0:X9=0; 0:X11=0; 1:X8=0;
> 0:X8=0; 0:X9=0; 0:X11=0; 1:X8=1;
> 0:X8=0; 0:X9=659724; 0:X11=0; 1:X8=1;
> 0:X8=0; 0:X9=659724; 0:X11=57005; 1:X8=1;
> 0:X8=1; 0:X9=0; 0:X11=0; 1:X8=0;
> No
> Witnesses
> Positive: 0 Negative: 9
> Flag Assuming-common-inner-shareable-domain
> Condition exists (0:X8=0 /\ 1:X8=0 /\ 0:X9=659724 /\ 0:X11=57005)
> Observation ptdump Never 0 9
> Time ptdump 1.65
> Hash=238908ee9413a36507c61b92a31a366a

I was using some other command :) yup this works.

I'll try posting the next version today itself, but will you be
okay merging this if I post on Monday?

>
> Will

