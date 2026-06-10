Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9C9CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3Dk4DGAHT5kVdHZq2KMBq8jvYUI1MA69Ze3j0Sxuwo=; b=fybC8ZCzk2Z3HV0EfY4XVk6+cS
	fb2WZ4MtB67HqO2VFPEi77BzTl/D5Q+xfZDCH6mcK/V1GR+26uJ+GPAyd7HSQzI3Hra2RB/rtW5Iw
	KDAE8iVfxzAvQBWZfJHF/36hHNplqxyr/pBzbdfEP7Uw0iSMKo5/Z3z1Of5Ym+0to7YxK6VDwOGim
	pdgMY45Dh3I/upbHoEWq13wRtlUhgCmx5ByR9T4JCZCXoRsoU8TuQE0iBbvP1htaAH32Ms3SYMHWR
	Tnu2wq/spDsgdXsCljYoLj+iLp1t0jC1XqPn7ZGZiFVcBfu1DzG2O2Pq3ETyvXAHSnFfjzyQB7HVR
	wvhcvD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMUn-00000008B8E-3xCD;
	Wed, 10 Jun 2026 17:13:41 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMUl-00000008B7k-1EuI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 17:13:40 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-51765331535so25041cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 10:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781111617; cv=none;
        d=google.com; s=arc-20240605;
        b=HFET1fX4PvY2HiI4Fnj4DKR/a/oatndRVqJ2bReRXssziV1xRy0B2VTSHM1GbMT1b1
         oVQRYY2E3g2ZM3OqVPS9IrjUGwX1w6qWOVpC0HTiptskdpPCOO2YHRipXf+0KWp6r2kQ
         HMMFlCCLnmkqzV0XrZh6fvr6vvevrNUaXPMzvkZWCYtln2iYw0AmzWfjJFd74sN2uVbj
         +ltPPRsN/VCh46kfYZFtanwtJC4/c5ifsyx6gkcyIeBnpUdiIdFV8/gZ+xropvK0ToGx
         ZJFwVvWerWkoN/G0Fx7+gcmosP6a3V7OxA4jClTuPjfodVdcwO63k2CWjy3Hj8hlHk02
         8FXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3Dk4DGAHT5kVdHZq2KMBq8jvYUI1MA69Ze3j0Sxuwo=;
        fh=ubdP3pYgusd+X5wCh3qmfZFlHLwWvCyyS3Do7qo1VBA=;
        b=lad9EggoD9Dnks8lldQZn+cs+oap92z2tbiMx6p1rRmiuRmNLlzFG4q6xouh0pYYNo
         Z13CmIEawlPJEwf1XfzlIHYK+TrcZX5WY39/f+/keDuuoLv1KOxZ716eEN7e4QJJY+z7
         J7cj5LyDy24KyObHXs7PJYkFcP+ErSokQQahLiJPCtkJSzJtVxIRtGuoQkz+3Cf1CAA7
         iUT4Srvpu4r2byZs91u+VqYK97ajDPQd6ppTOl8/j8AGHzEjHeJWWmdNoEKrnP4KUteR
         95j/ML8NHJ3ULYkFbfaYGl9A9YWaOZxw5SAkL/Hc+Cue8EGdh73uANnFDs7WqjHvjQDk
         LZ5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781111617; x=1781716417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3Dk4DGAHT5kVdHZq2KMBq8jvYUI1MA69Ze3j0Sxuwo=;
        b=Du4zRLAXPe9u88BgGktSTkvrMnbmsoVErpyxciyMG/AVyaMDusixbf/cfTmL+LPus5
         2h/C7KSrdcTpBOCxJIFHgE5/z4gyHDwqhG4HinVawQywxNr+7Tk7Z60paKiOuFw6bJFM
         R6FXUjbxGCGvtmQRx8+/12J9vyvY+oh6pKXrpaMgl7msD7oI/SCOt2pPHnQ5t1cw6AbO
         8fBjRKMHcn0otp47Xn8l/92y8HE7qyiyjoHB4xQHIZ0ovyi0t/s3foJ/OHwMQz60/wIV
         wZ5dkglkVSvWJdQHKHNIbkU/sh5ottMQLf8k7j/vrj61VKHjshzd4ZukT4yHA8YTFtg/
         lsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111617; x=1781716417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3Dk4DGAHT5kVdHZq2KMBq8jvYUI1MA69Ze3j0Sxuwo=;
        b=tDs+7lwUNjekD/9qzEthjW1dPbOZetvLdt8Rtfj+4xj6cd5WdXxaOALTJHc4Z6rdvZ
         GUWy4WvjAzXCNqMNLiHLFJHV4pXKiixDiVhM+dUge65TnXUL/16e6Obl7Fb5Jlgy6BV5
         2jGnLdFVwRVm6QXeNYZKBgsEx5MCzpTQYbhVP96ho5I+WXiBHjlQx6Cckqk4Mp0IhEzD
         Ajcu83lR/I1jIDOTLwnb/qogijyUe5T+VguyUAjNTL5XUbah7Wna7gWDvv4fD0+/qxhF
         xhQJPIXAoqba2T0//4fDwFlkoE4TvpOIXvUpaT9B2diebmmMpBmV71nv8Y6/BtkXDqLR
         PsFw==
X-Forwarded-Encrypted: i=1; AFNElJ92woU5yTjCw7wyLvMrHP8ibrYpcvkvWsLR7q75YPIZ2Fgae27aPr7uR2lp278SyCgrARQ+/OMvPJn8Eg3hpwj+@lists.infradead.org
X-Gm-Message-State: AOJu0YxYZ1B5xHMzdlc8s6ndJuakin8a5Hy5SH/CNGIIAaKsi6C/cmrU
	ulVE7fkQLoW8zm0WqqiRpihuR0E+Sr4LIpZNhWPENWP8r0NoiGxsOTcF0cv+BS3Qq+CR8GvXZ66
	O0vXn9RoBBcU97WYFGcKseFgFKQkeCjonizim33xk
X-Gm-Gg: Acq92OGRboLnENveBVuxgAfMgt9Ih9tOYzGw2Th7x6q0xg+ZHXgPjwBFacCeDafS19L
	s3flJMdop/ZkUfZl5vg6/viE52sZxls3nbMdSw6oWXpy/G4p6fBZvpZqaFC7ArODVdAwuXoRUdc
	nmeC6GmNc+tbIBYSMgcD8VyQAxX67E3m19iEKXgIELz8DFMNxVbWWTmPht+8u3IXQrm8CxB7JAg
	7CyGzYz2+QodAQjxASBeIzbHuCn+XlEz4dmKGvgj/kCDBNYHVbGqCOsEd3V0fDfil02+o/Nhvs2
	ZGSE3Q7vvWcAgis=
X-Received: by 2002:a05:622a:5089:b0:510:fa1:73c5 with SMTP id
 d75a77b69052e-517e9657a18mr1278231cf.16.1781111616126; Wed, 10 Jun 2026
 10:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-12-praan@google.com>
 <CAE2F3rCPgnFU=d5At1zrOLhsuVEbsweogOHGz9gDddRx73zRtw@mail.gmail.com>
 <aiEawEFsnG-LIahW@google.com> <CAE2F3rAWZ4Ac23D8eyAHfmaVVkHv8pz45+_dpMO1M4D7+RVCoA@mail.gmail.com>
 <aifsSxEXX64J1Etq@google.com> <CAE2F3rAGLH7si2S4aYhSUWyL-zZL7B_uo+WLE4zKY9SqKVi8zQ@mail.gmail.com>
 <aihzgtczL99fM-1c@google.com>
In-Reply-To: <aihzgtczL99fM-1c@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Wed, 10 Jun 2026 10:13:25 -0700
X-Gm-Features: AVVi8CewAZMr6roH_IQPlZnUww9uTnzxF93M2QjoTnsJlUETs84PkeRXRhhkFzU
Message-ID: <CAE2F3rC1PkiwgJB4M-9qpRx2Tpu9d_5YZ_De_=Sv-aby=X3RRA@mail.gmail.com>
Subject: Re: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_101339_372303_A1B046F2 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, Jun 9, 2026 at 1:11=E2=80=AFPM Pranjal Shrivastava <praan@google.co=
m> wrote:
>
> On Tue, Jun 09, 2026 at 11:34:42AM -0700, Daniel Mentz wrote:
> > On Tue, Jun 9, 2026 at 3:34=E2=80=AFAM Pranjal Shrivastava <praan@googl=
e.com> wrote:
> > > > I'm not sure if I have a good suggestion here. Have you considered =
the
> > > > following: Do not call arm_smmu_handle_gerror() from
> > > > arm_smmu_runtime_suspend(). Instead, call disable_irq() at the end =
of
> > > > the suspend handler (and enable_irq() at the beginning of the resum=
e
> > > > handler)?
> > >
> > > I thought about using disable_irq(), but I think doing it at the
> > > hardware level (IRQ_CTRL) is better.
> > >
> > > By disabling in IRQ_CTRL and keeping the manual arm_smmu_handle_gerro=
r()
> > > call at the end of suspend, we ensure that we don't lose any gerror i=
nfo
> > > We catch and handle any errors that occurred during the drain/quiesce
> > > phase right before the power-down.
> >
> > I think the beauty of disable_irq() is that it synchronizes any
> > potentially running hard IRQ handler, which helps avoid races.
>
> Alright, I guess we could:
>
> 1. SMMUEN=3D0
> 2. IRQ_CTRL.gerror=3D0

Should we call arm_smmu_disable_irqs() here?

> 3. disable_irq();
> 4. handle_gerror(); at the end of suspend

