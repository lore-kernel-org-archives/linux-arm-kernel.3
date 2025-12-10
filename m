Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1CCD3C521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 03:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFO2YsjMGZcIIj/uFguuFKsd93GM4jw6C5He4DUQsWI=; b=jYS4qaZzRQK1IR2eCeQOTdWbJv
	9BHTX/iu1sO/oZQjaLxZSZ2w4WWsILW+qb/QfOKzTGE82rjU2CMcd08DUWMggkYtcfeA+lCuJ1gHw
	EaX3zG0U91ZxfGiIUinAxLjI00YchJ4a+I1Z1vuq4HGUsfTZYSfNjGVttgtTdSy8Rqsnnl5XuLWeR
	33F53p5G2GkG3VcSjp8JuRE2Liv5mAiVSyrI/QIdtu5LOp4AVUiDIb7cIrpNHoCJC10UvOnn7YWfi
	SrlkE0zPM/HCrAKb6Bfkt7FM3ctxFvRqgs9kBV5oltwTvT8frT1gAvWLdjJQo/EOSUBLBos0EypMJ
	TGrl3VJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTAwT-0000000F3eF-1WAU;
	Wed, 10 Dec 2025 03:32:41 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTAwQ-0000000F3ds-2IeA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 03:32:40 +0000
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MSime4154876
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Dec 2025 19:32:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2025-q2; bh=rFO2YsjMGZcIIj/uFguu
	FKsd93GM4jw6C5He4DUQsWI=; b=GSX9bEbU1T40Xg/fyJSnktm0HsBJK+CMPYIN
	t9wR08wCdaha9QamKdHgCoGMJsEpuKtf8wPgsKIWrtOxDS27Z7WCvz8PyCMrrb7A
	P4N5uah6NcshkPdG6UHTQ2oS+Dj/h35cBe1LetVqsxqW80I+ORxHkWxSTdzmo46o
	OAJ27v50viTa1rBcBW6TThZeccvzOnW6bNNMMUKyGUpazszAFJiBpOagJUXidh4a
	b91tOy7KY5KvvpLYOxTPP+QpSlzv9Fs9/hGjSO84tC3wBhDXtwzHAwI/066hHrcu
	LQ7t2/NSozEdz9Fn5QYC8/WnG4cmmKy6fexwfnjrron4HtJWcg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4axr25vagn-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 19:32:37 -0800 (PST)
Received: from twshared13861.04.snb2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 10 Dec 2025 03:32:35 +0000
Received: by devbig071.cco5.facebook.com (Postfix, from userid 704538)
	id 76794B4122FC; Tue,  9 Dec 2025 19:32:29 -0800 (PST)
Date: Tue, 9 Dec 2025 19:32:29 -0800
From: Ben Niu <BenNiu@meta.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: Ben Niu <niuben003@gmail.com>, Ben Niu <benniu@meta.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <tytso@mit.edu>, <Jason@zx2c4.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Withdraw [PATCH v2] tracing: Enable kprobe for selected Arm64
 assembly
Message-ID: <aTjpzfqTEGPcird5@meta.com>
References: <20251103185237.2284456-1-benniu@meta.com>
 <aRr1gXk1giE8TXvY@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRr1gXk1giE8TXvY@J2N7QTR9R3>
X-FB-Internal: Safe
X-Proofpoint-GUID: AyL_w-ql3HytK7iQyKATTIaNMC3Zkswc
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=6938e9d5 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=9AdMxfjQAAAA:20 a=o1Hv5u3xvNx8kE97pkcA:9 a=CjuIK1q_8ugA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: AyL_w-ql3HytK7iQyKATTIaNMC3Zkswc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAyOSBTYWx0ZWRfXxuDKDeqJro/w
 XJ/ehupX+WGwgoPbSHrmPVpgEzTH8nNn2wxDv/m38MFEYfsA57Tg7bqQg2+dPDQWU3Vp6NG6J1L
 cAhDOA7L4ryp2T9D7x55kPWKgRwSp6diQjzp9VLV8ilHCjnLsgocQDYiK2B4XMy62Sgs5vzpMdf
 HoIo88aWLiQRfAdTZz/wlZMGGwCzOMPPQkgDNn10Znw0kcPjqk+x1KgOy0BIMm1f836ZTD82myG
 IpIMbfConCfuDjv6jUP6IFVhW3nvW2JOPMYswDFim3wCmPG8fIHsxMgfZsXEmNS29fRiP2flQ9h
 1goZTy2jd3PfDk5vQ3PNBNDl7R2w39/YmLvzDUFwLk2ZKYtWFSYe6640pymW6Cs54yyRTS0d6d2
 p4GOlJ8qsw3N+8fADY8/58H57Zz40Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_193238_608408_8CA1DF69 
X-CRM114-Status: GOOD (  31.05  )
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

On Mon, Nov 17, 2025 at 10:14:25AM +0000, Mark Rutland wrote:
> On Mon, Nov 03, 2025 at 10:52:35AM -0800, Ben Niu wrote:
> > When ftrace is enabled, a function can only be kprobe'd if
> >   (1) the function has proper nops inserted at the beginning
> >   (2) the first inserted nop's address is added in section
> >       __patchable_function_entries.
> >
> > See function within_notrace_func in kernel/trace/trace_kprobe.c
> > for more details.
> 
> As mentioned last time, this isn't accurate, and this is at the wrong
> level of abstraction. You're conflating kprobes with kprobes-based trace
> evnts, and you're describing the implementation details of ftrace rather
> than the logical situation that the function needs to be traceable via
> ftrace
> 
> This would be better summarized as:
> 
>   While kprobes can be placed on most kernel functions, kprobes-based
>   trace events can only be placed on functions which are traceable via
>   ftrace (unless CONFIG_KPROBE_EVENTS_ON_NOTRACE=y).

Thanks. I'm withdrawing this patch because my colleague suggested
a workaround that could trace __arch_copy_to_user/__arch_copy_from_user
without any changes for the kernel:

bpftrace -q -e '
BEGIN {
    printf("Attaching to __arch_copy_to_user...\n");
}

watchpoint:'"0x$(grep ' __arch_copy_to_user$' /proc/kallsyms | awk '{print $1}')"':4:x
{
    $n = reg("r2");
    @__arch_copy_to_user_sizes = hist($n);
}'

> IIUC from last time you only want this so that you can introspect
> __arch_copy_to_user() and __arch_copy_from_user(), so why can't you
> select CONFIG_KPROBE_EVENTS_ON_NOTRACE in your test kernel? That would
> require zero kernel changes AFAICT.

CONFIG_KPROBE_EVENTS_ON_NOTRACE has this help message, see
https://github.com/torvalds/linux/blob/c9b47175e9131118e6f221cc8fb81397d62e7c91/kernel/trace/Kconfig#L798,
that discourages production enablement, so we didn't turn it on.
 
> I'm not keen on doing this unless absolutely necessary, and as above it
> looks like we already have suitable options to make this possible for
> your use-case.

This patch is no longer needed.
 
> > This patch adds a new asm function macro SYM_FUNC_START_TRACE
> > that makes an asm funtion satisfy the above two conditions so that
> > it can be kprobe'd. In addition, the macro is applied to
> > __arch_copy_to_user and __arch_copy_from_user, which were found
> > to be hot in certain workloads.
> > 
> > Note: although this patch unblocks kprobe tracing, fentry is still
> > broken because no BTF info gets generated from assembly files. A
> > separate patch is needed to fix that.
> 
> As above, I'm not keen on doing this, and if it's largely incomplete, I
> think that's another nail in the coffin.
> 
> [...]
> 
> > +#ifdef CONFIG_ARM64_BTI_KERNEL
> > +#define BTI_C bti c;
> > +#else
> > +#define BTI_C
> > +#endif
> 
> Please note that we deliberately chose to always output BTI for asm
> functions to avoid a performance vaiability depending on whether BTI was
> enabled, so if we're going to change that, we must do that as a
> preparatory step with a clear rationale.

Ok, thanks for clarifying that.

> Mark.

