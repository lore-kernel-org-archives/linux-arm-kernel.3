Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17BBD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 01:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prBMLbyd2mt/FcMAKdUEZS7SXQh45bnj3FnaMyVSix0=; b=Ir2TIICY51a4pARuKkadhGIQ+U
	tzf6ubKh0Ff5mi2LztaIfElvEwxko7se5bve1ciPLhl6FMGrXXDPBLt0ZziOAenLrxSs43WQ1wLHX
	WPgg8WOoLyhiyiDbolYepdQ0TbjuEV4sXMt4LcoWCUwewDBog4GJm/rI+CSOESAxEBcYpjFLj7ISY
	SJWu4VAGLkunt/bPaNj4pAOdC4GeFt+XU9mQspUojTRagDaNuD4SZW23YiToqy+jSrPhEtcEzOigd
	XSv5k12RKk7AjBwk+JTBwOLEmmDoPjaO0tsvaiZdAvlPAgt0aM36KeC5YmcJLmLnpkHfEu1Hfymw7
	a/KDKb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTrvq-0000000HU8h-3I2A;
	Fri, 12 Dec 2025 01:26:54 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTrvn-0000000HU8K-1p2c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 01:26:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=prBMLbyd2mt/FcMAKdUEZS7SXQh45bnj3FnaMyVSix0=;
	b=6C+SBFhTjOncm1GRrKZr3oSFsl8o5J9Jmx5aXXU20S0EBs0pOVK535R4wqXwJ9hhqvSXiBk29
	XVPoSDPfX1TNYs796vyPCo4uuyXecT6aU82kd5yDEagcJReophzTYqrl1LFkgl01Sea6jqkzKBa
	qIFsQHKkrONGL0FeH9fHw2I=
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dSBYw641QzpT0F;
	Fri, 12 Dec 2025 09:24:04 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A7B7140143;
	Fri, 12 Dec 2025 09:26:39 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Dec 2025 09:26:38 +0800
Message-ID: <77e16fa4-3024-2068-9bb2-82a904eec112@huawei.com>
Date: Fri, 12 Dec 2025 09:26:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 15/16] entry: Inline syscall_exit_work()
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Kevin Brodsky
	<kevin.brodsky@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<oleg@redhat.com>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>, <deller@gmx.de>,
	<macro@orcam.me.uk>, <charlie@rivosinc.com>, <ldv@strace.io>,
	<mark.rutland@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<ada.coupriediaz@arm.com>, <anshuman.khandual@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <dvyukov@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-16-ruanjinjie@huawei.com>
 <b382cc8a-3ce9-4fb1-bc0a-a3d9796251d1@arm.com> <87345hfqyh.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87345hfqyh.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_172652_090968_78861677 
X-CRM114-Status: GOOD (  15.10  )
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



On 2025/12/11 14:55, Thomas Gleixner wrote:
> On Tue, Dec 09 2025 at 14:48, Kevin Brodsky wrote:
>> On 04/12/2025 09:21, Jinjie Ruan wrote:
>>> After switch arm64 to Generic Entry, a new hotspot syscall_exit_work()
>>> appeared because syscall_exit_work() is no longer inlined. so inline
>>
>> Before this series the call to syscall_trace_exit() in el0_svc_common()
>> could not be inlined, so "no longer inlined" doesn't seem to be accurate.
>>
>>> syscall_exit_work(), and it has 2.6% performance uplift on perf bench
>>> basic syscall on kunpeng920 as below.
>>
>> That seems strange. syscall_exit_work() is only called if some flag in
>> SYSCALL_WORK_EXIT is set, which means that we're doing something special
>> like tracing. That shouldn't be the case when running a simple perf
>> bench syscall.
>>
>> Also worth nothing that its counterpart (syscall_trace_enter())) is not
>> currently inlined, the asymmetry would have to be justified.
>>
>>>     | Metric     | W/O this patch | With this patch | Change    |
>>>     | ---------- | -------------- | --------------- | --------- |
>>>     | Total time | 2.171 [sec]    | 2.114 [sec]     |  ↓2.6%    |
>>>     | usecs/op   | 0.217192       | 0.211453        |  ↓2.6%    |
>>>     | ops/sec    | 4,604,225      | 4,729,178       |  ↑2.7%    |
>>>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>  include/linux/entry-common.h  | 63 ++++++++++++++++++++++++++++++++++-
>>>  kernel/entry/syscall-common.c | 59 ++------------------------------
>>
>> These changes are purely generic, surely all architectures using
>> GENERIC_ENTRY should get similar benefits (assuming LTO isn't used)?
> 
> Correct, but as you said this does not make sense as the syscall exit
> work should be rare.
> 
> Jinjie, can you please figure out which TIF bit is causing this to be
> invoked?
> 
> I have a suspicion that it is TIF_NOTIFY_RESUME. If that's the case
> you're seing the RSEQ overhead, which should be completely gone with the
> rewrite that got just merged into Linus tree.

It maybe audit flag, the test is with audit on.

> 
> Thanks,
> 
>         tglx
> 
> 

