Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980C8D3409E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=; b=SIKeb/iCDNnqICL36fZeBv96kh
	xkmOrhPFkh0o/3hqOixDe2aLROMCpYgzR6d+egYviUfF2mg2IXoV3iWzVB159vX7B9fdb3GzwTVUF
	GKOWfy3uRIFaDj+ziao8O1Cr8Kh1DXGU+N6mb06X2rBh6naFg7/7ArS5vwhozGfhIDI/nEihGwEgB
	K7njNr+aQtbjd07jMFTfv/oQPFaRSX7Z2Fi8hGZ6U/nvu9sEOIvogKW15A7ve5bioiQQKySAAV27g
	Z8HD4PDeHE+GDxnMhrMf3h+F5DfgJw8YLBQtXgNatGDwaXA8WZG6givGkrABbYrog3xrsxSn6lXjL
	rXFN2HTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklfF-0000000EdIz-2VYg;
	Tue, 27 Jan 2026 16:11:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklfC-0000000EdI6-0w80
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:11:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a1462573caso77835ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 08:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769530293; cv=none;
        d=google.com; s=arc-20240605;
        b=TQBQUYFJDAxDJCYlY0LcI22FZLmpNyUH7YYmfrSrF8wsuQWlL4oRJrDIYhbrbJJBDI
         s39DP0wCmTo2qsD6bcreX2Aw+jM2aZd8z1kfqRhxVLuObpUodBogpR+6587HeyIZBU8Y
         ov8XSGcmciHa2r4IiRwJWGkpP9tXtdZEYonvJIIXFwEbBDt3MuoKso6FFbUj0ezEubTp
         I9x2JtAk2Zl/heVevozIQtAg9TJWUrRcv0I3mGnBFkC+EmSz/QMKxczYlnOvaWHIxP9q
         tsl8D4f1nteWJxxJGUYNLIs02JB2KayRio9/tbGc2GMG+9hHcyM4KuR20TvwpCcgjYX/
         cuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=;
        fh=2jWdXumi+iJr+KfT+pVh6C++CmVAThRuW0vNclcP6Rs=;
        b=SW5Q5fnZEQUtDzTVIDW7k5I62REs6/ruGzZA7t7DbeMrh3XToDPwdBQ7sqecB+SaKp
         EOjQ5btwC5JKtnMzWr09ZZxLXBKWSX8+C3oGQXXp2TvyG4cM9xwur6zK6lZPEGmlx/Bl
         KMLSkH5qybwnB5HlzPrttfuiOwB0eY4DzMhw0qO1uojDjzOOfyufRNjipR7FI1sunWna
         Cu0L2iVw4ygjzVIelaooM87dIOoQH69qQE1E4bu/dOO9TUTuKHgp2ro+H7tw4bymlOw2
         Dmd4Ft0ZlyK6Q/QnwPwP07GxImny7Kl4qxDpxg2vSn9dkSOo9jE1sCU9OE+QnUHIi5FV
         yimA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769530293; x=1770135093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=;
        b=sSRz3/M3JNxXB1ieXEXxfzZC7vd596TH4lTHn/ClIk51zlGkN0rkocAaRqVkueWqcA
         V78o4C6HsJetIdXILMvqXJZ1tHfojCJSCSTcFhWySsLbeOQorX64W5x353dCx1MkH8mi
         aTYzy1YTQhsYoY1bTzMlnZF9XBTqqVRNhlByPoPT+F6bPnpbhHb02R21EOobRFpvAR3T
         DCgJVryXwlZWpVtA8ewKbNXKmgaNFzJaxJ8994jY0cdxH1DHIzS4sFQCJec58XZ6GLM1
         jK2oG2Wcx4oODyND6jmfi1k4DhJEbdq4e4zdOeTbX9Aku6iZ9vRJzqBfjDCIVKOpvz7i
         AXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769530293; x=1770135093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/mleTy9B4/UIaLOH3Gao4Wnx4rcDBQf6oq8eOX91jQ=;
        b=l5lLzVYgqftl3AXiv/6Mwuj49XG8SMd0AwmXndSK2t07tgn9hxLBdV1oAYQEeC9K3X
         Or6GAQOhPKxdb35BdXaeBgJwf567hSFHMMJu2Z9H0PS1654Rpx2AWxSfT1xzSnLMeuTi
         3XFwx7oD9xe9YL5Qt4UL7V4C4HXNZxEXrGJqFVonFhSCpePSFbQooyIUzUJEIv/TDGI/
         haE77JYe3sbi6YPiJuyYS1F7YFpGGicjuzX7uuFUW2qjCaqiucvt9ZEMoF9PYRetAX4H
         I8OSUvlfHVosNXEqsDRIlt3490Znh+hoGxNG5oJSoP1e0wux/M9dyb1NocGS3XsvbKkQ
         E5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV4VtEmDSo4/0pYQYfVtbNkyJiUhELeFEPi85YroSe5qilRaIkKgbQKtovQi/6Mravnf9QXpt0xNKiOtQ126gT@lists.infradead.org
X-Gm-Message-State: AOJu0YzgzyCWG+6ciZCPsXLE91e4J/vHL8fUuuAfwaC2tVK8rbMOVLEa
	1JkbZnubBuvNdXSszJE+OsceKnoPWF0rQ6cX2bMxzNS0SkqQA6BEw1nCulVxrsJjGc2xs7TEWBU
	gwU5StT6jVPVQumFjj/K1c2vlrheOLabaCK+fMnYR
X-Gm-Gg: AZuq6aLdnDBqE/MEwV2b0uNTAqdEmqcQpKwHGSriXgRZJaB1Wmw7TY+fajvrNVgtU4S
	WFxPRhNtvIpiClvA6j9QX6ssmysv6NlFbJfxh+Z4cu3XLrZGZQXnIBTispFL6lV0G7BafwjLoSt
	JhjAin97DP1yN4nHzh1J64rgXN1Qw9zqeuDDYsUhIL7MAPaww0jEX35uYmplvYEqz7MIl3YPXvK
	gmvhHgM5ML6WGX/PjCeOSfGdQFP3OCPbb2rwUXvFWcgPwTRThEk/F23vxeYhnsEmNdraVQ7aDSR
	UyUUy0HGdk4546hxyPlDV4zL
X-Received: by 2002:a17:902:cecb:b0:2a1:3cdc:7720 with SMTP id
 d9443c01a7336-2a870b9a583mr2100165ad.21.1769530292678; Tue, 27 Jan 2026
 08:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20260127070259.2720468-1-dapeng1.mi@linux.intel.com>
 <20260127070259.2720468-2-dapeng1.mi@linux.intel.com> <a97ff1d6-7712-4315-95ff-4079ffc752f7@linux.intel.com>
In-Reply-To: <a97ff1d6-7712-4315-95ff-4079ffc752f7@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 Jan 2026 08:11:21 -0800
X-Gm-Features: AZwV_QjW0pwOnDUxPFtiXQXGGTFi90qXyv8gN_Wjk26BamAh3tH23kY_UBLKyTk
Message-ID: <CAP-5=fXW2KiHy+wT16nRgQK4xboTzcTH3pMEe3=En7dwUNGJPQ@mail.gmail.com>
Subject: Re: [Patch v2 1/3] perf arch: Update arch headers to use relative
 UAPI paths
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
X-CRM114-CacheID: sfid-20260127_081135_186393_FF7CD4AD 
X-CRM114-Status: GOOD (  20.81  )
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

On Tue, Jan 27, 2026 at 4:38=E2=80=AFAM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
>
> On 1/27/2026 3:02 PM, Dapeng Mi wrote:
> > The architectural specific headers perf_regs.h currently rely on the
> > host architecture's 'asm/perf_regs.h'. This can lead to compilation
> > inconsistencies or failures when including and building perf for a
> > target architecture that differs from the host's architecture.
> >
> > Explicitly point to the UAPI headers within the tools source tree using
> > relative paths. This ensures that perf is always built against the
> > intended architecture.
> >
> > No functional changes are intended.
> >
> > Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> > ---
> >  tools/perf/arch/arm/include/perf_regs.h       | 2 +-
> >  tools/perf/arch/arm64/include/perf_regs.h     | 2 +-
> >  tools/perf/arch/csky/include/perf_regs.h      | 1 +
> >  tools/perf/arch/loongarch/include/perf_regs.h | 2 +-
> >  tools/perf/arch/mips/include/perf_regs.h      | 2 +-
> >  tools/perf/arch/powerpc/include/perf_regs.h   | 2 +-
> >  tools/perf/arch/riscv/include/perf_regs.h     | 2 +-
> >  tools/perf/arch/s390/include/perf_regs.h      | 2 +-
> >  tools/perf/arch/x86/include/perf_regs.h       | 2 +-
> >  9 files changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/tools/perf/arch/arm/include/perf_regs.h b/tools/perf/arch/=
arm/include/perf_regs.h
> > index 75ce1c370114..20c54766e3a0 100644
> > --- a/tools/perf/arch/arm/include/perf_regs.h
> > +++ b/tools/perf/arch/arm/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/arm/include/uapi/asm/perf_regs.h"
> >
> >  void perf_regs_load(u64 *regs);
> >
> > diff --git a/tools/perf/arch/arm64/include/perf_regs.h b/tools/perf/arc=
h/arm64/include/perf_regs.h
> > index 58639ee9f7ea..372f2565a9dd 100644
> > --- a/tools/perf/arch/arm64/include/perf_regs.h
> > +++ b/tools/perf/arch/arm64/include/perf_regs.h
> > @@ -5,7 +5,7 @@
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> >  #define perf_event_arm_regs perf_event_arm64_regs
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/arm64/include/uapi/asm/perf_regs.h"
> >  #undef perf_event_arm_regs
> >
> >  void perf_regs_load(u64 *regs);
> > diff --git a/tools/perf/arch/csky/include/perf_regs.h b/tools/perf/arch=
/csky/include/perf_regs.h
> > index 076c7746c8a2..9520e6aa319e 100644
> > --- a/tools/perf/arch/csky/include/perf_regs.h
> > +++ b/tools/perf/arch/csky/include/perf_regs.h
> > @@ -7,6 +7,7 @@
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> >  #include <asm/perf_regs.h>
>
> Oops, the above line was not removed. Would remove it in next version.

Aside from this:
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > +#include "../../../../arch/csky/include/uapi/asm/perf_regs.h"
> >
> >  #define PERF_REGS_MASK       ((1ULL << PERF_REG_CSKY_MAX) - 1)
> >  #define PERF_REGS_MAX        PERF_REG_CSKY_MAX
> > diff --git a/tools/perf/arch/loongarch/include/perf_regs.h b/tools/perf=
/arch/loongarch/include/perf_regs.h
> > index 45c799fa5330..b86078a55e90 100644
> > --- a/tools/perf/arch/loongarch/include/perf_regs.h
> > +++ b/tools/perf/arch/loongarch/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/loongarch/include/uapi/asm/perf_regs.h"
> >
> >  #define PERF_REGS_MAX PERF_REG_LOONGARCH_MAX
> >
> > diff --git a/tools/perf/arch/mips/include/perf_regs.h b/tools/perf/arch=
/mips/include/perf_regs.h
> > index 7082e91e0ed1..66655f0c4fea 100644
> > --- a/tools/perf/arch/mips/include/perf_regs.h
> > +++ b/tools/perf/arch/mips/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/mips/include/uapi/asm/perf_regs.h"
> >
> >  #define PERF_REGS_MAX PERF_REG_MIPS_MAX
> >
> > diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/a=
rch/powerpc/include/perf_regs.h
> > index 1c66f6ba6773..22b492a3dd58 100644
> > --- a/tools/perf/arch/powerpc/include/perf_regs.h
> > +++ b/tools/perf/arch/powerpc/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/powerpc/include/uapi/asm/perf_regs.h"
> >
> >  void perf_regs_load(u64 *regs);
> >
> > diff --git a/tools/perf/arch/riscv/include/perf_regs.h b/tools/perf/arc=
h/riscv/include/perf_regs.h
> > index d482edb413e5..89d5bbb8d2b8 100644
> > --- a/tools/perf/arch/riscv/include/perf_regs.h
> > +++ b/tools/perf/arch/riscv/include/perf_regs.h
> > @@ -6,7 +6,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/riscv/include/uapi/asm/perf_regs.h"
> >
> >  #define PERF_REGS_MASK       ((1ULL << PERF_REG_RISCV_MAX) - 1)
> >  #define PERF_REGS_MAX        PERF_REG_RISCV_MAX
> > diff --git a/tools/perf/arch/s390/include/perf_regs.h b/tools/perf/arch=
/s390/include/perf_regs.h
> > index 130dfad2b96a..9c95589965fe 100644
> > --- a/tools/perf/arch/s390/include/perf_regs.h
> > +++ b/tools/perf/arch/s390/include/perf_regs.h
> > @@ -3,7 +3,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/s390/include/uapi/asm/perf_regs.h"
> >
> >  void perf_regs_load(u64 *regs);
> >
> > diff --git a/tools/perf/arch/x86/include/perf_regs.h b/tools/perf/arch/=
x86/include/perf_regs.h
> > index f209ce2c1dd9..5495e5ca7cdc 100644
> > --- a/tools/perf/arch/x86/include/perf_regs.h
> > +++ b/tools/perf/arch/x86/include/perf_regs.h
> > @@ -4,7 +4,7 @@
> >
> >  #include <stdlib.h>
> >  #include <linux/types.h>
> > -#include <asm/perf_regs.h>
> > +#include "../../../../arch/x86/include/uapi/asm/perf_regs.h"
> >
> >  void perf_regs_load(u64 *regs);
> >

