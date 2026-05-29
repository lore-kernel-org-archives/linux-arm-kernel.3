Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AFECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oelkwUazDs17/My08335sXF6z7eRh/StRyvI1MNEA2I=; b=lh//pCdHc4xKNmeLRjzk0+4PRX
	xE12NWxNNeYaFtEm/6524bKZ1rzpoldYKDscgvEdJn/hNdlpQL+IiLpxOPrvkyfkhAVNueAS9ztec
	X2vGEGpXsEMVhXYt6ZEboXF/CWbkAslc4g0ie/D5PPsItyYYnINpaNJu8O2BjuvbjnmHfJPYZpFk4
	W9OIsEseszVPadqb2jT8mmcB5J6OZq7C28iSY9R/gYReE/Lq42MDzeNXUoh8HMgNLybIFpX9o5AZI
	RDe6CBzbU1EFugkjzKsadTG/mTnSF8OKJwobaWtBmgADWRdIb33Z5UEmpQ+Ij1Nwq0En/6R8B621l
	hew+95uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStRl-000000073gB-3LIA;
	Fri, 29 May 2026 09:24:05 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStRi-000000073fQ-2Duk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:24:03 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-516d78ba1adso3171cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 02:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780046641; cv=none;
        d=google.com; s=arc-20240605;
        b=YK7SHtmGeQM8bNDKzDc9YwvwRZR+0UCJnJsMXIWs43Tj2nLwPVaPx+rdYCG4w6GWik
         rZrATfMm6Y636KgBxaoUxU/J4mCQyoelv9de73TzJMwsvjry5QaelA1vqdbiM4vnyT+y
         zdq7qWU8GYvDSZJtbirArRnqw6s6x+LkO33hW0VaJIT3cRU3qUgqsqdctfyY0qnzFquI
         3uGgEPN0AhAfRYxXrVT9hbkhRTXRkkAV/0S7MPf0BtyPJgODky6uJHeHou9p5yaLUo5U
         4wmdXXlIZMt1FhdoZdFPhGJV1F6zUB4Iq/i84fHyjUMWo1jYKNEg0wd8VAnbi1tG14x3
         S8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oelkwUazDs17/My08335sXF6z7eRh/StRyvI1MNEA2I=;
        fh=j25Kh7HQqi6XPjJ6DQvK0RFd7o1Veg4udZaozHKBKVw=;
        b=KXPfDavrn5L0/9qcJzQrrSgjv9sdeoDJTJBu7s49s/EqtNy25esSGrhRQHab4LPppg
         mPLk6W/TvVQi0LH5oZ86+9MF7cIuwbRJfUBDnopi2Sgw+kCK1soqIqXsj6yCGlgODq9w
         cBy9snicJvaTY9XgFwuF5nVwnapLEto39iF8hJsf/tuRetVq6IbYnLe/fSEBL4/Rki0W
         QAXXJK/aHlxAApgQglY1Em6xBv+1+2LAr+rxwYq02iayB+LpyGTIXLid8Rg4MvbIt3b5
         rEeeaCqahO9Xs19hoObUr385O3JXKypiSSLJwiFSz1xfc7dQwoDvxxALdPIUjN9MwJw4
         vgRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780046641; x=1780651441; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oelkwUazDs17/My08335sXF6z7eRh/StRyvI1MNEA2I=;
        b=kVNy/UitZzByuHC9MVCC2bW21S7nTCVsT3mzLshbF8gy5YdH9294eSR/azYlpi+3dm
         aoFs6ZV9XLSzDS/J4lDGHl/f6ANi50FpjcUYa9BSZz2Jb0+q+hpMsje+OcALUj6g2xYE
         FPuRcMHx+qjRx0EuiyaLvs/mzXXrxk0LP+S2olLcHebjqQ4v0ZgJr8ntsCgTafH6JTO1
         HwSxYOlpIiybL0x9x8tiRUbH8FB6pOA/aGdj/OCX2U3SSXAgvtvl+lEOUi4+A/Rm+8pM
         5GkmvXYstMmOY3iePBO3hP/i5lx2rTgVTcdoHKRX0Ie4OodvK/qwUdNFBmkwdY6/i2fy
         VRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046641; x=1780651441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oelkwUazDs17/My08335sXF6z7eRh/StRyvI1MNEA2I=;
        b=PnWGbW5uQ0XHIC2JUHMNqF9h/MfyLHmDOd3/OGiFhzWX8zZoZKIE6Po4A49PppTNVH
         TASKQU9smT5IYQnE3/bcwL+s+lAIn4SlZvud696queKTsInOf7AsOi4JOvPYhHQA+Vtm
         XSW++CI/ExZW72reImst2cN20Brcb38vYpS/kpA9/DujtLxRe26f6SnfxQmlmr4PCqS/
         rXcwc40PLk8OdPqmnjDFoQL62L9cHhC7qIlF3xBwWcgr08xj4XZNO/P+vlp+s3f68lf9
         MXwKG4BrGdV+o4IpZqngTMtW7KHfa/5LvZqB8GGEgHCPmOKJ63yKUuQ4TJDYijD+4P3I
         WunA==
X-Forwarded-Encrypted: i=1; AFNElJ9YMXgC4LtQ+L6V9nfLMyP7irLuVsYvFNb/pMrYCylrhe/4aRqtngzktaBwoofAO6XWO+K8/pu8QokIo/OC+9R6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3i2vZVpaSw+YuP/BB3TrgHkhu0eOthz6DUpHnZfRb0LUMprpE
	0C/iuQxj4iybnKgFXdNgOw6l/tFIVN+o8BzXayDxhKDZEWeybdIe4E/sKnCbRqoraxfK2dt5laS
	8++tSxbQ24EhpymgD/IyODog7XmcIGsOT3YCQZMZs
X-Gm-Gg: Acq92OGUikdpiMBte21KvdVupznBwpkthzSwe6/eW9sz9JKahCDKbLur36Nw686Ygqo
	yFPhNn09IArvfQcR3YAgEEP7deT9BgL8BV+j/oGgzsc0DCsnIW/4b4zt6wDvENJeuuh5zCE3rND
	oDdjuq7wilwAqI8XRMAkbQeX3Zcum5CPCSqRbVr9p3R2ubDjsFW3geEMbRIWF8J/s0v9KAW1QT8
	3Js6oe8pi4ldmqXm2u7SSOcOZcNCbQH/Fc6T85wk5WB6Cj1lNo0/Q8RFHo2TrvuPinzyYmIcM/U
	UW2/ALJ3Oo1Ux3Iyf60=
X-Received: by 2002:ac8:47c8:0:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-5172dd7f3bfmr5599111cf.8.1780046640595; Fri, 29 May 2026
 02:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260529074341.2271950-1-tabba@google.com> <ahlIJQU-1b0mayPP@google.com>
 <CA+EHjTxktk4-B6qcAOf4O26++M5s6CKkkP539s4dRBRWxZN83Q@mail.gmail.com>
 <86a4tivdh3.wl-maz@kernel.org> <CA+EHjTykVY6x+iFwSFH7MaK7rfV5CTSeFwx4cZatbB+Fuzu9Yg@mail.gmail.com>
 <ahlapmZj4wnce__B@google.com>
In-Reply-To: <ahlapmZj4wnce__B@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 29 May 2026 10:23:22 +0100
X-Gm-Features: AVHnY4Ljy9YfNO1Ea65HIA3bCO_moV5wcD8HC-aYRWg1dGnOqE0KQObhytp6-f4
Message-ID: <CA+EHjTzpKjs-xFC=5cQ33Ly2O7qkNj=yJSzOSjx0SpyBjKFdbQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Fix host/hyp tracking on share/unshare
 hypercall failure
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_022402_590527_F6451E3F 
X-CRM114-Status: GOOD (  31.39  )
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

On Fri, 29 May 2026 at 10:21, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Fri, May 29, 2026 at 09:20:50AM +0100, Fuad Tabba wrote:
> > On Fri, 29 May 2026 at 09:15, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 29 May 2026 09:05:35 +0100,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > On Fri, 29 May 2026 at 09:02, Vincent Donnefort <vdonnefort@google.com> wrote:
> > > > >
> > > > > On Fri, May 29, 2026 at 08:43:39AM +0100, tabba@google.com wrote:
> > > > > > Hi folks,
> > > > > >
> > > > > > Yet another bug I found while testing Sashiko locally with fixes to
> > > > > > review-prompts.
> > > > > >
> > > > > > share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c
> > > > > > maintain a host-side RB-tree mirroring the set of pages shared with
> > > > > > EL2. Both invoke a hypercall that can fail (page-state mismatch,
> > > > > > EL2 refcount still held), but neither cleans up on failure:
> > > > > >
> > > > > > - share_pfn_hyp() inserts the tracking node before the hypercall
> > > > > >   and leaves it in the tree on failure, leaking the allocation and
> > > > > >   presenting a phantom share to a later unshare.
> > > > > >
> > > > > > - unshare_pfn_hyp() erases the tracking node before the hypercall;
> > > > > >   on failure the host loses its record while EL2 still owns the
> > > > > >   share, breaking later operations on the same pfn.
> > > > > >
> > > > > > Severity is low (no isolation impact) and the failure paths are rare
> > > > > > in practice, but the desync is real. Both patches are independent and
> > > > > > apply cleanly to current mainline. In other words, this can wait for
> > > > > > 7.2.
> > > > >
> > > > >
> > > > > I believe I fixed that here lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com but
> > > > > as Quentin pointed-out, there's absolutely no reason for the hypercall to fail.
> > > > > So I haven't sent a v2.
> > > >
> > > > At the very least we need to add a comment, otherwise, people like me
> > > > and LLMs like Sashiko would stumble upon it.
> > > >
> > > > That said, this fix adds no real overhead, makes the code clearer, and
> > > > guards us against a future where that call might fail.
> > > > Self-documenting in essense.
> > > >
> > > > WDYT?
> > >
> > > If a hypercall really cannot fail, why does it have a return value?
> >
> > Good point. If we know it cannot fail, how about just `void`?
> >
> > That said, Vincen't exact words are: `very much unlikely`, not the
> > same as cannot fail :)
> >
> > https://lore.kernel.org/all/acyKhZL2di_QQ9xm@google.com/
>
> The error would happen only if the host tries to share/unshare a page with the
> wrong state. This would only happen in the case of a misbehaving host.
>
> And Quentin's point was that this is anyway incomplete. To handle this error
> properly, kvm_share_hyp/kvm_unshare_hyp would also need to rollback things...
> The callers of the unshare should also leak the memory which couldn't be
> unshared properly. This isn't the case now, (however we do WARN_ON).

If we WARN_ON() in hyp, then I argue we shouldn't have a return value.
Or at least add a comment, BUG_ON() here. Think of the poor LLMs and
the people who run them :)

/fuad

>
> >
> > /fuad
> >
> > >
> > >         M.
> > >
> > > --
> > > Without deviation from the norm, progress is not possible.

