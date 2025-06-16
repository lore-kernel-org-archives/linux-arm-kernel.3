Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3370C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtGvOE9IkWbes8CgIfT+RmgRSfrKqvmV9wJmvIQ3bNg=; b=cA7KxEO/gb8jlT+ytYsnLCe2h9
	qAYjsmguacYLLTBA3Sp/kl8ELRNc9tOPkctpM+QGChQYNIhZuJMq33iAa6abYCaqZamrnT+FZbLus
	n3Eu/GfwyYxsNkRZBRxGnKgVi6wj2nytJTihQijDYmHu7Gj3OuwGIH7hUwmde9lu5Jc4YxTWj/jbr
	A4VBEgLLwAsqA6kXByS6UOWcC0ys09Br9TnFHtYIJ8leX5XIZRqv650hhqNy/uoL3NDVzHil4CyoO
	tm/8dmnbnd1AaPi8DZbowfHFb5fzq+3kUzKdT07ZAmL8b+gKJFc49mxHBBsjlkgWO6JlYFsrmhzWf
	Gn8tmf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR57l-00000003mMZ-2WcT;
	Mon, 16 Jun 2025 08:23:25 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4iq-00000003ijE-4A1v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:57:43 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bLMmb4KJ9zYQvTJ
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:57:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 901C31A12AC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:57:34 +0800 (CST)
Received: from [10.67.110.36] (unknown [10.67.110.36])
	by APP1 (Coremail) with SMTP id cCh0CgAXyHhtzk9o1UOwPQ--.23414S2;
	Mon, 16 Jun 2025 15:57:34 +0800 (CST)
Message-ID: <a1e709c5-53a6-4cfe-9958-3e26c8009414@huaweicloud.com>
Date: Mon, 16 Jun 2025 15:57:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] arm64/ptrace: Fix stack-out-of-bounds read in
 regs_get_kernel_stack_nth()
To: Will Deacon <will@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Catalin Marinas
 <catalin.marinas@arm.com>, "David A . Long" <dave.long@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250604005533.1278992-1-wutengda@huaweicloud.com>
 <20250612163331.GA13384@willie-the-truck>
Content-Language: en-US
From: Tengda Wu <wutengda@huaweicloud.com>
In-Reply-To: <20250612163331.GA13384@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgAXyHhtzk9o1UOwPQ--.23414S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWDJF1xXFWUtFWDJF18Zrb_yoWfWFc_Zw
	1qv3WkKw1rursFqwn8JrySvr1Fy3Z5XFW0v3W8Jr97Aa43Xr95ZF15u3s3Wwn8Xw4FgFs3
	u3sxW3s0v34Y9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UK2NtUUUUU=
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_005741_343032_4AB94931 
X-CRM114-Status: GOOD (  12.40  )
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



On 2025/6/13 0:33, Will Deacon wrote:
> On Wed, Jun 04, 2025 at 12:55:33AM +0000, Tengda Wu wrote:
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index f79b0d5f71ac..fe3f7e554d14 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -141,7 +141,7 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
>>  
>>  	addr += n;
>>  	if (regs_within_kernel_stack(regs, (unsigned long)addr))
>> -		return *addr;
>> +		return READ_ONCE_NOCHECK(addr);
> 
> I think this should be '*addr', but that makes me wonder wtf s390 is
> doing...
> 
> Will

Sorry, I just received this email as there have been some issues
with my mailbox recently. I was about to send the v2 version with
the '*' mark, but I found out you have already fixed and applied
it to the linux-next. Thank you for your tolerance.

Tengda


