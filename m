Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A50DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 22:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7Mfr+YCIEUC+WGMETL1yHxE2lGiThA8SMe4ul3SumM=; b=c8/1U1TzPXQESKoZL2m8lwtFTz
	3RhCgGtyxtWQwIpnP7zkEnSLGXAFRfg25+quuGUHwImbAsa78UMgzQSeNgGuu2LMCwrnqjU/QijmO
	E1pJEtU6NVtLWZmGF1p2URtwCRXELHBcqm9253Bn5tqF4XqLJ7cYj8N+ih1ouJCGwTl9TtB9q8yxo
	LGvpMp81wRs9bDk/0dOgHG4gtkHfF+zcKtdoHNsYZ+PrR77KWm6JsMgv0CCAUI9LaRZ26qyYCBkWd
	nnI+bW6OmMx2h9b0exJ2nuU4rTFe+G2fOfgZacXvWzCwwgWyYzW8g0kB0lvSZRs0WeLeoJd5iSHFP
	sjd/4+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcDY-0000000HWRU-2Wt5;
	Thu, 01 May 2025 22:17:20 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcBd-0000000HVZd-1j9a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 22:15:22 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so2165523a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 15:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746137720; x=1746742520; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Mfr+YCIEUC+WGMETL1yHxE2lGiThA8SMe4ul3SumM=;
        b=gKIiSwrY0Ty95hyQySrv19YzyLSLKrSoS3HI/WlFpg6HqF/74K2MmZehgptwX8RX3f
         CNfCpM0GzH0wPfYYrZJIbE+PdnGonYzRL4GsqMwLWhIPUj8lOyxvNEKFf+eRiCbnTQCO
         /LRQnGR94O3/augDx/4BcXQYDW70BAwgUhFzhNog/FHoyuggZfsUXiCCw9gNhHnfih5Q
         3huQiQjByHvTdNWJMG10ar4q7J5ATRfoDSEPW+s+U/yFPU6MOo5sfqkIrFypr4tgT3p9
         c89gdt/OOEnonYZ9Max8pLAl0PGgUBnMqntW7js9AWDlkPab/LQJYTZuZZCaXhxtvMNA
         ikHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746137720; x=1746742520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7Mfr+YCIEUC+WGMETL1yHxE2lGiThA8SMe4ul3SumM=;
        b=lBTLIEDcYIA94nzjnIoKtt2GHuDQYKByznC52v+W5DoWs9e+ktaQ/aRiEsZEp+qli5
         zz2ZlY/wMgxyQ+84leycZPEo2sF9XnxzfwLcpTi6a+1iF+7ApfxuvxWXTsumvHxH63L9
         3wcWahEDFDgAH9R0kscLQiMDYQlMUN6vX2kwsau7NR0jSMy/l7jowMR9Qg20vxXFEwz/
         GH/azC4aQ2FnUK2BAHPpzeK2OwuIQBqwDaLTWybs+AYJpyue99Jx1yPPZODO3ixwND8D
         ehsufr9g70GkdRcHA2AABTUUWI4Tp2QITNDWKcIwcy2apFCDye7IxQmjLFmibUDCzG3m
         DXkw==
X-Forwarded-Encrypted: i=1; AJvYcCUv+P6miqio2IR+nIOQwUV9ZkAPtwJxMRjZhtzqGNY0yy61wXdSdJ4a9nIYmBbggEzz5J/xo5W+dufZ2eZC8KWB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4QnQZv3LSsxgi2YzxB6j38axJM4q/jSvcNp7EG4BIezibLcPf
	0mD9r6QJUqnb8zLPdahYlwgFlpFbrIM0H23QtOydIabk8R9xbV+3uchV9efJNjh89guXjG+D18K
	HwF2Fh0qSws+EphpDf5E+kVXMn58=
X-Gm-Gg: ASbGncvXbQRWY33YjTA23WHrY6VP6i7YWKfjiuwgfSSGKTUHNdzW8O3fTZYqmgMZ3P3
	+y/GL12ECO0z8vSMb2ZxmBl9L+WmRoGG98+nFlG2ENIGtQgCZhlcIa0LLxoegBu72X0QaVRMTkx
	zG19x88vjgBSpqGmbAjhJOPaYvD5Gnm1mZ6f+SkxtNEaQ=
X-Google-Smtp-Source: AGHT+IHxMI99F+IAtZWxOMYa1RyucSD8miaYHECSOpW4gS3Z55ThRLvG0fNtcGLqM04BGbFYK8mK+bgTTvgVJVDex7k=
X-Received: by 2002:a05:6402:3591:b0:5f5:7c7e:40e1 with SMTP id
 4fb4d7f45d1cf-5fa788a2855mr314784a12.24.1746137719499; Thu, 01 May 2025
 15:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-6-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-6-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 00:14:43 +0200
X-Gm-Features: ATxdqUHQc0v79awdKG4uwMc53xWSprS6fNByWA3pwGc9veJx_oqCH0vQZ7i8uF0
Message-ID: <CAP01T77v0vdKiqQSOk3X3t2R3xG97x13fXWE8QKF=7zX-8c_PA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 05/11] bpf, arm64, powerpc: Add bpf_jit_bypass_spec_v1/v4()
To: Luis Gerhorst <luis.gerhorst@fau.de>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Naveen N Rao <naveen@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
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
X-CRM114-CacheID: sfid-20250501_151521_454432_C2672860 
X-CRM114-Status: GOOD (  26.05  )
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

On Thu, 1 May 2025 at 09:51, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> JITs can set bpf_jit_bypass_spec_v1/v4() if they want the verifier to
> skip analysis/patching for the respective vulnerability. For v4, this
> will reduce the number of barriers the verifier inserts. For v1, it
> allows more programs to be accepted.
>
> The primary motivation for this is to not regress unpriv BPF's
> performance on ARM64 in a future commit where BPF_NOSPEC is also used
> against Spectre v1.
>
> This has the user-visible change that v1-induced rejections on
> non-vulnerable PowerPC CPUs are avoided.
>
> For now, this does not change the semantics of BPF_NOSPEC. It is still a
> v4-only barrier and must not be implemented if bypass_spec_v4 is always
> true for the arch. Changing it to a v1 AND v4-barrier is done in a
> future commit.
>
> As an alternative to bypass_spec_v1/v4, one could introduce NOSPEC_V1
> AND NOSPEC_V4 instructions and allow backends to skip their lowering as
> suggested by commit f5e81d111750 ("bpf: Introduce BPF nospec instruction
> for mitigating Spectre v4"). Adding bpf_jit_bypass_spec_v1/v4() was
> found to be preferable for the following reason:
>
> * bypass_spec_v1/v4 benefits non-vulnerable CPUs: Always performing the
>   same analysis (not taking into account whether the current CPU is
>   vulnerable), needlessly restricts users of CPUs that are not
>   vulnerable. The only use case for this would be portability-testing,
>   but this can later be added easily when needed by allowing users to
>   force bypass_spec_v1/v4 to false.
>
> * Portability is still acceptable: Directly disabling the analysis
>   instead of skipping the lowering of BPF_NOSPEC(_V1/V4) might allow
>   programs on non-vulnerable CPUs to be accepted while the program will
>   be rejected on vulnerable CPUs. With the fallback to speculation
>   barriers for Spectre v1 implemented in a future commit, this will only
>   affect programs that do variable stack-accesses or are very complex.
>
> For PowerPC, the SEC_FTR checking in bpf_jit_bypass_spec_v4() is based
> on the check that was previously located in the BPF_NOSPEC case.
>
> For LoongArch, it would likely be safe to set both
> bpf_jit_bypass_spec_v1() and _v4() according to
> commit a6f6a95f2580 ("LoongArch, bpf: Fix jit to skip speculation
> barrier opcode"). This is omitted here as I am unable to do any testing
> for LoongArch.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Cc: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---

I think this and the next patch should have acks from arm and powerpc experts.

