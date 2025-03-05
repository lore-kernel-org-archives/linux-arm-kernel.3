Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA8AC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blf/TiOtbprpDLJNtfD3y4oyxoUcu4XFE3PfFSXAZMQ=; b=irf9QRQHFJ4NRsJM9goXivc19h
	Zu+esKzc/rmJgYamJp7467XZSszOhoheiK4keqPu8gQXNGInTZLKd+GBt4Nu8S90toWjWtNHTNFI8
	MdOsR6n6wH2VcyZg0FDEul36q0TkU/f1KR74LnIUaCYKR9Of/oMxXqxPOlGSu9Lvguno1I4gEsCEb
	ycD66rL1rqXghdHi2dfxVH106rgfP6HLzrGu9t4jl2AhLzw4jT9jCPdKAcmM4fS/fLVmogHz9TbYg
	W9NwIpiW9L4lSdwc16BmIWQgkrGPexmdWHpEoKqHqX44XN9/KLaPLJFNy1TpguCPhJOQV4g+QBNMG
	fDL31GWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkF2-00000007OJg-0GLr;
	Wed, 05 Mar 2025 08:36:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk9j-00000007Nab-1PGl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 08:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=blf/TiOtbprpDLJNtfD3y4oyxoUcu4XFE3PfFSXAZMQ=; b=iBm0pEyokhGOigVo9R4bZopJih
	O+MVpjmdXhcdqB5yZ0ILGTOtoN0yHfEr0RlwJiav0OtUujgvTWioyg1kjF6EwNN1ZewYwVYiy0h18
	GKcmbSYAOWuKQTOX/peqXYQ08dG6OzK8Dr4jkHsibiJnxNi7cRKEYJsDWs7IlJZvIO/OIbexBNxvS
	IsOjfivWaboSGxVzM/oF3kGgGDeH4ASDx0cHNeLGMhPaX9xdPT9sUYFj3FF8Dm9EL3jc1iCT5NTM7
	+EHj/F7Xs2CmuYx874oogOgoX7ZVt2zYjMm0n4A9bknqs3V1NmAr6y7/JS3Geez0uR+nZ4bpXQquw
	JPJcULgA==;
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk9f-00000000Q8Z-3y4b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:31:05 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5258Tkoa3044543
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 5 Mar 2025 00:29:47 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5258Tkoa3044543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741163391;
	bh=blf/TiOtbprpDLJNtfD3y4oyxoUcu4XFE3PfFSXAZMQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=LeiaTm3OcHAce14jA4D/ZHWqu+UtBIS5XG4gqHwgcoOzbl/wq6Da6xdHQoGGKCoxT
	 T3qpHmrxIpG0bcDA6I70X/yc4/N2vxII+WdUGNdZqtRjvI+DwoW4wIIWyunlZACq+G
	 9zquu1aXuKa6nsC3gKEAsy4i71ZUY+DTROhGW5AYNx4DreuQOIzGdPJNEiIRvbGpuV
	 C+3uxcYgR6B4fnB9aO/wFsSNYbYXIadCnKQOFmN9g3/aC7I+zXDFaKe/7holtL9Fw4
	 4+ZYAI0WXO0BHMrZZISHmKY8LvwpM+KHvgo+hRJpKGyYlaRf75sjCoxIsvE+fa85Cy
	 VPWyvOwVfENvg==
Date: Wed, 05 Mar 2025 00:29:45 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Menglong Dong <menglong8.dong@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>
CC: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
        eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org,
        davem@davemloft.net, dsahern@kernel.org,
        mathieu.desnoyers@efficios.com, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        samitolvanen@google.com, kees@kernel.org, dongml2@chinatelecom.cn,
        akpm@linux-foundation.org, riel@surriel.com, rppt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
        netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
User-Agent: K-9 Mail for Android
In-Reply-To: <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn> <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net> <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com> <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net> <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com> <20250304094220.GC11590@noisy.programming.kicks-ass.net> <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com> <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
Message-ID: <694E52E0-C9E5-49D2-A677-09A5EE442590@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_083104_493716_D1D0B106 
X-CRM114-Status: GOOD (  26.43  )
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

On March 4, 2025 5:19:09 PM PST, Menglong Dong <menglong8=2Edong@gmail=2Eco=
m> wrote:
>On Tue, Mar 4, 2025 at 10:53=E2=80=AFPM H=2E Peter Anvin <hpa@zytor=2Ecom=
> wrote:
>>
>> On March 4, 2025 1:42:20 AM PST, Peter Zijlstra <peterz@infradead=2Eorg=
> wrote:
>> >On Tue, Mar 04, 2025 at 03:47:45PM +0800, Menglong Dong wrote:
>> >> We don't have to select FUNCTION_ALIGNMENT_32B, so the
>> >> worst case is to increase ~2=2E2%=2E
>> >>
>> >> What do you think?
>> >
>> >Well, since I don't understand what you need this for at all, I'm firm=
ly
>> >on the side of not doing this=2E
>> >
>> >What actual problem is being solved with this meta data nonsense? Why =
is
>> >it worth blowing up our I$ footprint over=2E
>> >
>> >Also note, that if you're going to be explaining this, start from
>> >scratch, as I have absolutely 0 clues about BPF and such=2E
>>
>> I would appreciate such information as well=2E The idea seems dubious o=
n the surface=2E
>
>Ok, let me explain it from the beginning=2E (My English is not good,
>but I'll try to describe it as clear as possible :/)
>
>Many BPF program types need to depend on the BPF trampoline,
>such as BPF_PROG_TYPE_TRACING, BPF_PROG_TYPE_EXT,
>BPF_PROG_TYPE_LSM, etc=2E BPF trampoline is a bridge between
>the kernel (or bpf) function and BPF program, and it acts just like the
>trampoline that ftrace uses=2E
>
>Generally speaking, it is used to hook a function, just like what ftrace
>do:
>
>foo:
>    endbr
>    nop5  -->  call trampoline_foo
>    xxxx
>
>In short, the trampoline_foo can be this:
>
>trampoline_foo:
>    prepare a array and store the args of foo to the array
>    call fentry_bpf1
>    call fentry_bpf2
>    =2E=2E=2E=2E=2E=2E
>    call foo+4 (origin call)
>    save the return value of foo
>    call fexit_bpf1 (this bpf can get the return value of foo)
>    call fexit_bpf2
>    =2E=2E=2E=2E=2E=2E=2E
>    return to the caller of foo
>
>We can see that the trampoline_foo can be only used for
>the function foo, as different kernel function can be attached
>different BPF programs, and have different argument count,
>etc=2E Therefore, we have to create 1000 BPF trampolines if
>we want to attach a BPF program to 1000 kernel functions=2E
>
>The creation of the BPF trampoline is expensive=2E According to
>my testing, It will spend more than 1 second to create 100 bpf
>trampoline=2E What's more, it consumes more memory=2E
>
>If we have the per-function metadata supporting, then we can
>create a global BPF trampoline, like this:
>
>trampoline_global:
>    prepare a array and store the args of foo to the array
>    get the metadata by the ip
>    call metadata=2Efentry_bpf1
>    call metadata=2Efentry_bpf2
>    =2E=2E=2E=2E
>    call foo+4 (origin call)
>    save the return value of foo
>    call metadata=2Efexit_bpf1 (this bpf can get the return value of foo)
>    call metadata=2Efexit_bpf2
>    =2E=2E=2E=2E=2E=2E=2E
>    return to the caller of foo
>
>(The metadata holds more information for the global trampoline than
>I described=2E)
>
>Then, we don't need to create a trampoline for every kernel function
>anymore=2E
>
>Another beneficiary can be ftrace=2E For now, all the kernel functions th=
at
>are enabled by dynamic ftrace will be added to a filter hash if there are
>more than one callbacks=2E And hash lookup will happen when the traced
>functions are called, which has an impact on the performance, see
>__ftrace_ops_list_func() -> ftrace_ops_test()=2E With the per-function
>metadata supporting, we can store the information that if the callback is
>enabled on the kernel function to the metadata, which can make the perfor=
mance
>much better=2E
>
>The per-function metadata storage is a basic function, and I think there
>may be other functions that can use it for better performance in the feat=
ure
>too=2E
>
>(Hope that I'm describing it clearly :/)
>
>Thanks!
>Menglong Dong
>

This is way too cursory=2E For one thing, you need to start by explaining =
why you are asking to put this *inline* with the code, which is something t=
hat normally would be avoided at all cost=2E

