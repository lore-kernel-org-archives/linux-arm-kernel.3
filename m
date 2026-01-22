Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE04D3EE68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFGpp1swby30Mo/6Sr7+DM2vt++ulcUhhsxtyCt5dnU=; b=G9r0/oZzSnlwL6h3Kd0f5pz42l
	5ao72BevCFsFp2xvtuw+l1Bz8uTKhrMWW4D9n0bn2+vfaxUkSHt+Tu1ciJzqQJ6fcyvhi9q46+Vdl
	c9vBwBpwudpVd4300oq8rg318s3ZihNMAEbOWIB3u0lC8M8/FzaCQ3oZD4D6uEMGFE5jORpYwb5kd
	pzaQk6vRB2kUAmAO5tZIDDLomwjKwbQPVN4y/PuIUfDgKaLSxZJw9OgcU9iPIiXZUKm67BqsrhOIv
	wE1vX+tYK2t2lQdf+oRYo73rMRELLaw3vpPDzc8gHSZNMSmvqA5mZ+nyw6TiVOWvLlt7KDZFR+Ue3
	LKvLt8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viv20-00000007Ar1-45aF;
	Thu, 22 Jan 2026 13:47:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viv1x-00000007AqN-1ahZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:47:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E9851476;
	Thu, 22 Jan 2026 05:47:15 -0800 (PST)
Received: from [10.57.80.101] (unknown [10.57.80.101])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 404703F632;
	Thu, 22 Jan 2026 05:47:18 -0800 (PST)
Message-ID: <41874647-a464-4884-9a39-544723d3e6b6@arm.com>
Date: Thu, 22 Jan 2026 13:47:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: mmu: avoid allocating pages while splitting
 the linear mapping
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, Yang Shi <yang@os.amperecomputing.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 catalin.marinas@arm.com, akpm@linux-oundation.org, david@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
 chaitanyas.prakash@arm.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, lorenzo.stoakes@oracle.com, ardb@kernel.org,
 jackmanb@google.com, vbabka@suse.cz, mhocko@suse.com
References: <aW9LCX92T9t8iDco@e129823.arm.com>
 <baa46ea0-737b-4d9e-b4f4-2eee1476da95@arm.com>
 <aW-k_D1Q8jpYMPoI@willie-the-truck>
 <a6c1f21f-43e4-41d2-adb6-c5f9985b3abd@arm.com>
 <aW+t8S1LfwX3LjRi@e129823.arm.com>
 <11a01f4e-9ae5-4001-9f9c-74a746f898cd@arm.com>
 <02bb61cc-f0be-41e5-b8b2-59768afd5254@os.amperecomputing.com>
 <aXCPHaylUbRJ3CME@e129823.arm.com>
 <ee2bf4ba-0121-44dc-a465-4c186dc18f19@arm.com>
 <4c98a1b2-6215-4e71-8bb1-eaeb1722e7b1@os.amperecomputing.com>
 <aXHU02hsrB64Zopo@e129823.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aXHU02hsrB64Zopo@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_054725_496737_ECE4FB85 
X-CRM114-Status: GOOD (  15.60  )
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

>>> I'm inclined to leave this as is for now.
>>
>> I agree. I don't think this would be a real problem.
>>
>> Thanks,
>> Yang
> 
> Although partially using GFP_ATOMIC might not be an issue given that
> there is no contention at the moment,
> technically using a memory allocation API inside stop_machine() is problematic
> for PREEMPT_RT, and the relevant page tables should be pre-allocated.
> 
> That said, taking a step back (I’m not sure why I was being so stubborn about this),
> since the kernel_alias area is mapped using block mappings,
> a simple calculation based on your dm_meminfo patch should be sufficient to
> determine the number of page tables that need to be pre-allocated for
> splitting the linear mapping, without having to walk the page tables again.
> 
> So, after your dm_meminfo patch, I plan to respin this patch based on that.
> 
> Am I missing anything?

Yeoreum and I had an offline chat about all this and I just want to spell out
the conclusion for everybody;

We believe it's impossible for the secondary CPUs to have any scheduled work
during this window, and therefore it's impossible for the split race to occur,
and it's impossible for there to be any contention on the page allocator lock.
All of which means that in practice, there are no bugs here and the code is safe
as is, even for PREEMPT_RT.

That said, allocating memory inside of stop_machine() is a bad smell, so Yeoreum
will rectify this down the track; it's not urgent though.

Thanks,
Ryan


