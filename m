Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB6BCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqAhzSB+vg9kKyzDEDNMhRArlwjWlt4Tgxtrau4bCQU=; b=Xb1SbhL9spBtvgpA2ZmrosBX4p
	wcSCjolJYMRRL+9sXWlGcxMtMcH3d76D0NEi5Pas3H9QOXZbQAjgVzwTiyohDywVcY+WyMiBErfsW
	HoDEeJ7BgaNq5CpEbGOiHe4kyQp5OO2sRa2Z0+rLUVgWld3ipflWt6b8DE+Ny6WqFuC4XtzTVF4/X
	MY+HB8OUan9zE1GUFb5E8W6UhHGHq6QdEfmojuGRIyrSp7eCyjqJgtp3FWZYgMdzEIlg0+9JeuGy3
	KpjQq5tLxXY59H5h3pTmqaRjjXzIKZ+klBcgHdOdnlsOrchbIdYFKZ8IX1nSQwzEhCZ8yZLn27CuE
	lDk7PypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStPc-000000073HC-0amT;
	Fri, 29 May 2026 09:21:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStPZ-000000073GS-2NNZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:21:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4905e190c71so63233115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780046508; x=1780651308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqAhzSB+vg9kKyzDEDNMhRArlwjWlt4Tgxtrau4bCQU=;
        b=W2CCnbutRbNm8wlM8ib6SsrgFvWirgyRRkOr7XWRDZClgbwFAmwn4yUBBDdBuMYRqK
         E5UEuPG4+iEJ2QyQTpL01eN5T1HWxjUCDGqfDpeuYdkS/Fjx4zPFhGnvYupC+7TO/72c
         YU/uvGpPY6+Yhg4wxvDrmzEyLhQpGQpzXQ5w0ofibpbtL1YV2+Qc98+eVAq7pz9xa2jq
         5D7s+FwimFupO4XAnE9sHZdyzMKmNdoEvypOGidCL8hsV2soFYTyw3cr4s5rhuhMD0sV
         71BQqXTLiPWosqPq1NVGgB2pil/6U8PQMARavYw1G02cWkPPZcESP82O/+w87Ip/N60P
         crfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046508; x=1780651308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqAhzSB+vg9kKyzDEDNMhRArlwjWlt4Tgxtrau4bCQU=;
        b=aPE2mOe1U/C7uc927eQkdC5g5XfgnuiQ8e/UNi1mmGNUw5OFw0tP8/HOZXGeITA09g
         Ud6OZzVAacmJyOvutUKqsiK30qelBJtaKz6Iws3uDHj97LqVy6ivZfiIrLiufKWl037e
         DKU0uWfD9m+eehv5FqJS2gltAESPb+iVWUhDWOIlb9HmHYBG8kua9gy8A3I+yTM3Hr4I
         vqECtQpuZxUdlf+tNCH54C7tQDntUYxjJEqnEpvpJfRdp3FHvYroHa2CFr5Ib57jLBg3
         coEDDwROXKdLpnpBDT8iY4BBv9Ghh2poZd2r7mhmoglH5Q2kpHFH2/Nobx/c4okpdKaf
         cMvw==
X-Forwarded-Encrypted: i=1; AFNElJ/J0uidHjQ0tIzgyKlf/BoZc96SJwUvwaWcYlsvHUWzUXEQZf0A0qDGv1/own1FXW8dSVMfOQargTvxjpof3Ymz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1EebuFYKT3BqQYMbg2z5utDlp4HNdrK062iHeLO5L8zFDAAwM
	7WNOb8aImTlYW8R+4iBjlO3lmv9Y8cSZjXCF6gdCq3QSWR33ytF28cLHUUIMnOif5w==
X-Gm-Gg: Acq92OFTbVoaIeuPS5KtHmGKKlFm9ctCyMtMIQE3+uRiqb4noI9hyiomltrtItwwLDf
	dgpziFfIvTyNcn2oLkQGAgLEFg0uXqPDOnckKPPWaxje/TztXXU0Ae4dY46DDDg659ytbtcdTtq
	IM6YTREprQiXDBCznzc4H8jkFcEHCOvsXICpxaHbS16zshurfchZMELN2UdK+exa6++aVRePhmw
	lyPNktP7ZvoadfihkAdEpps18I/dswFHRDoYnQSbw8LZZWM5s32oUCr5ffwF1i9Jgghw0jQVHa4
	zpg+FIEynyRtNtWqOsnBGJT2mvEr95KFnjUeSXGo47HcC07AzCWSRotTACU+A+uge+i8tZcslJ1
	jINAiQPd7vlhQVOUJJMHV5b3iTWevpo2S2xynRhqZMn+9bvfAs5iT+l+Kapvdd5bGUt3kKnHxiE
	UkBHtx1AfHSOI2p5tIYI4M3pIDJBmXqfzsN41TPBQYsW5KNJ/w8dYZYa5T7Vzb48fem8vDFT3JS
	zDhYQ==
X-Received: by 2002:a05:600c:8582:b0:48f:e230:72fc with SMTP id 5b1f17b1804b1-4909c0cbd2dmr25839285e9.33.1780046507168;
        Fri, 29 May 2026 02:21:47 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6f3612sm26265365e9.12.2026.05.29.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:21:46 -0700 (PDT)
Date: Fri, 29 May 2026 10:21:42 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: Fix host/hyp tracking on share/unshare
 hypercall failure
Message-ID: <ahlapmZj4wnce__B@google.com>
References: <20260529074341.2271950-1-tabba@google.com>
 <ahlIJQU-1b0mayPP@google.com>
 <CA+EHjTxktk4-B6qcAOf4O26++M5s6CKkkP539s4dRBRWxZN83Q@mail.gmail.com>
 <86a4tivdh3.wl-maz@kernel.org>
 <CA+EHjTykVY6x+iFwSFH7MaK7rfV5CTSeFwx4cZatbB+Fuzu9Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTykVY6x+iFwSFH7MaK7rfV5CTSeFwx4cZatbB+Fuzu9Yg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_022149_618263_298C56E4 
X-CRM114-Status: GOOD (  30.52  )
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

On Fri, May 29, 2026 at 09:20:50AM +0100, Fuad Tabba wrote:
> On Fri, 29 May 2026 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Fri, 29 May 2026 09:05:35 +0100,
> > Fuad Tabba <tabba@google.com> wrote:
> > >
> > > On Fri, 29 May 2026 at 09:02, Vincent Donnefort <vdonnefort@google.com> wrote:
> > > >
> > > > On Fri, May 29, 2026 at 08:43:39AM +0100, tabba@google.com wrote:
> > > > > Hi folks,
> > > > >
> > > > > Yet another bug I found while testing Sashiko locally with fixes to
> > > > > review-prompts.
> > > > >
> > > > > share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c
> > > > > maintain a host-side RB-tree mirroring the set of pages shared with
> > > > > EL2. Both invoke a hypercall that can fail (page-state mismatch,
> > > > > EL2 refcount still held), but neither cleans up on failure:
> > > > >
> > > > > - share_pfn_hyp() inserts the tracking node before the hypercall
> > > > >   and leaves it in the tree on failure, leaking the allocation and
> > > > >   presenting a phantom share to a later unshare.
> > > > >
> > > > > - unshare_pfn_hyp() erases the tracking node before the hypercall;
> > > > >   on failure the host loses its record while EL2 still owns the
> > > > >   share, breaking later operations on the same pfn.
> > > > >
> > > > > Severity is low (no isolation impact) and the failure paths are rare
> > > > > in practice, but the desync is real. Both patches are independent and
> > > > > apply cleanly to current mainline. In other words, this can wait for
> > > > > 7.2.
> > > >
> > > >
> > > > I believe I fixed that here lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com but
> > > > as Quentin pointed-out, there's absolutely no reason for the hypercall to fail.
> > > > So I haven't sent a v2.
> > >
> > > At the very least we need to add a comment, otherwise, people like me
> > > and LLMs like Sashiko would stumble upon it.
> > >
> > > That said, this fix adds no real overhead, makes the code clearer, and
> > > guards us against a future where that call might fail.
> > > Self-documenting in essense.
> > >
> > > WDYT?
> >
> > If a hypercall really cannot fail, why does it have a return value?
> 
> Good point. If we know it cannot fail, how about just `void`?
> 
> That said, Vincen't exact words are: `very much unlikely`, not the
> same as cannot fail :)
> 
> https://lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com/

The error would happen only if the host tries to share/unshare a page with the
wrong state. This would only happen in the case of a misbehaving host.

And Quentin's point was that this is anyway incomplete. To handle this error
properly, kvm_share_hyp/kvm_unshare_hyp would also need to rollback things...
The callers of the unshare should also leak the memory which couldn't be
unshared properly. This isn't the case now, (however we do WARN_ON).

> 
> /fuad
> 
> >
> >         M.
> >
> > --
> > Without deviation from the norm, progress is not possible.

