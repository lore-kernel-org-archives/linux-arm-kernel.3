Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB25DD30CF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGsBnBGnrh5GWqFiAd50Xj6Kf9Z4MbPCxq5OgC98qGU=; b=BBcjqmknjw2HtSDzH48t44nfbk
	1vttHiYFOfaY3v0IYrriUBJ/I3dsfJwh7FHGe2V8EvcT1RFb/pBp2qj3XP/p9sdWSVIgjJU+M3IAt
	j76qjT0QO5NFC7/FTDsPv5iEef3XvrPHLw2HvTyZ36d9SR9Y7aNZB+ptJjuj2kkFnHGAFUT+cAobc
	rwGDOwkV2M2BcH0Ls3HqVhpmaiaIGF/0lb895IUCStImWr3JozR8v24o5SgmObq4aPAQSOcP+tHGQ
	LsgGzMp4WLiLrEwocpOY803hCIWdf+6+BL51taY6Tw/L5GIatJPE/96nXBHxkuV+VwIKCY7GUJvSG
	wzhq0WEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfy0o-00000008l8j-2B3M;
	Wed, 14 Jan 2026 10:22:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfy0m-00000008l85-49Vf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:22:02 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so1273546a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768386118; x=1768990918; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hGsBnBGnrh5GWqFiAd50Xj6Kf9Z4MbPCxq5OgC98qGU=;
        b=lKhSetBUtcpoLHU9ovxKz/KuUlMD1M6SCv0cf5ISUFMs9N4nfUHI+bvFlMc79RvXFA
         OF9MpZH60ETM7v/lwtYg0TqOenGZ38+yOfdnyIaA0hApvSXicmFKlVjqU/PKFQZ6Zk6e
         oiAgwFht9Wsr4zBlxz0txPepjbt7Fqlo7iwbLF1AmLITvK9g4m7p9ExA8BTjF2Z8oohF
         9m47QV9LRxaVwF3izfr8OWtBPF4l8cCy0IsKsVKi2998K+k3Xbr+o6sCwGmwvekuViwD
         KfPuZVhbwXm2jU6uLySQaohK6Fln6M+jy4ZUg4L11EzWE7/KEWY1ptGs2Ec1My4obGog
         0DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386118; x=1768990918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGsBnBGnrh5GWqFiAd50Xj6Kf9Z4MbPCxq5OgC98qGU=;
        b=wRNxcT+U71s2mjCMj9tEYkw3cApzzcdB03wlJwrjPtox3xvWgZdPYT7PTAEnfJXZhI
         2GAWV+s/16buSABlhPHP1QeKvCySaq3tqfG8hthoK8mF1vmauxpDwSvjSFrBqRz/Vl8q
         JxUItIPb5HpgmPxRQ+Dp2VTPKNCivSirzMnHGVRejwOtDutP4Xgad1C5+yzxIinCVux3
         lecirKx4XOu34TfD3egu7lyKwRqwTx5JSAEWRfYGDa8VtAu66Hj9RuHT/LNk8LrHG5gl
         8Y1M4Q5lfngONKoKQm46yxQ6enDpnP8FSd3h5ItJbG5sYXKn7ebioYsCTkk8NQwGcRG9
         BmPg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Q9wt2WwiCHJw+QdMFWywMAmdDyR9fjH/vnhOdvFW4EfXV4AFaAkS1g1hn151XcEW3XhOWSnYZN4+o68iEIBi@lists.infradead.org
X-Gm-Message-State: AOJu0YwyvcEEpAcrixfW6hXMjTwfWPwG+qWXy7S8mgBgL3YP4pzr1qYM
	TvzfgAhg03cJmQk0qBO0X8JkxpBi22wm+xK8si5DvUi3Gf3huGBkspJL
X-Gm-Gg: AY/fxX4qwiWzPNCeMb+LNy8ALaVxEKS7ngr4jrlFN/LascmFFtGqmQ7/bTA+G7m5miM
	zKYRlwVnF17WNcFEK7ek9N0uOSalzKr25JESuwVrmgOygh+mirkK4xDPaC12OevOkldOvViyWpG
	u3GGXsPIPEARQYe7xhTRL0Y++Hfp1Om6XEhNKF76ccKg4eqhOFAfSDFfq6XCF/ObZzEDKnmw5Ad
	9qyoslriN2zzNCjFHopHWIs8kIjNtQI7QrYCRz1QzMiiquwnTbmu5bzlG0sCUE3J1ThnlQgSh7Y
	nY7M8rzBPk5gLCbETbPFytnQu0Xx4mAAeVwC4a1z8as3LFB4t0hueDxQVcQvWQ65KeB7BrJMj4D
	Y3DqF1M1C9Q36saJBcYMIaIB0SLTIHzgfwxgI4x436x84SlZHqofwUyWgeR87qDtwSZY/qw827j
	YsPhQLZlhR9j/7UmlSPcxsOaGMTei7Tg0=
X-Received: by 2002:a05:6402:3487:b0:636:2699:3812 with SMTP id 4fb4d7f45d1cf-653ebedc568mr1854657a12.0.1768386118153;
        Wed, 14 Jan 2026 02:21:58 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5e0sm22281306a12.31.2026.01.14.02.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:21:57 -0800 (PST)
Date: Wed, 14 Jan 2026 10:29:44 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>
Subject: Re: [PATCH bpf-next v4 1/4] bpf: Fix an off-by-one error in
 check_indirect_jump
Message-ID: <aWdwGKLsL7G7IQ3z@mail.gmail.com>
References: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
 <20260114093914.2403982-2-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114093914.2403982-2-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_022201_053851_4E369C07 
X-CRM114-Status: GOOD (  18.82  )
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

On 26/01/14 05:39PM, Xu Kuohai wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
> 
> Fix an off-by-one error in check_indirect_jump() that skips the last
> element returned by copy_insn_array_uniq().
> 
> Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  kernel/bpf/verifier.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index faa1ecc1fe9d..22605d9e0ffa 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -20336,7 +20336,7 @@ static int check_indirect_jump(struct bpf_verifier_env *env, struct bpf_insn *in
>  		return -EINVAL;
>  	}
>  
> -	for (i = 0; i < n - 1; i++) {
> +	for (i = 0; i < n; i++) {
>  		other_branch = push_stack(env, env->gotox_tmp_buf->items[i],
>  					  env->insn_idx, env->cur_state->speculative);
>  		if (IS_ERR(other_branch))
> -- 
> 2.47.3

Nack, the last state doesn't require a push_stack() call, it is
verified directly under this loop. Instead of this patch, just
add another call to mark_indirect_target().

