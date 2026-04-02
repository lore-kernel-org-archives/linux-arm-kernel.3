Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1B21112246
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 01:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLdczJYdweiDTR4k8RfWxcCkbFm9C4zs52yHWSQ3P04=; b=I0fD1ol33CskitS6jHF0DIjj//
	J3rBZ6kPxM8XLtT3zLW6Y+sVtASiJA1mW1kMMSBl9ErNLq5AYwrHUb9eHHF9zvhropdEXgwPHe9/G
	dxPpNwQckXyfWVW0n38APUiCMpnoIQkvtimC0I2cfYo5z2O8iI3wdEG4cvVY3LDdaQur7u1oRhRYM
	tuxw+YoinMaIzsW9z/KJFZHidPF+cIuFpCt8I1Zqv8vP3HYHJSo1QHLzHoxW/0/Zqr8cz2IHMazSk
	TDGNHqVckqupTecv9Y4e4DWqVUvsdIrLbgmvstLJEEPBlwNw5celCDoGmZbtipdZOjOzd9sycEd0D
	k0AYQhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w873u-0000000GYuN-1R4G;
	Thu, 02 Apr 2026 01:41:35 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w873q-0000000GYr9-0gss
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 01:41:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cLdczJYdweiDTR4k8RfWxcCkbFm9C4zs52yHWSQ3P04=;
	b=i0naMR9w04jGCrCibz1QpTYUhPTuY7iux05gGMK9OFaMfxlmSa7ATYNv3hCbz5tRSIo6iRQcu
	XVq9K1Etj+PvKfocDXdznvishGbYpJDXYsTaKic+8y9AKj0FIbaMo2KSJwzioj8ZvT/E3OzEr5d
	1qXQG41oOqb5dstsqF+2Qws=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fmPY40Wncz12LJV;
	Thu,  2 Apr 2026 09:34:48 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B11FC40569;
	Thu,  2 Apr 2026 09:41:13 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 2 Apr 2026 09:41:10 +0800
Message-ID: <adf2b4a8-27d6-59ad-74f3-ea43e07fe84f@huawei.com>
Date: Thu, 2 Apr 2026 09:41:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v14 3/4] arm64: Use generic TIF bits for common thread
 flags
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<hca@linux.ibm.com>, <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
	<borntraeger@linux.ibm.com>, <svens@linux.ibm.com>, <oleg@redhat.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <arnd@arndb.de>,
	<shuah@kernel.org>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<anshuman.khandual@arm.com>, <thuth@redhat.com>, <ryan.roberts@arm.com>,
	<mark.rutland@arm.com>, <song@kernel.org>, <ziyao@disroot.org>,
	<linusw@kernel.org>, <schuster.simon@siemens-energy.com>,
	<jremus@linux.ibm.com>, <akpm@linux-foundation.org>,
	<mathieu.desnoyers@efficios.com>, <kmal@cock.li>, <dvyukov@google.com>,
	<reddybalavignesh9979@gmail.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-s390@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260320104222.1381274-1-ruanjinjie@huawei.com>
 <20260320104222.1381274-4-ruanjinjie@huawei.com> <acz5mOrm6_E1UBwV@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <acz5mOrm6_E1UBwV@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_184130_937470_95F26D7C 
X-CRM114-Status: UNSURE (   9.74  )
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



On 2026/4/1 18:55, Catalin Marinas wrote:
> On Fri, Mar 20, 2026 at 06:42:21PM +0800, Jinjie Ruan wrote:
>> Use the generic TIF bits defined in <asm-generic/thread_info_tif.h> for
>> standard thread flags (TIF_SIGPENDING, TIF_NEED_RESCHED, TIF_NOTIFY_RESUME,
>> TIF_RESTORE_SIGMASK, TIF_SINGLESTEP, etc.) instead of defining
>> them locally.
>>
>> Arm64-specific bits (TIF_FOREIGN_FPSTATE, TIF_MTE_ASYNC_FAULT, TIF_SVE,
>> TIF_SSBD, etc.) are renumbered to start at bit 16 to avoid conflicts.
>>
>> This enables RSEQ optimizations which require CONFIG_HAVE_GENERIC_TIF_BITS
>> combined with the generic entry infrastructure (already used by arm64).
>>
>> By the way, remove TIF_FREEZE because this flag became unused since
>> commit d88e4cb67197 ("freezer: remove now unused TIF_FREEZE").
>>
>> Cc: Thomas Gleixner <tglx@kernel.org>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Given that it's touching multiple trees, I guess it's a series for
> Andrew?

Yes, this series touches x86, arm64, s390 and loongarch. It's best for
Andrew to help merge this in the -mm tree.

Moreover, the latter two arm64-related patches depend on patch serise
"arm64:
entry: Convert to Generic Entry" v14 being merged first, while the first
two patches can be merged in advance.

> 

