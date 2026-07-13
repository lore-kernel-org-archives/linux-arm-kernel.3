Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E275BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 04:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwRmwa12BAzmniM/qfe3fdrZEb8WNeId/0JrKyEwP6k=; b=bfBc7S4zeUGCTmDqaUkdDw9cPc
	S+53RdyhZcgA7oU9hchfb2iMETTbsZ0AdohSwNicMP+CLrkxOpNzat/kVb/zfxeX9LKSQz103ENA5
	EB4Xf+a6R5lP5wCpwDCgcXaauAOMjK33vLwRg6bcdOr4C1MzKvkIK/Ati/2UpN/qc24rnhmW+r3z5
	5P0Rs6bzcMIa+Ose2/0ZxRFJrd4ehhLQTY7YARBgcSEaCF1X9cwaltt8KcLsQRaq2xhjhNaHeP8tz
	NplUTNfxHVCDuEFh1iB3ZHqyYJyO1kxkesQi4AzZdbCiRWYuIVTIUPHBkAxp2gVB1sMagWe4RGa1l
	h82qC1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7zN-0000000848G-1sGm;
	Mon, 13 Jul 2026 04:09:53 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7zK-0000000847t-1bla
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 04:09:51 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c15ba5b151dso352434866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 21:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783915787; cv=none;
        d=google.com; s=arc-20260327;
        b=p/xZTZDwHD4EVcsrTy4A0ZsIGve1xuAKJbL2AqgtBs3GQBNOTzcyVX4Yg7rd72yTyw
         FYTQrRn4Fv4kT1UVDpsYhFULrDx7E+uICWHhBfplRxujsqnZxLBQpdGtv6leAsdJVkRQ
         dMSDN/bAyEvQNeT8CuGCdVCkIplZSjzlMcN0uvd3sp/55PYN74RH+G+ZdF+I2BPtz7Rx
         dn5E6btobuwCO4ZhlIy1IijCJ8SuPdz9HFS2SD9nIuALNhzU4c0G+CgWAtf60qc5tqhM
         DFaB50PUeptx+o4WTpjPen9YhAlhjKr2jM13QhH3lErnAUp+PhIHY4IjOIl1djUynzZS
         wgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwRmwa12BAzmniM/qfe3fdrZEb8WNeId/0JrKyEwP6k=;
        fh=hIFvQE0ExvZLt9Kv8sQazUxGQJ5UybbKDAvOj8Hz++w=;
        b=fyG/4IUxRuv/rc5ykVnATIyaCtdLigAs+Dhin20otMpE5WONzx8uwvDzWKcERswHUS
         8YN8f8IY1WrwathLVCAZXETdTjt7oPnGZQ8kWG7WvjnEOlD8hXkN9KfKKxTyXEz7w9sS
         /TC3vOshzYga04i4ug3/OZdqLxQtoyj7nZPfqQGf3TqTBH9qasjDePZLvibixgTI+ytx
         Smo53jSz9obAVgUqtXXpJrPX6u1Ztm0kAHVp2bdfWyuq5FypQd6wRzs0AEbJAWq/hFgX
         6EAKY8pAGi90ocQwPIkipm1HBcLWWIkZFpXgD4eexdIUN1O48Rny56EK1+WNFt7X4bU6
         q+DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783915787; x=1784520587; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwRmwa12BAzmniM/qfe3fdrZEb8WNeId/0JrKyEwP6k=;
        b=lkoPVii4Le5hWrdQJu4NefUHl9ci0b63j7cx5AeiOgb9oaz5LJ4K1Qdh3pISdrjkP5
         1hmoUX7RUrvHs2FYhExIoHN1g+QYVEAvuWIbRU9HC3USFh+uH0pemlCathsce2y2wYyY
         La6pXpv1wGFX5ka3A+25pvBBkRa9fGQHyv3bZVsLKmflN1HRbyk9CgYePftCOQpsRFN8
         4V70A2RYKc647KejPQeEGElkH604630QOKdwN54HpYTItBryQAYoxpgDEXIfh2bc7H4h
         hGyYuBvdf6rzgEJKlg8s72WFINdxC5MAFVb4F1/0cVjyIh80dynhtPrww9t5pYpu0ljH
         DELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783915787; x=1784520587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwRmwa12BAzmniM/qfe3fdrZEb8WNeId/0JrKyEwP6k=;
        b=NTSlyROg857V2dAZiwrEWSXlpv5JQQJCwEdry+VQ3a0+QF5enD+7kSmZhsekK51OZI
         p5tdsz9nuU9d2nSLJQSUC0TBSYKiVHXb4BtPDe35hGjttHTbwJd2dbZufBcHIHVAQYmi
         Rl27/50tWXkVp6xIwFGZfnjfFzZcmYj2lEghLWsZpl8D73SXy//Bafpq4VL1v89gVtfH
         tu2WrsYEt3aCzNRBGGR+B8KImNwi/9RZQAgZpOPTRGcs46YrCDXiPVfENiHgh1qCfPOX
         OhfY9Y06mtAbPDFaa3G2ygsEbn0SxsEe9Dw1/BYAtsJs6Nvh+ur3pAJ+11y1bgR6qK5H
         5qOg==
X-Forwarded-Encrypted: i=1; AHgh+RoLhzPMjmgIocitxUgvX2nSYGos7LcRr2d4Px1jIBovoEnv+Ib+M4ZDj0RNpkdLjJLN4pHlFbnWAgvyM8Am6rZM@lists.infradead.org
X-Gm-Message-State: AOJu0YwlPIku9hGAa/S/7hcvo8Ucceu974p8LVkCbgNb6rstKWzx7Nr5
	q5wG0YFbLL6PklOMaKLgZsyE8rPeymBKYVFPntxvcF3a5SdOKWYowSniP978kkIWUszLZ+zAsgD
	Yr09cqsszIjiqu3s5YAfhnkFBmuMKL3iqUf+8LIOD
X-Gm-Gg: AfdE7cktJjVcLw3gINF95Q9RIulvGSU67hgPzEFONCIX4nK06ngXo+ouD+h0eXt7M+2
	5Txc8o6bgzoqLVUSob4aoZL0bvWfuC5eZ2e5FeZaTwSkJfdo6KvsMQTYPy9aNlhuGUuMSkoA8sH
	JL47woI04lxRdX1iYcQCEXSD2vdIpJuf2jNSJDKmqL5t7cjHUiLIXk47cI4RqKRZyiFBnLuPmAj
	mHntHbryifB+noSOfG5UqrkKllrCaEd7WrmjoWYofDRS7FgLiLpZjKcJqdyq3vctyRieXA6QlpC
	WYhwrousV/IpFd/d+YMlQIQkdHI=
X-Received: by 2002:a17:907:a01:b0:c12:e4c6:c4d4 with SMTP id
 a640c23a62f3a-c161f4713bemr317449966b.63.1783915786759; Sun, 12 Jul 2026
 21:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <FC9E78F0-8FF7-44AF-A848-8401B4702488@linux.dev> <CADrL8HVkrojXbBuEX-W=UHBmyyFzqxdGBvtAoPP53SyYa10uag@mail.gmail.com>
 <ABB70C2A-316E-4C19-A855-C9920BE105E1@linux.dev> <CADrL8HUCqrzOQGXRDwnitintQHjHCw10n8wo6gChQ2tWvC2JBQ@mail.gmail.com>
 <F2693104-180B-44CF-9F3D-CBDE26151EA3@linux.dev>
In-Reply-To: <F2693104-180B-44CF-9F3D-CBDE26151EA3@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Sun, 12 Jul 2026 21:09:09 -0700
X-Gm-Features: AVVi8Cfs1p19kyiJ6G4WadWRtHDTpqre4c38UKODVk6g8mKbqnO6JMtYH9gjlzo
Message-ID: <CADrL8HXZiHcwYR8Hcoje4c9HZBNSCmQcG-3y2f6AhJksYQRvhg@mail.gmail.com>
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_210950_517544_DA61112D 
X-CRM114-Status: GOOD (  46.95  )
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

On Thu, Jul 9, 2026 at 8:41=E2=80=AFPM Muchun Song <muchun.song@linux.dev> =
wrote:
>
> > On Jul 10, 2026, at 03:04, James Houghton <jthoughton@google.com> wrote=
:
> >
> > On Thu, Jul 9, 2026 at 2:55=E2=80=AFAM Muchun Song <muchun.song@linux.d=
ev> wrote:
> >>> On Jul 9, 2026, at 00:49, James Houghton <jthoughton@google.com> wrot=
e:
> >>>
> >>> On Wed, Jul 8, 2026 at 1:41=E2=80=AFAM Muchun Song <muchun.song@linux=
.dev> wrote:
> >>>> Do you mean that the support for AF might vary across different CPUs=
?
> >>>> I'm not that familiar with arm64, so it seems a bit strange to me th=
at
> >>>> such basic hardware features can differ so much from one CPU to anot=
her.
> >>>
> >>> Yes, hardware updates of the Access Flag is a per-CPU feature. It is
> >>> available for a CPU to use if TCR_EL1.HA is set. TCR_EL1 is a system
> >>> register; each CPU has its own. (Linux will always enable HW AF for a
> >>> CPU when it is onlined[1] if support is advertised, so we simply need
> >>> to check if support is advertised to know that it is in fact enabled.=
)
> >>>
> >>> These days it is not uncommon for a system to have two (or more?)
> >>> different core implementations, like with "fast" cores and "efficient=
"
> >>> cores.
> >>>
> >>> [1] See the CONFIG_ARM64_HW_AFDBM bits in arch/arm64/mm/proc.S
> >>
> >> Thanks for your detailed explanation. When enabling HVO via the cmdlin=
e,
> >> can we simply prevent CPUs that do not support AF from coming online?
> >> Would implementing it this way be much simpler? In practice, developer=
s
> >> definitely know whether the current system is suitable for enabling HV=
O.
> >> If some CPUs do not support AF, they would just need to evaluate the
> >> trade-off between memory savings and having fewer online CPUs than exp=
ected.
> >>
> >> For scenarios where HVO is enabled via sysctl, we simply need to check
> >> if all CPUs support AF. If any do not, the system should return an err=
or.
> >>
> >> Then, we can proceed with the Pre-HVO.
> >
> > I don't think it makes sense to try to implement pre-HVO.
> >
> > We cannot do HVO if any boot CPUs do not support HW AF, as HW AF will
> > be required to free the HugeTLB pages later, which we should continue
> > to support. Pre-HVO (today anyway) happens before all boot CPUs are
> > onlined. IMO it is not okay to prevent boot CPUs from onlining.
>
> When the boot CPU starts, it first checks if the hardware (the current
> boot CPU) supports AF (The selection of the Boot CPU is critical here
> If the user really wants to enable HVO). If AF is supported and HVO is
> enabled via cmdline, we perform a Pre-HVO. Subsequently, any CPUs that
> do not support AF will be prevented from coming online.

I understand. I don't think we should do this. I think it's much
better to always be able to start all boot CPUs[1] and simply rely on
"normal" HVO.

[1] Just to be clear on terminology, I'm using "boot CPUs" to refer to
all CPUs that are onlined at boot-time, not just to *the* boot CPU
that starts the kernel.

>
> If the boot CPU does not support AF, enabling HVO is not permitted=E2=80=
=94neither
> via cmdline nor sysctl. All CPUs are allowed to be online.
>
> Once the system has started, there is only one way to enable HVO, and
> that is through sysctl. 1) If the current system includes any CPUs that d=
o
> not support AF, enabling HVO is not permitted (unless the user chooses to
> take these CPUs that don't support AF offline). 2) If all online CPUs in =
the
> current system support AF, then HVO can be enabled. In this case, the
> system must also block any CPUs that do not support AF from coming online
> in the future.

An approach similar to this is implemented in this series: if there
are (or were) any HVOed folios, onlining a CPU without HW AF is not
allowed. If HW AF is not supported by any onlined CPU, HVO cannot
proceed (though it will appear to be enabled).

I probably should have integrated
`arch_hugetlb_vmemmap_optimization_supported()` and a `hvo_status`
check into the sysctl handler for HVO. I'll do this if it is still
relevant in v2.

> Of course, if a user specifically wants those CPUs to be
> allowed to come online, they can choose to disable HVO first (At the same=
 time,
> this means that the HVO-optimized HugeTLB must be freed first as well).

I could make it so that, if there are no HVOed pages anymore, onlining
incompatible CPUs becomes permitted again. I don't really see the need
to do this.

> My proposal assumes that even though the system supports different types =
of
> CPUs, their support for AF (I suppose this is a very basic feature nowada=
ys)
> is generally the same. I believe that for servers (Only servers stand to
> benefit more from HVO), there shouldn't be a mix of those that support AF
> and those that don't. At the very least, such a situation would be extrem=
ely
> uncommon. I believe this may be acceptable. That said, if we go this rout=
e,
> is there a way to simplify the code implementation even further?. Of cour=
se,
> this is just my personal speculation. Please let me know if I've missed
> anything.

I agree that systems where HVO is relevant are very unlikely to have
mixed support for HW AF.

I don't think the approach you're suggesting in this email (as I've
understood it) simplifies this series.

I don't want to mess with the arm64 cpufeature bits more than I've
done here; preventing boot CPUs from onlining will certainly be more
work. :) And then your other suggestions seem to be quite similar to
what is already in these patches.

I am happy to get rid of the "disable HVO if it is unused and a CPU
without support is onlined" part though and replace it with something
similar (the simplification from the other thread[2]).

[2] https://lore.kernel.org/linux-mm/674EC6D6-B1F7-447D-B462-861ECA5A99B7@l=
inux.dev/

