Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BA2D35662
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 07:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvYBFOS7U9oPfTJfaDp/8Jr0y/BighBAXi8T0H/T0xQ=; b=P5FtgLvl1rLEFUYN1x/nqNjGzV
	UcErvKxQsIgCa9ER4mQiv+MplyzpVNbWGS7gbJ0kwZfkehZ8yYq56hfOZBkVAhiFCCcb+3RM7XAhr
	BbTlzQ2uGlv6AgOiyoNvfHSx2EK1D+NQH5+cRA1+O+jK5m8BrfK60DNDFwV4PSacDx5akBzA248dc
	F9ebYGh4wIjLvY6bN7BE3fN9Ktct1aFI5QovVuQavmRT07Np0AQsnq83fVtfvhByOuLFcdFF3+WpZ
	uknu4JzDW9u46ukLZAMU7u7t/agYklzg4Ktc8eHEgDbBEL0BkaKI/xDV5yHKEvo8vIcb5/AH+LRTW
	U7p9PUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl02L-0000000Faa9-11zF;
	Wed, 28 Jan 2026 07:32:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl02E-0000000FaYV-3inG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 07:32:22 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a1462573caso43895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 23:32:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769585538; cv=none;
        d=google.com; s=arc-20240605;
        b=iHGa2G93OZFI33WxE4z64/jiiOxWKVCe18BWPc2wbAHZTU/xr2YNjWHqK8KbIlJ71f
         p6pFayXTV2P+qJfotNhjlEVYOFBcZzsOPacza31ST3uxxEBXI5lGHJSF2shIEDSbPZC+
         8ULQfDvmAim2q+l+e6QEvquhlxUozDoZ3I7VDfv77G6/e0q0wnlJwGnP+KaGjlq6Ldq0
         vmwSilaXD6Z+cNVMTUTfl1S5ZXWayN/Z+z58rmjO2brNKHDsvEw7cggCKX97QEPJR6hn
         v+qjl2lOt8RMdQm9xWY/o0cy76p0H8UDBbEM6ZtQ+1+M46B6vx1NsA0h4pwKXaTTpQIM
         Xrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SvYBFOS7U9oPfTJfaDp/8Jr0y/BighBAXi8T0H/T0xQ=;
        fh=m8yzdezvenwrl5xMdXdXw4ys2T5Lly8TTXL1kSbIxD0=;
        b=LdO30I2BZr6FwsnboctmOtFynWQHK/38xAuOLcaKC6j484QD0eJG6f21+3zYNEMgjD
         QhqUG4Dk6yPzTxXFIyXSsDFfMpxie3d/uz63E+yh6B92BfhueMK6Nye+X4f/yaeHdDwH
         1fIo2t+LSYBVgYndYxr9RXL5IkRhEoy3rBvNdTCtBFjI/6SMpOS5JUDc8hPr1cdTiux/
         /lnFdhRtsoHTYhZu0QYEm288Lq5pcKCUUuv2IHKkrtFq9DYQYtQGQ30xnj+LDCM8aj1+
         mp7awq/+QkzYbLNL/reeEOHivodSdH9OTbDCKgdpCnVLGMBrFfIin1937MHHdQt7G5oJ
         f7Yw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769585538; x=1770190338; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvYBFOS7U9oPfTJfaDp/8Jr0y/BighBAXi8T0H/T0xQ=;
        b=1NwD903hzLIrj6Tw5dVkxllNLH6tVzVwSjKGn6CfsuMgkS90kZEwJTa9NgwbOlpMu3
         zf/HrLeoLwSqwEhrzrym9Cz23tysRkvbWU3jNhI5pdONO/B5CVjRoBgF7vfIT5FaQT5F
         vwYzwBFOWocRWKbIbQRkYVRo2RNm9jBVwWEy01MWobyUmJkey76n1xGVOaVrxZfyY02S
         7/YHHvWCpB5cXn2WpDBMQikCAoNHMAUN2wnN6flvxy0TSqK6XX2ptfeo+R5ugdpLh+b+
         xtpNo0Yxq9A2rfS1VpS1EsbeQA2mlMTb1L0IqFh1Iypu7jmP66toQ7UQV4a1RInZ4I/h
         oZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769585538; x=1770190338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SvYBFOS7U9oPfTJfaDp/8Jr0y/BighBAXi8T0H/T0xQ=;
        b=IoK6pi7HQR0LAy3H+Nm9BYsvWAMOlGRIXS8ZjRKnBEQD1FnKmSU9GI50yTVTQbueQj
         eus5p7aNTU+2vQjOlQgnsrj4ci5Umm741yf+cpw76QGuwzycCCGU72ZSCmgX9Gz8s9cq
         hKBoIuJps5HaeRnGVCTj/9SwoDTepuVIm2jJ3UrYmOgOVuebqLnZjWf75yeR4eVn/moC
         BdnsXQkRJd+lIkoCYc0nYOawwhblSTeEC9tB2koK0yDAc/z1FaBWKpRYq90BXtmS6Jn/
         R1GMLxhjTSY3hJ/zghe1o3vZXO4oUOpSdS0ETrPSRYA20h9l7zdSQYvDHY/3Cm98581S
         r3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWsR7QKiCM4WaIii7sN7T7uiDVfOU7xHiwaj0b0JNRMvrDyGhBCVIjdBmBLdwbTg6AemTe4z61uocN3TxPqJb8G@lists.infradead.org
X-Gm-Message-State: AOJu0YwrqCD6KYyZhJcv0ahJlX8V4r8TiGb6t9w9hRZDXAJVDt+TTltK
	aiQ7pHoAS+NGGptfWgIvShM/2SAUnC2gKUJVoMqnLr51jZ91FxNVznzx/Y3bAmkiglWq9Qbq/V7
	T3cxL9AG/eVw7xqQu+PF2dcnrv4W9GIyfw73Em+th03tKdRhE23Ssd63n
X-Gm-Gg: AZuq6aLOwHSqQnI6vOGpWIa118Wifu7d0n/UzpTkfBzndGdl1FH/vA0IC7QSsVr4pTe
	nPtgusy1mAA2MqsfvjqYaBqI43FA8wOPlvLnWkkbw5YJfRbTT3mEVGf/GeQDUCKUVw71UgWAUw5
	JZwQ2auA8+SR0pgDZLqS/YxFBldRCn+jJjR2o9ukN+hPfuaL9/+WmpVykgEySEQJOU/DEXduD3D
	tD1SFPvKf5nLr5pgIXdbVtLfEAqEr1FhrzUFY5X/qeBkhuXdxW6aAy0ltRr4t1bh8f234oT
X-Received: by 2002:a17:902:c946:b0:2a7:7ca1:8622 with SMTP id
 d9443c01a7336-2a870b4bb05mr4407245ad.11.1769585536914; Tue, 27 Jan 2026
 23:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20260127070259.2720468-1-dapeng1.mi@linux.intel.com>
 <20260127070259.2720468-3-dapeng1.mi@linux.intel.com> <CAP-5=fWxxp8vai33kvxf_45v6TUebWR5g3njEnRMQTP=Bx-Gww@mail.gmail.com>
 <9f88ff32-c699-4587-885e-316a914a5d78@linux.intel.com>
In-Reply-To: <9f88ff32-c699-4587-885e-316a914a5d78@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 Jan 2026 23:32:05 -0800
X-Gm-Features: AZwV_QgWmptyj62oYyElrpvNR8Vw8jDJJ3NitptU_kA3zbnVgImeLa7DTxzYZ4Y
Message-ID: <CAP-5=fV9idT0tTqqToQMohTSZyVeyx9XMY2J1tHkTeQYnfV-hQ@mail.gmail.com>
Subject: Re: [Patch v2 2/3] perf regs: Remove __weak attributive
 arch__xxx_reg_mask() functions
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zide Chen <zide.chen@intel.com>, Falcon Thomas <thomas.falcon@intel.com>, 
	Dapeng Mi <dapeng1.mi@intel.com>, Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_233219_007455_FA765B48 
X-CRM114-Status: GOOD (  28.13  )
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

On Tue, Jan 27, 2026 at 6:03=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
>
> On 1/28/2026 12:46 AM, Ian Rogers wrote:
> > On Mon, Jan 26, 2026 at 11:06=E2=80=AFPM Dapeng Mi <dapeng1.mi@linux.in=
tel.com> wrote:
> >> Currently, some architecture-specific perf-regs functions, such as
> >> arch__intr_reg_mask() and arch__user_reg_mask(), are defined with the
> >> __weak attribute. This approach ensures that only functions matching
> >> the architecture of the build/run host are compiled and executed,
> >> reducing build time and binary size.
> >>
> >> However, this __weak attribute restricts these functions to be called
> >> only on the same architecture, preventing cross-architecture
> >> functionality. For example, a perf.data file captured on x86 cannot be
> >> parsed on an ARM platform.
> >>
> >> To address this limitation, this patch removes the __weak attribute fr=
om
> >> these perf-regs functions. The architecture-specific code is moved fro=
m
> >> the arch/ directory to the util/perf-regs-arch/ directory. The
> >> appropriate architectural functions are then called based on the EM_HO=
ST.
> >>
> >> No functional changes are intended.
> >>
> >> Suggested-by: Ian Rogers <irogers@google.com>
> >> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> >> ---
> >>  tools/perf/arch/arm/util/Build                |  2 -
> >>  tools/perf/arch/arm/util/perf_regs.c          | 13 ---
> >>  tools/perf/arch/arm64/util/perf_regs.c        | 36 ---------
> >>  tools/perf/arch/csky/Build                    |  1 -
> >>  tools/perf/arch/csky/util/Build               |  1 -
> >>  tools/perf/arch/csky/util/perf_regs.c         | 13 ---
> >>  tools/perf/arch/loongarch/util/Build          |  1 -
> >>  tools/perf/arch/loongarch/util/perf_regs.c    | 13 ---
> >>  tools/perf/arch/mips/util/Build               |  1 -
> >>  tools/perf/arch/mips/util/perf_regs.c         | 13 ---
> >>  tools/perf/arch/powerpc/util/perf_regs.c      | 47 -----------
> >>  tools/perf/arch/riscv/include/perf_regs.h     |  7 +-
> >>  tools/perf/arch/riscv/util/Build              |  1 -
> >>  tools/perf/arch/riscv/util/perf_regs.c        | 13 ---
> >>  tools/perf/arch/s390/util/Build               |  1 -
> >>  tools/perf/arch/s390/util/perf_regs.c         | 13 ---
> >>  tools/perf/arch/x86/util/perf_regs.c          | 48 -----------
> >>  tools/perf/util/evsel.c                       |  4 +-
> >>  tools/perf/util/parse-regs-options.c          |  2 +-
> >>  .../util/perf-regs-arch/perf_regs_aarch64.c   | 51 +++++++++++-
> >>  .../perf/util/perf-regs-arch/perf_regs_arm.c  |  7 +-
> >>  .../perf/util/perf-regs-arch/perf_regs_csky.c |  7 +-
> >>  .../util/perf-regs-arch/perf_regs_loongarch.c |  7 +-
> >>  .../perf/util/perf-regs-arch/perf_regs_mips.c |  7 +-
> >>  .../util/perf-regs-arch/perf_regs_powerpc.c   | 70 +++++++++++++++-
> >>  .../util/perf-regs-arch/perf_regs_riscv.c     |  7 +-
> >>  .../perf/util/perf-regs-arch/perf_regs_s390.c |  7 +-
> >>  .../perf/util/perf-regs-arch/perf_regs_x86.c  | 60 +++++++++++++-
> >>  tools/perf/util/perf_regs.c                   | 80 ++++++++++++++++++=
-
> >>  tools/perf/util/perf_regs.h                   | 22 ++++-
> >>  30 files changed, 319 insertions(+), 236 deletions(-)
> >>  delete mode 100644 tools/perf/arch/arm/util/perf_regs.c
> >>  delete mode 100644 tools/perf/arch/csky/Build
> >>  delete mode 100644 tools/perf/arch/csky/util/Build
> >>  delete mode 100644 tools/perf/arch/csky/util/perf_regs.c
> >>  delete mode 100644 tools/perf/arch/loongarch/util/perf_regs.c
> >>  delete mode 100644 tools/perf/arch/mips/util/perf_regs.c
> >>  delete mode 100644 tools/perf/arch/riscv/util/perf_regs.c
> >>  delete mode 100644 tools/perf/arch/s390/util/perf_regs.c
> > 8 files deleted is pretty awesome from my pov. Thanks!
>
> Yeah. Besides the reduction of files, another benefit (which could be mor=
e
> important) is that all perf-regs related arch-specific code currently are
> in a same place.
>
>
> >
> >> diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util=
/Build
> >> index 3291f893b943..b94bf3c5279a 100644
> >> --- a/tools/perf/arch/arm/util/Build
> >> +++ b/tools/perf/arch/arm/util/Build
> >> @@ -1,5 +1,3 @@
> >> -perf-util-y +=3D perf_regs.o
> >> -
> >>  perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind.o
> >>
> >>  perf-util-y +=3D pmu.o auxtrace.o cs-etm.o
> >> diff --git a/tools/perf/arch/arm/util/perf_regs.c b/tools/perf/arch/ar=
m/util/perf_regs.c
> >> deleted file mode 100644
> >> index 03a5bc0cf64c..000000000000
> >> --- a/tools/perf/arch/arm/util/perf_regs.c
> >> +++ /dev/null
> >> @@ -1,13 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0
> >> -#include "perf_regs.h"
> >> -#include "../../../util/perf_regs.h"
> >> -
> >> -uint64_t arch__intr_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> -
> >> -uint64_t arch__user_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch/=
arm64/util/perf_regs.c
> >> index 9bb768e1bea1..47f58eaba032 100644
> >> --- a/tools/perf/arch/arm64/util/perf_regs.c
> >> +++ b/tools/perf/arch/arm64/util/perf_regs.c
> >> @@ -103,39 +103,3 @@ int arch_sdt_arg_parse_op(char *old_op, char **ne=
w_op)
> >>
> >>         return SDT_ARG_VALID;
> >>  }
> >> -
> >> -uint64_t arch__intr_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> -
> >> -uint64_t arch__user_reg_mask(void)
> >> -{
> >> -       struct perf_event_attr attr =3D {
> >> -               .type                   =3D PERF_TYPE_HARDWARE,
> >> -               .config                 =3D PERF_COUNT_HW_CPU_CYCLES,
> >> -               .sample_type            =3D PERF_SAMPLE_REGS_USER,
> >> -               .disabled               =3D 1,
> >> -               .exclude_kernel         =3D 1,
> >> -               .sample_period          =3D 1,
> >> -               .sample_regs_user       =3D PERF_REGS_MASK
> >> -       };
> >> -       int fd;
> >> -
> >> -       if (getauxval(AT_HWCAP) & HWCAP_SVE)
> >> -               attr.sample_regs_user |=3D SMPL_REG_MASK(PERF_REG_ARM6=
4_VG);
> >> -
> >> -       /*
> >> -        * Check if the pmu supports perf extended regs, before
> >> -        * returning the register mask to sample.
> >> -        */
> >> -       if (attr.sample_regs_user !=3D PERF_REGS_MASK) {
> >> -               event_attr_init(&attr);
> >> -               fd =3D sys_perf_event_open(&attr, 0, -1, -1, 0);
> >> -               if (fd !=3D -1) {
> >> -                       close(fd);
> >> -                       return attr.sample_regs_user;
> >> -               }
> >> -       }
> >> -       return PERF_REGS_MASK;
> >> -}
> >> diff --git a/tools/perf/arch/csky/Build b/tools/perf/arch/csky/Build
> >> deleted file mode 100644
> >> index e63eabc2c8f4..000000000000
> >> --- a/tools/perf/arch/csky/Build
> >> +++ /dev/null
> >> @@ -1 +0,0 @@
> >> -perf-util-y +=3D util/
> >> diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/ut=
il/Build
> >> deleted file mode 100644
> >> index 6b2d0e021b11..000000000000
> >> --- a/tools/perf/arch/csky/util/Build
> >> +++ /dev/null
> >> @@ -1 +0,0 @@
> >> -perf-util-y +=3D perf_regs.o
> >> diff --git a/tools/perf/arch/csky/util/perf_regs.c b/tools/perf/arch/c=
sky/util/perf_regs.c
> >> deleted file mode 100644
> >> index 2cf7a54106e0..000000000000
> >> --- a/tools/perf/arch/csky/util/perf_regs.c
> >> +++ /dev/null
> >> @@ -1,13 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0
> >> -#include "perf_regs.h"
> >> -#include "../../util/perf_regs.h"
> >> -
> >> -uint64_t arch__intr_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> -
> >> -uint64_t arch__user_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/lo=
ongarch/util/Build
> >> index 0aa31986ecb5..0c958c8e0718 100644
> >> --- a/tools/perf/arch/loongarch/util/Build
> >> +++ b/tools/perf/arch/loongarch/util/Build
> >> @@ -1,5 +1,4 @@
> >>  perf-util-y +=3D header.o
> >> -perf-util-y +=3D perf_regs.o
> >>
> >>  perf-util-$(CONFIG_LOCAL_LIBUNWIND) +=3D unwind-libunwind.o
> >>  perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> >> diff --git a/tools/perf/arch/loongarch/util/perf_regs.c b/tools/perf/a=
rch/loongarch/util/perf_regs.c
> >> deleted file mode 100644
> >> index 03a5bc0cf64c..000000000000
> >> --- a/tools/perf/arch/loongarch/util/perf_regs.c
> >> +++ /dev/null
> >> @@ -1,13 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0
> >> -#include "perf_regs.h"
> >> -#include "../../../util/perf_regs.h"
> >> -
> >> -uint64_t arch__intr_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> -
> >> -uint64_t arch__user_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> diff --git a/tools/perf/arch/mips/util/Build b/tools/perf/arch/mips/ut=
il/Build
> >> index 691fa2051958..818b808a8247 100644
> >> --- a/tools/perf/arch/mips/util/Build
> >> +++ b/tools/perf/arch/mips/util/Build
> >> @@ -1,2 +1 @@
> >> -perf-util-y +=3D perf_regs.o
> >>  perf-util-$(CONFIG_LOCAL_LIBUNWIND) +=3D unwind-libunwind.o
> >> diff --git a/tools/perf/arch/mips/util/perf_regs.c b/tools/perf/arch/m=
ips/util/perf_regs.c
> >> deleted file mode 100644
> >> index 2cf7a54106e0..000000000000
> >> --- a/tools/perf/arch/mips/util/perf_regs.c
> >> +++ /dev/null
> >> @@ -1,13 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0
> >> -#include "perf_regs.h"
> >> -#include "../../util/perf_regs.h"
> >> -
> >> -uint64_t arch__intr_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> -
> >> -uint64_t arch__user_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arc=
h/powerpc/util/perf_regs.c
> >> index 779073f7e992..93f929fc32e3 100644
> >> --- a/tools/perf/arch/powerpc/util/perf_regs.c
> >> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
> >> @@ -123,50 +123,3 @@ int arch_sdt_arg_parse_op(char *old_op, char **ne=
w_op)
> >>
> >>         return SDT_ARG_VALID;
> >>  }
> >> -
> >> -uint64_t arch__intr_reg_mask(void)
> >> -{
> >> -       struct perf_event_attr attr =3D {
> >> -               .type                   =3D PERF_TYPE_HARDWARE,
> >> -               .config                 =3D PERF_COUNT_HW_CPU_CYCLES,
> >> -               .sample_type            =3D PERF_SAMPLE_REGS_INTR,
> >> -               .precise_ip             =3D 1,
> >> -               .disabled               =3D 1,
> >> -               .exclude_kernel         =3D 1,
> >> -       };
> >> -       int fd;
> >> -       u32 version;
> >> -       u64 extended_mask =3D 0, mask =3D PERF_REGS_MASK;
> >> -
> >> -       /*
> >> -        * Get the PVR value to set the extended
> >> -        * mask specific to platform.
> >> -        */
> >> -       version =3D (((mfspr(SPRN_PVR)) >>  16) & 0xFFFF);
> >> -       if (version =3D=3D PVR_POWER9)
> >> -               extended_mask =3D PERF_REG_PMU_MASK_300;
> >> -       else if ((version =3D=3D PVR_POWER10) || (version =3D=3D PVR_P=
OWER11))
> >> -               extended_mask =3D PERF_REG_PMU_MASK_31;
> >> -       else
> >> -               return mask;
> >> -
> >> -       attr.sample_regs_intr =3D extended_mask;
> >> -       attr.sample_period =3D 1;
> >> -       event_attr_init(&attr);
> >> -
> >> -       /*
> >> -        * check if the pmu supports perf extended regs, before
> >> -        * returning the register mask to sample.
> >> -        */
> >> -       fd =3D sys_perf_event_open(&attr, 0, -1, -1, 0);
> >> -       if (fd !=3D -1) {
> >> -               close(fd);
> >> -               mask |=3D extended_mask;
> >> -       }
> >> -       return mask;
> >> -}
> >> -
> >> -uint64_t arch__user_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> diff --git a/tools/perf/arch/riscv/include/perf_regs.h b/tools/perf/ar=
ch/riscv/include/perf_regs.h
> >> index 89d5bbb8d2b8..af7a1b47bf66 100644
> >> --- a/tools/perf/arch/riscv/include/perf_regs.h
> >> +++ b/tools/perf/arch/riscv/include/perf_regs.h
> >> @@ -10,10 +10,15 @@
> >>
> >>  #define PERF_REGS_MASK ((1ULL << PERF_REG_RISCV_MAX) - 1)
> >>  #define PERF_REGS_MAX  PERF_REG_RISCV_MAX
> >> +
> >> +#if defined(__riscv_xlen)
> >>  #if __riscv_xlen =3D=3D 64
> >> -#define PERF_SAMPLE_REGS_ABI    PERF_SAMPLE_REGS_ABI_64
> >> +#define PERF_SAMPLE_REGS_ABI   PERF_SAMPLE_REGS_ABI_64
> >>  #else
> >>  #define PERF_SAMPLE_REGS_ABI   PERF_SAMPLE_REGS_ABI_32
> >>  #endif
> >> +#else
> >> +#define PERF_SAMPLE_REGS_ABI   PERF_SAMPLE_REGS_NONE
> >> +#endif
> >>
> >>  #endif /* ARCH_PERF_REGS_H */
> >> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/=
util/Build
> >> index 628b9ebd418b..da5b12e7f862 100644
> >> --- a/tools/perf/arch/riscv/util/Build
> >> +++ b/tools/perf/arch/riscv/util/Build
> >> @@ -1,4 +1,3 @@
> >> -perf-util-y +=3D perf_regs.o
> >>  perf-util-y +=3D header.o
> >>
> >>  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> >> diff --git a/tools/perf/arch/riscv/util/perf_regs.c b/tools/perf/arch/=
riscv/util/perf_regs.c
> >> deleted file mode 100644
> >> index 2cf7a54106e0..000000000000
> >> --- a/tools/perf/arch/riscv/util/perf_regs.c
> >> +++ /dev/null
> >> @@ -1,13 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0
> >> -#include "perf_regs.h"
> >> -#include "../../util/perf_regs.h"
> >> -
> >> -uint64_t arch__intr_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> -
> >> -uint64_t arch__user_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> diff --git a/tools/perf/arch/s390/util/Build b/tools/perf/arch/s390/ut=
il/Build
> >> index 5391d26fedd4..3b09c058e0ec 100644
> >> --- a/tools/perf/arch/s390/util/Build
> >> +++ b/tools/perf/arch/s390/util/Build
> >> @@ -1,6 +1,5 @@
> >>  perf-util-y +=3D header.o
> >>  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> >> -perf-util-y +=3D perf_regs.o
> >>
> >>  perf-util-y +=3D machine.o
> >>  perf-util-y +=3D pmu.o
> >> diff --git a/tools/perf/arch/s390/util/perf_regs.c b/tools/perf/arch/s=
390/util/perf_regs.c
> >> deleted file mode 100644
> >> index 2cf7a54106e0..000000000000
> >> --- a/tools/perf/arch/s390/util/perf_regs.c
> >> +++ /dev/null
> >> @@ -1,13 +0,0 @@
> >> -// SPDX-License-Identifier: GPL-2.0
> >> -#include "perf_regs.h"
> >> -#include "../../util/perf_regs.h"
> >> -
> >> -uint64_t arch__intr_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> -
> >> -uint64_t arch__user_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> diff --git a/tools/perf/arch/x86/util/perf_regs.c b/tools/perf/arch/x8=
6/util/perf_regs.c
> >> index a7ca4154fdf9..41141cebe226 100644
> >> --- a/tools/perf/arch/x86/util/perf_regs.c
> >> +++ b/tools/perf/arch/x86/util/perf_regs.c
> >> @@ -233,51 +233,3 @@ int arch_sdt_arg_parse_op(char *old_op, char **ne=
w_op)
> >>
> >>         return SDT_ARG_VALID;
> >>  }
> >> -
> >> -uint64_t arch__intr_reg_mask(void)
> >> -{
> >> -       struct perf_event_attr attr =3D {
> >> -               .type                   =3D PERF_TYPE_HARDWARE,
> >> -               .config                 =3D PERF_COUNT_HW_CPU_CYCLES,
> >> -               .sample_type            =3D PERF_SAMPLE_REGS_INTR,
> >> -               .sample_regs_intr       =3D PERF_REG_EXTENDED_MASK,
> >> -               .precise_ip             =3D 1,
> >> -               .disabled               =3D 1,
> >> -               .exclude_kernel         =3D 1,
> >> -       };
> >> -       int fd;
> >> -       /*
> >> -        * In an unnamed union, init it here to build on older gcc ver=
sions
> >> -        */
> >> -       attr.sample_period =3D 1;
> >> -
> >> -       if (perf_pmus__num_core_pmus() > 1) {
> >> -               struct perf_pmu *pmu =3D NULL;
> >> -               __u64 type =3D PERF_TYPE_RAW;
> >> -
> >> -               /*
> >> -                * The same register set is supported among different =
hybrid PMUs.
> >> -                * Only check the first available one.
> >> -                */
> >> -               while ((pmu =3D perf_pmus__scan_core(pmu)) !=3D NULL) =
{
> >> -                       type =3D pmu->type;
> >> -                       break;
> >> -               }
> >> -               attr.config |=3D type << PERF_PMU_TYPE_SHIFT;
> >> -       }
> >> -
> >> -       event_attr_init(&attr);
> >> -
> >> -       fd =3D sys_perf_event_open(&attr, 0, -1, -1, 0);
> >> -       if (fd !=3D -1) {
> >> -               close(fd);
> >> -               return (PERF_REG_EXTENDED_MASK | PERF_REGS_MASK);
> >> -       }
> >> -
> >> -       return PERF_REGS_MASK;
> >> -}
> >> -
> >> -uint64_t arch__user_reg_mask(void)
> >> -{
> >> -       return PERF_REGS_MASK;
> >> -}
> >> diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
> >> index 5ac1a05601b1..a36528fd41c6 100644
> >> --- a/tools/perf/util/evsel.c
> >> +++ b/tools/perf/util/evsel.c
> >> @@ -1055,13 +1055,13 @@ static void __evsel__config_callchain(struct e=
vsel *evsel, struct record_opts *o
> >>                         evsel__set_sample_bit(evsel, REGS_USER);
> >>                         evsel__set_sample_bit(evsel, STACK_USER);
> >>                         if (opts->sample_user_regs &&
> >> -                           DWARF_MINIMAL_REGS(e_machine) !=3D arch__u=
ser_reg_mask()) {
> >> +                           DWARF_MINIMAL_REGS(e_machine) !=3D perf_us=
er_reg_mask(EM_HOST)) {
> >>                                 attr->sample_regs_user |=3D DWARF_MINI=
MAL_REGS(e_machine);
> >>                                 pr_warning("WARNING: The use of --call=
-graph=3Ddwarf may require all the user registers, "
> >>                                            "specifying a subset with -=
-user-regs may render DWARF unwinding unreliable, "
> >>                                            "so the minimal registers s=
et (IP, SP) is explicitly forced.\n");
> >>                         } else {
> >> -                               attr->sample_regs_user |=3D arch__user=
_reg_mask();
> >> +                               attr->sample_regs_user |=3D perf_user_=
reg_mask(EM_HOST);
> > Fwiw, I think this is why for dwarf unwinding on x86 we're sampling
> > the XMM registers which is probably too much. I think the mask that's
> > really wanted here is the mask of all callee-save registers or,
> > because maybe there's inter-procedural optimizations, all GPRs.
>
> Yes, XMM are definitely not needed for dwarf unwinding. After supporting
> the APX eGPRs, we can do a further investigation for this place.
>
>
> >
> >>                         }
> >>                         attr->sample_stack_user =3D param->dump_size;
> >>                         attr->exclude_callchain_user =3D 1;
> >> diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/pa=
rse-regs-options.c
> >> index c0d0ef9fd495..2af6e4ad2a34 100644
> >> --- a/tools/perf/util/parse-regs-options.c
> >> +++ b/tools/perf/util/parse-regs-options.c
> >> @@ -70,7 +70,7 @@ __parse_regs(const struct option *opt, const char *s=
tr, int unset, bool intr)
> >>         if (!str)
> >>                 return -1;
> >>
> >> -       mask =3D intr ? arch__intr_reg_mask() : arch__user_reg_mask();
> >> +       mask =3D intr ? perf_intr_reg_mask(EM_HOST) : perf_user_reg_ma=
sk(EM_HOST);
> >>
> >>         /* because str is read-only */
> >>         s =3D os =3D strdup(str);
> >> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_aarch64.c b/tool=
s/perf/util/perf-regs-arch/perf_regs_aarch64.c
> >> index 9dcda80d310f..21a432671f04 100644
> >> --- a/tools/perf/util/perf-regs-arch/perf_regs_aarch64.c
> >> +++ b/tools/perf/util/perf-regs-arch/perf_regs_aarch64.c
> >> @@ -1,7 +1,56 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >> +#include <errno.h>
> >> +#include <regex.h>
> >> +#include <string.h>
> >> +#include <sys/auxv.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/zalloc.h>
> >>
> >> +#include "../debug.h"
> >> +#include "../event.h"
> >>  #include "../perf_regs.h"
> >> -#include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
> >> +#include "../../perf-sys.h"
> >> +#include "../../arch/arm64/include/perf_regs.h"
> > I'm a little worried about switching from the asm to the arch file
> > because of conflicting definitions from the host machine doing the
> > compilation. I see we need PERF_REGS_MASK which is typically:
> > #define PERF_REGS_MASK  ((1ULL << PERF_REG_<arch>_MAX) - 1)
> > Perhaps we can have in the asm header:
> > #define PERF_REGS_<arch>_MASK  ((1ULL << PERF_REG_<arch>_MAX) - 1)
> > Perhaps that's just later cleanup.
>
> The "asm/perf_regs.h" has been nested into the
> "arch/xxx/include/perf_regs.h". IMO, it should be safe and reasonable to
> include the perf tools header file "arch/xxx/include/perf_regs.h" for the
> perf-regs related source code.
>
> It works to add "PERF_REGS_<arch>_MASK" into the UAPI asm header, but sin=
ce
> the macros are never called in kernel code, I suppose maintainters would
> not like it.
>
>
> >
> >> +
> >> +#define SMPL_REG_MASK(b) (1ULL << (b))
> >> +
> >> +#ifndef HWCAP_SVE
> >> +#define HWCAP_SVE      (1 << 22)
> >> +#endif
> >> +
> >> +uint64_t __perf_reg_mask_arm64(bool intr)
> >> +{
> >> +       struct perf_event_attr attr =3D {
> >> +               .type                   =3D PERF_TYPE_HARDWARE,
> >> +               .config                 =3D PERF_COUNT_HW_CPU_CYCLES,
> >> +               .sample_type            =3D PERF_SAMPLE_REGS_USER,
> >> +               .disabled               =3D 1,
> >> +               .exclude_kernel         =3D 1,
> >> +               .sample_period          =3D 1,
> >> +               .sample_regs_user       =3D PERF_REGS_MASK
> >> +       };
> >> +       int fd;
> >> +
> >> +       if (intr)
> >> +               return PERF_REGS_MASK;
> >> +
> >> +       if (getauxval(AT_HWCAP) & HWCAP_SVE)
> >> +               attr.sample_regs_user |=3D SMPL_REG_MASK(PERF_REG_ARM6=
4_VG);
> >> +
> >> +       /*
> >> +        * Check if the pmu supports perf extended regs, before
> >> +        * returning the register mask to sample.
> >> +        */
> > I know this is just a copy-paste but I think it'd be a little more read=
able as:
> > ```
> >         /*
> >         * Check if the pmu supports perf extended regs, before
> >         * returning the register mask to sample. Open the event
> >         * on the perf process to check this.
> >         */
> > ```
>
> Sure. Thanks.
>
>
> >
> >> +       if (attr.sample_regs_user !=3D PERF_REGS_MASK) {
> >> +               event_attr_init(&attr);
> >> +               fd =3D sys_perf_event_open(&attr, 0, -1, -1, 0);
> > Similarly:
> > ```
> > fd =3D sys_perf_event_open(&attr, /*pid=3D*/0, /*cpu=3D*/-1,
> > /*group_fd=3D*/-1, /*flags=3D*/0);
> > ```
>
> Sure.
>
>
> >> +               if (fd !=3D -1) {
> >> +                       close(fd);
> >> +                       return attr.sample_regs_user;
> >> +               }
> >> +       }
> >> +       return PERF_REGS_MASK;
> >> +}
> >>
> >>  const char *__perf_reg_name_arm64(int id)
> >>  {
> >> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_arm.c b/tools/pe=
rf/util/perf-regs-arch/perf_regs_arm.c
> >> index e29d130a587a..184d6e248dfc 100644
> >> --- a/tools/perf/util/perf-regs-arch/perf_regs_arm.c
> >> +++ b/tools/perf/util/perf-regs-arch/perf_regs_arm.c
> >> @@ -1,7 +1,12 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>
> >>  #include "../perf_regs.h"
> >> -#include "../../../arch/arm/include/uapi/asm/perf_regs.h"
> >> +#include "../../arch/arm/include/perf_regs.h"
> > Similar comment on PERF_REGS_MASK as above, no action necessary.
> >
> >> +
> >> +uint64_t __perf_reg_mask_arm(bool intr __maybe_unused)
> >> +{
> >> +       return PERF_REGS_MASK;
> >> +}
> >>
> >>  const char *__perf_reg_name_arm(int id)
> >>  {
> >> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_csky.c b/tools/p=
erf/util/perf-regs-arch/perf_regs_csky.c
> >> index 75b461ef2eba..36cafa6a4c42 100644
> >> --- a/tools/perf/util/perf-regs-arch/perf_regs_csky.c
> >> +++ b/tools/perf/util/perf-regs-arch/perf_regs_csky.c
> >> @@ -1,7 +1,12 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>
> >>  #include "../perf_regs.h"
> >> -#include "../../arch/csky/include/uapi/asm/perf_regs.h"
> >> +#include "../../arch/csky/include/perf_regs.h"
> >> +
> >> +uint64_t __perf_reg_mask_csky(bool intr __maybe_unused)
> >> +{
> >> +       return PERF_REGS_MASK;
> >> +}
> >>
> >>  const char *__perf_reg_name_csky(int id)
> >>  {
> >> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_loongarch.c b/to=
ols/perf/util/perf-regs-arch/perf_regs_loongarch.c
> >> index 043f97f4e3ac..478ee889afa1 100644
> >> --- a/tools/perf/util/perf-regs-arch/perf_regs_loongarch.c
> >> +++ b/tools/perf/util/perf-regs-arch/perf_regs_loongarch.c
> >> @@ -1,7 +1,12 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>
> >>  #include "../perf_regs.h"
> >> -#include "../../../arch/loongarch/include/uapi/asm/perf_regs.h"
> >> +#include "../../arch/loongarch/include/perf_regs.h"
> >> +
> >> +uint64_t __perf_reg_mask_loongarch(bool intr __maybe_unused)
> >> +{
> >> +       return PERF_REGS_MASK;
> >> +}
> >>
> >>  const char *__perf_reg_name_loongarch(int id)
> >>  {
> >> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_mips.c b/tools/p=
erf/util/perf-regs-arch/perf_regs_mips.c
> >> index 793178fc3c78..c5a475f6ec64 100644
> >> --- a/tools/perf/util/perf-regs-arch/perf_regs_mips.c
> >> +++ b/tools/perf/util/perf-regs-arch/perf_regs_mips.c
> >> @@ -1,7 +1,12 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>
> >>  #include "../perf_regs.h"
> >> -#include "../../../arch/mips/include/uapi/asm/perf_regs.h"
> >> +#include "../../arch/mips/include/perf_regs.h"
> >> +
> >> +uint64_t __perf_reg_mask_mips(bool intr __maybe_unused)
> >> +{
> >> +       return PERF_REGS_MASK;
> >> +}
> >>
> >>  const char *__perf_reg_name_mips(int id)
> >>  {
> >> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_powerpc.c b/tool=
s/perf/util/perf-regs-arch/perf_regs_powerpc.c
> >> index 08636bb09a3a..5211cc0c4e81 100644
> >> --- a/tools/perf/util/perf-regs-arch/perf_regs_powerpc.c
> >> +++ b/tools/perf/util/perf-regs-arch/perf_regs_powerpc.c
> >> @@ -1,7 +1,75 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>
> >> +#include <errno.h>
> >> +#include <string.h>
> >> +#include <regex.h>
> >> +#include <linux/zalloc.h>
> >> +
> >> +#include "../debug.h"
> >> +#include "../event.h"
> >> +#include "../header.h"
> >>  #include "../perf_regs.h"
> >> -#include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
> >> +#include "../../perf-sys.h"
> >> +#include "../../arch/powerpc/util/utils_header.h"
> >> +#include "../../arch/powerpc/include/perf_regs.h"
> >> +
> >> +#include <linux/kernel.h>
> >> +
> >> +#define PVR_POWER9             0x004E
> >> +#define PVR_POWER10            0x0080
> >> +#define PVR_POWER11            0x0082
> >> +
> >> +#if defined(__powerpc64__) && defined(__powerpc__)
> > This is morally the same as the arch directory, I'm guessing that
> > missing definitions are an issue? Would having the asm #include fix
> > this?
>
> The aim of adding this "#if" is to avoid the building error caused by the
> "mfspr" instruction which exists only on powerpc. Since the function
> __perf_reg_mask_powerpc() would never be called on non-powerpc platforms
> right now, I think it should be fine.

Thanks, I remember now. Probably worth a comment.

Ian

> >
> >> +uint64_t __perf_reg_mask_powerpc(bool intr)
> >> +{
> >> +       struct perf_event_attr attr =3D {
> >> +               .type                   =3D PERF_TYPE_HARDWARE,
> >> +               .config                 =3D PERF_COUNT_HW_CPU_CYCLES,
> >> +               .sample_type            =3D PERF_SAMPLE_REGS_INTR,
> >> +               .precise_ip             =3D 1,
> >> +               .disabled               =3D 1,
> >> +               .exclude_kernel         =3D 1,
> >> +       };
> >> +       int fd;
> >> +       u32 version;
> >> +       u64 extended_mask =3D 0, mask =3D PERF_REGS_MASK;
> >> +
> >> +       if (!intr)
> >> +               return PERF_REGS_MASK;
> >> +
> >> +       /*
> >> +        * Get the PVR value to set the extended
> >> +        * mask specific to platform.
> >> +        */
> >> +       version =3D (((mfspr(SPRN_PVR)) >>  16) & 0xFFFF);
> >> +       if (version =3D=3D PVR_POWER9)
> >> +               extended_mask =3D PERF_REG_PMU_MASK_300;
> >> +       else if ((version =3D=3D PVR_POWER10) || (version =3D=3D PVR_P=
OWER11))
> >> +               extended_mask =3D PERF_REG_PMU_MASK_31;
> >> +       else
> >> +               return mask;
> >> +
> >> +       attr.sample_regs_intr =3D extended_mask;
> >> +       attr.sample_period =3D 1;
> >> +       event_attr_init(&attr);
> >> +
> >> +       /*
> >> +        * check if the pmu supports perf extended regs, before
> >> +        * returning the register mask to sample.
> >> +        */
> >> +       fd =3D sys_perf_event_open(&attr, 0, -1, -1, 0);
> > This code feels awfully familiar :-) Similar comments to the arm64 case=
.
>
> Sure.
>
>
> >
> >> +       if (fd !=3D -1) {
> >> +               close(fd);
> >> +               mask |=3D extended_mask;
> >> +       }
> >> +       return mask;
> >> +}
> >> +#else
> >> +uint64_t __perf_reg_mask_powerpc(bool intr __maybe_unused)
> >> +{
> >> +       return PERF_REGS_MASK;
> >> +}
> >> +#endif
> >>
> >>  const char *__perf_reg_name_powerpc(int id)
> >>  {
> >> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_riscv.c b/tools/=
perf/util/perf-regs-arch/perf_regs_riscv.c
> >> index 337b687c655d..5b5f21fcba8c 100644
> >> --- a/tools/perf/util/perf-regs-arch/perf_regs_riscv.c
> >> +++ b/tools/perf/util/perf-regs-arch/perf_regs_riscv.c
> >> @@ -1,7 +1,12 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>
> >>  #include "../perf_regs.h"
> >> -#include "../../../arch/riscv/include/uapi/asm/perf_regs.h"
> >> +#include "../../arch/riscv/include/perf_regs.h"
> >> +
> >> +uint64_t __perf_reg_mask_riscv(bool intr __maybe_unused)
> >> +{
> >> +       return PERF_REGS_MASK;
> >> +}
> >>
> >>  const char *__perf_reg_name_riscv(int id)
> >>  {
> >> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_s390.c b/tools/p=
erf/util/perf-regs-arch/perf_regs_s390.c
> >> index d69bba881080..c61df24edf0f 100644
> >> --- a/tools/perf/util/perf-regs-arch/perf_regs_s390.c
> >> +++ b/tools/perf/util/perf-regs-arch/perf_regs_s390.c
> >> @@ -1,7 +1,12 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>
> >>  #include "../perf_regs.h"
> >> -#include "../../../arch/s390/include/uapi/asm/perf_regs.h"
> >> +#include "../../arch/s390/include/perf_regs.h"
> >> +
> >> +uint64_t __perf_reg_mask_s390(bool intr __maybe_unused)
> >> +{
> >> +       return PERF_REGS_MASK;
> >> +}
> >>
> >>  const char *__perf_reg_name_s390(int id)
> >>  {
> >> diff --git a/tools/perf/util/perf-regs-arch/perf_regs_x86.c b/tools/pe=
rf/util/perf-regs-arch/perf_regs_x86.c
> >> index 708954a9d35d..d319106dc7b2 100644
> >> --- a/tools/perf/util/perf-regs-arch/perf_regs_x86.c
> >> +++ b/tools/perf/util/perf-regs-arch/perf_regs_x86.c
> >> @@ -1,7 +1,65 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>
> >> +#include <errno.h>
> >> +#include <string.h>
> >> +#include <regex.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/zalloc.h>
> >> +
> >> +#include "../debug.h"
> >> +#include "../event.h"
> >> +#include "../pmu.h"
> >> +#include "../pmus.h"
> >>  #include "../perf_regs.h"
> >> -#include "../../../arch/x86/include/uapi/asm/perf_regs.h"
> >> +#include "../../perf-sys.h"
> >> +#include "../../arch/x86/include/perf_regs.h"
> >> +
> >> +uint64_t __perf_reg_mask_x86(bool intr)
> >> +{
> >> +       struct perf_event_attr attr =3D {
> >> +               .type                   =3D PERF_TYPE_HARDWARE,
> >> +               .config                 =3D PERF_COUNT_HW_CPU_CYCLES,
> >> +               .sample_type            =3D PERF_SAMPLE_REGS_INTR,
> >> +               .sample_regs_intr       =3D PERF_REG_EXTENDED_MASK,
> >> +               .precise_ip             =3D 1,
> >> +               .disabled               =3D 1,
> >> +               .exclude_kernel         =3D 1,
> >> +       };
> >> +       int fd;
> >> +
> >> +       if (!intr)
> >> +               return PERF_REGS_MASK;
> >> +
> >> +       /*
> >> +        * In an unnamed union, init it here to build on older gcc ver=
sions
> >> +        */
> >> +       attr.sample_period =3D 1;
> >> +
> >> +       if (perf_pmus__num_core_pmus() > 1) {
> >> +               struct perf_pmu *pmu =3D NULL;
> >> +               __u64 type =3D PERF_TYPE_RAW;
> >> +
> >> +               /*
> >> +                * The same register set is supported among different =
hybrid PMUs.
> >> +                * Only check the first available one.
> >> +                */
> >> +               while ((pmu =3D perf_pmus__scan_core(pmu)) !=3D NULL) =
{
> >> +                       type =3D pmu->type;
> >> +                       break;
> >> +               }
> >> +               attr.config |=3D type << PERF_PMU_TYPE_SHIFT;
> >> +       }
> >> +
> >> +       event_attr_init(&attr);
> >> +
> >> +       fd =3D sys_perf_event_open(&attr, 0, -1, -1, 0);
> > It'd be nice not to remember what the magic 0, -1, -1, 0 means :-)
>
> Sure.
>
>
> >
> >> +       if (fd !=3D -1) {
> >> +               close(fd);
> >> +               return (PERF_REG_EXTENDED_MASK | PERF_REGS_MASK);
> >> +       }
> >> +
> >> +       return PERF_REGS_MASK;
> >> +}
> >>
> >>  const char *__perf_reg_name_x86(int id)
> >>  {
> >> diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
> >> index f21148478db1..900929cff4b5 100644
> >> --- a/tools/perf/util/perf_regs.c
> >> +++ b/tools/perf/util/perf_regs.c
> >> @@ -13,14 +13,86 @@ int __weak arch_sdt_arg_parse_op(char *old_op __ma=
ybe_unused,
> >>         return SDT_ARG_SKIP;
> >>  }
> >>
> >> -uint64_t __weak arch__intr_reg_mask(void)
> >> +uint64_t perf_intr_reg_mask(uint16_t e_machine)
> >>  {
> >> -       return 0;
> >> +       uint64_t mask =3D 0;
> >> +
> >> +       switch (e_machine) {
> >> +       case EM_ARM:
> >> +               mask =3D __perf_reg_mask_arm(/*intr=3D*/true);
> >> +               break;
> >> +       case EM_AARCH64:
> >> +               mask =3D __perf_reg_mask_arm64(/*intr=3D*/true);
> >> +               break;
> >> +       case EM_CSKY:
> >> +               mask =3D __perf_reg_mask_csky(/*intr=3D*/true);
> >> +               break;
> >> +       case EM_LOONGARCH:
> >> +               mask =3D __perf_reg_mask_loongarch(/*intr=3D*/true);
> >> +               break;
> >> +       case EM_MIPS:
> >> +               mask =3D __perf_reg_mask_mips(/*intr=3D*/true);
> >> +               break;
> >> +       case EM_PPC:
> >> +       case EM_PPC64:
> >> +               mask =3D __perf_reg_mask_powerpc(/*intr=3D*/true);
> >> +               break;
> >> +       case EM_RISCV:
> >> +               mask =3D __perf_reg_mask_riscv(/*intr=3D*/true);
> >> +               break;
> >> +       case EM_S390:
> >> +               mask =3D __perf_reg_mask_s390(/*intr=3D*/true);
> >> +               break;
> >> +       case EM_386:
> >> +       case EM_X86_64:
> >> +               mask =3D __perf_reg_mask_x86(/*intr=3D*/true);
> >> +               break;
> >> +       default:
> > Probably worth a debug statement here, like:
> > pr_debug("Unknown ELF machine %d, interrupt sampling register mask
> > will be empty.\n");
>
> Sure.
>
>
> >
> >> +               break;
> >> +       }
> >> +
> >> +       return mask;
> >>  }
> >>
> >> -uint64_t __weak arch__user_reg_mask(void)
> >> +uint64_t perf_user_reg_mask(uint16_t e_machine)
> >>  {
> >> -       return 0;
> >> +       uint64_t mask =3D 0;
> >> +
> >> +       switch (e_machine) {
> >> +       case EM_ARM:
> >> +               mask =3D __perf_reg_mask_arm(/*intr=3D*/false);
> >> +               break;
> >> +       case EM_AARCH64:
> >> +               mask =3D __perf_reg_mask_arm64(/*intr=3D*/false);
> >> +               break;
> >> +       case EM_CSKY:
> >> +               mask =3D __perf_reg_mask_csky(/*intr=3D*/false);
> >> +               break;
> >> +       case EM_LOONGARCH:
> >> +               mask =3D __perf_reg_mask_loongarch(/*intr=3D*/false);
> >> +               break;
> >> +       case EM_MIPS:
> >> +               mask =3D __perf_reg_mask_mips(/*intr=3D*/false);
> >> +               break;
> >> +       case EM_PPC:
> >> +       case EM_PPC64:
> >> +               mask =3D __perf_reg_mask_powerpc(/*intr=3D*/false);
> >> +               break;
> >> +       case EM_RISCV:
> >> +               mask =3D __perf_reg_mask_riscv(/*intr=3D*/false);
> >> +               break;
> >> +       case EM_S390:
> >> +               mask =3D __perf_reg_mask_s390(/*intr=3D*/false);
> >> +               break;
> >> +       case EM_386:
> >> +       case EM_X86_64:
> >> +               mask =3D __perf_reg_mask_x86(/*intr=3D*/false);
> >> +               break;
> >> +       default:
> > Similarly:
> > pr_debug("Unknown ELF machine %d, user sampling register mask will be
> > empty.\n");
>
> Sure. Thanks.
>
>
> >
> > Thanks!
> > Ian
> >
> >> +               break;
> >> +       }
> >> +
> >> +       return mask;
> >>  }
> >>
> >>  const char *perf_reg_name(int id, uint16_t e_machine)
> >> diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.h
> >> index 2c2a8de6912d..8531584bc1b1 100644
> >> --- a/tools/perf/util/perf_regs.h
> >> +++ b/tools/perf/util/perf_regs.h
> >> @@ -13,37 +13,55 @@ enum {
> >>  };
> >>
> >>  int arch_sdt_arg_parse_op(char *old_op, char **new_op);
> >> -uint64_t arch__intr_reg_mask(void);
> >> -uint64_t arch__user_reg_mask(void);
> >> +uint64_t perf_intr_reg_mask(uint16_t e_machine);
> >> +uint64_t perf_user_reg_mask(uint16_t e_machine);
> >>
> >>  const char *perf_reg_name(int id, uint16_t e_machine);
> >>  int perf_reg_value(u64 *valp, struct regs_dump *regs, int id);
> >>  uint64_t perf_arch_reg_ip(uint16_t e_machine);
> >>  uint64_t perf_arch_reg_sp(uint16_t e_machine);
> >> +
> >> +uint64_t __perf_reg_mask_arm64(bool intr);
> >>  const char *__perf_reg_name_arm64(int id);
> >>  uint64_t __perf_reg_ip_arm64(void);
> >>  uint64_t __perf_reg_sp_arm64(void);
> >> +
> >> +uint64_t __perf_reg_mask_arm(bool intr);
> >>  const char *__perf_reg_name_arm(int id);
> >>  uint64_t __perf_reg_ip_arm(void);
> >>  uint64_t __perf_reg_sp_arm(void);
> >> +
> >> +uint64_t __perf_reg_mask_csky(bool intr);
> >>  const char *__perf_reg_name_csky(int id);
> >>  uint64_t __perf_reg_ip_csky(void);
> >>  uint64_t __perf_reg_sp_csky(void);
> >> +
> >> +uint64_t __perf_reg_mask_loongarch(bool intr);
> >>  const char *__perf_reg_name_loongarch(int id);
> >>  uint64_t __perf_reg_ip_loongarch(void);
> >>  uint64_t __perf_reg_sp_loongarch(void);
> >> +
> >> +uint64_t __perf_reg_mask_mips(bool intr);
> >>  const char *__perf_reg_name_mips(int id);
> >>  uint64_t __perf_reg_ip_mips(void);
> >>  uint64_t __perf_reg_sp_mips(void);
> >> +
> >> +uint64_t __perf_reg_mask_powerpc(bool intr);
> >>  const char *__perf_reg_name_powerpc(int id);
> >>  uint64_t __perf_reg_ip_powerpc(void);
> >>  uint64_t __perf_reg_sp_powerpc(void);
> >> +
> >> +uint64_t __perf_reg_mask_riscv(bool intr);
> >>  const char *__perf_reg_name_riscv(int id);
> >>  uint64_t __perf_reg_ip_riscv(void);
> >>  uint64_t __perf_reg_sp_riscv(void);
> >> +
> >> +uint64_t __perf_reg_mask_s390(bool intr);
> >>  const char *__perf_reg_name_s390(int id);
> >>  uint64_t __perf_reg_ip_s390(void);
> >>  uint64_t __perf_reg_sp_s390(void);
> >> +
> >> +uint64_t __perf_reg_mask_x86(bool intr);
> >>  const char *__perf_reg_name_x86(int id);
> >>  uint64_t __perf_reg_ip_x86(void);
> >>  uint64_t __perf_reg_sp_x86(void);
> >> --
> >> 2.34.1
> >>

