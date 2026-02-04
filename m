Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97A2E8B386
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 01:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sab77aD3NRaoRo9PD9BOaCGAGHr4ZUPWfgWJALWIRPg=; b=oRcMJdlWXZFugwtcKywaILx3O8
	irIIHzNT08kgaScg0yJXqHj0tBaemAHNvEsTfRiPuS6x5i8Ddq8OeooN/UzrSTfUd0NZH4pR3LeP6
	PKRkDuh+QH7ynhbSXDK0u8xJ9QOY35wz7t3uiZhqRR9255xuwvxiY9XRxTr/oelBLKIFCYLQ03n0D
	Mr1R98w1iUcU4pHaSsd7zrMkvJ0p4aoGgxvOQm4580FbmN3T4L3phDJ+wbu7fPKwQblESyI+X2LTi
	H1tL4YuvvwihybbND5xbZZDINxRcywqDX0LhJgtldnNozB13Tl/VM04Q4b5Gq0AI6h/IWphran6Ip
	tb8ljQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRTh-00000007ft8-04dt;
	Wed, 04 Feb 2026 01:14:46 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRTd-00000007fsX-3iDs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 01:14:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Sab77aD3NRaoRo9PD9BOaCGAGHr4ZUPWfgWJALWIRPg=;
	b=wZ7gQZbdRK1+GZJS0jqOE3vl4vndzym+EBkMx/e87JCQYlMowNqiiWFcFFSOLsIodNDjDP7VH
	Pbf6sr2gRUP2LA39TVUIGDKMjf5xKd0XjR+qKjsbVrgUGRo0+8feiw2xtUjSeNAl8zXJCQVGVWv
	edQ7DVAwewg5jGt33bT1164=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4f5Mhn016vzRhXJ;
	Wed,  4 Feb 2026 09:10:01 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D26A4056A;
	Wed,  4 Feb 2026 09:14:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 09:14:32 +0800
Message-ID: <a22ccdb5-5449-5e48-790a-5c3dd0de7544@huawei.com>
Date: Wed, 4 Feb 2026 09:14:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
Content-Language: en-US
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
 <87bji552uk.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87bji552uk.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_171442_557082_F55C1D94 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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



On 2026/2/3 22:16, Thomas Gleixner wrote:
> On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
>> maintainers' work easier and codes more elegant. arm64 has already
>> successfully switched to the Generic IRQ Entry in commit
>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
>> time to completely convert arm64 to Generic Entry.
>>
>> The goal is to bring arm64 in line with other architectures that already
>> use the generic entry infrastructure, reducing duplicated code and
>> making it easier to share future changes in entry/exit paths, such as
>> "Syscall User Dispatch".
>>
>> This patch set is rebased on "sched/core". And the performance
> 
> Why are you using sched/core, which contains a lot of unrelated
> changes. core/entry is the one which has the prerequisites and nothing
> else....

Sorry for misunderstanding your v11 reply—however, these patches can
still be applied directly to the core/entry branch.

Thanks,
Jinjie
> 
> 

