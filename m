Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD59C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rm1KNibCz+ERMVqGQLvzK/uPua2K5RXP/Arqnz8w2t0=; b=2/eFs7fedW9/m8g8lbapZZ9+yE
	1GZSKr45JS/cvY6SmvEaEauxTH7FZQbhlmq4yf6s416tcpMTThEOQrO3PCa3oa4XITfZKZSdLKMkY
	q/kyHFCHSKUuA6VRCGGfsD+iPDHMvAb9WaBHdBoEOBYSqtcd1QBbrJGxALbWWzODjia34bvjEal0x
	Q4WKoHFpMOq21aY/OPgqpNa04W1nkqaVLfnpd2VxuZN1liaMmSDsXGDh6PYaYNXIoq5MqCYADshi5
	Qs0358r2voPfjGWfagNaujXdUzcfc9lb3bHzsmMzvX1JbbvmA8s2Hseo79xOs5raL7sht8oZVODhS
	JZ9K5Ozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6QU-0000000F6zQ-1kBt;
	Tue, 07 Jul 2026 14:05:30 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6QQ-0000000F6yI-1AFU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:05:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rm1KNibCz+ERMVqGQLvzK/uPua2K5RXP/Arqnz8w2t0=;
	b=mJPKBpcxf9F2zQUNY1YAPwDjh84VLxG9DD0UipCOkKffqTF7mV1KnXhZMlTlmx9xOOdCtaMC3
	QlQyeTbwSLfO4/aKT4fx036hyhIlgMGxVUTr1eOp+Oyl6AAnVuzIMTOoYqxkHlALfXJBcBrvLHV
	A+zRKwOs4tBqIVq6Z+6ClaQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gvjS50jGFzRhRF;
	Tue,  7 Jul 2026 21:56:05 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 56D774057F;
	Tue,  7 Jul 2026 22:05:17 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 7 Jul 2026 22:05:16 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <ljs@kernel.org>, <akpm@linux-foundation.org>
CC: <david@kernel.org>, <liam@infradead.org>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux@armlinux.org.uk>, <mhocko@suse.com>,
	<rppt@kernel.org>, <sunnanyong@huawei.com>, <surenb@google.com>,
	<vbabka@kernel.org>, <xieyuanbin1@huawei.com>, <xiqi2@huawei.com>
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault() under CONFIG_DEBUG_USER
Date: Tue, 7 Jul 2026 22:04:05 +0800
Message-ID: <20260707140405.85568-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akz8aZUW23rpyrLO@lucifer>
References: <akz8aZUW23rpyrLO@lucifer>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_070526_833740_0A7C36E2 
X-CRM114-Status: GOOD (  17.85  )
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

On Tue, 7 Jul 2026 14:20:19 +0100, Lorenzo Stoakes wrote:
> Well the whole reason you're faulting here might be because a userland process
> did that right? The page tables should tell you (presumably on ARM32 :)
>
> And I hate to repeat myself, maybe you didn't read the whole thread but... just
> use mmap_write_lock(), this isn't necessary?
>
> What is this trying to achieve?
>
> You're not in a hotpath, why are you bothering to conditionally take/not take
> the lock?

I think it is not the same thing as the previous discussion regarding
which locks are needed for `show_pte()`.

Now, for this bug, we have two places that need to be fixed:
1. __do_user_fault()->show_pte();
2. do_DataAbort()->show_pte();

For the first one, it must be a user fault, the judgment of
user_mode(regs) can be omitted.

For the second one, it may be a user fault or a kernel fault. If it is
a kernel fault, it also means that this is a kernel oops.

For kernel oops, according to Russell's opinion, we do not need to fix
this bug, which means we do not need to acquire any locks, because the
kernel may die soon. However, show_pte() still needs to be retained
because it is useful for debugging the kernel.

For user faults, we need to fix it:
1. For user space addr (addr < TASK_SIZE), we need to acquire
   current->mm's write lock, before show_pte(), I understand it now.
2. For kernel space addr (addr >= TASK_SIZE), maybe we can omit
   show_pte()? After all, user-mode programs can access any kernel address
   to trigger user faults, but we dump the page tables of kernel
   addresses, would that be inappropriate,
   (e.g., posing potential security risks)?

