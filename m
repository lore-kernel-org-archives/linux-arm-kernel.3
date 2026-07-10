Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABA5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLA3HPVa4IkL/sCfl1Ni6nHLO1tC0tF97SgS+HJzcKw=; b=pHOIfVl49NTJ7eWG/FOyp3KLgG
	Otjj579CUg++LIT4FCthQ+GaZOBr/pi/2DVBknFMB5sEH2FT7m2T0JdFaDzwTOk7ldvpZeMVm91OD
	EXPIsVfRQEDFub+27KICaqBg9aIq0cvECzhi/+UERwmNetV7qNNVpjcsd8cpb2WwsEqIhWl4T7Ksk
	hssSEpPy0U8jWNb5MnpWS6cxa26MW4xNWCoViNsuHuTiLUMooe301na5RzGr//qzbe5d9y9XQwesH
	fpTjDgiQ8OasloeilX/ZsTin+p4hlowjcFSBiiPAS3f8oJlUlzIKCm+ZCsjP04Pjty8LbEPzuuF8A
	NysCrb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi12j-00000003y3A-2583;
	Fri, 10 Jul 2026 02:32:45 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi12g-00000003y2O-1MsL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:32:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=vLA3HPVa4IkL/sCfl1Ni6nHLO1tC0tF97SgS+HJzcKw=;
	b=6HxuLkZQ7xEfYha1BMyGZWIQVghQdQM1lgZu1HHkY/7k9r5bFITWYJDg0J+VdpZVQ0DeDxQrc
	8qE9+C+/OxxoF7nH3pM8iUm9t0U8VFGslx3vMzaEdEvJpVbH9JjEAjTHOwyJUQnE++g3RN7ZbKr
	Vq+jXLlvJE5mIz12+PFFPok=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gxFxF0tvJzKmVj;
	Fri, 10 Jul 2026 10:23:13 +0800 (CST)
Received: from kwepemo200010.china.huawei.com (unknown [7.202.195.178])
	by mail.maildlp.com (Postfix) with ESMTPS id AF2C740572;
	Fri, 10 Jul 2026 10:32:30 +0800 (CST)
Received: from [10.174.178.56] (10.174.178.56) by
 kwepemo200010.china.huawei.com (7.202.195.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 10 Jul 2026 10:32:29 +0800
Message-ID: <3fb3b11d-515b-400d-b1d2-5623dacb92cb@huawei.com>
Date: Fri, 10 Jul 2026 10:32:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
To: Russell King <linux@armlinux.org.uk>, Lorenzo Stoakes <ljs@kernel.org>
CC: Xie Yuanbin <xieyuanbin1@huawei.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <liam@infradead.org>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mhocko@suse.com>, <rppt@kernel.org>,
	<sunnanyong@huawei.com>, <surenb@google.com>, <vbabka@kernel.org>,
	<xiqi2@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
References: <akzpuerKqOY7qfFi@shell.armlinux.org.uk>
 <20260707131409.79043-1-xieyuanbin1@huawei.com> <akz8aZUW23rpyrLO@lucifer>
 <ak0cfZPZIWz4v95K@shell.armlinux.org.uk>
Content-Language: en-GB
From: Qi Xi <xiqi2@huawei.com>
In-Reply-To: <ak0cfZPZIWz4v95K@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.56]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo200010.china.huawei.com (7.202.195.178)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_193242_994643_54FB7293 
X-CRM114-Status: GOOD (  23.23  )
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


On 07/07/2026 23:34, Russell King wrote:
> On Tue, Jul 07, 2026 at 02:20:19PM +0100, Lorenzo Stoakes wrote:
>> On Tue, Jul 07, 2026 at 09:14:09PM +0800, Xie Yuanbin wrote:
>>> On Tue, 7 Jul 2026 12:57:45 +0100, Russell King wrote:
>>>> No. This information is useful debug for kernel oops.
>>> For kernel oops, I think it should be `!user_mode(regs)`, Qi Xi's reply:
>>>
>>> On Tue, 7 Jul 2026 19:48:12 +0800, Qi Xi wrote:
>>>> For do_DataAbort() fallback:
>>>>
>>>> 	if (user_mode(regs)) {
>>>> 		if (addr < TASK_SIZE) {
>>>> 			mmap_read_lock(current->mm);
>>>> 			show_pte(KERN_ALERT, current->mm, addr);
>>>> 			mmap_read_unlock(current->mm);
>>>> 		}
>>>> 	} else {
>>>> 		show_pte(KERN_ALERT, current->mm, addr);
>>>> 	}
>>> changes nothing to kernel oops. It only skip show_pte() for user-mode
>>> faults, and the fault addr is a kernel address, which means a user
>>> program is trying to access a kernel address.
>>> I think it is reasonable to skip show_pte() in this case?
>> Well the whole reason you're faulting here might be because a userland process
>> did that right? The page tables should tell you (presumably on ARM32 :)
>>
>> And I hate to repeat myself, maybe you didn't read the whole thread but... just
>> use mmap_write_lock(), this isn't necessary?
>>
>> What is this trying to achieve?
>>
>> You're not in a hotpath, why are you bothering to conditionally take/not take
>> the lock?
> Unconditionally taking the lock could lead to a deadlock. Consider
> the case where the mmap lock is held, and we get an unrecognised
> abort from the kernel.
>
> If we try to take the mmap lock again, we'll deadlock, which will
> result in very little debug information being output - and the
> system locks up. The only thing that would save such a case would
> be if the user had decided to use a hardware watchdog, or is
> physically present to press the reset button.

We are preparing a v4 and would like to confirm the approach for
the do_DataAbort() fallback path (__do_user_fault() is similar).

As Lorenzo noted, an mmap write lock is required here because
munmap() downgrades the write lock to a read lock before tearing
down page tables.

-	show_pte(KERN_ALERT, current->mm, addr);
+	if (user_mode(regs)) {
+		if (addr < TASK_SIZE) {
+			mmap_write_lock(current->mm);
+			show_pte(KERN_ALERT, current->mm, addr);
+			mmap_write_unlock(current->mm);
+		}
+	} else {
+		show_pte(KERN_ALERT, current->mm, addr);
+	}

The lock is taken only for user_mode(regs) + addr < TASK_SIZE, so
kernel aborts that may already hold the mmap lock are left unchanged.
For user-mode faults on kernel addresses (addr >= TASK_SIZE), as
Yuanbin noted, it is reasonable to skip show_pte().

Please let us know if you see any issues with this approach, or if you
would suggest a different way to handle it.


