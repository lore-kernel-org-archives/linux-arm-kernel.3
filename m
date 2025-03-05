Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF32C282DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 01:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHYZyJk9t+dccX+FpypbsuXH5wnniLUKk++ZCb3Oz18=; b=mJlUgL9LHIQiNISQVef+Qe42tN
	YCeE0UBbehl0jLFM9ZF+lcDDg6a9ghQz/B60/REo9ML4NX9tNl4KWMM+52Jk5xHM+UEh4SmrooQT3
	o9cChkAxFuff404VLFTakjZdr3KKTswr8MUIXZHc8Z6VeE3d4TD+St2UAYfx49O1i9OKo1X//ZfuN
	V8BYWkjWx0yyuBiME6Rex6J8vTd2XB5IjEepwCKhndxnCkyEDuEckZfDq8Ky5uZBaF6ZJKQtrdCfp
	Iizhx6K3SM00bh0nbbTMeVIL9CXLEWmjrjzq2kLdEco1NVijTh0XeKv5dfXh/1nYfzN5s3qNPokBE
	hJa5SOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdVM-00000006iRE-43qj;
	Wed, 05 Mar 2025 01:25:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdRc-00000006i0b-1lZ3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 01:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OHYZyJk9t+dccX+FpypbsuXH5wnniLUKk++ZCb3Oz18=; b=ogUPX+AsbKXV/2yss9uRu43DkR
	sBhK1Y3Q5x07H5cI7ogX99QOHO3DmWv+Yi1acddNDJEeX456D1qtNlIOgw8qRcyH3VLg7Mx2RGzEd
	t3e6occG2ZvOEZ/3XM/0/K9446ee7C/Bg2XcCQToFDRs141tj/uamIiSllpzAhoJiHSODeaIxBP/9
	gGFQwQNNwSPDCdR7oByEu49o6O86KGt8VzhR/qy68JzrIE2ZiDcLLrJv8XPlUSzXsWMj6mUur+z7Y
	KZvg7aNNQE7VMKCA7Ac5p51jGE965bKA3iFoohHiJSwyWLAd2esGBBhfYTIJPbtEH8U4DkUgFqFej
	nle01rWw==;
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpdRO-00000000Ih5-18E7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 01:21:04 +0000
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-6ef7c9e9592so48173107b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 17:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741137647; x=1741742447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHYZyJk9t+dccX+FpypbsuXH5wnniLUKk++ZCb3Oz18=;
        b=moRpxdTO+dLt/XK+eSkao7oi91dea6KJWifpBQv0jirwDIHQ5BwUVX3C7ZqcD+KJx+
         WZsSIOyUqAjnPkddC3Ay3AvpqiQeERgxXs3nY4gTnmkkx4SL0SUrOLzU24E4i/0gNK9v
         +3zy7PCmE5guUn3UBSMLHBh6guslekezDscR8oC3SZi1OPM2yW84pjWqsImy5PdB8+T5
         yn7kLVjNwSSGhUVtTo8gn968VUq1tJ0DOfM64/NHDLO+MvHRMYNj9ckUJEp793TIhcal
         L789UZWbLPevR5KiVvq/pYrTDnarkYD840u/bYOOxWeW4X8G7qaToC91JNRRfMQ7YmER
         tnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741137647; x=1741742447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHYZyJk9t+dccX+FpypbsuXH5wnniLUKk++ZCb3Oz18=;
        b=aJPPgCTK5VCIGlhefiW8ex1kqRSAsM0pP6aQSVOeaqLums8shYEqScePyhWTMGAt7t
         OxK+DWkjKoiG+MmXRay7qIHztR8s5WwDoHwQ963aaRfyv1RJ4g4uzgRIITS1MVZWfGp0
         r+MqDaohR5ADZrGHGX9j6ODbKwVfK2zY5KUaSb5CbsskKlzwRYJFnIxhaeWTKWjzj6WK
         QjCjl1zSzOt72FNsa64nXFdKKW5BGrv+gu9l6DfsBdgPEBlspsXaZ43DUEi81gAmyh1s
         LdyPc6IvTBD3IMpJN27bGd2N6NxXrDC5bxrWQNdpBd/SiY/bWMnE5lXchxOCgx9S5UXa
         eL3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj6wDKYDeGUG3vSd3PS/HnxGWnfMDYGdf3Wh/xha3749qxsm9RvlR1xhgVC4/igcVbRB8U0W9QpFwHOW9XwT3y@lists.infradead.org
X-Gm-Message-State: AOJu0YwTrtK7yYfroCURdXAjxL7q1EBj36VOPH17oEfZLBwyvaoeOylG
	vJqKXMmA+0xn86VfRtlSf7IO1IJYA1MOAeN/421/+poE44s+uCk5VioyFPOPoApAsYs54Dut4h9
	lpTzyJvSI/fAJZ33ftYqjN5b+Fj8=
X-Gm-Gg: ASbGnctlTkptUj39r1O474HSCWAuLH1jPXgSfmvUF9HSYAV/c9twVpyV4xnJSWoWmhl
	AOZUCfv9p05tu5/blrLlXfs8DC/Vk+vCsysQPBw52EWO3FMOWNMu+T7dQD3xESv644N9kls828g
	SjWOsxTyyTMpps1cq6wJ3DiZdfvw==
X-Google-Smtp-Source: AGHT+IEUFgZnl6Hm/lrUNqrNCPW/Rgad0I4A7NRpQso6+OmPGRY6t9+y0nrp+PzU9oYzztzRMxurMDXN8Jy0BacmWdM=
X-Received: by 2002:a05:690c:3690:b0:6fb:a376:3848 with SMTP id
 00721157ae682-6fda315fdfbmr21998337b3.34.1741137647462; Tue, 04 Mar 2025
 17:20:47 -0800 (PST)
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
 <20250304094220.GC11590@noisy.programming.kicks-ass.net> <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
In-Reply-To: <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Wed, 5 Mar 2025 09:19:09 +0800
X-Gm-Features: AQ5f1JovIrYFizMaqP4MsodnwT5N7qb6QoTLb6VyR_6OCJq8SQkboYm5nSKxxpw
Message-ID: <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
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
X-CRM114-CacheID: sfid-20250305_012059_042167_C8D74667 
X-CRM114-Status: GOOD (  25.49  )
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

On Tue, Mar 4, 2025 at 10:53=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On March 4, 2025 1:42:20 AM PST, Peter Zijlstra <peterz@infradead.org> wr=
ote:
> >On Tue, Mar 04, 2025 at 03:47:45PM +0800, Menglong Dong wrote:
> >> We don't have to select FUNCTION_ALIGNMENT_32B, so the
> >> worst case is to increase ~2.2%.
> >>
> >> What do you think?
> >
> >Well, since I don't understand what you need this for at all, I'm firmly
> >on the side of not doing this.
> >
> >What actual problem is being solved with this meta data nonsense? Why is
> >it worth blowing up our I$ footprint over.
> >
> >Also note, that if you're going to be explaining this, start from
> >scratch, as I have absolutely 0 clues about BPF and such.
>
> I would appreciate such information as well. The idea seems dubious on th=
e surface.

Ok, let me explain it from the beginning. (My English is not good,
but I'll try to describe it as clear as possible :/)

Many BPF program types need to depend on the BPF trampoline,
such as BPF_PROG_TYPE_TRACING, BPF_PROG_TYPE_EXT,
BPF_PROG_TYPE_LSM, etc. BPF trampoline is a bridge between
the kernel (or bpf) function and BPF program, and it acts just like the
trampoline that ftrace uses.

Generally speaking, it is used to hook a function, just like what ftrace
do:

foo:
    endbr
    nop5  -->  call trampoline_foo
    xxxx

In short, the trampoline_foo can be this:

trampoline_foo:
    prepare a array and store the args of foo to the array
    call fentry_bpf1
    call fentry_bpf2
    ......
    call foo+4 (origin call)
    save the return value of foo
    call fexit_bpf1 (this bpf can get the return value of foo)
    call fexit_bpf2
    .......
    return to the caller of foo

We can see that the trampoline_foo can be only used for
the function foo, as different kernel function can be attached
different BPF programs, and have different argument count,
etc. Therefore, we have to create 1000 BPF trampolines if
we want to attach a BPF program to 1000 kernel functions.

The creation of the BPF trampoline is expensive. According to
my testing, It will spend more than 1 second to create 100 bpf
trampoline. What's more, it consumes more memory.

If we have the per-function metadata supporting, then we can
create a global BPF trampoline, like this:

trampoline_global:
    prepare a array and store the args of foo to the array
    get the metadata by the ip
    call metadata.fentry_bpf1
    call metadata.fentry_bpf2
    ....
    call foo+4 (origin call)
    save the return value of foo
    call metadata.fexit_bpf1 (this bpf can get the return value of foo)
    call metadata.fexit_bpf2
    .......
    return to the caller of foo

(The metadata holds more information for the global trampoline than
I described.)

Then, we don't need to create a trampoline for every kernel function
anymore.

Another beneficiary can be ftrace. For now, all the kernel functions that
are enabled by dynamic ftrace will be added to a filter hash if there are
more than one callbacks. And hash lookup will happen when the traced
functions are called, which has an impact on the performance, see
__ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
metadata supporting, we can store the information that if the callback is
enabled on the kernel function to the metadata, which can make the performa=
nce
much better.

The per-function metadata storage is a basic function, and I think there
may be other functions that can use it for better performance in the featur=
e
too.

(Hope that I'm describing it clearly :/)

Thanks!
Menglong Dong

