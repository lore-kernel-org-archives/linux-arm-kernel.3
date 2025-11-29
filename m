Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA178CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BisTJGQsAm8JxGS/FGbNQObzPYii/zoODGDdLNjCUjY=; b=ToUr7vWvnoMWccq94Tk6MpiB48
	eMZ9kqUxaHl1lirpmMbMyP8FwrVyjZsbJj58zAW5yl6QY7DSmnmGFtPttgdjG5oGdscuYmg5t1hBy
	FsUsAvZ8/l44wkMaH/PO2uM/Glkzt8bUaoyUE9Tpfsle2tBddfddLB0gv5Or+eFG76zvZJhtyEXFA
	p3F+6SIcmZ3ivPQYaQqbhlDXAFUWP7/2GvwXs8QHBaxGCUjo+4I9/Z5n64Ud1k055LobnhA1lFE6c
	IcCWL86IFnw6p7sYJXQIxPNULBTrvEXimjvHa5YjIjYAdKUBGiAnIPha92V0A3sHIu7hjkfC3+u5q
	1O7v44Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHqK-00000001SAP-24EQ;
	Sat, 29 Nov 2025 10:06:16 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHqG-00000001SA0-2XxC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 10:06:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BisTJGQsAm8JxGS/FGbNQObzPYii/zoODGDdLNjCUjY=;
	b=LKw3pcChJY2cUq4YiMXDkqNKW1uu83CtT1Cn4XFrVavk9ZQBIgR9Sk+X+35pioEYv2visZasm
	L7+qSHl9jVwbawTaPiWHj9ttZntzmPQGQrcL95wodeDPDdbzBFohB+QJAOkM4kypwIn+YrfvhCo
	2pm5hyMdQxDlt5ORb9dDcS4=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dJQjT1yWtzcZyW;
	Sat, 29 Nov 2025 18:03:41 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id D16C8180B4E;
	Sat, 29 Nov 2025 18:06:01 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 29 Nov 2025 18:06:00 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <viro@zeniv.linux.org.uk>
CC: <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
	<bigeasy@linutronix.de>, <brauner@kernel.org>, <catalin.marinas@arm.com>,
	<hch@lst.de>, <jack@suse.com>, <liaohua4@huawei.com>, <lilinjie8@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux@armlinux.org.uk>, <pangliyuan1@huawei.com>,
	<rmk+kernel@armlinux.org.uk>, <wangkefeng.wang@huawei.com>,
	<will@kernel.org>, <wozizhi@huaweicloud.com>, <xieyuanbin1@huawei.com>,
	<yangerkun@huawei.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
Date: Sat, 29 Nov 2025 18:05:57 +0800
Message-ID: <20251129100557.10610-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129094448.GL3538@ZenIV>
References: <20251129094448.GL3538@ZenIV>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_020613_369312_2251ABEF 
X-CRM114-Status: GOOD (  14.58  )
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

On Sat, 29 Nov 2025 09:44:48 +0000, Al Viro wrote:
> On Sat, Nov 29, 2025 at 05:25:45PM +0800, Xie Yuanbin wrote:
>> In fact, I have already submitted another patch, which is exactly the way
>> as you described:
>> Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com
>>
>> The only difference is that I will move the judgment to before
>> local_irq_enable(). The reason for doing this is to fix another bug,
>> you can find more details about it here:
>> Link: https://lore.kernel.org/20250925025744.6807-1-xieyuanbin1@huawei.com
>> Link: https://lore.kernel.org/20251129021815.9679-1-xieyuanbin1@huawei.com
>
>AFAICS, your patch does nothing to the case when we hit kernel address from
>kernel mode, which is what triggers that "block in RCU mode for no good reason"
>fun...

I'm a little confused. Which patch are you referring to?

BTW, I'm trying my best to fix both of these two bugs (might_sleep() in
RCU Read Critical Section and missing harden_branch_predictor()
mitigation):
Link: https://lore.kernel.org/20251126090505.3057219-1-wozizhi@huaweicloud.com
Link: https://lore.kernel.org/20250925025744.6807-1-xieyuanbin1@huawei.com
at the same time, because I feel that the solutions of these two bugs are
very similar in some way. And there is a preliminary solution in place:
```patch
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2bc828a1940c..5c58072d8235 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -270,10 +270,15 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	if (kprobe_page_fault(regs, fsr))
 		return 0;
 
+	if (unlikely(addr >= TASK_SIZE)) {
+		fault = 0;
+		code = SEGV_MAPERR;
+		goto bad_area;
+	}
 
 	/* Enable interrupts if they were enabled in the parent context. */
 	if (interrupts_enabled(regs))
 		local_irq_enable();
```
Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com

I'm not sure if I'm doing the right thing. Do you have any suggestions for
this?

Thanks very much!

Xie Yuanbin

