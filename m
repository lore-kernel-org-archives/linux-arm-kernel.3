Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70196CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PegKaT1mtH+mwv7bm3xAQDV4/D5RAVdIgX7KfYRGxm0=; b=bB2ZBGwKmsp9msHnfACX9WTP4s
	84jL3VuHEkI3zqN3zxm/5o9MFOf53U9DEmdccvxDmQzh2uYBkgx43046Uo8YyKa/6w3RtnJuykVgm
	2/4puaerh1Ad5WDq3RsIL9tgmhx4oPXMIPjTku+06UxbtvYb1TR9bXLE1qKcoPRUl7sBbaM66Ouf4
	Mhnji7yDTViNyIlSh0IbyckD1ynseswVY/mXdejTs6BYO3/j4Y5eCkuDJugck9hJFEuHiTg/XyAOa
	VpZTEudKtA+z+5s1J+NIvuD+Km5M0l0J6Rm2HLFBxIWfqtXPaMaPHJEXoRaOYy3FBjG2FiHgBpmiX
	/sN4th/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzSq-00000009Pnq-0eRz;
	Fri, 15 May 2026 20:48:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzSn-00000009Pn3-0nzk;
	Fri, 15 May 2026 20:48:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CE164195D;
	Fri, 15 May 2026 20:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A77BC2BCB0;
	Fri, 15 May 2026 20:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778878132;
	bh=mnxRonVmc3SIVkJfuxHHi9gFpuH063Z0knM8Jl4+ZUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sY2x9j3tc+tNhoOAjU2yJZ7X/GCf60U9IvfrSx7LcvtPasbU2cxHxAKyv2I/l+x2b
	 WD8hAJuJ/HsTQafeO3rR4o8YjGHqPegt/gXQy0QhgLcRFVGGZG+K8YTa3FeFIfRcVI
	 6H5NSPaKbg2ZN75fKPC4Mjv0Hp0wMcE67ud5+WEmjT87runl0RBGG4ydGYCKA0n4IH
	 nuaPA6ApcBc6YTCMf/RNhArlzvQNxKRxTFCVMCj3PpvAHPA8srRQL/psG7sHJR/1CX
	 P2SXhwyzb655eVLIC9OI14twWN/GvvUPjPIyWADwFRXEa7yHS2xsn/6kwzhIHSYldV
	 IaFHoxPUu7HvA==
Date: Fri, 15 May 2026 17:48:48 -0300
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
Message-ID: <ageGsOVhDDKnvQhQ@x1>
References: <20260413024805.1316480-1-irogers@google.com>
 <20260513233151.572332-1-irogers@google.com>
 <20260513233151.572332-5-irogers@google.com>
 <agdyluuau3wPQOtX@x1>
 <CAP-5=fUeGOSH1LO1oSbWnpmXfv_RzxfFE+YCQ07PC19gLHDEsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fUeGOSH1LO1oSbWnpmXfv_RzxfFE+YCQ07PC19gLHDEsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_134853_253628_C910D847 
X-CRM114-Status: GOOD (  13.51  )
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

On Fri, May 15, 2026 at 12:38:48PM -0700, Ian Rogers wrote:
> On Fri, May 15, 2026 at 12:23 PM Arnaldo Carvalho de Melo <acme@kernel.org> wrote:

> > +++ b/tools/perf/util/libunwind-arch/libunwind-ppc32.c
> > @@ -23,6 +23,8 @@ int __get_perf_regnum_for_unw_regnum_ppc32(int unw_regnum __maybe_unused)
> >                 return PERF_REG_POWERPC_CTR;
> >         case UNW_PPC32_XER:
> >                 return PERF_REG_POWERPC_XER;
> > +       case UNW_PPC32_NIP:
> > +               return PERF_REG_POWERPC_NIP;
> >         default:
> >                 pr_err("unwind: invalid reg id %d\n", unw_regnum);
> >                 return -EINVAL;
> > ⬢ [acme@toolbx perf-tools-next]$

> > Ok? It was the only issue found in this patch.
 
> Looks good, the NIP is in the original code that I copied, so I don't
> understand how I lost this, but good catch!

What I have is in tmp.perf-tools-next, doing a container build now,
still need to look at the other findings, but they seems either trivial
or complaints about making  the build time more inneficient by not
caching some feature tests, so I think I'll fix the trivial like I did
in the above case (posting diffs to the list) and leave the build time
for later so that we make progress.

Will try to do this later today so that I publish it to perf-tools-next
for it to soak a bit in linux-next.

- Arnaldo

