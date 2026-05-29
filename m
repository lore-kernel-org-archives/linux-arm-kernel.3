Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B0ECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=695o6Vsk+rg4TEq2m0E4aPhfvl/ze1rK746wt9maXiQ=; b=ZqXHBF7/aqJbpGRhqqYz/RDUnF
	ukdqikDIsRAQ1hVe8uyZgY1mZwVzUxdiyGn+CBWtvUXmm4P6JHJ+S6g0KC2GCnlc6I8B7EFfASSYO
	UdmO/L0dNmNw2SaQ1O+h1yVB2Y4YFapSjcrfJ5VQkr1VAMCMtqv19bk0HOSNa8BQgBEWnmfxBk8Ra
	sX1Rtxe30kse/ARtCorqrpCz7byVncsja3XlxmkC2n0RkQf0FNkWXdyZ5VM9IxfiPyJGc9TmtFgKU
	mDZK8NYuN755a/kjy0UeZwtaMuyPmX5ZkURA7ilxAxOpOOjkA0JVntI8b6VxEPYjKIGCA9ocEboA0
	yE5temBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu8R-000000078uG-0jeT;
	Fri, 29 May 2026 10:08:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu8O-000000078tp-1BnH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:08:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4905529b933so54000545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780049286; x=1780654086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=695o6Vsk+rg4TEq2m0E4aPhfvl/ze1rK746wt9maXiQ=;
        b=uwH2Yb3mxp7qXIbXQ1kI8dCfCQalgtx7tOLmRU63xh8e1b9NLOchUllYP8WgCFFCtd
         M9W/lfKydLjCTlUZRQGMJy4SNPWYQsggMpKYE4KiRY+StGWuHNKV9nH4C1kik6EUbWGV
         lKwcJZVdspEk3U0ull0abpuMFgC3Hoou8zJbJ42YWk3Qc0L6Dej79jXhDeqbMTcwBZr/
         ZqaZc17hp+uNGcpHQHktngQH8j/OgMUYz6cjz76H6slfYikDNu1yi5Sv2/QhM+q62bY3
         F3Dd8bVsDLqZbiOfuyZfqqHegpuvUqFnb6zf+MbpMONEKAMhCAwKfIXczfHZfl0qU+id
         wIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049286; x=1780654086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=695o6Vsk+rg4TEq2m0E4aPhfvl/ze1rK746wt9maXiQ=;
        b=ng+Fe/1ezSMbnMDULsv/tzj1rsIlwNg5q2g/2ksPhI6Bbu/t0+TsPVMYAXA7Ce3z9T
         CFFEOeX/i91AeVT4Bgrsk07+tgGqkxlVc7qQYd1LM8W/OiU1U7kDS8gYgHENU18OQYA5
         TIyCiNrLWLhB0YiLrZE61Mijg1PLIKgkAVsM7jp/C9OgsJ/R3drhxqKpny9EiexP/53k
         FA9tcIJVNcF/SxprHsm85XWRoOqSTCEav99lcRiuDX2aGc/xnmGzRT8I8KDNSbawc/kt
         0YSk+nx8banPq2qheR0XOU65+EjgtwgrLz0QMimEq14a0MzD7PWQnID7R12vebg8L48u
         aEeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BQIe19VqFQczVCSx6LYlnNq1BQG97BDLeyGfiy5N/KS5iZ+p0ZTsW7y3QcCYbqhB7JarIV6WyJ7MRNzFqTVje@lists.infradead.org
X-Gm-Message-State: AOJu0YwkpBRrVkq535q7R3QbuM9g/A1CJs1QPZiBgw/69xWb1UQY9ywN
	62sXzIbuO/anaslvQWrXTKagqwIfuJMcssfa+R9Dy+rXRG9nfpfhxQMMAiBqxnyedQ==
X-Gm-Gg: Acq92OH94tpxNzQ581F8PFAqLS9nVPIx0lsrlC4ibxkUXsSLjHzYdh4efiCOsZvq5XZ
	vR+OvIJFAKREJLiBeI1DTu/KRY2BE96cx9p3kXQ5R76klpJOU4XNgjF3iKzRHSZVP4lCHsYywc5
	M/LjEkSWAvg+1k5T5Q4fBdf7+iTYPDM1zaYm4fS6yKc1Ya8w4yz5Dj50m2qa/SV9Y6Icab+RFTG
	/sg+3JJgxtOd9glrzOyqd4Cwfg2W+0u9P7gYTJ+aVSg2QDiK+Rp2NLP4cJpBhPtQcbJJWxkWifL
	ZfTu07WDbrx9yUML8WP4Fc3n4OiKyTxanStLDwWkBTeWZ9hE6sSPU2+FEoWqiUVKM7IOTewxR+q
	Ac1LaOWioglekOHO4wOA5vyRQwYzDk2eEptXwjxH1JElZ+zyEqcjIez0F3xskza80ruKTwR5vFj
	F+xFc12fAhu8FH/qXMPGJcLuu/DLZPDaqZF4pvWZTZn8PuZuVbFNkvQhe3s7/V4PVEAvk0MnOpw
	y0B3A==
X-Received: by 2002:a05:600c:6287:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-4909c0bce7bmr41795985e9.25.1780049285690;
        Fri, 29 May 2026 03:08:05 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c12f4d0sm11602305e9.34.2026.05.29.03.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:08:04 -0700 (PDT)
Date: Fri, 29 May 2026 11:07:59 +0100
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
Message-ID: <ahllfyVfQw8G3tFX@google.com>
References: <20260529074341.2271950-1-tabba@google.com>
 <ahlIJQU-1b0mayPP@google.com>
 <CA+EHjTxktk4-B6qcAOf4O26++M5s6CKkkP539s4dRBRWxZN83Q@mail.gmail.com>
 <86a4tivdh3.wl-maz@kernel.org>
 <CA+EHjTykVY6x+iFwSFH7MaK7rfV5CTSeFwx4cZatbB+Fuzu9Yg@mail.gmail.com>
 <ahlapmZj4wnce__B@google.com>
 <CA+EHjTzpKjs-xFC=5cQ33Ly2O7qkNj=yJSzOSjx0SpyBjKFdbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzpKjs-xFC=5cQ33Ly2O7qkNj=yJSzOSjx0SpyBjKFdbQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_030808_371027_09DA32C8 
X-CRM114-Status: GOOD (  33.22  )
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

On Fri, May 29, 2026 at 10:23:22AM +0100, Fuad Tabba wrote:
> On Fri, 29 May 2026 at 10:21, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > On Fri, May 29, 2026 at 09:20:50AM +0100, Fuad Tabba wrote:
> > > On Fri, 29 May 2026 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On Fri, 29 May 2026 09:05:35 +0100,
> > > > Fuad Tabba <tabba@google.com> wrote:
> > > > >
> > > > > On Fri, 29 May 2026 at 09:02, Vincent Donnefort <vdonnefort@google.com> wrote:
> > > > > >
> > > > > > On Fri, May 29, 2026 at 08:43:39AM +0100, tabba@google.com wrote:
> > > > > > > Hi folks,
> > > > > > >
> > > > > > > Yet another bug I found while testing Sashiko locally with fixes to
> > > > > > > review-prompts.
> > > > > > >
> > > > > > > share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c
> > > > > > > maintain a host-side RB-tree mirroring the set of pages shared with
> > > > > > > EL2. Both invoke a hypercall that can fail (page-state mismatch,
> > > > > > > EL2 refcount still held), but neither cleans up on failure:
> > > > > > >
> > > > > > > - share_pfn_hyp() inserts the tracking node before the hypercall
> > > > > > >   and leaves it in the tree on failure, leaking the allocation and
> > > > > > >   presenting a phantom share to a later unshare.
> > > > > > >
> > > > > > > - unshare_pfn_hyp() erases the tracking node before the hypercall;
> > > > > > >   on failure the host loses its record while EL2 still owns the
> > > > > > >   share, breaking later operations on the same pfn.
> > > > > > >
> > > > > > > Severity is low (no isolation impact) and the failure paths are rare
> > > > > > > in practice, but the desync is real. Both patches are independent and
> > > > > > > apply cleanly to current mainline. In other words, this can wait for
> > > > > > > 7.2.
> > > > > >
> > > > > >
> > > > > > I believe I fixed that here lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com but
> > > > > > as Quentin pointed-out, there's absolutely no reason for the hypercall to fail.
> > > > > > So I haven't sent a v2.
> > > > >
> > > > > At the very least we need to add a comment, otherwise, people like me
> > > > > and LLMs like Sashiko would stumble upon it.
> > > > >
> > > > > That said, this fix adds no real overhead, makes the code clearer, and
> > > > > guards us against a future where that call might fail.
> > > > > Self-documenting in essense.
> > > > >
> > > > > WDYT?
> > > >
> > > > If a hypercall really cannot fail, why does it have a return value?
> > >
> > > Good point. If we know it cannot fail, how about just `void`?
> > >
> > > That said, Vincen't exact words are: `very much unlikely`, not the
> > > same as cannot fail :)
> > >
> > > https://lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com/
> >
> > The error would happen only if the host tries to share/unshare a page with the
> > wrong state. This would only happen in the case of a misbehaving host.
> >
> > And Quentin's point was that this is anyway incomplete. To handle this error
> > properly, kvm_share_hyp/kvm_unshare_hyp would also need to rollback things...
> > The callers of the unshare should also leak the memory which couldn't be
> > unshared properly. This isn't the case now, (however we do WARN_ON).
> 
> If we WARN_ON() in hyp, then I argue we shouldn't have a return value.

I meant the WARN_ON in the host's kvm_hyp_unshare()

> Or at least add a comment, BUG_ON() here. Think of the poor LLMs and
> the people who run them :)
> 
> /fuad
> 
> >
> > >
> > > /fuad
> > >
> > > >
> > > >         M.
> > > >
> > > > --
> > > > Without deviation from the norm, progress is not possible.

