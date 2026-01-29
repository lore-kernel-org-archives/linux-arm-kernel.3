Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5D4D46C16
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 02:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2BY6G007NwO/MDDvGKm/iCoeh9ZJMPEhIs8za3797E=; b=VNth9RZJoYcMu1ZLTrj1ZfPKXH
	3ceoDEsww1G26yBqT2QKg39ARNGIaz7/lGo+zJ0aE/yBPDe1jhr8K43mg0D9nhZD3j/fdYMccYedw
	NCkeIvDPPKE5c5fhJWj1Ncvsw8W2N/nrUUnreqhZOF+YB4vndXhxpCENdf9DLXgGQbBBvHD+vy5wv
	xdg2C2jSNS+MD/ft3mvyyZAVX3zSIffYjHgPF2BZxrvBjBtUO42kR2s4OdAUP+GPvov/FMhy5QLdr
	XHOnB8MYWNHx14rRUSb8sPLADz6iBAnaKfRJmoeb45xL93vk/mnoQvWDScVRO3TRf10MiBILgyWWC
	wv8VoMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHYV-0000000H6rl-404a;
	Thu, 29 Jan 2026 02:14:49 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHYT-0000000H6rO-0Qeq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 02:14:47 +0000
Message-ID: <468425e6-64ba-4d9a-97c5-6a1d95b8223b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769652879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U2BY6G007NwO/MDDvGKm/iCoeh9ZJMPEhIs8za3797E=;
	b=NAjfjL5E159u815UKdfODq+5g/aiO52FnhABHQ15W6wXklV66fPaQRumaDIk3yRX4YJ1MY
	Pb1wPBkrIDLV6souYfZamhYrt1WJ5OSdI2bzFIx2sMIrVviyk3GhQ64G5JBPCDQOlA3oF1
	L3w4XZEMejw0a+nKLeCZA41FsNzyvKI=
Date: Thu, 29 Jan 2026 10:14:25 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 1/3] bpf: Add bpf_arch_supports_fsession()
Content-Language: en-US
To: Menglong Dong <menglong.dong@linux.dev>, bpf@vger.kernel.org
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
 <20260128150112.8873-2-leon.hwang@linux.dev> <3392533.aeNJFYEL58@7940hx>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <3392533.aeNJFYEL58@7940hx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_181445_834591_92814CF6 
X-CRM114-Status: GOOD (  25.57  )
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



On 29/1/26 09:29, Menglong Dong wrote:
> On 2026/1/28 23:01 Leon Hwang <leon.hwang@linux.dev> write:
>> fsession programs can currently be loaded on architectures that do not
>> implement fsession support, which leads to runtime errors instead of a
>> clean verifier rejection.
>>
>> For example, running fsession selftests on arm64 before fsession support
>> is added results in:
>>
>> test_fsession_basic:PASS:fsession_test__open_and_load 0 nsec
>> test_fsession_basic:PASS:fsession_attach 0 nsec
>> check_result:FAIL:test_run_opts err unexpected error: -14 (errno 14)
>>
>> Introduce bpf_arch_supports_fsession() to explicitly gate fsession usage
>> based on architecture support. Architectures without fsession support
>> will now fail program load with -EOPNOTSUPP, allowing selftests to skip
>> cleanly instead of errors at runtime.
>>
>> x86 declares fsession support, while the default implementation returns
>> false.
>>
>> Fixes: 2d419c44658f ("bpf: add fsession support")
> 
> I were wondering how this problem happen, as I remember that
> I added such checking. When I look back, I found that the checking
> is lost during v3->v4. I recalled that the AI warned me about this
> part, but I thought that checking exists in my mind :/
> 
> It seems that we can't ignore the AI's warning easily. It mostly
> make sense.
> 
>> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
>> ---
>>  arch/x86/net/bpf_jit_comp.c                   |  5 +++
>>  include/linux/filter.h                        |  1 +
>>  kernel/bpf/core.c                             |  5 +++
>>  kernel/bpf/verifier.c                         |  3 ++
>>  .../selftests/bpf/prog_tests/fsession_test.c  | 32 ++++++++++++++-----
>>  5 files changed, 38 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>> index 5a075e06cf45..070ba80e39d7 100644
>> --- a/arch/x86/net/bpf_jit_comp.c
>> +++ b/arch/x86/net/bpf_jit_comp.c
>> @@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
>>  {
>>  	return true;
>>  }
>> +
>> +bool bpf_jit_supports_fsession(void)
>> +{
>> +	return true;
>> +}
>> diff --git a/include/linux/filter.h b/include/linux/filter.h
>> index fd54fed8f95f..4e1cb4f91f49 100644
>> --- a/include/linux/filter.h
>> +++ b/include/linux/filter.h
>> @@ -1167,6 +1167,7 @@ bool bpf_jit_supports_arena(void);
>>  bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena);
>>  bool bpf_jit_supports_private_stack(void);
>>  bool bpf_jit_supports_timed_may_goto(void);
>> +bool bpf_jit_supports_fsession(void);
>>  u64 bpf_arch_uaddress_limit(void);
>>  void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie);
>>  u64 arch_bpf_timed_may_goto(void);
>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
>> index e0b8a8a5aaa9..3b1eb632bf7c 100644
>> --- a/kernel/bpf/core.c
>> +++ b/kernel/bpf/core.c
>> @@ -3142,6 +3142,11 @@ bool __weak bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
>>  	return false;
>>  }
>>  
>> +bool __weak bpf_jit_supports_fsession(void)
>> +{
>> +	return false;
>> +}
>> +
>>  u64 __weak bpf_arch_uaddress_limit(void)
>>  {
>>  #if defined(CONFIG_64BIT) && defined(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE)
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index c2f2650db9fd..6f867ebf78d1 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -24872,6 +24872,9 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
>>  	case BPF_TRACE_FENTRY:
>>  	case BPF_TRACE_FEXIT:
>>  	case BPF_TRACE_FSESSION:
>> +		if (prog->expected_attach_type == BPF_TRACE_FSESSION &&
>> +		    !bpf_jit_supports_fsession())
>> +			return -EOPNOTSUPP;
>>  		if (!btf_type_is_func(t)) {
>>  			bpf_log(log, "attach_btf_id %u is not a function\n",
>>  				btf_id);
>> diff --git a/tools/testing/selftests/bpf/prog_tests/fsession_test.c b/tools/testing/selftests/bpf/prog_tests/fsession_test.c
>> index 0c4b428e1cee..a299aeb8cc2e 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/fsession_test.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/fsession_test.c
>> @@ -29,8 +29,16 @@ static void test_fsession_basic(void)
>>  	struct fsession_test *skel = NULL;
>>  	int err;
>>  
>> -	skel = fsession_test__open_and_load();
>> -	if (!ASSERT_OK_PTR(skel, "fsession_test__open_and_load"))
>> +	skel = fsession_test__open();
>> +	if (!ASSERT_OK_PTR(skel, "fsession_test__open"))
>> +		return;
>> +
>> +	err = fsession_test__load(skel);
>> +	if (err == -EOPNOTSUPP) {
>> +		test__skip();
>> +		goto cleanup;
>> +	}
>> +	if (!ASSERT_OK(err, "fsession_test__load"))
>>  		goto cleanup;
>>  
>>  	err = fsession_test__attach(skel);
>> @@ -47,8 +55,16 @@ static void test_fsession_reattach(void)
>>  	struct fsession_test *skel = NULL;
>>  	int err;
>>  
>> -	skel = fsession_test__open_and_load();
>> -	if (!ASSERT_OK_PTR(skel, "fsession_test__open_and_load"))
>> +	skel = fsession_test__open();
>> +	if (!ASSERT_OK_PTR(skel, "fsession_test__open"))
>> +		return;
>> +
>> +	err = fsession_test__load(skel);
>> +	if (err == -EOPNOTSUPP) {
>> +		test__skip();
>> +		goto cleanup;
>> +	}
>> +	if (!ASSERT_OK(err, "fsession_test__load"))
>>  		goto cleanup;
>>  
>>  	/* first attach */
>> @@ -94,6 +110,10 @@ static void test_fsession_cookie(void)
>>  	bpf_program__set_autoload(skel->progs.test6, false);
>>  
>>  	err = fsession_test__load(skel);
>> +	if (err == -EOPNOTSUPP) {
>> +		test__skip();
>> +		goto cleanup;
>> +	}
>>  	if (!ASSERT_OK(err, "fsession_test__load"))
>>  		goto cleanup;
>>  
>> @@ -111,10 +131,6 @@ static void test_fsession_cookie(void)
>>  
>>  void test_fsession_test(void)
>>  {
>> -#if !defined(__x86_64__)
>> -	test__skip();
>> -	return;
>> -#endif
> 
> Ah, I see you enabled the testing for arm64 in this patch. Maybe

The test was not enabled for arm64 in this patch, since
bpf_jit_supports_fsession() still returns false there.

The test only becomes enabled when bpf_jit_supports_fsession() returns
true, which happens in patch #2.

> we can move this part to the 3rd patch, or split it out to another
> patch?
> > TBH, I prefer the previous implement. In this way, the CI can
> still pass if x86_64 or arm64 return -EOPNOTSUPP, right?
> 
> Maybe you can test the not-supported case stand alone, such
> as:
> 
> #if !defined(__x86_64__)
> 	test__fsession_not_support();
> 	return;
> #endif
> 
> wdyt?
> 

With this patch, the test now depends on the runtime return value of
bpf_jit_supports_fsession() rather than a compile-time #if macro.

This makes the test more extensible: when another architecture (e.g.
LoongArch) adds fsession support in the future, it only needs to
implement bpf_jit_supports_fsession() in its JIT backend, which will
enable the test without touching the test code at the same time.

For architectures that do not support fsession, the existing subtests
will be skipped in the same way as before, so a separate
'-EOPNOTSUPP'-specific subtest is not necessary.

Thanks,
Leon


