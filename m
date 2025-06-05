Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9547DC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 16:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgJg7hlJSi5mVzXbPXgTglQhcjc9Je/fRCk+eeukVYc=; b=npxutXA6ZY5IhSQ4xtOIvo0DEx
	mdULjxMNQF9N6ThDh6EZgmID75RsAPGzI1tC0SNLuo0+S2LctYtUuXMdlyAOUnjXEzIUQprS+bRNq
	z7sAVX5h2nO8rSfL/GOMYRvjLVCl7LVB4LOwbi4vfAIC7SUG7OjlRP4aJjiqRN3fxDrBZt7/TMYqF
	RM70OPuDA8r17rYqCiBLHrVMPtWDIu8S9SAEx3Lv2uozAgB7GxkTgFRISGPAp7BnJZhfhiUeVU/8R
	MDZPDQTX9uHxYG4/Y17qSFefLa4kW8GEuX2r72ff84xaSqeiH/ENE8wjSft9+mZ8R3GyXGm9gLOmt
	w01UAr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDZY-0000000G2Ug-3cNy;
	Thu, 05 Jun 2025 16:36:08 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDVu-0000000G27z-2o2X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 16:32:24 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-70e6bddc30aso11221757b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749141141; x=1749745941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgJg7hlJSi5mVzXbPXgTglQhcjc9Je/fRCk+eeukVYc=;
        b=3QgaRmJrLiy0DZ7jwFxaX3Jn4azcUcxpTqpY8ZZSDR4GLLs3QeedI+B523iahRno6T
         RDZLGfTetQ9LFotGOBomQghZxwCpu/WRLE8Y2SqD8m5z3HnJGR186WHI5vFi6yJVQD4J
         +ct+pN+XKHZmRbR/coEYRpATC9UP1XmQANuZiOAN5eZmRR5WzvAuZPoDnRS3gsIRqGrB
         ge9xrlRxnI8uD0Uj/XER9uGFfhWPjS0rVNyv26wLyPQSaDd7+IjShJgLRcFwSv6stD8c
         5LCa/gLyUoUNS5iONWKHqlwduWABUxa86tT3SmR/MstAfNFH+OyJDjWdw5MfMGPw2sW1
         +Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141141; x=1749745941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgJg7hlJSi5mVzXbPXgTglQhcjc9Je/fRCk+eeukVYc=;
        b=tG+DlEBlyGa4y0tNhvQS6XtmCIzwGVE1CXKNUNUzaLHEPF3RuCVMoW/AtWhtalv63j
         IwH9KiGZSFDFab2wRB/qy4GJ9o6V7MZfJui7BwI7B0NY+XFq/EvKIoV+4MwsGVvmX92j
         zFyBFVW6jaCBdqo8RjsKSdPrxD1ytMwt1Un3R93GLBrIlMT7v1bzdIdEnMEnC1hVpS/x
         RLrIkpQcfgkRk1sSYFQrnoWbHkGwpyFn3qmGjRre7hMqFlVo9cnBCVxadNG9V4Ky3xTu
         7BQRfnAKaNBmDLlitVix8bvR2LWfFmTdJsAKjzOKGFlmRRx7G9DAkrnz+A98swDkFEdd
         hOGg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2i5wa6fU90aw60JSz63V5jxP16cxPvqJD21QVt8R2igTEWiXDWkRO71/yurHt7CNV3bwFFBlNz66KgqC8Ptf@lists.infradead.org
X-Gm-Message-State: AOJu0YwO45s9MhGwHXALDr3/+c+iBmY7pJrc5GPvXfodyKn09JTmRrA+
	BBY47kDe3As6ng/8w9tNHdJ6WL/uSU29IhFTp6lNgfooT6jzi8wnhIV5Xx5cQJPm6RPiFU0A0tz
	aqqOEX0UQLA==
X-Gm-Gg: ASbGncsqu7/haS5UhPfi50I/s1GbOk06nxuxN7RZk8QjLmcnCx/O9iltkIQCQp56FxF
	zY/bf5f8AYlqjcoK+T8PKT7yR/BPj1HJNiFTJog1A8RjonVKwjPs5f9nNmliLkGXkvyCcbFIE28
	HfF8IJ4tLLVnDaJNHQmFMkcUN9iegAaoF6yZ3UDRl2HcXDdmVDlsTfOLqM2kW4NJVJHJHr3B2uP
	t4Vyv4KJ8eHhSL0VJa7tUGv8fUK5F/c++xY/L7RWELvnFl6nDdCdQ6UgMEMBes8Qn3sWkv6ffHr
	7Ypo5DEf9xZDePkJIR1XaqlM/Fyk4eSZAs9YzK+Jy4WQsGqHalLQ/JURsikBVbtljDIGlRPh/OU
	QUvGGM3GIG7k6vEx+1YQ=
X-Google-Smtp-Source: AGHT+IFCBxaj6eV9Q5cy4YlqWQqkncYnSLypzgWsanZ7zq8xhPNzgVMdOOTenoJZH+ICxWW2L2ePiw==
X-Received: by 2002:a05:690c:ec9:b0:70c:965b:4700 with SMTP id 00721157ae682-710f774d03dmr223077b3.31.1749141140619;
        Thu, 05 Jun 2025 09:32:20 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8acd7f8csm35066057b3.89.2025.06.05.09.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:32:20 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e75668006b9so1251371276.3;
        Thu, 05 Jun 2025 09:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPtYvBMigLhKl0jav1cbc/pDonFKe2TFvWaitvENhlTZVAWCtvGAT4WxsUjbSEriRmRt7LsJyqHjAUZdK3uhk=@lists.infradead.org, AJvYcCVmo4L0IqGGqKNYL8WD6yk/eX4bqwjLwkxTUTsqT0PyBjKtQGx9yM6aCg29VHywTcPcH2lNTFv+IcHKcZu3I49d@lists.infradead.org
X-Received: by 2002:a05:6902:2d05:b0:e7d:a012:290a with SMTP id
 3f1490d57ef6-e81a21fbac2mr580525276.44.1749141137124; Thu, 05 Jun 2025
 09:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com> <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
 <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
In-Reply-To: <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Jun 2025 18:32:06 +0200
X-Gmail-Original-Message-ID: <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
X-Gm-Features: AX0GCFsWffXR5BsCRkmesm8xllL45jWGaGp3TKLEXqW1VbkssrelSRfCs4YLano
Message-ID: <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_093222_797861_9B360713 
X-CRM114-Status: GOOD (  25.11  )
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

On Thu, Jun 5, 2025 at 3:37=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 05/06/2025 8:41 am, Tomeu Vizoso wrote:
> [...]
> >> In fact this is precisely the usage model I would suggest for this sor=
t
> >> of thing, and IIRC I had a similar conversation with the Ethos driver
> >> folks a few years back. Running your own IOMMU domain is no biggie, se=
e
> >> several other DRM drivers (including rockchip). As long as you have a
> >> separate struct device per NPU core then indeed it should be perfectly
> >> straightforward to maintain distinct IOMMU domains per job, and
> >> attach/detach them as part of scheduling the jobs on and off the cores=
.
> >> Looks like rockchip-iommu supports cross-instance attach, so if
> >> necessary you should already be OK to have multiple cores working on t=
he
> >> same job at once, without needing extra work at the IOMMU end.
> >
> > Ok, so if I understood it correctly, the plan would be for each DRM
> > client to have one IOMMU domain per each core (each core has its own
> > IOMMU), and map all its buffers in all these domains.
> >
> > Then when a job is about to be scheduled on a given core, make sure
> > that the IOMMU for that core uses the domain for the client that
> > submitted the job.
> >
> > Did I get that right?
>
> It should only need a single IOMMU domain per DRM client, so no faffing
> about replicating mappings. iommu_paging_domain_alloc() does need *an*
> appropriate target device so it can identify the right IOMMU driver, but
> that in itself doesn't preclude attaching other devices to the resulting
> domain as well as (or even instead of) the nominal one. In general, not
> all IOMMU drivers support cross-instance attach so it may fail with
> -EINVAL, and *that*'s when you might need to fall back to allocating
> multiple per-instance domains - but as I say since this is a
> Rockchip-specific driver where the IOMMU *is* intended to support this
> already, you don't need to bother.

Ok, I did just that and it's working great in my testing:

I create a domain when the client opens the DRM connection and map all
its BOs to it. Then when a job is about to start, I detach whatever
domain was attached to the core's group and attach that client's
domain.

Will send a v7 with it in a couple of days.

Thanks!

Tomeu

