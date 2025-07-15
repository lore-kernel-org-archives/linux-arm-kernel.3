Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68038C83F36
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLgdceW61DZdEhiA6MbfQtpa0njBh+wwfsGO/QOG3uo=; b=1mAzd+RY6t9zFPm33rp4o5bAJL
	s+CiRSdHGloOnOmaXzxP2eMvt8jDWKUVVf2Zu/5U+g+N6zQHcoAI/8tO13AasVz7bDKYinNHCnPTF
	6uUWkbgjyJFwvxsXXNVHZo9/8GpM1wgyQLXTgZMPkgwtUbMsNz8Rxw7knGR8cj6kk7SH0Zan8bxFt
	NYEuDvTH5QYpupQptczJXPf0lFiGPlulLYsQY2LoLelu81/KWD4IQ7mCDoF3SCip6NDX5h0SSVxFW
	CX9GQJCQnneChXUWiemVuzy0NErKwYGLyXbB4I3hey+leQJ/PK5EgLjwHBBvwAJ+3S2Nnfet+mhMd
	X4tMq78w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6v-00000005xuk-1ImN;
	Tue, 15 Jul 2025 19:14:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubggs-00000005Nhj-2ftA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:31:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F063E5C55B2;
	Tue, 15 Jul 2025 14:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441E9C4CEF4;
	Tue, 15 Jul 2025 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752589889;
	bh=o6fjSBuD3MkNah5lZdAX/PPlNa0a+5q/uZrvW1HtmUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUjtLAfe1YB4nzGaZVRSAmE0eRFV3Syh4ljvj87kbr+p66u6CnYRfcPBASM86tVFS
	 TfYVKeaSem01kTkoz03ibb6YGUbuaW4r+Xd7I3+Ial+CDNR3M3zjABD+gWDvDA8l55
	 7ESr1Sh4LfDxsU28e44GLHdrasU/ji+nKgV7K3dElUl7C5FKEcl1L3bIaXxjk1hJCQ
	 A9HdbABolc7poqU6y6EWBEZjsM+4ommaMLdlEXsbMSbMPs0FII+sCvJRM8KcGp3EqB
	 e5zaJbL31SrR1HrqIaznwXJdFwLj+iogDb+gCZk06X04bMeGl9krLaYKmoPU+b8203
	 DdFMyPKH78kmQ==
Date: Tue, 15 Jul 2025 15:31:21 +0100
From: Will Deacon <will@kernel.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	ebpf@linuxfoundation.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] bpf, arm64: remove structs on stack constraint
Message-ID: <aHZmOVpcoyTvGY1u@willie-the-truck>
References: <20250709-arm64_relax_jit_comp-v1-0-3850fe189092@bootlin.com>
 <20250709-arm64_relax_jit_comp-v1-1-3850fe189092@bootlin.com>
 <aHZYcY_9JtK8so3C@willie-the-truck>
 <DBCONB7XHN7E.2UQMMG6RICMFY@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBCONB7XHN7E.2UQMMG6RICMFY@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_073130_823223_DEBF58D9 
X-CRM114-Status: GOOD (  33.22  )
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

On Tue, Jul 15, 2025 at 04:02:25PM +0200, Alexis Lothoré wrote:
> On Tue Jul 15, 2025 at 3:32 PM CEST, Will Deacon wrote:
> > On Wed, Jul 09, 2025 at 10:36:55AM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> >> While introducing support for 9+ arguments for tracing programs on
> >> ARM64, commit 9014cf56f13d ("bpf, arm64: Support up to 12 function
> >> arguments") has also introduced a constraint preventing BPF trampolines
> >> from being generated if the target function consumes a struct argument
> >> passed on stack, because of uncertainties around the exact struct
> >> location: if the struct has been marked as packed or with a custom
> >> alignment, this info is not reflected in BTF data, and so generated
> >> tracing trampolines could read the target function arguments at wrong
> >> offsets.
> >> 
> >> This issue is not specific to ARM64: there has been an attempt (see [1])
> >> to bring the same constraint to other architectures JIT compilers. But
> >> discussions following this attempt led to the move of this constraint
> >> out of the kernel (see [2]): instead of preventing the kernel from
> >> generating trampolines for those functions consuming structs on stack,
> >> it is simpler to just make sure that those functions with uncertain
> >> struct arguments location are not encoded in BTF information, and so
> >> that one can not even attempt to attach a tracing program to such
> >> function. The task is then deferred to pahole (see [3]).
> >> 
> >> Now that the constraint is handled by pahole, remove it from the arm64
> >> JIT compiler to keep it simple.
> >> 
> >> [1] https://lore.kernel.org/bpf/20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com/
> >> [2] https://lore.kernel.org/bpf/CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com/
> >> [3] https://lore.kernel.org/bpf/20250707-btf_skip_structs_on_stack-v3-0-29569e086c12@bootlin.com/
> >> 
> >> Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> >> ---
> >>  arch/arm64/net/bpf_jit_comp.c | 5 -----
> >>  1 file changed, 5 deletions(-)
> >
> > This is a question born more out of ignorance that insight, but how do
> > we ensure that the version of pahole being used is sufficiently
> > up-to-date that the in-kernel check is not required?
> 
> Based on earlier discussions, I am not convinced it is worth maintaining
> the check depending on the pahole version used in BTF. Other architectures
> exposing a JIT compiler don't have the in-kernel check and so are already
> exposed to this very specific case, but discussions around my attempt to
> enforce the check on other JIT comp showed that the rarity of this case do
> not justify protecting it on kernel side (see [1]).

I can understand why doing this in pahole rather than in each individual
JIT is preferable, but I don't think there's any harm leaving the
existing two line check in arm64 as long as older versions of pahole
might be used, is there? I wouldn't say that removing it really
simplifies the JIT compiler when you consider the rest of the
implementation.

Of course, once the kernel requires a version of pahole recent enough
to contain [3], we should drop the check in the JIT compiler as the
one in pahole looks like it's more selective about the functions it
rejects.

Will

