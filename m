Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7FFCD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 20:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6uuxZIkXubi8+X9lswk1jK4SbY7z0xRZU9Q0sQS/WE=; b=HcG8EHw2liUsALbWYhsI/gNXFK
	j2Z/V9dKgcqyAWvEx4SO0Fe8GdBqeW5Jw1ZL/m37YyiLr1yPV7y4+gUOa1FNstm0gd9zTduaJvbFe
	UoYgaWzM1N47cQgOiUgme2neFw33MKOnSAvv22UhujpZrpIzaHM2Iuf4nnLaQl0amu9omA6paLI3p
	xPf0F/i5jJ/jkMQYfnmBUCPF8rSGktTiRXNU90m+3e0WXF49H/ZK0lfWgVxrL/DiqmZVpR/6k+pay
	ZQabc5TWT66anp91jjNGuN4GtFu6BvtBWDpJuyVh5faCvG4AfA/is5HwCHr/bTyk0obfrLhyXPkUO
	XJpyQx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWJwS-00000002TE7-0Fhl;
	Sun, 07 Jun 2026 20:17:56 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWJwP-00000002TDa-1Lzy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 20:17:54 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5175d339e8bso1455451cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 13:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780863471; cv=none;
        d=google.com; s=arc-20240605;
        b=Wdn9EFHMsH6qUqFxJQiJaXH2ov/liWw8KOdIY0gswvvge+vGjDq1qZTVyJQo4Wxh4k
         GvGLhffM8ulZnuzprD23rHxm9X8qgwpPyBjM0YlwN+lxTKbEZrGe6J/D6ZZbS/98/CXa
         Esn75pxUpor1tZriZwt1MpL9fMACdqYXWaiYBwQ8lk6EEsB0o1br12ey+WuvGrkGHRZd
         ueqqaaXmdKxIX5vjebHoD6Bir1ainK3N3wBItwhxLFKh/hEhUecg+ifkCedYjI+4FmdT
         QeMRW3NoB9eRUC9vs/+ocetddwmbICraIwhQ+9nro+ck/nS323yEYmtDFGMhwd83cal6
         HZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g6uuxZIkXubi8+X9lswk1jK4SbY7z0xRZU9Q0sQS/WE=;
        fh=rxWbcDwff4DA1+Q6MGbsGsyzj4xe6AsgScHXwk3+U3w=;
        b=izcJ7mdV8/4bQxdaAKEnTZw/sGzEYyYKU3wT+5aJVhy12NzW87SS9SRUapltb/SLKX
         uVG0UCrjmPmkgKN2j5vEOQlc3qtAbHWBZMoKSKkl1uk2KaekbOMpFidYSyGbFMs2gQYy
         eQ3R2yk+tnMWEAbfJwxJC84Qxj1VBwf0CuuwRQhLGBdUMop8zSz6LZ5TpDHf6AvSk8bA
         gnOMnyC/6Gl3XjLhwBSgJqMibjPMzitxKosd8flRiPFehbxjPvX2TDcblcX0R5WLvqnV
         paFkMKXh/y+bxBt7BSJsc80Qx9/O5WPGfy57aduQrTxx5hDLIeueuoRB9ESAazQ1Yx+s
         Nvbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780863471; x=1781468271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6uuxZIkXubi8+X9lswk1jK4SbY7z0xRZU9Q0sQS/WE=;
        b=hGpE8KlRfjBGMMYQ/7ZcEcv+KzAMKj0oTvrfap3/KRZScjmyLCgub2ykrVy0x/x/0w
         zToBnD5ndw7whxXieZiIFtLB0XCuAD2vn1F0ZvOUgctuJZyQHkoRv7UFwuuCe3JuFBQk
         QmhX83CNLPtrnW0Py7SnMLmBwgi/fX2LtU6A2/LEVMfA8OsV384WmoUtWVnbCnqRk4dO
         AK8FAkQrOZw/vW4iGH0TLsKn2aeaBYCOa/bEJme+s/2sKX9jwHhuXiYEEcN+IS3CuDSD
         ndkFcDub1RGUgBA9hYyJK8yLXwV6Co6aFyhDix8swoA/Ep6/z1zxujH06LezYCmyIqvr
         lOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780863471; x=1781468271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6uuxZIkXubi8+X9lswk1jK4SbY7z0xRZU9Q0sQS/WE=;
        b=fb572muhZVf3R6qzHX4wKfpSsyeZWrEMG+GOBKzZN33gONAW00jYAN3A+VtUI1sjnj
         ICasNdgXZ/kGry4JWTclsTQxkASpmdAFlV/isxWKpR9NM03mcE6hCdMZa/SFBS5JSRwh
         4PIFtcTfQgw+vpo7hSDkIL8MfP7IxpGBljtbHH3gdh7o311TtVSw5OvFg6wOiPxCI4Bt
         z7h00MM9L4PFCfMR4gSEtXrOEJU6Mz85xgm6tXvlBocT8y7Qy0SDXEZPJ5mI32RUbHFa
         eJ3TIwP0wAK6HzwFZ0ylObZFm0n0APhmlgVppLNkEkYxmfQePq12wR/tFwz1/tjeW2Ie
         XcSw==
X-Forwarded-Encrypted: i=1; AFNElJ/ue9GvIhwygYpvS+xIdvzxawgpTrJXYxyfzukpd9sFreR0hB45GMHrYb54pNXCm0wmSn6nIjtlleois5w9k2ZL@lists.infradead.org
X-Gm-Message-State: AOJu0YzVf2s+2W4TedrQx/RoOEVWl/9S5dpOUGFmwLTP+GkxzZK/3zmy
	GnXnnyez4FzdrB0JtaTbSkcQ/1NMJ36lbZSaZbzmeEtSvcukpYWpKUHisY04EnYVx/MEFRx2rhA
	giUa3L2f//6prTCNUqNZUrxvv3iMx0lRPXsk74FsK
X-Gm-Gg: Acq92OHlIGwmwiwStUb3DNKMx3VqDP9ItOG9CooJBKTApqWFI2evjjgzwt/+ut/EDmF
	J2bMA4CKDWiasA2ScSulGHUudDW45ubYmqykSQfCnAg7PMWzKVZA4duf0CDq1p4zVxXJhOeVbzY
	M9EvWo4hdrsBm8WZVASXT2ualh1JdppR8xIdBaejZdr8ej19BfnsukemRyZT5aisOpA/EgNFcW7
	+DmpDtc51f5LxQzYVz/0M6maZGgsmcjHropM2H1G9GurWeVde8OxyGXPQXETTuSBW8yImm0gjMH
	LnN86c5ZYc5yB+s=
X-Received: by 2002:a05:622a:2307:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-517982b5301mr23485141cf.22.1780863470425; Sun, 07 Jun 2026
 13:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260527221407.1756491-1-praan@google.com> <20260527221407.1756491-11-praan@google.com>
 <ahilX8Za1NRCH3ik@Asurada-Nvidia> <ahi3uY9YZZtR1Lq5@google.com>
 <CAE2F3rDeZe+w7-V6hyJtSOwCj619E5SNtjJjZ1-yu1sVdf=35A@mail.gmail.com> <aiEm0yuNtG3PGJ4D@google.com>
In-Reply-To: <aiEm0yuNtG3PGJ4D@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 7 Jun 2026 13:17:39 -0700
X-Gm-Features: AVVi8CeF-_WsFzniDWXOyB8GfBOgqVxzvT7rGKVs_9DlSPru2oeVHWYao6nDKEM
Message-ID: <CAE2F3rDwx9qX3O0GQOJ-CQ1dqREKNp3vf_PkWWP+xmyEHRuOnQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/11] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
To: Pranjal Shrivastava <praan@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_131753_402816_D9CF3A1D 
X-CRM114-Status: GOOD (  25.83  )
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

On Thu, Jun 4, 2026 at 12:18=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Jun 03, 2026 at 03:18:32PM -0700, Daniel Mentz wrote:
> > On Thu, May 28, 2026 at 2:46=E2=80=AFPM Pranjal Shrivastava <praan@goog=
le.com> wrote:
> > >
> > > On Thu, May 28, 2026 at 01:28:15PM -0700, Nicolin Chen wrote:
> > > > On Wed, May 27, 2026 at 10:14:06PM +0000, Pranjal Shrivastava wrote=
:
> > > > > TLB and CFG invalidations are
> > > > > elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_F=
LAG via
> > > > > the arm_smmu_can_elide() helper.
> > > >
> > > > All the arm_smmu_can_elide() call sites here would eventually elide
> > > > the commands in arm_smmu_cmdq_issue_cmdlist() that is already gated
> > > > by CMDQ_PROD_STOP_FLAG? It doesn't seem necessary to gate again?
> > >
> > > While issue_cmdlist() would eventually elide these commands, the
> > > can_elide() check is necessary to return early during suspension.
> > >
> > > This avoids unnecessary stack allocation, cmd building, and spinlock
> > > contention on the cmdq->lock for threads that are anyway about to be
> > > elided.
> > >
> > > By dropping these requests immediately, we significantly reduce cache=
line
> > > bouncing and contention during unmap storms. Furthermore, the early c=
heck
> > > also allows us to specifically trigger the WARN_ON_ONCE() for broken
> > > devlinks.
> >
> > Hi Pranjal,
> >
> > Have you observed unmap storms in a real-world use case, or is this a
> > preemptive optimization? I would not expect a high rate of map/unmap
> > operations while the SMMU is suspended. If a client device calls
> > iommu_map/iommu_unmap (directly or indirectly), it suggests the client
> > device is RPM_ACTIVE, meaning the SMMU should be active as well.
> >
> > I am in favor of removing arm_smmu_can_elide().
>
> I saw some with DMA_FQ (fq_timer does batched async invalidations) but
> the early ellision doesn't really help with perf which I agreed to in my
> reply to Nicolin as well.
>
> The early checks were dropped in v8 (except for invs_array and for the
> WARN_ON in inv_master).

Hi Pranjal,

Please correct me if I'm wrong, but in v8, I can see a call to
arm_smmu_cmdq_can_elide() at the very beginning of
arm_smmu_domain_inv_range(). Isn't this the path every iommu_unmap
goes through?

