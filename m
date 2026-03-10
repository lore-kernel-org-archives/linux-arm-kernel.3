Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC19FD4F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXGSMdyPLPak8eP7BVwmVxBskx1z5iRhXJhm2M1XFP4=; b=gmcJ/GLncEqBQ6sWFOIhaF+KQh
	ulQqaBhx9P3jJByfkFMjq4nbegB3iwqJ2FjrUiJalEMb/S5/KkZLjEmcr4MZ78un0yPop9LWiqFY6
	q2K9SxGznZlS9euFVCXGUpQ8+Fc2KwhQBClkFxS0kopXCAVFhICDRBb7PZjR9Bxng7j0CVhfX2siC
	YN1cQJB7hq84vroRlGRXjVPYxJTJL89UccJ11gbAf1/ccYoDzmlpkO+ngq8AUeGvQdn6fYy8zvGBX
	y11U2regpKDo07VHxu38eA8MqRO9Iu5Ov6Vxp4rESP7LmrCjpmgcg8PzRxHOO5B0+XGggmh/DyTm0
	vklBax5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02qJ-0000000ABIM-0iyT;
	Tue, 10 Mar 2026 19:34:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02qG-0000000ABHw-2Y0U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:34:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ae49120e97so20565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 12:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773171247; x=1773776047; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXGSMdyPLPak8eP7BVwmVxBskx1z5iRhXJhm2M1XFP4=;
        b=fyKiLWXLQa9MIovggoe4rSrUFwbzUbyt/pS02d/33ZuZYVWwJ8rtLORteHFYxYJXZp
         0MTcR42GKjvuPt7a3uCqZ9HQhtqY2EybhJU3pGBHYDN80QwVgCL94SH8+VjXoWigYTKq
         gWNUeSSk5Dprt+NDfmZumHDnPiMPmiskU6Xqn57Um6FuazsVSNySQ/WqTevX1R+x2vNi
         VUJUWXY/9rag/7vR/8oWnKOMl5ccrGt4ceJZ3Lsx2xxOQ1C33cBGlYQzUUqtd7g3tTg5
         rDh7yM4G6skQYp+8/7rqyZv6zvLJk5ZzywOi5LRw4H9Lh0oRkEU+t9sLE2VayQZ9mKXq
         yFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773171247; x=1773776047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXGSMdyPLPak8eP7BVwmVxBskx1z5iRhXJhm2M1XFP4=;
        b=hlzvQRK9GIhhkmhkBo0S8ERZG7bNHNzPMSOXTKnKHOVqxxpvTFvpVjgd1ewMdDiRNG
         iPwegc0B7/Iqci6U8N6TAtJDsNGWA17nXtNB9GJylsEVOENzS3rTZQViVVNuN/3hHHTn
         /ZGGaWpl+fT62p8sRzfmzJAYSDmjU2aN/sMm0sCqIFl4J6SpwHf4uy+3/EV8kg47ydba
         7so0EVvnE6rgmiOYelAO4N//t9heXb5MiNJpw1AGjYOsb9IVSN86eWp4a9IFN/sLTupv
         zde+QPqUi4ESU/NF8U64V6ArUTOw6Acywr3UgyvvWzb09g/IMVHB40Gr9L4cTepkFIp+
         hxWw==
X-Forwarded-Encrypted: i=1; AJvYcCV25TmTywzU5EjkYlPObVWCyXzEVQG4JpU417xkMKkVifvmLTD22/QMZHJ4icWjCHcqP/ZCI13ilSrOcvsDx3HC@lists.infradead.org
X-Gm-Message-State: AOJu0YzWB2qLo3KXEtJmi0YDhFejS9x3Bzue1uKq/e0VZyS1/NWYNO3u
	WvQaCcE3sleGywH+Tk95NWAp9641UlUL5gqE3eMnVFt1Zcx3Xg0y9y5cINlpmYLwFA==
X-Gm-Gg: ATEYQzyttxF2rMxT+x9frdXSDrliBL21+eHrOMJdjl9Y9LdnFKHJKXZuKGH8GNdJz3Y
	839AM09FZiFwQYqyXXvRp4ua82QEdmggRjn3orBWpglbtIT6XhCQbttGF9EtZxvkW0FkZuvt1Ga
	b9jsLWTNqGlNvSNW14wA3eo3GVHYDBxxUOOcKHxG9+VyR4cA0tn4APGDQhi7GkdI5qF1zI7k81N
	1UD3LYR/ebC0G5ubcX8s3ofTQXjbb+30Hd6izUuw33LFhaJdd7ZpsixEw8xDlNbmJnLEjbKEFd4
	is5C/vf5hUZaodbLtXuga/sfbrxM23JD7NKLcv6TxbQCGJxA+qFNzerkw6+GflnhdvLb8mV4qCf
	M0jhiSxOdZwOsC1I1tukYe+RYpuTblaaF+fngfKb2IcU0miLYl3NQprUNNwbOT4j9CvyERw2ole
	kvu88JeYeWWyvOTe+lCdrd2eZ5Re9SsivJgUliZhGu5L2byPRVGIUQ+pc5Bg==
X-Received: by 2002:a17:902:f710:b0:2ae:4e8e:954e with SMTP id d9443c01a7336-2aeae7082d4mr4705ad.5.1773171247142;
        Tue, 10 Mar 2026 12:34:07 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34d873sm382665ad.42.2026.03.10.12.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 12:34:06 -0700 (PDT)
Date: Tue, 10 Mar 2026 19:34:00 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
	will@kernel.org, joro@8bytes.org, bhelgaas@google.com,
	rafael@kernel.org, lenb@kernel.org, kees@kernel.org,
	baolu.lu@linux.intel.com, smostafa@google.com,
	Alexander.Grest@microsoft.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <abByKCl4xZlgF74z@google.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <a5ff7a43-ea52-462d-a316-d3a6c08410e0@arm.com>
 <aanwTQtMMplXY3du@Asurada-Nvidia>
 <20260305235252.GC1651202@nvidia.com>
 <03461707-783e-403a-86fa-ae7a5107fa30@arm.com>
 <20260306155646.GI1651202@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306155646.GI1651202@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_123408_685294_DEF5A5CC 
X-CRM114-Status: GOOD (  31.48  )
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

On Fri, Mar 06, 2026 at 11:56:46AM -0400, Jason Gunthorpe wrote:
> On Fri, Mar 06, 2026 at 03:24:20PM +0000, Robin Murphy wrote:
> > On 2026-03-05 11:52 pm, Jason Gunthorpe wrote:
> > > On Thu, Mar 05, 2026 at 01:06:21PM -0800, Nicolin Chen wrote:
> > > > That sounds like the IOPF implementation. Maybe inventing another
> > > > IOMMU_FAULT_ATC_TIMEOUT to reuse the existing infrastructure would
> > > > make things cleaner.
> > > 
> > > I think the routing is quite different, IOPF wants to route an event
> > > the domain creator, here you want to route an event to the IOMMU core
> > > then the PCIe RAS callbacks.
> > > 
> > > IDK if there is much to be reused there, especially since IOPF
> > > requires a memory allocation and ideally we should not be allocating
> > > memory to resolve this critical error condition.
> > 
> > Yeah, sorry, for a moment there I somehow forgot that we can expect to use
> > ATS without PRI, so indeed tying this to IOPF wouldn't be appropriate. And
> > given the general difficulty of trying to infer what went wrong and what to
> > do from the CMDQ contents alone, I do like your idea of trying to return a
> > new kind of sync failure back to arm_smmu_atc_inv_{master,domain}() so that
> > we can take any defensive action from there, with all the information to
> > hand. We'd just have to ensure that if a large set of ATCI commands needs to
> > span multiple batches, every batch must contain its own sync (since if some
> > other batch of unrelated commands could get interleaved in the middle and
> > issue a sync that then fails due to someone else's ATC timeout, everything's
> > likely to get confused and go wrong).
> 
> Yeah, that all makes sense to me.
> 
> The batching issue is scary, we definately can't allow an ATC
> invalidation to be pushed without a SYNC that localizes any failure to
> this specific thread, or we can't properly disambiguate the failures
> anymore.
> 
> My feeling is when the sync "fails", it can bubble up the error and we
> can get back to the invalidation list processor which can then see it
> failed to process an ATC batch and take an appropriate action.
> 

+1 just saw this thread (replied something similar)

> > The fiddly thing then is that we might also have to be prepared to "handle"
> > CMD_SYNC timeout by manually checking for GERRORs, in case the whole
> > invalidation is in the context of an dma_unmap within some other device's
> > IRQ handler, which happens to be on the same CPU where the GERROR IRQ is now
> > pending, but can't be taken until we can complete the inv and return out of
> > the current IRQ :/
> 
> IIRC didn't the PM patches propose to add this anyhow?

If this is regarding the runtime pm patches, I've tried to address the
Gerror issue (pointed out by you in v4) in the v5 [1]

Thanks,
Praan

[1] https://lore.kernel.org/all/20260126151157.3418145-9-praan@google.com/

