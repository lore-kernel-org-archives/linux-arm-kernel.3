Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4CACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/OARezs29eUq90xKny6FQe3l9UwiuCpXkYqxg2+/iY=; b=yh/J39eT0TqLs96B482luDJXHp
	IUoV9K4jTtZ0QXdHGTvoMYowxSApcQWTAV2Szhcy+j5sRp+U9oX3+BUM/vPSe268ar6aCuw4l+ibx
	v+E4Id2HmR7Bj+WglvcIpeUe4jFDy03+XO969qg8AHoHnGng36AlPh8ydSLiUz/b/OKzI4nJCix5/
	OZr4lTL76ETOrqW0WQlwA5+j8mtYhgAjbuJddwGkBjZuiukhG+o+e+iOfsEzEqbX2jJO2AU2vCooE
	ySBrTDWjBZ/VmvuVmqzfR4EZQBZqwyd+br+mMMjMbWDtEAVJI88yzNH7IoE3mfrzI2PFCtOtNohLz
	i/0PXH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHP3-0000000BuZG-0qeV;
	Tue, 04 Nov 2025 13:48:53 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHOz-0000000BuYD-2W1j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:48:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3/OARezs29eUq90xKny6FQe3l9UwiuCpXkYqxg2+/iY=;
	b=485pWYjvuZXFV9mKiWgarmKxkGqcVR6VQWU2toTQMryKr2Ccu9GXeoCSUTGB9tmbqKoCpniXy
	I+RSyrWRIamnsSyRhH5kbEOoRupCQmkdnbybmsLNDjkuvrFDBpROPDmUvLZ+CmZ8iM4HeydHHQC
	MM1lAeLT19FUO479+LA7qEA=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4d18rj1mzYz1prL4;
	Tue,  4 Nov 2025 21:47:01 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B967180B69;
	Tue,  4 Nov 2025 21:48:36 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Nov 2025 21:48:35 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <david@kernel.org>
CC: <Liam.Howlett@oracle.com>, <akpm@linux-foundation.org>, <ardb@kernel.org>,
	<arnd@arndb.de>, <dave@vasilevsky.ca>, <david@redhat.com>,
	<ebiggers@kernel.org>, <kees@kernel.org>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <linmiaohe@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux@armlinux.org.uk>, <lorenzo.stoakes@oracle.com>,
	<mhocko@suse.com>, <nao.horiguchi@gmail.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <rmk+kernel@armlinux.org.uk>, <rostedt@goodmis.org>,
	<rppt@kernel.org>, <surenb@google.com>, <vbabka@suse.cz>, <will@kernel.org>,
	<xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH 1/2] ARM: mm: support memory-failure
Date: Tue, 4 Nov 2025 21:48:31 +0800
Message-ID: <20251104134831.147584-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <e323f1f3-f543-4e81-af6b-243fcf9ba750@kernel.org>
References: <e323f1f3-f543-4e81-af6b-243fcf9ba750@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_054850_392295_4ECC1157 
X-CRM114-Status: GOOD (  15.78  )
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

On Mon, 3 Nov 2025 17:53:18 +0100, David Hildenbrand wrote:
> Can you go into more details which exact functionality in
> memory-failure.c you would be interested in using?
>
> Only soft-offlining or also the other (possibly architecture-specific)
> handling?

Thanks! Let me describe it in as much detail as possible.

The functions in memory-failure.c are currently used in three ways:
1. When the application is using memory, and ECC detects a UE
(Uncorrectable Errors) bit flip from DRAM (the detection is performed by
hardware and is not perceived by software), it reports an interrupt to the
CPU. The relevant driver (a third-party module) has already
registered the interrupt callback function.
Based on the configuration, the driver calls `memory_failure_queue()`
inside callback function, or wakes up the related kthread to call
`soft_offline_page()`/`memory_failure()` to take the affected memory
offline or kill the process.

2. Hardware memory scanning function: The hardware periodically performs
read/write tests on some memory (This hardware is not a standard hardware,
so it is not included in the ARM spec. The scanning is not perceived by
software) If bit flip is detected during the test, an interrupt is
reported to the operating system to do the memory-failure,
just like what described earlier.

3. Software memory scanning function: The software (such as kthread/
work-queue) periodically use `soft_offline_page()` to isolate some free
memory and performs read/write tests. If bit flip is detected during the
test, it is considered a failure, and the memory will not be recovered.
Otherwise, use `unpoison_memory()` to recover the memory.

Unfortunately, the driver code for these three methods is difficult to
open-source. I have also been thinking about whether there is a
general-purpose function that could use memory-failure, but I haven't
come up with a good idea yet.

> Cheers
>
> David

Thanks!

Xie Yuanbin

