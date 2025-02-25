Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F6BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo37nMWc2E1LwezPKSvhNG/2wTFA2DkyTJqWyZNejzM=; b=Cv4WOxaiZr3vGpJg771qD1EkS/
	spoMiRjTvN/InWwKXyAd6RdZyhW2yChGwNLUtNh46bFsjoMRwm7c/Q9ESKnmvypIZH9xadHKgCy/D
	DPeUgkSbEZ+Xmcv1MBckoTUZs01b+1WL2x+x+/lddm3ZSfFiZgPY9HVOF8o2j8IuhTokEfMb2hWxW
	6ujVez69AqGiJUeyA+02Shwm8YOfiLdcAb98zFhJj9X+SXbxG+KM473NmakragC6OlffK17S6fEWy
	lwvpjwNfRAxIhPrKIyIeh3PYgpRAhWSAIkCjMfoN4ZDfXB3Fz+xam0N8XJ7oF8AwDKVh/wq9O3uBd
	Pq/IajsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjMj-0000000FfTa-2ITJ;
	Tue, 25 Feb 2025 01:04:05 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjLD-0000000FfHX-2kVG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:02:32 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-220cad2206eso109743805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740445350; x=1741050150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mo37nMWc2E1LwezPKSvhNG/2wTFA2DkyTJqWyZNejzM=;
        b=gNbHzue6h2hWE4qg7a6kLoa9As+VAMNJEVp0tDjFUSTSt7HLkieKpdWOkad+jlH96Q
         2g/RB6ta52ib2bxncbRltLlYfwgq+QvZg3Uk/qS2gVc584cl7yOok87wLhzObkEzlwsD
         Zrpx5/75VFwnuyw67Uh08mZDMc6PaBf/8xSd4TQ193BrVl0gSeo/46+KGs6ol/bZd7yK
         yatQJ/vtzfA7AkcxYG9ikQCd3iE8iBtc6DW55gYdgPV4db/C3byuGCx9vK+gfkXnJAoe
         VzQAvTx4eWm7HsMQKkQmFHrcxtQ4am4/mFfCdPAwxyAgssREEoDfcn4gJJMuEsjMKAas
         R0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740445350; x=1741050150;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mo37nMWc2E1LwezPKSvhNG/2wTFA2DkyTJqWyZNejzM=;
        b=qqT0AfgV7RixA5AVOLQ+5vbPcclYyEma2tFFLy+dISryx15us6loUFrwXbZOpjo1r7
         lHHApRGfzwL1zw9C5DFsQG8dJnImVEM5dyq/lvI8Hu3FMtXbdBEl2pGeno9DNTd8zXT4
         C1QQIvKiMSWD2w3tzLFoHGoxb8OEJDQDBGlRE5wvhogok1lQOKmfoQhXfO52m7ITYB3o
         yM0uL29qLZOoO8+SIgSjoqMRWmRmLdAVC9Mi9bH2s64BOCt2y74j75YaPeetaabemb4X
         +1cYJwD33fI6DmAvQyKp/6f1HuhnT+hH3pzEBtea9P9Lf9Tt3nSu4XaivyYipsTSzPNj
         BtOw==
X-Forwarded-Encrypted: i=1; AJvYcCVP6JBmUQ+8fkoKsWpQO/TPrxFxGKiJxNtTjB9mM2BYzmSwqDcPvzhaItjx0o97jHtlN8FsmE9/11kUlr8G5Xgz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ZqN9L1R8O9QEbV0z3BtGBR89TQn7vQbE/fX7h1Au+NhGKwtd
	ML2le9PyWEGysidMX8y808mGJNmS1aiMYx25sdSIIxnNCDG1oCPUQRTBb7EgxOXnfP2Amj2rYw=
	=
X-Google-Smtp-Source: AGHT+IGtpAtsGCPjB2f5j0E5FgCN/59sQH7uEbks2l54K32niqYIQGBiUJC1+FY38Cpr/+RR4wt4Jz9Ubg==
X-Received: from pfbit4.prod.google.com ([2002:a05:6a00:4584:b0:732:770f:99fe])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:230b:b0:734:9cc:a6e4
 with SMTP id d2e1a72fcca58-734791ab6bfmr2328539b3a.21.1740445350440; Mon, 24
 Feb 2025 17:02:30 -0800 (PST)
Date: Tue, 25 Feb 2025 01:02:24 +0000
In-Reply-To: <20250210083017.280937-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250210083017.280937-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250225010228.223482-1-wnliu@google.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
From: Weinan Liu <wnliu@google.com>
To: wnliu@google.com
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	puranjay@kernel.org, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_170231_719298_7B746576 
X-CRM114-Status: GOOD (  17.50  )
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

On Mon, Feb 10, 2025 at 12:30=E2=80=AFAM Weinan Liu <wnliu@google.com> wrot=
e:
> I already have a WIP patch to add sframe support to the kernel module.
> However, it is not yet working. I had trouble unwinding frames for the
> kernel module using the current algorithm.
>
> Indu has likely identified the issue and will be addressing it from the
> toolchain side.
>
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666


I have a working in progress patch that adds sframe support for kernel
module.
https://github.com/heuza/linux/tree/sframe_unwinder.rfc

According to the sframe table values I got during runtime testing, looks
like the offsets are not correct .

When unwind symbols init_module(0xffff80007b155048) from the kernel=20
module(livepatch-sample.ko), the start_address of the FDE entries in the
sframe table of the kernel modules appear incorrect.
For instance, the first FDE's start_addr is reported as -20564. Adding
this offset to the module's sframe section address (0xffff80007b15a040)
yields 0xffff80007b154fec, which is not within the livepatch-sample.ko
memory region(It should be larger than 0xffff80007b155000).

Here are the sframe table values of the livepatch-samples.ko that I print
by qemu + gdb.

```
$ /usr/bin/aarch64-linux-gnu-objdump -L --sframe=3D.sframe ./samples/livepa=
tch/livepatch-sample.ko
./samples/livepatch/livepatch-sample.ko: =C2=A0 =C2=A0 file format elf64-li=
ttleaarch64

Contents of the SFrame section .sframe:
=C2=A0 Header :

=C2=A0 =C2=A0 Version: SFRAME_VERSION_2
=C2=A0 =C2=A0 Flags: SFRAME_F_FDE_SORTED
=C2=A0 =C2=A0 Num FDEs: 3
=C2=A0 =C2=A0 Num FREs: 11

=C2=A0 Function Index :

=C2=A0 =C2=A0 func idx [0]: pc =3D 0x0, size =3D 12 bytes
=C2=A0 =C2=A0 STARTPC =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFA =C2=A0 =C2=A0 =C2=A0 =
FP =C2=A0 =C2=A0 =C2=A0 =C2=A0RA
=C2=A0 =C2=A0 0000000000000000 =C2=A0sp+0 =C2=A0 =C2=A0 =C2=A0u =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u

=C2=A0 =C2=A0 func idx [1]: pc =3D 0x0, size =3D 44 bytes
=C2=A0 =C2=A0 STARTPC =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFA =C2=A0 =C2=A0 =C2=A0 =
FP =C2=A0 =C2=A0 =C2=A0 =C2=A0RA
=C2=A0 =C2=A0 0000000000000000 =C2=A0sp+0 =C2=A0 =C2=A0 =C2=A0u =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u
=C2=A0 =C2=A0 000000000000000c =C2=A0sp+0 =C2=A0 =C2=A0 =C2=A0u =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u[s]
=C2=A0 =C2=A0 0000000000000010 =C2=A0sp+16 =C2=A0 =C2=A0 c-16 =C2=A0 =C2=A0=
 =C2=A0c-8[s]
=C2=A0 =C2=A0 0000000000000024 =C2=A0sp+0 =C2=A0 =C2=A0 =C2=A0u =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u[s]
=C2=A0 =C2=A0 0000000000000028 =C2=A0sp+0 =C2=A0 =C2=A0 =C2=A0u =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u

=C2=A0 =C2=A0 func idx [2]: pc =3D 0x0, size =3D 56 bytes
=C2=A0 =C2=A0 STARTPC =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFA =C2=A0 =C2=A0 =C2=A0 =
FP =C2=A0 =C2=A0 =C2=A0 =C2=A0RA
=C2=A0 =C2=A0 0000000000000000 =C2=A0sp+0 =C2=A0 =C2=A0 =C2=A0u =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u
=C2=A0 =C2=A0 000000000000000c =C2=A0sp+0 =C2=A0 =C2=A0 =C2=A0u =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u[s]
=C2=A0 =C2=A0 0000000000000010 =C2=A0sp+16 =C2=A0 =C2=A0 c-16 =C2=A0 =C2=A0=
 =C2=A0c-8[s]
=C2=A0 =C2=A0 0000000000000030 =C2=A0sp+0 =C2=A0 =C2=A0 =C2=A0u =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u[s]
=C2=A0 =C2=A0 0000000000000034 =C2=A0sp+0 =C2=A0 =C2=A0 =C2=A0u =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u



(gdb) bt
#0 =C2=A0find_fde (tbl=3D0xffff80007b157708, pc=3D18446603338286190664) at =
kernel/sframe_lookup.c:75
#1 =C2=A00xffff80008031e260 in sframe_find_pc (pc=3D18446603338286190664, e=
ntry=3D0xffff800086f83800) at kernel/sframe_lookup.c:175
#2 =C2=A00xffff800080035a48 in unwind_next_frame_sframe (state=3D0xffff8000=
86f83828) at arch/arm64/kernel/stacktrace.c:270
#3 =C2=A0kunwind_next (state=3D0xffff800086f83828) at arch/arm64/kernel/sta=
cktrace.c:332
...

(gdb) lx-symbols
loading vmlinux
scanning for modules in /home/wnliu/kernel
loading @0xffff80007b155000: /home/wnliu/kernel/samples/livepatch/livepatch=
-sample.ko
loading @0xffff80007b14d000: /home/wnliu/kernel/fs/fat/vfat.ko
loading @0xffff80007b130000: /home/wnliu/kernel/fs/fat/fat.ko

(gdb) p/x *tbl->sfhdr_p
$5 =3D {preamble =3D {magic =3D 0xdee2, version =3D 0x2, flags =3D 0x1}, ab=
i_arch =3D 0x2, cfa_fixed_fp_offset =3D 0x0, cfa_fixed_ra_offset =3D 0x0, a=
uxhdr_len =3D 0x0, num_fdes =3D 0x3, num_fres =3D 0xb, fre_len =3D 0x25, fd=
es_off =3D 0x0, fres_off =3D 0x3c}

(gdb) p/x tbl->sfhdr_p
$6 =3D 0xffff80007b15a040

(gdb) p *tbl->fde_p
$7 =3D {start_addr =3D -20564, size =3D 12, fres_off =3D 0, fres_num =3D 1,=
 info =3D 0 '\000', rep_size =3D 0 '\000', padding =3D 0}

(gdb) p *(tbl->fde_p + 1)
$11 =3D {start_addr =3D -20552, size =3D 44, fres_off =3D 3, fres_num =3D 5=
, info =3D 0 '\000', rep_size =3D 0 '\000', padding =3D 0}

(gdb) p *(tbl->fde_p + 2)
$12 =3D {start_addr =3D -20508, size =3D 56, fres_off =3D 20, fres_num =3D =
5, info =3D 0 '\000', rep_size =3D 0 '\000', padding =3D 0}

/* -20564 + 0xffff80007b15a040 =3D 0xffff80007b154fec */
(gdb) info symbol 0xffff80007b154fec
No symbol matches 0xffff80007b154fec
```

