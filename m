Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFFBCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHcKhVSnEwqoc+1KLjRnxGF2Mva/GHzPrgk/jJQDp10=; b=JwHuq8PlggXtlgbymyM/ltOd09
	TAdmSZjtAmRDMINf28jD2JQNv1AMywaoTskYRoe7m9mr0G/BKMlqIhCV17qCiJ4fc8SLSH3DjfjpA
	RAyRNymgx7tJiYSQkGIGweCWsXSZclrYB65LkKffLfMTSrqYItXITgjbuDFdZuGWMEnuhwI4iW5Gi
	KsTJnU+xKDP28Vp2p3PkEs3sj82IOsDdabDi5hDyEgD7kW9xq8l0uX/yKZHY2vfsSHAFeoYJtjnvn
	bWv7paloEjBgeWNn58zGcc1k0uJ3fRQvu3aQ/jX1l4kesV+UUCIKxt9UgTBpLLyDGywKge/ikxrtG
	uO9/LmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0kb-000000079aE-362B;
	Wed, 30 Sep 2026 20:18:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC0kZ-000000079Zs-0xl8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:18:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so7755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790799478; x=1791404278; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PHcKhVSnEwqoc+1KLjRnxGF2Mva/GHzPrgk/jJQDp10=;
        b=GqLOEITfFHWRIvTfT2hPEd1CqBw6cyQkaKtfyJCDt11tF9aY4/Y+tu69jKjmu+HoLi
         TFfr7re5+NRBKr5sFbuFjAExCTkmP+fLRtlclpJHcuTKqv+klPhjX9oWdMnwQ5hyte4O
         JaKaYBoJpzBtZGU3m0qtNAZdaQrVa2knJxru7HtWRMFI/RhmmYUaDr04EPD7ogrYNIRi
         PjJ3lViJh/r20F32iuzu8Xgz+lMM4wwE29w3aht9xv2BmzKV0/dzzv4rtq+rBYcbOL/I
         gc+OJBztO2BtZIDwNbWlCpN13BUNyTuaRwCFhwpEPHD6NW52mX3ZUdexj9jT8XdJPB2Z
         1mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790799478; x=1791404278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHcKhVSnEwqoc+1KLjRnxGF2Mva/GHzPrgk/jJQDp10=;
        b=j+54CreVReHC1voNymhppKBAi+bpJ3OlKa5Jo/26oGitYnssT7R1192rD2Zc9A9ZgB
         Rl2O3RZ/7SqsiwSJNzn0ldrXZ9wjCCuEeV5dLOpVEJ079/ZghtiW7D2HxfmwHboVDYol
         j4I4hbDJmjN+4XxKLfijMtnKmIPYHK0vBMyLLZUbFwV1tbBeh2LQKaGOtAPZRQIBkmy8
         TnvVbEfKt0rA1mTs73+YFir/lljSUfvHQIQ5Rz34zT5/GTlBTFrENjPEBMig00+ociNG
         pUEm1SvqzRkGMRqlkD2sCOsQUSOQeCreyu0kMhyd1LlYjd+Wqa0y3rjHh8eQm2KKsjOf
         T5bQ==
X-Forwarded-Encrypted: i=1; AKwUvBximeQfq7LSg8tqCewNGrpmUWyhYrh9uuAMkce+aburncp/QhpQ5DeoyMddW8bU9UybRUlhgQ7mbYjTryL4dOlH@lists.infradead.org
X-Gm-Message-State: AFq9FYKYv6KQsc4F9ywEr8vz4vANeIIVRgkmow2cMze8hlXmxrXgxqF0
	rpJ+UBchCwGh5PtqB/t4eK0pAj5NrXtzbXaj8mSROrEHCHtP9mdiahhHGEXchaxrpw==
X-Gm-Gg: AYBFou3MiUAVXKmF9XlHUflUC8F9MQY4lpj4X0Sulqw4OcuDTPJ+xzTSWVNPbO7LfyF
	/rS+OsZi9e3A/Mm4uOUyvGmeApKD3jsXBlgbAf9MXtJHCZ8Zf9wDNA61z0XsHKqGigoV0Rjiwo4
	K6F8TcitKQAcPC7jgH98lKN8l4hpSDfA5jkz6N2Wa+p4jJmMx9n1v0gUyr9dxZf+w5rhH/p2oPH
	3DSUS+wazPUioQARrTpUyDfHkwt43H0sjnnO7a/3p1M5V2XGba5P3DZdOdibYopVG5IiEUNmlOI
	CE23lE9DcDEJTaammKUfKuUKdW9mxTZKSL6WKFMOhB1hRYycYSbsV2BbmhAVVWBK3AwErGbmmSx
	uKgEQYQ7atDGShhg7ASF1bQpSKf80gygYalVLs8CG2sMDxZSR9G8vfv7uzvb4HyEeeN2uv/JTxF
	vMxVheVeyCMM2ZIIyP+evmwEzRJfz7GhFIMH//PQi9BbfsCVaXmD7zTCe4klAPrOXET3F8nfW7G
	RYFN+BEfRnSlibdp71QiFi/tQhnyU2IS6GwQ4jGfLO7txVn
X-Received: by 2002:a17:903:1a03:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2e301ae27ecmr1354315ad.1.1790799477609;
        Wed, 30 Sep 2026 13:17:57 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300af8560sm2018515ad.46.2026.09.30.13.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:17:57 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:17:50 +0000
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
Subject: Re: [PATCH v11 03/16] iommu/arm-smmu-v3: Add arm_smmu_drain_queue()
 helper
Message-ID: <ar1ubp2nHdRIXNEn@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-4-praan@google.com>
 <ar1T1ecOPXb6JSPc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1T1ecOPXb6JSPc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_131759_275815_4E58D28B 
X-CRM114-Status: GOOD (  20.26  )
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

On Wed, Sep 30, 2026 at 11:24:21AM -0700, Nicolin Chen wrote:
> On Tue, Sep 29, 2026 at 03:44:57AM +0000, Pranjal Shrivastava wrote:
> > +/**
> > + * arm_smmu_drain_queue - Drain an SMMU queue
> > + * @smmu: the SMMU device
> > + * @q: the queue to drain
> > + * @until_empty: target selection
> > + *
> > + * With @until_empty == true (for CMDQ), exit once the queue is observed empty:
> > + *
> > + *   cons0                cons                                prod
> > + *     |                   |                                   |
> > + *  ---+###################+=====================+=============+--->
> > + *                         |<--------- undrained==0? --------->|
> 
> Jason gave some remarks against this API:
> https://lore.kernel.org/linux-iommu/179018862538.3334538.17643821143626392419.b4-review@b4/
> 

I see!

> So, my PRI series would drop this patch. I suspect that it still
> has some value for the RPM/CMDQ case, compared to a busy-waiting
> alternative. Yet, it probably should be simplified for CMDQ case
> only.
> 
> In RPM case, the "prod" would be fixed/stable right? IOW, there
> should be no new commands added to the cmdq, so it only needs to
> wait for cons == prod?
> 

Yes, that's correct. By the time we drain, the STOP_FLAG is set and
we've waited for owner_prod to reach the target & cmdq->lock to drop..
so PROD is stable and only the HW moves CONS (same for the lvcmdqs).

I'll simplify this to just serve the CMDQ in v12, maybe just a sleeping
readl_relaxed_poll_timeout() on CONS until it matches PROD..? 
I'll think try to see if I could repurpose this too.

Thanks,
Praan

