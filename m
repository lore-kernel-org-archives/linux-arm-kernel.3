Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6CDCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3lH3cjkzIHlx4Slw2VWW5sli+Rig7PDMVIlCqK59Mc=; b=Yk/E4l+haf5q/tFgxml/U8k87S
	9udeO8MARHPvo8joBlTxb3e6Vjw95sudrTcHhdL5xgnLFo9GMpw/Dw9NCpnVgZSjiM0Dt2vD/VoDE
	fd4vL4WUY5Ps5xp/UhL+t5lpafpP3RlMFOOYxFrzQW6AFkV6poTGenJYrOV1XF3yMS2wYBnAYspvM
	HzS9QCNtN4Xqd8xZDAqfswtmC7TX18A8qOv17fo1KD9TnS5NVpPEne8LLWSdOBAx0+jCLpow3H+p7
	61oIIYCWUjXvuf1huaCwdww+pFx7KozYZAvsSEFcMz5ceNfPMR1+L9U/y7cCZXX86tbNOUMon+Yv0
	ITguO5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjAI-00000006TVc-0rJ6;
	Thu, 28 May 2026 22:25:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjAF-00000006TV9-1lre
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:25:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780007118; x=1780611918; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3lH3cjkzIHlx4Slw2VWW5sli+Rig7PDMVIlCqK59Mc=;
        b=LAk24cBiKaKwplDi75oI2l3m3nt8fNl/Je915abrjJ3HhJYKZ3axczBRmQmp3NREQc
         h0sBm61GLWhCji9YjcpSkWjmhKlaXhRWVI/psg055ZCIm4IeszY1sGVpJe82NDApvn8k
         mJpkr1eS1nDTvFsTHST4wTeDqkWsJ+unKWYPZ1fp2v06MlfTBryLEuYhL3n6vC2hxCZl
         DhNRhEf4LMFRiEJdIYHwUhC9YytuTlWhxdANFSjQ8aGILoXRUV5Boy19r4zBh8O3PgbT
         UAKIll8MMwDc7lAYhTJIiaHAjpoEHCreQpJ6sQRwtlwT47ofpo5X4nVCHeMk4YZBvLuo
         Y6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780007118; x=1780611918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3lH3cjkzIHlx4Slw2VWW5sli+Rig7PDMVIlCqK59Mc=;
        b=A9i2J8WAWt9nNATcT6Gau09CIBgAaO3IRCRLkBDBUV3ZHjY7WAr/JS04/ydfV5i7K/
         GhB6GGL7JcJC4I3epw02niBwqQVmOYxGx6H9e6Uf7ri/UG4OPM8QaWb8UPslullA45GG
         9zfDgQ+LBfYLKlajxzzNwjMRPMn+39Va1WoIY/haR5yFj4y5IwyNXCzQalvDCQdtFgLY
         cg+zoD+cUV7BHoz+Rmr+XJyxR+DM5rb/GuEAOp8mmKtcCoaNqETxVEMuN3uLbsm4Cz+P
         jyw8OwGw4wfy+fQH4s43zJLclM7mTWPLZqvM9klnmyV3QmUVzMql9RGRlgVa0T5Wk0fP
         h75w==
X-Forwarded-Encrypted: i=1; AFNElJ9G7zu3j+VkXERShYGwF8RsPmGyyGm6tvqCTbgWyqsOzjl55ffqzOD+KZYNJcxIdHmo0j9Uu9LnfAviKaSN/FXw@lists.infradead.org
X-Gm-Message-State: AOJu0YzCudnxfJ7b5U+FQ5s5F39LJs3hOvy4d+o/yfHu/I7orDlVc3D8
	Lojn8edCrWeN14r4zR38oFJpfDvzHP8qPvBZ7lyD5heUq+fevaYikav554F0OJoVxg==
X-Gm-Gg: Acq92OGv5cjhvDixDJtMqXdsFRcS2U1YzoLBRpXvSozg9sPR2KeSCJ++OoXG600crAg
	Lc2TrVZScGd3VoTbQewU8g0NX0QcwOrLYGMUTlU8t3jYKKFi35qKQ81AV93NEoqe/Hy0NuzC9ZB
	+olEkJJs++tMrc5tKhZQ6jLDnUBaql4K7jCuYyI0xWcdcfJyb3RzMrMIUQjwWFk8eMFW+8UAvlO
	M96Kpu44IYE8e8uQ16mbmkuVTBRzGzQX8+LUAHcgROeSP8Z4k1s2uGQ5cwLAwcfOJWaY56cwkOH
	WZGNEt7AOf4WoMl2GjbSxd/osX35js02bI5o8y9S0OzdohjcarlLU8qoCHoP8CyQVGf91/TIffF
	bh7Xt8nXX1Vy9a+Q/cklAUJBxm7qyg3dSYy1ARRrgxzA+BtEpyJbD9Xet52ZlzUhQtu+5I9HoiQ
	UPnJF+C2QZswkJb+gmsoFSbt0NmkCxc7n8J1A66gooqRqBE73UIrQSqZm20YKaPQyj5lXdNAmge
	CDNv58=
X-Received: by 2002:a17:902:e884:b0:2bf:28d:87ad with SMTP id d9443c01a7336-2bf204cdd20mr428735ad.0.1780007118059;
        Thu, 28 May 2026 15:25:18 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf218530c0sm647205ad.20.2026.05.28.15.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 15:25:17 -0700 (PDT)
Date: Thu, 28 May 2026 22:25:11 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 10/11] iommu/arm-smmu-v3: Invoke pm_runtime before hw
 access
Message-ID: <ahjAxx-cyww2va__@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-11-praan@google.com>
 <ahilX8Za1NRCH3ik@Asurada-Nvidia>
 <ahi3uY9YZZtR1Lq5@google.com>
 <ahi7KWov1+GC3xVx@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahi7KWov1+GC3xVx@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_152519_467227_9840F7A4 
X-CRM114-Status: GOOD (  23.42  )
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

On Thu, May 28, 2026 at 03:01:13PM -0700, Nicolin Chen wrote:
> On Thu, May 28, 2026 at 09:46:33PM +0000, Pranjal Shrivastava wrote:
> > On Thu, May 28, 2026 at 01:28:15PM -0700, Nicolin Chen wrote:
> > > On Wed, May 27, 2026 at 10:14:06PM +0000, Pranjal Shrivastava wrote:
> > > > TLB and CFG invalidations are
> > > > elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG via
> > > > the arm_smmu_can_elide() helper.
> > > 
> > > All the arm_smmu_can_elide() call sites here would eventually elide
> > > the commands in arm_smmu_cmdq_issue_cmdlist() that is already gated
> > > by CMDQ_PROD_STOP_FLAG? It doesn't seem necessary to gate again?
> > 
> > While issue_cmdlist() would eventually elide these commands, the 
> > can_elide() check is necessary to return early during suspension. 
> > 
> > This avoids unnecessary stack allocation, cmd building, and spinlock
> > contention on the cmdq->lock for threads that are anyway about to be 
> > elided. 
> 
> We aren't in the perf sensitive path.. most of those aren't going
> to be that bad.
> 
> arm_smmu_cmdq_shared_lock() on the other hand is taken at step 2,
> and the STOP flag in the same function is gated at step 1?

DMA unmaps frequently occur from atomic contexts, interrupt handlers etc
Thee Step 1 check in issue_cmdlist() happens under local_irq_save().
We may argue that it doesn't happen for long though..
> 
> > By dropping these requests immediately, we significantly reduce cacheline
> > bouncing and contention during unmap storms.
> 
> How significantly, so as to justify invading every command issue()
> call site, which would be difficult to maintain? If we really need
> an early return, it would be nicer to have a common place at least.

Eliding early is more of an early-exit from the DMA unmap paths really..
If maintaining these high-level elision checks at 4 or 5 call sites is
a maintenance burden, maybe we could move the logic into the issue_cmd
macros? 

Thanks,
Praan

