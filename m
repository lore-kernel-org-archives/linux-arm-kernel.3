Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872BBC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXs8uZWN9WWnGCHphGrfM+z/OKcBjkW6AX8J7E+t69Y=; b=BsddfeJRA8nD4YBCSBmwj7/c9u
	7vYEhEyMK9OzepzXq+AWL550oAdNYzIzoFV57UbJnjTIKF+sn9VRwp4XXtDg5A6WG3oelrDrDWW6A
	hcyCRD+pNKbpInRg4PtLjtT8VJnkhcKmeVa5tEH8qrdvcgQ2/BGAuwX7mgGDiSA+bAtu1rD3ocovm
	g9EIVdWL2ZLQvu6Kk6xf1Xcm1Ptmg+Ce+GGxjPFGY3BUseFFV7vN00eWG7KPg16TywI/wEhKATqOV
	bcTFO1tinGwl26nDLDx9xvxlQCbRcnU8k7Oowpj7wzV6vVmTqumh8uJCVoa0CcfI7dSPb4tT1gXUD
	K8E89JOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8CK-0000000Aabw-1CbQ;
	Thu, 06 Mar 2025 10:11:24 +0000
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6y7-0000000AOmm-41oP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:52:41 +0000
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-6fead015247so3498247b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741251158; x=1741855958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXs8uZWN9WWnGCHphGrfM+z/OKcBjkW6AX8J7E+t69Y=;
        b=fvICAx326vhMR+92iBNCAFakpStMIAJ8mwxIh28CNoql9AjhHURm935sA91PHN9xHw
         a5f24aUaVnS1u+B7hEXbk1bOMvR79qMuwmvYc2qbNBkFkY5LX3OKd2N5R0N/zMtuIScq
         2WSBSA/jucAe/vr0qU5mSP1JzCk+8FvvvFxNBfxKsAWvur/RG7fma8NS5YJBZqnt/Ier
         nzoIE1K8oY/JtFqxSRBxNJLMgbatnR6SJpUoceq4USWO/7zGzQUzT58WutYBM7XotqZD
         zJr5PrlYKRdCDSrQKob/JOaqMntiBpRa7ytAb+bcOsK2DgRthPZGxy4cQfhSK0ydxpsT
         XX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251158; x=1741855958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXs8uZWN9WWnGCHphGrfM+z/OKcBjkW6AX8J7E+t69Y=;
        b=Pbl0OWr8Hxv0FYwxhqfVa+fq8yGIbfBjDeZXIS77AwnnvGHUx3oegUw0LtCSvtMPsE
         MRkSfl2Jdxnygdk9Gp3n9WzbSB0iMt/GiG+YULcyM1axzMjH5Vpq5Z5eANdTgeLkwJra
         YlD+p9owulOq7b/bYO3vQIdOYxYshIyUhXZSdH+pReyITsBAiJkE9G889VcLWsaNoktu
         /GFu6IcJGieVxRlKywz6xUwpvtRsOcLwOY7vVDb1NpI6qyF+CQ/VArleRJqsefK/oOpM
         jtMGsKTXP4lNr5wz1LC8dTXRjiAkMam2YeA9mWjscK/3uXUskz1yuxjDTPlL6fSDbABD
         oxOA==
X-Forwarded-Encrypted: i=1; AJvYcCVLjbu6UiIwlgHTyH+qjr1J3IqI9K7Q1XoKpMhE3sRghPPxjXFrRIC5urkjbrzzMhCFW/JmZaBMWVTpPUdR51J1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8RfFdKS92ATC1lOjBEwLKVVlRhWS7eRPR5G60aCloVXynR6cS
	H7LBsYgM8KCChZDAP0cOewh5RtjhaBqRD+Figc1jvmKpAgFxrPb+UQqew9D0LXj7VMBElk2K2DB
	GNNqc5LN1xVxtZV9761W1/sJBppE=
X-Gm-Gg: ASbGncsFSsku/38T/fbasQB+dmlvy4xpeZBERz+ZKEBLae+dpB7c+m2bY/VmlPthDrD
	dfy3V9lVT7RvI02XQ6/1XOso6Tl0HzTCxtS6brNOeWRNPOqk6elrduMsxF7rdKMhDZ31cc/Ylv0
	r0olcbDopueGGbJg1GgAPazH6beQ==
X-Google-Smtp-Source: AGHT+IHUPHaw0YZdo+mDMRAkSmdnWIm6D16Vg79ihR5A4Mv8LJil7rF/h/OfZk/ywEv5+Ey8+JWj4dl2X5zMiVr1zBQ=
X-Received: by 2002:a05:690c:2b03:b0:6fe:b88e:4d82 with SMTP id
 00721157ae682-6feb88e57c7mr3700567b3.28.1741251158459; Thu, 06 Mar 2025
 00:52:38 -0800 (PST)
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
 <20250304094220.GC11590@noisy.programming.kicks-ass.net> <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
 <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
 <20250305100306.4685333a@gandalf.local.home> <CADxym3ZB_eQny=-aO4AwrHiwT264NXitdKwjRUYrnGJ2tH=Qwg@mail.gmail.com>
 <CAADnVQJ0_+Hij=kf9eVPX_ZND=2=uDHaYPWvv1x-WmR5sZRSmA@mail.gmail.com>
In-Reply-To: <CAADnVQJ0_+Hij=kf9eVPX_ZND=2=uDHaYPWvv1x-WmR5sZRSmA@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Thu, 6 Mar 2025 16:50:58 +0800
X-Gm-Features: AQ5f1JpgFvunO0OQTqf93RDkyeUwF-IllYoHkeBCNOU1pNT2c-N8DSTxA6mOAMI
Message-ID: <CADxym3YMeAPpc+ozM2E7yW1qpB_arKJiDyAcRs8pW8sRqJZOZw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, dongml2@chinatelecom.cn, 
	Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@surriel.com>, 
	Mike Rapoport <rppt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_005240_004261_AA17AD39 
X-CRM114-Status: GOOD (  25.10  )
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

On Thu, Mar 6, 2025 at 11:39=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Mar 5, 2025 at 6:59=E2=80=AFPM Menglong Dong <menglong8.dong@gmai=
l.com> wrote:
> >
> > I'm not sure if it works. However, indirect call is also used
> > in function graph, so we still have better performance. Isn't it?
> >
> > Let me have a look at the code of the function graph first :/
>
> Menglong,
>
> Function graph infra isn't going to help.
> "call foo" isn't a problem either.
>
> But we have to step back.
> per-function metadata is an optimization and feels like
> we're doing a premature optimization here without collecting
> performance numbers first.
>
> Let's implement multi-fentry with generic get_metadata_by_ip() first.
> get_metadata_by_ip() will be a hashtable in such a case and
> then we can compare its performance when it's implemented as
> a direct lookup from ip-4 (this patch) vs hash table
> (that does 'ip' to 'metadata' lookup).

Hi, Alexei

You are right, I should do such a performance comparison.

>
> If/when we decide to do this per-function metadata we can also
> punt to generic hashtable for cfi, IBT, FineIBT, etc configs.
> When mitigations are enabled the performance suffers anyway,
> so hashtable lookup vs direct ip-4 lookup won't make much difference.
> So we can enable per-function metadata only on non-mitigation configs
> when FUNCTION_ALIGNMENT=3D16.
> There will be some number of bytes available before every function
> and if we can tell gcc/llvm to leave at least 5 bytes there
> the growth of vmlinux .text will be within a noise.

Sounds great! It's so different to make the per-function metadata
work in all the cases. Especially, we can't implement it in arm64
if CFI_CLANG is enabled. And the fallbacking to the hash table makes
it much easier in these cases.

>
> So let's figure out the design of multi-fenty first with a hashtable
> for metadata and decide next steps afterwards.

Ok, I'll develop a version for fentry multi-link with both hashtable
and function metadata, and do some performance testing. Thank
you for your advice :/

Thanks!
Menglong Dong

