Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A2DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 00:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpqcdB5HKLcvCClWag1YAOoCR5dOaM4sia0jSQ91WTc=; b=khRx+G7z+f3uks+jqemwbtxu4L
	5lzXJs1/0bTvL2r6IbqOAvshSJ4n5W0b/dterbIapn7r6vxR0G5rFUZhPAde2waVXe0XqUk4X56fq
	8dnIjl7On7px7UrhAE90t26cpQGulwIZIbfr5QiKVAtGvzHkA9bKnyW/oOjyfVK34fSrdc+pmS8rn
	NJGS4T2v1Ox+WFm3PZ2yH3xmQD2Ar6Zk8gxzvi50VfMpYBEo0HdkfQRgtc/4XOQnEyK/uFLAx2+Fh
	K0jM1430utngtuZy7MNlKbqEDySDJrQWuYsnve4N2yRVv0tpqWKGtDCM+3uGDqK6eHaj4OyTUj8Tm
	u77rOwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeEh-00000000PA4-3mU7;
	Fri, 02 May 2025 00:26:39 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdlZ-00000000JZF-1dbz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 23:56:34 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-ac29fd22163so247246966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 16:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746143791; x=1746748591; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpqcdB5HKLcvCClWag1YAOoCR5dOaM4sia0jSQ91WTc=;
        b=AbTwkNtrRDtnGVYir9k58jWGHgcLi5J3I0rqdaYMEVD6Aw3hQD42Jt2F/d5P0u1lwS
         4OuNd2RXC3yJ84Kw9aw6OevsnMbG2hRVl1f3o9ZMmEwZs1TA0Dqvxl+kFD1evUNMdaZn
         I7ZnJC0VJhW2K7uCXTp+p2qD0ZDxQDtDVt+2DNADxbXBC6Kiop+zYhiC7i1y1m2K4nCI
         lPkbyDCtMntFVAPr8B340C4rARvNT4u0rnhNA7i469rddLx4Q9D4uotBDp4Ta3rOyMW5
         UzE7QrcSGGyf3n9WE5HV+0aoozjaVfeeQ3bDhDuvQbTVktF7/YwfovLGevof/RqZZpIc
         UBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746143791; x=1746748591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpqcdB5HKLcvCClWag1YAOoCR5dOaM4sia0jSQ91WTc=;
        b=GEJG6at168JuI0HcUvQSBTDAenDTkPuX0S1PHTNEp3owu+oFwGpQK/anE7jqtyohdm
         1zzwogicl/5wgBdDOufGCZKJUi2DfXsuj0PmgXSVcGcBmsiwQpvnGMRFFLyBszzoXRyo
         o2KcIqFmgIpMjst5pIhahQm9guOsU1z4adfyinWF6psEMmft7GvAN2oJzhragz5a2fCn
         5daIgPS4qW96WFzzjnED0d/Mktu9utXcJSa4Y0bC+3lV+/bAoxnMoK/NJxEXDcTM/whH
         VHmNyJBWnFzXqqSVD0954XgQemLrkMLQFBMxVpEz69ew7qwrtSuH1Qquns0jBmKdjUpD
         DYYw==
X-Forwarded-Encrypted: i=1; AJvYcCU3vLuLWjffMN7aYTiSql5uZbboo+GAGtMzGleF2GYez26DWuL8uGGe0DFQctxmLpfU30E4NsL8MHGiJuc07TR6@lists.infradead.org
X-Gm-Message-State: AOJu0YwjXUT10bDUe0m0CBby08bGLZic96IVVO4SdNGIkyl3rBlLfSQt
	BqYLbvxrWXIfCcq67Hy54+3ZiLnE2pT9pp4DPaRl75P+LO/xLUu6gYZhImd5V8IqnmmyyG4NFsl
	JR/Saqgpoc5HaWdyT5w83xP0TA7I=
X-Gm-Gg: ASbGncsNkIgy/fNY3ji9G4lBnuTCXlFyidsa26b6mIL7PQaunATYeA1QjtdzS11YT46
	/aKvqgEzlwtiwznHx6mPq5SP5eEBTDDNJgSIG5rCFOLZZH6jTTf+Pjzl+F5hnKGcsol/9VWFw3T
	uL+EXSt7UrUqlfW3ayR83fvx1P/VvgQGkmlSaLNPjG+vHP1zdit4c5MQ==
X-Google-Smtp-Source: AGHT+IE8rFYVy5AEV69cNgB7LjR9j9JDMd63wN3Vtcz9MvmQSCvUFlM2VwRHa8i1gy3jD9Ei18VDPKGcCjJ/nJCaAQ0=
X-Received: by 2002:a17:907:a587:b0:ac7:3912:5ea5 with SMTP id
 a640c23a62f3a-ad17af80715mr93822666b.58.1746143791303; Thu, 01 May 2025
 16:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-9-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-9-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 01:55:54 +0200
X-Gm-Features: ATxdqUGuoTBKs9l0zhe3Yzsic4wyHg46bSXEHmrxNhmAcDg2gPFfcMFHEjWXEc4
Message-ID: <CAP01T76kOixPct5cOPHGKubFWSbSS7ztEnZc02v2wWGPOUYRCQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 08/11] bpf: Fall back to nospec for Spectre v1
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_165633_437897_B80D68BE 
X-CRM114-Status: GOOD (  49.29  )
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

On Thu, 1 May 2025 at 10:00, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This implements the core of the series and causes the verifier to fall
> back to mitigating Spectre v1 using speculation barriers. The approach
> was presented at LPC'24 [1] and RAID'24 [2].
>
> If we find any forbidden behavior on a speculative path, we insert a
> nospec (e.g., lfence speculation barrier on x86) before the instruction
> and stop verifying the path. While verifying a speculative path, we can
> furthermore stop verification of that path whenever we encounter a
> nospec instruction.
>
> A minimal example program would look as follows:
>
>         A = true
>         B = true
>         if A goto e
>         f()
>         if B goto e
>         unsafe()
> e:      exit
>
> There are the following speculative and non-speculative paths
> (`cur->speculative` and `speculative` referring to the value of the
> push_stack() parameters):
>
> - A = true
> - B = true
> - if A goto e
>   - A && !cur->speculative && !speculative
>     - exit
>   - !A && !cur->speculative && speculative
>     - f()
>     - if B goto e
>       - B && cur->speculative && !speculative
>         - exit
>       - !B && cur->speculative && speculative
>         - unsafe()
>
> If f() contains any unsafe behavior under Spectre v1 and the unsafe
> behavior matches `state->speculative &&
> error_recoverable_with_nospec(err)`, do_check() will now add a nospec
> before f() instead of rejecting the program:
>
>         A = true
>         B = true
>         if A goto e
>         nospec
>         f()
>         if B goto e
>         unsafe()
> e:      exit
>
> Alternatively, the algorithm also takes advantage of nospec instructions
> inserted for other reasons (e.g., Spectre v4). Taking the program above
> as an example, speculative path exploration can stop before f() if a
> nospec was inserted there because of Spectre v4 sanitization.
>
> In this example, all instructions after the nospec are dead code (and
> with the nospec they are also dead code speculatively).
>
> On x86_64, this depends on the following property of lfence [3]:
>
>         An LFENCE instruction or a serializing instruction will ensure that no
>         later instructions execute, even speculatively, until all prior
>         instructions complete locally. [...] Inserting an LFENCE instruction
>         after a bounds check prevents later operations from executing before
>         the bound check completes.
>
> Regarding the example, this implies that `if B goto e` will not execute
> before `if A goto e` completes. Once `if A goto e` completes, the CPU
> should find that the speculation was wrong and continue with `exit`.
>
> If there is any other path that leads to `if B goto e` (and therefore
> `unsafe()`) without going through `if A goto e`, then a nospec will
> still be needed there. However, this patch assumes this other path will
> be explored separately and therefore be discovered by the verifier even
> if the exploration discussed here stops at the nospec.
>
> This patch furthermore has the unfortunate consequence that Spectre v1
> mitigations now only support architectures which implement BPF_NOSPEC.
> Before this commit, Spectre v1 mitigations prevented exploits by
> rejecting the programs on all architectures. Because some JITs do not
> implement BPF_NOSPEC, this patch therefore may regress unpriv BPF's
> security to a limited extent:
>
> * The regression is limited to systems vulnerable to Spectre v1, have
>   unprivileged BPF enabled, and do NOT emit insns for BPF_NOSPEC. The
>   latter is not the case for x86 64- and 32-bit, arm64, and powerpc
>   64-bit and they are therefore not affected by the regression.
>   According to commit a6f6a95f2580 ("LoongArch, bpf: Fix jit to skip
>   speculation barrier opcode"), LoongArch is not vulnerable to Spectre
>   v1 and therefore also not affected by the regression.
>
> * To the best of my knowledge this regression may therefore only affect
>   MIPS. This is deemed acceptable because unpriv BPF is still disabled
>   there by default. As stated in a previous commit, BPF_NOSPEC could be
>   implemented for MIPS based on GCC's speculation_barrier
>   implementation.
>
> * It is unclear which other architectures (besides x86 64- and 32-bit,
>   ARM64, PowerPC 64-bit, LoongArch, and MIPS) supported by the kernel
>   are vulnerable to Spectre v1. Also, it is not clear if barriers are
>   available on these architectures. Implementing BPF_NOSPEC on these
>   architectures therefore is non-trivial. Searching GCC and the kernel
>   for speculation barrier implementations for these architectures
>   yielded no result.
>
> * If any of those regressed systems is also vulnerable to Spectre v4,
>   the system was already vulnerable to Spectre v4 attacks based on
>   unpriv BPF before this patch and the impact is therefore further
>   limited.
>
> As an alternative to regressing security, one could still reject
> programs if the architecture does not emit BPF_NOSPEC (e.g., by removing
> the empty BPF_NOSPEC-case from all JITs except for LoongArch where it
> appears justified). However, this will cause rejections on these archs
> that are likely unfounded in the vast majority of cases.
>
> In the tests, some are now successful where we previously had a
> false-positive (i.e., rejection). Change them to reflect where the
> nospec should be inserted (using __xlated_unpriv) and modify the error
> message if the nospec is able to mitigate a problem that previously
> shadowed another problem (in that case __xlated_unpriv does not work,
> therefore just add a comment).
>
> Define SPEC_V1 to avoid duplicating this ifdef whenever we check for
> nospec insns using __xlated_unpriv, define it here once. This also
> improves readability. PowerPC can probably also be added here. However,
> omit it for now because the BPF CI currently does not include a test.
>
> Briefly went through all the occurrences of EPERM, EINVAL, and EACCESS
> in the verifier in order to validate that catching them like this makes
> sense.
>
> [1] https://lpc.events/event/18/contributions/1954/ ("Mitigating
>     Spectre-PHT using Speculation Barriers in Linux eBPF")
> [2] https://arxiv.org/pdf/2405.00078 ("VeriFence: Lightweight and
>     Precise Spectre Defenses for Untrusted Linux Kernel Extensions")
> [3] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/runtime-speculative-side-channel-mitigations.html
>     ("Managed Runtime Speculative Execution Side Channel Mitigations")
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

The patches from here on look good in general, I will ack after taking
another look later.

I had a more high-level question though.
Back when all of this surfaced, compiler folks came up with another
solution, to rely on Intel's guarantee that conditional moves are not
predicted.

if (condition) {
   mask = !condition ? 0UL : ~0UL; // CMOVcc
   ptr &= mask;
   x = *ptr;
}

In case the condition being true in the speculative domain leads to
problems, the speculative domain will just read from NULL and not leak
sensitive data.
The assumption is that cost of instrumentation in speculative domain <
completely stalling it until prior instructions are done using lfence.
So speculation is still helpful when the branch is not mispredicted.
Now I imagine it's not fun to do such analysis in the verifier (I've
tried), but theoretically we could break it down into emitting
bytecode from the compiler side, and lifting the compiler to do it for
us, and ensuring the end result produced is sane (by still following
speculative paths) from the verifier.

You talk about this in the paper and in the presentation as future work.
My question is mainly whether you considered implementing this, if
yes, what made you choose a nospec barrier over something like above?
Was it the complexity of realizing this during verification?
Are there any implications of reading from NULL that would cause problems?
Also, did you characterize how much difference it could make?
The drop in SCTP throughput seems to suggest so, since CPU-bound
computation was moved into the program.
Otherwise most programs mostly defer to helpers for heavy lifting.
Not that it was as fast as a helper would be, even without nospec, but still.

Also a bit sad we don't split the program into BBs already, which
could help reduce your mitigation's cost + plus also reduce cost of
instruction patching (unrelated).

Anyway, all that said, this is valuable stuff, so I was just curious.

