Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CD6C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lxf1+JQlod0vaF1LjBgi2IcVLIhGNFVeduj0UU5pVvc=; b=lBGZbcBrhYHqKss92iDXb1SFNg
	m1FOrMgVUBF54Zw+hbqrSIMUmjDbj4CyV6kAXXDzcLmA+aZMU44DMZvmag6eHTvODXNOJEsfjIi8D
	FOfMa+3buNnH/Yz26V2GDTioMNswkdUtNaaRYwuymMbE/W/w/mtCN1PJTB4ARpkT9mwSPvEar7KID
	bvKJncQauKzHomn+gq7BwIlF5scZIWQiJT4RTIbMM1i0bfFQ4FJipNERLiiKLfQuN02jt9EQuWbSx
	lk2RzMafVgmPLcihs4kbPpw75LfuI/HhWzSaxQaR25PuJwzyBGvlCnEXijqDCRviQ2cORqrfqY43W
	X19jvCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to02T-0000000B16V-2P30;
	Fri, 28 Feb 2025 13:04:25 +0000
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to00v-0000000B0wC-08UH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 13:02:50 +0000
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-6f88509dad2so20113527b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 05:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740747768; x=1741352568; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxf1+JQlod0vaF1LjBgi2IcVLIhGNFVeduj0UU5pVvc=;
        b=PIEkpINskUtFDzFGfY1XOumaXP53MZxLDfr0MavsVC3jVkV6k909kJWZK1Nff8eT60
         CjeiWc+TDyg08Y1AnGnNKKpatI1U7dwfXHWSh+UGTIkgDTn3v8pjorlf18F2uqv389Wd
         d0zbeO6v3LAcYogLXLjsSdqMRk6D7m+ve+4cdwU8unQ8YCIltl3m1wtHlmDuHCeXnIyb
         AwCjlBjewa/GuYYeJxyUHFa1cVBYz/xO8h33ZDeVpeYXtNRGU1h8QHoMAP6IEOzjRCfV
         wHKm4xNUMMeDM1qwPPxSMIZrHZDjtkYfoa5bA/EHwUUC2CZX6r5dx8B6UFYkCBArPMpr
         94OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740747768; x=1741352568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lxf1+JQlod0vaF1LjBgi2IcVLIhGNFVeduj0UU5pVvc=;
        b=detw/5asl2XYS5h0BiQMX5x8ZPtzUCSHlak07qYCQDzkp5MJyDHWkyp9MhyW6WND3w
         7sd4+ZSxEEAb8/rVD8MHb9KQWxhnBRGBRZVLZEHexOLlY5JLyT4+z1YJPX10/YopLBaa
         J2ulHyzNkYUFS2M2gS85vzL1fIsYh37NWHHZkfvbcq3naPxRDQn/qGPiWWF6LaRv9nsX
         6fseKLmX2uMLscJaeM0MBxAbPInDq9UK+H6W5N8OZoo/+lAtKV61U7sujZC1QGpfQeDr
         1KqGxxv6Ompzu7XIevC+Aj3wE+p7KD304ymoIrE8u3cVyDhPymp22wW9JikSPNZ2TXD3
         atDg==
X-Forwarded-Encrypted: i=1; AJvYcCWKXt47rhqM67oV5YS/ZTHCKABgxlrnS69WL7CfSJO3I6BLRHY8fmFikpGaJ2UukOsnNjm9DuvJA2bJbAzC2HUU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyymj/NbUWV40tFCqBkLVnm8cQMo59qdvTPdN5tH0Nv5m1S43wX
	osadqp7npSHN25fX9R9ihvmealD8wxZi2zdb3N7jigIR6cgKLIc5/GxeVf51csPVGq7otKnl00V
	haPcrrxu1e7iPopPSUfB6Cd5loRE=
X-Gm-Gg: ASbGncvhtMAeEOmE+uACTy29GM6CGqzPc7w8vkj2fjHXPA850gAtCAgHbMmJXd4Txo2
	oHlE25KK1EV49PAPbGDfwCYkAZ2sVMvHl+bxYS9rSZQEpo7xrp9DyOZIUA8bYfSQlZOfW7iuinA
	d85JjEJjE=
X-Google-Smtp-Source: AGHT+IFxjntFYCrdKTcPea67JPxe+v5Sa9XZL4MVsSSpjMRa9cd1V2CipkdZZHMWHZoL7poCdPxCL7wYZBcjkNKu7qc=
X-Received: by 2002:a05:690c:7246:b0:6fb:b36b:300f with SMTP id
 00721157ae682-6fd4a12e751mr42505867b3.27.1740747767697; Fri, 28 Feb 2025
 05:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20250226121537.752241-1-dongml2@chinatelecom.cn>
 <20250227165302.GB5880@noisy.programming.kicks-ass.net> <CADxym3YCZ5dqXMFesNaAF_Z2EWWCj0bJyKQ+BnNw2c=g39CRFA@mail.gmail.com>
 <20250228102646.GW11590@noisy.programming.kicks-ass.net>
In-Reply-To: <20250228102646.GW11590@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Fri, 28 Feb 2025 21:01:16 +0800
X-Gm-Features: AQ5f1JqrzWh6FiWmWs0NqkISwK6qGrIUKQAmD08_dgHluKZH96ief-KRhQb5Uq8
Message-ID: <CADxym3aECb5xOm0+YMycsx8kD6ijuEfMx6xrR9UKrH-FFn=KBw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] add function metadata support
To: Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	mathieu.desnoyers@efficios.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, dongml2@chinatelecom.cn, 
	akpm@linux-foundation.org, rppt@kernel.org, graf@amazon.com, 
	dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_050249_077086_D740C2CD 
X-CRM114-Status: GOOD (  21.47  )
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

On Fri, Feb 28, 2025 at 6:26=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Feb 28, 2025 at 05:53:07PM +0800, Menglong Dong wrote:
>
> > I tested it a little by enabling CFI_CLANG and the extra 5-bytes
> > padding. It works fine, as mostly CFI_CLANG use
> > CONFIG_FUNCTION_PADDING_BYTES to find the tags. I'll
> > do more testing on CFI_CLANG to make sure everything goes
> > well.
>
> I don't think you understand; please read:
>
> arch/x86/kernel/alternative.c:__apply_fineibt()
>
> and all the code involved with patching FineIBT. I think you'll find it
> very broken if you change anything here.
>
> Can you post an actual function preamble from a kernel with
> CONFIG_FINEIBT=3Dy with your changes on?
>
> Ex.
>
> $ objdump -wdr build/kernel/futex/core.o
>
> Disassembly of section .text:
>
> 0000000000000000 <__cfi_futex_hash>:
>        0:       b9 93 0c f9 ad          mov    $0xadf90c93,%ecx
>
> 0000000000000005 <.Ltmp0>:
>        5:       90                      nop
>        6:       90                      nop
>        7:       90                      nop
>        8:       90                      nop
>        9:       90                      nop
>        a:       90                      nop
>        b:       90                      nop
>        c:       90                      nop
>        d:       90                      nop
>        e:       90                      nop
>        f:       90                      nop
>
> 0000000000000010 <futex_hash>:
>       10:       f3 0f 1e fa             endbr64
>       14:       e8 00 00 00 00          call   19 <futex_hash+0x9>      1=
5: R_X86_64_PLT32      __fentry__-0x4
>       19:       8b 47 10                mov    0x10(%rdi),%eax
>
>
> Any change to the layout here *WILL* break the FineIBT code.
>
>
> If you want to test, make sure your build has FINEIBT=3Dy and boot on an
> Intel CPU that has CET-IBT (alderlake and later).

Yeah, I understand now. As I see the definition of CFI_PRE_PADDING, I
know that things is not as simple as I thought, as the layout can be differ=
ent
with different config. I'll dig it deeper on this part.

Thanks a lot for clearing that up for me. I'll test the CFI_CLANG and
FINEIBT together with this function later.

Thanks!
Menglong Dong

