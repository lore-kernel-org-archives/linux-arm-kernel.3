Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821FCF36BAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 05:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qXV7UNwHR6rttboRmT/7aSKjzsG69njmQm48zi2xHo=; b=iHqfi8/2ciAD9v+2P3Hq+Ztgqb
	+xUB4MoBUmuJoKVtP6JYyUwItbSP8qaRWpisHA9DLE+sAfrCgjgieL+sg7sBlrRWuS9Mrrnl+Z0FI
	vBHkW+y0YPa0SlIyOWuSVnRuInZzbLpWYptxhtHwyB73EiK/otKOJ22ApWgHEaTJ2LK0J6BSZ0VHH
	8g1iCtTLkR1Es3edd4drLIkiK/Tb/McD2VazdqH/g6CC1t8/USh2n3AxkrfPGXDPEkVbKCbbEJOG+
	kiE6jncvWrBtpjur4/1K1tcqzng2bx8uYSyNVFrja9w0tdx4Se2uDEr/R0s70ZkrjvQy2USgoVWN1
	4m4n5aFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4Rx-0000000BdNC-2Uip;
	Fri, 10 Apr 2026 05:30:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4Ru-0000000BdMq-0N1g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 05:30:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D84282008;
	Thu,  9 Apr 2026 22:30:25 -0700 (PDT)
Received: from [10.163.181.174] (unknown [10.163.181.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAFD53FAF5;
	Thu,  9 Apr 2026 22:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775799031; bh=G8k+wf8sxRtAbSVAFMjynOWx4nhCOUiQl5JR82uclTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pAgcGKUFPcmqcSGKzUfH7nLwJKsdSljWyGBHIdKx+8b8fUDXYywKAnnv1cjrSYsiG
	 Ertxa4ZqReOgzsGxkJsZrto/EoLahijks7RmJHy2Ou97NaTkJN7j4K59/bLN7zdhkd
	 6/RmOE3X3nlyjferzBy6Ln/oVRuJLouqFvEzMRto=
Message-ID: <37a7e502-ac1d-4573-a877-23b1bfd07238@arm.com>
Date: Fri, 10 Apr 2026 11:00:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 08/16] arm64/mm: Convert READ_ONCE() as pgdp_get() while
 accessing PGD
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-9-anshuman.khandual@arm.com>
 <e294a87b-392b-4b12-bd12-70c66c793fcd@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <e294a87b-392b-4b12-bd12-70c66c793fcd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_223034_275476_64F92555 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

On 08/04/26 5:49 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 06:11, Anshuman Khandual wrote:
>> Convert all READ_ONCE() based PGD accesses as pgdp_get() instead which will
>> support both D64 and D128 translation regime going forward.
> 
> Please mention here why you move p4d_offset_phys/p4d_offset. (same
> applies to other patches)

Will do that.

> 
> Do we get additional function calls that might degrade some page table
> walkers?

Sorry did not get it. Are you asking if D128 adds new page table
function paths thus increasing memory access latency etc ?

> 
> Same comment regarding BUG_ON.
> 

As mentioned earlier it might be better to have a separate change
converting similar BUG_ON() in various arm64 page table helpers.


