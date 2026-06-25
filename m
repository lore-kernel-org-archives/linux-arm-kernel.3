Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5393CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXOz4jKArAa5FB5VMTHkpC4nEe2uwAH6zF/L/3EeZfM=; b=tZIXVoT2MSALFhphaayl61Uq00
	6JprrNu3T+YHgE58KPrqElGuR1ha5maWuielLGp+mQhIwCgG7FaIPDoOGsOWjswg4GyEtj2u1t2nV
	a8hKrWD0aLBd1t3H0vW7wEPesSJxfq2jigZi08kE9tXnRMWJ+0JF4coKqzRPS8CieUvsFUb9kMgZc
	jIA9VfQv6qvFMMImMIOkLc/RsJo4Ar33vuSgdrHnneRAOrKD3E6UURIwSJ3krovnayv/36cEO+MoT
	1pj/Uswqgu6OmuhV/5+8IQB3Nnjh/YRwy7+1I8Jhx35nE5GuLwqxg980UDR1e5S2eb+l9jU6gkrIj
	1wCAQ5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciLN-000000096ZH-2Vme;
	Thu, 25 Jun 2026 11:34:05 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciLK-000000096Ya-34q8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:34:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fXOz4jKArAa5FB5VMTHkpC4nEe2uwAH6zF/L/3EeZfM=;
	b=Wy1k/cLAWGE8qt89xVYj/vj1klZ2id/bD2hcZLA25m73R8VhSw2DkzXuQ8XmFegOU7U2KJUq+
	JTHz9Ow0aQnVjsxXvfpODtQiyPVfwezSoT6CB1rdWTQxNw3UN27cnS4T9rqhSZUxw6+qdPV02Xx
	X/5juMsJsgRy3IiCrn0GHTw=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gmGg75CxKz1cyT1;
	Thu, 25 Jun 2026 19:24:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 51FE640575;
	Thu, 25 Jun 2026 19:33:56 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Jun 2026 19:33:54 +0800
Message-ID: <67c3ae5c-d88b-4172-9996-4e2046b7e0dc@huawei.com>
Date: Thu, 25 Jun 2026 19:33:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 01/11] entry: Fix potential syscall truncation in
 syscall_trace_enter()
To: Thomas Gleixner <tglx@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <peterz@infradead.org>,
	<luto@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<mark.rutland@arm.com>, <yeoreum.yun@arm.com>, <linusw@kernel.org>,
	<kevin.brodsky@arm.com>, <ldv@strace.io>, <thuth@redhat.com>,
	<james.morse@arm.com>, <song@kernel.org>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <ryan.roberts@arm.com>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-2-ruanjinjie@huawei.com> <874iirlu50.ffs@fw13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <874iirlu50.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_043403_376401_D2B98EC2 
X-CRM114-Status: GOOD (  18.56  )
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



On 6/25/2026 1:34 AM, Thomas Gleixner wrote:
> On Mon, May 11 2026 at 17:20, Jinjie Ruan wrote:
>> In syscall_trace_enter(), the current logic returns "ret ? : syscall".
>> While __secure_computing() currently only returns 0 (allow) or -1 (kill),
>> this "ret ? : syscall" pattern is conceptually flawed.
>>
>> If __secure_computing() were to return a non-zero value that isn't -1, it
>> would unintentionally override the actual system call number. This logic
>> is redundant because if seccomp denies the syscall, the execution path
>> should already be handled by the caller based on the error return, rather
>> than conflating the return code with the syscall number.
>>
>> Fix it by explicitly returning the syscall number. This ensures
>> the syscall register remains untainted by the trace return values and
>> aligns with the expectation that seccomp-related interceptions are
>> handled via the -1 return status.
>>
>> Cc: Thomas Gleixner <tglx@kernel.org>
>> Fixes: 142781e108b1 ("entry: Provide generic syscall entry functionality")
> 
> What's fixed here?
> 
> A potential future change of the __secure_computing() return value
> requires that _ALL_ callsites of that function have to be audited
> and fixed up, no?
> 
> So the change is not a fix it's an optimization to get rid of the extra
> conditional.
> 
> If you really want to sanitize this, then change the
> __secure_computing() return type to boolean (true = allow, false =
> fail) and fixup the two dozen or so call sites.

Hi, Thomas

That's an excellent suggestion. Changing __secure_computing() to a
boolean return type makes the seccomp boundary much more intuitive and
cleans up a lot of historical legacy.

I am happy to take this on. I will implement this sanitization by
changing the return type to bool and fixing up all the ~24 call sites
across the tree. To keep the series clean and bisectable, I will include
this as a standalone prerequisite cleanup patch at the very beginning of
the v16 series.

Thanks for pushing for a cleaner codebase!

Best regards,
Jinjie

> 
> Thanks,
> 
>         tglx
> 


