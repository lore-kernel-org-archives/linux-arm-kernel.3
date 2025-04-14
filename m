Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA02BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKIv+Ew1hQAFZsKTKMtzV43PXBAkEaoS28OQ89MT8N8=; b=Kz75PZKGua8l8JaS2NPHbtGyPZ
	TbL2rjP0TkdoME7+Rs7/Qm0BtkgQk8CGkgsPx0lB9/Q5HgCoV2GPEGZ0Xb1/l1kdxskRdXJ0SUmFw
	uVIx8jzdpwvdFEocwf8lAfvBJDG48ah/7iyShPYA09FTAds6Fx797CLtLdix0Lb2GY6Yg23uqUspz
	HsEX/5rxoSDZZUjxr29iaf+Fc7JB/dQgsyktVInXZzXvFbJvQKMXkXnHex7JutPYWt6MKrl2cMAMB
	FJLXzikLa3+P9Zo+LpWH2ZJkLduo84H3aTq1HojJ6lMPLXhZbCF5HgWTaVo5dg+2LPGHidmQRY5NA
	OfoB0rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HlO-00000001i3h-1Xna;
	Mon, 14 Apr 2025 11:14:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HcN-00000001efE-1hOA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:04:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so4015675f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 04:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744628686; x=1745233486; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sKIv+Ew1hQAFZsKTKMtzV43PXBAkEaoS28OQ89MT8N8=;
        b=kMYnbt+TF1rw79rgvZkkwUIMADc3FNDOaNt1vp7ASe+xMvOuedZ8I6v6O+FUFrTHTV
         VRlcKX6Ayxi3MzO3FecxjIbSSvmD0CzuPaTR76kqar3O5tuLNc3Sj0opr7InPRsYE7SO
         pMOMO3JHbhZ5c9kOzUbbKQXQkBKALefHJwnjqCKaT8F1fQmfvbZ90hJ/lHQK15xlIH2+
         +w6GMCVgGToPeWSmS7kn9Gn9CBkF8wxbdMXvPiqRZJspwuvYbqdfBtCFW+ZgGfhp0o0i
         atb09O6FCXGIvqhKxKF/jdkPNh7PsQWA2d9PMxH5ytHfkHGjjhVpIF0byrLbyvy6a/4c
         s1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628686; x=1745233486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKIv+Ew1hQAFZsKTKMtzV43PXBAkEaoS28OQ89MT8N8=;
        b=O3/zikeTyJH/xlttsh8YmiVzpTTE1fal0gySBy2LPeGij6ZeSl1TdBPykGV7IznIeY
         /oddOyFEYpn+RHUP2DlBEMr9kF0I6aWhxoXa6WwbQ9IrefXunxlMiJPw/0Iv7fhOZaRW
         g9HxHcvTrZgzTDt55xXL8AmvEY4JCdQpxDLNPj9I5t919g7edMx5AX5TNiUB8AGHNGPf
         bokaav6nSNrGdU3MonCSE+SQwDzO5txrwrgfaS5SCfl2xCopxOzrWmIg0/2M0OXIgQut
         BcBcPYXauagKq2bEEY4AQVAjnZCr+yPTBytF/pHchzNUuUOriZfpqEU1h7zl1gYigd+L
         Q7Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVPXlJq0+T5fzFV/AMWBAlF2KH3QOJkW9HwnbWlf7QrEiWUOHXUtw7QsR0Y3qQYa/mWja+ZtyBFdkxYFkTvzge0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4jAx1v8bEpzmg89kKHPmwRtkZ1SSkYvxz4+ubi1xwdY2ubAH0
	52i7IrBU7F/+YiTAMcEDlxU/P4c13TirSuaE0biO0BD/OkZojSUw
X-Gm-Gg: ASbGncuUHumzcJ6P82labxqIedZRoTa+rGAD1XwYw51ces6oe5r206YCnFj+0jcQTOI
	LcwptvtfL4O+mAWj3EyMgOIIzCNqmL6DyInoNoKNSZu9YSdv59ZewbB5tobhG8J1Sw7rAhMkiMq
	/6RmqSuicJYaWeAkZyj/OLubDbqBxCJPkrBZo5DWYtxo+Ze4kh/vdt/z7R4XmraSquLHFV0BSvN
	HCZupJphsvOuntBSypHDBD1VG5lTRX3ELw6d/P+nb6pqMsgc2U2ulSKShr7MSzar8I6mnhP0bgM
	8zKYqPhuaQGoS787W5BoY02yxIDjqvo=
X-Google-Smtp-Source: AGHT+IGrvwgLQedKQvifH2Jvu4TYIj9/pf5+d/bwg1/VjkLHL4cwxQAuHsTjKrrtJbJPnThtPqVuQg==
X-Received: by 2002:a05:6000:144b:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39eaaed20c4mr9243328f8f.51.1744628685126;
        Mon, 14 Apr 2025 04:04:45 -0700 (PDT)
Received: from krava ([2a00:102a:4007:73e1:1681:405:90b2:869b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9777a0sm10625743f8f.43.2025.04.14.04.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:04:44 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 14 Apr 2025 13:04:41 +0200
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Florent Revest <revest@chromium.org>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	ebpf@linuxfoundation.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
Message-ID: <Z_zryQkfmrSXYN4k@krava>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_040447_447987_6774828B 
X-CRM114-Status: GOOD (  26.78  )
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

On Fri, Apr 11, 2025 at 10:32:10PM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> In order to properly JIT the trampolines needed to attach BPF programs
> to functions, some architectures like ARM64 need to know about the
> alignment needed for the function arguments. Such alignment can
> generally be deduced from the argument size, but that's not completely
> true for composite types. In the specific case of ARM64, the AAPCS64 ABI
> defines that a composite type which needs to be passed through stack
> must be aligned on the maximum between 8 and the largest alignment
> constraint of its first-level members. So the JIT compiler needs more
> information about the arguments to make sure to generate code that
> respects those alignment constraints.
> 
> For struct arguments, add information about the size of the largest
> first-level member in the struct btf_func_model to allow the JIT
> compiler to guess the needed alignment. The information is quite
> specific, but it allows to keep arch-specific concerns (ie: guessing the
> final needed alignment for an argument) isolated in each JIT compiler.
> 
> Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> ---
>  include/linux/bpf.h |  1 +
>  kernel/bpf/btf.c    | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 3f0cc89c0622cb1a097999afb78c17102593b6bb..8b34dcf60a0ce09228ff761b962ab67b6a3e2263 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1106,6 +1106,7 @@ struct btf_func_model {
>  	u8 nr_args;
>  	u8 arg_size[MAX_BPF_FUNC_ARGS];
>  	u8 arg_flags[MAX_BPF_FUNC_ARGS];
> +	u8 arg_largest_member_size[MAX_BPF_FUNC_ARGS];
>  };
>  
>  /* Restore arguments before returning from trampoline to let original function
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 16ba36f34dfab7531babf5753cab9f368cddefa3..5d40911ec90210086a6175d569abb6e52d75ad17 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -7318,6 +7318,29 @@ static int __get_type_size(struct btf *btf, u32 btf_id,
>  	return -EINVAL;
>  }
>  
> +static u8 __get_largest_member_size(struct btf *btf, const struct btf_type *t)
> +{
> +	const struct btf_member *member;
> +	const struct btf_type *mtype;
> +	u8 largest_member_size = 0;
> +	int i;
> +
> +	if (!__btf_type_is_struct(t))
> +		return largest_member_size;
> +
> +	for_each_member(i, t, member) {
> +		mtype = btf_type_by_id(btf, member->type);
> +		while (mtype && btf_type_is_modifier(mtype))
> +			mtype = btf_type_by_id(btf, mtype->type);
> +		if (!mtype)
> +			return -EINVAL;

should we use __get_type_size for member->type instead ?

jirka

> +		if (mtype->size > largest_member_size)
> +			largest_member_size = mtype->size;
> +	}
> +
> +	return largest_member_size;
> +}
> +
>  static u8 __get_type_fmodel_flags(const struct btf_type *t)
>  {
>  	u8 flags = 0;
> @@ -7396,6 +7419,8 @@ int btf_distill_func_proto(struct bpf_verifier_log *log,
>  		}
>  		m->arg_size[i] = ret;
>  		m->arg_flags[i] = __get_type_fmodel_flags(t);
> +		m->arg_largest_member_size[i] =
> +			__get_largest_member_size(btf, t);
>  	}
>  	m->nr_args = nargs;
>  	return 0;
> 
> -- 
> 2.49.0
> 

