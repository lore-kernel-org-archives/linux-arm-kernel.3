Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA79DC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4KswxDk/sgjZja7CZIgYQLV/ZD7lzRYlaP/OdGtOys=; b=KK0PRso8AZ/iaBW19yCp+17IQy
	qs7ymDZTays4S5bcHmukgTiOE3xUbA21+qGBFCejj5P4THAm9i2soHeKCn+XnOsZWFrFomqpfcAOs
	6+jgEAcWcBkk4gqe5oVpQIfkMo1kAcQP12C5VpO3ogysETIb1+CiEGME5KmD+bMZbYJa7wJ1G+HYC
	dFfaP7IKTvaoIn1v+iktE9vVhh8o30iPXISSXqMm3qt5msVfZoddZRY2ZSPltvqTMgrTDN85bxawT
	h87fgC6HNGB+9IwBRA1noOXbq8HBADuEWTrgSZ+7sTF+kZyizPuWqVUt2O1KNl7KVPKxpHdCOISSR
	fbkSWf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YXc-00000006oIi-1iye;
	Mon, 07 Sep 2026 12:33:41 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YXY-00000006oGc-1dHZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:33:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hdmg75wb2zYQvDk
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 20:32:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 5CB6640577
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Sep 2026 20:33:25 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCXCbcTr55qPXJXBA--.48482S2;
	Mon, 07 Sep 2026 20:33:25 +0800 (CST)
Message-ID: <8116d851-b52f-4b17-9ff5-45a0c5d45e07@huaweicloud.com>
Date: Mon, 7 Sep 2026 20:33:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf v2 2/2] selftests/bpf: cover the exception callback
 using its own BPF stack
Content-Language: en-US
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Puranjay Mohan <puranjay@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>,
 Will Deacon <will@kernel.org>, Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
 <20260907054235.473103-3-donggeunyoo.kernel@gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <20260907054235.473103-3-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _Ch0CgCXCbcTr55qPXJXBA--.48482S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4xXw47uFW8uw1xAFWfGrg_yoW5Ar4fpF
	yqvF9xKF95JFnFva47Jw40ga1rWrs7XF48CrWkXr1YvF1xtrn7WF1xKFZ8tw45CrWSyrn5
	Za1Yvr93Kw45C3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_053336_812658_E9FC4C86 
X-CRM114-Status: GOOD (  19.75  )
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

On 9/7/2026 1:42 PM, Donggeun Yoo wrote:
> The existing exception tests do not reach a callback that materializes
> BPF_REG_FP into a register. They either throw from the main program,
> where BPF_REG_FP already holds the value the callback needs, or use a
> callback whose only stack accesses are frame pointer relative, which the
> arm64 JIT rewrites to be stack pointer relative.
> 
> Add a test that throws from a subprogram using its own BPF stack, with a
> callback that hands the address of a local variable to
> bpf_probe_read_kernel(). The helper and the callback have to name the
> same slot for the value read back to be the one the helper stored.
> 
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> ---
>   .../selftests/bpf/prog_tests/exceptions.c     |  1 +
>   .../testing/selftests/bpf/progs/exceptions.c  | 29 +++++++++++++++++++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/exceptions.c b/tools/testing/selftests/bpf/prog_tests/exceptions.c
> index 3588d6f97fd4..639866ce09a9 100644
> --- a/tools/testing/selftests/bpf/prog_tests/exceptions.c
> +++ b/tools/testing/selftests/bpf/prog_tests/exceptions.c
> @@ -55,6 +55,7 @@ static void test_exceptions_success(void)
>   	RUN_SUCCESS(exception_ext, 0);
>   	RUN_SUCCESS(exception_ext_mod_cb_runtime, 35);
>   	RUN_SUCCESS(exception_throw_subprog, 1);
> +	RUN_SUCCESS(exception_throw_subprog_stack_cb, 0x1234);
>   	RUN_SUCCESS(exception_assert_nz_gfunc, 1);
>   	RUN_SUCCESS(exception_assert_zero_gfunc, 1);
>   	RUN_SUCCESS(exception_assert_neg_gfunc, 1);
> diff --git a/tools/testing/selftests/bpf/progs/exceptions.c b/tools/testing/selftests/bpf/progs/exceptions.c
> index c8d716fbd419..2b01b45cef06 100644
> --- a/tools/testing/selftests/bpf/progs/exceptions.c
> +++ b/tools/testing/selftests/bpf/progs/exceptions.c
> @@ -212,6 +212,35 @@ int exception_throw_subprog(struct __sk_buff *ctx)
>   	return 0;
>   }
>   
> +u64 exception_cb_stack_src = 0x1234;
> +
> +/* The address handed to the helper has to be this callback's own stack
> + * slot, not one from a frame that is already gone.
> + */
> +__noinline int exception_cb_stack(u64 cookie)
> +{
> +	volatile u64 val = 0xdead;
> +
> +	bpf_probe_read_kernel((void *)&val, sizeof(val), &exception_cb_stack_src);
> +	return val;
> +}
> +
> +/* Throws from a subprogram that has a stack of its own. */
> +__noinline static int throwing_subprog_stack(struct __sk_buff *ctx)
> +{
> +	volatile u64 pad[4] = {};
> +
> +	bpf_throw(pad[0]);
> +	return 0;
> +}
> +
> +SEC("tc")
> +__exception_cb(exception_cb_stack)
> +int exception_throw_subprog_stack_cb(struct __sk_buff *ctx)
> +{
> +	return throwing_subprog_stack(ctx);
> +}
> +
>   __noinline int assert_nz_gfunc(u64 c)
>   {
>   	volatile u64 cookie = c;


Acked-by: Xu Kuohai <xukuohai@huawei.com>


