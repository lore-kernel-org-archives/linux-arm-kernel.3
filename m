Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6971F436B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg0oN2epaXQKUu/xYYA2kKCLuyd4Q+xRX1V2ixVtkTw=; b=AvIP78FWnj3XrPhggR66n+MXzM
	ed/UFtqReqb7Z0o5VueYl+5q8TdS9u6stjuedqizdmt7i1am3lJvnCxEOmqtnY3t3APYgDJIH4vQd
	rBZor6i+ZcEnyw1IQRip4psfMdQ6jxaNGwSDsP99QevkHiVJukCFlYDyuBqzBVdP+kCpkon9v/PN3
	3Oa6qY3wZtv3Iy8m14hJyT9FsS6PCmqlQwqzbiEAfMHYDtmtd+O6i9n4AX6So8qG+qoDEvCKOjHnm
	ywBI2nTZBoXacvi7KazUhoEnLNKJJbKWBnWCV6F4zjNeLBZAxplmXMkAEhneqTkJYeYi16B05mNZr
	paNpYwFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlrc-00000004Fpy-3qQS;
	Fri, 17 Apr 2026 16:16:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlra-00000004FpR-0Iex
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 16:16:15 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-671fe205535so1652181a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 09:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776442572; cv=none;
        d=google.com; s=arc-20240605;
        b=FV+bAHQCWw2JmcK62F5mL2lz7mJrdk1Sr+RLnrVepCvOt5IgHjjkB1rm7zUUzr5gS2
         Z3VAq9K1Z+FYsrM9WRpkfIhW9SXMace/DUeQcBv+hdoosyeqrYXRK5lst5G6h5JUHTkQ
         6223Up+b/aryWSpR1gpd1AGVYLaRXDCUk/ybEgCM2sAUCMYMKCjKzonPX6aigRnXyLoh
         3IjT4c6G4E33CVSDP8VOIaFQsgYdb3wZd8dpbov69CVXj0JdyWmRjY+oVcGb3bJFlHPf
         iUfY2MdwxDqlee9yDu2l9CRKVMIATBXb1t5fngATpsDe9tzTwjFu6abxohVvNBLBFQ/i
         hc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rg0oN2epaXQKUu/xYYA2kKCLuyd4Q+xRX1V2ixVtkTw=;
        fh=iAIhx3dwrjBLFmzT7d1ALJou1zWbd46mNJSjI7g1cVQ=;
        b=eATZjLBFmijoabXBy3E1uGaC/OH37ULZ0ytvl7QuHOKKHMG3x88OszPmlIIV0OJjxm
         3HaNYeu2vi7JCNTlf3RzDERR1JBGYGQPs4gsUeTaatPbDnKG3bu2VdHwhVBFqbnN+vjA
         x/UFXkjgLDBq2i/zjJ9PJ+W4F5GqAPZjxkNwxKCX6GGfkdrX6tu0LabDuyAxaAQuSZ2h
         b2uwm6DKBfJYqd2v+RrBJlS609KM4zO/WtQ+IIl8FKqRpNkjwCb9TO7WJNlbrRrbBt06
         uE/jNegduadbjROk08pHeAMs+FIPXRrEjGO2O3QNetubLql51b3TXeZAQSq+cmkfvejJ
         PcrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776442572; x=1777047372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg0oN2epaXQKUu/xYYA2kKCLuyd4Q+xRX1V2ixVtkTw=;
        b=SPwVQcGS1TExDyIMXZMWogQf7H7KBRdqfwlYJOqv31QVwWyD6CHN25gcHaO8POIZR5
         DvVQKGoG+h9EXmODSv9qf2dJbhMnd0hdRhWMl1tZGHT9OfL+Jz93em6wg9Y1ESmcshch
         XlY6gHb77AiOdBdqw/mmnxZjHoLsP2ihYzR2ca3gfs8xM5FUmrQipVL7SX7RRgn0spVa
         TsVcxvlwotZm6gRjVWXu8YwDKnNPB4DgQoZHTU1CkFDj2f1OSPXQtm3yw91HKof7WdQy
         HCTLXGwwRqEws3XOFt1YAXh4hr7zmhor1vX3mrRTlMeX7H7Lp9chRkuO40gpOXjI5lOU
         +GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776442572; x=1777047372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rg0oN2epaXQKUu/xYYA2kKCLuyd4Q+xRX1V2ixVtkTw=;
        b=GAgqQWz3XHQmFiwApy2YD4CTB1Z25tlZbtZvsnPaSudkBdvx+F0SIcRu+79iCz2NsE
         v44cyrVLOFMGaiMA9V1w2xrezbxUNwVViEmy6W979U7JO0b/rLtR5YzDffn93ceQoGrJ
         6v+eU4Q8YENJTiKMt0ypGA60+nkV88cRVkuNrRlQ6m8jLgWCttN7J+coHJAEVpapDB8s
         vwZvOPsI36HON/wEjvR0bw/nvDn2b0wvoCom9cMnV1ovXJ3ngbTDPUm1VNmjtKr/oKEr
         3WhS4YGwASWLuxxZ1DyBybMiTqhve+s1769f0Mj0KGuPBGxrnBSGzS0n3sZiV//NYs53
         1Hfg==
X-Forwarded-Encrypted: i=1; AFNElJ8+3r3BqvRVBuraK61TCH+VPDSIoHq54IXFl6zu+Rccmb0c0eQpPmDZGZDRfCcLhzu8ZuSKSFKqj928flnebTDM@lists.infradead.org
X-Gm-Message-State: AOJu0YyZneS1ZZEUPcccv6ODIV6KFj5s7x2Xb54MwUq9kHcNouK+lyYi
	8nY3yPv2p4e6Dlv4rJv/tv2RVTdD5O0/SNRJJpvamHyKA2NXtoMyXlRVec/g+GYtkMSbhUO2xW9
	skPNYS/3paxir5MnsjPyh9cFxUibmVY2avIgl7To=
X-Gm-Gg: AeBDiev5jhwPvvOepiWDp56HknOw9JqXEpNfIByIh4H1tKMweGNKbVpSPbWnT8LKttg
	rZyPkcAafadZUzzGGe/V9Op5tLMfE7MGqXXg2TiGrSTyq/AhS2qyd47CT+9uMBPgLnMCr52wJtL
	YzfZl1nldTbzIvIDIol4GIP65CUpyz5iEzto/Z03MEwyMi9+yComdD90t61fKT34SWsFzIQS/n+
	T0lLdjuru4cvyrPSGCrXsG4NrElFUhitLImKD7W7lLEiDQWOhGq6nJTjRf+HcZjtweyh5QpIPnQ
	bspVw2/Bdpw4UHIaL/4yHIfCuXjiCQB6EA==
X-Received: by 2002:a05:6402:e9a:b0:66e:5662:2121 with SMTP id
 4fb4d7f45d1cf-672bfd97db0mr1561945a12.7.1776442571826; Fri, 17 Apr 2026
 09:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260417143353.838911-1-puranjay@kernel.org> <DHVJQQK6L83L.13DDK8BJXQFXG@etsalapatis.com>
In-Reply-To: <DHVJQQK6L83L.13DDK8BJXQFXG@etsalapatis.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 17 Apr 2026 17:15:58 +0100
X-Gm-Features: AQROBzBjCH6yI4luRGFxAmDN4mPMah_9N3qt_y4EIPs50-Y3lY9b84xdqDfp8KM
Message-ID: <CANk7y0iuchsy56KFAjhKMghH4M5D7d57o3b4anNHTmD_am79WA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] arm32, bpf: Reject BPF-to-BPF calls and
 callbacks in the JIT
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Jonas Rebmann <jre@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_091614_139669_D3BC6793 
X-CRM114-Status: GOOD (  24.46  )
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

On Fri, Apr 17, 2026 at 4:48=E2=80=AFPM Emil Tsalapatis <emil@etsalapatis.c=
om> wrote:
>
> On Fri Apr 17, 2026 at 10:33 AM EDT, Puranjay Mohan wrote:
> > The ARM32 BPF JIT does not support BPF-to-BPF function calls
> > (BPF_PSEUDO_CALL) or callbacks (BPF_PSEUDO_FUNC), but it does
> > not reject them either.
> >
> > When a program with subprograms is loaded (e.g. libxdp's XDP
> > dispatcher uses __noinline__ subprograms, or any program using
> > callbacks like bpf_loop or bpf_for_each_map_elem), the verifier
> > invokes bpf_jit_subprogs() which calls bpf_int_jit_compile()
> > for each subprogram.
> >
> > For BPF_PSEUDO_CALL, since ARM32 does not reject it, the JIT
> > silently emits code using the wrong address computation:
> >
> >     func =3D __bpf_call_base + imm
> >
> > where imm is a pc-relative subprogram offset, producing a bogus
> > function pointer.
> >
> > For BPF_PSEUDO_FUNC, the ldimm64 handler ignores src_reg and
> > loads the immediate as a normal 64-bit value without error.
> >
> > In both cases, build_body() reports success and a JIT image is
> > allocated. ARM32 lacks the jit_data/extra_pass mechanism needed
> > for the second JIT pass in bpf_jit_subprogs(). On the second
> > pass, bpf_int_jit_compile() performs a full fresh compilation,
> > allocating a new JIT binary and overwriting prog->bpf_func. The
> > first allocation is never freed. bpf_jit_subprogs() then detects
> > the function pointer changed and aborts with -ENOTSUPP, but the
> > original JIT binary has already been leaked. Each program
> > load/unload cycle leaks one JIT binary allocation, as reported
> > by kmemleak:
> >
> >     unreferenced object 0xbf0a1000 (size 4096):
> >       backtrace:
> >         bpf_jit_binary_alloc+0x64/0xfc
> >         bpf_int_jit_compile+0x14c/0x348
> >         bpf_jit_subprogs+0x4fc/0xa60
> >
> > Fix this by rejecting both BPF_PSEUDO_CALL in the BPF_CALL
> > handler and BPF_PSEUDO_FUNC in the BPF_LD_IMM64 handler, falling
> > through to the existing 'notyet' path. This causes build_body()
> > to fail before any JIT binary is allocated, so
> > bpf_int_jit_compile() returns the original program unjitted.
> > bpf_jit_subprogs() then sees !prog->jited and cleanly falls
> > back to the interpreter with no leak.
>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
>
> The Fixes tag is a bit unrelated since it's for x64 but the original
> commit that adds the file (ddecdfcea0ae8 ?) is so far back it probably
> doesn't matter.

That fixes tag commit has verifier changes too:

-- 8< --

+               }
+       }
+       for (i =3D 0; i <=3D env->subprog_cnt; i++) {
+               old_bpf_func =3D func[i]->bpf_func;
+               tmp =3D bpf_int_jit_compile(func[i]);
+               if (tmp !=3D func[i] || func[i]->bpf_func !=3D old_bpf_func=
) {
+                       verbose(env, "JIT doesn't support bpf-to-bpf calls\=
n");
+                       err =3D -EFAULT;
+                       goto out_free;
+               }
+               cond_resched();
+       }
+

-- >8 --


This call to bpf_int_jit_compile() is where the memory leak was
introduced, before this commit, there was no memory leak.

