Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39129C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 19:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WplOH6reEOyo56HZrQ4jKNXZI+yjUubamsmQNCRUCY=; b=P4ZnQRctYg6KXoq/dqulhDecBl
	ISTYn+e0bZW5HesOGRxpt/OCKOXfWI/9xLA0h8pXWWYTk734dsC3oSVre8hmoQAJ4ehV88jh8Sxih
	mxrqc+fgLs1KynNtaw6ZbbbaUOeB9J8Q2MZJh84affIQ6bKpEweRjWDJQSenot1ZLc9S5Jgtxwhs1
	hR9xqpS8U7fkaII/ielLyraJVysxwJ9nKNJLRC/oOwnfXX9y0lK/hZt9tmjNFuaEJuAXTmzl8whcA
	ZqjDm58BSoUw5s3qae90+wXCqJ/S8N5h8kg114Euyvd8+v/HCOaNBeDIjufo6wHkqwcT/ne+BBRl7
	0VApNviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvgl-00000002prp-3Scf;
	Fri, 02 May 2025 19:04:47 +0000
Received: from mx-rz-2.rrze.uni-erlangen.de ([131.188.11.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvZl-00000002oF8-0wKU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 18:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1746212237; bh=0WplOH6reEOyo56HZrQ4jKNXZI+yjUubamsmQNCRUCY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=n9iwAjy0SCwI/oTEelalFezKHV0RYG0VDpXqybVxfyGwi0IM8vAl35OpIi4W9R5KH
	 vcn9pyiozd6b2WhOhl5ary39qNouueeR7Na7VJHTW7l9wfSyNspiOIwqFAwyqRk/IH
	 raKvFnLjkZ1HjaHlohVzkXJi+Q0inLIuRcCfUiwHL5pK9Mec2rTTHqvR6LXXcB5wG3
	 01IAhKNJP2PAMsz9CcgBjdbmBrZjvYBn7r/1r+0IJo3pDIasBfOYc4edY0F3GXtbmN
	 hzyYyWe+iugeNy/+eCBSyEizxi3ufvcdwqq2q51dZXiHUL2rVbWf0rsA2yqHdNv7mR
	 IPDFxF8RvoSPQ==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zq0XX6cB1zPlkm;
	Fri,  2 May 2025 20:57:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:363c:9000:3afa:e4e0:adc6:326
Received: from localhost (unknown [IPv6:2001:9e8:363c:9000:3afa:e4e0:adc6:326])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1/NAHScjHSrb5WnifYoZ30p9gOLHTIMgjg=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zq0XS4PQKzPkbD;
	Fri,  2 May 2025 20:57:12 +0200 (CEST)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,
  Song Liu <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,
  John Fastabend <john.fastabend@gmail.com>,  KP Singh
 <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao Luo
 <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Puranjay Mohan
 <puranjay@kernel.org>,  Xu Kuohai <xukuohai@huaweicloud.com>,  Catalin
 Marinas <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Hari
 Bathini <hbathini@linux.ibm.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  Mykola
 Lysenko <mykolal@fb.com>,  Shuah Khan <shuah@kernel.org>,  Henriette
 Herzog <henriette.herzog@rub.de>,  Saket Kumar Bhaskar
 <skb99@linux.ibm.com>,  Cupertino Miranda <cupertino.miranda@oracle.com>,
  Jiayuan Chen <mrpre@163.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,  Shung-Hsi Yu
 <shung-hsi.yu@suse.com>,  Daniel Xu <dxu@dxuuu.xyz>,  bpf@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-kselftest@vger.kernel.org,
  Maximilian Ott <ott@cs.fau.de>,  Milan Stephan <milan.stephan@fau.de>
Subject: Re: [PATCH bpf-next v3 08/11] bpf: Fall back to nospec for Spectre v1
In-Reply-To: <CAP01T76kOixPct5cOPHGKubFWSbSS7ztEnZc02v2wWGPOUYRCQ@mail.gmail.com>
	(Kumar Kartikeya Dwivedi's message of "Fri, 2 May 2025 01:55:54 +0200")
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	<20250501073603.1402960-9-luis.gerhorst@fau.de>
	<CAP01T76kOixPct5cOPHGKubFWSbSS7ztEnZc02v2wWGPOUYRCQ@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Fri, 02 May 2025 20:57:11 +0200
Message-ID: <875xiij0xk.fsf@fau.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_115733_703349_091ABD1E 
X-CRM114-Status: GOOD (  38.55  )
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

Kumar Kartikeya Dwivedi <memxor@gmail.com> writes:

> Back when all of this surfaced, compiler folks came up with another
> solution, to rely on Intel's guarantee that conditional moves are not
> predicted.
>
> if (condition) {
>    mask = !condition ? 0UL : ~0UL; // CMOVcc
>    ptr &= mask;
>    x = *ptr;
> }
>
> In case the condition being true in the speculative domain leads to
> problems, the speculative domain will just read from NULL and not leak
> sensitive data.

Yes, that is an alternative approach.

> The assumption is that cost of instrumentation in speculative domain <
> completely stalling it until prior instructions are done using lfence.
> So speculation is still helpful when the branch is not mispredicted.
> Now I imagine it's not fun to do such analysis in the verifier (I've
> tried), but theoretically we could break it down into emitting
> bytecode from the compiler side, and lifting the compiler to do it for
> us, and ensuring the end result produced is sane (by still following
> speculative paths) from the verifier.

> You talk about this in the paper and in the presentation as future work.
> My question is mainly whether you considered implementing this, if
> yes, what made you choose a nospec barrier over something like above?

The primary motivation was cerainly that it's the easiest to implement
with the current verifier design.

I mostly decided not to pursue the "verification-only" approach (and
insert the insn in LLVM) because it would require changes to the eBPF
instruction set.

Other consideration include:

* The approach could potentially improve performance (the compiler could
  for example compute the minimal-cut to reduce the number of fences)
  and simplify the verifier to some extent (no more inserting of insns).

* It could have the downside that non/partially-vulnerable architectures
  can not benefit from improved performance as easily as it is the case
  with the current design.

* The best choice for the instruction-set extension is not clear to me.
  For Spectre v1 USLH [1] would suffice and then one only needs a cmov, so
  that's easy. But this does not cover Spectre v4 (which is currently
  the main source of overhead). It could be 'nospec_vX rY' to tell the
  verifier that a certain register must not be used under speculation
  from a specific variant, or something generic/catch-all like the
  current 'nospec'.

* From a security perspective, LLVM SLH is not as strong as the
  verifier's Spectre v1 mitigation. This is because it does not harden
  secret-dependent control flow as shown in [1] while the Linux verifier
  does (where "secrets" are unreadable/uninitialized registers and
  kernel pointers). It may be the case the this is not a problem for
  eBPF by conincidence because the verifier also restricts
  secret-dependent control flow. Without looking into it in detail I am
  not sure. If one finds that it is a problem, it may also not be
  important to fix if we adopt the verification-only approach you
  mention, or one could change LLVM to extend the mitigation.

> Was it the complexity of realizing this during verification?
> Are there any implications of reading from NULL that would cause problems?

In theory yes, in practice I would assume no and that it works out. I am
not aware of any documents from Intel / ARM that state that accessing
NULL speculatively acts as a speculation barrier (I remember reading
some paper that suggested it practically does, but I can not find it
now). If it does not (portably), a downside would be that the verifier
will have to analyze a lot more speculative instructions.

> Also, did you characterize how much difference it could make?

[1] has SPEC2017 benchmarks for LLVM-/U-SLH and a naive lfence-based
approach (lfence after every branch), for these USLH is about twice as
fast (150%) as the naive fence-based approach (300%). But this is only
for Spectre v1 and the Spectre v4 overhead would have to be added.

Both number are also very high compared to the programs from the
VeriFence paper. There the *combined* overhead for Spectre v1 and v4 was
0% for very small programs and 16%-60% for larger programs. I have since
also measured the overhead for Katran and there it is 100%-150%.

I am currently working on a prototype to reduce the Spectre v4 (and
Spectre v1) overhead and for Katran I was able to lower it to 15%-30% by
using more precise analysis of the speculative execution using a
fence-based approach. Most remaining fence are now still from Spectre v4
(not v1 which would be adressed by SLH) and I hope to eliminate some
more using a SLH-style approach for v4. I will of course also have to
check how this carries over to other programs, but it certainly seems
possible to eliminate almost all fences because there are rarely any
'real' gadgets in non-malicious programs (only false positive one can
not eliminate without reasoning about the cache).

> The drop in SCTP throughput seems to suggest so, since CPU-bound
> computation was moved into the program.
> Otherwise most programs mostly defer to helpers for heavy lifting.
> Not that it was as fast as a helper would be, even without nospec, but still.
>
> Also a bit sad we don't split the program into BBs already, which
> could help reduce your mitigation's cost + plus also reduce cost of
> instruction patching (unrelated).

In the prototype I mention I also tried tackling that. However, at least
for Katran it was uncommon to have more than one v1-induced fence per
basic block. Therefore it might not be worth it.

> Anyway, all that said, this is valuable stuff, so I was just curious.

[1] https://www.usenix.org/system/files/usenixsecurity23-zhang-zhiyuan-slh.pdf
    ("Ultimate SLH: Taking Speculative Load Hardening to the Next Level
    - Section 5.1: Exploiting Secret-Dependent Control Flow")

