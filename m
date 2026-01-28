Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE8AD35663
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 01:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGaN5t5yAecwPUfPu0SWueHdZEkikh9tEoeETEh9yTU=; b=i7fvVpAikkdQcY
	P4wNAfyMEci9OrkkoaN8LhgSaGZbjMaR7166JnBiYsjL7ahJb7whQsSH7tqSWE1e56rQ7z8wM0n3u
	1iEIeT0pIM/ht7zwNzUP3nZ16ocwTFGLnYYP67W0hxj0O8yzirKP4KhWe0u9we13QixTrs5dz4Oh5
	Z+vfuW2w/ZxTpDV5EFKvURErqgF2HnaNB18wTI2KmsVAcnbwPgPntL+e/XGB9CJbK0WDKG55w1h6B
	hPy6XwwtOtvnv4DXFYqOXooJq34q49Z9JpHi/4xutjWodyjXz4RgfNqdhuhi1o/rqKUwe4CWs3KvW
	xr5x+I9fAVhtGxzYmYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vku47-0000000FF9g-2J1G;
	Wed, 28 Jan 2026 01:09:51 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vku44-0000000FF9L-0LqA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 01:09:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lGaN5t5yAecwPUfPu0SWueHdZEkikh9tEoeETEh9yTU=;
	b=QY7A13ii//yij9w8amV6AnjLuC+xtRqv0A5aFsx3HH/AlxEldqDn/3RHxWvHg4XCGjY+vMPoM
	xDYlbw0sAN61KfC1rfk0soKq+1gPzpS63y8dwVM+1f/VRY4qYvJh3V+fwomgMb3SkgYG4AXKBWS
	2GTl9/3wIU/WFXh/bhW3eEg=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f13xd2zLrzLlSt;
	Wed, 28 Jan 2026 09:06:13 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 85C2240561;
	Wed, 28 Jan 2026 09:09:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 28 Jan 2026 09:09:36 +0800
Message-ID: <6ff5d366-3a2d-089b-5ac7-e40b81a8664c@huawei.com>
Date: Wed, 28 Jan 2026 09:09:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v10 05/16] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, Will Deacon <will@kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-6-ruanjinjie@huawei.com>
 <aXe6W69Esd1NLEU8@willie-the-truck>
 <28e54f74-9b3d-4c3c-9172-ceb429e7fcbe@arm.com>
 <4891191c-d1c3-6985-c2ea-1b29deb8abe1@huawei.com>
 <0f6212c1-7034-42f4-ba77-10e9ec52a4f5@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0f6212c1-7034-42f4-ba77-10e9ec52a4f5@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_170948_785264_265B4C59 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/1/27 23:06, Kevin Brodsky wrote:
> On 27/01/2026 12:34, Jinjie Ruan wrote:
>>> [...]
>>>
>>>>  I'm also concerned that rseq_debug_update_user_cs()
>>>> operates on instruction_pointer(regs) which is something that can be
>>>> chaned by ptrace.
>>> Isn't that true regardless of where rseq_syscall() is called on the
>>> syscall exit path, though?
>> My understanding is that if instruction_pointer(regs) is hijacked and
>> modified via ptrace at the syscall exit (ptrace_report_syscall_exit()),
>> this modification will not be observed by rseq. Specifically, in the
>> generic entry syscall exit path, rseq_syscall() is unable to detect such
>> a PC modification.
> 
> Good point. So concretely that means that currently on arm64, one could
> make the rseq debug check pass/fail by using the syscall exit trap to
> modify PC. OTOH this is impossible with generic entry because the rseq
> check is performed first. I'm not sure this is a feature anyone has even
> noticed, but it is a user-visible change indeed.

After digging into the ptrace code, I found that ptrace does not modify
instruction_pointer(regs) on the syscall exit path; it only changes the
return value as below.
Therefore, if my understanding is correct, Will's concern does not apply
here.

ptrace_set_syscall_info()
  -> ptrace_set_syscall_info_exit()
     -> syscall_set_return_value(child, regs, 0, rval)


Regards,
Jinjie

> 
> - Kevin
> 

