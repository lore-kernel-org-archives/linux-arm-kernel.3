Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B9BCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 19:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZWZuvgsWyt2x87h19X7B7J9Ed8aIg0FhoKfAr4PEqA=; b=z+edlfphKXC3+EzD9mVhDw89Vg
	INwrFvL02RicvM7Z8LO2cmsra9A5g77l1U1I5HCAr5DzNoyUbJrTKwmMH/F5KFrp3+IuSmC1kHUSW
	wiXyVkKinfDxkuTeDrAoXpvs189IpWlJLr+hYqxnRh8GZz2nZjBbib4xFE7HgMx/AW8PWHEDCAo+Z
	f9Xaaqsw7WnLRqoECK8zW2ZLT6lHcV+q4hwuPJT4xrsPAD3JFsIRlBftxFnmfPwISSAeB4qQlXPr8
	TjAK7qetzHZo5+6yfbb7QxiGeAXxA70WHcYLRBKdMAjDSHaODaXQH981Xy5fHsuExEGeYJww3IZhK
	0R7UTtUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Qf-000000077sw-2QOs;
	Wed, 30 Sep 2026 19:57:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0Qc-000000077s2-2nTX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 19:57:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2db33db4de9so4535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 12:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798241; x=1791403041; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JZWZuvgsWyt2x87h19X7B7J9Ed8aIg0FhoKfAr4PEqA=;
        b=C1wqubvVDfFI8PJenss4EseKm3ANktCNAkthEApUx4OBMNjPVnqKh9QGQwZB1NCHOl
         1/c4IOiR5mc1OBMwg1tFAWuzMvBn9BEoxcOjOt4+DRoQwxxbAUbaQ43oSwFtfRX9W8ue
         TYZn3RniSUTd9nGDKjqkgEzQyoniZ/YLFW9cWce1IrqxTszxUfHyfV7OxdyL4gsI/DSS
         /p+sPYSHHXYTBpxSxoxPCfp+mKdnjh2wUAQJezEDkll3Ic5awwBKu0G0UyVZnZX800Tm
         uwGckn+oidMjKz+50hY1s78BU1b61kcJ3DuZG8pe0fKogX1ZXcGieh9H9FfXmhCLmJkT
         /TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798241; x=1791403041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZWZuvgsWyt2x87h19X7B7J9Ed8aIg0FhoKfAr4PEqA=;
        b=l74h1oZY0o1UDaVtR1w6dTBdwzklfev3UakHvjAsbhR9BBeiheJ1FWG7YS6JpN+/I/
         Nu/vd23DKXE2PYt9ZFH4vpP81AIX9cNRFtEwvQZS/hJvgCosm4pgJsTl1j7iDOHspSlO
         fJCLUtCc5UpSIPL6PSIJCNdM7YVOQ8FfX5qOiwxJpj90Ww3BUzZhfKejkCtpAtcTY1RP
         ynq2ZaCLqtEORzDL1UiBjWJxjf2itIeGYILryLR/GC/wLN6EKQdLMtjnb3wjzHKpA3ln
         GQmxe5wzht/vlFapbfla+YAqCiGgu8lAcpfLNosi7YszvsxSkwOU3qO2IDcLa+MlNTC7
         fQ3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEDLnt7nVN5gOMiAoKOo2WPCN8uhjtDWXwEBLqNWMoFFP4wdKhGM4N5CwA8aJgq2PxDOimL0v5lwnqF0sSLxw3@lists.infradead.org
X-Gm-Message-State: AFq9FYJd/FMoY6+wa9glrc1DMHdPhKSbvhol1m6Q/IWgbHX/RTgOSeg/
	geP2SM+0Q1xFHzqM9KbFLap3Ria+hYpLmso6DnrTq2a1ldLTZ5RPtx6Pwdf+BxBwZA==
X-Gm-Gg: AYBFou1jE83Pkly1WEO2E9b9cd1afur93/+tMikck9OZ4vXc3FJOS74t0fcnjO8JL5d
	seWbqlT7I+Khfg3+rjLiFGVpLDgA5pymvJ83EdXDC5xk4Wdy3Z2fPiIEXb11+3e5jW98dRnnkT9
	MKNkzYwoQdsdC91aiwZYcHsBAlC0I7+V/Ivaqelma1Yd2FVr7HrAH27W5oa1IUZ+9SpHaPyMGmT
	xd26sPw2hzdf9ci505nGRcoIL9qmCWcGJ0EiNGb5MZPYiosOlaVDLOoUl4YeKwXbhh3TgPzQSvd
	ntrzlaNGE34g+kLZ2jMU4UXD0Rsivek9dMGXtoePIo8pcPiKBfJCPIYVUmBrfiCG0tVlTBGPJ4v
	pYZg048ElmTkGpEh9nma1aIeBC41wVHEas5qt08xxREjk1sOhtGPEvdBf8nSxGEmJ3NRLh5MopL
	hnI7dev1r5nVp0EVdilejmCObLYwLQyJNvPQgJwgSsp5RyuTgb73tLissc0vaybzIR+fHAm7hPr
	zInqBHwh+1RSZSTlRqkwuuexY4sZ4eenxxq
X-Received: by 2002:a17:902:c946:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2e3015b273amr1215915ad.2.1790798240054;
        Wed, 30 Sep 2026 12:57:20 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f475f4aasm742177a91.12.2026.09.30.12.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:57:19 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:57:12 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 12/16] iommu/tegra241-cmdqv: Add a helper to quiesce
 VCMDQs
Message-ID: <ar1pmNRMKDDJCIkz@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-13-praan@google.com>
 <ar1cxFvuzIc2dpmi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1cxFvuzIc2dpmi@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_125722_767565_0EFAC995 
X-CRM114-Status: GOOD (  22.29  )
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

On Wed, Sep 30, 2026 at 12:02:28PM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:45:06AM +0000, Pranjal Shrivastava wrote:
> > The tegra241-cmdqv driver supports vCMDQs which need to be quiesced using
> > the STOP_FLAG. The current driver implementation only uses VINTF0 for
> > vCMDQs owned by the kernel which need to be stopped. Add a helper that
> > sets the CMDQ_PROD_STOP_FLAG on these vCMDQs.
> > 
> > Consolidate this logic by renaming the implementation hook to
> > quiesce_and_drain_queues and ensuring that the tegra241-cmdqv driver
> > gates all active local virtual queues before starting the drain loop.
> > Additionally, clear the STOP_FLAG in tegra241_vcmdq_hw_init() as a part
> > of tegra241_cmdqv_hw_reset().
> 
> This whole suspend routine is missing the CMDQV flags.
> 
> vintf->enabled and vcmdq->enabled must be cleared when the system
> does suspend, via tegra241_vintf_hw_deinit(vintf0).
> 
> So, instead of quiesce_and_drain_queues, perhaps we need a suspend
> callback that:
>  - set stop flags to all lvcmdqs
>  - wait for all lvcmdqs being drained
>  - hw_deinit vintf0 and its lvcmdqs
> 

Interesting. I had thought about that but Ashish was able to test a
previous series (which def didn't de-init vintf0 & lvcmdqs in it) so I
dropped that thought..

Looking at it again though, leaving the enabled flags stale is actually
worse than I thought.. on resume, the CFGI_ALL / TLBI_*_ALL issued by
arm_smmu_device_reset() go through get_secondary_cmdq(), which still
sees vintf0 & its lvcmdqs as enabled and hands back an lvcmdq with the
STOP_FLAG still set.. so those invalidations get silently elided until
impl->device_reset re-inits vintf0 (after SMMUEN=1). Thanks for catching
this!

I'm planning to add an impl->suspend op now.. that will cover this, and
also the late breaking IRQ changes you're referring to in the other
thread. Roughly:
 - set STOP_FLAG on all lvcmdqs
 - wait for owners & drain all lvcmdqs
 - handle any pending CMDQV errors
 - tegra241_vintf_hw_deinit(vintf0)

I'll call it from arm_smmu_runtime_suspend() before gating the main
CMDQ, so the CMD_SYNC in tegra241_vcmdq_hw_flush_timeout() still goes
through and any late cmd simply falls back to smmu->cmdq.

(Will drop the extra line removal as well).

Thanks,
Praan

