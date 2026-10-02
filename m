Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D4DCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aluc5VLd/GgszPlfBHVygLWYzMV/6IhocC43q7cYG8Y=; b=wQW5orWgCLy4XaP7wJK160ivjs
	0IBAunB28u9kNMjvx6Xvq+5/cTzJln3j+7/j5GnDdOjGJuiMTwHmkcaiWeDQkLJwHV2amuwJsBKdr
	nWaiQ4pn124ZkSmkG9lM+IGZ+ZoNMA+7CHg8MWpyB71OlGkOOEUWMuFkNPeRVKRpuFt2ngxZ8UkgP
	EpES8mxRNH66RtGxyWU+I1atCuJhcfuHCm7LdI3gj9qdSUnbnpUl4ULGO79o2IWiyXXaEXkL2sj2t
	hTlZgyX6Gs74KhB/PpV9tvoBRD3qnQtFCT+vrTJ0+jiNuAalFZcmAxbdoRUOluKLX9II1Imu5HddZ
	ysRXLQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCagd-0000000BLoh-3MqK;
	Fri, 02 Oct 2026 10:40:19 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCagb-0000000BLnh-0woc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:40:18 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2e3f641442so215242866b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790937615; cv=none;
        d=google.com; s=arc-20260327;
        b=VCqj2BgaRnYJvBKKCROLEbP1GZ2yorqA1xY6y9Uz/dMOAFkvOXWeB62sa/Hnakwq3W
         /ltLfTVBM47atIWzzUBO4hRdx3j3dk/V70eYzMiJjgfVUJS38Ld/8yW3Jf3UzfLY3YEu
         83Us1q+uAQXczIl1n5RxRkc9VffjNfcL8fEDzWhbcDI2IFgk0o16vptX3KDFfHaO0wcg
         u8JyAdT6HCVZWXvmSaTshB9NB0FjDSn7gtUY0xweuQne3aikRISIJdeUrmLQI7hKwrJH
         0aPjFtKE7UK+AfRStqS13BTS3uW97HGZsSDcvukXNzufm1aE3c2LPIJhXyV3oMdH1mao
         /jQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aluc5VLd/GgszPlfBHVygLWYzMV/6IhocC43q7cYG8Y=;
        fh=mDJrUefmIWTo81NXVny95anU7UcZqOLYl46yZmcJQlE=;
        b=hBf5bellLA4fiDfIzZYZsYNT++sL6w7uiFfl0eme0c7sudyWeYeBvU0Xh/yqK/N7uO
         jbOrAjGv4BFj/3D9NvwMxF+mOZsNBi+gfE8CbEY7ZRCBZn6Je9UgBeOU8pOchB3ygAsa
         z737OFyEBwUdfnRu7Km+DkrXyGysU2u7UCnM/di5KL5mfLJnHdOeQnni6FBG0FtI4oIJ
         0GI7UZ8ik1QkgM4fh0z74DD2af50agdEZ0kWxNKNFpvG/CMQEnhOIJCewgQVnGgosvqo
         KeuGWzolqwHAOvehv/kj8Iry4LlqMtMgl4uXLxBbywku0PMuwxTzcvDueoNaJ6ict/qF
         tuaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790937615; x=1791542415; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aluc5VLd/GgszPlfBHVygLWYzMV/6IhocC43q7cYG8Y=;
        b=N2ZBl5LVFCcJkqjZET9JCRIhny8/QM2AM5leWrsjBhmPmZV+Y1ZIHwd44StWmomO7l
         H+4m3pkrZIxQI7V42vrGOMNPome4hSOXFNz/Oqcw+mtTNNULoHOW9CV8bGWA5oXCiAfz
         VOljqFCiUT6Llvup9Y5ZBeO9mhy2J+1adptLdaClwxxFNZp9wFAsS/YadiME8YuD8Gpl
         M0eyoaa1gXKwCDlpb4OxNCaLQrGXIfnYD7lluQgGgvkcTtTXcLZk0JLdaBhTC0NjXRqw
         ZyvTbpaHpw2VLoRx2baAtc4eXWyRw2EK4JKZ38RXSNI77fv0TixPeASnBpIVEnHZUehW
         BZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790937615; x=1791542415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aluc5VLd/GgszPlfBHVygLWYzMV/6IhocC43q7cYG8Y=;
        b=ZHH9WnWIDP2T177sYw43eCSj5Qy5kY3RG8wTKdyAWdNNUMz52UXwiMKo3QhEMlDTMo
         VH0m+4kJHnXLbPWVnfkBQHa7dGGfz1jbVGfANj/5L3WIwMng6OuE6vyX7xa2osr4f/r/
         atXD8tXlxa5Bh7t5bOUoE2DcZKZri3xJn0YLQjDKvDMCPBh6aUrnOO7EHq7w1NM7BCC7
         LDq6SwtFIeLDjW7DgiOZWkTKO9OP/5kFNfZkidEz3GwVwYz2bPOLB/b4aiRuxrMO+lc/
         wHB67dffuiK+utyesgGfI+YeK4wSoosUDHA7Ie/Ca5ObfmqPFZPVjJhvJG3ds0F88ziM
         Vigg==
X-Forwarded-Encrypted: i=1; AKwUvBx2OyjSzBRMEM78+D2UjrLBVsB70hTvRLMHBAcegem1pPLwcsLy0pGO03qDG85qU18rPQD/wY63rbVa9WFj5kSm@lists.infradead.org
X-Gm-Message-State: AFuF++kdhMxCkQH9yRQGl3FYzfDltAb+pHCWyhfr2Yrd0Gpgo/UTDf6j
	kYT61LmgcmmYt2cXpInS/O9pOyoFyOuNZsbH8pvrYs8OQ+XFSbtt/UQDpWQEK4S0ed3ut4uAViK
	Cg+HYSXgFIawAKgw3HGYp8pOZMoS37LE=
X-Gm-Gg: AYBFou15hjdScKSJ6flSWaLrgCYNWOxxjF/NshENzS/B58ZVBCHoMcqmlRVOBqrHlnn
	F5AeS0LTlFeEvXz5WuDS7KwlAA/uHkbGfBkxqufDjbDAzAIfJNlmshlYUvloEScvDwlABUAh5x/
	0wmavLNV89av/Uw2JZCXXquhv2XVOmdD92px0AO+lXnwshpehtkXYNS1sK9WYo6+Rpn169o6I2e
	cq2EcC1fzkHqnlIAsbcIrE/bc3Q/cHBdOl+sPDUJqcDoCauGiIEPY7Jm0lxygZgirtIYPlflsn1
	UckltUUPr29P/GwIz5MQ1Tv5ZBUT2UK1nI6QaKfkR6A3JDV+vEHkUyonvNFYpaKUgbe6loHM
X-Received: by 2002:a17:907:6ea4:b0:c2e:3546:516c with SMTP id
 a640c23a62f3a-c2e4b25913dmr200400366b.43.1790937614670; Fri, 02 Oct 2026
 03:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20261002044050.1277356-1-thepacketgeek@gmail.com>
In-Reply-To: <20261002044050.1277356-1-thepacketgeek@gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 2 Oct 2026 12:40:02 +0200
X-Gm-Features: AclHuK9AVhCdx3zsz00yoixuqBqUrOwteFjJfeQNP6U0nNJc_amJox9UNxz5jVQ
Message-ID: <CANk7y0iNFFyHW5zfTOeX23K+gozOOKgEWWWyG7Uty9Jo+VC-Yg@mail.gmail.com>
Subject: Re: [PATCH] bpf, arm64: Fix text_mutex critical section in bpf_arch_text_poke()
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Breno Leitao <leitao@debian.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_034017_295566_3A2B2211 
X-CRM114-Status: GOOD (  22.42  )
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

On Fri, Oct 2, 2026 at 5:40=E2=80=AFAM Matthew Wood <thepacketgeek@gmail.co=
m> wrote:
>
> Widen the text_mutex critical section in bpf_arch_text_poke() to cover
> the page permission changes made while updating a bpf prog's plt target.
> When a long-jump trampoline is attached to or detached from a bpf prog,
> the plt target at the end of the prog is currently updated before
> text_mutex is taken, by temporarily making the page writable:
>
>         set_memory_rw(page);
>         WRITE_ONCE(plt->target, plt_target);
>         set_memory_ro(page);
>
> Leaving this outside text_mutex assumes the page belongs only to the
> prog being poked, whose pokes are already serialized by its trampoline
> lock. Commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
> management") broke that assumption; it switched the arm64 JIT to the bpf
> prog pack allocator, which packs programs into small chunks of large
> shared allocations, without updating bpf_arch_text_poke(). Since then,
> unrelated progs (and their plts) commonly share a page. Two CPUs
> attaching to or detaching from different target progs in the same page
> hold different trampoline locks, so their permission changes can
> interleave:
>
>         CPU A                           CPU B
>         set_memory_rw(page)
>                                         set_memory_rw(page)
>                                         WRITE_ONCE(plt_B->target, ...)
>                                         set_memory_ro(page)
>         WRITE_ONCE(plt_A->target, ...)  <- permission fault
>
> This was hit on a 64K page arm64 machine:
>
>   Unable to handle kernel write to read-only memory at virtual address ff=
ff80008f46d5f8
>   FSC =3D 0x0f: level 3 permission fault
>   pte=3D00c00200ea5a0783
>   pc : bpf_arch_text_poke+0x214/0x238
>   Call trace:
>    bpf_arch_text_poke+0x214/0x238 (P)
>    __bpf_trampoline_link_prog+0x1c8/0x470
>    bpf_trampoline_link_prog+0x64/0x90
>    bpf_tracing_prog_attach+0x318/0x4a8
>    bpf_raw_tp_link_attach+0x104/0x258
>    bpf_raw_tracepoint_open+0x6c/0x90
>    __sys_bpf+0x134c/0x3e10
>
> Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management=
")
> Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
> ---
>  arch/arm64/net/bpf_jit_comp.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index 475e70653454..66fab0bfd3da 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -3338,12 +3338,20 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_po=
ke_type old_t,
>                  */
>                 plt_target =3D (u64)&dummy_tramp;
>
> +       /* pages of the bpf prog pack are shared between progs, so the
> +        * set_memory_rw()/set_memory_ro() window below must be serialize=
d
> +        * against other pokers too.
> +        */
> +       mutex_lock(&text_mutex);

Thanks for finding this and fixing it.

Reviewed-by: Puranjay Mohan <puranjay@kernel.org>

Alexei,
I am not worried about the comment style, can we merge this?

Thanks,
Puranjay

