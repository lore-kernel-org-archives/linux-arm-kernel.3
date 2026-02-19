Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F1E9A055
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7HYm9xMVGBBywh4oao6tB7DD0AcczRTLXxlLGbI01c=; b=ihlNLUARjriXt6/WHWXMY9x9Jb
	T7yDeZJWfTfDEZTAgcu2KWrug42rbCgRKJmu9H1lS9QBOAZXssqwTeASaxB+zCsDuq95u+XTHf4Xa
	zcQaeVIXb2ZEk//7KhMQ9854xFyKm5DCtMTV2OBUsLUa1ndV5Fy+/Bqao+U9DbSeIDGgY6+aqU3Ay
	ZysjaZO30w14JyYkBUa0qeaUJS7owBXS7CFPd3W3zgf0ljQFPn1pKnsoK1X0VRPZBuaIWE4EUWqH1
	x7jXHSkp6U+wr7GL5E8oRdnoyGadfgDceqtLwKTP3M6riG+fclTwHZm2/opoH9SZlXjceP59xk+5+
	N3laGG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8AO-0000000Bja2-1vfm;
	Thu, 19 Feb 2026 17:50:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8AM-0000000BjZG-1W2S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:50:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4376acce52eso791497f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 09:50:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771523417; cv=none;
        d=google.com; s=arc-20240605;
        b=DgBy3iq2nfJ5I/UtQT9Xy3Py98K4v/41nRNzpiwF0dEGjZ8qZUmBtvZTg7ckQtGpW+
         Vbh348R48Z2sikDRI64Pie4Sr3d1AzTNxeXBPQf9tpVumUjpxSeNnL/zN/lQpKPPKxqG
         Gj1MKDb76qPe1HwMCGTqwwd4g8/jTMyovVpgeD7rI8zo43Ef8qFKRPnAKoJGqgknnJkN
         tA8UpHjtf+fUBLckJDliq2yGUj4WWAJPx7SLuKuXTd9i1ifw3qFLhhDQ4QLXy829lhq7
         eHir8w2wOXpKMUTOFStM6DgDG4VVOIZxgqO86RBp3ypLZaktfq3E11LBdtoYqoKdUQoT
         i37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J7HYm9xMVGBBywh4oao6tB7DD0AcczRTLXxlLGbI01c=;
        fh=SMCagLOMK0ch+1TOUWWuLbPr42roScGAEyHNzbUZX94=;
        b=a25TtuwNB1b9oN8Etxwylf7wv8FxR3rfnwnT2cBkDzv30gU90d4nDgJGJB2yovXG6b
         188mesrzZfXoAFg6mJyFIMmgBSH7RkdSSb88lxy97y6dTkeHR2I617cDfDUwl1uWeOBW
         bXIU2LYjw8AbBuZnFf8bkDbhdS3u5wKrC0noUpYH8NnMrmlxpASR63ySggxlmC9oKKe+
         sH4egOH8pu1zNBLbD+cTcrqc47mKkg988aQETU82CPRs8D1Wmb1tUmletYPprHL95bE4
         o0KLwoVY0SvQOnLxdWTvNYhg8okC6wYNWFcpOYl8b4ZFPKf5AGjlvQrjn2r4MUqiZB8y
         3ujQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771523417; x=1772128217; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7HYm9xMVGBBywh4oao6tB7DD0AcczRTLXxlLGbI01c=;
        b=EGoPoG6E+L6sM0H4fCTtNVqh8+OqGowz4Rcystg1ZasVSSAvtcvLrIeJ+5VwV+Bxiw
         dmmKl3NnYIRlR/q2KzD9eWhFHHyw2kj/Tpss/njPfZK9NiAd0egWeTuuzIVIhjVQqyAg
         CJnqGS7bXDmUsOTkOA28/o14Egyw1DH5q3ZZ2VazGAEOHa3JFNr1vwbbXkvEvdXdSWLN
         +MMPyo8RqGCNiLBxC5+74m+hJxmwX5mIL1IymqGVTjxt8YwzJmfDclDxyb66WydtD1aB
         cvki7pKtZtL28lt4nidOcIWxbVmdEDsK2oSyxtywp4g7fNVQw0FOV6yZ/yzGzDMkzTLL
         szEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771523417; x=1772128217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J7HYm9xMVGBBywh4oao6tB7DD0AcczRTLXxlLGbI01c=;
        b=Sa+EnJR7qIb5J617ELTVeqsfgFWWLx8JsP97hWg9EztpIRmzaxAct9POYRYWa2r9/E
         Ai4zTXNBex72ygw20KGPnlq+hzXlVXZm39j1X4AKP0zMkOPxy4TWdz7u1OMwkJObj0aB
         bY4g6hJ056HUzj52GnWQ5qe0K5Or+CGh0qtbW9LV96zBTyIcdW3kQ9vSBE2rLbOVJAMy
         VlcV/opfel/dWAUAE+gPmLDbyJitwFC4daS3Zah0RCmsQETemqM/FYJQSWPfly49So9T
         4GV023zql/bXxk1w4SI9q59h38+BJQuimWZsz7OGR5YQAwZNNmtjrLF06sZolYm1rkJC
         i0iA==
X-Forwarded-Encrypted: i=1; AJvYcCV0m4n5GJfK2OMY2HaDh2VpM/FXI44Ck/IG05vijWigYlL6un0KwVnvD/GrdcB0EA1vGh0i1oyMWyXLs66kcQb1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5KJ3bYcEuketXCQVdYMiux7hahFCSkPTqrq011dCuWPaxJsqc
	7gIIyIWs1Sx88qLsGqWnZBqwt/gN9O7NvS54dLUm2BSpwkz9SISsBZoz5tZ99co14dJVMXCoOoZ
	jhp5gs9LRHI0Q/t4VsSTsWQIHGZRIeJ0=
X-Gm-Gg: AZuq6aL+iZVBj+CCmtjLCXaD7AyizuRsAB1m+6hxh5XJLYt6hJ1zLnHSi9uaVst0/03
	I/cr9yKGCDDnCUMZU0wdca2E9wzD53VRI7RiXTkm2C7KMLY/PcYemLbvQrQNkIPgzfKuX/sfe0j
	9gx+pCWReqr6JaMBMzx8rlenugBmTN0rmD562fgHssWukgnu8tX7ApjubSeevsOZUJ2BUypVQWL
	736rU9ZfuKuIbiv0rTVb4YaqWcjL1FFfl5PyY6n+lvHBjbNIGsSkeb46/hStyxiT1Od4dTROT9B
	N2ggoedEImwkXEB9KWSuIX6ZmsGBkApmyWHsXgmpGp+/UoZ6cgeneQu8z8q+L9cXJehymWg5D1c
	IJ9H8P5wp
X-Received: by 2002:a05:6000:40db:b0:436:cea:6165 with SMTP id
 ffacd0b85a97d-43958df4415mr9935730f8f.6.1771523416533; Thu, 19 Feb 2026
 09:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20260219142933.13904-1-leon.hwang@linux.dev> <20260219142933.13904-2-leon.hwang@linux.dev>
In-Reply-To: <20260219142933.13904-2-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 19 Feb 2026 09:50:05 -0800
X-Gm-Features: AaiRm52i-YIC0PVoZrigOcdI1PlDGl9FQnJThWLdjntzeSoTM5oZkoYI1MwTO7Q
Message-ID: <CAADnVQK=5Gb3w_QG4Vq32EfvpqAK_DPwCHtzzt7DzRkJ5_h6JQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Peilin Ye <yepeilin@google.com>, 
	Luis Gerhorst <luis.gerhorst@fau.de>, Viktor Malik <vmalik@redhat.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_095018_421461_27B09E6A 
X-CRM114-Status: UNSURE (   9.11  )
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

On Thu, Feb 19, 2026 at 6:30=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
> +static bool bpf_kfunc_is_fastcall(struct bpf_verifier_env *env, u32 func=
_id, u32 flags)
> +{
> +       if (!(flags & KF_FASTCALL))
> +               return false;
> +
> +       if (!env->prog->jit_requested)
> +               return true;
> +
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_clz64])
> +               return bpf_jit_inlines_kfunc_call(bpf_clz64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_ctz64])
> +               return bpf_jit_inlines_kfunc_call(bpf_ctz64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_ffs64])
> +               return bpf_jit_inlines_kfunc_call(bpf_ffs64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_fls64])
> +               return bpf_jit_inlines_kfunc_call(bpf_fls64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_bitrev64])
> +               return bpf_jit_inlines_kfunc_call(bpf_bitrev64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_popcnt64])
> +               return bpf_jit_inlines_kfunc_call(bpf_popcnt64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_rol64])
> +               return bpf_jit_inlines_kfunc_call(bpf_rol64);
> +       if (func_id =3D=3D special_kfunc_list[KF_bpf_ror64])
> +               return bpf_jit_inlines_kfunc_call(bpf_ror64);

This is too ugly. Find a way to do it differently.

