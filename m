Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC65D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hS/UahhXHl+RrowRIZHM7vwQFEZP9EXgs0tkKoqW6vU=; b=ToaGRwKjKEnXyDuT2yWdRUcCn6
	CG7soonNLPVwyNUUMuSidM/JgQMbfhWr/nezUPOzDFJF2AkbOpvBCp/PhWiccVkv0tk4kA2jDINjL
	YPqMcWfNlDFusPeXgJHA6CIPbLDbysplmGifSEJwp5L3FD+krB+kE7i6k3qTsgaKSgUD5rAmgvwhY
	PNuF+ZODWsNYUh1/0GTCSxB5W3G7fijkqqaR3oQz+sFqD3UiZiY8kCSbHSiSFse2mk2LCFxLWcuUf
	ON7EZ+swg9Zws4U8ji+oE4iPPlry7II3S06cmpI4WYXvJLxS6DGONd8bUZzvl6VhkJQN9kSfrQsUh
	H0x6ylMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScrD-0000000DE00-1lQ5;
	Mon, 08 Dec 2025 15:08:59 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScr9-0000000DDzF-2Sxe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 15:08:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hS/UahhXHl+RrowRIZHM7vwQFEZP9EXgs0tkKoqW6vU=;
	b=zEW+fBglq0WPW16VqvzIxSR17YSTCtFRSvvqLEYyyH0Y/r2fWuJEhTWunw99lqpgTrfH9E/OG
	JtpP+rD8eJJVWMoJdR/xjbPv0TccsTmSW+9db+dFZh13NdnMSZH01NQMW/uUFZRIrp5DRar1HW2
	SLD1Mbw9w6SNISyy/S/+jxg=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dQ50f4lQrz12LDc;
	Mon,  8 Dec 2025 23:06:26 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A16B180BD7;
	Mon,  8 Dec 2025 23:08:45 +0800 (CST)
Received: from DESKTOP-A37P9LK.china.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Dec 2025 23:08:44 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <torvalds@linux-foundation.org>,
	<viro@zeniv.linux.org.uk>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Date: Mon, 8 Dec 2025 23:08:40 +0800
Message-ID: <20251208150840.92209-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aTbF009476Iufory@shell.armlinux.org.uk>
References: <aTbF009476Iufory@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_070856_300951_8D44331B 
X-CRM114-Status: GOOD (  21.76  )
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

On Mon, 8 Dec 2025 12:34:27 +0000, Russell King wrote:
> The first patch adds an additional check in __do_kernel_fault() to
> detect this condition. This patch is a non-obvious dependency for the
> next patch.
>
> The second patch handles faults above the top of userspace entirely
> separately, meaning we have a simpler and more obvious fault path,
> which avoids any possibility of taking any MM mutexes, which is the
> cause of the hash_name() problem.
>
> The third patch moves harden_branch_predictor() out of
> __do_user_fault() and to appropriate places in the parent functions.
> The reason this has been avoided thus far is because do_page_fault()
> can be a hot path (since it's used for page aging as well) but with
> kernel address faults being handled by an entirely separate path,
> this avoids adding to that overhead.

I don't have any objections to the first and second patches. However,
for the third patch, I feel it complicates some things. It removes
harden_branch_predictor() from __do_user_fault() and adds it to various
previous calling points.

This seems to be solely for adapting to the scenario of do_alignment() &&
user_mode(regs) && addr >= TASK_SIZE. Does this scenario really exist?
Again, in your last email, you described it as follows:
On Fri, 5 Dec 2025 12:08:14 +0000, Russell King wrote:
> Also tested usermode access to kernel space
> which fails with SEGV:
> - read from 0xc0000000 (section permission fault, do_sect_fault)
> - read from 0xffff2000 (page translation fault, do_page_fault)
> - read from 0xffff0000 (vectors page - read possible as expected)
> - write to 0xffff0000 (page permission fault, do_page_fault)

In other words, if there is a BUG_ON():
```patch
diff --git a/arch/arm/mm/alignment.c b/arch/arm/mm/alignment.c
index 3c6ddb1afdc4..d61c5adc7f96 100644
--- a/arch/arm/mm/alignment.c
+++ b/arch/arm/mm/alignment.c
@@ -833,10 +833,12 @@ do_alignment(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 		}
 	} else {
 		fault = alignment_get_arm(regs, (void *)instrptr, &instr);
 	}
 
+	BUG_ON(user_mode(regs) && !fault && addr >= TASK_SIZE);
+
 	if (fault) {
 		type = TYPE_FAULT;
 		goto bad_or_fault;
 	}
```
Could this BUG_ON() be triggered?

If the answer is "no," then I think that something this may be enough:
```patch
diff --git a/arch/arm/mm/alignment.c b/arch/arm/mm/alignment.c
index 3c6ddb1afdc4..03aa2cff8c16 100644
--- a/arch/arm/mm/alignment.c
+++ b/arch/arm/mm/alignment.c
@@ -809,6 +809,9 @@ do_alignment(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	int thumb2_32b = 0;
 	int fault;

+	if (unlikely(addr >= TASK_SIZE && user_mode(regs)))
+		return do_kernel_address_page_fault(current->mm, addr, fsr, regs);
+
 	if (interrupts_enabled(regs))
 		local_irq_enable();

```
And just keep harden_branch_predictor() stay in __do_user_fault().

If I have misunderstood anything, please point it out. Thanks very much.

