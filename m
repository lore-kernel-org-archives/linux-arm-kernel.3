Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0ECFED9FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3njzSf0GHZnU+vfRoNiucsFc5a4L5o10JyQzwrcZWQ0=; b=LHy1s96HjBhPrHxW2vGrkFhVpC
	K9YeULxzZXZlaqIwMwawSzQzJQa24xWXEPU1ABDudSD/iHzb70EUXYDzz7OlOjEKdx3LMY/dZZSAU
	ocJkAeXWcP4JrEO3UvrfHgtaTS654iaHCQYJJD5uFxnv4BfVXQqNtdZwhb5DJkIBCtcUVQY8FeVbY
	gM6pwKK6zD4DXRHdLxJIrO5aO9DQakgsjH46j2CsMf5vC9vewenFqM2QtTFTVu3XMysNPJeKsJQEh
	VbW0aGYQjmBkapiYhAmHCG5ngPUMfAkTsXy25r2Ojo10G6pNdnsOTf/Uw8Fe9oUMmaTRhduypZcTa
	5XuTJ3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yju-00000006zeI-1zPb;
	Tue, 17 Mar 2026 18:01:58 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yjr-00000006zdw-3sJa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:01:57 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-5091ed02c54so72081cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773770514; cv=none;
        d=google.com; s=arc-20240605;
        b=gCYQA8IaWYcENDlKG+emxAsqM2WjsZKN8XwxSYNerkFpT3zGw+u6c93mhSZRW2Ah0G
         68pMbodi91Uh6C3TYSTbpdnuoUW2vJc9XGcY19mTF0V31gXb/YAluvYKLBNqh6v4MN0X
         8JkTRlSfKBmjVJzEVP69Zcvu0nLoxHPvPaa1OQnTdQzRThU3mwFCdEk3SbJQD0NZlOdR
         frQyVtzy6t3qy/xGfWc/V+UK0GToNrIr+GmNFapa7Z+DoF7Dk06rEB2Yw9NkgnUoZBWO
         d983xYSya6+yAvl4kn3cZgMc5WknzqEoq7J7y0rxzGdQI/74eKFoYrNOLdGo6iLj7eCi
         5uVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3njzSf0GHZnU+vfRoNiucsFc5a4L5o10JyQzwrcZWQ0=;
        fh=1/Ex5uX6JTdUs6T8BrRxfBSmC/M/u4G4RUrb7h2czmQ=;
        b=KtZkrKpTZozOajGDdCco64KV+2rWyPNJo3d09iuzzqrEMkWAPAdPhk1g7s8H0BJncR
         M1JiAicTtlieU8gknhEObFr+kHtYAHZnyI6TiV7Ai8sD/GLX9T2HYJBRoC1fwBQdT0sz
         t4ZExddSvAe8HB+rGudSHEWWwckmr7yZV6hSdjYEekKEDEkDUaqCw0itkKoifDHNMNrK
         K1tmiNlaY9NCs7vIq96aNrmeThJw+8pRp75gXmlLIL9nidxYwc957iv9cL45sNan6I+n
         +VzYmDu0f+SBFbtjzF0KzljSdQyygna/iH9Gi/bXiA3+xo8nPtnmUo829k8GEKfkKoby
         p6FA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773770514; x=1774375314; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3njzSf0GHZnU+vfRoNiucsFc5a4L5o10JyQzwrcZWQ0=;
        b=tsJz1DQePsGP1lAdVCxtAeryiz1toJigp8jJJeSkRFaqiylzbn0+667MupgsfXJk9B
         wPtCM4R3yI75uQy1JQnvuo19uwjYI2gls5hseDVQt7+IyndVMfG/0MJcQOtBN0vp1RPI
         avNB6N4OBQEbcT6/H44AuHtCqJOjv//knNXo79JOLAf9dg63Aoz2f3A61Q1NH7UqOUwX
         xhfOeEwdz97n8FsYfmfEOq3LRN5DN97HadehwtBwJT9iLIK3k8p9D/Hw0h5O8IlnMFcn
         JIIcuAqXP0C6rS1PaabSliioLLSUvJ1gSTMsSXYGCdymv+SuRJwp2F0SqYNytw7b/tIy
         w6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770514; x=1774375314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3njzSf0GHZnU+vfRoNiucsFc5a4L5o10JyQzwrcZWQ0=;
        b=PefgExbASqoi1OPX8LpFga4QNqn3UDZGb5UqW1Tv+WtL0MNRPrQMD/7TgJOrzLh0J7
         RapORiLZSztE2S/ALQzcoA173kA4GE3t3F4jnJmtNzTfwR38VebjAYTzqqZSSeHORy06
         iUoiCPVrgLJ+MKqj3JKVoluhj9uONgfgCHZiBWyZB672hjEvbk/f4hJ7blgi2cqr2ga8
         SWc4+SSz5AoUYE6KxIDVH2EzzrKyAghp9pdFJB0Oh/AE3G2WJojSCt/dgAwlwRKX85Ms
         6i+T3TXqvuG7S+q/ScKHcgB5e6jJsI2HY18mxffPnTrEzPGprHDZzxaEHuQ0Aj5Pfj6o
         5gmg==
X-Forwarded-Encrypted: i=1; AJvYcCWjGm7vRYdCsfprquXDi0XhUA0pDan2g+kuJFn2DguA+t94G6LBpxZYejXG/DAoiucY6ZWDRdL33dkLo0qA4PNJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx++ynkMN3B9x3k7SoxNjo0RRRNBOAtDhHMwCFHw6upfpGDmS0p
	N2Twu8QVjH51DMsud/JsZbNSV1tB0VVjcwrRCgnwe1yUDd7qfpvq/5qK3uYF5jRYLKTfbpv6ke5
	MWF9Q40RBH1ALDAJ96eGifr6x3ZagvVbhLPhTUoSo
X-Gm-Gg: ATEYQzzsbMEEfDgmQPgft889BdnA6Y3QJ5/3uBsmCdjegplK0YKiLLjUrNXfbQ5d8es
	TftvsUXJh4+7L4Wawqfd+Ke8T2BbQybMPARMw4heY7bPiHC6fR93ug5B+sc91UlGwGsQR1qXhg3
	P2N4nsFC8O5QxkC3jE8eZJEZg/7V6LXQ7FH+nwB9ZJdeQ2L8PpdDGlUvwWvVi2EV+OLxeuHwHRn
	3fYxc+YwjzNDYj5sBkdSfXDuzC9CcltP/VgjEEgkav8eDDF9wFBf7aL3BpvZr6rv8hn7cUPMWxZ
	egDJProS
X-Received: by 2002:ac8:5750:0:b0:509:21ff:cd49 with SMTP id
 d75a77b69052e-50b1470d02fmr1266501cf.4.1773770513528; Tue, 17 Mar 2026
 11:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
 <20260316-tabba-el2_guard-v1-3-456875a2c6db@google.com> <20260317174013.00007622@huawei.com>
In-Reply-To: <20260317174013.00007622@huawei.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 18:01:15 +0000
X-Gm-Features: AaiRm52Ar1iyiv4x-nvNKaVG0bbkheBEtDjmXY2f_mDcbzvUm2a4Jch_nfn93sc
Message-ID: <CA+EHjTwShV8cEtKdva5Ony0=oOhoaj6uQ3SP7tAia08P4pYkhA@mail.gmail.com>
Subject: Re: [PATCH 03/10] KVM: arm64: Use guard(hyp_spinlock) in ffa.c
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110155_979139_42D0853D 
X-CRM114-Status: GOOD (  29.22  )
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

Hi Jonathan,

On Tue, 17 Mar 2026 at 17:40, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 16 Mar 2026 17:35:24 +0000
> Fuad Tabba <tabba@google.com> wrote:
>
> > Migrate manual hyp_spin_lock() and hyp_spin_unlock() calls managing
> > host_buffers.lock and version_lock to use the guard(hyp_spinlock)
> > macro.
> >
> > This eliminates manual unlock calls on return paths and simplifies
> > error handling by replacing goto labels with direct returns.
> >
> > Change-Id: I52e31c0bed3d2772c800a535af8abdabd81a178b
> > Signed-off-by: Fuad Tabba <tabba@google.com>
>
> See below and read the cleanup.h guidance notes on usage at the top.
> Specifically:
>
>  * Lastly, given that the benefit of cleanup helpers is removal of
>  * "goto", and that the "goto" statement can jump between scopes, the
>  * expectation is that usage of "goto" and cleanup helpers is never
>  * mixed in the same function. I.e. for a given routine, convert all
>  * resources that need a "goto" cleanup to scope-based cleanup, or
>  * convert none of them.
>
> Doing otherwise might mean an encounter with a grumpy Linus :)

I should have read the cleanup.h guidance more closely, thanks for
pointing this out.

> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 86 +++++++++++++++++++------------------------
> >  1 file changed, 38 insertions(+), 48 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 94161ea1cd60..0c772501c3ba 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -239,6 +239,8 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
> >       int ret = 0;
> >       void *rx_virt, *tx_virt;
> >
> > +     guard(hyp_spinlock)(&host_buffers.lock);
> > +
> >       if (npages != (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
> >               ret = FFA_RET_INVALID_PARAMETERS;
> >               goto out;
> > @@ -249,10 +251,9 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
> >               goto out;
> >       }
> >
> > -     hyp_spin_lock(&host_buffers.lock);
> >       if (host_buffers.tx) {
> >               ret = FFA_RET_DENIED;
> > -             goto out_unlock;
> > +             goto out;
> Whilst it isn't a bug as such because you increased the scope to avoid it,
> there is some pretty strong guidance in cleanup.h about not using guard() or
> any of the other magic if a function that also contains gotos.  That came from
> some views Linus expressed pretty clearly about the dangers that brings (the
> problem is a goto that crosses a guard() being defined and the risk of
> refactors that happen to end up with that + general view that cleanup.h
> stuff is about removing gotos, so if you still have them, why bother!
>
> You can usually end up with the best of all worlds via some refactors
> to pull out helper functions, but that's a lot of churn.

If I respin this series (depending on whether the maintainers think
it's worth the hassle), I'll remove all changes that just add churn.

Thanks for having a look at this and the other ones.

Cheers,
/fuad


>
> Jonathan
>
>
> >       }
> >
> >       /*
> > @@ -261,7 +262,7 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
> >        */
> >       ret = ffa_map_hyp_buffers(npages);
> >       if (ret)
> > -             goto out_unlock;
> > +             goto out;
> >
> >       ret = __pkvm_host_share_hyp(hyp_phys_to_pfn(tx));
> >       if (ret) {
> > @@ -292,8 +293,6 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
> >       host_buffers.tx = tx_virt;
> >       host_buffers.rx = rx_virt;
> >
> > -out_unlock:
> > -     hyp_spin_unlock(&host_buffers.lock);
> >  out:
> >       ffa_to_smccc_res(res, ret);
> >       return;
> > @@ -306,7 +305,7 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
> >       __pkvm_host_unshare_hyp(hyp_phys_to_pfn(tx));
> >  err_unmap:
> >       ffa_unmap_hyp_buffers();
> > -     goto out_unlock;
> > +     goto out;
> >  }
> >
>

