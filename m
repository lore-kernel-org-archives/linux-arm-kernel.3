Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8520C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cz7IA69OFA9tHcBAPSVOCjGmnTTL7mvde1OZORF4svs=; b=IkjF1jSE80siRyFFgvwi6yq2uw
	YPqGifkoqpAf5C6UCBvwbO5HiB2sD1u8tP1IywZRoC7QWRaGURP/Pbo+noMUm6ZlXzDebPYwnOvsj
	pZg6bPQVaYzyLSc9gFpV+tN4MH3F76Qfjfr74an3o/CDR2rKKm/C4L2AT7ulgsRX1ePtCW2B7j3Bd
	IN+FHE68LPeLjYudRzP9+Sm8eGI/dYoFJ8PYD3+EtBZ9ozSjUmVciviCiK4zCFKUbPbhIyPJ3UJ5d
	Qsn+YW1LZG416V6MQVzy7tf9I3Un4BFsk7awLlcTuGDNHm8Q7A11kZcsHpPTA70/01BtrQjk3PR0M
	UC4maxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpT1H-00000004w5k-2APM;
	Tue, 04 Mar 2025 14:13:15 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSzB-00000004vbe-04U5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:11:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Z6ctR2c3Gz1ltZw;
	Tue,  4 Mar 2025 22:06:39 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B226C1A0188;
	Tue,  4 Mar 2025 22:10:50 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Mar 2025 22:10:48 +0800
Message-ID: <2c1fa758-c292-aefb-f6e2-cab41f592568@huawei.com>
Date: Tue, 4 Mar 2025 22:10:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v13 4/5] arm64: support copy_mc_[user]_highpage()
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-5-tongtiangen@huawei.com> <Z6zWSXzKctkpyH7-@arm.com>
 <69955002-c3b1-459d-9b42-8d07475c3fd3@huawei.com> <Z698SFVqHjpGeGC0@arm.com>
 <e1d2affb-5c6b-00b5-8209-34bbca36f96b@huawei.com> <Z7NN5Pa-c5PtIbcF@arm.com>
 <3b181285-2ff3-b77a-867b-725f38ea86d3@huawei.com> <Z7TisqB5qCIF5nYI@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z7TisqB5qCIF5nYI@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_061105_479735_991D3A81 
X-CRM114-Status: GOOD (  19.92  )
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

Hi,Catalin:

Kindly ping ...

Thanks.:)

在 2025/2/19 3:42, Catalin Marinas 写道:
> On Tue, Feb 18, 2025 at 07:51:10PM +0800, Tong Tiangen wrote:
>>>>>> 在 2025/2/13 1:11, Catalin Marinas 写道:
>>>>>>> On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
>>>>>>>> Currently, many scenarios that can tolerate memory errors when copying page
>>>>>>>> have been supported in the kernel[1~5], all of which are implemented by
>>>>>>>> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
>>>>>>>>
>>>>>>>> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
>>>>>>>> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
>>>>>>>> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
>>>>>>>>
>>>>>>>> Add new helper copy_mc_page() which provide a page copy implementation with
>>>>>>>> hardware memory error safe. The code logic of copy_mc_page() is the same as
>>>>>>>> copy_page(), the main difference is that the ldp insn of copy_mc_page()
>>>>>>>> contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
>>>>>>>> main logic is extracted to copy_page_template.S. In addition, the fixup of
>>>>>>>> MOPS insn is not considered at present.
>>>>>>>
>>>>>>> Could we not add the exception table entry permanently but ignore the
>>>>>>> exception table entry if it's not on the do_sea() path? That would save
>>>>>>> some code duplication.
> [...]
>> So we need another way to distinguish the different processing of the
>> same exception type on SEA and non-SEA path.
> 
> Distinguishing whether the fault is SEA or non-SEA is already done by
> the exception handling you are adding. What we don't have though is
> information about whether the caller invoked copy_highpage() or
> copy_mc_highpage(). That's where the code duplication comes in handy.
> 
> It's a shame we need to duplicate identical functions just to have
> different addresses to look up in the exception table. We are also short
> of caller saved registers to track this information (e.g. an extra
> argument to those functions that the exception handler interprets).
> 
> I need to think a bit more, we could in theory get the arm64 memcpy_mc()
> to return an error code depending on what type of fault it got (e.g.
> -EHWPOISON for SEA, -EFAULT for non-SEA). copy_mc_highpage() would
> interpret this one and panic if -EFAULT. But we lose some fault details
> we normally get on a faulty access like some of the registers.
> 
> Well, maybe the simples is still to keep the function duplication. I'll
> have another look at the series tomorrow.
> 

