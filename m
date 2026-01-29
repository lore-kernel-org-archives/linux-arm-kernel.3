Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD049D46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 01:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dl/DTgnR2LWZ4WWPq9bsPwP22gj/Iby75/e7ptvtrsk=; b=bRjMORUdu850aiBeI2fYC8KOJh
	aHuHnx5N0w7qbTDISOfEVGxb+RDlQLniRMTmnhN2FGMJIUSSs4wCLoVxMkM+oA3dagoNhaT/A8Sc3
	vvyfjtz1ciBkZ0RltTSSzjWnleCVHO1bTxR2g4feXwsLACU9rprsy3dREqzZEh/AAYC7/stiZUvfB
	7rDkuPyB6BEqBd4Id4J+UBXf6/CcCRwRku9dN9kxGqMgUBTkhUKqYY8IWV7acZ0ofzAiu15YD9Wfu
	+Wbsz+KpKCtA8pnhbB/5+BFycUNv23sdB1tSDgOz1Qdf66PeqMZW9hZw3qWjY2iOm3syd7C+pHdDZ
	BeuTWuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGbv-0000000H258-3dw6;
	Thu, 29 Jan 2026 01:14:15 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGbr-0000000H24T-2UnQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 01:14:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769649243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dl/DTgnR2LWZ4WWPq9bsPwP22gj/Iby75/e7ptvtrsk=;
	b=hvtxWaioRsELgv1IwyJU6puKmtAvyQMj4OSLRY2L32HSM1UQfDRs0nQHSXKsnMJxOM4nKW
	mtUGgnKGS+jMfQJ2IAwfsiU/jkNrd/8M9cBlJpQrZiOy+uOk47up35mqf7/9UaPimaHqw3
	Ml1BJn6Dp6m+/leKr496oZi1r8RS1FM=
From: Menglong Dong <menglong.dong@linux.dev>
To: bpf@vger.kernel.org, Leon Hwang <leon.hwang@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>,
 Leon Hwang <leon.hwang@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next v2 3/3] bpf/selftests: Enable get_func_args and
 get_func_ip tests on arm64
Date: Thu, 29 Jan 2026 09:13:49 +0800
Message-ID: <6233558.lOV4Wx5bFT@7940hx>
In-Reply-To: <20260128150112.8873-4-leon.hwang@linux.dev>
References: <20260128150112.8873-1-leon.hwang@linux.dev>
 <20260128150112.8873-4-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_171413_076475_D98F4D4C 
X-CRM114-Status: GOOD (  12.74  )
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

On 2026/1/28 23:01 Leon Hwang <leon.hwang@linux.dev> write:
> Allow get_func_args, and get_func_ip selftests to run on arm64.

Hi, Leon.

I think you missed the fsession_test.c, right? You need to
enable the test_fsession_test() for arm64 too. Therefore,
the title of this patch maybe:
    bpf/selftests: Enable fsession tests on arm64

Thanks!
Menglong Dong

> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/testing/selftests/bpf/progs/get_func_args_test.c | 2 +-
>  tools/testing/selftests/bpf/progs/get_func_ip_test.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/get_func_args_test.c b/tools/testing/selftests/bpf/progs/get_func_args_test.c
> index 0a3236a7a109..180ba5098ca1 100644
> --- a/tools/testing/selftests/bpf/progs/get_func_args_test.c
> +++ b/tools/testing/selftests/bpf/progs/get_func_args_test.c
> @@ -167,7 +167,7 @@ int BPF_PROG(tp_test2)
>  }
>  
>  __u64 test7_result = 0;
> -#ifdef __TARGET_ARCH_x86
> +#if defined(bpf_target_x86) || defined(bpf_target_arm64)
>  SEC("fsession/bpf_fentry_test1")
>  int BPF_PROG(test7)
>  {
> diff --git a/tools/testing/selftests/bpf/progs/get_func_ip_test.c b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
> index 65f7e1f182bf..43ff836a8ed8 100644
> --- a/tools/testing/selftests/bpf/progs/get_func_ip_test.c
> +++ b/tools/testing/selftests/bpf/progs/get_func_ip_test.c
> @@ -106,7 +106,7 @@ int BPF_URETPROBE(test8, int ret)
>  
>  __u64 test9_entry_result = 0;
>  __u64 test9_exit_result = 0;
> -#ifdef __TARGET_ARCH_x86
> +#if defined(bpf_target_x86) || defined(bpf_target_arm64)
>  SEC("fsession/bpf_fentry_test1")
>  int BPF_PROG(test9, int a)
>  {
> -- 
> 2.52.0
> 
> 
> 





