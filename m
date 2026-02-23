Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E2BEC1104
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+razHazSB6EJhbfIAGNdwccjEdK/vcc1wfb8MmG0YE=; b=dN3ZjccuTav/8Jz0E0fiGE+P0M
	B6IjmSSViDYS5dOdnNX7BCbB4LgVNJcvbyk2ELxzn0mFO6DAfAU0J5pyi7DOqSEyi+kJtYepxmzhf
	7h6aXi1BmL3DSIp7sraNJPKy+Q8L0Sr7kvw8kQy6J7Bo1HqfDA06oJntpBTKNb1Xjv6agvEUKTWqI
	jvf3vkB6gAPQUIbkwab+kN9L78DWt/5zbAGZILvjfyaYaes0yB4W7ZR5p1odzIUYE9lPMvdkIRVir
	LOhxG2Uyc5pmQskSdYGVZH4ANaFEeWfvXofUb/B3sL4LTvRKgPz90//m6kjWoGpYG5LdqKQMVgFxN
	16aapg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYuf-00000000hJu-2CCY;
	Mon, 23 Feb 2026 16:36:01 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYuc-00000000hIh-3EHA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:36:00 +0000
Message-ID: <65ac70d2-72ed-40ee-8e0d-bbaee525f8a1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771864543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+razHazSB6EJhbfIAGNdwccjEdK/vcc1wfb8MmG0YE=;
	b=tmh6wjtIywNxkHKRBJAhS4doKKdeL3a44CN226i+NgqHydHrGgBJsjGIaRXU8YaK+xDYGC
	hM6cad76VXZasfQACGf6WkzThDrAJiZWqEFBPFdKh9xJpVmvjfOfE43jDGsNknHqJML291
	lSrc1losEwMIwdvG5KgiSkjpVJkvbqQ=
Date: Tue, 24 Feb 2026 00:35:30 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 2/6] bpf, x86: Add 64-bit bitops kfuncs
 support for x86_64
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, bpf <bpf@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 X86 ML <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Shuah Khan <shuah@kernel.org>, Peilin Ye <yepeilin@google.com>,
 Luis Gerhorst <luis.gerhorst@fau.de>, Viktor Malik <vmalik@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 kernel-patches-bot@fb.com
References: <20260219142933.13904-1-leon.hwang@linux.dev>
 <20260219142933.13904-3-leon.hwang@linux.dev>
 <CAADnVQLNmQGKf5S5ZNwHYzScYBhnWFmnzLg=5Xxy4SgYKE3EfQ@mail.gmail.com>
 <c6c2ffcf-acdf-4bda-ad82-dc4cc1a9260e@linux.dev>
 <CAADnVQ+iQkvb9-wOchuPrUOneqzx9Rrqto88=R7GUOqih6PhZQ@mail.gmail.com>
 <4c40705a-4e6a-47ea-b420-223318d1ad09@linux.dev>
 <CAADnVQLsJV8OaLCxznwbnxdLVOQ+t=MmAr2O8Y89iPErCvphFQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <CAADnVQLsJV8OaLCxznwbnxdLVOQ+t=MmAr2O8Y89iPErCvphFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_083558_962475_8D2BAF44 
X-CRM114-Status: GOOD (  12.38  )
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



On 2026/2/22 00:51, Alexei Starovoitov wrote:
> On Sat, Feb 21, 2026 at 4:45 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>>

[...]

>>
>> Good idea. But I concern about the "in kernel disasm". Do you mean we
>> will build a disassembler for whitelist kfuncs at starting?
>>
>> I noticed you've mentioned the same direction in "bpf/s390: Implement
>> get_preempt_count()" [1]. So, I added Ilya here to discuss this direction.
> 
> Much better. Keep it human.
> 
> "in kernel disasm" already exists for some architectures
> (at least x86 and arm64) since it's being used by kprobes.
> The ask here is to figure out whether they're usable for such
> insn analysis. x86 disasm is likely capable.
> 

After looking into x86&arm insn decoder, they are able to do insn analysis.

> re:"whitelist kfunc"
> I suspect an additional list is not necessary.
> kf_fastcall is a good enough signal that such kfunc should
> be inlinable.

I thought it was to build a light-weight custom disassembler, which
would only support limited machine codes (whitelist kfunc).

Obviously, I was wrong.

We can reuse the in-kernel insn decoding ability to validate fastcall
function by checking the registers use.

I'll post RFC after finishing poc, on both x86_64 and arm64 of course.

Thanks,
Leon


