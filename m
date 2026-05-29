Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37D1CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQnvUAMDcWre1zb+1ZQyKPWolVXCfJctmWLTOardQGc=; b=QWUQAWr0AiA+v9+9EJ2bSknIMa
	efV4eOM9GlWM1X/5QvpGApUHiMXFpVP85ZHx4P5KTluom3Ot7PhOeyZxF7/HS5KJiVxJ+Qy2SvDyi
	nDnY1w2aGSSfskEcJQ0IOn5wIRGJNxudVHrpAt+QMAzwApzqCENuZS25ED/wFCE7SI9+7WHAqlmuw
	L8WhVprUt17eUxUxtEgk6WiyiHIUhuhedTmct2y/g9m8pd+9A/Pmr0AXBJWf2r49tCMm65PyTUhAX
	P2bTiTxwaRzOKWNXHHEimQ3W53PgK5pXT+n5zPh9XL7ZlVJw8GVsHGJNXXB3ljE428FP9YkBrS5Yx
	kG+Vu1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyW0-00000007ZWR-29cf;
	Fri, 29 May 2026 14:48:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyVr-00000007ZRl-2Of2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:48:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bf2d865383so1965ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066119; x=1780670919; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQnvUAMDcWre1zb+1ZQyKPWolVXCfJctmWLTOardQGc=;
        b=gsOUKCXWCuIvwnM3wsjOevw2EMJtV4q2xxe7F1yMPyiQjQ+isQdrKoEviFVxAlRtcD
         DjlEyq2FbCH4hNTwT8sVNUkhNX+yjKexeHNZ9C1CrLgRyY0YS7fiJQMThufRYgxwIq3M
         d0mZL2C+eqh0KADHLLSBePmqmJf87nBnpuW24Y/ZnKJNwLU06OgtDFk2tCNYU3CCQ36x
         l2tBSAYDOz73H4peknXTK/iP+qhSTj2A2xsKisnkD2eDUXgJw+K3tM+dRwroNHmLOfK+
         Kh771FjYgiRkHgK5JzYrRQFReXIVO7avl7ZG0aOBvXVNpeZBzDZdkIpeIi7YtDeNpn9J
         aGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066119; x=1780670919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQnvUAMDcWre1zb+1ZQyKPWolVXCfJctmWLTOardQGc=;
        b=RGD/RIAUaLuqpINFmoC0R+DXntM7NJH5YySqNXyHq4sWSt5i9ZR8/JwPwaN7LB+skh
         5luf61/raXK6itSal7pkwHJQLZKzsCQLt+PrMsrHcHVcjl+uWQRIgi7ISF0v5H3daDco
         KlE2KMHdOd6Fo1iofU4isJBdRcQMnsDVv7MkKznsA8EoYyUNz01YIu4rOXECvrxwAwdz
         L0h1vswAWWr1gUHMIjWD0mT5PyEtIS466YU0+Uewd/jk5dDprENnKsG5Od4uKFIOARY6
         t/+oTN0k+DuuFyQ1WdR5LOUpnYS24oeLoln+RMQPq6uGG/SO74atZumohFVRVyuRgICi
         qxAQ==
X-Forwarded-Encrypted: i=1; AFNElJ89k5goli7b9ecnfKzN+efyjMio92XLqN7aieXsisUfa2Yb+w0H4npngjX+d8HwmEVCEAN4nte8gn8plU+zwhMy@lists.infradead.org
X-Gm-Message-State: AOJu0YyWslb/SB6uej31MIo87jrv24sFuM1mN4s6Z5BYKYTCeiROFMF5
	7Mx2Rvcnu42tHEz1Oq0mTgo9W+5STjYbbv9+OddV7gPXhSt9ZehSRSAUKWYgsuGxUYZikGoATUe
	lP77dEw==
X-Gm-Gg: Acq92OGeNCFinucfPgVXuwKFyGFFYkIK2Bl4pIb5hIjCCB6l/+62AOHDQcSdF25QNqK
	5Ela7zR3yQaXRQ85x8rslGA/jz/63QRB2Oje87b9tYD4Vhxw0SHvJn6DhRBUvCDx5GmL3G6E46k
	3s1bI3dttAF0IbuFWzCRTiqSxD0XMwRxUhlr6y5vcYYSlQWMIg3sUwlWe8zTwukxeQ6eAAGPz2p
	lTlVVDvdfcapKJBByBt13uMTQPzNXpmDJ+2C9R/u2U0tIhrkWt4hpnPh0ytIyCP/5S7ckdWA6U/
	ymM5Xig5WTJXjCyOj/U9eXKG9w/Y/R4ktbFZWr7pzJ2UrhZhPwJIUL6OW4F8yVz/VTeKmaiMyQn
	NsApxiM3ST8WO9xigU6Iw64HRPVv0BIMLrgbOvS8fbs5OS4q+aYx9q8hMR07S7YQn1+ADW/2fZo
	kiU/xZ3/g4hik3kSaeDV3TLXFpj7xEvIsRjpECh1TI/v9d25LjKEdh1GXfhw+wOnLK52Yb
X-Received: by 2002:a17:902:f70b:b0:2bd:5fc9:27b9 with SMTP id d9443c01a7336-2bf22e48888mr1870215ad.3.1780066118300;
        Fri, 29 May 2026 07:48:38 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c57283sm22636595ad.81.2026.05.29.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:48:37 -0700 (PDT)
Date: Fri, 29 May 2026 14:48:32 +0000
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
Message-ID: <ahmnQN5xatcaF5hT@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-11-praan@google.com>
 <ahilX8Za1NRCH3ik@Asurada-Nvidia>
 <ahi3uY9YZZtR1Lq5@google.com>
 <ahi7KWov1+GC3xVx@Asurada-Nvidia>
 <ahjAxx-cyww2va__@google.com>
 <ahjNYqe8hjPUQIQD@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahjNYqe8hjPUQIQD@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074840_618407_1C5A5983 
X-CRM114-Status: GOOD (  36.34  )
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

On Thu, May 28, 2026 at 04:18:58PM -0700, Nicolin Chen wrote:
> On Thu, May 28, 2026 at 10:25:11PM +0000, Pranjal Shrivastava wrote:
> > On Thu, May 28, 2026 at 03:01:13PM -0700, Nicolin Chen wrote:
> > > On Thu, May 28, 2026 at 09:46:33PM +0000, Pranjal Shrivastava wrote:
> > > > On Thu, May 28, 2026 at 01:28:15PM -0700, Nicolin Chen wrote:
> > > > > On Wed, May 27, 2026 at 10:14:06PM +0000, Pranjal Shrivastava wrote:
> > > > > > TLB and CFG invalidations are
> > > > > > elided if the SMMU is suspended by observing the CMDQ_PROD_STOP_FLAG via
> > > > > > the arm_smmu_can_elide() helper.
> > > > > 
> > > > > All the arm_smmu_can_elide() call sites here would eventually elide
> > > > > the commands in arm_smmu_cmdq_issue_cmdlist() that is already gated
> > > > > by CMDQ_PROD_STOP_FLAG? It doesn't seem necessary to gate again?
> > > > 
> > > > While issue_cmdlist() would eventually elide these commands, the 
> > > > can_elide() check is necessary to return early during suspension. 
> > > > 
> > > > This avoids unnecessary stack allocation, cmd building, and spinlock
> > > > contention on the cmdq->lock for threads that are anyway about to be 
> > > > elided. 
> > > 
> > > We aren't in the perf sensitive path.. most of those aren't going
> > > to be that bad.
> > > 
> > > arm_smmu_cmdq_shared_lock() on the other hand is taken at step 2,
> > > and the STOP flag in the same function is gated at step 1?
> > 
> > DMA unmaps frequently occur from atomic contexts, interrupt handlers etc
> > Thee Step 1 check in issue_cmdlist() happens under local_irq_save().
> > We may argue that it doesn't happen for long though..
> 
> It shouldn't IMHO. At least most of the call sites in this patch
> are right before calling issue() functions, so they are merely a
> few cycles away from the STOP gate in issue_cmdlist()?
>

I agree that eliding right before calling issue_cmdlist() might seem
like an over-optimization. I guess we had this earlier because we didn't
have ellision in the CMDQ. I'll think more about it (just in case we're
missing some scenario) and try to perf it to confirm there's no big diff

Otherwise, I guess I'll drop the "early-exit" in v8..

> The only place that might be slightly longer is the inv_range(),
> if the domain->invs is really long (e.g. nesting parent for VM),
> in which case, it might be plausible to add a gate. And even with
> that being said, it should be add to the top of the iteration (on
> invs->has_ats) rather than before submit()?
> 

I agree.. but I'm thinking if we plan to remove the early exits, does it
make sense to keep this one? Ideally, we shouldn't be dealing with a
long domain->invs if we are in VMs (IOMMUFD & VFIO both get a pm_ref).
So, I guess if we're dropping elisions from everywhere it would be fine

> > > > By dropping these requests immediately, we significantly reduce cacheline
> > > > bouncing and contention during unmap storms.
> > > 
> > > How significantly, so as to justify invading every command issue()
> > > call site, which would be difficult to maintain? If we really need
> > > an early return, it would be nicer to have a common place at least.
> > 
> > Eliding early is more of an early-exit from the DMA unmap paths really..
> > If maintaining these high-level elision checks at 4 or 5 call sites is
> > a maintenance burden, maybe we could move the logic into the issue_cmd
> > macros? 
> 
> What kinda of macro? Again, if it is added to just a few cycles
> right before issue_cmdlist(), it still wouldn't seem necessary.

I was referring to the arm_smmu_cmdq_issue_cmd* macros here.
But I suppose you're right..

Thanks,
Praan

