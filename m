Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A91AC56201
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z943trj5fRXyCPYj1ZkF6pjisLAiil83x3fUBjHtWMM=; b=Ii6md999ULp4YH0flPWgEVCLYD
	QHK64Q48MxxuHxBGJ3Zz1l9aFmKYwe1L+TXkZ0xSw/8kNRjXpidN779AW+4FZaiPqara2rh8IJvtc
	BMNU6gL72riAqKNW872IY+GoBjX6gD4TivoN3m+WOoIsdwJ17o43OZeobRw34J+Exb7YQhnxnnhv+
	M+v7B5kRLq+vcg/48gDLo++WP2Pg6dId4Ecs1b+UGsD0suUXILWm60USUqGml4s8B8UKOoDOauuvA
	zhxdrDnvMKCpwdy7GUFDBbd/BoDEk8PU/f8Nj9/6HsAMvarKp1GIZx7//kMjrkulvSGYE3XhOGH6M
	RwZxtkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSWo-0000000F2kf-1cLx;
	Fri, 20 Feb 2026 15:34:50 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSWk-0000000F2ii-47B8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:34:48 +0000
Message-ID: <e617cdaa-049a-453b-8f52-1966d350f907@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771601679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z943trj5fRXyCPYj1ZkF6pjisLAiil83x3fUBjHtWMM=;
	b=pq1jHNkxADK2dq95ZhyKT83WWsDHhuAU9Tk7GgkqH3T9xhFYuhT/xltBiGx4vnSB6psZG9
	mIcOrCU5w+8U9+VIJBy/0AT2mJIzS9OqpoZ7YzjSqS+5FgjD7J4hZ7u7S2FD6sYgP4+qEX
	ir5KmvMrEex2xcOtCALbiOVA35HY59Q=
Date: Fri, 20 Feb 2026 23:34:22 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 X86 ML <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Shuah Khan <shuah@kernel.org>, Peilin Ye <yepeilin@google.com>,
 Luis Gerhorst <luis.gerhorst@fau.de>, Viktor Malik <vmalik@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 kernel-patches-bot@fb.com
References: <20260219142933.13904-1-leon.hwang@linux.dev>
 <20260219142933.13904-2-leon.hwang@linux.dev>
 <CAADnVQK=5Gb3w_QG4Vq32EfvpqAK_DPwCHtzzt7DzRkJ5_h6JQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <CAADnVQK=5Gb3w_QG4Vq32EfvpqAK_DPwCHtzzt7DzRkJ5_h6JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_073447_810583_9EE80FF8 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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



On 2026/2/20 01:50, Alexei Starovoitov wrote:
> On Thu, Feb 19, 2026 at 6:30 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>>
>>
>> +static bool bpf_kfunc_is_fastcall(struct bpf_verifier_env *env, u32 func_id, u32 flags)
>> +{
>> +       if (!(flags & KF_FASTCALL))
>> +               return false;
>> +
>> +       if (!env->prog->jit_requested)
>> +               return true;
>> +
>> +       if (func_id == special_kfunc_list[KF_bpf_clz64])
>> +               return bpf_jit_inlines_kfunc_call(bpf_clz64);
>> +       if (func_id == special_kfunc_list[KF_bpf_ctz64])
>> +               return bpf_jit_inlines_kfunc_call(bpf_ctz64);
>> +       if (func_id == special_kfunc_list[KF_bpf_ffs64])
>> +               return bpf_jit_inlines_kfunc_call(bpf_ffs64);
>> +       if (func_id == special_kfunc_list[KF_bpf_fls64])
>> +               return bpf_jit_inlines_kfunc_call(bpf_fls64);
>> +       if (func_id == special_kfunc_list[KF_bpf_bitrev64])
>> +               return bpf_jit_inlines_kfunc_call(bpf_bitrev64);
>> +       if (func_id == special_kfunc_list[KF_bpf_popcnt64])
>> +               return bpf_jit_inlines_kfunc_call(bpf_popcnt64);
>> +       if (func_id == special_kfunc_list[KF_bpf_rol64])
>> +               return bpf_jit_inlines_kfunc_call(bpf_rol64);
>> +       if (func_id == special_kfunc_list[KF_bpf_ror64])
>> +               return bpf_jit_inlines_kfunc_call(bpf_ror64);
> 
> This is too ugly. Find a way to do it differently.

Agreed.

I'd like to introduce a new flag KF_JIT_MAY_INLINE to indicate the kfunc
will be inlined by JIT backends if possible. As for those kfuncs w/
KF_FASTCALL w/o KF_JIT_MAY_INLINE, they are fastcall always.

Thanks,
Leon


