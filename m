Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28199C61DE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=br9Fo1dfeEMPffvOKFoumObqBOWwJq2Nx+QuBTPepjc=; b=IitGEmNhzNM3lcF4CYwrWXaflf
	YG65JUxU1SCXoNFn3Ez3xHYuwPUnfKs8/fnSYV0y+T15FAOQuSlLeX6tvaege74nkl8yKKAgwtXGa
	9C6mik1xpqhQJrsPLYCGKR4E3PWuPoj2sOO3/6GcTFTWfHXTBBelnqvR1jMrALdIcbN5o4mMNnQLU
	GYKu85K/Y49wj1Jly29YVmoXKQSGBu6dn+8Z/5z0ZYXCjE6cc47Verw5kF1rfwNWffUEH/JOTMBlc
	GpQUhLoBDRJ/EDTAn94JP4qs4GXuyVbIb6QFqySUrOU41wYLZe05V5nz7FjsjqSlzkHn+ptxozVTG
	pLgLYLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtmRt-0000000G3A6-3ZQh;
	Sat, 21 Feb 2026 12:51:05 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtmRr-0000000G39l-0UwH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 12:51:04 +0000
Message-ID: <206609d9-7bd7-4923-999a-2402388b8f64@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771678260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=br9Fo1dfeEMPffvOKFoumObqBOWwJq2Nx+QuBTPepjc=;
	b=icNCDIkPBixppTwoG2YRcxRBDOFrPHs5wl46DQZbCCKYEWDIpUUWJM7LrHCsqbdvez2lmt
	WcCr1ulB0f+kojp7ZyhjC+MKcy9vB9VrxcbDpMvUyc53mrxYFmfh27ZI2hgt1hDiDW+KSc
	uYnmHfX2R4fnoSi9mpjtw/Jhc05YLnw=
Date: Sat, 21 Feb 2026 20:50:35 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 bpf@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Peilin Ye <yepeilin@google.com>,
 Luis Gerhorst <luis.gerhorst@fau.de>, Viktor Malik <vmalik@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202602210241.E7Q88vvq-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <202602210241.E7Q88vvq-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_045103_470414_FCD0A8B1 
X-CRM114-Status: GOOD (  10.86  )
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



On 2026/2/21 17:58, Dan Carpenter wrote:
> Hi Leon,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Introduce-64-bit-bitops-kfuncs/20260219-223550
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20260219142933.13904-2-leon.hwang%40linux.dev
> patch subject: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
> config: i386-randconfig-141-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210241.E7Q88vvq-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> smatch version: v0.5.0-8994-gd50c5a4c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202602210241.E7Q88vvq-lkp@intel.com/
> 
> smatch warnings:
> kernel/bpf/verifier.c:18245 bpf_kfunc_is_fastcall() error: buffer overflow 'special_kfunc_list' 64 <= 64
> 
> vim +/special_kfunc_list +18245 kernel/bpf/verifier.c
> 
> 966e89879bbea4 Leon Hwang       2026-02-19  18223  static bool bpf_kfunc_is_fastcall(struct bpf_verifier_env *env, u32 func_id, u32 flags)
> 966e89879bbea4 Leon Hwang       2026-02-19  18224  {
> 966e89879bbea4 Leon Hwang       2026-02-19  18225  	if (!(flags & KF_FASTCALL))
> 966e89879bbea4 Leon Hwang       2026-02-19  18226  		return false;
> 966e89879bbea4 Leon Hwang       2026-02-19  18227  
> 966e89879bbea4 Leon Hwang       2026-02-19  18228  	if (!env->prog->jit_requested)
> 966e89879bbea4 Leon Hwang       2026-02-19  18229  		return true;
> 966e89879bbea4 Leon Hwang       2026-02-19  18230  
> 966e89879bbea4 Leon Hwang       2026-02-19  18231  	if (func_id == special_kfunc_list[KF_bpf_clz64])
> 966e89879bbea4 Leon Hwang       2026-02-19  18232  		return bpf_jit_inlines_kfunc_call(bpf_clz64);
> 966e89879bbea4 Leon Hwang       2026-02-19  18233  	if (func_id == special_kfunc_list[KF_bpf_ctz64])
> 966e89879bbea4 Leon Hwang       2026-02-19  18234  		return bpf_jit_inlines_kfunc_call(bpf_ctz64);
> 966e89879bbea4 Leon Hwang       2026-02-19  18235  	if (func_id == special_kfunc_list[KF_bpf_ffs64])
> 966e89879bbea4 Leon Hwang       2026-02-19  18236  		return bpf_jit_inlines_kfunc_call(bpf_ffs64);
> 966e89879bbea4 Leon Hwang       2026-02-19  18237  	if (func_id == special_kfunc_list[KF_bpf_fls64])
> 966e89879bbea4 Leon Hwang       2026-02-19  18238  		return bpf_jit_inlines_kfunc_call(bpf_fls64);
> 966e89879bbea4 Leon Hwang       2026-02-19  18239  	if (func_id == special_kfunc_list[KF_bpf_bitrev64])
> 966e89879bbea4 Leon Hwang       2026-02-19  18240  		return bpf_jit_inlines_kfunc_call(bpf_bitrev64);
> 966e89879bbea4 Leon Hwang       2026-02-19  18241  	if (func_id == special_kfunc_list[KF_bpf_popcnt64])
> 966e89879bbea4 Leon Hwang       2026-02-19  18242  		return bpf_jit_inlines_kfunc_call(bpf_popcnt64);
> 966e89879bbea4 Leon Hwang       2026-02-19  18243  	if (func_id == special_kfunc_list[KF_bpf_rol64])
> 966e89879bbea4 Leon Hwang       2026-02-19  18244  		return bpf_jit_inlines_kfunc_call(bpf_rol64);
> 966e89879bbea4 Leon Hwang       2026-02-19 @18245  	if (func_id == special_kfunc_list[KF_bpf_ror64])
>                                                                                           ^^^^^^^^^^^^
> special_kfunc_list[] has 64 elements and KF_bpf_ror64 is 64 so
> this is out of bounds.
> 

Ack.

I'll try a new way using KF_JIT_MAY_INLINE flag in the next revision,
which will avoid adding these kfuncs to special_kfunc_list btw.

Thanks,
Leon

> 966e89879bbea4 Leon Hwang       2026-02-19  18246  		return bpf_jit_inlines_kfunc_call(bpf_ror64);
> 966e89879bbea4 Leon Hwang       2026-02-19  18247  
> 966e89879bbea4 Leon Hwang       2026-02-19  18248  	return true;
> 966e89879bbea4 Leon Hwang       2026-02-19  18249  }
> 


