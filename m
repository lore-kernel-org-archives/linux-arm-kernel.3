Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3A1C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=; b=odXtBehWRKZHH3XNSsunLb2M1L
	jXXyzUufWNV8Yh4EKVdlfok6tuqpa6wY2KmxSE2oaOfkaKto9Y67X6xPeZ8dP3rr6bHMUHEGGnlic
	WlRXRDBzrt74uXKc4dCjSDLhIv2EZOrSonLp8v2g+5XF2yQt6VKcXSv3ffXGAVwW77Rydh6WdElt4
	JH+yn2xbXAYZew5Y6axF62znjxkUfK3fUVCUoXusWPID7XAJQXp6PlYxzyj2jzqIZAGYhtEd13w4h
	OFfFrfCUZxdcEUkJuJxMK4bcROaVcg0txlgGxj2EQ782Akf5VFUZsY7aJJ6KTWhEpYqGZUc6B0Xbp
	aUo8t3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WFN-0000000EA1v-1hKM;
	Fri, 18 Sep 2026 10:55:14 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WFK-0000000EA1A-2uXX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:55:12 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so74887466b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789728907; cv=none;
        d=google.com; s=arc-20260327;
        b=IiJ0kuVQ1soV8nvlInej8G2J8Qblcmodjftykm9FPIEu0OUm+csB9rK/5uyQLnUdZa
         Dl7Tby48tf9W5woBVGPUyZaCFO5b6kfY6Pzm/kb70JN1zez1aQT9N5u1o1ou10eyCXcl
         QO3GCh4jx+MWeNv35HoYFXJt9MjoCSGMp91ipU3t6YS5g4MJOLP0PuXdtCs1bTehmjJW
         YxDxIf2Wdcr5pGH4IoyR6Bh6pRmQiumT8IxhqhlYFSw0FlCBKxM+ao7lPawhrFKOQYcI
         dXsCBPCihktjDCKKku4nlW8+VXjw1fhSP2NIx6ADxeJkEtcidVW7NtGuNVHRvmnZdYKh
         cOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        fh=rJmkFGwXvmVc0CJKygGX5e1ZMgI/o3pydmHVLx3I7fM=;
        b=qKFI10ldpp+vNPFcxU37fgJkRmiYdzy/OVTMfuTh7ectZkkolWObzqt1dd093Zs4BL
         TZR0Ro4gAlze1eUEbj9E1kMCvIOKVlqk+egiiolSMcPEQit4rMyuT8K64gkchaukd2RM
         WEnA6c1dgD4ANDUnur7N9qF7aMd5+wxF8IpiHxWYLAn6wKYbV5F/rb1X+JJyxagZ+zRX
         ymaFtgvPnIg1U3AfOBF/WLGrkcKfc80XoodJuVV8uF4bzg4cyP51G1yozcEiD6JBU8g+
         n2Davbtoi6MkKu+kWZv0NSBW6vjM7kQWO5HYp2crzIakg8oaX7I7zS/UObdi4iLfoHzs
         kU4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728907; x=1790333707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        b=MR0pwSbKSmThOfvhFxaLTueqlBPs6O4Sq1lR163krMZL7eOS/4I/7sZd649QgYz3WB
         WkHrDZXKQVDokjNtI/WGTofnOeHFkWlHFQ/dKo82dibropuku8TPSzVjEAFQ1vm9dX+q
         c8o3URC5zwulMg4SgEYcSkBD/8Q/CG1qcakq88CLE8O8oyKu8xXPDsdC6Yk0zo+5nRRS
         1TAU6W31zFeWoWDnJ9rEw2X3lOCrTsAr1rUp2A5G/rNN0ZUSa13fX4FFjY2H1KnmI3u2
         Wjk8TKlGeoZeY1ZDc/+/7QReGzidcghNTs6uhOU99sgvMhTz4Nrl2Wcf/Af2y4uvTDNP
         J7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728907; x=1790333707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9KFaw0r3zy7as/jjFJHUlbx8sYj2YFXt4OlbArB54Y=;
        b=TvWVMbXHmC2R5tTf1GIVC3jL4Wjk0wyLlepH4q5CAcaGM5cUWkCcQomqYBfu/crUv5
         5ILbjqapd+h5CmGDEkauON18EF4Y62JLpAN3r7az6S4vYWPX/5pjU4cl5jF1v95uDR5A
         zB+nuueSBJ3szfY9KO/jHDULhdEoeazfQqJvMviw4vbNcffIYU3xrz+WzsfT6Tyh+3U3
         pQspDAfUBmJruPYgwBRu5AunUvH0UWfNXtM+KrSd3ZIgTmqlan3eIFlcmIPTBZ2d8ZDe
         3Jg0Cx0qwCSoDELC7ooANCjbNfZMVsyfb7n6HuCjvcqeQp+Lh0oiTHxV8rl9XCkZROca
         fduw==
X-Forwarded-Encrypted: i=1; AKwUvBzM3PBATRIpFKvdm+VicEQMAh7j9joNOOFhTSmaneqmClpk34dKY5trN9STmP+TFqPtU2MugjFGEsw7/fwTZxcY@lists.infradead.org
X-Gm-Message-State: AFuF++k73G/JZGBguYuvqWG09b3fhFTb47xgRF7zyExzg5HLeBP0h9S4
	y2nhhp8RYAlaV/uoff16D2mQ3JPcSl1rNPtP3Au2cFC3AjcLMa6mmebK2/n8bqs9jGOwSB+1J5H
	E4X7VA7M2DgBgTdXgFL9y6T2PdpsOilI=
X-Gm-Gg: AYBFou0yrm6XsJlxvFL8cwA2dFPXUJKFeOVUQsKzWUpqeSAX4ZQtBFp+4NgKiG5ETr6
	BIZdHWlrOUnnnZhUpvfweKwy9Zi0Ocrjb/wRWpGjBHiEcCEmf0QJ5RM3/LFdoQbgFDWOQVapsf+
	Fohr4jyq5+bU+54WdPkXuJNfSgb0S/FsEYBMu2nkltL1du489d3LsILCXq+pZX3g42OI8raGzQK
	Ke+3Q5VdrvFbj+lV94STzWKeZuYzV3mSE0Ul6bYq3dT7BzYkEe9M67tATT85W/EpED2B5UyoW5G
	URhoRk3ctIYlXEUAL6GGPgKfQeg05PBF2wab6Sb82hDND2yk0x2EqTwyCpwniov4l2xB+O97Tia
	QCaNeeY5d9blcTaVxauxwVoqQLcZoJ7E41CY1tPncACP7gD+LARuW
X-Received: by 2002:a17:907:d0a:b0:c28:ec7c:27ae with SMTP id
 a640c23a62f3a-c2a15aecddfmr221737866b.25.1789728906928; Fri, 18 Sep 2026
 03:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-12-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-12-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 12:54:55 +0200
X-Gm-Features: AcwNN1XYBCc8XytQv7lpPsMdlPdL7ChQXyccU8FUv6otEOv13o1h6_2iRPXOShM
Message-ID: <CA+=Fv5Q+sOLmT0Wf3OGdKw=mBt_EoS8ZQDF3wwGrm2-2vnOYgg@mail.gmail.com>
Subject: Re: [PATCH v7 12/13] alpha: Remove alpha_ prefix from custom syscall entries
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_035510_764341_8B1FF9DA 
X-CRM114-Status: GOOD (  21.50  )
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

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:48=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Some architectures need special entry points for some syscalls (like
> clone3). The current approach is, instead of having a special name like
> arch_syscall, to name if as __syscall. This is enough to different the
> common entry point to the architecture specific entry point.
>
> Change alpha special syscall entries to do the same. This makes easier to
> join the syscall tables. Leave alpha_syscall_zero because this syscall on=
ly
> exists in alpha anyway.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 9f2608de2544..8a85fcf117cb 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -879,9 +879,9 @@ ret_from_kernel_thread:
>
>  .macro fork_like name
>         .align  4
> -       .globl  alpha_\name
> -       .ent    alpha_\name
> -alpha_\name:
> +       .globl  __sys_\name
> +       .ent    __sys_\name
> +__sys_\name:
>         .prologue 0
>         bsr     $1, do_switch_stack
>         // NB: if anyone adds preemption, this block will need to be prot=
ected
> @@ -896,7 +896,7 @@ alpha_\name:
>         ldq     $26, 56($sp)
>         lda     $sp, SWITCH_STACK_SIZE($sp)
>         ret
> -.end   alpha_\name
> +.end   __sys_\name
>  .endm
>
>  fork_like fork
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 8fc4701a6328..a41276634923 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -9,7 +9,7 @@
>  #
>  0      common  osf_syscall                     alpha_syscall_zero
>  1      common  exit                            sys_exit
> -2      common  fork                            alpha_fork
> +2      common  fork                            __sys_fork
>  3      common  read                            sys_read
>  4      common  write                           sys_write
>  5      common  osf_old_open                    sys_ni_syscall
> @@ -72,7 +72,7 @@
>  63     common  getpgrp                         sys_getpgrp
>  64     common  getpagesize                     sys_getpagesize
>  65     common  osf_mremap                      sys_ni_syscall
> -66     common  vfork                           alpha_vfork
> +66     common  vfork                           __sys_vfork
>  67     common  stat                            sys_newstat
>  68     common  lstat                           sys_newlstat
>  69     common  osf_sbrk                        sys_ni_syscall
> @@ -242,7 +242,7 @@
>  309    common  get_kernel_syms                 sys_ni_syscall
>  310    common  syslog                          sys_syslog
>  311    common  reboot                          sys_reboot
> -312    common  clone                           alpha_clone
> +312    common  clone                           __sys_clone
>  313    common  uselib                          sys_uselib
>  314    common  mlock                           sys_mlock
>  315    common  munlock                         sys_munlock
> @@ -474,7 +474,7 @@
>  542    common  fsmount                         sys_fsmount
>  543    common  fspick                          sys_fspick
>  544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          alpha_clone3
> +545    common  clone3                          __clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.55.0
>
>

The fork_like macro now defines __sys_clone3, but the syscall table
entry is changed from alpha_clone3 to __clone3.

This should be __sys_clone3, like the other custom entry points.

I also confirmed this by building the tree at this patch, before applying
patch 13:

LD      .tmp_vmlinux1
alpha-unknown-linux-gnu-ld: arch/alpha/kernel/systbls.o:
in function `sys_call_table':
(.data+0x1108): undefined reference to `__clone3'

Patch 13 hides the issue because the common table uses __clone3 as the
ABI tag but correctly selects __sys_clone3 as the syscall entry point.

Magnus

