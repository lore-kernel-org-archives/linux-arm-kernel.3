Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEC5C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2bt3KrEqZ1UzyjV8hoPZ5E3RfVTbXnZPVm0wr6pv9s=; b=aa5Ce3sn1V5QZsnsZEXr0B5bH2
	v7SYRswIK4PRU7H354o50FKRovBoH2zeFukEsMOdkdg6ZBHq4Zpf4v4j4foGiPKWrbjrsp4/CVoXJ
	LxdkwGutHATvTbKpoj2iewud84pTM0quH3mCqeUs7R/rVl8H6u72Ez7CcTFjW8UiSDAotHH6zTSrf
	tJfrQuNV6hBiIXU6gsEZVotjTXMovcHdUrgZCXVQ3xabW0QESQR+8J8r0yjLTVgtdtxdrAZkQ+7rh
	FcuGHFWkVVOZXzRYOPQqZwLeJCeX1g5lSBp6gkEywrxYTRo/7KKrV9xAwUa9U0GN8M8v0XsIjeTXS
	45eWNybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rMC-00000008QrS-2qiu;
	Tue, 08 Sep 2026 08:39:08 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rMA-00000008Qqr-07DK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:39:07 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so73055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 01:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788856744; x=1789461544; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2bt3KrEqZ1UzyjV8hoPZ5E3RfVTbXnZPVm0wr6pv9s=;
        b=PpQDM1FcvYF5oTSJ1+qLfQHUJ8gXa6IxBJB46amOzOiXcZnOO4ffVEhc4Y21Ql2RQH
         4HEwI9zndI/Dth7XyFyjibNO0EoXuCOD5jw4YvKPaTdNcH0AFBSn5S1VrI8A7bTV3xuQ
         0v9DPSa2+Jp6qOEnrXXAk4ZPCSm1XFAykBlbk9QQuPHYjR4ij+ejqCHeeReVo8jLRZDO
         H/CBLEdiMVl25WE6tDK0dpjRmRpssW8JYlKLNShPIxVjVGBKAU3fNAY1cA4qjPAiDOvr
         5W17lYkL9nLkjb4wIkeEM7JQpfsiGGlKyYzAG7pY9rvgvQdS99fRvV0Di/DSaq3qsdA4
         9znQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856744; x=1789461544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X2bt3KrEqZ1UzyjV8hoPZ5E3RfVTbXnZPVm0wr6pv9s=;
        b=LwiYDonGgFZiv/xvAC9cWFJZOU8Uxko/BzDcOLfhUexLWNyncibcARQf2oUG14Sorr
         0oh/MsZnWYKtdZFCylvwYAW+tG8e5A2DCL2w2CZejPjOeNisnc/r7/koF6NM4UWJiEew
         Pj29oJMyJMY0fLx2RrfJWwN/7TuUjtlF0nMgG7S2hKWTo7YT7mXomd7KdgEfIPjKF1Ho
         cXqViD0NNG5FLq3MaIfqk3I0NqEK56+fPzH8ccVITnzHEmkix4cAFOeHHWqL40m4UMYO
         8EtpxO+AhqxF3VPouImsZkUxvTflBvob+RZ33lMI/nwHcUAJuO6irEgKd17osniKe4+n
         Bmkw==
X-Forwarded-Encrypted: i=1; AKwUvBx+vnTPUTHeZ9HHc4Zjm6O6AFcYgJF4clPZ8oR4gRUS4D/msUeC3g37J6iHKRkcsfbZaGmN+afHsXtkkZ4shoAw@lists.infradead.org
X-Gm-Message-State: AFuF++kN5vPnxmJlft2KJ6B810OfzN3VSR5+fyh/YEkGOgHh85u1SHsC
	J3vSx0gF0kZo5R2dys3Nm9MZhnyeL9cmhnuUA9b3t0XGdQ2G57iGzzkIIpRqArnk7w==
X-Gm-Gg: AYBFou1rAq6zyz4NODm8E7GYa6SE0ENrCHyPHvMfzsbKd81pkURykCcAMZz5bAIz2TE
	ziYwyieexNbM5hqHei76QVOFSMMYOq+y/ZACDXIpnzJ+syvn5vW6pQLPAPvD0l7sDDADlvYZkug
	37VZgbWvdWAlFHqBZYykxo8P8LfpGCAnrBlZ5vM9vqZb+C5b71G6CMjxVqV+zxhMDRHCDpVuzOd
	TtkGCPZVGs0Kf4UVCg865ucY8lk0v7e97TAjNleRenp6o7snsohpFCwb8gtvsZOIxCviPufL94n
	PrVwuzSu+DG5tuMXVna6kfzKLvmEbJSeOui/BlYL/B+i75QL2NzfaikWUIHnlFbFpKfZq0ZG1s+
	WLSrZkRkfA8SPgifeIOX7YvfF88+OLsJ+vczx+nsE/HQAdhKJaSmY+LRXa3+fzqbozYgVD197Ly
	KFfbAPrQ5UTq83CAbE7dCkSpVxywdJf3jHel9d+qejz6jEcTrIxXSWLApoTa5+AZYFytqfoCO2G
	UkofKsygVmBf+xS9XeoHQqo+S2AtA==
X-Received: by 2002:a7b:c054:0:b0:499:c46c:addc with SMTP id 5b1f17b1804b1-49d010d6113mr2292585e9.2.1788856743315;
        Tue, 08 Sep 2026 01:39:03 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm274178525e9.8.2026.09.08.01.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:39:02 -0700 (PDT)
Date: Tue, 8 Sep 2026 08:38:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jpb@kernel.org,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Relax ASID requirements
Message-ID: <ap_JokRTsUHtF4dN@google.com>
References: <20260907154928.4012151-1-smostafa@google.com>
 <20260907184513.GA2543240@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907184513.GA2543240@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_013906_716130_3E06AE83 
X-CRM114-Status: GOOD (  18.79  )
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

On Mon, Sep 07, 2026 at 03:45:13PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 07, 2026 at 03:49:28PM +0000, Mostafa Saleh wrote:
> > arm_smmu_sva_supported() have some residual checks for ASID from the
> > original commit d744f9e6c222 ("iommu/arm-smmu-v3: Check for SVA features")
> > 
> > As DVM was used for TLB invalidation and the ASID of the domain was shared
> > with the CPU process.
> > 
> > However, the commit
> > d38c28dbefee ("iommu/arm-smmu-v3: Put the SVA mmu notifier in the smmu_domain")
> > removed that support.
> > 
> > So matching the SMMU ASID space to the CPU is unnecessary and can be
> > relaxed.
> > 
> > Remove the CPU ASID related code, and update the print for the SMMUv3.
> 
> It is OK, but maybe this could also be but under an if
> ARM_SMMU_FEAT_BTM?  That is never enabled and is a placeholder to for
> eventual BTM support.

Yes, otherwise SMMUs with BTM would regress in the future.
But I’d assume non-BTM SMMUs will still be supported; falling back
to SW invalidation?

Thanks,
Mostafa

> 
> Once we get the last part of the invs code the BTM support can come
> back in.
> 
> Jasson

