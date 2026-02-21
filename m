Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A392C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iG95ysl0cBzDn6owjLxKJa0jdHI3ZVF2zQtfxEizLIg=; b=4BX+ZR2vfNISom
	F0+vS/Epz8mV1xqaWadIjWGyGN1lbKl05tLmfzDJZ4mnbswE9h9YW52zWgte7vxMXrfr4gvbDQouq
	3005LuYBtvl4g5y6FVSfa+/GePVY3dIj0v4VOBbBaH7xM2nIausyZiFltHYlb6dV5dyn2HP/Rxsfx
	nB3AqU2sM34AoakhezwnWYBmaqYCbFpssYtqgwZ2aWmqNsAvHXd9iyNprDhOWr94aXGHNCv9LINos
	yflzVxe38BpFnPNpi8THSAwJDcGQzrHb1NGHbfn94QhX17Gmz1y2ahDNH5z9g0zf6YA29D8WBAQ9Q
	N1qAPS58zh6AjNjCif5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjkZ-0000000FxgP-2IQg;
	Sat, 21 Feb 2026 09:58:11 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjkX-0000000Fxg4-07pI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 09:58:10 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so1821181f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 01:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771667886; x=1772272686; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iG95ysl0cBzDn6owjLxKJa0jdHI3ZVF2zQtfxEizLIg=;
        b=qFVSpEkTJtMUAFU9PyZLNDEUKTetFwadA3WqpwqTrvcCAeFsdtvWrvxebQ4phssAfn
         LMrnFcht9Jdt2QV6+94aPyJp1ME70KTOdc+3GBSktRO6xy8yq2a88ZpcZ6M9EzDsEKmp
         rCZ6cBnyTp4hC5G7B/st634dMrtZ+GoHaYcyTh5qx+ZOa6XFerpJvjBixQr2N4MxMJR7
         +BrFSZ9nW26zc9RItBP4BVuFmX3JbCstblCWnqYZOdFRb3HYj7HnfL6wsOvQYie6Ndmd
         DAsvrcFW0cRu1cggNjKJfgrt8/ow33ii3q6lNSoUVe8QAxq3ViOHCL7mTHw6nkT/ejv3
         xX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771667886; x=1772272686;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG95ysl0cBzDn6owjLxKJa0jdHI3ZVF2zQtfxEizLIg=;
        b=dhmyFYiydHAtisbpuD2hOreXDScMqTHOnuYkRdvFJ3MMOVgsmjTGNexCmdO05t0dJV
         22qt0xoaV+IOlC3inp18Q0I5DHT9rcrITx9ouY4eJODzO9lMH2AM8u3c9hBs/W6ec03c
         x5TTE/IqjZ6DV/LY7no7VmAZ7LYKY1siqoqL4UwTCjWx7zhkfmNXtJQV5ZTk+yW9tLez
         wQ8m3TX29z+xRw/hDnG4FG0rnRw4+Em3E+BB1vizPrrXvf64oBwh5B+/jruEPugiNJ1E
         YQx7jaAoKYMy3pmmY4r2Hmf2dvA5cwRRiSvIf1tNUrh/O2ReItSm4HukVrvXKVtGiKc9
         ghwA==
X-Forwarded-Encrypted: i=1; AJvYcCVNcnwjqM2GDOk/QovzjpylRlSx4eBiOo9c7z+9t/WlytcerrClyXYeAbpUm7rb61uvhFfN0WhA5vO7OYO6OP8R@lists.infradead.org
X-Gm-Message-State: AOJu0YySO7VCCC+NjFJVEIidb4xuIcQLEVImDNPro372U6D58BotByVO
	OjknSoaDL3r6dwsDWmA/yLpIwa06v0JG2NA2DFaX4BE6agvOQUiDbSopOzzfMhPAAj8=
X-Gm-Gg: AZuq6aISknYEruDXe75lmv8yNDYdH7g67TBT65J+UCayvIcvoVcUzp7KGn8OPJxenbJ
	YE2cvcBvpV/5XicrPoQL/PQrYQ9f78uEmQImddW7V+L15ND9ED/PqYb5v2XPsTUudN5bOnNoP2z
	5OIUzQBJQyODS+8VzFJssfUwjWoikFWGGqI8221c2Xiktxzc+LYBOTS4BR+pxJw3bRk73cBqwG0
	pbjFYUEEzAQW8tJH18yyFz7JdxuWgVDofaSm2RodICRb4dgaRzrxMUCKYSjJ5zw72tfgcViBM5w
	Dj7tYMFxor2jKI0Ig+trCwXYVmK3pULswo9Zpppqoj+xbwYrX3TvhIhOSgmMY5PYjHFRoHP8oqH
	wpa+N6eQ2VVP+P73M+hRIiahL2Gz4LZf0wvC4+XWyAkdAWo+yR6Y+nTwKKK9ZQp7/+XubLhSNCl
	ZStUXR+WxAPa1f7PxYJq3cl0vSe0gaWDbaydjsg6k=
X-Received: by 2002:a05:6000:2601:b0:437:81b0:6638 with SMTP id ffacd0b85a97d-4396f188767mr4885393f8f.59.1771667886111;
        Sat, 21 Feb 2026 01:58:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa015sm4427011f8f.8.2026.02.21.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:58:05 -0800 (PST)
Date: Sat, 21 Feb 2026 12:58:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Leon Hwang <leon.hwang@linux.dev>,
	bpf@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>,
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
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Leon Hwang <leon.hwang@linux.dev>, Peilin Ye <yepeilin@google.com>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Viktor Malik <vmalik@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
Message-ID: <202602210241.E7Q88vvq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219142933.13904-2-leon.hwang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_015809_129215_7329497D 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi Leon,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Introduce-64-bit-bitops-kfuncs/20260219-223550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260219142933.13904-2-leon.hwang%40linux.dev
patch subject: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
config: i386-randconfig-141-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210241.E7Q88vvq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602210241.E7Q88vvq-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:18245 bpf_kfunc_is_fastcall() error: buffer overflow 'special_kfunc_list' 64 <= 64

vim +/special_kfunc_list +18245 kernel/bpf/verifier.c

966e89879bbea4 Leon Hwang       2026-02-19  18223  static bool bpf_kfunc_is_fastcall(struct bpf_verifier_env *env, u32 func_id, u32 flags)
966e89879bbea4 Leon Hwang       2026-02-19  18224  {
966e89879bbea4 Leon Hwang       2026-02-19  18225  	if (!(flags & KF_FASTCALL))
966e89879bbea4 Leon Hwang       2026-02-19  18226  		return false;
966e89879bbea4 Leon Hwang       2026-02-19  18227  
966e89879bbea4 Leon Hwang       2026-02-19  18228  	if (!env->prog->jit_requested)
966e89879bbea4 Leon Hwang       2026-02-19  18229  		return true;
966e89879bbea4 Leon Hwang       2026-02-19  18230  
966e89879bbea4 Leon Hwang       2026-02-19  18231  	if (func_id == special_kfunc_list[KF_bpf_clz64])
966e89879bbea4 Leon Hwang       2026-02-19  18232  		return bpf_jit_inlines_kfunc_call(bpf_clz64);
966e89879bbea4 Leon Hwang       2026-02-19  18233  	if (func_id == special_kfunc_list[KF_bpf_ctz64])
966e89879bbea4 Leon Hwang       2026-02-19  18234  		return bpf_jit_inlines_kfunc_call(bpf_ctz64);
966e89879bbea4 Leon Hwang       2026-02-19  18235  	if (func_id == special_kfunc_list[KF_bpf_ffs64])
966e89879bbea4 Leon Hwang       2026-02-19  18236  		return bpf_jit_inlines_kfunc_call(bpf_ffs64);
966e89879bbea4 Leon Hwang       2026-02-19  18237  	if (func_id == special_kfunc_list[KF_bpf_fls64])
966e89879bbea4 Leon Hwang       2026-02-19  18238  		return bpf_jit_inlines_kfunc_call(bpf_fls64);
966e89879bbea4 Leon Hwang       2026-02-19  18239  	if (func_id == special_kfunc_list[KF_bpf_bitrev64])
966e89879bbea4 Leon Hwang       2026-02-19  18240  		return bpf_jit_inlines_kfunc_call(bpf_bitrev64);
966e89879bbea4 Leon Hwang       2026-02-19  18241  	if (func_id == special_kfunc_list[KF_bpf_popcnt64])
966e89879bbea4 Leon Hwang       2026-02-19  18242  		return bpf_jit_inlines_kfunc_call(bpf_popcnt64);
966e89879bbea4 Leon Hwang       2026-02-19  18243  	if (func_id == special_kfunc_list[KF_bpf_rol64])
966e89879bbea4 Leon Hwang       2026-02-19  18244  		return bpf_jit_inlines_kfunc_call(bpf_rol64);
966e89879bbea4 Leon Hwang       2026-02-19 @18245  	if (func_id == special_kfunc_list[KF_bpf_ror64])
                                                                                          ^^^^^^^^^^^^
special_kfunc_list[] has 64 elements and KF_bpf_ror64 is 64 so
this is out of bounds.

966e89879bbea4 Leon Hwang       2026-02-19  18246  		return bpf_jit_inlines_kfunc_call(bpf_ror64);
966e89879bbea4 Leon Hwang       2026-02-19  18247  
966e89879bbea4 Leon Hwang       2026-02-19  18248  	return true;
966e89879bbea4 Leon Hwang       2026-02-19  18249  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


