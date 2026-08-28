Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF64C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1ieJYPbDNiuX52GiK9zhEf0t/H/HbxHvWGNyCiu+v4=; b=u9KxHsxYKTmFAmn+DJoDtQYody
	RQTtbNc/a/pw7fwfUAPnvcNBIQjkQTIQtH0xlxN77imYbOv4pk9xiPn9y4FcneXvcpDJ4puId+BP+
	MM3AQ3r7O1GQ9t0ivN8ti0ZdD5VKxQ89xY4+xJT0vqYw/1jGHqQg9eLmaCBwpv1sMOQpggEy+doe1
	U+aBLUxCzImj8FZtTCWdbAqEoKr4W8yLLMAg1w5sASpUOvdc1EYqVICpVXG7BEJB5oQygTMc0NXH2
	U+aKgq0j3eFaWWPS9YxIGkiWApqZmUjGlh2c6oQ/hFK0OL6lt+JQXzbogOZYHqVmfg++8oxTD9RY4
	dacz6kqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwx6-00000005rpJ-2k9c;
	Fri, 28 Aug 2026 13:49:04 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwwW-00000005r29-1K0c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:48:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=J1ieJYPbDNiuX52GiK9zhEf0t/H/HbxHvWGNyCiu+v4=;
	b=zP/rGh0dk1BELBjq0Zc4Qfjd02Y7orAY3TV0npmdI4UvF3g7xH08DJENULFGscJ40/322ZqNk
	DL9Be3+jtvS3SUcQi+I5dwrCRJvdS0l04jxaSb0pxDcMaF/wLdInLyExZIXJ+dXiGn2u0VoRyuw
	NtzuCm+VCxHXRaV7gGC8Ioc=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hWfpf4qYFzJ46ZW;
	Fri, 28 Aug 2026 21:47:54 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id AF62740571;
	Fri, 28 Aug 2026 21:48:17 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 28 Aug 2026 16:48:17 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <willy@infradead.org>
CC: <akpm@linux-foundation.org>, <artem.kuzin@huawei.com>,
	<catalin.marinas@arm.com>, <cl@gentwo.org>, <david@kernel.org>,
	<liam@infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux@armlinux.org.uk>, <ljs@kernel.org>, <mark.rutland@arm.com>,
	<mhocko@suse.com>, <panov.nikita@huawei.com>, <rppt@kernel.org>,
	<surenb@google.com>, <vbabka@kernel.org>, <wangkefeng.wang@huawei.com>,
	<will@kernel.org>
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
Date: Fri, 28 Aug 2026 21:35:47 +0800
Message-ID: <20260828133547.154953-1-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <apCLzAaw6oRIqbSH@casper.infradead.org>
References: <apCLzAaw6oRIqbSH@casper.infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.11]
X-ClientProxiedBy: mscpeml500003.china.huawei.com (7.188.49.51) To
 mscpeml500004.china.huawei.com (7.188.26.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_064828_831402_E73EAABB 
X-CRM114-Status: GOOD (  14.98  )
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

Hello, thanks for your comment.

On 8/27/2026 10:11 PM, Matthew Wilcox wrote:
> On Fri, Aug 28, 2026 at 12:11:40AM +0800, Nikita Panov wrote:
>> There were several prior submissions with some sort of replication
>> for NUMA systems, including one from our side for the x86_64 platform.
>> In the last couple years, several research articles related to solving
>> locality issues on NUMA machines through replication emerged as well.
>
> You're lumping a lot of different NUMA replication things together in
> your list.  That doesn't give me confidence you know what you're doing.
>
> I *think* what you're doing here is kernel text replication.  Other
> architectures (mips, arm) have managed to do this without core MM
> changes.  Why can't you?

Yes, this patch set is for kernel text and rodata replication.
For arm such technique was not adapted by the Linux kernel.

Regarding mips, this is achieved through the TLB lockdown feature.
For aarch64 this feature is *implementation-defined*. Moreover, looks like
not a single vendor of modern enterprise aarch64 servers actually implements
it. But even having this feature would not allow us to implement
fully function kernel rodata replication:
1. TLB capacity is very limited, we can't lockdown a significant amount of
entries. In case if small pages are used for kernel text mapping (64k kernels)
this approach is not suitable.
2. Some core modifications are still required - text patching at least should
be aware of memory replicas. But yes, changes are significantly
smaller and easier.
3. Replication in kernel modules most likely will not be possible due to limited
TLB capacity as well.

Implementation could have been done only for 4K page size kernels
(maybe for 16K as well, if we do not mind some memory overconsumption),
only for kernel text and rodata. In addition, locking TLB entries for
the kernel reduces TLB capacity for user space applications.
How badly this will affect performance, I cannot say without actual hardware.

BR
Nikita Panov


