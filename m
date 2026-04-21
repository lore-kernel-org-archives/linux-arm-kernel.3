Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E7AF8FA7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 13:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlfqCNW/FSeVJzbOG+jGMfxmKYm1QRHmd46Cb7BacKU=; b=SmXIenUVtx7/Rs7IxsLgzH0Alq
	O8YJ8X4Tt4slclx8Ca9w3YE585bJuVJChWoYDjfUYDqOw/6OextgpYr7lZ/Xnn6CgG3XSzdxv3k61
	yqdeb1udkSWVybU/OlT69auvJUsPW4Hb/dNOfZuzW2YZmZ7UZ9IBgDPwMbisgfpuLIN/HKrbcAr/n
	sx8SnWaA5JWzPYDfWw72zEd6MOFz7kydhClsYswOEpo80mlr4F52claqb7G1ZWgiB8tSIsc+ciFzs
	L2X0Skz6EQ/6Dj+jp7sA3qJcYDNx0u9ovpKj2PkHexBN40hxyXy5pLxtT8l1uVES3yV3ogq8HMUTW
	OZbvcipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBYM-00000008hbl-263o;
	Tue, 21 Apr 2026 13:54:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBYJ-00000008hbM-4AcE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 13:54:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43d77f60944so3471906f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 06:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776779650; cv=none;
        d=google.com; s=arc-20240605;
        b=XrsI6GHHR0bqktwkaXdmJkdwOs8qGmMIKPuQRu+6WAxbg8KkaYL9JkzV5VdmCY1T8e
         XKzQepFrmytLasuWj+YEB/HpP3hpFLAVrl7mvuT/3lpWyedqjq9whZLP+kTOojSsRZR0
         ePIGhHDWUb5D1r8G/YPec9ua2elq8GOd1wqbrVuXXj6u/pgt6QfdGx0ds7hoiVMYVJcd
         DdHDhNKU9Hf9K2AxsBy8QEGXErisG9YsrXtss9/ZbbfX7/j22FAg3k5wnx9yNjevPgc8
         sXbjYvsaSRNoxIrZ2EHuEsJMguLtGsvgF3ZxJxhSHYycJrddgLKFgWVcUr2XSqeWARR5
         fVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BlfqCNW/FSeVJzbOG+jGMfxmKYm1QRHmd46Cb7BacKU=;
        fh=4mkOMgP8AH/aza7KyqS+GwLIEispjPgTNZ4QlQcSNGU=;
        b=knDztE//YM5poYR8I2dospREJYUOTPJrWM2dIcYuZmcPVMddN2ZckFBa3F2Cg5oZWQ
         ATBT3eZqJfgt3OvWRKIODJdeLPlt3gkGLZDGgcnAnD/UXfCHCTxsU1V78AbDsHoPMuI2
         r6AppGRvrF0SXgTE9t4cFbvlxkoAJNLC11BWxuUYvUh7q1PTCLV7G5lPBuXs5zD1S1jV
         rRhdBK6T923xh2SLsJuLt3C+JELLsO2QGjSRv7FOzv1r9K72fZOL73Na988nDHyJ1gG+
         NBvQY92KWNZItb3U4EUEkKNLQHeGgxNlv0RYqRiPG9fATt+Ju23/f1VM6EeJz1nsiOzK
         BdPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776779650; x=1777384450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlfqCNW/FSeVJzbOG+jGMfxmKYm1QRHmd46Cb7BacKU=;
        b=lTKFh4ZvBXV3NiDsn1xKd9pyZC2GEY2PzlVYJTC5VQqxx8OxLNBdKnHN74mRNNkSIH
         /jJoDqMosggXq16PQsDQYATxkdoB4YRnJk8fExxPWfjwENqC4ip8w3R45wVCy2RINOWX
         Mewk+kTIdcHHmi3JxcbdrNN76OToegH84Dn2XzIbbunb4SxBep6EI0i8VIPZ57ng1Nto
         elcgSOYK4lcJUk4aYKZ4uUYVkaQMDZMbMuSJoROxb1+nj9qyZICazs09r/ANY8mCfyJQ
         MGOK2xFNpz9zE7GXGUxrkj/rGkTs1/uRfQaVD6FXu0wRlSOYky5AOrMydRGzvihRUKp5
         0FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779650; x=1777384450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BlfqCNW/FSeVJzbOG+jGMfxmKYm1QRHmd46Cb7BacKU=;
        b=BTmlUrjWLHcBIWFso8tAcTMje/g66GKx0t/SOS/tBYPbI0kJ2eso49YU7ZZWKJR2TL
         0kaqijF4n5DX4nxHY/uMu0Pxw1Jufd5U6AlM24DlIXJdZzi+WLtzbhHYJFLyVyUrTYUf
         ixRdmRP9v9VI0dcJ0lti9KHwyCzQJkYXW48aAiUa53MLHgmroN0cn/0/6a5DpWLuHhov
         A3+oHGtG/AOrgvnvz8xmMOz6L+PF8mFozSjJCinQPqel6r17KUuEmx7IQhoGJ2RzjsXk
         hxN8Xk4RZqzMHqCXRxA+BAMQDfHL48BCtLzBK9ows2AyY+FXjrEGbUDG6Bqkah01CDKR
         ZGxA==
X-Forwarded-Encrypted: i=1; AFNElJ/LxhFxup1mtIuYedbqhHFPPA5ZNz6Zy3XsTufsTzIY3o2MB92PZ7m0NINRy8bcd6nxASc9NztgQMuGnREPbNwt@lists.infradead.org
X-Gm-Message-State: AOJu0YywTnaBh2/U3Zjky3mjT1HdnSjht5pLNyOvtln9DyOs9XJN193G
	aGMQh8xB7KGugKQeZyVRBFzgvJDpaVUIcHE/Wdjfjy4aXUNQtTNvWRtfn23vV68VMUjIGXfnrh0
	p7dzxjtoFC1K3gUTHPaNuqMs3nfIqJsw=
X-Gm-Gg: AeBDieuSjBeRaP9hmF3ND3jiPNbnP53OJJ3s9kLCQWxchac5US+34R88pBZ6OodaA5q
	iN+nnLwx9lrEk+jFiiBmcZMuys9rTyhjhqQsCHR3F9WNPyBPdnB5KNfjVnU/BJp+j8B5f3Sdjyv
	199h32FXLXuMkMlZ4fF5DuUidgmoAfIAk3qk8QbYGdCP8VxCZKCredxhbJAxL49HK7+Lhr2pQ3X
	39BD2VVW3Eb0V8etQR5trJZ5Uw1BnK6DGhHATGg7aLWIS/NXnRwe/MNzFLbEUyP/UJYngTMGrlI
	8xpkL3k2890Ls1du+lJrHoAJVgHimOKlZcyCsbh7glYRq/MZrS6aWlmF0CAsrVmRH21Yg7zexVL
	Ku74Mj13GiUWL0wSUKum3FNzCVDzPKMqI+f9o
X-Received: by 2002:a5d:5f82:0:b0:437:711c:8754 with SMTP id
 ffacd0b85a97d-43fe3dc842bmr28527313f8f.7.1776779649652; Tue, 21 Apr 2026
 06:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260420153603.4097618-1-puranjay@kernel.org> <20260420153603.4097618-3-puranjay@kernel.org>
 <CAADnVQJ_D6XyvMHPr59dxZSgFY3+6UayhcWrDC-U2k-Epv-9eA@mail.gmail.com> <CANk7y0gNqm7U_0Kc6ZP9jd19gHKScOaTVDa4yxkxTVDonM0iUA@mail.gmail.com>
In-Reply-To: <CANk7y0gNqm7U_0Kc6ZP9jd19gHKScOaTVDa4yxkxTVDonM0iUA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 21 Apr 2026 06:53:58 -0700
X-Gm-Features: AQROBzDOw5Wnk3onvAJHz6qXwZ-uXC7yQdgyNnhy8J7Zkrt3nHngFVmkI6QtdTk
Message-ID: <CAADnVQ+uNGK_XKwb09d+xHZk_5-RWk=4_ZQTaQP24ej4+Gc8HA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] bpf, arm64: Add JIT support for stack arguments
To: Puranjay Mohan <puranjay12@gmail.com>
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
X-CRM114-CacheID: sfid-20260421_065412_060171_51C3CC9A 
X-CRM114-Status: GOOD (  22.51  )
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

On Tue, Apr 21, 2026 at 4:53=E2=80=AFAM Puranjay Mohan <puranjay12@gmail.co=
m> wrote:
>
> On Tue, Apr 21, 2026 at 3:58=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Apr 20, 2026 at 8:36=E2=80=AFAM Puranjay Mohan <puranjay@kernel=
.org> wrote:
> > >
> >
> > nice and clean. I like how it maps to arm64 calling convention.
> >
> > > +       if (prog->aux->stack_arg_depth > prog->aux->incoming_stack_ar=
g_depth) {
> > > +               u16 outgoing =3D prog->aux->stack_arg_depth - prog->a=
ux->incoming_stack_arg_depth;
> > > +               int nr_on_stack =3D outgoing / sizeof(u64) - NR_STACK=
_ARG_REGS;
> > > +
> > > +               if (nr_on_stack > 0)
> > > +                       ctx.stack_arg_size =3D round_up(nr_on_stack *=
 sizeof(u64), 16);
> > > +       }
> >
> > I'm struggling to understand this part.
> > Why do this when this func calls more than what callee passed in?
> > Looks fishy. I'd like to see selftests with more than 6,7,8 args.
> > Because only then this logic will kick in?
>
> Your confusion stems from the naming of "incoming_stack_arg_depth" and
> "stack_arg_depth" (this should be called total_stack_arg_depth in my
> opinion)
>
> So, if you see fixups.c
>
>                 func[i]->aux->incoming_stack_arg_depth =3D
> env->subprog_info[i].incoming_stack_arg_depth;
>                 func[i]->aux->stack_arg_depth =3D
> env->subprog_info[i].incoming_stack_arg_depth +
>
> env->subprog_info[i].outgoing_stack_arg_depth;
>
> prog->aux->stack_arg_depth doesn't store outgoing stack depth, rather
> it has the sum of both incoming and outgoing, that means if a func
> doesn't call any function with more than 5 arguments but receives more
> than five arguments, incoming_stack_arg_depth will be equal to
> stack_arg_depth.

Ohh. That's indeed all too confusing.
See my response to Yonghong.
I think stack_arg_depth should mean outgoing
and incoming_stack_arg_depth should mean incoming only and
it shouldn't be even used by JIT.
That memory was allocated by caller, so to JIT this callee
the conversion of r11+const is straightforward and no checks necessary.

> if (prog->aux->stack_arg_depth > prog->aux->incoming_stack_arg_depth)
>
> This check is for - "Does this function call any function with more
> than 5 arguments", if yes, is it more than 8? if yes allocate stack
> space, otherwise stack space is not needed because argument 6,7,8 can
> live in arm64 registers.

I think it should really be one check based on stack_arg_depth.

