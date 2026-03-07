Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD48FC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 03:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGN1QXrWGfa0Ptbu6IpRr4aZ6XJIz8upZWNXq+g2t9Y=; b=mXInMlaItzQcVj4EhxJsHeuJBw
	En9g489U8Z4y42QffMb5L1LoZvHyVNrq2XK/OqKBgLiSlw4o2W0mBpd1p0oICf8TFKnCxb/ZYLMGB
	vt6qe3h7M0ZZA5GrfDm3CCP8HSb/mvZVofSJi6LVMHkMF9lrVHKCtW/mqpfo/79E76QWapZDqjPpC
	mIeYLeH7Cg2RsCyR1YGn8Kjz+MJDZmYw97pNrI3XSiOGVv7DeyhNTI4ZuykQukXRdVZKFeLG9Ue5v
	mYkNYMGf9QWXpFZnlZ32Swu51ZYFRz64ow9aFF3e1kWsPF3YMg07n1hdNnxD2TKJbY9k4l6nxXB1i
	+0ZzMZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyiOR-00000004r5J-2OdN;
	Sat, 07 Mar 2026 03:31:55 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyiOM-00000004r4x-3Hzi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 03:31:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso87109505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 19:31:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772854309; cv=none;
        d=google.com; s=arc-20240605;
        b=KwavSmMe7DG7equxu7IRVheLQ0dObYdx8FuNsqjYQC12+nlVHvUxhOHoWO1CEBoIyF
         4BYYIIJa0thWhCLhKv+fii6rmYXDWswcim/TH/gkZVqoJsys/3ld6YWMg4pkef8yRNOG
         vzGzDs+4cOegIBTihyP9nr1O3xnmgspCTo+102jz8mZ1YPVr660mLZhvH0yyS24qbIlj
         KzswaXPFwr3gQcAcASCeEbML9RmhhYUomMFr7BFUnUeQ/jodYOhOeA3p6Cmv90Cztire
         s6gg/hgeN54PzSb+hJFQ5wuhmtp3/bm8ObCfGkL8M8WdD8QJqHpfX669V7DRRggwoQqN
         9DXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IGN1QXrWGfa0Ptbu6IpRr4aZ6XJIz8upZWNXq+g2t9Y=;
        fh=ipl+Nr/BHlHyXWOSOL1ZL6lznb5rtccQVg2rjSKVxuE=;
        b=Mn0DPzpNQOn6ouT1mrR3PXqlWid16FJX3aGw+uXUnb7cSOLBemk7uiC43lxdX7HL7j
         gHBvZUJZ0ZmlJJyozJxEKnt5zCNPpNFSw4cpciHMK+ghRmtF5IoBDnN4Ognk+2BrfeSo
         u19HbDoHS/lUbQ7yVq6JWrGrR2mZM06lKzIsDI8p5mW6Tw7rxNawN6OTV8t1Uw/tV0wK
         eBLZ9WRxnLhs20Uxwz4zq5BYrL8pMmRila9/0gvD2QaGhDyilojdG/+EG9DymV72Oiza
         EE7seZMU56izsTcrEEwoYJ+/b/uVG1kjm1ReDZZxeuF4NNgjhkSZ9u07M9eXLaun5A9U
         bY/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772854309; x=1773459109; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGN1QXrWGfa0Ptbu6IpRr4aZ6XJIz8upZWNXq+g2t9Y=;
        b=cTG2r0yKRfM+K8ibTXJd2YcT72c1+m6RrZEAWF21ATogvNkNU43tLnqMqqnJC7ZXjh
         GSeCGE6WCEiNe+SOZJDH7oixPvCAqyGLzPpi320iosKwojIaLe0BCsB8AjVdfxiFZZOQ
         6NVIqkmweYq6q0sxtfqbnwi9kxCoWLGkIMddIWkMPPpXzWPEl+YKECYH9eSn6H6HvwGq
         WDXI91j/BjdKvoU6I0qZJk4NYMuLJwJ6HSlkpsCSrxTM4jElEIgKVE740sqKOdWeJhM0
         uwRwDvWbPYN4i0/jIm2+m0Ztnd+0sXEC3KVK3clNGqwjXKm554bHrHT3sMSBbRqlkwjr
         ++Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772854309; x=1773459109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IGN1QXrWGfa0Ptbu6IpRr4aZ6XJIz8upZWNXq+g2t9Y=;
        b=kk/dK1ayPrPyrTl4mvyhwMWTYvbTDK/efSBKk4YW4NI16fHs0X2UoKWbPFGZbkcZxq
         H7SFk8hG5VrCwFlWxGEyk9rtI9vn4sFrYkX/CXV859QhXD3kYou7SUInssiVN0cxET4b
         EYNNus8vY0LNfR06mGYrp+9VfdHuG6hlmfpPIRnJm4/yq/RD9MUGCC6+WXIUrqJcaLqL
         w3nXug9So5DHzXjVxwRzrO+T8EcZiJapZEHCjEBlvetANHdAkFgAYVQpPPe8FMQfSWB0
         ThV4E+RXY1ZTL9RqvlV/OC1HirKYFq+cKK1xeT3OTbnuWvqUqSjiS9QLH6lIQME/a03K
         ZHhw==
X-Forwarded-Encrypted: i=1; AJvYcCX3i8G0bWj0DXT/xQcSoIne1cnphjIsHbpqGLU4zCW4stFxluUpaUdoaz+eFjxUvZbWflOsXL1YhAhbkLYEjzcc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2toNmhdMu0KqrjJoZQ4NhWiOS8s8L6wUI3lek9R3Eg8kRAp1V
	GwhA6zbnXCKx7vtIN8CeI65zavloZAM6DaQ77bTYXCjHClbql0tkBIfpkHDPaKe5Zb0vs30tI3X
	vf+dkcGfvlpeovESBCjEAY6kaB5qZ5E0=
X-Gm-Gg: ATEYQzw9pYfX39sxl4pYsOiMDDIvI3tgNwonhdXMUuPdh+tWfLl4Oilff63Kp5rIevI
	mYp/BqMCKBNKJ6jkSrRMQH6e1dJL8Ae1huRuz70G/3u2mB+9QdTPh3g/mPBPOcjxlAAgwg9i583
	VdHWQGM5MunMKkR/4UkH2e3/t3LgCa4Bhi2ngacAml8JpcNI/5CoEg7P7Sf1f7Dh5Ek48RdNNdA
	9Uhxk+GTF2Xmew7rt3WFq3+5PPKE/PGc2GVdrfGCYpUokfUc0IKVAagc9HZ+VeGbHLwC83njFK0
	TBSCwlWTgRXdR+CsDRSLHJ7zwjbn7v40eOt6gUXTbl+MMexFXyqbtUT+Ik+TDky8Hd85avmJN/n
	AsRsFqT1CQNDtTdfz50WPzJLTtA==
X-Received: by 2002:a05:600c:4f49:b0:47e:e970:b4e4 with SMTP id
 5b1f17b1804b1-4852696bfa7mr77938455e9.29.1772854308434; Fri, 06 Mar 2026
 19:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20260306102329.2056216-1-xukuohai@huaweicloud.com>
 <20260306102329.2056216-5-xukuohai@huaweicloud.com> <c79adbee77ba5ce11d3df1ffa922c48937c8b536.camel@gmail.com>
 <e497dbd2-4f8e-45c2-b227-1bf0634dd924@huaweicloud.com>
In-Reply-To: <e497dbd2-4f8e-45c2-b227-1bf0634dd924@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 6 Mar 2026 19:31:37 -0800
X-Gm-Features: AaiRm51L1KzVFyWBJNAti2LDkU1NC2b9xI_FNBZP_bxzn6yE9UJLt1vHg2IL8LQ
Message-ID: <CAADnVQ+EoVfSHwX_ni9krTEk7bvDZLfrzuCKEy46ZrASDBn-DA@mail.gmail.com>
Subject: Re: [bpf-next v6 4/5] bpf, x86: Emit ENDBR for indirect jump targets
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>, 
	Shahab Vahedi <list+bpf@vahedi.org>, Russell King <linux@armlinux.org.uk>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Johan Almbladh <johan.almbladh@anyfinetworks.com>, Paul Burton <paulburton@kernel.org>, 
	Hari Bathini <hbathini@linux.ibm.com>, Christophe Leroy <chleroy@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	"David S . Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_193151_974623_A5940D8A 
X-CRM114-Status: GOOD (  31.70  )
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

On Fri, Mar 6, 2026 at 7:15=E2=80=AFPM Xu Kuohai <xukuohai@huaweicloud.com>=
 wrote:
>
> On 3/7/2026 9:36 AM, Eduard Zingerman wrote:
> > On Fri, 2026-03-06 at 18:23 +0800, Xu Kuohai wrote:
> >> From: Xu Kuohai <xukuohai@huawei.com>
> >>
> >> On CPUs that support CET/IBT, the indirect jump selftest triggers
> >> a kernel panic because the indirect jump targets lack ENDBR
> >> instructions.
> >>
> >> To fix it, emit an ENDBR instruction to each indirect jump target. Sin=
ce
> >> the ENDBR instruction shifts the position of original jited instructio=
ns,
> >> fix the instruction address calculation wherever the addresses are use=
d.
> >>
> >> For reference, below is a sample panic log.
> >>
> >>   Missing ENDBR: bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
> >>   ------------[ cut here ]------------
> >>   kernel BUG at arch/x86/kernel/cet.c:133!
> >>   Oops: invalid opcode: 0000 [#1] SMP NOPTI
> >>
> >>   ...
> >>
> >>    ? 0xffffffffc00fb258
> >>    ? bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
> >>    bpf_prog_test_run_syscall+0x110/0x2f0
> >>    ? fdget+0xba/0xe0
> >>    __sys_bpf+0xe4b/0x2590
> >>    ? __kmalloc_node_track_caller_noprof+0x1c7/0x680
> >>    ? bpf_prog_test_run_syscall+0x215/0x2f0
> >>    __x64_sys_bpf+0x21/0x30
> >>    do_syscall_64+0x85/0x620
> >>    ? bpf_prog_test_run_syscall+0x1e2/0x2f0
> >>
> >> Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
> >> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> >> ---
> >>   arch/x86/net/bpf_jit_comp.c | 23 +++++++++++++++--------
> >>   1 file changed, 15 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> >> index 2c57ee446fc9..752331a64fc0 100644
> >> --- a/arch/x86/net/bpf_jit_comp.c
> >> +++ b/arch/x86/net/bpf_jit_comp.c
> >> @@ -1658,8 +1658,8 @@ static int emit_spectre_bhb_barrier(u8 **pprog, =
u8 *ip,
> >>      return 0;
> >>   }
> >>
> >> -static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u=
8 *rw_image,
> >> -              int oldproglen, struct jit_context *ctx, bool jmp_paddi=
ng)
> >> +static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_=
prog, int *addrs, u8 *image,
> >> +              u8 *rw_image, int oldproglen, struct jit_context *ctx, =
bool jmp_padding)
> >>   {
> >>      bool tail_call_reachable =3D bpf_prog->aux->tail_call_reachable;
> >>      struct bpf_insn *insn =3D bpf_prog->insnsi;
> >> @@ -1743,6 +1743,11 @@ static int do_jit(struct bpf_prog *bpf_prog, in=
t *addrs, u8 *image, u8 *rw_image
> >>                              dst_reg =3D X86_REG_R9;
> >>              }
> >>
> >> +#ifdef CONFIG_X86_KERNEL_IBT
> >> +            if (bpf_insn_is_indirect_target(env, bpf_prog, i - 1))
> >> +                    EMIT_ENDBR();
> >> +#endif
> >> +
> >>              switch (insn->code) {
> >>                      /* ALU */
> >>              case BPF_ALU | BPF_ADD | BPF_X:
> >> @@ -2449,7 +2454,7 @@ st:                    if (is_imm8(insn->off))
> >>
> >>                      /* call */
> >>              case BPF_JMP | BPF_CALL: {
> >> -                    u8 *ip =3D image + addrs[i - 1];
> >> +                    u8 *ip =3D image + addrs[i - 1] + (prog - temp);
> >
> > Sorry, meant to reply to v5 but got distracted.
> > It seems tedious/error prone to have this addend at each location,
> > would it be possible to move the 'ip' variable calculation outside
> > of the switch? It appears that at each point there would be no
> > EMIT invocations between 'ip' computation and usage.
> >
>
> Besides the changes shown in this patch, there is another line in the
> file computing address using 'image + addrs[i - 1] + (prog - temp)'.
>
> It is at the call to emit_return() in the 'BPF_JMP | BPF_EXIT' case.
> But there are indeed EMIT*() invocations before the address copmutation,
> so a pre-computed address before the switch statement is stale in
> this case.
>
> To fix this, how about introducing a macro for the address computation,
> as the following diff (based on this patch) shows:
>
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -1606,6 +1606,8 @@ static void emit_priv_frame_ptr(u8 **pprog, void __=
percpu *priv_frame_ptr)
>
>   #define INSN_SZ_DIFF (((addrs[i] - addrs[i - 1]) - (prog - temp)))
>
> +#define CURR_IP      (image + addrs[i - 1] + (prog - temp))
> +

No. Don't obfuscate it with macro.
I don't like INSN_SZ_DIFF either.

