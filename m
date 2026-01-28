Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADE2D3F07A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRay3Vursv60IOvZlH+eNockW+N8+jbMH24O+Il/+jY=; b=J4+CDKH3NdqO4BFxs9GyKuYgg3
	E0gP0tV5e8KZ2pCetE8iFdv8/9SVsLakP7a92G41NjogCFUuPIUcRjShYrK9AEPdC2AqcH+xH8916
	e0njLNSMMKTidPKkn0nzFjKcfllyl2BteQWYlbWlEH790AD25u11Q2E1O8SwNeoP1fTUJa1J75tHi
	iyzIOYq0H8Y2qEF4Ukvk/lP0KUfxSBER2321iHyzIt1RBpquJmziuSCk7REt0ebE3k49EXLIoQs2z
	U4bJrt7YQUyj6qnmA01KRiLqMORZfv8wUs6RODmL0GQer5bWR1gMHvieOSQN+LMGUYFWYim4GoXNO
	kyHkgn2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7QL-0000000GH61-42JW;
	Wed, 28 Jan 2026 15:25:41 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7QJ-0000000GH5Q-15VX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:25:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-823210d1d8eso2725269b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 07:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769613938; x=1770218738; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRay3Vursv60IOvZlH+eNockW+N8+jbMH24O+Il/+jY=;
        b=mE3M0PkorzmbOqApuPU1GuboLpCfKTVtIMgzzDJwtEy46ePjc/uLakvW3pEo1J49U6
         j5RoPgxMX/wvcpQB8Z+RFzIhcOUlrGedqhzsmxLTCwBuQWCnbvzbta7ltPpg8shsCpx0
         k6Z0/K3yldW5JAF/vhzkrAP/MJQ7TyAma43R8U9AFBft8hydNU1ppQLkzJsknBchujXF
         CMDBXytZA0dkNA+vXJOrs3p5RQcCpI4gk9N7vXOYKa5+UFXpcl7Cd8+et4V+g1T4Sd81
         YG/StKt/F+OBsbUVTuAJdoVu/q8LdtHBaDtiMhvsw2uiK4zPo1SMWECFKn7GCaCWN3jf
         w58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769613938; x=1770218738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRay3Vursv60IOvZlH+eNockW+N8+jbMH24O+Il/+jY=;
        b=A0AaL9mFsWsi8Ba5/dFoTiXVnX3le0IZetRY68oeVgW4cZUrGo932qEvATy/4p4ULj
         +Sfik7jNjspb5izvctYyNKM8qw06CjHh5Q3zJwUoB/I000z30/Volu3MjBjTjL0vfraE
         Kn0Ea/lKSuL1hpZG5FNVBuIoYcA1ybcemC3BKVAAAFxpYXU8je+kfy63XbRbSTxU4dd5
         LywAaEIqgxo3oVSZBo9XzcCHs5ceZuDhTlLwjawDwXkm1PzvJ4VYF2OlDtYHD2BR1RbR
         DT9Sza0/LVUvWN+bH6Rmye5O/+buE2yzMG8+xPbwC+bhax8LDiZkwXqeW2UjUSxUpdBT
         WyPA==
X-Forwarded-Encrypted: i=1; AJvYcCXbay5rk0/1gBikoF1rjurQdlA7KTcjvv3BKye1KZCGZ177HytxtDsEjddpUeUtAJNbdFpAWINQ2ZAJQylmZ/Ld@lists.infradead.org
X-Gm-Message-State: AOJu0YxhvBzL+wop69JuuQwugjFVxyodj4sRVh4lREBujXvUgJ1zw+Ft
	DlZcuN5vwdpZyAT/OYRrQRgso3pxCRmZ512OpeWfGcH5OC/zfGIgjTAG
X-Gm-Gg: AZuq6aKhlWrVNPuVdz1sjCYObUf9xTeA5hQ6zhxvNGo3/Tn3h7v9Ny63gmo/hdz8bvc
	nDF7Ryc8etXMn+E7eIBOL5osw3LNtoTo9bFWWN0xoSXq1ES7hqCY244V56sVS2kEeZ58etuK5/s
	NAbxdtyxUV8A0SStfW6HmmMUcRsiMs9SS/Vl3cs3MA/EHIpSKoUjDTOn8y0C6MbrjSK+6FNMAv7
	7GQ2+RgwBp74KFRL/kpZ93k3pBPDQrcaboZ/V511G57DN5qWxPO0t/99T54IZ3/EFC4oNztgVGK
	zZRQcWmc5qDyOrtjLsMIztmRyFIX0KNQvClUP+IzypJmXTuw33Ihai3cSTOgS20W3rxrhPIu+R1
	GIHzTp23YyDmL2zhsT/eCFvsl6kYNjglw5/sp/FLukkV1dLIyaV9ugMAuhW1ZQ2dqUOjWKk/zPW
	PJS4DVsG7bBniPDmsHvdZ36oky
X-Received: by 2002:a05:6a00:22c7:b0:81f:3d13:e070 with SMTP id d2e1a72fcca58-82369147791mr5966140b3a.12.1769613937562;
        Wed, 28 Jan 2026 07:25:37 -0800 (PST)
Received: from [172.20.10.5] ([117.20.154.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b58f38sm3121727b3a.24.2026.01.28.07.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 07:25:36 -0800 (PST)
Message-ID: <8dd73aac-3c98-4bde-966d-2251dc794073@gmail.com>
Date: Wed, 28 Jan 2026 23:25:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
References: <20260128150112.8873-1-leon.hwang@linux.dev>
 <20260128150112.8873-2-leon.hwang@linux.dev>
Content-Language: en-US
From: Leon Hwang <hffilwlqm@gmail.com>
In-Reply-To: <20260128150112.8873-2-leon.hwang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_072539_311071_57E7D355 
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

Sorry about the subject.

It should be "bpf: Add bpf_jit_supports_fsession()".


On 2026/1/28 23:01, Leon Hwang wrote:
> fsession programs can currently be loaded on architectures that do not
> implement fsession support, which leads to runtime errors instead of a
> clean verifier rejection.
> 
> For example, running fsession selftests on arm64 before fsession support
> is added results in:
> 
> test_fsession_basic:PASS:fsession_test__open_and_load 0 nsec
> test_fsession_basic:PASS:fsession_attach 0 nsec
> check_result:FAIL:test_run_opts err unexpected error: -14 (errno 14)
> 
> Introduce bpf_arch_supports_fsession() to explicitly gate fsession usage
> based on architecture support. Architectures without fsession support
> will now fail program load with -EOPNOTSUPP, allowing selftests to skip
> cleanly instead of errors at runtime.
> 
> x86 declares fsession support, while the default implementation returns
> false.
> 
> Fixes: 2d419c44658f ("bpf: add fsession support")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  arch/x86/net/bpf_jit_comp.c                   |  5 +++
>  include/linux/filter.h                        |  1 +
>  kernel/bpf/core.c                             |  5 +++
>  kernel/bpf/verifier.c                         |  3 ++
>  .../selftests/bpf/prog_tests/fsession_test.c  | 32 ++++++++++++++-----
>  5 files changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 5a075e06cf45..070ba80e39d7 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
>  {
>  	return true;
>  }
> +
> +bool bpf_jit_supports_fsession(void)
> +{
> +	return true;
> +}
> diff --git a/include/linux/filter.h b/include/linux/filter.h
> index fd54fed8f95f..4e1cb4f91f49 100644
> --- a/include/linux/filter.h
> +++ b/include/linux/filter.h
> @@ -1167,6 +1167,7 @@ bool bpf_jit_supports_arena(void);
>  bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena);
>  bool bpf_jit_supports_private_stack(void);
>  bool bpf_jit_supports_timed_may_goto(void);
> +bool bpf_jit_supports_fsession(void);
>  u64 bpf_arch_uaddress_limit(void);
>  void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie);
>  u64 arch_bpf_timed_may_goto(void);
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index e0b8a8a5aaa9..3b1eb632bf7c 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -3142,6 +3142,11 @@ bool __weak bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
>  	return false;
>  }
>  
> +bool __weak bpf_jit_supports_fsession(void)
> +{
> +	return false;
> +}
> +
>  u64 __weak bpf_arch_uaddress_limit(void)
>  {
>  #if defined(CONFIG_64BIT) && defined(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE)
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index c2f2650db9fd..6f867ebf78d1 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -24872,6 +24872,9 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
>  	case BPF_TRACE_FENTRY:
>  	case BPF_TRACE_FEXIT:
>  	case BPF_TRACE_FSESSION:
> +		if (prog->expected_attach_type == BPF_TRACE_FSESSION &&
> +		    !bpf_jit_supports_fsession())
> +			return -EOPNOTSUPP;
>  		if (!btf_type_is_func(t)) {
>  			bpf_log(log, "attach_btf_id %u is not a function\n",
>  				btf_id);
> diff --git a/tools/testing/selftests/bpf/prog_tests/fsession_test.c b/tools/testing/selftests/bpf/prog_tests/fsession_test.c
> index 0c4b428e1cee..a299aeb8cc2e 100644
> --- a/tools/testing/selftests/bpf/prog_tests/fsession_test.c
> +++ b/tools/testing/selftests/bpf/prog_tests/fsession_test.c
> @@ -29,8 +29,16 @@ static void test_fsession_basic(void)
>  	struct fsession_test *skel = NULL;
>  	int err;
>  
> -	skel = fsession_test__open_and_load();
> -	if (!ASSERT_OK_PTR(skel, "fsession_test__open_and_load"))
> +	skel = fsession_test__open();
> +	if (!ASSERT_OK_PTR(skel, "fsession_test__open"))
> +		return;
> +
> +	err = fsession_test__load(skel);
> +	if (err == -EOPNOTSUPP) {
> +		test__skip();
> +		goto cleanup;
> +	}
> +	if (!ASSERT_OK(err, "fsession_test__load"))
>  		goto cleanup;
>  
>  	err = fsession_test__attach(skel);
> @@ -47,8 +55,16 @@ static void test_fsession_reattach(void)
>  	struct fsession_test *skel = NULL;
>  	int err;
>  
> -	skel = fsession_test__open_and_load();
> -	if (!ASSERT_OK_PTR(skel, "fsession_test__open_and_load"))
> +	skel = fsession_test__open();
> +	if (!ASSERT_OK_PTR(skel, "fsession_test__open"))
> +		return;
> +
> +	err = fsession_test__load(skel);
> +	if (err == -EOPNOTSUPP) {
> +		test__skip();
> +		goto cleanup;
> +	}
> +	if (!ASSERT_OK(err, "fsession_test__load"))
>  		goto cleanup;
>  
>  	/* first attach */
> @@ -94,6 +110,10 @@ static void test_fsession_cookie(void)
>  	bpf_program__set_autoload(skel->progs.test6, false);
>  
>  	err = fsession_test__load(skel);
> +	if (err == -EOPNOTSUPP) {
> +		test__skip();
> +		goto cleanup;
> +	}
>  	if (!ASSERT_OK(err, "fsession_test__load"))
>  		goto cleanup;
>  
> @@ -111,10 +131,6 @@ static void test_fsession_cookie(void)
>  
>  void test_fsession_test(void)
>  {
> -#if !defined(__x86_64__)
> -	test__skip();
> -	return;
> -#endif
>  	if (test__start_subtest("fsession_test"))
>  		test_fsession_basic();
>  	if (test__start_subtest("fsession_reattach"))


