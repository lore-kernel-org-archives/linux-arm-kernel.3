Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6D5C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 05:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HowtbIgjBHPn5b5iQyqGyRztJcPHe75Q5B9Qsb7fQU=; b=WBGCdJ4/RXQ4NQSO82DA1bAokK
	/Zg7sRUuP5z2XAjiy9ffLpCua/7aCBoeDcKoGXRnfZFUCz2DNwKgwuBCv4uZCfWh723ImUCZN88nv
	FVYIvj+UkByuZm2Pj35rg9ZYfMP5GlxXuVc8IL/4+B/XF6aRzvv+C+1VOZnyoB/22hzJb+Mx32JB7
	wRAUGqO24ydVmmzmFfnFYtXCCKVeJGwtJnZwltq7nBibux0vhgytyMpa5OAIWmhcZHP+5cUhYJK7u
	tEEbfL3dPwFlPQrJZz81SVQ2SikjKIutYxtHH2VoPn63q840Yse/urhXp9iyfS4hFEVGS7QibYaVv
	UPfpeWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgz4m-0000000FIsd-16Tc;
	Sat, 17 Jan 2026 05:42:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgz4k-0000000FIry-1tQg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 05:42:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a1462573caso32495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 21:42:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768628537; cv=none;
        d=google.com; s=arc-20240605;
        b=F3n7P7lTSl0I4olFdyow5yRwTJRkSTqRO970uVLkujVSc4oYvgMXKd8FXDWBzY2WBQ
         oRQN7HXEBow8W2gk12vX5eI7jThLB2gpIibgCQaZ50xRsEEDy4QnnavGIipBFq/WKC64
         ROTDu68LEPJc2NDKCD4sc/iHptNFRlhW8UcYsavgIrC5LJWNIBoRplY/GWuUXtr8KHdk
         jYp29bGl4t4ujqPMMRVa5c1YTnJ/fUYt5J6K6WCqC6LoXInHhQLOL5Jnw+t+LI1yHcMt
         VFw/tjgndw4CUUjWS8NySwc1WtXdGeCMGV+TXCZ1x2osIcyQmIz+2fQTeWG/crpsDUA+
         hUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/HowtbIgjBHPn5b5iQyqGyRztJcPHe75Q5B9Qsb7fQU=;
        fh=kBFBeILs8A23jWX3farcVLm5grkzhfyVTwSfkr8+BWg=;
        b=kS09RNq8yCtyZto34A5QYBpYC8AUXjEswx8ArCdCupIVTqfyvAEK7EwM1vs1CZXqif
         ysFT8z7KcoGTP1wl6N5Zxi9SIzqRpVxx+A5/uGcRPlwYGoLoLBPOp7vYwlA3GGEDG7br
         jWIOzbJEwG+/oLx0Kg3yG5S8etfGcTYLEkgFlliJYWdC9IWi48RjI3hBBkuf8y0UKVcD
         DMe+ZFw+o36J04Xi+SsWtoVnQaJsT7Gz7kJ8bROoSouPrrcrOyAZoqBK8/DoBmmWDIDW
         1sGbysjowh0btIvcy/a1ldjuWJOmFPXcNGZEePUN2NiRFEYsu+qKmh1K6WxIOX1EmhZl
         jxxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768628537; x=1769233337; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HowtbIgjBHPn5b5iQyqGyRztJcPHe75Q5B9Qsb7fQU=;
        b=1eCaIGnyd2BEf3LG1YqB0WoCx/4oLbiR2yDX1AvI76kOA1xW6+mhgpc7VrK3J9ruVL
         G0IZDWRCbgxTGNbMshKAnRsmhbFf4/nm6+Izr4tdk2OypmG8zwix1FbWPXD80/MLjB0+
         FfAxEim7xniQBPy1U+9ws3xV9MEAU0KSvjypo66axaVCNOjX+NhvMCvS31N5z0Ryk9Kl
         asfY+IJKbjo0IcDvemd+U2DM8AvLqNgR7vu6jCAoWi1ODdrC8hHCTdUm8IrP1XAGDHBB
         RIpBBuA+7SNz8IQcXrXtAM65ViUdzw+/fiZTYt7Oaa/2H8Y4uyd1op/tONsEN52Ejlx4
         4KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768628537; x=1769233337;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HowtbIgjBHPn5b5iQyqGyRztJcPHe75Q5B9Qsb7fQU=;
        b=hWGE7sqW/1X20tL5chcqMojHmWhGztNxJUuiHAZvuZLlMqqsfgOe1dM3zcWnwZqc7p
         lKAkuhl2g59xfvUhGX2YOZvXSR8SkkB/BscqfR+W2yuJAL9QHMK+KgGFbz3aIgy1NpgB
         vmPaBd9Iw1Qlq7u6E4nyXy+J5QDlnm8007yChcJ3L7mbaqUoV/aDPEM3zWNc+WfE45vk
         lFIksT3BOLMefFFha2LlWCgwZBgu6caAtRXiEkLoq7jkI6IJMldZN0fk6CSep3L1aJaD
         jDWUTXyvI07MV+2ORVS5s37bL1ILQIfi9GO34irvJVyXbXdEplGimpIq3Fhp+GEwiJFO
         CPXA==
X-Forwarded-Encrypted: i=1; AJvYcCWXreGC/znLyZjWVGndKoPjKoDB8vTzGq+PXCSUFARtynL5+qNGzTQ6DcsDXPLqCmij9t38QFLSWSIB2Eu4NJ4m@lists.infradead.org
X-Gm-Message-State: AOJu0YzJfyFv1bB8hrPpToCUI+54R8bADjjLiiD9y8615RMLDx+MGHQy
	ddwUU/nsHZpeAnsEJ0wtzMt4QwW5+jEUXVOdEozu4s4x6iQn+HkYJO3Q3I5q0aSRizM4+TjcOLV
	09vg8RFpEPYhn9QL/snBGXmk6x9HiARQJCgFTkcP+
X-Gm-Gg: AY/fxX7p9J7xvGbyfFh8Lt7vd1PNYTiogs1G2rURAfX+NbFI0RveekHOU1Pl8G8HydM
	LFALOA8Pf71GJTh7i+HOTsoBcc+4zMY3JiQOJVlTsXE9XTzzPOw2wlnNYSPiV4EX+tjcus2mdhR
	doaEYMDdSKFWrl1ZGXZxUBrKJe+jGPPjHDVQuMGuK8tE7SfqgzPqzvepgTx8a4BMuRFZEWnjcMa
	wHGA6Ov46WvRTAbfELmCBKzjN5cLMm4FJ3K8G3RO9bCJrDsiAmIhsqtSWvv9TFUx0B8xl1C
X-Received: by 2002:a17:902:ebca:b0:2a1:3cdc:771f with SMTP id
 d9443c01a7336-2a7289da59dmr1542765ad.20.1768628536490; Fri, 16 Jan 2026
 21:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com> <20260117052849.2205545-13-irogers@google.com>
In-Reply-To: <20260117052849.2205545-13-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 16 Jan 2026 21:42:04 -0800
X-Gm-Features: AZwV_QiI5bt4CEvuOm6lkwrRgAcIvjR8VNES1ukiClVO4_i6GvLblAZNbyy2a5Q
Message-ID: <CAP-5=fVxwV0rKrHgDN_j-SsHnAvrJK-WgDuvi-KAYkqNO6iTJQ@mail.gmail.com>
Subject: Re: [PATCH v1 12/23] perf dwarf-regs: Add get_dwarf_regnum_for_perf_regnum
 and use for x86 unwinding
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Chun-Tse Shao <ctshao@google.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_214218_522990_142FBB8F 
X-CRM114-Status: GOOD (  26.85  )
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

On Fri, Jan 16, 2026 at 9:29=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Add a utility to map a perf register number to a dwarf register number
> for a particular ELF machine type.
>
> Create a generic unwind-libdw initial register initialization routine
> that uses this function and thereby avoids arch specific
> initialization. The unwind-libdw code does:
> 1) compute the maximum dwarf register from the set of sampled user regist=
ers,
> 2) allocates a set of dwarf registers,
> 3) copies the sample registers into the appropriate dwarf registers.
>
> This generic solution is initially implemented for use with x86 as
> only get_dwarf_regnum_for_perf_regnum support for x86 is currently presen=
t.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  .../util/dwarf-regs-arch/dwarf-regs-x86.c     | 95 +++++++++++++++++++
>  tools/perf/util/dwarf-regs.c                  | 55 +++++++++++
>  tools/perf/util/include/dwarf-regs.h          |  8 ++
>  tools/perf/util/unwind-libdw-arch/Build       |  1 -
>  .../util/unwind-libdw-arch/unwind-libdw-x86.c | 54 -----------
>  tools/perf/util/unwind-libdw.c                | 70 ++++++++++++--
>  tools/perf/util/unwind-libdw.h                |  2 +-
>  7 files changed, 222 insertions(+), 63 deletions(-)
>  delete mode 100644 tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
>
> diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c b/tools/per=
f/util/dwarf-regs-arch/dwarf-regs-x86.c
> index f0c42e4d7423..cadef120aeb4 100644
> --- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
> +++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-x86.c
> @@ -10,6 +10,7 @@
>  #include <string.h> /* for strcmp */
>  #include <linux/kernel.h> /* for ARRAY_SIZE */
>  #include <dwarf-regs.h>
> +#include "../../../arch/x86/include/uapi/asm/perf_regs.h"
>
>  struct dwarf_regs_idx {
>         const char *name;
> @@ -163,3 +164,97 @@ int __get_dwarf_regnum_x86_64(const char *name)
>  {
>         return get_regnum(x86_64_regidx_table, ARRAY_SIZE(x86_64_regidx_t=
able), name);
>  }
> +
> +int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum)
> +{
> +       static const int dwarf_i386_regnums[] =3D {
> +               [PERF_REG_X86_AX] =3D 0,
> +               [PERF_REG_X86_BX] =3D 3,
> +               [PERF_REG_X86_CX] =3D 1,
> +               [PERF_REG_X86_DX] =3D 2,
> +               [PERF_REG_X86_SI] =3D 6,
> +               [PERF_REG_X86_DI] =3D 7,
> +               [PERF_REG_X86_BP] =3D 5,
> +               [PERF_REG_X86_SP] =3D 4,
> +               [PERF_REG_X86_IP] =3D 8,
> +               [PERF_REG_X86_FLAGS] =3D 9,
> +               [PERF_REG_X86_CS] =3D 41,
> +               [PERF_REG_X86_SS] =3D 42,
> +               [PERF_REG_X86_DS] =3D 43,
> +               [PERF_REG_X86_ES] =3D 40,
> +               [PERF_REG_X86_FS] =3D 44,
> +               [PERF_REG_X86_GS] =3D 45,
> +               [PERF_REG_X86_XMM0] =3D 21,
> +               [PERF_REG_X86_XMM1] =3D 22,
> +               [PERF_REG_X86_XMM2] =3D 23,
> +               [PERF_REG_X86_XMM3] =3D 24,
> +               [PERF_REG_X86_XMM4] =3D 25,
> +               [PERF_REG_X86_XMM5] =3D 26,
> +               [PERF_REG_X86_XMM6] =3D 27,
> +               [PERF_REG_X86_XMM7] =3D 28,
> +       };
> +
> +       if (perf_regnum =3D=3D 0)
> +               return 0;
> +
> +       if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_i386_=
regnums) ||
> +           dwarf_i386_regnums[perf_regnum] =3D=3D 0)
> +               return -ENOENT;
> +
> +       return dwarf_i386_regnums[perf_regnum];
> +}
> +
> +int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum)
> +{
> +       static const int dwarf_x86_64_regnums[] =3D {
> +               [PERF_REG_X86_AX] =3D 0,
> +               [PERF_REG_X86_BX] =3D 3,
> +               [PERF_REG_X86_CX] =3D 2,
> +               [PERF_REG_X86_DX] =3D 1,
> +               [PERF_REG_X86_SI] =3D 4,
> +               [PERF_REG_X86_DI] =3D 5,
> +               [PERF_REG_X86_BP] =3D 6,
> +               [PERF_REG_X86_SP] =3D 7,
> +               [PERF_REG_X86_IP] =3D 16,
> +               [PERF_REG_X86_FLAGS] =3D 49,
> +               [PERF_REG_X86_CS] =3D 51,
> +               [PERF_REG_X86_SS] =3D 52,
> +               [PERF_REG_X86_DS] =3D 53,
> +               [PERF_REG_X86_ES] =3D 50,
> +               [PERF_REG_X86_FS] =3D 54,
> +               [PERF_REG_X86_GS] =3D 55,
> +               [PERF_REG_X86_R8] =3D 8,
> +               [PERF_REG_X86_R9] =3D 9,
> +               [PERF_REG_X86_R10] =3D 10,
> +               [PERF_REG_X86_R11] =3D 11,
> +               [PERF_REG_X86_R12] =3D 12,
> +               [PERF_REG_X86_R13] =3D 13,
> +               [PERF_REG_X86_R14] =3D 14,
> +               [PERF_REG_X86_R15] =3D 15,
> +               [PERF_REG_X86_XMM0] =3D 17,
> +               [PERF_REG_X86_XMM1] =3D 18,
> +               [PERF_REG_X86_XMM2] =3D 19,
> +               [PERF_REG_X86_XMM3] =3D 20,
> +               [PERF_REG_X86_XMM4] =3D 21,
> +               [PERF_REG_X86_XMM5] =3D 22,
> +               [PERF_REG_X86_XMM6] =3D 23,
> +               [PERF_REG_X86_XMM7] =3D 24,
> +               [PERF_REG_X86_XMM8] =3D 25,
> +               [PERF_REG_X86_XMM9] =3D 26,
> +               [PERF_REG_X86_XMM10] =3D 27,
> +               [PERF_REG_X86_XMM11] =3D 28,
> +               [PERF_REG_X86_XMM12] =3D 29,
> +               [PERF_REG_X86_XMM13] =3D 30,
> +               [PERF_REG_X86_XMM14] =3D 31,
> +               [PERF_REG_X86_XMM15] =3D 32,
> +       };
> +
> +       if (perf_regnum =3D=3D 0)
> +               return 0;
> +
> +       if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_x86_6=
4_regnums) ||
> +           dwarf_x86_64_regnums[perf_regnum] =3D=3D 0)
> +               return -ENOENT;
> +
> +       return dwarf_x86_64_regnums[perf_regnum];
> +}
> diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
> index ef249dd589e3..1f7d892612df 100644
> --- a/tools/perf/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs.c
> @@ -103,3 +103,58 @@ int get_dwarf_regnum(const char *name, unsigned int =
machine, unsigned int flags
>         free(regname);
>         return reg;
>  }
> +
> +static int get_libdw_frame_nregs(unsigned int machine, unsigned int flag=
s __maybe_unused)
> +{
> +       switch (machine) {
> +       case EM_X86_64:
> +               return 17;
> +       case EM_386:
> +               return 9;
> +       case EM_ARM:
> +               return 16;
> +       case EM_AARCH64:
> +               return 97;
> +       case EM_CSKY:
> +               return 38;
> +       case EM_S390:
> +               return 32;
> +       case EM_PPC:
> +       case EM_PPC64:
> +               return 145;
> +       case EM_RISCV:
> +               return 66;
> +       case EM_SPARC:
> +       case EM_SPARCV9:
> +               return 103;
> +       case EM_LOONGARCH:
> +               return 74;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +int get_dwarf_regnum_for_perf_regnum(int perf_regnum, unsigned int machi=
ne,
> +                                    unsigned int flags, bool only_libdw_=
supported)
> +{
> +       int reg;
> +
> +       switch (machine) {
> +       case EM_X86_64:
> +               reg =3D __get_dwarf_regnum_for_perf_regnum_x86_64(perf_re=
gnum);
> +               break;
> +       case EM_386:
> +               reg =3D __get_dwarf_regnum_for_perf_regnum_i386(perf_regn=
um);
> +               break;
> +       default:
> +               pr_err("ELF MACHINE %x is not supported.\n", machine);
> +               return -ENOENT;
> +       }
> +       if (reg >=3D 0 && only_libdw_supported) {
> +               int nregs =3D get_libdw_frame_nregs(machine, flags);
> +
> +               if (reg >=3D nregs)
> +                       reg =3D -ENOENT;
> +       }
> +       return reg;
> +}
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/inclu=
de/dwarf-regs.h
> index bb5413b0fee4..00881f1d45d6 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -101,6 +101,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned=
 int machine, unsigned int
>
>  int __get_dwarf_regnum_i386(const char *name);
>  int __get_dwarf_regnum_x86_64(const char *name);
> +int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum);
> +int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum);
>
>  /*
>   * get_dwarf_regnum - Returns DWARF regnum from register name
> @@ -109,6 +111,12 @@ int __get_dwarf_regnum_x86_64(const char *name);
>   */
>  int get_dwarf_regnum(const char *name, unsigned int machine, unsigned in=
t flags);
>
> +/*
> + * get_dwarf_regnum - Returns DWARF regnum from perf register number.
> + */
> +int get_dwarf_regnum_for_perf_regnum(int perf_regnum, unsigned int machi=
ne, unsigned int flags,
> +                                    bool only_libdw_supported);
> +
>  void get_powerpc_regs(u32 raw_insn, int is_source, struct annotated_op_l=
oc *op_loc);
>
>  #else /* HAVE_LIBDW_SUPPORT */
> diff --git a/tools/perf/util/unwind-libdw-arch/Build b/tools/perf/util/un=
wind-libdw-arch/Build
> index ef17a83a7813..5b5682029953 100644
> --- a/tools/perf/util/unwind-libdw-arch/Build
> +++ b/tools/perf/util/unwind-libdw-arch/Build
> @@ -1,4 +1,3 @@
> -perf-util-y +=3D unwind-libdw-x86.o
>  perf-util-y +=3D unwind-libdw-arm.o
>  perf-util-y +=3D unwind-libdw-arm64.o
>  perf-util-y +=3D unwind-libdw-csky.o
> diff --git a/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c b/tools=
/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
> deleted file mode 100644
> index dd27545a4a68..000000000000
> --- a/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include <elfutils/libdwfl.h>
> -#include "../arch/x86/include/uapi/asm/perf_regs.h"
> -#include "util/unwind-libdw.h"
> -#include "util/perf_regs.h"
> -#include "util/sample.h"
> -
> -bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg)
> -{
> -       struct unwind_info *ui =3D arg;
> -       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> -       Dwarf_Word dwarf_regs[17];
> -       unsigned nregs;
> -
> -#define REG(r) ({                                              \
> -       Dwarf_Word val =3D 0;                                     \
> -       perf_reg_value(&val, user_regs, PERF_REG_X86_##r);      \
> -       val;                                                    \
> -})
> -
> -       if (user_regs->abi =3D=3D PERF_SAMPLE_REGS_ABI_32) {
> -               dwarf_regs[0] =3D REG(AX);
> -               dwarf_regs[1] =3D REG(CX);
> -               dwarf_regs[2] =3D REG(DX);
> -               dwarf_regs[3] =3D REG(BX);
> -               dwarf_regs[4] =3D REG(SP);
> -               dwarf_regs[5] =3D REG(BP);
> -               dwarf_regs[6] =3D REG(SI);
> -               dwarf_regs[7] =3D REG(DI);
> -               dwarf_regs[8] =3D REG(IP);
> -               nregs =3D 9;
> -       } else {
> -               dwarf_regs[0]  =3D REG(AX);
> -               dwarf_regs[1]  =3D REG(DX);
> -               dwarf_regs[2]  =3D REG(CX);
> -               dwarf_regs[3]  =3D REG(BX);
> -               dwarf_regs[4]  =3D REG(SI);
> -               dwarf_regs[5]  =3D REG(DI);
> -               dwarf_regs[6]  =3D REG(BP);
> -               dwarf_regs[7]  =3D REG(SP);
> -               dwarf_regs[8]  =3D REG(R8);
> -               dwarf_regs[9]  =3D REG(R9);
> -               dwarf_regs[10] =3D REG(R10);
> -               dwarf_regs[11] =3D REG(R11);
> -               dwarf_regs[12] =3D REG(R12);
> -               dwarf_regs[13] =3D REG(R13);
> -               dwarf_regs[14] =3D REG(R14);
> -               dwarf_regs[15] =3D REG(R15);
> -               dwarf_regs[16] =3D REG(IP);
> -               nregs =3D 17;
> -       }
> -
> -       return dwfl_thread_state_registers(thread, 0, nregs, dwarf_regs);
> -}
> diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libd=
w.c
> index c25190cdceb4..055dab921442 100644
> --- a/tools/perf/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw.c
> @@ -6,6 +6,7 @@
>  #include <errno.h>
>  #include "debug.h"
>  #include "dso.h"
> +#include <dwarf-regs.h>
>  #include "unwind.h"
>  #include "unwind-libdw.h"
>  #include "machine.h"
> @@ -225,6 +226,59 @@ static bool memory_read(Dwfl *dwfl __maybe_unused, D=
warf_Addr addr, Dwarf_Word *
>         return true;
>  }
>
> +static bool libdw_set_initial_registers_generic(Dwfl_Thread *thread, voi=
d *arg)
> +{
> +       struct unwind_info *ui =3D arg;
> +       struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> +       Dwarf_Word *dwarf_regs;
> +       int max_dwarf_reg =3D 0;
> +       bool ret;
> +       uint16_t e_machine =3D ui->e_machine;
> +       int e_flags =3D 0;
> +       uint64_t ip_perf_reg =3D perf_arch_reg_ip(e_machine);
> +       Dwarf_Word val =3D 0;
> +
> +
> +       /*
> +        * For every possible perf register in the bitmap determine the d=
warf
> +        * register and use to compute the max.
> +        */
> +       for (int perf_reg =3D 0; perf_reg < 64; perf_reg++) {
> +               if (user_regs->mask & (1ULL << perf_reg)) {
> +                       int dwarf_reg =3D
> +                               get_dwarf_regnum_for_perf_regnum(perf_reg=
, e_machine,
> +                                                                e_flags,
> +                                                                /*only_l=
ibdw_supported=3D*/true);
> +                       if (dwarf_reg > max_dwarf_reg)
> +                               max_dwarf_reg =3D dwarf_reg;
> +               }
> +       }
> +
> +       dwarf_regs =3D calloc(max_dwarf_reg + 1, sizeof(*dwarf_regs));
> +       if (!dwarf_regs)
> +               return false;
> +
> +       for (int perf_reg =3D 0; perf_reg < 64; perf_reg++) {
> +               if (user_regs->mask & (1ULL << perf_reg)) {
> +                       int dwarf_reg =3D
> +                               get_dwarf_regnum_for_perf_regnum(perf_reg=
, e_machine,
> +                                                                e_flags,
> +                                                                /*only_l=
ibdw_supported=3D*/true);
> +                       if (dwarf_reg >=3D 0) {
> +                               val =3D 0;
> +                               if (perf_reg_value(&val, user_regs, perf_=
reg) =3D=3D 0)
> +                                       dwarf_regs[dwarf_reg] =3D val;
> +                       }
> +               }
> +       }
> +       if (perf_reg_value(&val, user_regs, ip_perf_reg) =3D=3D 0)
> +               dwfl_thread_state_register_pc(thread, val);
> +
> +       ret =3D dwfl_thread_state_registers(thread, 0, max_dwarf_reg + 1,=
 dwarf_regs);

I always forget something. There's possibly a TODO/alternative here
where rather than computing the max dwarf register, copying the
registers and calling dwfl_thread_state_registers, the code could read
the register then call dwfl_thread_state_registers just for that 1
register. The code as it is here is closest to the code as it was
before the change, but removing a memory allocation/free may have some
benefit.

Thanks,
Ian

> +       free(dwarf_regs);
> +       return ret;
> +}
> +
>  #define DEFINE_DWFL_THREAD_CALLBACKS(arch)                           \
>  static const Dwfl_Thread_Callbacks callbacks_##arch =3D {              \
>         .next_thread           =3D next_thread,                        \
> @@ -232,7 +286,12 @@ static const Dwfl_Thread_Callbacks callbacks_##arch =
=3D {              \
>         .set_initial_registers =3D libdw_set_initial_registers_##arch, \
>  }
>
> -DEFINE_DWFL_THREAD_CALLBACKS(x86);
> +static const Dwfl_Thread_Callbacks callbacks_generic =3D {
> +       .next_thread           =3D next_thread,
> +       .memory_read           =3D memory_read,
> +       .set_initial_registers =3D libdw_set_initial_registers_generic,
> +};
> +
>  DEFINE_DWFL_THREAD_CALLBACKS(arm);
>  DEFINE_DWFL_THREAD_CALLBACKS(arm64);
>  DEFINE_DWFL_THREAD_CALLBACKS(csky);
> @@ -257,12 +316,8 @@ static const Dwfl_Thread_Callbacks *get_thread_callb=
acks(const char *arch)
>                 return &callbacks_riscv;
>         else if (!strcmp(arch, "s390"))
>                 return &callbacks_s390;
> -       else if (!strcmp(arch, "x86"))
> -               return &callbacks_x86;
>
> -       pr_err("Fail to get thread callbacks for arch %s, returns NULL\n"=
,
> -              arch);
> -       return NULL;
> +       return &callbacks_generic;
>  }
>
>  static int
> @@ -301,6 +356,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *a=
rg,
>                         bool best_effort)
>  {
>         struct machine *machine =3D maps__machine(thread__maps(thread));
> +       uint16_t e_machine =3D thread__e_machine(thread, machine);
>         struct unwind_info *ui, ui_buf =3D {
>                 .sample         =3D data,
>                 .thread         =3D thread,
> @@ -308,9 +364,9 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *a=
rg,
>                 .cb             =3D cb,
>                 .arg            =3D arg,
>                 .max_stack      =3D max_stack,
> +               .e_machine      =3D e_machine,
>                 .best_effort    =3D best_effort
>         };
> -       uint16_t e_machine =3D thread__e_machine(thread, machine);
>         const char *arch =3D perf_env__arch(machine->env);
>         Dwarf_Word ip;
>         int err =3D -EINVAL, i;
> diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-libd=
w.h
> index 574b29848cce..496e5898e7ef 100644
> --- a/tools/perf/util/unwind-libdw.h
> +++ b/tools/perf/util/unwind-libdw.h
> @@ -9,7 +9,6 @@ struct machine;
>  struct perf_sample;
>  struct thread;
>
> -bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg);
>  bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg);
>  bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg);
>  bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg);
> @@ -28,6 +27,7 @@ struct unwind_info {
>         void                    *arg;
>         int                     max_stack;
>         int                     idx;
> +       uint16_t                e_machine;
>         bool                    best_effort;
>         struct unwind_entry     entries[];
>  };
> --
> 2.52.0.457.g6b5491de43-goog
>

