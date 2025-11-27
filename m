Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36053D116E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 02:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O9IKzc4c6/mbu1blfNI5sH3F7thx+yy8ntXJTr2Dw4=; b=yEt+1ZftzYOXXBIKrmXfTvDyGy
	HgYdG6nEO9ZCY7nbjkU+dhTN5bAPALz5dmZXqQIi6C30gOz1CmkNVLOW27A9JTcISAdfnAs/8NVZi
	Tlns9+XHMHpsGMxDh5ZOLFDUoqJdRhVRdwwNO0O0R6wpqgOA13fGN5puSn1Zxj5I+dW0MGMaO/z7J
	WSc18y5LIhkEqP7mO/hzJYncuqGSaPFiEZSKQ4ezXaRCxESTG/YHK/cFVCjWu/3GlEZD39wV8XtWH
	RAvndEmrf4AqcCFJVtY1yxMXKGbKL0E40mMd0z8S9Crdc1qUTZaSZ7sEi0kyPIEMXq0OPbi0y56YZ
	ebhn/s0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORgQ-0000000FtKb-2ZRH;
	Thu, 27 Nov 2025 02:24:34 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORgL-0000000FtKG-3RI5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 02:24:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dH0bP3ZqlzYQtkv
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 10:23:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 571361A0FCA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 10:24:22 +0800 (CST)
Received: from [10.174.176.88] (unknown [10.174.176.88])
	by APP2 (Coremail) with SMTP id Syh0CgAXdHpTtidpTkSaCA--.14138S3;
	Thu, 27 Nov 2025 10:24:22 +0800 (CST)
Message-ID: <c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
Date: Thu, 27 Nov 2025 10:24:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
To: Al Viro <viro@zeniv.linux.org.uk>, Zizhi Wo <wozizhi@huaweicloud.com>,
 torvalds@linux-foundation.org
Cc: jack@suse.com, brauner@kernel.org, hch@lst.de, akpm@linux-foundation.org,
 linux@armlinux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, yangerkun@huawei.com,
 wangkefeng.wang@huawei.com, pangliyuan1@huawei.com, xieyuanbin1@huawei.com
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126185545.GC3538@ZenIV>
From: Zizhi Wo <wozizhi@huaweicloud.com>
In-Reply-To: <20251126185545.GC3538@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgAXdHpTtidpTkSaCA--.14138S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ary7Kr18ur18uF48tr4xZwb_yoW8Wr1Dpr
	yxG3W5CF45Xw15twn7Aa92kryftan5KrWUGryfWwnYkw4YkFy09w4ftF4DW34agwn7Cr4k
	JF4j9w4qvrZYga7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUOv38UUUUU
X-CM-SenderInfo: pzr2x6tkl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_182430_240754_A28372A0 
X-CRM114-Status: GOOD (  13.08  )
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



在 2025/11/27 2:55, Al Viro 写道:
> On Wed, Nov 26, 2025 at 05:05:05PM +0800, Zizhi Wo wrote:
> 
>> under an RCU read-side critical section. In linux-mainline, arm/arm64
>> do_page_fault() still has this problem:
>>
>> lock_mm_and_find_vma->get_mmap_lock_carefully->mmap_read_lock_killable.
> 
> 	arm64 shouldn't hit do_page_fault() in the first place, and
> do_translation_fault() there will see that address is beyond TASK_SIZE
> and go straight to do_bad_area() -> __do_kernel_fault() -> fixup_exception(),
> with no messing with mmap_lock.
> 
> 	Can anybody confirm that problem exists on arm64 (ideally - with
> reproducer)?
> 


Thank you all for the replies.

We did reproduce the issue on arm, and I mistakenly assumed the same
problem existed on arm64 after looking at the do_page_fault() code.
However, I just confirmed using the test program that, as everyone
pointed out, it goes through do_translation_fault() and reaches
do_bad_area() -> __do_kernel_fault(). So indeed, the issue does not
exist on arm64 — that was my oversight...

That said, I’d like to ask a follow-up question:

Why does x86 have special handling in do_kern_addr_fault(), including
logic for vmalloc faults? For example, on CONFIG_X86_32, it still takes
the vmalloc_fault path. As noted in the x86 comments, "We can fault-in 
kernel-space virtual memory on-demand"...

But on arm64, I don’t see similar logic — is there a specific reason
for this difference? Maybe x86's vmalloc area is mapped lazily, while
ARM maps it fully during early boot?

Thanks,
Zizhi Wo


