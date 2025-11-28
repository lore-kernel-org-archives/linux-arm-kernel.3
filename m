Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F38D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8t+SKLfB9YSz+ESvF8MmSt0kWBtO3/8g8KlI38flHHg=; b=VqlD2aSMpH8mEx0ABsoQSGAQjg
	s/8M8xttUUg7mSOu3wHnhn0cViJsAaCbzOMs4GANZ/UFDjGw/tL5izwOA4Nsrx1F1+vKXncZ57Xpt
	8kOzRI6K7Jw04y30eTcSkhanlycuzNiOERneXTT8fh17YTbyhUiv8wBXVBMe06rHwhdBDKnn9sqTh
	fv5S8IjWmkr61BluWoyHjCtsq5iUvmf6sdgxmtpkeFa4lqII/F9I9wbzW97jRKtQP5qdOJeWEfB4E
	aUTR6XnOnuPDOtcsqDn0niIjbCbYHIKNHvaV9k6rnI7jV4VavzjoNlaCOBs/i7z3Q9DLT6KuT//Je
	X8FE9RKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoDV-0000000HSj0-0JT1;
	Fri, 28 Nov 2025 02:28:13 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoDR-0000000HSi1-3kzZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 02:28:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8t+SKLfB9YSz+ESvF8MmSt0kWBtO3/8g8KlI38flHHg=;
	b=v2N7Xi15sXplM6/c4zwcXTdDZ2HeUyMB89bLjFelMFddlcr5SnQGmd1D8l3sxpZjoYTCwEAV4
	CQO8Hj1I6+GqeRNUeZkUdg1otg8WO5cwKOrZNH7wZtZ8gYwtw0xSlwKkysFtHoT/nlHFrdflYL9
	fso03TKP5dqdUWTiC1vO7+w=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dHcc36LWhzmV79;
	Fri, 28 Nov 2025 10:26:11 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 0145F1A016C;
	Fri, 28 Nov 2025 10:28:01 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 28 Nov 2025 10:27:59 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <bigeasy@linutronix.de>
CC: <akpm@linux-foundation.org>, <arnd@arndb.de>, <brauner@kernel.org>,
	<david.laight@runbox.com>, <hch@lst.de>, <jack@suse.com>,
	<kuninori.morimoto.gx@renesas.com>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux@armlinux.org.uk>, <lorenzo.stoakes@oracle.com>,
	<marc.zyngier@arm.com>, <nico@fluxnic.net>, <pangliyuan1@huawei.com>,
	<pfalcato@suse.de>, <punitagrawal@gmail.com>, <rjw@rjwysocki.net>,
	<rmk+kernel@armlinux.org.uk>, <rppt@kernel.org>, <tony@atomide.com>,
	<vbabka@suse.cz>, <viro@zeniv.linux.org.uk>, <wangkefeng.wang@huawei.com>,
	<will@kernel.org>, <wozizhi@huaweicloud.com>, <xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH v2 1/2] ARM/mm/fault: always goto bad_area when handling with page faults of kernel address
Date: Fri, 28 Nov 2025 10:27:56 +0800
Message-ID: <20251128022756.9973-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127145127.qUXs_UAE@linutronix.de>
References: <20251127145127.qUXs_UAE@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_182810_490815_E9B4C7DD 
X-CRM114-Status: GOOD (  11.25  )
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

On Thu, 27 Nov 2025 15:51:27 +0100, Sebastian Andrzej Siewior wrote:
> What is with the patch I sent wrong?

Hi, Sebastian Andrzej Siewior!

There is nothing wrong with your patches, but when you submitted
your patches, this bug has not been reportted:
Link: https://lore.kernel.org/20251126090505.3057219-1-wozizhi@huaweicloud.com

Your patches fixed the missing mitigation, but the aforementioned bug
still exists. I think there might be a better solution that can fix both
bugs at the same time.

We had some discussions about this bug:
Link: https://lore.kernel.org/CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com
Link: https://lore.kernel.org/20251126192640.GD3538@ZenIV
Link: https://lore.kernel.org/aSeNtFxD1WRjFaiR@shell.armlinux.org.uk

According to the discussion, it might be better to handle the kernel
address fault directly, just like what x86 does, instead of finding VMA.
Link: https://elixir.bootlin.com/linux/v6.18-rc7/source/arch/x86/mm/fault.c#L1473
```c
	if (unlikely(fault_in_kernel_space(address)))
		do_kern_addr_fault(regs, error_code, address);
	else
		do_user_addr_fault(regs, error_code, address);
```

It seems your patches hasn't been merged into the linux-next branch yet.
This patch is based on linux-next, so it doesn't include your
modifications. This patch might conflict with your patch:
Link: https://lore.kernel.org/20251110145555.2555055-2-bigeasy@linutronix.de
so I'd like to discuss it with you.

Thanks!

Xie Yuanbin

