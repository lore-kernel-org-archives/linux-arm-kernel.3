Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6879CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 19:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjHVF3KpeMjR0PED2p4APBcNH+XxgcZEBOV6nA+/pQM=; b=kkJKbdxsbmT8yGyOquD5/PNQ1z
	iPc2UgrghmVaGDKUvzgANISQQ8nonxnP3YBEPmcSkK9kSFpZglV7QVn4rkVDe+UG8OKMoQPxP4jwV
	LWrgKAjLYMaRE2IfuiwPNxdVriKo6akxU07svAIW2cV2gxcHRMfTAXavCq/TmIG0qNBt2qsxNToc0
	ApT8mngYTXC66QMr5bd4dEvnUvbl5pT1vFGwRnhlpBKxhxmG5zr66p5FlgKF64Omm43MoESCmMltO
	YCFMY1GaO4/Y9vn9GJHuK+yYNnDkzomoKhkvSegKzDktAA393MamilmvgWBvm0WGZjFNSGGzmYvZ+
	hlUKy10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNy7o-00000009CeS-3zsQ;
	Fri, 15 May 2026 19:23:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNy7m-00000009Cdt-21U8;
	Fri, 15 May 2026 19:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5C9D40479;
	Fri, 15 May 2026 19:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307ADC2BCB0;
	Fri, 15 May 2026 19:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778872985;
	bh=rXrB5o+6rkXZT2JMvoo5wjhRNclAQqhZfhQ8nzbLo+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/WA/N4r5rSx+OuM+K9jt7MzFmS/gWxdrwn7IeTlyv3ItM4HJchKbCCMDnJsClmiC
	 O6chCr5oLBFovafc3glQjjdi8s537VNJWH+1GXK2TIMC2AwXxi8kyvY6C2zDwGGMKx
	 oc3/OCOKwpy3dQUumtfwfor7x1XCQKMvCMYHs/3zc2Tprp4C95oym5YMDRX7OV2qq6
	 P0gy8tPydRF5Acnp1NJ3+dxVry0WQIphXmqZCWJDkxZZkFp4wIrkzec9Pjm3u/p+m9
	 ZPh0qZfvJCttFifgZTWakzsrl4eflaUXR6XOZ62hJ813bVrHj0NlQlwEIgHSJ4/+nJ
	 uHVi19JmuoaiA==
Date: Fri, 15 May 2026 16:23:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com,
	james.clark@linaro.org, namhyung@kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Li Guan <guanli.oerv@isrc.iscas.ac.cn>, 9erthalion6@gmail.com,
	alex@ghiti.fr, alexander.shishkin@linux.intel.com,
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
	atrajeev@linux.ibm.com, howardchu95@gmail.com,
	john.g.garry@oracle.com, jolsa@kernel.org, leo.yan@linux.dev,
	libunwind-devel@nongnu.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org, mingo@redhat.com,
	palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org,
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com,
	will@kernel.org
Subject: Re: [PATCH v5 4/7] perf unwind-libunwind: Make libunwind register
 reading cross platform
Message-ID: <agdyluuau3wPQOtX@x1>
References: <20260413024805.1316480-1-irogers@google.com>
 <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-5-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513233151.572332-5-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_122306_566847_C0B78E6D 
X-CRM114-Status: GOOD (  11.55  )
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

On Wed, May 13, 2026 at 04:31:48PM -0700, Ian Rogers wrote:
> --- /dev/null
> +++ b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include "libunwind-arch.h"
> +#include "../debug.h"
> +#include "../../../arch/powerpc/include/uapi/asm/perf_regs.h"
> +#include <linux/compiler.h>
> +#include <errno.h>
> +
> +#ifdef HAVE_LIBUNWIND_PPC32_SUPPORT
> +#include <libunwind-ppc32.h>
> +#endif
> +
> +int __get_perf_regnum_for_unw_regnum_ppc32(int unw_regnum __maybe_unused)
> +{
> +#ifndef HAVE_LIBUNWIND_PPC32_SUPPORT
> +	return -EINVAL;
> +#else
> +	switch (unw_regnum) {
> +	case UNW_PPC32_R0 ... UNW_PPC32_R31:
> +		return unw_regnum - UNW_PPC32_R0 + PERF_REG_POWERPC_R0;
> +	case UNW_PPC32_LR:
> +		return PERF_REG_POWERPC_LINK;
> +	case UNW_PPC32_CTR:
> +		return PERF_REG_POWERPC_CTR;
> +	case UNW_PPC32_XER:
> +		return PERF_REG_POWERPC_XER;
> +	default:
> +		pr_err("unwind: invalid reg id %d\n", unw_regnum);
> +		return -EINVAL;
> +	}
> +#endif // HAVE_LIBUNWIND_PPC32_SUPPORT

To address this local sashiko comment:

------------------------------------------------------------
Is the instruction pointer (NIP) intentionally omitted from this switch
statement?

When libunwind attempts to read the instruction pointer, will access_reg()
hit the default case here and return -EINVAL, causing stack unwinding
to fail on 32-bit PowerPC architectures?
For comparison, the 64-bit implementation in libunwind-ppc64.c correctly
maps UNW_PPC64_NIP to PERF_REG_POWERPC_NIP.
------------------------------------------------------------

I ammended this patch with:

⬢ [acme@toolbx perf-tools-next]$ vim tools/perf/util/libunwind-arch/libunwind-ppc32.c
⬢ [acme@toolbx perf-tools-next]$ git diff
diff --git a/tools/perf/util/libunwind-arch/libunwind-ppc32.c b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
index bcdeed34d0a81b8d..976a160304073582 100644
--- a/tools/perf/util/libunwind-arch/libunwind-ppc32.c
+++ b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
@@ -23,6 +23,8 @@ int __get_perf_regnum_for_unw_regnum_ppc32(int unw_regnum __maybe_unused)
                return PERF_REG_POWERPC_CTR;
        case UNW_PPC32_XER:
                return PERF_REG_POWERPC_XER;
+       case UNW_PPC32_NIP:
+               return PERF_REG_POWERPC_NIP;
        default:
                pr_err("unwind: invalid reg id %d\n", unw_regnum);
                return -EINVAL;
⬢ [acme@toolbx perf-tools-next]$

Ok? It was the only issue found in this patch.

- Arnaldo

