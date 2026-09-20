Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55460C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 01:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njMEOsUoFJohAu6zIFYCgKOv4TMKh676Gz+T7444Mp4=; b=X1zPImQ+DqLeHRYlsPHgUig1h8
	axlX6UnJxYKPzSY+2dD74wQynV6O6QwgU4Je0TheFKaSACbvk7r0qj4zY3xk9l+HkdOys5FJA2kfX
	TH8rzBh1QO317NXjPMxfurJHMBR41O6MA5alO4vfBO9nXdQ7Hb24MdaGR1Dr1JA37Q+U/k4yBq8rX
	lZtJWl0OaVxz8hf9eoZWuglOzxuSn6sHQJd1d2HZ9pSxKcQbqWZJnIFgQlembNcgSR/f/jFVuDLfQ
	zYVKQM56noIfew+z5LGbBa4XDtLaYSHr9dYQz0W3zegA32jFEW/x7kuD3Z+uTnVfWqgZESz5kATxt
	rE9yQYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86Iy-0000000GivQ-3Q6b;
	Sun, 20 Sep 2026 01:25:20 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86Iu-0000000GiuS-2K6B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 01:25:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=njMEOsUoFJohAu6zIFYCgKOv4TMKh676Gz+T7444Mp4=;
	b=tnkdoXA4VWP7+jjWoGdnYPnT2L7i3VvJ1QUoVtlBOAbEtq7h/+oeGKrha/fAtKg98TTLOAI81
	LA8IIImUBK2gz5LLbi2phQ9oGckWPkTf68ivWlgEEIitAsbUxyXmlVs2v/j8byqIqvGU5XUpWi+
	e1tUGUyF6L78HplugkIb8C4=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hnT055drlznTZf;
	Sun, 20 Sep 2026 09:13:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BEC59402AB;
	Sun, 20 Sep 2026 09:25:00 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 20 Sep 2026 09:25:00 +0800
Message-ID: <dacc53d7-cb2c-4861-8813-8aff63e955bb@huawei.com>
Date: Sun, 20 Sep 2026 09:24:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 02/14] arm64: ptrace: Rework audit_syscall_entry()
To: Karl Mehltretter <kmehltretter@gmail.com>
CC: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260902095537.602517-1-ruanjinjie@huawei.com>
 <20260902095537.602517-3-ruanjinjie@huawei.com>
 <20260919164319.90193-1-kmehltretter@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260919164319.90193-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_182517_081917_7FB81649 
X-CRM114-Status: GOOD (  13.77  )
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



在 2026/9/20 0:43, Karl Mehltretter 写道:
>> +	if (unlikely(audit_context()))
>> +		syscall_enter_audit(regs);
> 
> With arm64 defconfig and CONFIG_AUDIT=n on v7.3-rc1, building
> arch/arm64/kernel/ptrace.o after this patch fails with GCC 15.2.0:
> 
> arch/arm64/kernel/ptrace.c: In function ‘syscall_trace_enter’:
> arch/arm64/kernel/ptrace.c:2491:17: error: implicit declaration of function ‘syscall_enter_audit’ [-Wimplicit-function-declaration]
>  2491 |                 syscall_enter_audit(regs);
>       |                 ^~~~~~~~~~~~~~~~~~~
> 
> The helper is defined only under CONFIG_AUDITSYSCALL, but this call
> remains when auditing is disabled. The audit_context() check does not
> avoid the missing declaration.
> 
> Could the helper get an audit-disabled stub, or could this call be
> guarded as well?

Hi Karl,

Thank you for pointing out this issue.

We discussed a similar problem with generic entry in the link below.
Thomas believed it appears to be a compiler problem, and we originally
planned to fix it using __always_inline. I will fix it following the
same approach used for generic entry.

https://lore.kernel.org/all/87tso45bqq.ffs@fw13/

Link:
https://lore.kernel.org/all/20260720094921.537716-1-ruanjinjie@huawei.com/
Link:
https://lore.kernel.org/all/20260721040118.1000554-1-ruanjinjie@huawei.com/

> 
> The same object builds after patches 1 and 13. Patch 12 still fails
> with the missing declaration. Patch 13 removes the affected code, but
> the intermediate commits should remain buildable.
> 
> Thanks,
> Karl

-- 
Best regards,
Jinjie


