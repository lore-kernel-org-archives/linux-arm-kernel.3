Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03485F4BB9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6JvQdVhQWfInPA/Myzv9RmVQ9qHhQNHo4KQIihmpPM=; b=Amqj383VUlaydWUBsUOzi3lgR2
	WcHRUr9IsXdLAWB4pmgG79Ve2sGjpVM1DwMs/Nw9IZpHbyrlrXtheX3cuqpHUwoBJfawBa/5gkFj5
	Ol7DWg7kP1zA3cHNFha57VSKWC+cN5DY5VQY/izlQdhlu+LDNZ6TnlPmTCtHhjz/1SBaLS2mGP+bm
	XVhAhrMxPFdozBgOGwizhn/IHRPUbIu1D9/aUfwWyjR/I2doUYjMn/10s8nXmVm8+k6am++kUx+/J
	oAscTVyKp0GF6PiffuNClmMzKH7pMSSAp0uq/ieOmqgkZjGNyP5F+pQfyGMW4lIS5WO5bu+rh7ueL
	qaWnDafA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCdl-00000003sVI-09Hp;
	Wed, 25 Feb 2026 11:01:13 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCdi-00000003sUj-2B27
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:01:11 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5069a785ed2so492721cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 03:01:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772017269; cv=none;
        d=google.com; s=arc-20240605;
        b=hBuuEbWibDiVIMZVm5ZwQ0sk++Ub6HsYyONzwmmJ4b62zWXe8Dt3+SXPiNinSoZm7g
         tRdj4/1+TL7yL1+pww1W0ApQhfFCgQFD2D/Z+JpZOkSgiNdKL2HQYTAogDhKvBg4FwFo
         hCIgZlycD4BRcjJKUB+AXn9rNkDL2NXx2IGTPULWn5DdIOD75meQb7JLHc4qiMMyS85w
         +LKGV3eXa4LGLTnVnRJTMezLGHjgto2mi4dioG7FG2gmlStqSwQJxsRMkqwsB1fPQbCv
         rbolP3+wf4mq9w6GQzWKDwEbWIkb2iKW4wXjN+Idd56k2vTTWS9Fl5YqZA5/FsApySAm
         Ww8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h6JvQdVhQWfInPA/Myzv9RmVQ9qHhQNHo4KQIihmpPM=;
        fh=/idDBWds18HOq/Uw3CAFqbJpMmLZHXn4vD9rbKt9iDo=;
        b=LCzGzpdUk4hmwO5kOMyszgFMpbRbW4Lu4Y+eS+5dhobH8bFKmIl1UDBE25B/Od8Wyg
         7j0NQDK6O8RMMYvTvXul5VDgCTShgjFqvm6n9wu17Emphf1X4UeG+6Xnc15iIUlSodqU
         X5EesqrPUq1a2k2Dpv7OpwLUqPF6R9MpLs1HFWlOhxrCDTJgSCrqEHgfvGN10fMFzLet
         BXisxNKAkW1QiqPMAPSKUpnNOlvVXYcRi8oy/sEBDnFSy/fBMIc7KTEImT6rQJLZ/8He
         95JYBWDPYY/gT5CP4sMO1LcZAunnx56/djjIEf15GFbd6MFe8/ex80z3x8S7P9381u4r
         Idtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772017269; x=1772622069; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h6JvQdVhQWfInPA/Myzv9RmVQ9qHhQNHo4KQIihmpPM=;
        b=zXAtsByJvo7k3Gr0Nk664wEGEA70YJnRWFdiXR1w16T/4KLrDmUG5Vk9Xniwu2KL6r
         ncxMyDVpwRZXbdie/Y8J0148P64Kp2zL9fxKRVK3hdwUCSKlGfK8cRSU+mDPqkZTywRt
         zECNr0/2vxUlS50A8qaZ0pUZNcM+eOkml/ZweLVzBXJ3rfC48ofZIUsB685MFdtRfNUd
         e5ZlhRnk/118VtpQ6YHOqHJzBwf7IzE3x1EAi/G8BV8XbeEIgXJ5WcqOQPwfuwlV6pG7
         qjin68t44RyUKz+J3qYb8bzzD17OHuw5W+V6x+bx4PeOyDZHnRaKysRx5DfIqtY7tJ9d
         v4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017269; x=1772622069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6JvQdVhQWfInPA/Myzv9RmVQ9qHhQNHo4KQIihmpPM=;
        b=WkX/Q+dM+ab0wOgl2Mufx931MiqUvwYRC8y0DgVA7UCHDCPZlg1SPBZoZUE/b7uUoK
         D7oI9eMqxrbX497Twn1shyb2Wl+SadWVycAzbz/LbTorHW3EKgHbmGWtgJoYPXeUvAel
         oxqXx1YH16PxHgJVPC5a3DMHz3iymy48g1PkGCCwbQ633BlOMxzQYDGXIl+oQOTrPrvd
         /OJXLoWuP51+IC0jc689OGqB7JgmsJR5YWCnui1HwypEKy9NUTBC7r+1CL/SayjTZ2dh
         JQ2I6a6TQ0j8S9ej3Ry4BcBLGvX/+r7KKKYEIiNdkvpIU7s1+RxvQDLWfoVlWd6FYFTY
         Z59w==
X-Forwarded-Encrypted: i=1; AJvYcCVZcjRxXWerfkc8t7xUuNX0LUcvqqU3795J7JDY2xspa1I9jpmSCn3zrDU5q99OdOwv+AG0OZt0YGLWa1JB0I8g@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm1fw11HjOge5OGAiVuwXWltuanI4cpM51sopwcu32EwJFK8Yy
	Vq9K0VGJ92HPXbhEVAXZ5KLk0x317ybnq4JUmOtrNi/prnr2ZP2anQ3v8HMD4bi7c5RO0j4qfeP
	zwyt4bA0FTucdba2OfPq7aM8RGhpOM12KTE6N+Nwn
X-Gm-Gg: ATEYQzycH0qgxXJxYYbSfmIpbrh2Ml6a2X7diVOQHkBOPXBp+F/GqDP27eJHn1p9x05
	D75e/9D1nWKSSowKeKq3pgEMATneL3I3z0Df0HJadv61SHGi6Wu9rI7eOcm2x3/s/UQxsKSJKxu
	FPxDROKXqv5p9mN+/p7AbPy34gqYGmiCLDfFV77EvW6fbGm0LbByudpaWx5IQ9c8gPJD94kpNU3
	o3mqV9uJxAFbJjq1J1iL9GSmefapd66wAv+UjG4yTeFHi+I0Yalefcuha9ZApEkGCw+mL8VtfAc
	IQr5udDA
X-Received: by 2002:a05:622a:4d48:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-5073c33f79fmr6685251cf.8.1772017268469; Wed, 25 Feb 2026
 03:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20260224093128.1926610-1-tabba@google.com> <c402e95a-26d3-47eb-8249-52ece97989d3@huaweicloud.com>
 <CA+EHjTyXWqnr4Cu_cZyxDCVNCxto9pJN0WS18S_ri824oQhwug@mail.gmail.com> <2d0c6893-d4a5-42bc-a480-55bc669da130@huaweicloud.com>
In-Reply-To: <2d0c6893-d4a5-42bc-a480-55bc669da130@huaweicloud.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 25 Feb 2026 11:00:31 +0000
X-Gm-Features: AaiRm53jgmE7BvI5lAIMDYWme2AOTmQ1Io37wCuBgLmE_qBzXHY0ykNGDt8nNF4
Message-ID: <CA+EHjTwsrmEjG=n1VzucyiCq9ZURj_3QnMLBQZ2Zsj6qwpui5A@mail.gmail.com>
Subject: Re: [PATCH] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Jean-Philippe Brucker <jpb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_030110_624425_D88E62C6 
X-CRM114-Status: GOOD (  33.61  )
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

Hi Xu,

On Wed, 25 Feb 2026 at 09:46, Xu Kuohai <xukuohai@huaweicloud.com> wrote:
>
> On 2/25/2026 5:08 PM, Fuad Tabba wrote:
> > Hi Xu,
> >
> > On Wed, 25 Feb 2026 at 01:43, Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> >>
> >> On 2/24/2026 5:31 PM, Fuad Tabba wrote:
> >>> struct bpf_plt contains a u64 'target' field. The BPF JIT allocator
> >>> was using an alignment of 4 bytes (sizeof(u32)), which could lead
> >>> to the 'target' field being misaligned in the JIT buffer.
> >>>
> >>> Increase the alignment requirement to 8 bytes (sizeof(u64)) in
> >>> bpf_jit_binary_pack_alloc() to guarantee proper alignment for
> >>> struct bpf_plt.
> >>>
> >>> Fixes: b2ad54e1533e9 ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
> >>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>> ---
> >>>    arch/arm64/net/bpf_jit_comp.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> >>> index 356d33c7a4ae..adf84962d579 100644
> >>> --- a/arch/arm64/net/bpf_jit_comp.c
> >>> +++ b/arch/arm64/net/bpf_jit_comp.c
> >>> @@ -2119,7 +2119,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> >>>        extable_offset = round_up(prog_size + PLT_TARGET_SIZE, extable_align);
> >>>        image_size = extable_offset + extable_size;
> >>>        ro_header = bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr,
> >>> -                                           sizeof(u32), &header, &image_ptr,
> >>> +                                           sizeof(u64), &header, &image_ptr,
> >>>                                              jit_fill_hole);
> >>>        if (!ro_header) {
> >>>                prog = orig_prog;
> >>
> >> Good catch. build_plt pads NOP instructions to ensure a 64-bit relative offset for
> >> plt target, but it misses the alignment check for image base itself.
> >>
> >> Acked-by: Xu Kuohai <xukuohai@huaweicloud.com>
> >>
> >> nit: Add check for base alignment in build_plt, or a comment to clarify?
> >
> > Thanks for the having a look and for the Ack.
> >
> > You're right that build_plt() assumes 64-bit alignment when
> > calculating the NOP padding. However, Will pointed out, over-aligning
> > the entire JIT buffer just to satisfy the C standard is somewhat
> > heavy-handed. I didn't actually run into a functional bug. The issue
> > is that UBSAN complains because we violate the standard's alignment
> > rules.
> > I'll dropping the allocator change in favor of marking struct bpf_plt
> > as __packed.
> >
>
> Interesting, I think the plt target should be 64-bit aligned to ensure
> atomic reading on arm64. It can be updated concurrently by WRITE_ONCE
> in the bpf_arch_text_poke function while the ldr instruction in the plt is
> executed. If it is not aligned correctly, the ldr may read a half-old
> half-new value, causing the plt to jump to an invalid destination.

You're right. I missed that target is concurrently updated via
bpf_arch_text_poke() and read by ldr. If target crosses an 8-byte
boundary, we lose the single-copy atomicity guarantee, risking a torn
read. So I guess that this isn't just UBSAN, it could cause real
issues...

> To avoid over-aligning the entire buffer, how about fixing the padding
> method in build_plt to just make the plt target aligned correctly?

I'm not sure about this. If my reading of the code is correct, during
the first JIT pass, ctx->image is NULL. The current padding logic in
build_plt() looks like this:

        /* make sure target is 64-bit aligned */
        if ((ctx->idx + PLT_TARGET_OFFSET / AARCH64_INSN_SIZE) % 2)
            emit(A64_NOP, ctx);

This forces the relative offset of the PLT to be a multiple of 8
bytes. Therefore, it assumes that the base pointer (ctx->image) is
also 8-byte aligned. If the allocator gives us a base pointer that is
only 4-byte aligned, target will end up misaligned.

If we try to make the padding dynamic based on the actual address of
ctx->image, pass 1 (where ctx->image is NULL) and pass 2 (where
ctx->image is allocated) might disagree on the number of NOPs
required. This would cause ctx->idx to diverge between passes,
breaking the size calculations and offset tables.

Given that enforcing 8-byte alignment in bpf_jit_binary_pack_alloc
wastes a maximum of 4 bytes per BPF program, I think my original v1
patch was actually the safest and cleanest way to fix both the UBSAN
warning and the tearing risk.

What do you think? If you agree, I will abandon v2, and resubmit the
original one as v3 with an updated commit message detailing your
observation regarding the atomic read/write requirement.

Thanks,
/fuad

>
> > Thanks again,
> > /fiad
>

