Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BDAC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 23:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxdC/62rAoRuJSWlwmGhWe4xUiKN8iX0091lT7RGSzg=; b=fkyFJ26EgI3tpa/2T+QuaYqD1f
	TLVMYoE6AyuoWRsA7fNIbhdasKeJHh3Ek9XvdEQXG6PQ8HfBuxAV0uv9FfxV0g56sM5TMRyb8400r
	doxfsjCKKKWtkXCOOG3r4xMcwGEPZN9JsD1SnghxqaW28+9Q36zobHymL4SleEvboAR9+sqjw2wda
	EYmKYGE9zDozdEt9VtcCMep08ssocaxcASAOoT8RjnbEJmUSqxD1KmcpNfsMuPK6K4LatAMbo9oV3
	8dWPcgThxHR4JvjVoUr3/WaWHEqI8KVxgJcxX6Zb/ssYvHeAAaL/1gN7tB9+xjmTDs+jw1+qLHnhZ
	Njtu4ZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4mw-00000001pX5-0y9c;
	Tue, 25 Feb 2025 23:56:34 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4lO-00000001pNY-2N4L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 23:55:00 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2217a4bfcc7so129729855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 15:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740527697; x=1741132497; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxdC/62rAoRuJSWlwmGhWe4xUiKN8iX0091lT7RGSzg=;
        b=j2U7wRudZcd/ofw0bbXeS2eZvDvXyS7soRGXk3YU10GrRf1ORELyc1TVDJRy3kp2S+
         6ZMpk3VCFfHcrcRn0Gb/mqh9vgIIoj8ToIZWGCFLw0AlKjn3EMpHqCRz/pTPG0obmc22
         DBIa4nxq+xKzkA/dHoWEb487fwn7i2INu5T4jxNKAzVYGUBhBMib7birICUdfJHEYcK+
         qZkO6eWw2x7bDCiytqO8WUGP3NdtMTKqIYTrRrHTNKUdXT8xNFiS5lXJqZQ2JAhC5S5g
         ZnCla7N3T8fMwkua7naMvQxZj5ti32ay2kwUYUvjDGddVlRvIocYmGFUGPBBF/7vxI2c
         ZOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740527697; x=1741132497;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pxdC/62rAoRuJSWlwmGhWe4xUiKN8iX0091lT7RGSzg=;
        b=k1fwWCpjSTGds69RSPkuYTe5RZiv7lHWdTUMJmQ+A6T5R1CfWOkpMO5UTDAgVXKYws
         1v7/X/VfYmMqqvWx0skI0pq7oE4xbtu+te8f5Tc5r6tQCpZuZyRAyB0pDaDM91N67qya
         dnQ2kF1lKkrqfNmcu7HbQsLizpHRaifnfclSbRN1ThlcLO9fTxtqCcrCH6+pfRproPZG
         h+mzqjEcKI11swXzAeiD0IRsAS8TEW+AW0rH9Ax/25dKcbmVMHdkrwdLLC2hGDjVe7Iz
         TUuxIbHU7GemXZmJYghGIm6ovfJ/peuXDyasklq4FuK664BOLf4PYqIKfDR5kwuF4ID+
         1KAw==
X-Forwarded-Encrypted: i=1; AJvYcCXeXzl72KOC2pz9df2i6XGcnKQ16eOCk0oNaapWNP4udqc9UtN2UvHciCj/PWoBw5ZuDAp4/OewwJjhvbD1hWzj@lists.infradead.org
X-Gm-Message-State: AOJu0YyYG0axTz1eqQD4+pPteahV/yvuBtzKH5gareoLCBQmwrP0E+2s
	p0hGixrVEBBnC9o7/dnJ1GmMEtEUBZs8uyjNgWdTXFlaF4jX3qVRH2adtSBmhZWtuiz4FkNDjA=
	=
X-Google-Smtp-Source: AGHT+IGm7OlvsiRCbKMLn2MJybb+vZ4eGRwGa0mzKMAShvASY73Heo8D8O95riW5nBaMdjkiDwddH2xcSg==
X-Received: from pljj1.prod.google.com ([2002:a17:902:c3c1:b0:220:ca3c:96bb])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f60a:b0:21f:752f:f2b1
 with SMTP id d9443c01a7336-221a1102975mr274878155ad.30.1740527696921; Tue, 25
 Feb 2025 15:54:56 -0800 (PST)
Date: Tue, 25 Feb 2025 23:54:54 +0000
In-Reply-To: <4356c17a-8dba-4da0-86dd-f65afb8145e2@oracle.com>
Mime-Version: 1.0
References: <4356c17a-8dba-4da0-86dd-f65afb8145e2@oracle.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250225235455.655634-1-wnliu@google.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
From: Weinan Liu <wnliu@google.com>
To: indu.bhagat@oracle.com
Cc: irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	mark.rutland@arm.com, peterz@infradead.org, puranjay@kernel.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org, 
	wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_155458_605025_3B50182F 
X-CRM114-Status: GOOD (  24.27  )
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

On Tue, Feb 25, 2025 at 11:38=E2=80=AFAM Indu Bhagat <indu.bhagat@oracle.co=
m> wrote:
>
> On Mon, Feb 10, 2025 at 12:30=E2=80=AFAM Weinan Liu <wnliu@google.com> wr=
ote:
> >> I already have a WIP patch to add sframe support to the kernel module.
> >> However, it is not yet working. I had trouble unwinding frames for the
> >> kernel module using the current algorithm.
> >>
> >> Indu has likely identified the issue and will be addressing it from th=
e
> >> toolchain side.
> >>
> >> https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666
> >
> > I have a working in progress patch that adds sframe support for kernel
> > module.
> > https://github.com/heuza/linux/tree/sframe_unwinder.rfc
> >
> > According to the sframe table values I got during runtime testing, look=
s
> > like the offsets are not correct .
> >
>
> I hope to sanitize the fix for 32666 and post upstream soon (I had to
> address other related issues). =C2=A0Unless fixed, relocating .sframe
> sections using the .rela.sframe is expected to generate incorrect output.
>
> > When unwind symbols init_module(0xffff80007b155048) from the kernel
> > module(livepatch-sample.ko), the start_address of the FDE entries in th=
e
> > sframe table of the kernel modules appear incorrect.
>
> init_module will apply the relocations on the .sframe section, isnt it ?
>
> > For instance, the first FDE's start_addr is reported as -20564. Adding
> > this offset to the module's sframe section address (0xffff80007b15a040)
> > yields 0xffff80007b154fec, which is not within the livepatch-sample.ko
> > memory region(It should be larger than 0xffff80007b155000).
> >
>
> Hmm..something seems off here. =C2=A0Having tested a potential fix for 32=
666
> locally, I do not expect the first FDE to show this symptom.
>

Yes, I think init_module will apply the relocation as well.
To further investigate, here's the relevant relocation and symbol table
information for the kernel module:

Relocation section '.rela.sframe' at offset 0x28350 contains 3 entries:
=C2=A0 Offset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Info =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Type =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sym. Value =C2=A0 =C2=
=A0Sym. Name + Addend
00000000001c =C2=A0000100000105 R_AARCH64_PREL32 =C2=A00000000000000000 .te=
xt + 8
000000000030 =C2=A0000100000105 R_AARCH64_PREL32 =C2=A00000000000000000 .te=
xt + 28
000000000044 =C2=A0000100000105 R_AARCH64_PREL32 =C2=A00000000000000000 .te=
xt + 68

Symbol table '.symtab' contains 68 entries:
=C2=A0 =C2=A0Num: =C2=A0 =C2=A0Value =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Size=
 Type =C2=A0 =C2=A0Bind =C2=A0 Vis =C2=A0 =C2=A0 =C2=A0Ndx Name
=C2=A0 =C2=A0 =C2=A00: 0000000000000000 =C2=A0 =C2=A0 0 NOTYPE =C2=A0LOCAL =
=C2=A0DEFAULT =C2=A0UND
=C2=A0 =C2=A0 =C2=A01: 0000000000000000 =C2=A0 =C2=A0 0 SECTION LOCAL =C2=
=A0DEFAULT =C2=A0 =C2=A01 .text
...
=C2=A0 =C2=A0 32: 0000000000000008 =C2=A0 =C2=A012 FUNC =C2=A0 =C2=A0LOCAL =
=C2=A0DEFAULT =C2=A0 =C2=A01 livepatch_exit
=C2=A0 =C2=A0 33: 0000000000000008 =C2=A0 =C2=A0 0 NOTYPE =C2=A0LOCAL =C2=
=A0DEFAULT =C2=A0 =C2=A03 $d
=C2=A0 =C2=A0 34: 0000000000000028 =C2=A0 =C2=A044 FUNC =C2=A0 =C2=A0LOCAL =
=C2=A0DEFAULT =C2=A0 =C2=A01 livepatch_init
=C2=A0 =C2=A0 35: 0000000000000000 =C2=A0 =C2=A0 0 NOTYPE =C2=A0LOCAL =C2=
=A0DEFAULT =C2=A0 =C2=A09 $d
=C2=A0 =C2=A0 36: 0000000000000010 =C2=A0 =C2=A0 0 NOTYPE =C2=A0LOCAL =C2=
=A0DEFAULT =C2=A0 =C2=A03 $d
=C2=A0 =C2=A0 37: 0000000000000068 =C2=A0 =C2=A056 FUNC =C2=A0 =C2=A0LOCAL =
=C2=A0DEFAULT =C2=A0 =C2=A01 livepatch_cmdlin[...]
...
=C2=A0 =C2=A0 63: 0000000000000008 =C2=A0 =C2=A012 FUNC =C2=A0 =C2=A0GLOBAL=
 DEFAULT =C2=A0 =C2=A01 cleanup_module
=C2=A0 =C2=A0 64: 0000000000000000 =C2=A0 =C2=A0 0 NOTYPE =C2=A0GLOBAL DEFA=
ULT =C2=A0UND klp_enable_patch
=C2=A0 =C2=A0 65: 0000000000000028 =C2=A0 =C2=A044 FUNC =C2=A0 =C2=A0GLOBAL=
 DEFAULT =C2=A0 =C2=A01 init_module

