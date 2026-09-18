Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E81BC982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=; b=EiuCloxFmfLeouf+x38ikxW4pe
	nyOKpTePO8eUq7HTdeUmCiySo2H4E+LJe8e4m53ilOHhfeOPQs6V70gUZ2zMOQQx+Y6KFgfshKdRx
	/1pWnpkbpViz7gvoaLm5YAxyex4UPrJkMvvK1EWQF9XqZYhr8JshpciI9p+chTOzkM3dBhYSkKqth
	6G8CItxCeFBFGil+0JwY0SoT57KPNmwY8NfD+NMkIFuuVA/RpSAJwuTv7H4FsLmtlmpo8t7cRAeIY
	X9cgjtR387crz8gKGja2Y98bVoJcIqB6KT4bTfQQeD3+5V3uebMUsFHayLsz5rkCZA0rUpnAG+wOC
	221mRFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WHW-0000000EAFo-3XFE;
	Fri, 18 Sep 2026 10:57:26 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WHT-0000000EAF8-0pyb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:57:25 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29703cb470so92711266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729041; cv=none;
        d=google.com; s=arc-20260327;
        b=CGVjgjSfNTHBDgI/ZQHXKT1kbabr2MDclx52fivFV70oD9vvc1zqys69Wc33YzLSH/
         v4dHrvQNcN9lRQyCM7QnMrc/nkWXVafkU8wzDfAhLKq0M/iR4Kfsp+pPXNatIbqPzRAL
         mk5Z/4PSyQ2ELXwNWK9S0IH6eYmN+Z2DMJ5iR2tL6JURu+2303OV5gPQ7buENdPc/OX7
         qRbYS5PAMv5dF0ZEADb045eEH8tl7MLPsktXD0JQW6aOzehRyb7uVA9fvjIukDtbr8p8
         zVepBRDVXTn49NjrLKzw7I/pgTB/VdPeHTmxbr5GsL7L0t39icF+i6jvJdcHk2YwGkI1
         0ihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=;
        fh=b+FChtHrQClkp2K7irIW8WRCJ5qpZyat6yNMPt4pGMY=;
        b=Oe062yvXbhYEwlMV0MnYZBp0iNBhnIipVFM3mAzMKxYOi0EU5Q2Jr3DfLFsxyXocEL
         BR4pbHbeJANkG3/ejvUDhotR0CEYyAEUeyDUX29MqhEZWR3CUSewmAJW8n6YDlBMqE9q
         pHvYJuyR4GjPfJaYJt9NXpK949CKkLLzNyS4MtoWOCfWM5VyCHA/DMAzFa+lG1gXKO90
         AImw3QeFmCEKsxwshtR6s834+2zh6VayItgwGdaPHfuM/WxHQ5D24N3ucbYrVWyuJTGa
         UTl00A//++DfiWE4X3xprW/YiU76mqG02BXeI0jacieiNzjXWSKQV09FB0XQII645x6+
         EWcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789729041; x=1790333841; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=;
        b=pRZRl4toJx6jIl9r5wwXx5f6Zyxwp5wlQtKRLgULRZS0p7Tfqnh0CM/exzBSlUFaiB
         aty2QtEz6ddqfJvKElj58NS4rHazkuJnl8DgbD9xKPxNLVrFC+Cd1ulkAKK4HVp9eqWd
         spoEdhdL1TfkwTT/AuJ4Nw1afhZ1IJNSwZufDUSwGxibfSaHa66jZKNvwVEmprpC6xI3
         MNMVWm5dlXlDlM6BjzGfsmO3VTc5cV1QUzB7WWQXgIXbhVnI8MiVBim86j09kQIwOsDr
         Mx9XYTeV+W3qO0DXOK8y1SmX4XI4q8BfAp16OLXyrV+BmO0sYw+WbLJzfe3pt+cAEhoQ
         VcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729041; x=1790333841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STfWB7GvLQfZTNQp3BOqhn0t82awjzhOdLfYzJJuSYw=;
        b=ip25FXubPIndB3LGnYsUIRw+34Gs7oyyiedEcQP1q7CRwIx5Ta9LS78WrnKjiZ49nw
         iNz5cvOFLYjzmxclTSinXEKijFXRXvmPBuYKAamjCl7MfHVrWB7SsGwPglVKMJp/wkbh
         x1/mYH/fndis/zB+bhHBSVDMtkkZ7VcDmpjPtt/v+TcdEdgcWgu+xIpzUbG9antpyrbM
         a4lme68WrBDvy4K9BqcZNapQPs/T3clHLhDe67LZUlZIdNfR2ieBCLyh4rtizcEmzAlc
         QWWkDPLfRzXr8hO3iSLG6/zgBGezSIEbynd+m2nD0gaaG4lA0zbQXEr/0rV8cFflSv82
         lzog==
X-Forwarded-Encrypted: i=1; AKwUvBwBWS/E3Umo1Sfp0ONUz4VCNfURm4FmUDQlqZyXI1pnCyrwAtr3YTdxKkoB49Yv5vs7RyuDyX0oXQFBl/2Twb+i@lists.infradead.org
X-Gm-Message-State: AFuF++nuq1ifkhgEpbyMWTN9PQhRYJnaiFdWE1JQABTfiBR9oNQ5O0ud
	nfdPwTZEv7P66IK+ORQFZoulNbd7NomTUUiecKzn3ahcb4HQBXr2Xn9U2che5SOzzLyqTZXBL3U
	4Sh1OtbzLqT/N6CWwPu2II7XkbwK+sXc=
X-Gm-Gg: AYBFou3ssMbaQ7n3kZyyvmEVIgJqUpb0cSVMMIgPNO1c0eikiTWX/X/PdukNRrrqHm+
	8F1Q4CwCPJuC9UQath6/7gxA5zAPZdK1iYF5y1FKC+JVOqdM0fEgTj9DBaE2u7bBdP8jiSD3+hQ
	4Np8cZDCJqfwyH00zRRkbMgFAUWeN/q8T7TiOQSKAO1EsRJbvV3LTwwdbAC7V4G+97Z69vNNJVl
	TErJiczwzGzYL+XXki2ZGgmi/zkwl5m+OyRXMeLubwExQZgXXOKb+ooWFCxfX3dzBVZLrhtVHNq
	uwr6s6koL0nNbZNMOt7X/pqqy6ReE06HzoaBtLVleOLIbn9KmgovSHJIPoowTfQXX6xl4FtMzk/
	Pk23fW0liZLN62hz0O0PGgtgtJOTSvN4LwyCyhkx0Eb8yPvBo2k40
X-Received: by 2002:a17:907:3e9f:b0:c29:f5d8:9c6f with SMTP id
 a640c23a62f3a-c2a15802e80mr221037366b.30.1789729041100; Fri, 18 Sep 2026
 03:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-13-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-13-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 12:57:09 +0200
X-Gm-Features: AcwNN1XuAITXWKYUHlzEkxHeHjQM9QwjDHbUkRpVnBkp7VsqOue8wy8fg51lcyo
Message-ID: <CA+=Fv5Rx6Ccmxi2a2YmiMgc0Z7TaWvx8=27jpFE-k3Kfn8Q-ug@mail.gmail.com>
Subject: Re: [PATCH v7 13/13] alpha: Use the common syscall table
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
X-CRM114-CacheID: sfid-20260918_035723_276539_B1058137 
X-CRM114-Status: GOOD (  17.62  )
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
> Remove some of the duplicated code by using the common syscall number
> table.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/Makefile    | 14 +++++++---
>  arch/alpha/kernel/syscalls/syscall.tbl | 49 ----------------------------=
------
>  arch/alpha/kernel/systbls.S            |  1 +
>  3 files changed, 11 insertions(+), 53 deletions(-)
>
> diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/sysc=
alls/Makefile
> index b265e4bc16c2..03099daff6b9 100644
> --- a/arch/alpha/kernel/syscalls/Makefile
> +++ b/arch/alpha/kernel/syscalls/Makefile
> @@ -7,17 +7,23 @@ $(shell mkdir -p $(uapi) $(kapi))
>  syscall :=3D $(src)/syscall.tbl
>  syshdr :=3D $(srctree)/scripts/syscallhdr.sh
>  systbl :=3D $(srctree)/scripts/syscalltbl.sh
> +systbl_common :=3D $(srctree)/scripts/syscall_common.tbl
> +abis :=3D common,__clone3
>
>  quiet_cmd_syshdr =3D SYSHDR  $@
> -      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
> +      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
>  quiet_cmd_systbl =3D SYSTBL  $@
> -      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) $< $@
> +      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
> -$(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
> +$(uapi)/unistd_32.h: $(syscall) $(systbl_common) $(syshdr) FORCE
>         $(call if_changed,syshdr)
>
> -$(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
> +$(kapi)/syscall_table.h: $(syscall) $(systbl_common) $(systbl) FORCE
>         $(call if_changed,systbl)
>
>  uapisyshdr-y           +=3D unistd_32.h
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index a41276634923..7066a3920899 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -463,52 +463,3 @@
>  532    common  getppid                         sys_getppid
>  # all other architectures have common numbers for new syscall, alpha
>  # is the exception.
> -534    common  pidfd_send_signal               sys_pidfd_send_signal
> -535    common  io_uring_setup                  sys_io_uring_setup
> -536    common  io_uring_enter                  sys_io_uring_enter
> -537    common  io_uring_register               sys_io_uring_register
> -538    common  open_tree                       sys_open_tree
> -539    common  move_mount                      sys_move_mount
> -540    common  fsopen                          sys_fsopen
> -541    common  fsconfig                        sys_fsconfig
> -542    common  fsmount                         sys_fsmount
> -543    common  fspick                          sys_fspick
> -544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          __clone3
> -546    common  close_range                     sys_close_range
> -547    common  openat2                         sys_openat2
> -548    common  pidfd_getfd                     sys_pidfd_getfd
> -549    common  faccessat2                      sys_faccessat2
> -550    common  process_madvise                 sys_process_madvise
> -551    common  epoll_pwait2                    sys_epoll_pwait2
> -552    common  mount_setattr                   sys_mount_setattr
> -553    common  quotactl_fd                     sys_quotactl_fd
> -554    common  landlock_create_ruleset         sys_landlock_create_rules=
et
> -555    common  landlock_add_rule               sys_landlock_add_rule
> -556    common  landlock_restrict_self          sys_landlock_restrict_sel=
f
> -# 557 reserved for memfd_secret
> -558    common  process_mrelease                sys_process_mrelease
> -559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
> -561    common  cachestat                       sys_cachestat
> -562    common  fchmodat2                       sys_fchmodat2
> -563    common  map_shadow_stack                sys_map_shadow_stack
> -564    common  futex_wake                      sys_futex_wake
> -565    common  futex_wait                      sys_futex_wait
> -566    common  futex_requeue                   sys_futex_requeue
> -567    common  statmount                       sys_statmount
> -568    common  listmount                       sys_listmount
> -569    common  lsm_get_self_attr               sys_lsm_get_self_attr
> -570    common  lsm_set_self_attr               sys_lsm_set_self_attr
> -571    common  lsm_list_modules                sys_lsm_list_modules
> -572    common  mseal                           sys_mseal
> -573    common  setxattrat                      sys_setxattrat
> -574    common  getxattrat                      sys_getxattrat
> -575    common  listxattrat                     sys_listxattrat
> -576    common  removexattrat                   sys_removexattrat
> -577    common  open_tree_attr                  sys_open_tree_attr
> -578    common  file_getattr                    sys_file_getattr
> -579    common  file_setattr                    sys_file_setattr
> -580    common  listns                          sys_listns
> -581    common  rseq_slice_yield                sys_rseq_slice_yield
> -582    common  fchroot                         sys_fchroot
> diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
> index 68f3e4f329eb..9a67d29f7818 100644
> --- a/arch/alpha/kernel/systbls.S
> +++ b/arch/alpha/kernel/systbls.S
> @@ -7,6 +7,7 @@
>
>  #include <asm/unistd.h>
>
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, n=
ative)
>  #define __SYSCALL(nr, entry) .quad entry
>         .data
>         .align 3
>
> --
> 2.55.0
>
>

I tested the full series on my Alpha for-next branch, which also contains
the Alpha GENERIC_ENTRY enablement.

With patch 13 applied the kernel builds and links successfully and boots
normally on my UP2000+.

The issue I mentioned on patch 12 is hidden by this patch, since the
common table correctly selects __sys_clone3 for the __clone3 ABI.
Other than that issue in patch 12, I haven't found any Alpha-specific
problems with the conversion.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

