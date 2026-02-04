Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C15E8B383
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 01:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+0hqhwwEEcFoOBs1tRRgPrd1kMmn8Imhm5OGfDiaX8=; b=0DHIhcYEuHATYzWo8d0hSzPS8y
	GsUwrcp89elvdTtFjiKcFKMID1DqIAAD3xF8KlaBRKhATIaH9FmYp5uINOcqFhDlFTDk0zzp2LUmX
	gVN3L8Zkx7LNUB85O7lwYq1+1u/LT4zLI0PT62kHOMBxYNDGIfkImWwTB2IRo2e3ewKb9b2lrU31J
	aYVAVq4dOYCXvKqc2YwwyUrunYJxYMWQfPN/hkKNOB6o5QwTe0ykhRGarbjTg9gOz4mHQRBFzyH4C
	IxzBIPBnMVQqj1YxbNq5rUvy7z5TozLssIUd4sSTmyVVrgpo7rdW7gSVdyRhXPQPsOuwgJQqkJ5up
	0sN0AkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRhO-00000007gbB-1zbU;
	Wed, 04 Feb 2026 01:28:54 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRhL-00000007gaZ-1P5m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 01:28:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=L+0hqhwwEEcFoOBs1tRRgPrd1kMmn8Imhm5OGfDiaX8=;
	b=zpUsv6Z5Y8Lo53Zlj04UUtA46/PV3thl93doCgX194Q7eZyh0HmebxnRFUajgX1o5/q3btODi
	ek88WT3o7pvrEB2dTiOuq3PuG/qz27cnuVfJ6Ko/7BEGuUev5OQRCD3I3EoqKqGIwGNB3PIDPMj
	ZN1eBcP//+5yOU2Fe4SmtUs=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f5N135NR4zLlSB;
	Wed,  4 Feb 2026 09:24:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 852DD40363;
	Wed,  4 Feb 2026 09:28:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 09:28:39 +0800
Message-ID: <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
Date: Wed, 4 Feb 2026 09:28:26 +0800
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
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_172851_841719_2D923C1B 
X-CRM114-Status: GOOD (  10.39  )
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

By the way，it looks like core/entry and arm64 for-next/entry have
diverged: the first three patches of this series are already in arm64
for-next/entry but missing from core/entry.
Perhaps the two branches should be reconciled so that both contain the
same baseline.

> 
> 

