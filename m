Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1605DC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0/RM2kQyckW7LSQ3VeyfPEi1mattHTjXA79SYKL5MQ=; b=PnibfMOqmS3I4xkMHuz4sn4avE
	/icCK2jOmctuwGR0D2/jbBr7b8TvD0EkaDd95es/nd3FhEwCesvCqTGPFBVl9JUr//1WBBd5rDfkL
	336egQGljGgwDZ2d7X4cJM060BWW2ocD7AK3sQHs1YzfRWteMoazN/BUfDtpgXpUTj5MpPvJZd5/v
	DdluVnFT+2JNMyQAGwBLwW7OTnYO8KZmvdjyzt/+DSWtbATeCmBQ5rsbYlPPPeyH3RPao978+FdSZ
	j9rEXpxY1de+jD6fIP3gKxcJCZe0856y5LTRJUI31t2fyHvE3rv57soCq86DGhl7lQBVUM49FxX8J
	MSjH2lwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOEI-00000008SQH-18Ul;
	Wed, 25 Jun 2025 11:23:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMCT-000000085Zy-0X8t
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q0/RM2kQyckW7LSQ3VeyfPEi1mattHTjXA79SYKL5MQ=; b=EPwHsv5Sb1uNMTqhDKCF+oBBnp
	FuvMld3w6r8a+y5GHC3aPIn4JLlZKSWHuXmI5SN73pWa34mF6C75jYcgl0pMbkTll84Yf6rqhmGVw
	8173sYjeah7zBmEmXiMmda77UbqkL+8kp6PqMBogl2Ysnkufc6qprkWlZ+Fkhp1PQKLcgNTeXyPgW
	44SYcyucd70Bzp2FfM7B2Ihr6SWwcUHOS2Oeo2pFbuBaNL+oInAsvDvOMee5yf/YoDgyXkl31EDcq
	e1dt0m0fG/jHfIVZBkN256gCISWzzjb9XT6J/pHVQGiA2WSX6zjyavlfUljHi3lmPQUg2VClgPjH6
	bgR47l3g==;
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMCQ-00000005ipV-29Yg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:13:48 +0000
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 55P9CeH61706513
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 25 Jun 2025 02:12:40 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 55P9CeH61706513
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025062101; t=1750842761;
	bh=Q0/RM2kQyckW7LSQ3VeyfPEi1mattHTjXA79SYKL5MQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=W+B0I6fat7CBMT8xxv1mOc55VFltc/zjXsP3OwTMiTTZtyf3Fsi+bvE02lJgVO1F2
	 IuAz3EgL52KsFKV+kBlMfDlHRSSqrMPwCg18mlwvplgdehXFaGUTw6a++Ax4KL2kKw
	 FIQeeDSEq/A0BTqA1La3+DGCze68qT1gBK+gs79Vc2z5CkyhDqmHK7WUQlL7UsHmOp
	 d4ytIvUBcHN0QkrMS5NBIkyc85ZqDXjDMGXTKEDF86V1yqYddYtivujm+OYCDZjVGc
	 u0Wjl5yVuoFGi7OgzLoMZ20RQT2WTKH3AXcxbMIqftnevMQ06REiTtc4pqGPTXnfDk
	 hVKVhJdC3xoFg==
Date: Wed, 25 Jun 2025 02:12:39 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
        linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, gregkh@linuxfoundation.org,
        Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
        Yushan Wang <wangyushan12@huawei.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2 0/8] Cache coherency management subsystem
User-Agent: K-9 Mail for Android
In-Reply-To: <20250625085204.GC1613200@noisy.programming.kicks-ass.net>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com> <20250625085204.GC1613200@noisy.programming.kicks-ass.net>
Message-ID: <FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_101346_885338_1B89BE54 
X-CRM114-Status: GOOD (  16.59  )
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

On June 25, 2025 1:52:04 AM PDT, Peter Zijlstra <peterz@infradead=2Eorg> wr=
ote:
>On Tue, Jun 24, 2025 at 04:47:56PM +0100, Jonathan Cameron wrote:
>
>> On x86 there is the much loved WBINVD instruction that causes a write b=
ack
>> and invalidate of all caches in the system=2E It is expensive but it is
>
>Expensive is not the only problem=2E It actively interferes with things
>like Cache-Allocation-Technology (RDT-CAT for the intel folks)=2E Doing
>WBINVD utterly destroys the cache subsystem for everybody on the
>machine=2E
>
>> necessary in a few corner cases=2E=20
>
>Don't we have things like CLFLUSH/CLFLUSHOPT/CLWB exactly so that we can
>avoid doing dumb things like WBINVD ?!?
>
>> These are cases where the contents of
>> Physical Memory may change without any writes from the host=2E Whilst t=
here
>> are a few reasons this might happen, the one I care about here is when
>> we are adding or removing mappings on CXL=2E So typically going from
>> there being actual memory at a host Physical Address to nothing there
>> (reads as zero, writes dropped) or visa-versa=2E=20
>
>> The
>> thing that makes it very hard to handle with CPU flushes is that the
>> instructions are normally VA based and not guaranteed to reach beyond
>> the Point of Coherence or similar=2E You might be able to (ab)use
>> various flush operations intended to ensure persistence memory but
>> in general they don't work either=2E
>
>Urgh so this=2E Dan, Dave, are we getting new instructions to deal with
>this? I'm really not keen on having WBINVD in active use=2E
>

WBINVD is the nuclear weapon to use when you have lost all notion of where=
 the problematic data can be, and amounts to a full reset of the cache syst=
em=2E=20

WBINVD can block interrupts for many *milliseconds*, system wide, and so i=
s really only useful for once-per-boot type events, like MTRR initializatio=
n=2E

