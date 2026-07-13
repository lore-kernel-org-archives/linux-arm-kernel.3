Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C0AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 04:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tD+7MnOoTjJBs3fshzrrIZbo5/nTz8+RZZUhLw+smo=; b=YEku8piiT63MS0Tv55iDAQN3n4
	y1pXyAUcK8njWJuQ2SLoyT6kfxfhhCN9l1GIfEA2MkfHBuPZnubOyGtzZrcj9J2PGbNcNm48yN+xt
	ht8LclIKU/4vICE0iSe+W0knAoyan6FaEvJR4o7srXUjAeL9KPMhLceSte8YY0klXpb6sWJVgMxRI
	4BlMsG/wB5sKCYuJHDoNXf2Hm4h9JNhPbvBVy7z1VIuun1j42RYuO0ifLbyTv1jubLsPo8RXVtLuL
	GVN7EMn4i3YysAU9UjCJI7bMn1O6PYlCTZTzOuoELX4flYGXB0iKhzOWPZC8LgQ4hirezX3+5KsGe
	HKUtoAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7zn-000000084BS-2KpV;
	Mon, 13 Jul 2026 04:10:19 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj7zk-000000084Ak-2Ziq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 04:10:17 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c15ba5b151dso352465566b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 21:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783915815; cv=none;
        d=google.com; s=arc-20260327;
        b=NmRS0vTGYDZe1OoTpKJeuLCjaVeSeN4OEvpx5MWZAJboUuxt86aiE1juLm1GzSvS+y
         oczkj0tK366zlI14IZbtXaQEArtI8kDr4/pHA1V0isymEw/HZl+QebdKTJ4OYUZqzwGH
         T4xb4Uga+MBzmkBiTf0FU6rkM3UyVQG3qa3eTkbR9ehLPerpfWM5vfpv05irrMCk+7oj
         6UKo9xuWRjRaTIw0tWqD30ur4TzQC5ux8M3ylzxRlTVj2dfQoe80mWN8Rhve1qQAP0eg
         9ta8QJ7725OJnw7hwlYUXVD/WwDPOX4PEbvgv4blndGQ+W/Tz7LkPnCmzG7voQUePV+O
         Qwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3tD+7MnOoTjJBs3fshzrrIZbo5/nTz8+RZZUhLw+smo=;
        fh=sUxz51YGzw6gSxR/QadUwLcVuTPJOA3chun8ZeeXnCc=;
        b=dYXY3UvYAL2KhmFvP/zhyeudyEaitX9he6T+rugpuhrM/x5+yL/SObN8rarWV3idL2
         E4TrQl/dhHf6fC29ug7fDqt9Pf0pN+V77xpCbEpbPNpndvkNgVBKTo9/ZFGDUTOt41jX
         g5Cy//C9RJA9cNXi3nE4lL9nxzGT7Ed4ehFGS0ur5faKYVuwtU7zvioGAhgPEV3iuQ+K
         6jew/HHLmzkqxrZviUn8Mmi6yTVkEZjixE5qKEUIrVe6Ins4SUv+nKynSaK6cYceWleq
         v5dC8heNXDb3MPFhJb2A3zWdyMIaZzLBpMkoRnuM3GRAdXACJ9IxmRTToQBDKl0K1XrY
         EaVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783915815; x=1784520615; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3tD+7MnOoTjJBs3fshzrrIZbo5/nTz8+RZZUhLw+smo=;
        b=Bl6ydisZZpBm6AMue7w6kdV0co8Mq58N6BsYnezcG/bgyGSiyMip8uDuLEOmzd99vy
         TcA+nHszFwju8n7zQNJup489MBWxrWA3rnafi+WF6qkak2kxwVVO+lmXhnT5P6SttVWU
         8COS87em2USCsuRawTbJSxd47Hu6PbORjvpemMEFjZzR+cG80GprALKf1awLIMfr+Iq+
         POyUiRIyqkd8Jq0aV27SD0STcmfmUUsze1RSpVtegty8D1UmVUYeMuDUzPPPDEpmCSbE
         BPO6TPMhuq9jQpuc1s0cKTTTRhr5xTpPRPQ3TsBQavorXNpGZMpoERLXICSIFSVy2Eq/
         NBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783915815; x=1784520615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tD+7MnOoTjJBs3fshzrrIZbo5/nTz8+RZZUhLw+smo=;
        b=H5YFsX80GOoT+9igLRhKUqaq4EJUASYODuZO7aJkJDhr82M1TP33dS13wtH4LygPpu
         X7d2nqdyQRXQaCJVzVLPG8e3Yl5+lzCnqHXbXdYVAZMqlGvgYIE/2eAKEcTFZi/GQOpO
         qwiONNvv9NRIqPN2DJz8D+ADC/Mo0lyKpXTHEu1W8Iiy5c3O/uinqqku2pPHs8+E09BX
         1i8CqSZVbpaWFoh1ijrB5xwb5KS1cR9CBy8ziL0jyuVC4B4Br/NN+naMt9r90fiJQh4D
         Quyom59nfjqfj7Rg2sDiHK3/j/GJwWIIwnPUBnhxxwq5SqK4Zq6fVJRNiYBQlYk2uY5q
         sgWg==
X-Forwarded-Encrypted: i=1; AHgh+Rpb6DveUbii4GKqXa2GcHbWmmDEgfWgrYF2mg4nTXYrcKZ+u5LvCmjLs8HUg4HtN6mEhLtsc1zcE6ixOHiwhSKR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbw/EIonCmz1HZvNjYKPWhvpCqGY3x1gKSx/Q9MGstNxKrKCYO
	NOS4HqOpMZQi1fVI0E/r9yZV17OD3Hj2ik8y8kaGo+Rb4HShOuR48W0u9ETHopGN5QUwgcCtMEd
	q57W/lyTyg/L7ryNfYautQq5w++v1Ayhcv7BonWPo
X-Gm-Gg: AfdE7cm2ZaYzpS39MkT6ytDPBRu/iL4wZwwggGqd5jgTj3zOFmOaTCs55Lv9Nw0mSCy
	YoAF+w+LBXfMRtL0HCDYh40BCBuWSwZoSl+7JfMRkka+Qk3Kf6l7e/9HxM7VR3s7JCY11+6RgE5
	z0iQ+mCHaSpR/J7qClEKEdg0wpWZyAK52PegfMbHXctR6p1R0uIjbxy/6vMBC3a4P7FKPlZ+1PF
	1aRBS5SMow7Jc1aVOn7hU3Mr9IeR/ihCiS2SiiREj2UJqo/cgsadkHwgD63URPEYhsGtjKj/qnP
	hx4/C8xhjHEaxN1HvKhBIlhtlmg=
X-Received: by 2002:a17:907:a785:b0:bed:9a7:5ed1 with SMTP id
 a640c23a62f3a-c161e956b92mr277921966b.5.1783915814340; Sun, 12 Jul 2026
 21:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <FC9E78F0-8FF7-44AF-A848-8401B4702488@linux.dev> <CADrL8HVkrojXbBuEX-W=UHBmyyFzqxdGBvtAoPP53SyYa10uag@mail.gmail.com>
 <ABB70C2A-316E-4C19-A855-C9920BE105E1@linux.dev> <CADrL8HUCqrzOQGXRDwnitintQHjHCw10n8wo6gChQ2tWvC2JBQ@mail.gmail.com>
 <674EC6D6-B1F7-447D-B462-861ECA5A99B7@linux.dev>
In-Reply-To: <674EC6D6-B1F7-447D-B462-861ECA5A99B7@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Sun, 12 Jul 2026 21:09:36 -0700
X-Gm-Features: AVVi8CeIAdsZ8vBj0o0oFzX9SAZHhNmejnZxvQk9nHEtMZWM7457PWKYqV0QjhM
Message-ID: <CADrL8HXeKSt0fRrevT7cuVJGhmJ=7LCkMnBahf5YLR-_90WePA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260712_211016_689620_72D373C6 
X-CRM114-Status: GOOD (  41.40  )
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

On Fri, Jul 10, 2026 at 7:23=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
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
> >
> > Let's say for a moment that HVO cannot be toggled at run-time, then
> > the best we can do is:
> > - If a user does not specify hugetlb_free_vmemmap=3D1, we can always
> > allow onlining of late CPUs
> > - If a user specifies hugetlb_free_vmemmap=3D1 but not all boot CPUs
> > support HW AF, we can always allow onlining of late CPUs.
> > - If a user specifies hugetlb_free_vmemmap=3D1 and all boot CPUs suppor=
t
> > HW AF, we must not allow onlining incompatible late CPUs.
> >
> > HVO compatibility has to be modeled as an Arm system feature. To
> > support conditional onlining of late CPUs based on whether or not "HVO
> > is being used", we still need the extra cpufeature.c logic.
> >
> > So if HVO cannot be toggled at run-time, we can simplify the
> > definition of "is HVO being used?" (for the purposes of determining if
> > late CPUs can be onlined). We can simplify it from what it is now
> > ("are there any optimized pages?") to
> > "vmemmap_optimize_enabled=3D=3Dtrue?". That allows us to drop patch 15
>
> I believe this conversion logic is sound. If a user proactively enables
> HVO via the command line, it clearly indicates they intend to use it.
> Otherwise, there would be no reason for them to enable it and then leave
> it idle.
>
> > (which then needs a slight change to patch 17), but that's about it.
> > So this is a slight simplification, which is nice.
> >
> > If you (or the Arm folks) feel strongly, I'm happy to write this simpli=
fication.
>
> I really like the simplification here. To keep this series as simple as
> possible for the first step, we also could focus strictly on bringing HVO
> support to ARM64 by making it depend entirely on BBML2_NOABORT. This keep=
s
> the initial scope highly contained, which should make it much easier to r=
eview.

Okay I'll do this then. I'll probably still include the BBML2_NOABORT
patches anyway, as I don't have access to any systems that have both
HW AF and BBML2_NOABORT / BBML3 (even with the expanded list[1]). I'll
continue to structure it where the series can be partially applied and
still be useful; i.e., the patches to drop the BBML2_NOABORT
dependency can be ignored.

[1] https://lore.kernel.org/linux-arm-kernel/20260708144331.679816-4-linu.c=
herian@arm.com/

