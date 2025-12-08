Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A11FD3B7E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysrxwg/xE7lnFNGohOCmC7V8F5GKgROP0io5QDz/Zq0=; b=btgpxJNE4wOWvHrAbrfFLReV5+
	sUUhQoLMn9YBB8Y46TwyP/GXw7Mbn6HJVF0ouly2vuHtXfq1J4KYSPyvVThwla3lg+NuzocXfRNvL
	7odtMG+2Lz6HZBc1YP7lYIbunf22SEnCCh0KeTx3srWHA54/7Weg60bx3NNlXAjQX+8DvuW/r2YK4
	7O2vX4BLfyWkopMm82b33cWftFE4a+VbuxuwucQJvnHf0oJQCr1c70AcNM9GqYs097oqeU3SXEwVP
	Es60ZgVRITqD9RUsDsH2VuTXsce4ZwffVHopbVMXpmgva321v3rbrlRIXUQhyC01nDUfEeSSQFpWr
	sZ76WCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSb9O-0000000D7Ba-3Nr0;
	Mon, 08 Dec 2025 13:19:38 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSb9L-0000000D7Ag-1Zea
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 13:19:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ysrxwg/xE7lnFNGohOCmC7V8F5GKgROP0io5QDz/Zq0=;
	b=n7TqFqQ9HTOt/u0LYnDQ4xGo+E13YxUv9GwtCrD38j0HVMGcYV38Luu01lOwQVG9NtKS53ntG
	STyMq76qqXq6/3MxzS2v99EqMwtmzBwtl5kAQmEHZOyQ3P72eNiW9+a6LrJw9ko6M0h3eHM+Zu6
	kL1nXtXwR3olt0dg2KfyNjU=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dQ2ZM3grbz12LK7;
	Mon,  8 Dec 2025 21:16:59 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 4EE9C18046F;
	Mon,  8 Dec 2025 21:19:18 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Dec 2025 21:19:17 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <brauner@kernel.org>,
	<catalin.marinas@arm.com>, <hch@lst.de>, <jack@suse.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<pangliyuan1@huawei.com>, <torvalds@linux-foundation.org>,
	<viro@zeniv.linux.org.uk>, <wangkefeng.wang@huawei.com>, <will@kernel.org>,
	<wozizhi@huaweicloud.com>, <xieyuanbin1@huawei.com>, <yangerkun@huawei.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger sleep in RCU context
Date: Mon, 8 Dec 2025 21:18:42 +0800
Message-ID: <20251208131842.76909-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aTajXdAVYh9qJI6B@shell.armlinux.org.uk>
References: <aTajXdAVYh9qJI6B@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_051935_943575_F4636BF9 
X-CRM114-Status: GOOD (  17.11  )
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

On Mon, 8 Dec 2025 10:07:25 +0000, Russell King wrote:
> This isn't entirely fixed. A data abort for an alignment fault (thus
> calling do_alignment()) will enable interrupts, and then may call
> do_bad_area(). We can't short-circuit this path like we can with
> do_page_fault() as alignment faults from userspace can be valid for
> the vectors page - not that we should see them, but that doesn't mean
> that there isn't something in userspace that does.

I had indeed been lacking in consideration regarding do_alignment()
before, so thank you for reply. But, may I ask that, is there a scenario
where user-mode access to kernel addresses causes an alignment fault
(do_alignment())?

In your last email, you described it as follows:
On Fri, 5 Dec 2025 12:08:14 +0000, Russell King wrote:
> Also tested usermode access to kernel space
> which fails with SEGV:
> - read from 0xc0000000 (section permission fault, do_sect_fault)
> - read from 0xffff2000 (page translation fault, do_page_fault)
> - read from 0xffff0000 (vectors page - read possible as expected)
> - write to 0xffff0000 (page permission fault, do_page_fault)

There seems to be no do_alignment()?

In other words, is there a way to construct a user-mode testcase which
accesses a kernel address and triggers do_alignment()?

> That patch got missed - I'm notoriously bad at catching every email.
> There's just way too much email coming in.

No need to worry.

> It's to keep the behaviour closer to the original as possible, on the
> principle of avoiding unnecessary behavioural changes to the code. As
> noted above, do_bad_area() can be called with interrupts enabled.
>
> Whether RT folk would be happy removing that is a different question,
> given that they want as much of the kernel to be preemptable.

Thank you for your reply. I have no objections to this, although it might
introduce some unnecessary code paths, at least it won't bring any new
issues.

