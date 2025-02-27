Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76032C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 02:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKgnaqO1THtjCOxWh4A+wQIkk3mMpJl1DZhYW099CWc=; b=fNUkxFj7K/e0+5xi7cUKhjwyHw
	8eOCvL4tCrn1FYT4aUO3ztQgjEasB5TBlh4t6AI3eUvzcQ04Glu0pB6vR8KEMTSgW48oWoh5mZNDo
	IyaHtN/Tjxbh9fIYMuq9P9XC/uzV4GAQUk3brGG0jikb1ztWrwcpHNxF2Eddv8pWB/p745JMvaWcl
	hsUMkRhZoJqQmUK49HYMKK39PX65tGMgcKzIGGtcTOOhDlSIEc3JDtJBn6v6OYLJdkeEr/kfvZ8UI
	kqqSN82bn934MRhoWl2bqrYJG1nHs5+eUhoRfIrYUxbfbxBxQrzXg1TkQPxZ76nF3XuuA9RR1NJx9
	gH4+ZU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnTVu-000000064p7-0Fss;
	Thu, 27 Feb 2025 02:20:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnTUL-0000000643N-0lmY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 02:19:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f6475f747so163342f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 18:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740622739; x=1741227539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKgnaqO1THtjCOxWh4A+wQIkk3mMpJl1DZhYW099CWc=;
        b=OuPTiJYrCDaPoHLULzyK5tRBy812+z84ZJC7dc0FEHkU5eO3gBrE5H03o2x6Xw1A4t
         A1NjOAIzOzue2rTmmdR+aZI45MpTD3gUMuLpnFW0kIR0SuWcjDL9RWQdpUfdTeHkb3kQ
         emZFih+EFb7L0iRIasBI53WgTiVy55LZcdmPCXcamIEJXWu5pQI+G14HxrBJFtErIIzo
         EhWr20cHrez7AqjYhFMJ3P120g65GB6CpSdRgJy3VXpIBnnQWW9/jqM4jyCP53sW/5u8
         Pkjg5jEzToDD0RnAWxiShkfX7uIDm96qogTIKHHlJAhuZMdbIYCzRippy2ENLeiNiLu3
         IpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622739; x=1741227539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKgnaqO1THtjCOxWh4A+wQIkk3mMpJl1DZhYW099CWc=;
        b=vbCCCY2m6ZpTUJFlwM9GdFBrazsZEA/wUdJHzFK3WE1Se5NucnZnYDwXIaS94rtiAh
         73nUFsZ1Rd3ItNmHn9ZzlNRd0s+YyMz4AEySeFJ5oCkGUXpoOq00goQw6H/PVHpIkBQz
         Q15qk6HhhOXPdXyo1dVH1ZKdvHP3Ba1qhA7RM2M6GR9MhW4qjCZORBE4JSMCYOpURYj0
         yWO03QirJCcJlLquxT4szkyQ93TyfZ637h5UgPTTjpMcNNBermw4F5sYL/g0UPQPTthF
         H/Hw9PgYvEs8i1GFZeInG9GJcfr46di43rotv4vWtE3Bb2sa8bC2j0it5V9ziwQn+D5y
         LxFw==
X-Forwarded-Encrypted: i=1; AJvYcCXjEqql0b3BXxaBKYX6QdBdb5SOOcvx8EdUAXQlO4Ekz285aW5mckhE4Sj2u0fsMKUTYFXkUKtEihCciN4fy76G@lists.infradead.org
X-Gm-Message-State: AOJu0YxS8Pa5aOMgaa2Lw7EUUlx1swvnVtEcQZ4pBSfllbNDJdDpNxOl
	fsneMsFO8HtjycZuU5k6bAm416SFhVkaoH+g/I06DGth1VgvyG6CnBAb+wf9tFLIx62e8xZh66b
	34y6+QnrfxAN+rS4qO/cenzll5sY=
X-Gm-Gg: ASbGncuonwCyuZ0fiLP6gZZ6JWE+PsAj1Ym6S6kG7+FGa5SN5hw9s8PzEDoE5BlrYOf
	PRXGSZQ2lCA66xiO6RWOERbgKkFzwBGw2Yi0DrUgkev6PwSLGjPjVKQMbc//n4Na3kC4gyff76r
	wfqo8SxwRrlbjxeOQNaaHaut8=
X-Google-Smtp-Source: AGHT+IFj9lP3GWA+vKa3jAcVVxBcG8NT2uVfgsPyo0nWKDEklwxzkOv8eMk1aaXCnVCJDi5nTjn07mT717GUMuR0kVg=
X-Received: by 2002:a5d:47ac:0:b0:38f:516b:5429 with SMTP id
 ffacd0b85a97d-38f6e96738amr24102168f8f.25.1740622739040; Wed, 26 Feb 2025
 18:18:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1740009184.git.yepeilin@google.com> <e2d7bfc155a26305a3024aaa102a3acfa693e565.1740009184.git.yepeilin@google.com>
In-Reply-To: <e2d7bfc155a26305a3024aaa102a3acfa693e565.1740009184.git.yepeilin@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 26 Feb 2025 18:18:47 -0800
X-Gm-Features: AQ5f1Jq1Bqzfu5XLxkx0XrckAoOp2Oka7xkENl-fqAWdeylPPR2SlLu-E196h-E
Message-ID: <CAADnVQKEcof-WBBj_W=GpsP0Tjm8hyxeWc06243ZBR7_Ua0Gfg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/9] bpf: Introduce load-acquire and
 store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf@ietf.org, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_181901_223887_1E45836B 
X-CRM114-Status: GOOD (  15.82  )
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

On Wed, Feb 19, 2025 at 5:21=E2=80=AFPM Peilin Ye <yepeilin@google.com> wro=
te:
>
>
> In arch/{arm64,s390,x86}/net/bpf_jit_comp.c, have
> bpf_jit_supports_insn(..., /*in_arena=3D*/true) return false for the new
> instructions, until the corresponding JIT compiler supports them.

...

> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index a43fc5af973d..f0c31c940fb8 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -3771,8 +3771,12 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, =
bool in_arena)
>         if (!in_arena)
>                 return true;
>         switch (insn->code) {
> +       case BPF_STX | BPF_ATOMIC | BPF_B:
> +       case BPF_STX | BPF_ATOMIC | BPF_H:
>         case BPF_STX | BPF_ATOMIC | BPF_W:
>         case BPF_STX | BPF_ATOMIC | BPF_DW:
> +               if (bpf_atomic_is_load_store(insn))
> +                       return false;
>                 if (insn->imm =3D=3D (BPF_AND | BPF_FETCH) ||
>                     insn->imm =3D=3D (BPF_OR | BPF_FETCH) ||
>                     insn->imm =3D=3D (BPF_XOR | BPF_FETCH))

It's border line ok-ish to delay arena ld_acq/st_rel on x86 for a follow up=
,
but non-arena on x86 should be done in this patch.
It's trivial to add support on x86-64 and
limiting the selftest to:
.. defined(__TARGET_ARCH_arm64)
is just not right.

Even arena ld_acq/st_rel can be done in this patch too.
It is such a minor addition compared to the rest, so I don't see
a reason not to do it right away.

pw-bot: cr

