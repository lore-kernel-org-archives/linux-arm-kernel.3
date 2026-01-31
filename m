Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6E5E6BF33
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 01:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dz1X5NwehduOdLuqzXJfd4vZBbbj36ZumdOgXhC2B6M=; b=YGZU1t/xbzXfxfeD+//Jciym/J
	l27USe311xMJXP2h1ElHZGFGS6ZZpTZ/3rlw6VbYQwNU9ye0BfnXhTJajO6XT9/ZZViQIm8HbIH9r
	tm7/GJV2/u2YrMmTpOYJosFcCf/9qGozc2R11Y75XC72AbE82RsLJBRz0I5mnGKedEBW8c/lNGy0o
	ThNg1YaY+mO9+jsjbb+9QlUAmbLf4tFMX8t+9PAVTJGnkwxUQQc4hU1HYBZMKBAJIRcRZx0mnqrD4
	YfH4dWW6fgudpfmkjLhRvKW6OfN+/wNOu6mH5pYMPIvHFd5egkyF2PYasAoVBUAi8WqYn7rBvILN0
	Cl+U0O1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm01U-00000002CRz-2Ebn;
	Sat, 31 Jan 2026 01:43:40 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm01R-00000002CRP-1Vr8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 01:43:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dz1X5NwehduOdLuqzXJfd4vZBbbj36ZumdOgXhC2B6M=;
	b=BeQrO5WodJ7LcjpfGp3ggL4G2lVrinrryJMqyRj3DjTLXQzPl/Ypkv8txuHyS2JikC561oyUl
	gfgChwvS74wOmOBroc8g+Tt0FJzfNYNmtDY8MMUK3zedgKUQwGwnTcCOwoIA8xtNwJm4LQAjnM8
	dIQ5QmRevv6HgLqqy4ppR4Q=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f2wXL54r1zcZyM;
	Sat, 31 Jan 2026 09:39:14 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 711B64056F;
	Sat, 31 Jan 2026 09:43:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 31 Jan 2026 09:43:27 +0800
Message-ID: <e74ab2c7-659e-5865-0b98-5d6b91718c0b@huawei.com>
Date: Sat, 31 Jan 2026 09:43:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v11 09/14] entry: Rework syscall_exit_to_user_mode_work()
 for arch reuse
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <deller@gmx.de>,
	<akpm@linux-foundation.org>, <charlie@rivosinc.com>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
 <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com> <87o6mbl82j.ffs@tglx>
 <13d22231-d84a-4993-9a69-e3922e45b500@arm.com> <87cy2rkuu9.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87cy2rkuu9.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_174338_011749_6CCFF82E 
X-CRM114-Status: GOOD (  16.62  )
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



On 2026/1/30 23:01, Thomas Gleixner wrote:
> On Fri, Jan 30 2026 at 14:27, Kevin Brodsky wrote:
>> On 30/01/2026 11:16, Thomas Gleixner wrote:
>>>> Agreed, the comments are essentially describing what each function
>>>> calls; considering how short they are, directly reading the code is
>>>> probably easier.
>>> No. Please keep them. There is more information in them than just the
>>> pure 'what's' called.
>>
>> That is true before this patch, where it made sense to highlight that
>> exit_to_user_mode() must still be called after this function (without
>> re-enabling interrupts). With this patch there is however much more that
>> this function is lacking, and it feels very likely that comments will go
>> out of sync with exactly what syscall_exit_to_user_mode() calls.
>>
>> I suppose we could simply point the reader to
>> syscall_exit_to_user_mode() to find out what else is needed, and keep
>> the comment about the calling convention being the same.
> 
> I've picked up _all_ four entry changes and reworked the comments and
> changelogs already.
> 
> Those patches should have been bundled together at the start of the
> series anyway so they can be picked up independently without going
> through loops and hoops. When will people learn to think beyond the brim
> of their architecture tea cup?

I'll make sure to group related changes together from the start next
time and keep the whole series in view, not just the
architecture-specific parts.
Thanks for taking the time to re-work them — much appreciated.

> 
> I'll go and apply them on top of 6.19-rc1 into core/entry and merge that
> into the scheduler branch to resolve the resulting conflict.
> 
> ARM64 can either pull that branch or wait until the next rc1 comes out.

Thanks for re-bundling the four entry patches and reworking the logs —
that definitely makes the series easier to pick up.

I'll rebase my remaining changes on top of 6.19-rc1 once the core/entry
branch lands.

Let me know if there’s anything I can do to simplify the logistics.

Regards,
Jinjie

> 
> Thanks,
> 
>         tglx
> 
> 

