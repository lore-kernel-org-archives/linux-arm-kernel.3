Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4816DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTq4yOA49QhlXOXrp8xyGqUIQBxOwKD7PpLrzm2nnzA=; b=FURVYMl4sk1a1fIVm/+MEnlpDD
	ppeI0mCxL0EdC/PufZQZgTW3zKmlkren1V1BxGdy/0OEacfhBarI9UoklgfCXhRPye/Mhf5XAX/uQ
	D4QLAZe5FugMTmLW2cK3uNnu2ooTw7Bopx5YXv81375vH0so/MsYZ5+2VNajW7hJlMz72PA6MfdYp
	2L184EFQHMxssM07oZb8FXaQk/Ydpx2BL2c2r2uPrGkcOvIDLPGpH0X9ukckdoi+i/ig9QCGrXLun
	O0tSDKVKgk8o8Eb2XymSxIQ5J0CeLxVFgkJWfJWTWsEA1JfRYmsvchmiuQlrykHGOsinEmH5LJUcR
	i8AD7ypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5e7-0000000F1x1-2LBp;
	Tue, 07 Jul 2026 13:15:31 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5e1-0000000F1vQ-2wmI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:15:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RTq4yOA49QhlXOXrp8xyGqUIQBxOwKD7PpLrzm2nnzA=;
	b=dWFZRQA/SlDxm0OzZwPM5aA46486uARLH+zGJkfWCpwVsyF8r0gA5lZfgOPQl5oGLytPvW2y0
	B5MOax3La2evsFXGJ44vJUj5867CG4GVv66bFjIpG150jHcE0eNS4PxH6M7xthz4NR7rJnHe0ky
	6jLpuGpQLP2U800LAzB0rr0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gvhLN4KN4z1cyP2;
	Tue,  7 Jul 2026 21:06:04 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id AC379402AB;
	Tue,  7 Jul 2026 21:15:16 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 7 Jul 2026 21:15:15 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <liam@infradead.org>,
	<liaohua4@huawei.com>, <lilinjie8@huawei.com>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <ljs@kernel.org>, <mhocko@suse.com>, <rppt@kernel.org>,
	<sunnanyong@huawei.com>, <surenb@google.com>, <vbabka@kernel.org>,
	<xieyuanbin1@huawei.com>, <xiqi2@huawei.com>
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault() under CONFIG_DEBUG_USER
Date: Tue, 7 Jul 2026 21:14:09 +0800
Message-ID: <20260707131409.79043-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akzpuerKqOY7qfFi@shell.armlinux.org.uk>
References: <akzpuerKqOY7qfFi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_061526_216066_2EDA3F50 
X-CRM114-Status: GOOD (  10.85  )
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

On Tue, 7 Jul 2026 12:57:45 +0100, Russell King wrote:
> No. This information is useful debug for kernel oops.

For kernel oops, I think it should be `!user_mode(regs)`, Qi Xi's reply:

On Tue, 7 Jul 2026 19:48:12 +0800, Qi Xi wrote:
> For do_DataAbort() fallback:
>
>	if (user_mode(regs)) {
>		if (addr < TASK_SIZE) {
>			mmap_read_lock(current->mm);
>			show_pte(KERN_ALERT, current->mm, addr);
>			mmap_read_unlock(current->mm);
>		}
>	} else {
>		show_pte(KERN_ALERT, current->mm, addr);
>	}

changes nothing to kernel oops. It only skip show_pte() for user-mode
faults, and the fault addr is a kernel address, which means a user
program is trying to access a kernel address.
I think it is reasonable to skip show_pte() in this case?

