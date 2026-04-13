Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C27F531CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=; b=a+uaHP3C8jdcGaEblUr9J6NWgN
	XeQF9ELMknqmieq6sRJYSfrUtkfSmyLTfJiu/jYpwgE669DcuPt/+ABzvl8lrqN3OL2DTjQh8IzOi
	cO/wT6KRLwwHsnaVTLCPAfQjGDhff9DMP6S5EU0cAYXaBkk+5VQvlI84LMEvOz/M+Pbl2lI+pbdHc
	KBn+cSELb106QhhFPsc+TAq4+J4qS324lsiTOxeExixqdWTwowuusr0YiWJDl/iaOeDORN7C5ODWX
	qywpmy8+YE4uAYR5798K7XdeLrS/ySPf3LSswpakbjCfLmmvPtXA+W7B7bWE5dqlvHnhJagftukF/
	aD+OOHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPdY-0000000GR51-2emA;
	Mon, 13 Apr 2026 22:20:08 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPdV-0000000GR4f-3pfw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 22:20:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso4994281f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 15:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776118804; cv=none;
        d=google.com; s=arc-20240605;
        b=dBRJh9BcobRyGrwJvlxF7OS1r7OVMQm2UYuA7QVk2dy6eanmuXsNkF2nDlsfpxbgju
         LXN6wduVJqcaGgIi6TF1z4+xpu8Q7sS1etTMgoFBDgFnegJ0yJ8OnlU5aPKQOiDf7EX/
         JiKqNe4kqWSOyyS/75InOtpix/+JyNTEsOG1vZNnh4z04p/3UaofhBm6oaTSGbgCXFy6
         nZy6J7EBmvolomTANoVo1odnNOkXePVXWu5agsejL2ccmst+iizK+vQOkqTpkzI0FWQ+
         jw2/yxw2QmgIrPPcdwLTQLFD4AW4JfQuOJWknTgoAbeICaCmsUUCYd1gwzg5KN5kKF68
         Vv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=;
        fh=vjwocBpOfGC+dmsAWtIf5NKXnHisybtooejxSKoqraY=;
        b=VRSBsORFbFqvvXW2dTwlJcZXxcw0YZkhri9c7b7iLIayAw5yX2hA5dl2HmgIyBNoAe
         QoFcUtaaWbKpTYGPqSZ6uKSmpECYaIatxs1Lbl8TR3T7RkHHDCcU6VUcYWkZISkQ2M1z
         m6gaJIkkyCxorGT+fgfRQBiXhNpGFH/8peZwbneNdrBNivNP1NcNKMoXj3MKpUhJZZGm
         sIiKwMBO5scpSfP2+/P2TiHgrvAytgLzPgtXo1/U8hiPaQXWWadEn3djaV5aMmYjormj
         B63RUZvkvmRmj17s98IRJua4ngP+hxwva/6WSdJjsumD7reNRdbKUnc+u8oUOv7ilTqR
         zgqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118804; x=1776723604; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=;
        b=WIpYyq3MxDkSflVJpewKo2BnW0FEoJbrZaSdCcZZ+rGfvgAzM/CZavBiuNpHa8NaBC
         GzOHghS3AJlxEaC+XY28aLyhMpP2xaj0sqpq5ONq3wPgLx2sCfcTCnTj/HmEQZCnQLIK
         IUc1OiVPs/MCAMbjEm9Aa2Iwd4oZ1ppuVWeYHxFPaNbmnd1jZPICWojeCdBo+vP3pyMU
         c3vB6o776ZykIDutf7xlyQJQnwlRCdw2bwMiti5DC888Y78frtKmIBztd2pbtSv8piVr
         8hXFrEw9lO0q4Kr2EXhstBbIr4+2u9mWG+PYqe+FryekL+WQgm0twCj9Z+bBdgxXVXj9
         QzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118804; x=1776723604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=00dCXJraG3Nz3xP1Zulfjafowes4Ec60LER8Tb820vo=;
        b=WbWdh4l+D6Wy2KI0jqjLeD9RA7WfP1Td+unjv5LQ6AlmS2RWzblOBnZj37zcM0YIS8
         oSjSjnvkiCobYAAzoVWrFK/jzwwK1oq8eMHYXj+JVeeakGUPm5mwUj2AU/Q0UDBlSZfO
         sWM+v56Xr0SKnwJnDUljKQSNKeIFq/0dq8kGIXyKcWbjqGJEbczIscVZJffOzMn2cxf9
         AbdDNrWY7WlSMi/u76gxUyABPrsg+iq1zAo0e40h5aQ6cC1uxrrIk8j5W6i0Zx0foHRg
         +vbT/X/JFRBuJI6jP5HYBykuKqpu9RNJKUdxBrj/lrNPzTYzIh9YSIXQhFiiUJfBMhLC
         fxZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AOT7xsDt8Gb2iV8fDI+HvXTymESnP4BsIbs+HBxb+0gJuWU7T7tdvrikC51GTMTDZh1kUXhyR4LbfBXjuF6+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzPrKHPFe4P/YSrzeCyKDszlvY2KNy2DvHI6HZTkaECWGhka/Gr
	e0FrkV+MOhnyS1Gp5REUIFrFf2Mtpvwn1zO5RF00BPX/w1+dPjRLdhha/0W70aQlBuz6mR+Hll0
	aPwAbW49vmWfG+PfliDAeFHFwoxUbrg0=
X-Gm-Gg: AeBDiesaoY8FsYJDm8SLBCARWzD9AvA6yllozU9nj9W2doGhfAEVUKSuDa/GTQZ4Y/3
	v8h4uhCxMB129jnisKVV4QeUVOYGtUMmR1w+VGyg5Nf1qkYRvsoj9Ny35xw2URUnh/E6IeVkoXQ
	AdP1/sOo3L8rfdF2xMVLSanVCp4BPh4xOx9DofcUJW0R2dKlMzC1n4cM3FjtZ4HXhUvSb76F5Uq
	J0006Jz8w7bzFWPww7eg97y0LoHiTtTuAswjzL3Zxl64A9u7SLfofM8oE3hYbKNCp+qpzbhOGkL
	T9pRdK68V2U2kq3qwooKAV51hTtizBeRRXLOurTR
X-Received: by 2002:a05:6000:2c0a:b0:43d:576e:63 with SMTP id
 ffacd0b85a97d-43d642d363bmr22139849f8f.39.1776118803430; Mon, 13 Apr 2026
 15:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-1-1a5831230821@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 00:19:52 +0200
X-Gm-Features: AQROBzDwNCNsQCHGNuFB9CZ_Z628O1o6wbow_4AViz1wzqVpQC382sCN6eDZsJc
Message-ID: <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_152006_008915_B1954867 
X-CRM114-Status: GOOD (  19.36  )
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

On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> In order to prepare KASAN helpers to be called from the eBPF subsystem
> (to add KASAN instrumentation at runtime when JITing eBPF programs),
> expose the __asan_{load,store}X functions in linux/kasan.h
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
>  include/linux/kasan.h | 13 +++++++++++++
>  mm/kasan/kasan.h      | 10 ----------
>  2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 338a1921a50a..6f580d4a39e4 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -710,4 +710,17 @@ void kasan_non_canonical_hook(unsigned long addr);
>  static inline void kasan_non_canonical_hook(unsigned long addr) { }
>  #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
>
> +#ifdef CONFIG_KASAN_GENERIC
> +void __asan_load1(void *p);
> +void __asan_store1(void *p);
> +void __asan_load2(void *p);
> +void __asan_store2(void *p);
> +void __asan_load4(void *p);
> +void __asan_store4(void *p);
> +void __asan_load8(void *p);
> +void __asan_store8(void *p);
> +void __asan_load16(void *p);
> +void __asan_store16(void *p);
> +#endif /* CONFIG_KASAN_GENERIC */

This looks ugly, let's not do this unless it's really required.

You can just use kasan_check_read/write() instead - these are public
wrappers around the same shadow memory checking functions. And they
also work with the SW_TAGS mode, in case the BPF would want to use
that mode at some point. (For HW_TAGS, we only have kasan_check_byte()
that checks a single byte, but it can be extended in the future if
required to be used by BPF.)



> +
>  #endif /* LINUX_KASAN_H */
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index fc9169a54766..3bfce8eb3135 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -594,16 +594,6 @@ void __asan_handle_no_return(void);
>  void __asan_alloca_poison(void *, ssize_t size);
>  void __asan_allocas_unpoison(void *stack_top, ssize_t stack_bottom);
>
> -void __asan_load1(void *);
> -void __asan_store1(void *);
> -void __asan_load2(void *);
> -void __asan_store2(void *);
> -void __asan_load4(void *);
> -void __asan_store4(void *);
> -void __asan_load8(void *);
> -void __asan_store8(void *);
> -void __asan_load16(void *);
> -void __asan_store16(void *);
>  void __asan_loadN(void *, ssize_t size);
>  void __asan_storeN(void *, ssize_t size);
>
>
> --
> 2.53.0
>

