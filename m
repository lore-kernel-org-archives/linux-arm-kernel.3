Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA5CC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UcpEFBY6ddNvtG+RJyIJB7SfDGpOmaoMi5EF4Kq9Vk=; b=LeWVFsorQS5NuBueTbsSwJjMjb
	EpXIGLkxfKnmP0Yvve2SBm9Y2L2H+h/tzua0u7Ek0O+va/8elH4gxmNj//qnTvg/eyFRySGIBb9e4
	Tpmfy4xx/U2AClnrgIaC9Xn+QBZ1jVK1sRBMsKS65oK+IZvpkHLfEiB1q4A15JFWOol++Dj6/hKRw
	2U4kwANyOJCK7McFjFj4QPfDxjSpW/e9rrYDtV0SWUHXiXu1fMmyHo9zvcVy1ZdQLQ21+w3BqjCC2
	xZY/gw1ZYGCkOSj1G4xq5ou4fsmEwRHkppR06ZCnRK+fc7cAotKHiWPYrG/ozgt3HMCt7yaGz5asq
	WeKtoKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZzv-00000000xW9-1PFw;
	Thu, 15 May 2025 14:55:47 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZtE-00000000wAF-1aEx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:48:53 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3da74959554so2924545ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747320531; x=1747925331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UcpEFBY6ddNvtG+RJyIJB7SfDGpOmaoMi5EF4Kq9Vk=;
        b=BWUjNeTiI38sYsqcPj0K1EVZAgjuZfeka7UL5lMSK9ZsCeFpGqSQS3Bco/bFZa55iy
         RtGdoZ4EfgcNWE1L4k7830epZAFOI86UyFozEGf/N6E8Mlf6WXIX0AtLtZ7gcIjnUrVa
         YsxZXxiGIpscxmx0kvsWLXYVLNR+G9my4nx7LpubVDoUXbJEYaYjNga/jZtPelFzaFDf
         2A45u+eKLgzMdTq9BJQSn4+o0mxmd1+TUbUYhBJXQFEMihd5KDtuSj4eDsKNcuUvPWS0
         Dprms69YNxJZq4LrNwplYRksZ+vv4sUIqKs6sgZKVteifGl1NocLDHr8ef7LDMgKkyJu
         XWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320531; x=1747925331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UcpEFBY6ddNvtG+RJyIJB7SfDGpOmaoMi5EF4Kq9Vk=;
        b=Q6Rmy7zW7z+ee7jDKnlIjfjPB3RBaXtzIW5NObpAhizKXhzH2qRa2fAafCyc9N7sQ+
         A1G7MAO9GGtuxSGQkNSgvMb3300/A+1eOEgPQl4mTBwOoKXruu6zzVh/2jUMEH1Ckgil
         zaUpnhlUTNM33E2cLAC6nOdGIcJMaFKcdKjOuuyGIVPlWLQWZlViUsVdZ3De3I2Tb8+N
         dYXfH/tfNrvZwNRdBZnu0wRv6UQFAw32t1MZd+h1XjeK192UYDRJFij/1la9KZ5EWw3O
         aerqxUlLU0VmPFMr/119zKokIzvo7EIBKaDkeSyfMiDljGNaq8n28abbskCpW8EVAUOZ
         Rw/A==
X-Forwarded-Encrypted: i=1; AJvYcCWzP/boMOnNBLcsBS3/iF+mp+P9exa22rCHWgMxSldEMS4kPhCcXaN7DPkA7wh+FMdDR82BQFC2VTEiWaMzC/1Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yws5xWL2KyomC+x/uDK0QrTiZjsOhXueOp3hSub85pxWtBcPYzl
	kxuhfRxtCTULBWnQOem9d47QGIS2ztlERh03hVE20EVRWJI2IAcoPTLuDWeey/EKUX5BlJ120ir
	Wo7OPvblFk7iLkU1AIPLISvJRQkY=
X-Gm-Gg: ASbGnctLqdEbk5f6RresjplbPcB47GnnPAp8y50f8hYRrD7svvKZ8608NzA1Ml/Qp4F
	44t7FAj/cYSUzqHIMOblftryJY2eJZt3n3afXQVJCUMZEQ9Fb1BYhQFrUrXHO6c8PM2goyPV3qc
	N6K7XG0rcuj8wWcWtqAnmCSUv6hXAmu3STfHSZ4zDJrX37s4T/4tb0KZUY3p0aKg==
X-Google-Smtp-Source: AGHT+IFtWg4FcpaQcpwpTvAAxNygeksmyF1l4sqwxDFcYvvnKFT5/XBtYVHhM71RjDfHHRY+SZGmXPFPj2VfnOhCfgs=
X-Received: by 2002:a05:6e02:5e08:b0:3d8:2023:d048 with SMTP id
 e9e14a558f8ab-3db6f7fa0c1mr68163045ab.22.1747320531316; Thu, 15 May 2025
 07:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com> <20250514175527.42488-6-robdclark@gmail.com>
 <20250515143309.GA12165@willie-the-truck>
In-Reply-To: <20250515143309.GA12165@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 07:48:39 -0700
X-Gm-Features: AX0GCFtBF3BgAWnijILzbnLfQ8NIY_C-HxQIavKJnQ_xQacCvqpfSyafYx2RZYo
Message-ID: <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
Subject: Re: [PATCH v4 05/40] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
To: Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, 
	Kevin Tian <kevin.tian@intel.com>, Joao Martins <joao.m.martins@oracle.com>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_074852_419954_974358AF 
X-CRM114-Status: GOOD (  28.91  )
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

On Thu, May 15, 2025 at 7:33=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, May 14, 2025 at 10:53:19AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In situations where mapping/unmapping sequence can be controlled by
> > userspace, attempting to map over a region that has not yet been
> > unmapped is an error.  But not something that should spam dmesg.
> >
> > Now that there is a quirk, we can also drop the selftest_running
> > flag, and use the quirk instead for selftests.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Acked-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
> >  include/linux/io-pgtable.h     |  8 ++++++++
> >  2 files changed, 22 insertions(+), 13 deletions(-)
>
> [...]
>
> > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > index bba2a51c87d2..639b8f4fb87d 100644
> > --- a/include/linux/io-pgtable.h
> > +++ b/include/linux/io-pgtable.h
> > @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
> >        *
> >        * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pag=
etable.
> >        * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttr=
s bits
> > +      *
> > +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> > +      *      mappings, but silently return -EEXISTS.  Normally an atte=
mpt
> > +      *      to map over an existing mapping would indicate some sort =
of
> > +      *      kernel bug, which would justify the WARN_ON().  But for G=
PU
> > +      *      drivers, this could be under control of userspace.  Which
> > +      *      deserves an error return, but not to spam dmesg.
> >        */
> >       #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
> >       #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
> > @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
> >       #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
> >       #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
> >       #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
> > +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
>
> This feels a bit fragile to me:
>   * IOMMU-API users of io-pgtable shouldn't be passing this quirk
>     but might end up doing so to paper over driver bugs.
>
>   * Low-level users of io-pgtable who expose page-table operations to
>     userspace need to pass the quirk, but might well not bother because
>     well-behaved userspace doesn't trigger the warning.
>
> So overall, it's all a bit unsatisfactory. Is there a way we could have
> the warnings only when invoked via the IOMMU API?

iommu drivers _not_ setting this flag seems like a good way to achieve that=
 ;-)

The alternative is to move the warns to the iommu driver... but they
could just as easily remove the WARN_ON()s as they could set the
NO_WARN_ON quirk, so :shrug:?

BR,
-R

