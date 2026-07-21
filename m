Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BFDC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dng0D5LmCvrsd1dFzlRFdI/AiQQJYWNLnRmiefMWl50=; b=ArRYKi9hL4FllDIZw/bMCJranm
	lN5/Y0jSBLOVj8y+qzDwBqhYbrWaqHRCIT5Z4eiiWiz1idXrwV/we3r4ev0XnwE5EHqROJbREjeHf
	idKABifEJmb3c2ox3rNjbVUhzhusKw+bZ5QoyrXZMXA+if/fLcei3/AuL3pNaldPEW9qPTWgv0jO8
	HwfmBAXPq3sbG316ob0EH4Lzrb8WoK7UcDlf2p24lgMsrI/nkhu6yUDhZeLHP4ycKiIrhC+jq2KgZ
	at9e8iFG7wvC8em2VnyayQAOnKucfWnCNHPvI0jZLWSQNAQ4uJoF+at99ztLK/x258fPMZt9cxxDB
	eJrg5dLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Ot-00000008beA-0Rfm;
	Tue, 21 Jul 2026 06:56:23 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Oq-00000008bay-3DMe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:56:22 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rqx7ngveS0YiSwNLOJrke3p4lYu6BjwBLz/BOaR9GrzjxNtHh2lz777yP2SWViGv/fSjnNr/ZOwf9GtNfG1zozI@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784616977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dng0D5LmCvrsd1dFzlRFdI/AiQQJYWNLnRmiefMWl50=;
	b=MVAiEwmA33xjtUE2InNBTGZjqsHYnjpl/CCYBlPSHNEgzQnOGdiKepRw01jGi6K+7TAsX5
	/suvn8Cxb0cdhg+331cuAiE6PIkr5tthOIHnd1FAT5KmBszplCyCnG+9BxSo3bg3LxxywB
	SXD9EKEFJWcdwZIDr1hT6ko3RPVH7J4=
X-Gm-Message-State: AOJu0YxspLDjeA7tDcFAFencEFOAtyQA93hiZkk4OLbVObi8vSjxGLuk
	dTM/O9NKH+CMZNpPY7LJh0uA4u0RAVVLLrxIyKLLZcMDPAet5Z9ygAnaLVWE5m3j8zyTsvAY5Lu
	8Kl94mOT0o+hTeyT0dc7oWm3qP6zsf8TZM7vlVoBr
X-Received: by 2002:a05:622a:1aa5:b0:51c:7a8b:c3fe with SMTP id
 d75a77b69052e-526029b57ffmr9582531cf.23.1784616969557; Mon, 20 Jul 2026
 23:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260715105100.3178255-1-vdonnefort@google.com>
 <CA+EHjTyVRn8BR7bLBo5m_k9m1VNv95y4h+WTJvz86FTf+=XeFg@mail.gmail.com> <861pcwg7gz.wl-maz@kernel.org>
In-Reply-To: <861pcwg7gz.wl-maz@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 21 Jul 2026 07:55:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx37wqMhtxEfLA8THzzN12gdjXePghsp3np0cF=-yzOgA@mail.gmail.com>
X-Gm-Features: AUfX_my9yqYDGBjg5j0aB1I0HAfJDwnSN1DrdFI-vBsU6uoCyf_tm7w3OsT4aYA
Message-ID: <CA+EHjTx37wqMhtxEfLA8THzzN12gdjXePghsp3np0cF=-yzOgA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Fix hyp_trace clock disabling
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235621_099891_4E2FD693 
X-CRM114-Status: GOOD (  21.10  )
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

On Tue, 21 Jul 2026 at 07:52, 'Marc Zyngier' via kernel-team
<kernel-team@android.com> wrote:
>
> On Mon, 20 Jul 2026 20:45:00 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > Hi Vincent,
> >
> > On Wed, 15 Jul 2026 at 11:51, Vincent Donnefort <vdonnefort@google.com> wrote:
> > >
> > > Fix the disable path in hyp_trace_clock_enable(), which fell through to
> > > re-initialize and reschedule the clock after cancelling the work. Return
> > > early instead.
> > >
> > > While at it, cleanup hyp_trace_clock::lock which is unused and
> > > hyp_trace_clock::running which is redundant: the trace_remote framework
> > > already serializes calls to the callback enable_tracing.
> >
> > Although the cleanup and the fix are to the same commit, could this be
> > split into the fix and the lock/running cleanup as a separate patch?
> > Since b22888917fa41 is already in a released kernel, the fix will
> > likely go to stable, and it'd be nice to keep that backport to just
> > the behavioural change.
>
> Not sure I get what you mean here. From what I can see, this patch
> fully applies to b22888917fa41. Given that this is the third version
> for something that trivial (two from Vincent, one from you), can we
> please agree on *something* quickly?

No strong preference from my side. The fix and the cleanup are
correct, I just thought combining them in one commit might be less
than ideal. If that's not an issue:

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
>
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

