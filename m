Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822B7F5A8D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 02:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8sfVF5aPV6fheRm7xIg/4vXl2F2m+SYWiTCmFqi/mA=; b=BN6ExfThgxKXdKBebGXKet0uF2
	FmR66LykAfCTVtfMgOfgfdKmog9xPBvKd9r6/sEulqKvksEEFhA+ZAs/S2kmxCtR4d1KBNEnvb4br
	BDHY3/TTE4Owm5Ux+0/M8eqx+qc8z9WsEvsqKp8IHc6i2wfEL9uqEABzNKWjTizxCopRdmsP6p0K+
	ST0lq3E0NaswjpbYX0ET23Hin7jFO6FexwlNeiH6yTya8blBUOJZOBF0PkwnJqPxBdzJkhNN9IGbr
	cBxoGxnh2Q+AyFlKWGjGYnbGwQ2qA/PCyWROQDk0QLu9d74OSlBJ25oMdp7m/7XAdXZ7b/XXwUCB8
	UGT1qJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1Jx-00000007yAm-0L7Y;
	Tue, 21 Apr 2026 02:58:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1Ju-00000007y9T-0NbX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 02:58:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43fe62837baso2223649f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 19:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776740315; cv=none;
        d=google.com; s=arc-20240605;
        b=ERgAXBf2tpggKgFYj1WxLsdC5xYT/lxn6csvAT6Y/6nZaTlr2WfZBLNKdqSSLzSBBv
         tsiBvid+dk/Ha+7N/8fn5/J1p8pg0SoUS1EmeEuz38VeHfUNZRR5wLvM6hldZrFLFNcP
         HhyM297S9DdUJ7q53smq/ZvLVjLl/toTfV5RnYoyOptjxdDQ6Dhv+KqZZ0ZU1XGv0cXU
         n6gtEpTZjtnvg8G2qelZLTCthsS3sXTS5GxhENnzifhpW8bZZROIn+VwR24Hu05165EE
         Jcp+MoLLei36+TuwuFQJMNQ8OOnwMb10kvchvhGpL6c02BQZRYB5ClqDEdQ12MdDUOmQ
         XlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P8sfVF5aPV6fheRm7xIg/4vXl2F2m+SYWiTCmFqi/mA=;
        fh=Vqsz47Sr8aQ+GDoPgNVF4punvLdRfR2qr5ADLYrmwds=;
        b=i9vLX9X27wVERv0ANd89v12w2gH9DrAa/sVNMHBze5f5ie2iRHMKn5MDJoRr3unGnc
         h0Z4DXbJTJbM7qH39H+w+rc9MGQNYUzL9kYLcQzfuflAyezZvckk3lQQQXWNAIDPMNBP
         bpEh25+fKD1yVGCllK2vnJw7NBcWgO3divJ5CEFvtMYZ9YdrWPNgcHQ6i7uzdgfM7R6P
         r456ByaXiTPpdoCTArJ8GtDdDGcRCZsM2xdeb8pzkITo12afvF0mIUhgGMxJCTtxA+TU
         sNE44dDMQ6bgAf1rU9whzDJgLSmJEa7T75V308Od8qAF7c7VD8ROvqt5IfvWY+XAguyY
         v0+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776740315; x=1777345115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8sfVF5aPV6fheRm7xIg/4vXl2F2m+SYWiTCmFqi/mA=;
        b=faMcgOW9jbfvbCUh9NJVVRkxeS0V9y2UALJCHm/LoN+m6UHEW1HlGv2G4Nin6LwMGq
         rmYtItpyVLQ4ANiT5xw9pczvNkKqZItveNUtxiSOlgMhGnXiH48sTqX5XfdTXs2zYFIl
         yNkHRfTBj/vEjjF6fKqkNzebP0Af+znwjquXPyEayk0V6SzJf1lHxQ0Ytz4+gyQX5D9f
         OWHyrhkeP5RzhkltA/Wey4rHs9ZPWUrG64ag+LzBBPQbB+44bsmeVxoZQwXpGcY5FViB
         YUGHy90sZxnvuyEEoR2Qg1RpvcSamKu4uegeIeMoQAPKcv5sJbg/QgiWemwEDP7/oTRq
         iiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776740315; x=1777345115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P8sfVF5aPV6fheRm7xIg/4vXl2F2m+SYWiTCmFqi/mA=;
        b=HwG5B1OkHTbVZTtuLQnclOqke18hQ/n9YGd2Mz+qxdWs5eSN0oOr2dc8gthLvqgMX1
         BLv3uB51kH2sgSAQvHgtr3Gs3X0d/DsP/YmclmaM8kQdTWCuJH0z/j2FKlefavSCDQkr
         WVBhR6fa67cYzf5jAuF19X2WD5WyStKRIZeAcmThy6UIdTCFLeT2/DXPdPibmm++m9Ma
         tdpkzGjYX+BHx28Xqiq4rC3za26siVR9bYwCdDqif1bhHh2Kgxkk8wNERJJrqomb61FL
         jvftmyRi3Hesv0cASO6gwKv61dCwKjOHAtc756oMU8o5n4/YeoU6k68A/e6hDQ1Av/GX
         PRlg==
X-Forwarded-Encrypted: i=1; AFNElJ81FaHidjkq24qHhnb6bRo5txM2kSTh51rZlQLY9JFqSxG/t4woxL6wNZwThHsqqnMVwK0c4Jg3icWb2i7dUwck@lists.infradead.org
X-Gm-Message-State: AOJu0YztecMK319b8E7YTK5BB/KXOuDDtSyAo6U6TKbHqkg6uHbPfIKU
	Pe82OmWPoF0zFSqarxuLhblyO/cMCutpDWfSP4jeQjSTYryQv1O3+n2ebHqHcHRAQS6M1VJv/i6
	5Wi9/RBvKSmhkiuzFsKjOP5pZvFSwVs0=
X-Gm-Gg: AeBDievagOMmVOJUpBR9cgCd7njt1pjJXpjQfcOwc+6MOF1VSdRjzquN4WDDgZh3ZtE
	21+hjtWEB8hUwxuPIm4oKpDskVCePDGqfZG0wqSrOHZ6ZKTO0yp6B2Ji/vlERQf1Uy+Qhz3JCI1
	hdrfezGITr2CeKzXwP89O9tEJThPZ8BqJgEaf0IPhEm9zs4zy8oP+sQmfEAkU/GjXS19qFs4w+y
	FYsTYfBuG0Bd9or+t9G/dfAnuIT1SRnSJT1+Vm1fMUpTJ0+eCIvngZmFpsXP0xXAowjeJjZcl4X
	oFBsYZB9upidBfkkdcNcfxmfl4s+Gq1abgX+1ITu+iDPVnbar2OJfPeOWluGdFnKBvC/zGEs1Wf
	Zx4zJXsgsuhEtFeekMMjzaF75TSnKTPmJOltX
X-Received: by 2002:a05:6000:184d:b0:43c:ef4f:79e4 with SMTP id
 ffacd0b85a97d-43fe3dfd36fmr23883572f8f.37.1776740315197; Mon, 20 Apr 2026
 19:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260420153603.4097618-1-puranjay@kernel.org> <20260420153603.4097618-3-puranjay@kernel.org>
In-Reply-To: <20260420153603.4097618-3-puranjay@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 20 Apr 2026 19:58:23 -0700
X-Gm-Features: AQROBzCFO23TG2U4gu5nFV1RJmSaVXGhq8AqzBuE83zRbtjTmMjwmjL6kTxPejU
Message-ID: <CAADnVQJ_D6XyvMHPr59dxZSgFY3+6UayhcWrDC-U2k-Epv-9eA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] bpf, arm64: Add JIT support for stack arguments
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_195838_146131_86866BDD 
X-CRM114-Status: GOOD (  10.68  )
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

On Mon, Apr 20, 2026 at 8:36=E2=80=AFAM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>

nice and clean. I like how it maps to arm64 calling convention.

> +       if (prog->aux->stack_arg_depth > prog->aux->incoming_stack_arg_de=
pth) {
> +               u16 outgoing =3D prog->aux->stack_arg_depth - prog->aux->=
incoming_stack_arg_depth;
> +               int nr_on_stack =3D outgoing / sizeof(u64) - NR_STACK_ARG=
_REGS;
> +
> +               if (nr_on_stack > 0)
> +                       ctx.stack_arg_size =3D round_up(nr_on_stack * siz=
eof(u64), 16);
> +       }

I'm struggling to understand this part.
Why do this when this func calls more than what callee passed in?
Looks fishy. I'd like to see selftests with more than 6,7,8 args.
Because only then this logic will kick in?

