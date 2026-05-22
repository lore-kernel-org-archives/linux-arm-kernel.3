Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D16CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 01:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evWN4o2PdgEaMsXywmWEKlFN1K+brrnFP7lHZsGBCh4=; b=eFYsonh75vT7shxrRC8FmLF880
	SGQ+EY0aCyPh1JyLHsuGrzbHfEzWdHJHH0BOJaIRg4A1aIrllWEJecZTZtNAvDSD5u9JRuttjlAWb
	V6gsZngPi6pP9X74GUDl1WCxJtumrnQd0uztssiCMChuZ5kkIj4mM2QsOHOlDQHPADtwW3/fKH3uj
	l/sCgFPI6gLNA3ExogSFE37OwpxsnLxjgqdQMVN3l++Xz5KHps3LCOgLuy3ILrB3ZUYEhvpZ3Gf1u
	61l+bhB1ciLisB1D7o+7uYl7B47fBf6eEOMkVvUTuuT2JlYLPVVNCSYij8gB8srOU7aJbL3BsaOEl
	1pNmnIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQEkD-00000009TzX-0o88;
	Fri, 22 May 2026 01:32:09 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQEkA-00000009Tyz-26Kb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 01:32:07 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-56a857578a8so2704940e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 18:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779413524; cv=none;
        d=google.com; s=arc-20240605;
        b=ZR6YLnhImie6CuVUbFp6SgRe9C6kLPDfGv9lDXA5Ubao+DzvpvjIr+mTSO2CZCrxM4
         eMKlaOSBU/F3qdEilIFnrGw2t4iudTBR/LjbjItSkBEGNnyxvg6OP2z5DooiCopTmmlr
         V/TlTBCqw+gAVmP0eazgzC+TKe4421MDm8XLrbigDeOYvqzIra4jR2mRmLiUFAyd1/Sc
         5th/E64kBWUyDiCpnuguDVq+p4dvS7JbTsoE682747YouWD7ZVNGL5svQbB/D4ca/mOa
         +bUX9ipb28IVCe2IPSxzDE4QcOQT7ODGXkN9BeQnGJVgVjJ/dF1CtCzIqHNdpiKeMWoH
         Iuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=evWN4o2PdgEaMsXywmWEKlFN1K+brrnFP7lHZsGBCh4=;
        fh=QvMII8GKIe4EUDTHGzDIjQmEfXh8tpIdQmQ9eSMhtLI=;
        b=BB6+GqmgLIYfHc9YrH/zDBDgZlN1jyhw22Rz2pWZxzjC+gln9VKil/6LNGsm3jyOYc
         qGs3yi62n1mEYaSKsr77gXOrcof0Hr+7Ov1nG63sDZjXs9G3+tIZlrXpN1zS571wxF2r
         LZXLTwp0D6Pxny2UyJUIyNE+YFlNzTxGDRN3/ML3x2WPYZfesaAm3soN+eXr3+fhdeZM
         d52pH9b17n02zYUGzIwc9fHIgl4vlWnEBJyJWIyoT+JPDi10/E6l/Zy9dViAtQSgO8p3
         weVAzE+n8mXuLqgyX030Y8oO32/J/RzeTK8Vb6jCBkljoAXUBUj2o19KD56qM++uX+0x
         jp5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779413524; x=1780018324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evWN4o2PdgEaMsXywmWEKlFN1K+brrnFP7lHZsGBCh4=;
        b=JVOWkMdFi1RnOnCCwgyYWjxGhI7RJjAsNmLmW/lJuqFHYrypTRljekPDm/FME4m9A7
         vg4Uv27lYgOKJ9r/lEHfSt5+k5QGGjvbb4Fy8Vx1yl9YSevFF1+f5Jg8rt030qXrk3kV
         0XQ/GYSFPQb93OQkLdk32VdvelFxgIlsXStcqEeNIsN+Od30pxHp3mkKVNDhE0kpgyk3
         WICnL/etsYz9KgqullD5PbHOA1+hOLqiRUh/1i4B0OKZJojvOqFGOBYnT2KKrI9ejyof
         u0Ifte3O9X+fL2xayBJiZ7mHViO+8VfnwtbkgpEX5FzneDnU7cRAYKAKZUsU1xMCc1v/
         h7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779413524; x=1780018324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=evWN4o2PdgEaMsXywmWEKlFN1K+brrnFP7lHZsGBCh4=;
        b=TYIIgGbrh/jH6YgdHAnxqmE3tQAKuw8bRxOe9DH04U8210ymOSGgOq0waxMIgI0n0L
         HBmQIVRi7JKnoqF/nYNOz86wCoSAkPbKHDzwVYNauCuXtTFxd6Cl66c4ok1vq452qJ6A
         bFf9eu+a4LjLQel6yRse2TJj3dUEJ3JV37P+hulICA2azgRBdeazjqDHi76i3LB/WFif
         IMU++pXQPF0P7ON/S6QBDUHRs25ujWRLa2cA/P3/NjM83pgRSTFy+te+6wjGwJyhRMPu
         rXpolx7eq2TC+bCwBDwMALigExCO4sRafSrryfxJ1zLxaSVGFfvUX3echUjxUfypz4CA
         vVNg==
X-Forwarded-Encrypted: i=1; AFNElJ/e4Ym6PFIeGka5v8sejKI20Se/n1cT97q/3cQ72k/MJWnw25uR9JEj0oL3zblApspwWwifJIrUhHO1qmiZ3u7n@lists.infradead.org
X-Gm-Message-State: AOJu0YxaFi0NcZIAqziZHcn4oINFJL4diOpihewbrVLXkVK9xMmhCg5q
	RGrgMmPQbDzeerEhVwDV+pH+8k1XDNL9okHA5W0K2WDyVImLhGw6bd0B2GleS3vZKRPXZ+T3mPt
	p3Sj4MVWCzWxC1wCa1evHxkuHENRgGYfcABK2Jmyu
X-Gm-Gg: Acq92OH8366pfKKX/r/zjCRtTLg4IIJ8fqSQ5qPxprt5rTIU9fuyv78Wao1UEBUfmdL
	ljeoIPGhxkJ3DWEcrRt4zl8LWhgC2SbuR2/L8ooDm/r5jwRhPlGMBmHM3vykwOcDuwPsr83hg+d
	nl54LLnMxnN19yPKk7gYEjFWOZBKLjAc7TbFM3vj4fq3taLlNHdhvNb6SQ3BoiMAyO+bkQaSiyI
	h/CBWt8OWDnQFa/cZ3OjV0WiGPZbxr1swWcphl2nxASDHzrJ53+yTnzaeMWwGPo4cuHBW1k424/
	WiExP67Y4vMyR6NFwfku8eyS+yto
X-Received: by 2002:a05:6122:f07:b0:575:38d3:7c8a with SMTP id
 71dfb90a1353d-5865d70cb74mr1094512e0c.2.1779413523699; Thu, 21 May 2026
 18:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260417150827.1183376-1-jremus@linux.ibm.com> <20260417150827.1183376-4-jremus@linux.ibm.com>
In-Reply-To: <20260417150827.1183376-4-jremus@linux.ibm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Thu, 21 May 2026 18:31:52 -0700
X-Gm-Features: AVHnY4KAknobCrHCkqLhBmqFlo9cUBMFlT1kwp0iCS_e9i_w_tU63ky-Lla4P9A
Message-ID: <CADBMgpwCuYCYPSOCvcm0-rXS=cvFZ-GsP5V1GJFEhghF5JMUDg@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64/vdso: Enable SFrame generation in vDSO
To: Jens Remus <jremus@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steven Rostedt <rostedt@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Weinan Liu <wnliu@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_183206_590928_D70FCBD2 
X-CRM114-Status: GOOD (  21.97  )
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

Hi Jens,

Sorry for the slow reply on this.

On Fri, Apr 17, 2026 at 8:08=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
> This replicates Josh's x86 patch "x86/vdso: Enable sframe generation
> in VDSO" [1] for arm64.
>
> Enable .sframe generation in the vDSO library so kernel and user space
> can unwind through it.  Keep all function symbols in the vDSO .symtab
> for stack trace purposes.  This enables perf to lookup these function
> symbols in addition to those already exported in vDSO .dynsym.
>
> Starting with binutils 2.46 both GNU assembler and GNU linker
> exclusively support generating and merging .sframe in SFrame V3 format.
> For vDSO, only if supported by the assembler, generate .sframe, collect
> it, mark it as KEEP, and generate a GNU_SFRAME program table entry.
> Otherwise explicitly discard any .sframe.
>
> [1]: x86/vdso: Enable sframe generation in VDSO,
>      https://lore.kernel.org/all/20260211141357.271402-7-jremus@linux.ibm=
.com/
>
> Signed-off-by: Jens Remus <jremus@linux.ibm.com>
> ---
>
> Notes (jremus):
>     @Dylan:  Adding -Wa,--gsframe-3 to the VDSO CC_FLAGS_ADD_VDSO (and
>     AS_FLAGS_ADD_VDSO) may clash with your patch [1] that adds likewise
>     to the CC_FLAGS_REMOVE_VDSO.  Any idea how to resolve?
>
>     [1]: [PATCH v3 2/8] arm64, unwind: build kernel with sframe V3 info,
>          https://lore.kernel.org/all/20260406185000.1378082-3-dylanbhatch=
@google.com/

In a kernel tree with both your patch and my [1] patch merged, I
believe we'd want to hold two invariants true:

1. If HAVE_UNWIND_KERNEL_SFRAME=3Dn, we must not build the kernel with .sfr=
ame.
2. If AS_SFRAME3=3Dy, we must build vDSO with .sframe.

Since HAVE_UNWIND_KERNEL_SFRAME=3Dy implies AS_SFRAME3=3Dy, I wonder if we
should be able to drop CC_FLAGS_SFRAME from CC_FLAGS_REMOVE_VDSO and
move some definitions:

diff --git a/Makefile b/Makefile
index 227fda16deb1..ef059bccb8c1 100644
--- a/Makefile
+++ b/Makefile
@@ -1147,12 +1147,15 @@ endif
 # Ensure compilers do not transform certain loops into calls to wcslen()
 KBUILD_CFLAGS +=3D -fno-builtin-wcslen

+ifeq ($(CONFIG_AS_SFRAME3),y)
+CC_FLAGS_SFRAME :=3D -Wa,--gsframe-3
+export CC_FLAGS_SFRAME
+endif
+
 # build with sframe table
 ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
-CC_FLAGS_SFRAME :=3D -Wa,--gsframe-3
 KBUILD_CFLAGS  +=3D $(CC_FLAGS_SFRAME)
 KBUILD_AFLAGS  +=3D $(CC_FLAGS_SFRAME)
-export CC_FLAGS_SFRAME
 endif

 # change __FILE__ to the relative path to the source directory
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makef=
ile
index e90427a8d0f6..f03cac27857c 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -15,10 +15,6 @@ obj-vdso :=3D vgettimeofday.o note.o sigreturn.o
vgetrandom.o vgetrandom-chacha.o
 targets :=3D $(obj-vdso) vdso.so vdso.so.dbg
 obj-vdso :=3D $(addprefix $(obj)/, $(obj-vdso))

-ifeq ($(CONFIG_AS_SFRAME3),y)
-  SFRAME_CFLAGS :=3D -Wa,--gsframe-3
-endif
-
 btildflags-$(CONFIG_ARM64_BTI_KERNEL) +=3D -z force-bti

 # -Bsymbolic has been added for consistency with arm, the compat vDSO and
@@ -42,12 +38,12 @@ ccflags-y +=3D -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
                        $(RANDSTRUCT_CFLAGS) $(KSTACK_ERASE_CFLAGS) \
                        $(GCC_PLUGINS_CFLAGS) \
-                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRAME) =
\
+                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
                        -Wmissing-prototypes -Wmissing-declarations

-CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables
$(SFRAME_CFLAGS)
+CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables
$(CC_FLAGS_SFRAME)

-AS_FLAGS_ADD_VDSO :=3D $(SFRAME_CFLAGS)
+AS_FLAGS_ADD_VDSO :=3D $(CC_FLAGS_SFRAME)

 CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_vgetrandom.o =3D $(CC_FLAGS_REMOVE_VDSO)


If done this way I think we will add the -Wa,--gsframe-3 twice when
HAVE_UNWIND_KERNEL_SFRAME=3Dy, but maybe that's not a problem? This
could probably be folded into either this patch or mine [1], depending
which is applied first. I'm happy to rebase my unwind-for-kernel
patches onto this series, or we can do the other way around if that
works better.

What do you think?

Thanks,
Dylan

