Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEA0C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKTQ1cB9iCeRBcUkcGmFPjory59m7YW5nFpqd2KEJuY=; b=rQl77CbhL6Z1Z/3jG+GEJlWtV1
	zHAgRqxtDjQAbFePiKTyJ9V8Zdffkq0LY8AbBI1nPknUgSjZoiDGpQu1Y0CMHu+5rv+mf7QY9TYfE
	np5H9VT31qF+U+/MN94xEdHZukiv9LpucBKD/kTVTiwShOOpxtYo/nlHZ0mGunUlX642qh2Z/HJy+
	2rRuc9Aw784bjBhURL6DfnhNsTSXCeDH0n6WIuX5YVbn9gB6mF1x66ES4AaFKBXL6JXUhsdnbect+
	EBYnOwOvn8DbQKbHVwBfgTXJu8dlxXnBxUKnLx9Z/mTEHjrs/1Ln38q+aZme8RqPDvQ2x/UJB19a4
	u/6H5zKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHa0-00000002CSa-0ncT;
	Fri, 08 Aug 2025 07:31:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHLQ-00000002Agg-1Zbl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:16:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A621216F8;
	Fri,  8 Aug 2025 00:16:43 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61F043F673;
	Fri,  8 Aug 2025 00:16:45 -0700 (PDT)
Message-ID: <5dcfd6e1-fa09-4381-8c32-a2276f41ac8d@arm.com>
Date: Fri, 8 Aug 2025 08:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 27/36] arm_mpam: Allow configuration to be applied and
 restored during cpu online
To: Dave Martin <Dave.Martin@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-28-james.morse@arm.com>
 <7ab40c09-3922-4e0c-85dd-00ff05be4ce6@arm.com>
 <aIeYgxJf9EASA5Zs@e133380.arm.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <aIeYgxJf9EASA5Zs@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_001652_468657_5E8ED7B0 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Dave, Ben,

On 28/07/2025 16:34, Dave Martin wrote:
> Although it may look like the globals are read all over the place after
> probing, I think this actually only happens during resctrl initialision
> (which is basically single-threaded).
> 
> The only place where they are read after probing and without mediation
> via resctrl is on the CPU hotplug path.

(and the mpam driver gets the first go a cpuhp, then it calls into resctrl).


> Adding locking would ensure that an unstable value is never read, but
> this is not sufficient by itself to sure that the _final_ value of a
> variable is read (for some definition of "final").  And, if there is a
> well-defined notion of final value and there is sufficient
> synchronisation to ensure that this is the value read by a particular
> read, then by construction an unstable value cannot be read.
> 
> 
> I think that this kind of pattern is not that uncommon in the kernel,
> though it is a bit painful to reason about.

As it's sparked some discussion, I've added a mpam_assert_partid_sizes_fixed() that
documents this, and will trigger a WARN_ON_ONCE() if these things are observed as
happening in the wrong order.


Thanks,

James


