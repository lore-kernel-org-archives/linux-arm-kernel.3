Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01C0CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTmG6wPP6fYkEoyy61gm5D9QOKDalR8QCsFErCfDfZc=; b=HUEb1D8015Rf7x24jhslY8+v8D
	OCSCfiBunPz1VfY+/VEv5FMs1DI4lOsuGO67qVfszA0XCvHAl/Lp0kvps9G9WqcD4ToO3Qr4gRj9c
	59eKL81rS7qlwALOPSMu8wDjne5q6ebYd/35JHwl1nxrie1pj/qRn03mgqKUR+Ba/Ia7W7RC7BbqK
	0P9O4t7iC+hbwL/1md0h43aJszAYasOe4EnXirsmXcTmiLnS4/4WQ2d8usd5txVVy50YyiPiWzuk2
	FloEDS0BVVf55GHDtRv0bAcd5w+ziWfcfUzSIjxmCq6BbODPfKPDXZKXxNxKYt/SRvcJVMEesLTDp
	de/XKvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsTC-00000006wdA-34Zl;
	Fri, 29 May 2026 08:21:30 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsTA-00000006wcl-2HSB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:21:29 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-516d78ba1adso7751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 01:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780042887; cv=none;
        d=google.com; s=arc-20240605;
        b=Rsn0gnmT09MAtcVVMJ/A/gKbpA/ef0Xs8F6yI4VcydsfKmX+2v6aKahWR9/tfYR9yI
         F2XnYIeW4GlBtWOqcQxytpUge2ASXS88kJgY3jKpHMKdQAgERUd2pLyQR5GlxJU4JDIV
         Wjg0Kzvpz3EG2BKwqYxuiMTJ0u9SE9+cf1/cmUdCDs18S+JHPjCKvorWwsOqyrBkeDDj
         ZMjE+j0B8g3f+5g5fMASknwery0kLdD/dV1JhvjXH+z5BEbxfxLXhVjzA7i33vuId40Q
         f1c0OyLk6gJQ1Rfzw4R6+pvbKmiU8ehEauIVsUccSgjgoD/8DoBwW+vSYMDLclcrYoq5
         4nQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RTmG6wPP6fYkEoyy61gm5D9QOKDalR8QCsFErCfDfZc=;
        fh=vxM8nvxyhktRovqGo1fDUoBJZCcm2TMKlo9oiq1jOi4=;
        b=gymNV77ZoLeDo/zfMdktgN2196ZgeNey6YiXTvQBOovGgbFPhy6W/o6R3+BTJB1Tkz
         abD9GkeIgSAtZoRZfD66D8kpGFHEs3xsKH4pSwbj1+r4tMPdNhfWvCn2Vf8+LjB85PNn
         sQ4A3lZSXn+UnRxwbqR3fAazBDz/8KP2ZErset+1N/5ePjaGtManpVKdihxEqfJQ2a0d
         qnHtNLt0LTGwPLGkMyzGASi5BYEfjCe6ON3uWhIgCVrMmJ81vD3RsfxW3tTEtqoBtPAq
         SN0nmpOdorOhMLLJUOw/g+Vztz6ylky58yO6vrq83u+S2+ASIFfjoBNTvw7M1P2lY8Zh
         hcmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780042887; x=1780647687; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RTmG6wPP6fYkEoyy61gm5D9QOKDalR8QCsFErCfDfZc=;
        b=WChu9Zo1XfIs1ak6vDBVEZ1Yx8xtFffqzmoDwgOgG6C0VbhBOeBcfJmRivU81xTffo
         gO50SZFe9ij06q/5F+HuOijS0jPaxxUA60ZdAzc94UxVghl13noD785BnLxIrlKKVlov
         hXg0Jy1+z7geOPskRxd3GKEgXW6dxhuoj4zKG5tc8NEaxrn+I8gTTBykpll43W3AzCaP
         kA/QwJ07Tu9hQiQ2/E3TBK4E70kGrG4k6tpKiWDQhi0skGQ/AcwuLZmzWUW2X4s/PYvH
         lnPpK3vsLDXtGzrK0v3wIJD3fyd2L9peU423vmq5Ct71zxb1rweaN7mbEfbLVubEA+aU
         E5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042887; x=1780647687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTmG6wPP6fYkEoyy61gm5D9QOKDalR8QCsFErCfDfZc=;
        b=Q+LEPZ815MZDY/rnS3SX6VjhQWe8oZeeYQCV1QEsJvrQCg+rKHTIFmE7lMU3qX1t2l
         4vue6M/MVESw0r7dTsSla0+ToWQ3rcBXmUIkvrrf5XXabY0b4evLmFjxAgeaa7TQ77eS
         lJwnXNKqOzHiKYDv9QNaT6KaJsHvogXJobAvrRF5uFRa75erHOUl3PxDGKy7Tv9osW2U
         GPUQClMZmpogV7uqg2m7fKyuhHyd/vxFdPPZuqPa9mf1tp+1lrU+i7XsFlPL6fDL8iZg
         rYTBKq7V3lXBIkDQfSEsMRH2SvBdS+LrPguOmToMRtx4OH4PP5sIZAxY5fwcu6Q7XKeX
         tZ2w==
X-Forwarded-Encrypted: i=1; AFNElJ/mEtNBcb3elUzm2DAcBa91KoSG8G30ihPtMWuIc9NUNBAg8Q6iZ0hBMZWXymeGjtpbgDaTtiVxie/iNKKA6AGF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3A0eyZvHQ32gLLr/5r4uE4J7/yLkWm7cGbXnusDqrjFq3Mgrq
	H2u0Ri+sK0Tex6RBVDkbwUdKi+6BKthcdiRccj3u6JZrX6ZPOLT/b05xUIDKDwDxJK65u+mDc4F
	We/YxXYfzHsj8DVpPUwyKuavCYO47qzzMUh1JvtA5
X-Gm-Gg: Acq92OHPRnxyCP4XwDlJN5iqM1OlizznCzSYb7UPmfY7k4lRSZOIo9+xDgt2QKObjuD
	LCibzqYGKNGWMSDbQUXc6jcLhaEE+CIViQvCgbl7wqTMC17w9QgWTgQlCTVd0g44v83a6PYqRPR
	gapZ5zSf2HP1ThGhn27/VUowNXOLo07Eh3+6dg4TD8nIh1kJTrzOznhOIz44tJkbFeJE7zuplWL
	xaLXlZ8eFBNBz2dQm2zeB1h0gsezxlNFHBelS6fV6T/8JxHvRuas5QecSc2meGfuZII+IVE9hbQ
	3U0hoV5JWdLy0Fk6dRM=
X-Received: by 2002:ac8:58d1:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-5172f749fe4mr4854041cf.1.1780042886761; Fri, 29 May 2026
 01:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260529074341.2271950-1-tabba@google.com> <ahlIJQU-1b0mayPP@google.com>
 <CA+EHjTxktk4-B6qcAOf4O26++M5s6CKkkP539s4dRBRWxZN83Q@mail.gmail.com> <86a4tivdh3.wl-maz@kernel.org>
In-Reply-To: <86a4tivdh3.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 29 May 2026 09:20:50 +0100
X-Gm-Features: AVHnY4LMBqEt41ppX0e4qdU_UDhI0C7nxs47IWnoXMk36_X18jqA-R0xuCxrKOQ
Message-ID: <CA+EHjTykVY6x+iFwSFH7MaK7rfV5CTSeFwx4cZatbB+Fuzu9Yg@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Fix host/hyp tracking on share/unshare
 hypercall failure
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_012128_591209_4A976C7A 
X-CRM114-Status: GOOD (  25.01  )
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

On Fri, 29 May 2026 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 29 May 2026 09:05:35 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > On Fri, 29 May 2026 at 09:02, Vincent Donnefort <vdonnefort@google.com> wrote:
> > >
> > > On Fri, May 29, 2026 at 08:43:39AM +0100, tabba@google.com wrote:
> > > > Hi folks,
> > > >
> > > > Yet another bug I found while testing Sashiko locally with fixes to
> > > > review-prompts.
> > > >
> > > > share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c
> > > > maintain a host-side RB-tree mirroring the set of pages shared with
> > > > EL2. Both invoke a hypercall that can fail (page-state mismatch,
> > > > EL2 refcount still held), but neither cleans up on failure:
> > > >
> > > > - share_pfn_hyp() inserts the tracking node before the hypercall
> > > >   and leaves it in the tree on failure, leaking the allocation and
> > > >   presenting a phantom share to a later unshare.
> > > >
> > > > - unshare_pfn_hyp() erases the tracking node before the hypercall;
> > > >   on failure the host loses its record while EL2 still owns the
> > > >   share, breaking later operations on the same pfn.
> > > >
> > > > Severity is low (no isolation impact) and the failure paths are rare
> > > > in practice, but the desync is real. Both patches are independent and
> > > > apply cleanly to current mainline. In other words, this can wait for
> > > > 7.2.
> > >
> > >
> > > I believe I fixed that here lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com but
> > > as Quentin pointed-out, there's absolutely no reason for the hypercall to fail.
> > > So I haven't sent a v2.
> >
> > At the very least we need to add a comment, otherwise, people like me
> > and LLMs like Sashiko would stumble upon it.
> >
> > That said, this fix adds no real overhead, makes the code clearer, and
> > guards us against a future where that call might fail.
> > Self-documenting in essense.
> >
> > WDYT?
>
> If a hypercall really cannot fail, why does it have a return value?

Good point. If we know it cannot fail, how about just `void`?

That said, Vincen't exact words are: `very much unlikely`, not the
same as cannot fail :)

https://lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com/

/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

