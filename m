Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC7FD5B87D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 01:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNRSgDqjGCHm0cCbv9mH9lJK6eTAVlNyMNzHMF8cYvc=; b=wJUEI8cYvZSQSbnjgz2bSiDcnt
	VikeFbqje4HPikLUypjpRVpcc2PbUjzO0DhFkItTrF1vQs+L2wcc+GWT591/4Yk7c1YqHv8hUe4QL
	gNxL5TO6yZlNsAyMbCmnbGQaGa/SJozE8g7vtqCl0Z8UaZwFH7/JlqK8TWRP8JhvYHxNXfckhWnLN
	TFj/yl/m8iqn2uLlVy2EIpJlYso3sgswQuNPlExpXb62BTmbeCmsyOn+sGu8usVraYIuvrHbbeZbN
	PTxWZQEqg+vNGNUrE8D+cZQ1tqLC+P7MNlRKHxwbKSU8+ELVTbxpuPnO72MAnW1k4H2QCc4u5rjRb
	m58x5xUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJe1-00000004TrS-0qOw;
	Tue, 16 Dec 2025 01:14:29 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJdy-00000004Tqy-3SzA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 01:14:28 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4ed67a143c5so152381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 17:14:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765847663; cv=none;
        d=google.com; s=arc-20240605;
        b=LapFPAt8Yp3rd7FCsVvz8jieO8xEz4Feqqy4Cd1GnHGm5uMJZdT1vs5jXC980TDG98
         K0HnWvhohe++cO3wyhT8PYe/22C7mQnJA3I4DYS1Dn5ZsMOaYkScT7bshG9TpocWVh59
         VA2ft+CPXkgvcezIT4ii8f3MIQaQJau36IXMBr7pYH8SrLgOsry9kBpfbBijj83Wy/3m
         lk/02xzT74QOr4HDTECROBvvPBapN3Osm41X1oWM+CNdY5X1p0F1q4w5vNqnCQER/sNf
         v60RlxoHA7nDqYT/irLIbb6OVeyKH25kAZlChHJ1PskWlzaWG9hWkVJpLZKZLtgbIGJI
         NWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nNRSgDqjGCHm0cCbv9mH9lJK6eTAVlNyMNzHMF8cYvc=;
        fh=LyMXbjoWfHEur0u52u1bW/eKeWCxLKBfeS3UVy3iYVg=;
        b=Y3S4GhHq1XBE7c44MuY02X9q9CxXKmepwjeUyRNXiLeGIGM9+PaMl18nTw4VXvi+L2
         /m73t/P4QLW7Qs1WwERnhLCe8bt861cBL2TQg+PcLq07eAi8z3S9x393W4Gl1ix0qQ8i
         iuYTvf2KUgT8BCK7LQqAI+9TndUxkLYy8gnmhPAYuUOH5XIWQ78JkoaqgJZTVMVqs1h6
         EKPdZbqVEsltCzuBVfEj2TQJx4IDFKxTBrJEOZHHpuLA3MFQ1jjMOPCWCX/ChB+/gwEZ
         091QMCzeAZg0mJoON+U5yI8SK5nT8BrGw4m7jmVH2eaVqNdlnPPasJ65LugifENbQ8T6
         qt0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765847663; x=1766452463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNRSgDqjGCHm0cCbv9mH9lJK6eTAVlNyMNzHMF8cYvc=;
        b=LmW5It1hmytwIXjW0S191nfK2PTW4swJRyrm4ufQsY4AD42UauTQRapx5GQgiGXvpi
         lRUksCFI9oLhEcuE8sDGBnNabivKTnIKK3N+CVzhT3yZsQqGlQ1gsHKufDLjqaCRAusQ
         mSmtCc1nyAzT910wtqdXdh8IqXbzhj06rb/PfBv/PumKhLA4G7seL+vVWTSzXloIWCBQ
         SnnbQ8KUPsnnZEnc9lJP3vnh92BdAwpN9R4L1+JPGmgklaR6i3oykL9hBBQt+UWcZ9FX
         rWN7JAff/EsrCScAoYSJkmeNrbhkjg+braFjjLnhlf+A5CEBixeXvgQm9cZTRB1ay/UC
         bZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765847663; x=1766452463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nNRSgDqjGCHm0cCbv9mH9lJK6eTAVlNyMNzHMF8cYvc=;
        b=gDEZgYbl/hzuRd2b9aEqSedoXZRzQeqaolBVT1qUo4YdONYaCENX82MsSpnG1z96p8
         Ig7uUIUFwUvf386j2NIa5w+8tE1Q7apxbYF5HJKD57VMpb7UrRtzrk78TtXbwTJfaHCt
         liMDIgVTn7kEW9RWmVAvqoPhMrJGLeq+RyMIi1Zt9KT+CAmr0eGDIjkOc68eqsZxdoYI
         mtuO8+VLJmErY9DMKcQSGV5Q1YNPpQI1cDbadp0MkzWLEVyyifs9i1fyOltRu1NaEOT7
         DqP78vnIooP+o19CVMmzas+HvEkEly1PleU9XArUn/MYe1OkMIQL1uhPK0Cn9e3BnEJx
         o6dw==
X-Forwarded-Encrypted: i=1; AJvYcCVVIrMBdvDzVwY7mXZwaxMK4k+ctlCHHnwhvLm/5jlKV7dGuytupgrdsNluaept4O3pRSEwLXb7T6dokfez4sMn@lists.infradead.org
X-Gm-Message-State: AOJu0YxvyPCScvytw1XTXjJG6P2FVD2mAK1RjQmxBSVAhM6suQ+jPboC
	9QcfryoOotk+9R7bK1HiKtOqiZ/ueUszlfd+hdtfxbK2GRHCutWGIvvxV503cWfF0pURQqt5Vez
	9PVv470wVctN0MvMYpSYj58hr509hLjVmXY7xv9l9
X-Gm-Gg: AY/fxX4lrgfLwQ5FKnDX/0qVLdiG9iyo0e6Xk7V/0qto5LfmMhkipvNUqJgzIhWniL9
	rD6OvR2VyJ43diuigyO3JlgLJdBDX2RHGIOa2LpE4sGnZ+7ursgLa8df2zb8u+h4WfzWJuHxcpG
	C44XZik6HymWIx9+FgEUFUFTeqD2nowe+amfroTOVL+O0S0XkAZ+HNIdUE3DkQFSAWOwd6HFYks
	DtV1B/A6vH7Jil5zpb5p/SsI9P9moeyqllEXJphbVwWUQ3RFgd5vobmFLitUdPplAVX+XLG489o
	6tVpXyhDNu0FyWlbKGCxmI5smw==
X-Google-Smtp-Source: AGHT+IHDK9Nx0ZJG9GA2+hWOGyWZ73qxIXF4H8RaWSuD2ofLYKrM3Tu07Foy0ZrKHXYTXOo9Ba7m6bZ0z05T+81FVJI=
X-Received: by 2002:a05:622a:8a:b0:4f1:9c3f:2845 with SMTP id
 d75a77b69052e-4f347f93f08mr1579311cf.9.1765847662514; Mon, 15 Dec 2025
 17:14:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765834788.git.nicolinc@nvidia.com> <cb38f91526596f4efd0cd1cffa50b4c1b334f7a4.1765834788.git.nicolinc@nvidia.com>
In-Reply-To: <cb38f91526596f4efd0cd1cffa50b4c1b334f7a4.1765834788.git.nicolinc@nvidia.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Mon, 15 Dec 2025 17:14:10 -0800
X-Gm-Features: AQt7F2pGryc6oZ72KleXBeas9fEej802hxD59J2edZO4aLe2-OI0GRs2t7Q1jUY
Message-ID: <CAAywjhSzKM_bEm_VbPZFffY9sR3-p==gbVppSL+555D1kPg_3Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] iommu: Lock group->mutex in iommu_deferred_attach()
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, afael@kernel.org, 
	lenb@kernel.org, bhelgaas@google.com, alex@shazbot.org, jgg@nvidia.com, 
	kevin.tian@intel.com, baolu.lu@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, patches@lists.linux.dev, 
	pjaroszynski@nvidia.com, vsethi@nvidia.com, helgaas@kernel.org, 
	etzhao1900@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_171426_920603_57DD345A 
X-CRM114-Status: GOOD (  22.24  )
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

On Mon, Dec 15, 2025 at 1:42=E2=80=AFPM Nicolin Chen <nicolinc@nvidia.com> =
wrote:
>
> The iommu_deferred_attach() function invokes __iommu_attach_device(), but
> doesn't hold the group->mutex like other __iommu_attach_device() callers.
>
> Though there is no pratical bug being triggered so far, it would be bette=
r
> to apply the same locking to this __iommu_attach_device(), since the IOMM=
U
> drivers nowaday are more aware of the group->mutex -- some of them use th=
e
> iommu_group_mutex_assert() function that could be potentially in the path
> of an attach_dev callback function invoked by the __iommu_attach_device()=
.
>
> Worth mentioning that the iommu_deferred_attach() will soon need to check
> group->resetting_domain that must be locked also.
>
> Thus, grab the mutex to guard __iommu_attach_device() like other callers.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Tested-by: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 2ca990dfbb88..170e522b5bda 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2185,10 +2185,17 @@ EXPORT_SYMBOL_GPL(iommu_attach_device);
>
>  int iommu_deferred_attach(struct device *dev, struct iommu_domain *domai=
n)
>  {
> -       if (dev->iommu && dev->iommu->attach_deferred)
> -               return __iommu_attach_device(domain, dev, NULL);
> +       /*
> +        * This is called on the dma mapping fast path so avoid locking. =
This is
> +        * racy, but we have an expectation that the driver will setup it=
s DMAs
> +        * inside probe while being single threaded to avoid racing.
> +        */
> +       if (!dev->iommu || !dev->iommu->attach_deferred)
> +               return 0;
>
> -       return 0;
> +       guard(mutex)(&dev->iommu_group->mutex);
> +
> +       return __iommu_attach_device(domain, dev, NULL);
>  }
>
>  void iommu_detach_device(struct iommu_domain *domain, struct device *dev=
)
> --
> 2.43.0
>
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>

