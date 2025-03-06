Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11ADC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 03:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/eEcM0NHe7IojjfcsfekX/bHp43CZXGZ50QyLmEDFY=; b=qbNV5UUOW8KbSd6jM+tlbqZ3pU
	mAc1EvhBHCHuQtvfQTEfWFRnrVikx4MHcV/ylkUmfoOVxsLdUhm9GNpeu4FBpUJvqYZ1jsIXXPrww
	AP08zAHLaen8ZPaaEr+Zt9k2KVa2eyb7i3AG/WsBVS1A54Yt9qk7DA+pCMpj9MzbIOpWcM0LSMlNg
	zSufWeuCrtJNXB2PF9vxVs0NzFouwFxncZHLj/U8opVH0WjigkclEGdD8VU4nBY2LHtc7U6j6HL9P
	Kx78A96aZKAUt0rblpT8nXEM94vKTunkA7Tgnead/CNwvP+Ewh2Qj9kUNYXCFuYHlZbc1/4LJc79H
	5IYJe5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq26l-00000009wOX-40PI;
	Thu, 06 Mar 2025 03:41:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq259-00000009wEm-42sa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 03:39:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so72654f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 19:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741232374; x=1741837174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/eEcM0NHe7IojjfcsfekX/bHp43CZXGZ50QyLmEDFY=;
        b=Uzv68AUX6nUPz1ss8n4v+pSAeFI59A++n+2bn1+s+u8ngaWlNNweuZxgs62yCsJiXz
         s6DrEpPqbD7FecVKFKf5nK5QrpgJO/0LO3ps/GYP3vGYrJE3hTF5/tw0crtRHXzMwjdR
         Mi3rDFes8F0DeptQVobGdv4VWAVW0wwliVPs1oIDzSE+7SZfSQmrOY7JIKlHCj43k1Ed
         lHpxGgk+zTWoqH/w4B3gpxAKSWEhdlV7MgatQpCIVOzi/A8QrBJg7t9zhxvuwQioDxsD
         FS0L+zucPzC7+LdWtRxlSZ3Wyj5vo+7FJS/7M5LNo3IlILgXbR7AyFgOvELhKpSv82Ry
         qO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741232374; x=1741837174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/eEcM0NHe7IojjfcsfekX/bHp43CZXGZ50QyLmEDFY=;
        b=imb7fk3X2El7gY0C281sWiJGRDliq+Kz4mTtHMVxSgWERlL0RaI/2aToxMYkAaGyqc
         uHfC9aJcd5XXyTlJwes6oXu+igNdS7LY0SWXgvDflkmsfXVdLLGptUINDjDCKe9q1Auv
         o6hj3zbR4YT8CwvBRSaVJ7MWNStJKEzIJksn3E8QZUCBe7uKVpfUdBGIID+4QUB3bRsI
         k3ZQn02FSXC0cAjX8T0kB+NrFH6Sx1bJoixt4qXxVemO4+us+ZYOKALDD3cLLjNtfFkn
         TFEfDQNOe4spt+8SnO/ARrzlPspUFsLe7KbeZYcKoT/M+pK2eW6p/2+BTo/8v6dOAeE9
         Am9A==
X-Forwarded-Encrypted: i=1; AJvYcCXO2QF05CAZKjETpE1sTPuI2cdxhrVe7WDdQeLoMNFxGbW7Yb2cmO4BPghmegOPiPVhMtriWN7FLfPMwFZsLa9L@lists.infradead.org
X-Gm-Message-State: AOJu0YwadFmF9PRs6VGUqhnBOpbQ/bjLJeGc8sR5Zil+fR056PXetygv
	LDMSkMXT8QYY19WoKmjIVc2zhbCxKOV5qNbHG35qWFDMX3YZkZI+3/i3E244gd/FCE6XeIqv6wA
	EbulLI4KSqrNslcpTqKfLjIm1ZC0=
X-Gm-Gg: ASbGnctGYcHbL5m6S9hVIjYTXtOsdqYOugNqq3/xggUvinjzEWQeq3VFANkSgjnwM9l
	7t0tVfEJcpV6GQyAtHmnigHKY1REWpnyVI+/4Sb7dg55v9eGN6b034ynzvXL4mldm+O9Z1W/AeP
	J3P3i0RXHt1XGho4B8XRt6rPEUGyxcoqtGNOtoVE/X/w==
X-Google-Smtp-Source: AGHT+IH27dDGyBt7hd/VD86i6Z5HrEQ87tPCL5LhwJp6YDp6zkaw2KXN1sF3oSjJz4rUkFgqQ7BDSNeVdPcCH+k+1EA=
X-Received: by 2002:a5d:59ab:0:b0:391:1139:2653 with SMTP id
 ffacd0b85a97d-3911f7d2142mr4539340f8f.52.1741232372007; Wed, 05 Mar 2025
 19:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
 <20250304094220.GC11590@noisy.programming.kicks-ass.net> <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
 <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
 <20250305100306.4685333a@gandalf.local.home> <CADxym3ZB_eQny=-aO4AwrHiwT264NXitdKwjRUYrnGJ2tH=Qwg@mail.gmail.com>
In-Reply-To: <CADxym3ZB_eQny=-aO4AwrHiwT264NXitdKwjRUYrnGJ2tH=Qwg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 5 Mar 2025 19:39:20 -0800
X-Gm-Features: AQ5f1JrlMjvbkNliJ-RM0--naYFcbVQdQvx8bndtQJGQK7ImHRvWRfp852lYwK0
Message-ID: <CAADnVQJ0_+Hij=kf9eVPX_ZND=2=uDHaYPWvv1x-WmR5sZRSmA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: Menglong Dong <menglong8.dong@gmail.com>
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
X-CRM114-CacheID: sfid-20250305_193936_004899_34104F3C 
X-CRM114-Status: GOOD (  16.27  )
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

On Wed, Mar 5, 2025 at 6:59=E2=80=AFPM Menglong Dong <menglong8.dong@gmail.=
com> wrote:
>
> I'm not sure if it works. However, indirect call is also used
> in function graph, so we still have better performance. Isn't it?
>
> Let me have a look at the code of the function graph first :/

Menglong,

Function graph infra isn't going to help.
"call foo" isn't a problem either.

But we have to step back.
per-function metadata is an optimization and feels like
we're doing a premature optimization here without collecting
performance numbers first.

Let's implement multi-fentry with generic get_metadata_by_ip() first.
get_metadata_by_ip() will be a hashtable in such a case and
then we can compare its performance when it's implemented as
a direct lookup from ip-4 (this patch) vs hash table
(that does 'ip' to 'metadata' lookup).

If/when we decide to do this per-function metadata we can also
punt to generic hashtable for cfi, IBT, FineIBT, etc configs.
When mitigations are enabled the performance suffers anyway,
so hashtable lookup vs direct ip-4 lookup won't make much difference.
So we can enable per-function metadata only on non-mitigation configs
when FUNCTION_ALIGNMENT=3D16.
There will be some number of bytes available before every function
and if we can tell gcc/llvm to leave at least 5 bytes there
the growth of vmlinux .text will be within a noise.

So let's figure out the design of multi-fenty first with a hashtable
for metadata and decide next steps afterwards.

