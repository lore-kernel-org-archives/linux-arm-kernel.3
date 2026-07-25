Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F8AC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 02:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAzdFsTkdaqNbxbLnBrQPK/wQUH/o5uxbbXwAcfxmDk=; b=l9VynhBda6sheeq/AGQGfDna3G
	7iLMWrPTgm/i5cyKN8IAKQBkW7t95XkNtC3ebzFVdZweFaCDqHrNtudlI1VB6Yk3MmKAHlR3AlSOM
	CCj4eZmN0UdY5vMMciPETrUjoCU6YRaXg7Y+q9dUsPeX57HpunIcbn3/OMw7aXuq8RZKCZQ5/3Zu4
	F+qG8OgHGIaN0ANXay6F1WoJOMeY3kRTUE+huBU5Dkp8FNVkjtZJs8vunegv/iMhooQiuBLioL0sL
	Y/2vEJW8+b90Wy6FYLdtF0bgHygBT3mqsfb6qn559A90nXEDq2r5qZaZ32o9yqo00RVo/7UKY8k9p
	ILIDTnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnRqI-0000000HTRo-3rLp;
	Sat, 25 Jul 2026 02:10:22 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnRqE-0000000HTR5-1LMp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 02:10:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QAzdFsTkdaqNbxbLnBrQPK/wQUH/o5uxbbXwAcfxmDk=;
	b=MHZhLRJdtvktXcz0io+Xng0s5ApaY9vVeAcRTB9e7OcucaL4fI0lcbLExGL7hX1c6aBEkxEBa
	WLl6I4NWyCtE/kMqKREw9e84xX42uTxAvLGSfWVi1lQvJ34L9deYtyeKVnAFknjFZbU1CqpenrO
	LWBO+LecsXWXApQlFsT7XOQ=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h6SkC1lKczmVWf;
	Sat, 25 Jul 2026 10:00:35 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id BA5AC40586;
	Sat, 25 Jul 2026 10:09:59 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 25 Jul 2026 10:09:58 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linusw@kernel.org>, <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <liam@infradead.org>,
	<liaohua4@huawei.com>, <lilinjie8@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <ljs@kernel.org>, <mhocko@suse.com>, <rppt@kernel.org>,
	<sunnanyong@huawei.com>, <surenb@google.com>, <vbabka@kernel.org>,
	<will@kernel.org>, <xieyuanbin1@huawei.com>, <xiqi2@huawei.com>
Subject: Re: [PATCH v4] ARM: mm: acquire mmap write lock around show_pte() for user faults
Date: Sat, 25 Jul 2026 10:09:26 +0800
Message-ID: <20260725020926.11440-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAD++jLn_DDvWAudHC2Qtz9kaaonuC0YGTXn9nvPtZfGLbtUsOA@mail.gmail.com>
References: <CAD++jLn_DDvWAudHC2Qtz9kaaonuC0YGTXn9nvPtZfGLbtUsOA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_191018_903292_4A9E5F54 
X-CRM114-Status: GOOD (  13.03  )
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

On Sat, 25 Jul 2026 00:05:58 +0200, Linus Walleij wrote:
> On Thu, 16 Jul 2026 09:40:22 +0800, Xie Yuanbin <xieyuanbin1@huawei.com> wrote:
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Fixes: 6d021b724481 ("ARM: dump pgd, pmd and pte states on unhandled data abort faults")
>> Depends-on: <20260629123349.134224-1-xieyuanbin1@huawei.com>
>> Depends-on: 59e4f3b45b96 ("ARM: ensure interrupts are enabled in __do_user_fault()")
>
> This looks a bit odd. I don't get the first fix tag, drop it.

The first fix tag can be open as:
Link: https://github.com/torvalds/linux/commit/1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
Link: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
It seems that a 12-character hash is no longer sufficient to index it. :)

May I increase the number of hash characters or just drop it?

> I think drop both Depends-on as well.

These tags are for the maintainers of the stable/LTS branches. Since
the bug is very old (we discovered it in linux-5.10), they are likely to
be backported to the LTS versions. However, the depends-on commits may
not be merged to the LTS versions.

If the depends-on commits are not merged, this patch may trigger a
might_sleep() warning when calling mmap_write_lock().

Do I still need to drop them?

> Put it in Russell's patch tracker after dropping the weird
> tags.

Just to confirm, I will be the one to submit this patch to this website:
Link: https://www.armlinux.org.uk/developer/patches
right?

Thanks very much!

