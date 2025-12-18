Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC95D68BF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThPJJ3PWB4nMuEUAZp3uMrXMCEr8Wd3q7MPwDdpjFEg=; b=yALuWQS8bDdrZiUlD1bBpvo0HF
	hf6y1hnjohMvW/Xx4/n3L0Omzj3y2UZIjPZjvKPCg7ae2AVO0dg/G2RywDSobofYxVM88IPfvZu5z
	gm44w6c+OiTAFZlTI/QnFrgaeGPZjhsfozLywHq7RDB/QnQnXcCr15FOcYsP5KmDfFEgoA6TJtSQ5
	sHp5zMblj7RC4jKWpMepoB2JY4mQsZmnTclW84F00KgLWQod3IPcSC4fX9FfniAHAW5mudXfx3IQZ
	SD/s/dkHIu4wkuXqmTNkbUDnd/v3N+oDn+4BspfA+IUFrCPprkxqviPtzu4yDnslPl1k09fGjhxVT
	rkQ4S8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9eN-000000085Jm-0CLe;
	Thu, 18 Dec 2025 08:46:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9eM-000000085In-1HCR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75AA860123;
	Thu, 18 Dec 2025 08:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE86EC4CEFB;
	Thu, 18 Dec 2025 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766047577;
	bh=UNiqzBeSI2nfMbOFOdv2ipLYyeTA+tVV2F6tqqzV0DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xd6Eedr4NTO1heTOZE9cI8yjjcd70DffYIFpvBE80ALbriM1qqCQSbY3inTwc8sKw
	 XPwv3tIm3QAoVloPLZyvJJVrRHQLzIehb9emMiI9/JZQ9YmMfqkTrpgRLGkQeXy44l
	 XUk1OsgjkUJ5DFjZt2Gi8s/ZVh2ETcPs7XW08g9eZXA7eeif7raLI9hxF+yn4Nv576
	 LfOP8Gh4oYhYmdjMswqq7IXw42waNsBGy7vS8EuRXa834kfZ3nFFrdGOe44HYvfknz
	 z+1LLQA4OL1+o9I6+uC+EVJHiGvsOdO2yE/zoao+3acy06Sk/UeUwJoNMNyAaUrxtE
	 d3/McnCb0Hlrw==
Message-ID: <201d0fa3-2ebe-4df2-926c-9e11607a6f07@kernel.org>
Date: Thu, 18 Dec 2025 09:46:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: mmu: avoid allocating pages while
 installing ng-mapping for KPTI
To: Yeoreum Yun <yeoreum.yun@arm.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
 vbabka@suse.cz, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <20251217182007.2345700-1-yeoreum.yun@arm.com>
 <20251217182007.2345700-3-yeoreum.yun@arm.com>
 <731e3f48-e0a3-4c89-a13a-65ef37faa443@arm.com>
 <aUL/zJlJFRz2/Ybt@e129823.arm.com>
 <72aaa252-6ee6-4353-84ee-b6e10e9920c6@arm.com>
 <aUO9M/oN+nx3nfW+@e129823.arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <aUO9M/oN+nx3nfW+@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/18/25 09:37, Yeoreum Yun wrote:
> [...]
>>> I think it would be better to use only __GFP_HIGH in here since
>>> when kpti_install_ng_mappings() is called, "kswpd" doesn't created yet.
>>> and to allocate page with assurance, It would be good to use
>>> min_reserved to.
>>>
>>> Am I missing something?
>>
>> Personally I think we should just use "GFP_KERNEL | __GFP_ZERO". Anything else
>> would make this allocation look special, which it is not. If we fail to allocate
>> at this point in boot, we have bigger problems.
> 
> But I'm not sure *HOW effective* to use GFP_KERNEL in here.
> Since it's before the any filesystem inited.
> IOW, in this context, almost there would be no *page cache*
> and I think it seems meaningless to use "GFP_KERNEL" and "direct
> reclaim"
> 
> So to get success for allocation, __GFP_HIGH | _GFP_ZERO seems much
> better.

Unless there is a real reason to confuse readers why this is very 
special, just go with "GFP_KERNEL | __GFP_ZERO", really.

In particular if it doesn't matter in practice? Or does it and we are 
not getting your point?

-- 
Cheers

David

