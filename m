Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AEEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTuXuP+3bZghdz+mkEOJA+9pHpr2ihbN2H3rGh74pds=; b=XAbcm/aXNh9Xfm7koLwOrabTPa
	mQSMDJaSaRqbOA47fZ3vf2pP9+O/G/1Df/qv1CiXxgwn5SZ8RKW+QZt/y8qyugS3zeqSBmQRFiKh+
	BUStKUp4t79SQkeYPRryV7moc/9RTU9cLCzK1I82h/M5VOysOhlj2x5VK3DrKsOkt+CSdTrA0wCaf
	/8Bkqi/GZ1B4s7WA1A8TjRCYwPOdeSoKXgI3TzWlHl5RR3uXc8EDH07rJ9Y7p8LSRoWKcApcOPyA8
	n3feOjDmIi3TmrL8IGMoLkg/gMnG7GMY/Q+qZdYbBb+iVfTEPrrlvtM2xfRrRCiIiI73jqqaczypP
	OshuKdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFNx-00000002vvp-05RB;
	Tue, 22 Jul 2025 15:58:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueE4R-00000002isj-2buO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:34:20 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2357c61cda7so125635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753194858; x=1753799658; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTuXuP+3bZghdz+mkEOJA+9pHpr2ihbN2H3rGh74pds=;
        b=inWUZU308JFMfZANzG/8VnJmzd3TRAt2lVe7uU5Wg8zR9tHOsOxsaclnQz6r2ykWWM
         38xlW8JBUcLiRccUoIDufieeVT//Ksfxu2ZT+dInXPO6gPZYL35yG1qPHrHfrGfBDBJ+
         CWU3C1rmuRtLVffa7kxqFKgb1xW1aHUCzTwOZigw1Z6+9JgTQyLHjQnZuh0b0DqYHy9D
         6LivO4ep4zLMEZxolPzINOqJ/eubWyAyAtnpX+Leg5RifGTpV4Rt4AGmd4kDrO847gxN
         Ay7JITXzWDV881seexfDQtgE17/IJE5uC/uJvtsZkhBsPbodXzRFdFByx1ibAWGMMoUD
         ccvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194858; x=1753799658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTuXuP+3bZghdz+mkEOJA+9pHpr2ihbN2H3rGh74pds=;
        b=l/ZmYsN21UkM3LHxbOK52qUy0/3po1kwy6vWx16oBK5nwMLz7vl7RULG110aRYx9qi
         s4adO+LW2A6yeyaX/y/JmOwGs/AjGZpgJaiehbGCpagNsIfBnJhCcFZ1a53dxrNJdGlX
         pMfn6xchdFbCYtT+Y5wPwpcEXVuJ1a1zB+KYwXIUbDPRGlxLNWDMBzjB+DLAA+kEbGPT
         HEPLLfVKdDiYO22nDgpnku6RY2I6LAAIox9Mj+VnQe3xU/O6LhBUi9eFIW9jnWUUA4pj
         rO3XvNDgnx8nVM7n9Mc7EvCNNYUF/Hc8kCvZKmfwvO0VSFCoSaXlGN4z77DvmIssuJ2N
         CIeA==
X-Forwarded-Encrypted: i=1; AJvYcCXQVIlVy3Sh8RkCWfk1HVWlkSPgRARB2ELFTJ4cXb986F06xe/t23GQFaXFXDsVvnf/G1sGuGChcmC+afFOGO+E@lists.infradead.org
X-Gm-Message-State: AOJu0YzT06y8QZBIfLAfCQu6vGFyV390zYJMG2OntoU7bZOhX7/WqWNg
	XOM2vZWpADdZJ5gIRxY0cSbuXQR3cMVmU2LnNYDFFK5vH6goCgDPlBWyT2a1NdwnCS49h3/U4jk
	cdxWVSyhfjP6NiHnT40hU4BTY9L5TzxZcmdsoT6gj
X-Gm-Gg: ASbGncs7wp8r6eO9vE9AwxuWOqUi1FVwnlUYSHFntEYejecOUbA4Zwd3WVjekC/gZN3
	7Uy+SFgqBMFmVcVQ67tp/XbfDVOM0gfThOSvxQetDfVocqDirALmKoyJBJGv+z3acWjuP19Dj4A
	bhNPrBXVLumQW6ktB/m+6sCkmPpQr3BwxU/NJUmQtUnh8DpYXHPnpl4BO6lVnE0Z/Zn5RDpKfQD
	PDz
X-Google-Smtp-Source: AGHT+IEC0LjPp4D4nb/8yDJGDSW5ow7uyVR9e8P45jSv6/mggQkYh+PG6iWMUWSWD3lY3B0VJst7mPo59OeYvbX8olQ=
X-Received: by 2002:a17:903:19e5:b0:22e:1858:fc25 with SMTP id
 d9443c01a7336-23f8cf87d00mr3114605ad.9.1753194857672; Tue, 22 Jul 2025
 07:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250721202015.3530876-5-samitolvanen@google.com>
 <20250721202015.3530876-8-samitolvanen@google.com> <74bd0822-c8c1-47cc-b816-78036abff8ee@huaweicloud.com>
In-Reply-To: <74bd0822-c8c1-47cc-b816-78036abff8ee@huaweicloud.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 22 Jul 2025 07:33:40 -0700
X-Gm-Features: Ac12FXx5EtR43-0uezus7W46478LtdegGDxxKuOynwE5VCpfViAuraSoEJ6DyfU
Message-ID: <CABCJKucpfQ2nsmo8npc96SAQeQbTJiMcseWA1L-oNEJzF=Hu0g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v12 3/3] arm64/cfi,bpf: Support kCFI + BPF on arm64
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Dao Huang <huangdao1@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_073419_664977_B6E6FC8A 
X-CRM114-Status: GOOD (  16.33  )
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

Hi,

On Mon, Jul 21, 2025 at 8:44=E2=80=AFPM Xu Kuohai <xukuohai@huaweicloud.com=
> wrote:
>
> On 7/22/2025 4:20 AM, Sami Tolvanen wrote:
> > +static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
> > +{
> > +     if (IS_ENABLED(CONFIG_CFI_CLANG))
> > +             emit(hash, ctx);
>
> I guess this won't work on big-endian cpus, since arm64 instructions
> are always stored in little-endian, but data not.

Nice catch! I'll send a new version with your suggested fix.

> > +}
> > +
> >   /*
> >    * Kernel addresses in the vmalloc space use at most 48 bits, and the
> >    * remaining bits are guaranteed to be 0x1. So we can compose the add=
ress
> > @@ -476,7 +483,6 @@ static int build_prologue(struct jit_ctx *ctx, bool=
 ebpf_from_cbpf)
> >       const bool is_main_prog =3D !bpf_is_subprog(prog);
> >       const u8 fp =3D bpf2a64[BPF_REG_FP];
> >       const u8 arena_vm_base =3D bpf2a64[ARENA_VM_START];
> > -     const int idx0 =3D ctx->idx;
> >       int cur_offset;
> >
> >       /*
> > @@ -502,6 +508,9 @@ static int build_prologue(struct jit_ctx *ctx, bool=
 ebpf_from_cbpf)
> >        *
> >        */
> >
> > +     emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx=
);
> > +     const int idx0 =3D ctx->idx;
>
> move the idx0 definition back to its original position to match the
> coding style of the rest of the file?

The const definition needs to happen after emit_kcfi, because we
increment ctx->idx when CFI is enabled.

Sami

