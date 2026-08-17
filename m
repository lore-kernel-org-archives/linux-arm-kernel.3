Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5318CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=heyrqMT9bhKb2iYgMBqnNPSLDsSf0gtkf9pXDJmC29s=; b=BFmIH3SV2IhN+zfqPeJQjqhbKj
	w5/vOI7dHr1TdatvZDvo1MRp1M0gFucviIwRA+wFusHrcFLHPTqZ9Jhkf7GClfij0UqpBjtsqKzyx
	VAK63xlp+WcDRgkNrUHrH/x/i+i0NH0MsRsUQRg42J/a9BXmLcDxsrAlMR3wNfYfgl1fQORkKdPFo
	3Dn0STM5XfkIuXRatVygyyRqoeeLFRy6lM38bY+IlfkRRpMbFjY/hFDKHzuK9c+wsi/s/XqQweuIJ
	lGw3ARsNKlr7ghIvG1yObkkhqhwPFr1rCEgdcMVIxQkl0U69njcCI4LkHyoicHFI+qiP2wTmCWE9n
	rCquP7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwql-00000006A0l-3DF0;
	Mon, 17 Aug 2026 12:53:59 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwqk-00000006A00-0gdK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:53:59 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-45e2fd33133so1678852fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 05:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786971236; cv=none;
        d=google.com; s=arc-20260327;
        b=nnnQJXX6N5WBodV82OxD34pnFbB2FTQJTZ6FWWyGPCgNCW/lG3o+gLmGOa5vL5QGWm
         o56oclV7ezpJPF0G2YEG/yarUcIKEnc4YQZS0aZrDDCop9g3BFWI490auAa0H9Yss5iw
         VMIVD+K3nWmvfTMdK5cjCFN3V9z7xpCZTD6U+kGgEda+gIw+ZWBz8x/xlJqP9pzV9RBX
         XIyPeyqz/2TZq/vBPJNkFnF/gpnT9+XiQvKR8MGL3p0MhurRbi6hFebgLWjdeYG/Exrs
         1MM7rUdKoOA4ERIl25C0KEMFjIIuRgCQN8eh6TA5owd05KhWqLRDjc/YQK1BVWxOgJxC
         Ejlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=heyrqMT9bhKb2iYgMBqnNPSLDsSf0gtkf9pXDJmC29s=;
        fh=yBb7uVI3UKhRH2FAeWnIncih3yFvNcAYGTd8dT81E9A=;
        b=dWDvgE5tKcAiLd44aInZzwfmMduBAx9ZXvm1j8TYQcjWb1QoSZeyxQYVBjcuMIjWKP
         6PdCsP78EVd2vAZBLeQk9VkyrUHpfY6A2maUS6B3jLEnnTTm/kOKOn3dIlVWHF0yo/IQ
         jTPguzvc8B6zLeOCA88ppAuEf7obyyHI6KqW8cN7UtzAW/fASb8gANtoPvKj1UxCC9hg
         pLlcmkWQ78K4nKjKK32AD3IPaETJyvKQF78gmiddEzj800ahu26M6pcpIIX65DUqpcHH
         ojZQlJNQnj106+Ucq7Eyx3guHY9mYVZS7f03ayZvFaQ5sJDm/7REDrcHANIb3QKLNoqr
         9FCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786971236; x=1787576036; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heyrqMT9bhKb2iYgMBqnNPSLDsSf0gtkf9pXDJmC29s=;
        b=B2XyW9k1kqqnmp4bmydpD3xX6Zn4mjJTg45DEepyQdcKcKMK3el+nJ7ePYvOhca8l4
         QdT9GQ+6suBMtx8SLtJ8IrKLfITqh0PTHa6KML2uWGiF9uynbxwoUursM7fpPIw2fmmb
         8mSNPKp6uVfU7VMMISsabah2ZdJBHyLYcTooeSGpnFGNj7yu0soVovFuUrXb2SZJz3UH
         yiPHStZ56ClXqGHEvnrrBUJXbRCmkCnSsiMpwbXwjJBoNDENtbd790tsJl5VDyBSDerJ
         1qM3R4qHmmRnppC3QStZUIuDqMHI0vmZflZh2FlB4ylWoGdWzZ+QmYQGR6SgTrxgb84r
         zhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971236; x=1787576036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heyrqMT9bhKb2iYgMBqnNPSLDsSf0gtkf9pXDJmC29s=;
        b=PvCRzOp18jIi9wwOO/CVkSvnZSdbAd+pRsvQGMzqKow6fy5cOQW1V4fpvm/U8vjjZJ
         MWR1EeumnESe9juX4m5LRzMT/so149hZRZ91tLf1sWN5s0fG51EXGSCx4s+OMqZMKq6V
         jy2/19OWV92A9pbVCco4oEZqkqsm8i+ALA0UWxK5qxSAvK3vlIZ+2ZYPKWkPTyMEJFYd
         capthl5co529fPBn4t1yunj2h7QWCe5eWkLLWvN/isa/WgYfM92Vt+VvBfDUEmt1xmvg
         SrT2VvjdwWmzsBKYK7s0ieMeZhJOFQINUKsAo8CKO9UZmi/dePBdTzdAfbCAYh5WqbVV
         yzUA==
X-Forwarded-Encrypted: i=1; AHgh+RqLSXywogIFednAITKuLQcKd6zPhycGlrgsuM79vX/wG+RXHMMX413RUhiuXqjEfONV9fzaRT9Uzy0Guj/xwuTk@lists.infradead.org
X-Gm-Message-State: AOJu0YyoFD/Kx4aOlDfd7DRYoSE1zYfoD9eQKflys6hGqJ7kMoj/fFvD
	0O3jOw6gu7FaEvCgl3MYcJ0cM6PGwnaPP/iL5dDVEDX1iWuKQPotRS5PEQLtD7SOms2i3STMwWs
	1pPhy44OLuKS38nx9ka+phBK7GX4IKX4=
X-Gm-Gg: AR+sD1195Ib3PHjUQY9VKukpyTh7zAcqM0vsdY/1LY1m4ARh2sAgd3lVIyxJa75WtT/
	nMtkT2i1oBgr/kuwLGvM1+TOzb24AFBtNyMuRgplLDNt9bcCAwX3u76wvehp/OIoL80Zy5Lmuik
	8hLs0X+MIAGisSwSaQhPAlAv+EtY8g+s8ZsG3qon2DXOp0y/MUxF1CRILf0jM71by5AkH1jAc3G
	jgOPApikv2XAFIgluA+8hAFm7ZjsvRNpEwJUC0Prgnf8qPznto8wKjxjC7wnW7n2VIV1XEP3Uf8
	qKEvsPOWh6oS6ATt/KhYBnIbWOx+cHVJa3OL4acyd02GG5jX2p31dUrn/xoodmCkp/PhADt31/N
	L0o+qMx1d3AprT5f2vbSnyCfnUVdvb0c1aY7JLWYWhJM0nLJ2RJvTpfs=
X-Received: by 2002:a05:6870:1406:b0:45e:2d52:abfe with SMTP id
 586e51a60fabf-45f46d0bf86mr29099fac.21.1786971236153; Mon, 17 Aug 2026
 05:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260815152759.2046231-1-gpiccoli@igalia.com> <aoGIEEje1NIMTjyv@willie-the-truck>
 <aoLLf_iZq6DLNpLO@arm.com>
In-Reply-To: <aoLLf_iZq6DLNpLO@arm.com>
From: Ryan Houdek <sonicadvance1@gmail.com>
Date: Mon, 17 Aug 2026 05:53:44 -0700
X-Gm-Features: AcwNN1VwFBnUMMlGBz82LX73bNnE8excwOst3wTjz9OJH25CB-_0VAvGTPYuTWM
Message-ID: <CABnRqDfeiop1sG_Eir+yU2o90Q8-caDp-Lj6=aBFqYwiHAhQ-g@mail.gmail.com>
Subject: Re: [PATCH] arm64/kernel: Expose the running CPU of a native task in TPIDRRO_EL0
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	robin.murphy@arm.com, gshan@redhat.com, kernel-dev@igalia.com, 
	kernel@gpiccoli.net, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_055358_214799_05B61037 
X-CRM114-Status: GOOD (  24.56  )
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

On Mon, Aug 17, 2026 at 1:51=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Sun, Aug 16, 2026 at 10:51:12AM +0100, Will Deacon wrote:
> > On Sat, Aug 15, 2026 at 12:19:32PM -0300, Guilherme G. Piccoli wrote:
> > > The register TPIDRRO_EL0 has 2 meanings / usages today, depending on
> > > the mode userspace is running:
> > >
> > > - For native/arm64 mode, this register is always 0 from the userspace
> > >   perspective. In the kernel, it is used during ventry (entry.S) as
> > >   a scratch register, related to KPTI (stashes x30 in fact).
> > >
> > > - For 32-bit compat tasks, this register holds the TLS userspace poin=
ter,
> > >   and is not used for KPTI or anything else in entry.S. This is ABI a=
nd
> > >   userspace can count on having a valid TLS pointer there.
> > >
> > > Happens that other operating systems follow a similar approach than 3=
2-bit
> > > compat mode, even for arm64: in both Windows[0] and MacOS (xnu/darwin=
)[1],
> > > this register is used to hold the running CPU of the current task, he=
nce
> > > offering a very fast / non-syscall way for a given task to figure its
> > > running CPU id.
> >
> > I don't think we should allocate TPIDRRO_EL0 for this as it precludes u=
s
> > using it for anything else in the future. If you want the current CPU,
> > then I think you're better off using either rseq (which I thought could
> > do this) or looking at reviving the vDSO work you mention (but that has
> > unresolved limitations iirc).
>
> Indeed. IIRC glibc already implements getcpu() using rseq.
>
> --
> Catalin

Reading through the full cover, they state clearly that rseq/vdso can't be =
used,
since it's ABI and the primary support candidate is Win32 ARM applications
under WINE on Linux. FEX just happens to get a benefit that it matches some
edge-case behaviour.

ARMv8 was introduced 15 years ago and there hasn't been a found use case
for this register yet. This sounds as good as any since it also matches ABI=
 for
compatibility sake. Worst case instead of checking for TIF_32BIT, add some
prctl flag check with the same cost, allowing another 15 years to find anot=
her
use for this register.

