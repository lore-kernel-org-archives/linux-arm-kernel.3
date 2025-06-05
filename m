Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FF0C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/AMED1uCKw6PLorZVcAc+las3T70VIL6/pCq2JraOc=; b=a5tclOSPfcHVmHdSnERlkDv7m3
	PCYUDw5vRizgnYGZ9s1GdQhQkET/xvuZntmi6+t+pKi7NVo3dsXvkz6Ymz+BGydtMDNVou0EGE13F
	bnprWlvfgx+b+ke3tXDomGRhaJ4PVpJHqbdPY+XTRjuQPKVCkb2VevJ0bHY7fj9PUT1/O6MxOgOWC
	WHEZOtapgqy/54pRZu69Uotdhx9hi90X/jw1coIqw65pG/6r01dWCLlo/Ytoj/P5+cSLHw8txufcg
	0P9t8jGDpAEwIROKfFQczlclDGkl3b4Xxmwsb8zx5kLxlXPLapqMzfWX0Y0EpSX6Lj6XJbYtlivJY
	d9b1C76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDcG-0000000G30m-2Sgv;
	Thu, 05 Jun 2025 16:38:56 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDa3-0000000G2g3-1cW4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 16:36:41 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso13656546d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1749141398; x=1749746198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/AMED1uCKw6PLorZVcAc+las3T70VIL6/pCq2JraOc=;
        b=GzG5hjBEUtk0f2MwXfodNC6R/WQlGYPwl/dBruj3MagZIrIsmTheErBbahFA97XNmQ
         7991IQjkkeJ4F/Zh4Nw7T9gsvmdTMsMht2YBEsITkfBRr/9IXI9aiicpi3RAmBxhO99k
         VgE//bJWlz8Sjl5nnkkuLTA2voW5ESPZoGNjm83y7OpnwNO7PSwAn5Z044E9TlRiGyAJ
         6cBUYO0gmmZSTxEtO/gPQhxBy5rL3dfHO3XleetzgurXzkH3Qe22CXCwI2h8gO83ssTi
         fnWxbq7Lj5yFcfHontFnCYlSw+ViK2cxBAt7ZEtZXza3W2IF3xpwpkaQ8qraWKjoOBjW
         dVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141398; x=1749746198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/AMED1uCKw6PLorZVcAc+las3T70VIL6/pCq2JraOc=;
        b=R//Lz5hs4cCK49WRGeS7JXkyhEY+73VMyatXkZo2u9fgL8H8ZjTXNjdeoY9Gefe83Z
         iMdstiJv0fdifnnVgnGWRL2TsoICYv6htQ4LVkaFuMn9fwuXMJ4fIElgog0aJWNA6bMp
         4iCWb+aWR4qMPRp1Zn2OsqOPomw367C7CjtJHJjLo4SMRA11RiG+/oqzYGVtNH04hD4J
         rh38QhSHYPwF+nlPMivFbe34KZnRZCwlAKr1JCHpVUVX6mCktzJRYzhnhHRdf23N6QAc
         mRFyEac9hJZsdEpsWP88diWHRV/qgXEI+7SQ/mu1EW132wAsKgWZCxu0l3V34qD4KoRR
         pHYw==
X-Forwarded-Encrypted: i=1; AJvYcCXBbfr3AOAclGEs2by+fOp52WGr+TRsCr5WJyre46T9XT3Ne6cG6nnXs7Gxnf1fcyHtq8OumEx2oFnM6tW+1SeU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfe/jbV1P3zyNV5oLTFOdE5l4Fl4UM1Wv1dMtaZGECwRh9cxB5
	EHLIVxzNyOkYP50KaWJUppH/pSrKLjQkbBPfxvzjwNIATTYgu4ncvzZMJL7xIFXqxsPOZLWXB6T
	wwbnZ3VxD22knsTDES7K5U5+XgcjbglaW/ZIc8+T05YiDcU/FxcQ2rd0=
X-Gm-Gg: ASbGnct9fa2fXElBI0lU/X/bOom+cw4UEF7UaqgEoAnxGdY/GywDrzecFv14XfsH7L9
	ocjN/KTnCWKW0yE2ELXuqaqOat1paGIy/2SpMPfeBaqzsMjQCzA+rYfk2PNZI+t0FF3KuXr/9qw
	fK89JN6gANwXYCTWvi6p7bWcGh8dDXMLo=
X-Google-Smtp-Source: AGHT+IH/vUqInLnUsBsqIxZVLljlV2JNq6TLN0zeIbDOndYPLtFZP9dtkbRS+wnOk9zZ8yyAo/Oy9zg7yUbo3S0v9LM=
X-Received: by 2002:ad4:5dc8:0:b0:6f8:8fdf:f460 with SMTP id
 6a1803df08f44-6fb08f4d0a5mr2148076d6.9.1749141397948; Thu, 05 Jun 2025
 09:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com> <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
 <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com> <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
In-Reply-To: <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Jun 2025 17:36:26 +0100
X-Gm-Features: AX0GCFsF7cxglaKZSX8Koz---6tL_CI5LfT0LL-n_NzmXSV0kUJg5xHMCVro-r4
Message-ID: <CAPj87rOggG6_wNHvv55onxcw00UxASUJYK2pmdkc+oUmYFyp2w@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_093639_568009_560C2D99 
X-CRM114-Status: GOOD (  19.17  )
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

On Thu, 5 Jun 2025 at 17:32, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> On Thu, Jun 5, 2025 at 3:37=E2=80=AFPM Robin Murphy <robin.murphy@arm.com=
> wrote:
> > It should only need a single IOMMU domain per DRM client, so no faffing
> > about replicating mappings. iommu_paging_domain_alloc() does need *an*
> > appropriate target device so it can identify the right IOMMU driver, bu=
t
> > that in itself doesn't preclude attaching other devices to the resultin=
g
> > domain as well as (or even instead of) the nominal one. In general, not
> > all IOMMU drivers support cross-instance attach so it may fail with
> > -EINVAL, and *that*'s when you might need to fall back to allocating
> > multiple per-instance domains - but as I say since this is a
> > Rockchip-specific driver where the IOMMU *is* intended to support this
> > already, you don't need to bother.
>
> Ok, I did just that and it's working great in my testing:
>
> I create a domain when the client opens the DRM connection and map all
> its BOs to it. Then when a job is about to start, I detach whatever
> domain was attached to the core's group and attach that client's
> domain.
>
> Will send a v7 with it in a couple of days.

Awesome, thanks so much for that Tomeu!

Cheers,
Daniel

