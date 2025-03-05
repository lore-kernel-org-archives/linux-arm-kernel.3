Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E481C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQXKjZHa5r4213wcOvfbsp5orLWVfyC4Oxpcslkw+cY=; b=WwCR+bnyCX2OX9RLKRHJn6a6ub
	F1UOO91kmMHEBl4k9z4MEX7V8ro1kLVry46+PB3UYaM5k+/ryNV9tsSWPCluUUFqh4hiaP5Eo5s6C
	kuVJVa2kiMrgluS5nju0U+mQ32Ql3jYiF1drQteYVcqOITu5BZBz7C0UtajWMONdHc99i2QpqeMII
	OntqZI9zLaa9yr/w/Akxl3NvZUaTcc33tyYkn7+fv45jqNeWPmaP8/C4Jt/lPCWCTrO+LXAmuBjZh
	KXj002/y7x8i6mJb5Yc8y2Ly9SSI2JBV7ZFFAfneJaz9/I/zaYxB9Kor4EB1JubPJc23d2gVgpn38
	ReK1svfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkVs-00000007QAr-1JBz;
	Wed, 05 Mar 2025 08:54:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkTT-00000007PrU-1peM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 08:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DQXKjZHa5r4213wcOvfbsp5orLWVfyC4Oxpcslkw+cY=; b=f+7zUqKEvpfELCTQwDFlOixHCn
	WiLDYBWXkIJ13pnm4hny+5tvjMkmQLzcmUTpvBLqeAeNPQueQXRoZoLdKCliE6E0V+oYa41ikxsf+
	LY6L4HT6V51yXbQwWGhfFdFnzg/pkS/Uc4XTdYWsz5yaMobiPLVNQlITSgs1IHB8qVhy0pRLUTBC3
	p2AEquClqhDY+KiE9mvY5OTMBWF68jB/KqvCN7h//MaBFRytIrfx69XfYjn6ZA6Nti6ObSGXvmfIK
	RRc+yslc1OYj65LhsjlQ5xr8i0gAx6w7Rg4JpC59/tn7hVjCyQZOcedZdsLFLzSWq3MpUqrEkQT/L
	ceDnyMcA==;
Received: from mail-yw1-x1142.google.com ([2607:f8b0:4864:20::1142])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkTQ-000000058Hc-2MiU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:51:30 +0000
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-6f754678c29so59799027b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741164685; x=1741769485; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQXKjZHa5r4213wcOvfbsp5orLWVfyC4Oxpcslkw+cY=;
        b=aSZljunP4xFo7boOnzZ1FNnraCLACwGprg+Y3jSirAbAP/8GEOambtu+nb4dqxj+/Z
         FpGy5jYVBBQELIOklaMNlb+vpols1OJNVnv2VhMU5+OfjcLi9FI3HTriNb8+w/1/jIjP
         +wEki2iR7w14T4W8mHVphanQXA2LJNjGGMiR8NUB53xpjE2Slej1JpyIpRzFsQSYdYzW
         ZiXKuD+BUkRUuzNIVuJBwZF3gnkG9NNhn1Cu2BXYKrEID9bjEhXYJ+kgtxrzmQwYjUMk
         C8sODUN31gzYcV9KJ/ulLdnk+fGcicrx5eJL9rfW14ucmfYDB/TPNY6+RjtpyjUQlEi1
         0p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164685; x=1741769485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQXKjZHa5r4213wcOvfbsp5orLWVfyC4Oxpcslkw+cY=;
        b=p7pvBsXbfbM0kn+DT6jIc6xhBnlQfGdCSHs/yS1Xc3/Cpozixx3IBMPR4kxES6Gwn5
         Wydm0Mjt/rNxfSQG5MBd0UugeR6ma722X3m2bR2/CCCT28Ns4PUmUFZHz4gq35x10OOA
         jjodRfgO0HUqPpR8KpEMD+GSTv8lXGev3cKo2Pvq+KehGdUVB+Y6Rhe41hsA+LPZzRX6
         rXz3VIpV3As7Ol9YomNSIluRpd/aEgd4Ndp/2kK+v+8j1NjCLzDEtcd+josSXmi/Ldxi
         bB4VG1hUoLiM9deDQhvEWOrxdz62BebN6BFVI9I9JmbRRS8H5XO42DPV5BuOB8Igwget
         j0mg==
X-Forwarded-Encrypted: i=1; AJvYcCWzNZz6ogvlR8FkvQqIaH0PdxA5jFLF+RUoYbOvLmm/vcGh/4EZWJBgluMNBfqLJQtRAkRVcM7sSFz4WqXKLdKY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw437BiZQOs3IAR1igHEyBG17ZYk1U5UxvSW7HPLXPYOyM0dn/h
	FygUNKd8cosxSLoGeyQB6SviZS+hCxTQE31FTYJIn7BeTlHQqljPDGhlJ7IV4G1gOzJ085u1ZiT
	TTv1FFAnF2A9cT4J6LpVnuitLHw8=
X-Gm-Gg: ASbGnctHLkPb8YFA0Irj61N088hBJPlobd6ovw5qbgrm0PYUcqvHXNR+lwisrbxYu3v
	X2j+k1t3+2W4AurqOx5gUqiMYHMzYjs1UxJ4vK+DxyQwjGDIvKHBBWpwztMxJcJmVv68LiYWb28
	7zM79Q35JlVNUw1BmvwTWZvN+/fQ==
X-Google-Smtp-Source: AGHT+IHJHBBsGtFfE4z2mPAk21mETs2dOEwyYu6mGke3XwoXSNX7h5iKIMLg2OfM/L0feLDcyFXEy1rx6kLoqIY81uk=
X-Received: by 2002:a05:690c:6c82:b0:6ea:5da9:34cc with SMTP id
 00721157ae682-6fda2f6ae73mr31701457b3.7.1741164685004; Wed, 05 Mar 2025
 00:51:25 -0800 (PST)
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
 <20250304094220.GC11590@noisy.programming.kicks-ass.net> <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
 <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com> <694E52E0-C9E5-49D2-A677-09A5EE442590@zytor.com>
In-Reply-To: <694E52E0-C9E5-49D2-A677-09A5EE442590@zytor.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Wed, 5 Mar 2025 16:49:47 +0800
X-Gm-Features: AQ5f1JpDhhwKYSzWqZc9I3K1CFCu-n4ujPK1HFEHMI_ufAKecdbRxf_kS4Jud7Q
Message-ID: <CADxym3Zu1u1xF0k+N4gZ50jHtZ9iRRQ0ZTtt_koG8Ta+B0DPJg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>, rostedt@goodmis.org, mark.rutland@arm.com, 
	alexei.starovoitov@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mhiramat@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com, 
	kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org, 
	riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_085128_613445_152CB63A 
X-CRM114-Status: GOOD (  28.53  )
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

On Wed, Mar 5, 2025 at 4:30=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> On March 4, 2025 5:19:09 PM PST, Menglong Dong <menglong8.dong@gmail.com>=
 wrote:
> >On Tue, Mar 4, 2025 at 10:53=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> w=
rote:
> >>
> >> On March 4, 2025 1:42:20 AM PST, Peter Zijlstra <peterz@infradead.org>=
 wrote:
> >> >On Tue, Mar 04, 2025 at 03:47:45PM +0800, Menglong Dong wrote:
> >> >> We don't have to select FUNCTION_ALIGNMENT_32B, so the
> >> >> worst case is to increase ~2.2%.
> >> >>
> >> >> What do you think?
> >> >
> >> >Well, since I don't understand what you need this for at all, I'm fir=
mly
> >> >on the side of not doing this.
> >> >
> >> >What actual problem is being solved with this meta data nonsense? Why=
 is
> >> >it worth blowing up our I$ footprint over.
> >> >
> >> >Also note, that if you're going to be explaining this, start from
> >> >scratch, as I have absolutely 0 clues about BPF and such.
> >>
> >> I would appreciate such information as well. The idea seems dubious on=
 the surface.
> >
> >Ok, let me explain it from the beginning. (My English is not good,
> >but I'll try to describe it as clear as possible :/)
> >
> >Many BPF program types need to depend on the BPF trampoline,
> >such as BPF_PROG_TYPE_TRACING, BPF_PROG_TYPE_EXT,
> >BPF_PROG_TYPE_LSM, etc. BPF trampoline is a bridge between
> >the kernel (or bpf) function and BPF program, and it acts just like the
> >trampoline that ftrace uses.
> >
> >Generally speaking, it is used to hook a function, just like what ftrace
> >do:
> >
> >foo:
> >    endbr
> >    nop5  -->  call trampoline_foo
> >    xxxx
> >
> >In short, the trampoline_foo can be this:
> >
> >trampoline_foo:
> >    prepare a array and store the args of foo to the array
> >    call fentry_bpf1
> >    call fentry_bpf2
> >    ......
> >    call foo+4 (origin call)
> >    save the return value of foo
> >    call fexit_bpf1 (this bpf can get the return value of foo)
> >    call fexit_bpf2
> >    .......
> >    return to the caller of foo
> >
> >We can see that the trampoline_foo can be only used for
> >the function foo, as different kernel function can be attached
> >different BPF programs, and have different argument count,
> >etc. Therefore, we have to create 1000 BPF trampolines if
> >we want to attach a BPF program to 1000 kernel functions.
> >
> >The creation of the BPF trampoline is expensive. According to
> >my testing, It will spend more than 1 second to create 100 bpf
> >trampoline. What's more, it consumes more memory.
> >
> >If we have the per-function metadata supporting, then we can
> >create a global BPF trampoline, like this:
> >
> >trampoline_global:
> >    prepare a array and store the args of foo to the array
> >    get the metadata by the ip
> >    call metadata.fentry_bpf1
> >    call metadata.fentry_bpf2
> >    ....
> >    call foo+4 (origin call)
> >    save the return value of foo
> >    call metadata.fexit_bpf1 (this bpf can get the return value of foo)
> >    call metadata.fexit_bpf2
> >    .......
> >    return to the caller of foo
> >
> >(The metadata holds more information for the global trampoline than
> >I described.)
> >
> >Then, we don't need to create a trampoline for every kernel function
> >anymore.
> >
> >Another beneficiary can be ftrace. For now, all the kernel functions tha=
t
> >are enabled by dynamic ftrace will be added to a filter hash if there ar=
e
> >more than one callbacks. And hash lookup will happen when the traced
> >functions are called, which has an impact on the performance, see
> >__ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
> >metadata supporting, we can store the information that if the callback i=
s
> >enabled on the kernel function to the metadata, which can make the perfo=
rmance
> >much better.
> >
> >The per-function metadata storage is a basic function, and I think there
> >may be other functions that can use it for better performance in the fea=
ture
> >too.
> >
> >(Hope that I'm describing it clearly :/)
> >
> >Thanks!
> >Menglong Dong
> >
>
> This is way too cursory. For one thing, you need to start by explaining w=
hy you are asking to put this *inline* with the code, which is something th=
at normally would be avoided at all cost.

Hi,

Sorry that I don't understand the *inline* here, do you mean
why puting the metadata in the function padding?

