Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE520D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 01:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+Sm016XecfIRVb9f02G8NevCS17Unuerb4iXY+i7jo=; b=xmI4AtY4ov5ejYJzV2A6XjrgA9
	MVkM+IzNZAeHFLFZDUDEIkNDgsrgrhpEipqEjBk7XJY19sZbnYyVOuBvTZELM/BY5uwWWRQuTQUAA
	Tp3OofpJx0y4jytRGmVDWX3bkbWMLXBAAaRY5Aq5J/bygZCKbAhumWMeGaMjf4WCoQHCoWaXyKv8F
	VcAywW3G9s3xGabDZwVpxmKPgYYXjG9wDnXfADzKzMRXkPeA2rm0XgN5OQ2a1P7diOhcRb6zG+426
	4SYTRLb7m7TN5+yGVkEOe34UMQbKVRod8PgVLUDUacUZOcxEjEXeEEECl+t+ET8dmZpVsxUT83PRO
	yMsATtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP9L2-000000016nn-2SQN;
	Sat, 29 Nov 2025 01:01:24 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP9Ky-000000016mz-2WWr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 01:01:22 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dJBfS4c1qzYQtkX
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 09:00:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id BBEA11A1C35
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 09:01:12 +0800 (CST)
Received: from [10.174.176.88] (unknown [10.174.176.88])
	by APP2 (Coremail) with SMTP id Syh0CgCH5XvWRSppIhd8CQ--.54714S3;
	Sat, 29 Nov 2025 09:01:12 +0800 (CST)
Message-ID: <3d590a6d-07d1-433c-add1-8b7d53018854@huaweicloud.com>
Date: Sat, 29 Nov 2025 09:01:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Zizhi Wo <wozizhi@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 jack@suse.com, brauner@kernel.org, hch@lst.de, akpm@linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 yangerkun@huawei.com, wangkefeng.wang@huawei.com, pangliyuan1@huawei.com,
 xieyuanbin1@huawei.com, Al Viro <viro@zeniv.linux.org.uk>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com>
 <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
 <aSgut4QcBsbXDEo9@shell.armlinux.org.uk>
 <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
From: Zizhi Wo <wozizhi@huaweicloud.com>
In-Reply-To: <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgCH5XvWRSppIhd8CQ--.54714S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAw45Cr1kXry7trWxJF47Jwb_yoW5CFWrpr
	Wjk3ZIk3y7WF1Sya4xAan2vFyxA3Z5Ar45GF90krs5uwsrWrnFgw4Sgws0y3429rnYga10
	vr4YvryUuwn8GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzr2x6tkl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_170121_031400_B2C2A3C8 
X-CRM114-Status: GOOD (  31.44  )
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



在 2025/11/29 1:06, Linus Torvalds 写道:
> On Thu, 27 Nov 2025 at 02:58, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
>>
>> Ha!
>>
>> As said elsewhere, it looks like 32-bit ARM has been missing updates to
>> the fault handler since pre-git history - this was modelled in the dim
>> and distant i386 handling, and it just hasn't kept up.
> 
> I actually have this dim memory of having seen something along these
> lines before, and I just had never realized how it could happen,
> because that call to do_page_fault() in do_translation_fault()
> visually *looks* like the only call-site, and so that
> 
>          if (addr < TASK_SIZE)
>                  return do_page_fault(addr, fsr, regs);
> 
> looks like it does everything correctly. That "do_page_fault()"
> function is static to the arch/arm/mm/fault.c file, and that's the
> only place that appears to call it.
> 
> The operative word being "appears".
> 
> Becuse I had never before realized that that fault.c then also does that
> 
>    #include "fsr-2level.c"
> 
> and then that do_page_fault() function is exposed through those
> fsr_info[] operation arrays.

Yes, it enters through fsr_info.

> 
> Anyway, I don't think that the ARM fault handling is all *that* bad.
> Sure, it might be worth double-checking, but it *has* been converted
> to the generic accounting helpers a few years ago and to the stack
> growing fixes.
> 
> I think the fix here may be as simple as this trivial patch:
> 
>    diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
>    index 2bc828a1940c..27024ec2d46d 100644
>    --- a/arch/arm/mm/fault.c
>    +++ b/arch/arm/mm/fault.c
>    @@ -277,6 +277,10 @@ do_page_fault(unsigned long addr, ...
>          if (interrupts_enabled(regs))
>                  local_irq_enable();
> 
>    +     /* non-user address faults never have context */
>    +     if (addr >= TASK_SIZE)
>    +             goto no_context;
>    +
>          /*
>           * If we're in an interrupt or have no user
>           * context, we must not take the fault..
> 
> but I really haven't thought much about it.
> 
>> I'm debating whether an entire rewrite would be appropriate

Thank you for your answer. In fact, this solution is similar to the one
provided by Al. It has an additional check to determine reg:

```
if (unlikely(addr > TASK_SIZE) && !user_mode(regs))
	goto no_context;
```

I'd like to ask if this "regs" examination also needs to be brought
along?

I'm even thinking if we directly have the corresponding processing
replaced by do_translation_fault(), is that also correct?

```
-       { do_page_fault,        SIGSEGV, SEGV_MAPERR,   "page 
translation fault"           },
+       { do_translation_fault, SIGSEGV, SEGV_MAPERR,   "page 
translation fault"           },
```

> 
> I don't think it's necessarily all that big of a deal. Yeah, this is
> old code, and yeah, it could probably be cleaned up a bit, but at the
> same time, "old and crusty" also means "fairly well tested". This
> whole fault on a kernel address is a fairly unusual case, and as
> mentioned, I *think* the above fix is sufficient.
> 
> Zizhi Wo - can you confirm that that patch (whitespace-damaged, but
> simple enough to just do manually) fixes things for your test-case?
> 
>             Linus
> 

I tried it out and it works — thanks!

Thanks,
Zizhi Wo


