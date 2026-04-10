Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3524AF36B9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bClVIpICpxUFZrpNzPacQNh3LCyGQ394bBULoiY+YP4=; b=uJ3RhVoihvknS+
	Ex0PFCvmPs0ryhYkMlIj7IW0GRuXepEDh54edhTrZtbDTkd8YenBMzFpE6eTphJiIHYqG9DiXyeSK
	GthRj/FR/BBQhrYDEldtEQmVTAtXwJyHZDqyNT5nrJTCzGRBdPqoWWzKUc+82kdA9PL8YBIQik4z6
	xNX1+doLFNrBbkjDx4B50oyqn2/xI65bmKqs+UG2ZE3dJpOozabl9nTupT2Y+FnqZW70E4DmbfGMB
	m3ynoMyt74/OqW7TIjM/rrP2ZriHH887aOSO2BZQ7Vp0CNFSldxZCKvcUzK58eB291MBeM1PYwLID
	7kqlFRss/6CU6fBeyasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1Jd-0000000BRPX-1jwZ;
	Fri, 10 Apr 2026 02:09:49 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1JZ-0000000BROm-3yCw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 02:09:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bClVIpICpxUFZrpNzPacQNh3LCyGQ394bBULoiY+YP4=;
	b=p9iDYCoqVcNmsHO3LIMvAiJkZG/J+5qrpcuJZLi531Z/4IsNBdqP3+28GkgwJ2W5XczkIk2y2
	o290saBAWSN+9M0xjlk3SXxd1vxjHFAUQLnJRw6BwuXwtlbieIs8TfRSdLm0617du7xI8B7zKtS
	b5NNrHKzHVQIMKWUBsB/gBI=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fsKpK60HCzKm5G;
	Fri, 10 Apr 2026 10:03:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C9C0C40573;
	Fri, 10 Apr 2026 10:09:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 10 Apr 2026 10:09:37 +0800
Message-ID: <a27450c2-20bb-317f-dc83-0b5639c8d87f@huawei.com>
Date: Fri, 10 Apr 2026 10:09:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v14 00/10] arm64: entry: Convert to Generic Entry
Content-Language: en-US
To: Kees Cook <kees@kernel.org>
References: <20260320102620.1336796-1-ruanjinjie@huawei.com>
 <174e6d08-4922-f42f-2899-4c5b0df13469@huawei.com>
 <202604090906.28EA71F63@keescook>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <202604090906.28EA71F63@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_190946_502412_5F72D842 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, edumazet@google.com, will@kernel.org, mingo@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, mathieu.desnoyers@efficios.com, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, song@kernel.org, linusw@kernel.org, oleg@redhat.com, linux-kernel@vger.kernel.org, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/10 0:14, Kees Cook wrote:
> On Thu, Apr 09, 2026 at 02:29:04PM +0800, Jinjie Ruan wrote:
>> On 2026/3/20 18:26, Jinjie Ruan wrote:
>>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
>>> maintainers' work easier and codes more elegant. arm64 has already
>>> successfully switched to the Generic IRQ Entry in commit
>>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
>>> time to completely convert arm64 to Generic Entry.
>>>
>>> The goal is to bring arm64 in line with other architectures that already
>>> use the generic entry infrastructure, reducing duplicated code and
>>> making it easier to share future changes in entry/exit paths, such as
>>> "Syscall User Dispatch" and RSEQ optimizations.
>>
>> Just a quick ping to see if this series is good to go. Do I need to
>> provide a new version rebased on the latest arm64 for-next/generic-entry
>> branches, or is the current version acceptable?
> 
> One thing I see is Sashiko's comments on seccomp:
> https://sashiko.dev/#/patchset/20260320102620.1336796-1-ruanjinjie%40huawei.com
> where "ret", when not 0 or -1, will override the syscall number. While
> that's not currently possible, it'd be better to catch that, or rather,
> avoid the "ret ? : syscall" logic which isn't useful here. "ret" should
> probably be local to the "if (flags & _TIF_SECCOMP)" scope.

It might be better to fix the identical logic in the generic entry
first? then align arm64. Doing otherwise would cause the "arm64: entry:
Convert to generic entry" patch to create an unnecessary discrepancy.

> 

