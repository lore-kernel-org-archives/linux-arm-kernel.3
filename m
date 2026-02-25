Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7F6EFD210
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tI2iJ1ArOwMQLi1r27+ri+dBH9j4tPIlA/AmAUUgYn8=; b=UOrTc0k+qn6NftCL+aoIeEuUvM
	uh9As+jkc80kJCsRQnpZD67T0qsHv7zErWRyPGzIbbnfg5tekDAbDz4vvdovXWtrXxy2q/Nh6rimc
	9mmr98aAUCP3HjScRGp7H+40yV+cLJS/dE53GwUcHHYoBb04U8wZYzbUr2o1Yi85Ho0bQSoDDdjW/
	epiC3+jlLytS+RT7Z/re3E4u2HyAvmnM/nxtg7Phcx0IQ7B6Okho1IJlS/ftIwcdhTSSQlW743Z42
	xONvIfG1hlLDWD7ux8RZ16rQXHPZxrAhl/o2zOnamgS838XcuSo+4COs3iF44L0wwoePTX8g0oQg8
	DEe8a1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAt2-00000003dm1-3kXQ;
	Wed, 25 Feb 2026 09:08:52 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAt0-00000003dlN-3HWI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:08:51 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-505d3baf1a7so337131cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 01:08:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772010528; cv=none;
        d=google.com; s=arc-20240605;
        b=AGUFP+8Qd7trYFCmnp0XkgvVttrTM917nkqgqwrwBinuJGMRpxTJ1D1zYYYtdpajZZ
         H8DbwnyzjNlpqr2YaPurkdsRte4nHysvt9pK378Rf/JT1tK14GQx55TX4rfUtJSEoHSc
         TqCI3uo2K7+j60PIJPzFsne9/izcnx5rEmwbBFyhVkj5l9cYnPHG27arkOkdoEcpN+cs
         FB8Y1Mu3gPZvql6Tdi6HlJD5NC4w5ncd8sp+WpNBxFvACtF+iVRIfPlA8YJ9pzWVfspv
         vh8sZm2/vWJeg8ij9zR3RvskssWDYfNf7cmyEohYO/quJXY8+HfvdP4k3DFjNFio2t6g
         tY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tI2iJ1ArOwMQLi1r27+ri+dBH9j4tPIlA/AmAUUgYn8=;
        fh=wtXxc8RnPyxkPJV52TmRi8ZQ+DZs873j+ClDTlRnEbg=;
        b=W1wylc0Sw3FfAMh3j30VZ7mSYi4ioztoOAeZyH0JATqWSG2oXp+Y8gYUGdxA4ibTgu
         LJv09oePK6C/IAkgCxF7wLc2YZ1/aoHUQyBZbApIoG4Gmt37YZgYW81LhuE9hzETwDS8
         P2Qum0JBu7On+Ci9DOpIRGNLMubav8XyORsH/ftJ1SDmGqDqm82YDsuICbMCzalzHxBS
         900a+K9nf+JHqxSDF5AjiubGCcr829k/QuDmt4Gn9Ug5uoI/0RJ3ZkcQu4m53UR/TYz0
         rskZ0y6I0ui2cO30QeuWqOmgkwv1DclMpOYFalU9zhtH+k+IWv8GkSS2982kRUvGraxj
         K1pw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772010528; x=1772615328; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tI2iJ1ArOwMQLi1r27+ri+dBH9j4tPIlA/AmAUUgYn8=;
        b=iEbI2JVDg6nruoDN75tRtYNuWB7NJeNY52kLUUNp0hImqwgo63/CBr/DK/Mkfb/pE8
         M8p88XLaT96CpJ3m+pOZHaKO37XM856/OiItT5vKgVyAwHm/aksgOycBD7qG6Q+8EBzs
         0bFpfMnP47hiaGKrD9SDjAaOvWObL3EvUhdhlZgQP4HR2lpOMdwINHS1GJCYK9B3tsI5
         H2dBMdDrowMkR25BteyzQjjvvyZrIVMD9nGccxG/CSTlCKHBGHXTZFWxsivT5Splp99e
         efeGqPIsPHNhu958zNzz8DYlVD/lbpgzvn4JKb6dRfeXNX4yYtWsecG32vcwfFcbnmOc
         Hzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772010528; x=1772615328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI2iJ1ArOwMQLi1r27+ri+dBH9j4tPIlA/AmAUUgYn8=;
        b=Il/JQIPTe6pgUilwvKdy8GIP4YjeIF1PtGLuCyDaJ7T6TuiPoOV0ov4q10u6lyL5XT
         4Y90xQpKZzPOqsB3JMZJOLYh7QnncFtxH+GmjWpBJQ1/KJMowx9Xzrp/jwwic6pOYB8Q
         lZF11pEueiEhYxFqdaChFMjQ8A4qyycvxDWMU1OAf19pk2yJQlas4CaIG0Af96I7ZdQ8
         cBrtKOBQG/pNpdNsaA0Rr/XHuLA9D6jcIvpYMZ8TzK9aAhH9vZVIRLOVJjb+Omc8lv4F
         dbxCPIPDJyO1PidICiJVmRFVHHauF2zIGUDBwRZkQTgRDDe5nNJe3JVCYTlQNYxZCbAj
         AWrw==
X-Forwarded-Encrypted: i=1; AJvYcCUoipRsr1dB4ZTvqT2X1HkmGmgMY6F8nQgZOvspRX13YcVVqsOqbXdtz6RyTIU35/sIgXAcmgWRISW/jH3BHRCJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/3EGrngC53dfkTXFtDHVOnvvYWIYTiCqaRNylm90B79bUu66
	r6jMt9ttwDt4CnAjaaob3vNC2KvcABUBebIkIcoNqll8IzAKi2UtAOlzYT5q1cjwDEGmfaW13WI
	V1d9R15VZXVJwu7uX7yPytHBmhdlL2moh01L5pIEH
X-Gm-Gg: ATEYQzzL/gqZ+mYCsQgdcHvISL9n2r6+xnyJ6VWg2q72cUc6PJ65NO7WROBZ1EBn1F1
	gadnatqDIBxt3JNF+ogiBU9eAEV8dS9xORojUdQUDnRMjgYhMyPqHnPDX125ZQWhDk9aKpHbt9k
	l26vp9HbuIclYx+ZjGA5/LiSjf5EPo800rrVTaLFcOBjwDnPHLMnRH046bBHeaykrLFauWNZ4GR
	miB6H5H8dzNsA+Q2me14f9CQAC6GOrnqDwY7L+xNaBEJ5StrFvo6yeQ/CD2kQ4pop5uJSJannM8
	jsvePWWW
X-Received: by 2002:a05:622a:1a9f:b0:506:9852:75ec with SMTP id
 d75a77b69052e-5073a334f20mr8026821cf.9.1772010527804; Wed, 25 Feb 2026
 01:08:47 -0800 (PST)
MIME-Version: 1.0
References: <20260224093128.1926610-1-tabba@google.com> <c402e95a-26d3-47eb-8249-52ece97989d3@huaweicloud.com>
In-Reply-To: <c402e95a-26d3-47eb-8249-52ece97989d3@huaweicloud.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 25 Feb 2026 09:08:10 +0000
X-Gm-Features: AaiRm510X2gqm2-MN-A22TluFAjjJklw4_yeZOloyf2aIbrtJF9L9Fud9P58kS0
Message-ID: <CA+EHjTyXWqnr4Cu_cZyxDCVNCxto9pJN0WS18S_ri824oQhwug@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260225_010850_839036_1E4CEAAB 
X-CRM114-Status: GOOD (  21.61  )
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

On Wed, 25 Feb 2026 at 01:43, Xu Kuohai <xukuohai@huaweicloud.com> wrote:
>
> On 2/24/2026 5:31 PM, Fuad Tabba wrote:
> > struct bpf_plt contains a u64 'target' field. The BPF JIT allocator
> > was using an alignment of 4 bytes (sizeof(u32)), which could lead
> > to the 'target' field being misaligned in the JIT buffer.
> >
> > Increase the alignment requirement to 8 bytes (sizeof(u64)) in
> > bpf_jit_binary_pack_alloc() to guarantee proper alignment for
> > struct bpf_plt.
> >
> > Fixes: b2ad54e1533e9 ("bpf, arm64: Implement bpf_arch_text_poke() for arm64")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/arm64/net/bpf_jit_comp.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> > index 356d33c7a4ae..adf84962d579 100644
> > --- a/arch/arm64/net/bpf_jit_comp.c
> > +++ b/arch/arm64/net/bpf_jit_comp.c
> > @@ -2119,7 +2119,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> >       extable_offset = round_up(prog_size + PLT_TARGET_SIZE, extable_align);
> >       image_size = extable_offset + extable_size;
> >       ro_header = bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr,
> > -                                           sizeof(u32), &header, &image_ptr,
> > +                                           sizeof(u64), &header, &image_ptr,
> >                                             jit_fill_hole);
> >       if (!ro_header) {
> >               prog = orig_prog;
>
> Good catch. build_plt pads NOP instructions to ensure a 64-bit relative offset for
> plt target, but it misses the alignment check for image base itself.
>
> Acked-by: Xu Kuohai <xukuohai@huaweicloud.com>
>
> nit: Add check for base alignment in build_plt, or a comment to clarify?

Thanks for the having a look and for the Ack.

You're right that build_plt() assumes 64-bit alignment when
calculating the NOP padding. However, Will pointed out, over-aligning
the entire JIT buffer just to satisfy the C standard is somewhat
heavy-handed. I didn't actually run into a functional bug. The issue
is that UBSAN complains because we violate the standard's alignment
rules.
I'll dropping the allocator change in favor of marking struct bpf_plt
as __packed.

Thanks again,
/fiad

