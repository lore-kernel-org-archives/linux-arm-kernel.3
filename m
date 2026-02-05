Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB0CEA794C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 01:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI/2KWmPVAxqEykMkOoqWIvnmzgEQ82nJSITMhdtX+M=; b=H+JqLhq1Ko2nlDgZxFVX7GI4YS
	8oYpiIBTZRLHJUirzkpiLI3Nnh7vjGVi5zLM9/yjKMjQCjR8NYhBfyrEypYq7cdKGWiAGsJQwxj3f
	u+iX1UKu7KXnbo7n6ofKO/8tDS/PbN9ZDZ49BMBimpYDT9SunZkZl+NaT26YyOXkWwJVtt28iD9/l
	aJzJLnRlC9rRyvifcCKG7uk3VrzSZcWgTxW7L5LeCOra6gPnIl7OvXZaHCxY99Z2Dg0Tx7rUzTmKp
	8jJXDvlP/PPkd7vShE+35YF7tlzV94C8ZZJrsC8qBsFzNXcw+OKDZz4D/E+YtixO8u2KbTa6p6fa8
	zSysw+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vno0l-00000009Fxu-3AZy;
	Thu, 05 Feb 2026 01:18:23 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vno0j-00000009FxP-004h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 01:18:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xI/2KWmPVAxqEykMkOoqWIvnmzgEQ82nJSITMhdtX+M=;
	b=UilPor7KF1mQGZU80iF1wm9uhANb7eLpdUAAfT1EbAVqyz5f3MuJC2tHNZlVA+SgG/hUuthBb
	RxsdNeqfsHmppNRpkAktCBK4yL8IkwzfAa3s1QbgOejRAyaXY1R+f43osfcPzm2Pb9yzWIkUTqk
	OCgU5AQ7rP5i+K5xwCtHvW4=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f5zkb65ZLz1T4GK;
	Thu,  5 Feb 2026 09:13:43 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2F21540567;
	Thu,  5 Feb 2026 09:18:07 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Feb 2026 09:18:05 +0800
Message-ID: <39165a75-bf07-7e3c-6ed5-9431958b706a@huawei.com>
Date: Thu, 5 Feb 2026 09:18:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
To: Thomas Gleixner <tglx@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <kevin.brodsky@arm.com>,
	<akpm@linux-foundation.org>, <charlie@rivosinc.com>, <ldv@strace.io>,
	<anshuman.khandual@arm.com>, <mark.rutland@arm.com>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <song@kernel.org>, <ada.coupriediaz@arm.com>,
	<broonie@kernel.org>, <pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<kmal@cock.li>, <dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
 <87bji552uk.ffs@tglx> <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
 <87y0l823o9.ffs@tglx>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87y0l823o9.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_171821_689941_99CE40CB 
X-CRM114-Status: GOOD (  16.14  )
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



On 2026/2/4 18:39, Thomas Gleixner wrote:
> On Wed, Feb 04 2026 at 09:28, Jinjie Ruan wrote:
>> On 2026/2/3 22:16, Thomas Gleixner wrote:
>>> On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
>>>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
>>>> maintainers' work easier and codes more elegant. arm64 has already
>>>> successfully switched to the Generic IRQ Entry in commit
>>>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
>>>> time to completely convert arm64 to Generic Entry.
>>>>
>>>> The goal is to bring arm64 in line with other architectures that already
>>>> use the generic entry infrastructure, reducing duplicated code and
>>>> making it easier to share future changes in entry/exit paths, such as
>>>> "Syscall User Dispatch".
>>>>
>>>> This patch set is rebased on "sched/core". And the performance
>>>
>>> Why are you using sched/core, which contains a lot of unrelated
>>> changes. core/entry is the one which has the prerequisites and nothing
>>> else....
>>
>> By the way，it looks like core/entry and arm64 for-next/entry have
>> diverged: the first three patches of this series are already in arm64
>> for-next/entry but missing from core/entry.
>> Perhaps the two branches should be reconciled so that both contain the
>> same baseline.
> 
> The first three patches of this series are ARM specific and have nothing
> to do with the queued core/entry changes in tip. They are independent of
> each other and these three ARM64 changes have no business in my tree.
> 
> If the ARM64 folks want to apply the rest of your series then they have
> to pull the core/entry branch into their for-next/core branch first so
> the whole thing builds.
> 
> But given that the merge window opens on sunday, this is probably moot
> anyway and the rest of this series can go on top of rc1 in the ARM64
> tree w/o any further complications.

Thanks for the clear explanation, many thanks as well for the extensive
review work and the prompt replies on the generic entry changes.

Regards,
Jinjie

> 
> Thanks,
> 
>         tglx
> 

