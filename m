Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13964C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmVeGUQZGXvZmz6kluUeNyZUNerswSyQ4NQ2DQ3HWRo=; b=3buaCa9bbIG9f86/fxbUVxv2P+
	LfdQ57iNIWxFJhbCO6P/i3UaOjD5KkTxlqVj7ZtNiMNntiLxFBR3PSR63qqwFVLv+xi3vg0obBD0l
	Bpln18byYhtKUCbCwzoeC8A2yh/Pz2OLyXh2yKHAHaEwUdVis8sjnsZ9EBLA2CJATehwyTe907h1J
	r2Vadh+ryRqDMOi6J2OR9vIjzrl4swfkFoVjy4K7fNNASYtVWXKSnpBqymnghaWobfDBhVm3nz2Sf
	nxT3RqIl35gUqmv7TlCILFxrBHLFmAqD9TY3pvNW3xFX/At7M1+o+99j8V1dyWY/V7GDKPLmrcZpY
	qKPDckMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhIY-00000005Y7A-2iF1;
	Tue, 15 Jul 2025 15:10:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfly-00000005DqU-0YVD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1AF75A56F57;
	Tue, 15 Jul 2025 13:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEEEC4CEF1;
	Tue, 15 Jul 2025 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752586360;
	bh=SKALgTAWbYSqaPqfyTvDFdr5s2YmxkBpet4kPaBBqXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZI7SwqgD8TbMTdcjaid36j2VW68WCjsz6IphHoD3L8oj7yvvv8AVD0gXb47xBudX9
	 Pc5lIOST05zZnar4sTA8GcsqOT1JDsnL6BxC/stKQJL/tIwrZMPyNSbLFrq1ZQzNk/
	 AcksIGBQR73ls1IkuW+NHqxXCWT2tqkJS8RocH3HegHVAjZJr6RpHFjIPS++afsXRc
	 OIAdcf/IUjuB3QHTojwD6oJ0tX+m2fDKAn4dlKbu0D8toI79/Oam/t1l6tWJ9LUqD9
	 kuYAWoTjxyYhsu7y8434uE0H1khF6wORrOc60BtaenKWXshOiwxkqAvXPvO1K94W49
	 l+sd2izuEvAug==
Date: Tue, 15 Jul 2025 14:32:33 +0100
From: Will Deacon <will@kernel.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
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
Message-ID: <aHZYcY_9JtK8so3C@willie-the-truck>
References: <20250709-arm64_relax_jit_comp-v1-0-3850fe189092@bootlin.com>
 <20250709-arm64_relax_jit_comp-v1-1-3850fe189092@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709-arm64_relax_jit_comp-v1-1-3850fe189092@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_063242_304710_979109D9 
X-CRM114-Status: GOOD (  20.63  )
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

On Wed, Jul 09, 2025 at 10:36:55AM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> While introducing support for 9+ arguments for tracing programs on
> ARM64, commit 9014cf56f13d ("bpf, arm64: Support up to 12 function
> arguments") has also introduced a constraint preventing BPF trampolines
> from being generated if the target function consumes a struct argument
> passed on stack, because of uncertainties around the exact struct
> location: if the struct has been marked as packed or with a custom
> alignment, this info is not reflected in BTF data, and so generated
> tracing trampolines could read the target function arguments at wrong
> offsets.
> 
> This issue is not specific to ARM64: there has been an attempt (see [1])
> to bring the same constraint to other architectures JIT compilers. But
> discussions following this attempt led to the move of this constraint
> out of the kernel (see [2]): instead of preventing the kernel from
> generating trampolines for those functions consuming structs on stack,
> it is simpler to just make sure that those functions with uncertain
> struct arguments location are not encoded in BTF information, and so
> that one can not even attempt to attach a tracing program to such
> function. The task is then deferred to pahole (see [3]).
> 
> Now that the constraint is handled by pahole, remove it from the arm64
> JIT compiler to keep it simple.
> 
> [1] https://lore.kernel.org/bpf/20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com/
> [2] https://lore.kernel.org/bpf/CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com/
> [3] https://lore.kernel.org/bpf/20250707-btf_skip_structs_on_stack-v3-0-29569e086c12@bootlin.com/
> 
> Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> ---
>  arch/arm64/net/bpf_jit_comp.c | 5 -----
>  1 file changed, 5 deletions(-)

This is a question born more out of ignorance that insight, but how do
we ensure that the version of pahole being used is sufficiently
up-to-date that the in-kernel check is not required?

Will

