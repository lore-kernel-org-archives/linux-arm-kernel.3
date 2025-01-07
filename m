Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B796EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVMS5AJfaH3h4RGiSe7We+pleF0WRkMWuDqEg5WyNOY=; b=vcDi26Ky10Bu28R0rOFfSOegIA
	1eSpLDdGMr+2iLfeBDCODh7RTW3wTHTqvZcvP1dyZPLgOVSoim87m5xqHDmOV/kZzz06j0zXOyMrO
	SLmFXCtsRSEvJYeKFO/Twm3Ipm8vt7U94C55A0yMg0bGuX1UKZ7XkVCHqmJl3WPr/c5wXp7GcCLH3
	zZ2RpLyDeP1EOPf0LWlD2IXboNqnE3AoOcxID7JUf2EVztdTvJaRfWQfZ9ZqR6W6MNMgYZxtMZpoU
	Uy21INV+zCiDD7TRrRihlGz2gqePNHZ6hWvrjhjSvzrrAlw0yiYSLItvnnMat/MqbX9uUp/vqeYxW
	Hd5POBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9GI-00000004twM-1am9;
	Tue, 07 Jan 2025 13:04:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9AX-00000004sHx-01yn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F05AA412D4;
	Tue,  7 Jan 2025 12:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F014C4CEE2;
	Tue,  7 Jan 2025 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736254727;
	bh=0d8chFQwCQH17RxZgem2YuxeZFD8iqNF18spSTjEvc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8ySdhAYCP+O/e4xmQy+M+8iHJf+MVc/zbwzBVDHy31+rGtRSf95w9/67SxvFbz/4
	 nuEdInTnNN6apCgnGTLsBxOg95cwpbAa5q5bq5RkqGfkPRi1MfygXVkmLpvL7jSiVz
	 mQCYobyHdRyRqzP9dTUKrrwmZUDHhpFognYGe+EcjMPhcCEPavD2oh60E6KVFg/2EI
	 LcEylZoywSRRQzT4iTNN8D+jj8HzLw+cUu089n6lRlOM/vyETC/VWtoVrhZDaiASgp
	 jT+dxh5ubmQnxiIrVrOzc+aoj9Yet8Ls4vJIVa3cbQvLe5AUW1PVy987hCJoXfO21p
	 1mxzDVsIgFTEA==
Date: Tue, 7 Jan 2025 12:58:41 +0000
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joao Martins <joao.m.martins@oracle.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault
 debugging
Message-ID: <20250107125840.GB6991@willie-the-truck>
References: <20241210165127.600817-1-robdclark@gmail.com>
 <Z30kWxVxwJXO_z2_@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z30kWxVxwJXO_z2_@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_045849_108140_56C7592A 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue, Jan 07, 2025 at 12:55:55PM +0000, Mostafa Saleh wrote:
> On Tue, Dec 10, 2024 at 08:51:18AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > This series extends io-pgtable-arm with a method to retrieve the page
> > table entries traversed in the process of address translation, and then
> > beefs up drm/msm gpu devcore dump to include this (and additional info)
> > in the devcore dump.
> > 
> > This is a respin of https://patchwork.freedesktop.org/series/94968/
> > (minus a patch that was already merged)
> > 
> > v2:  Fix an armv7/32b build error in the last patch
> > v3:  Incorperate Will Deacon's suggestion to make the interface
> >      callback based.
> > v4:  Actually wire up the callback
> > v5:  Drop the callback approach
> > v6:  Make walk-data struct pgtable specific and rename
> >      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> > v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirty()
> > v8:  Pass pte pointer to callback so it can modify the actual pte
> > v9:  Fix selftests_running case
> > v10: Call visit cb for all nodes traversed, leave the decision about
> >      whether to care about non-leaf nodes to the callback
> > v11: Adjust logic in 3/4 [smostafa@]
> 
> I see the level initialization was not removed as it was in the diff[1], so it
> seems to me that’s redundant as the level is set anyway in the callback, and
> actually looking at that I see it’s not used or printed from the driver,
> so may it can be removed all together, anyway that’s nit that may be Will can
> fix it up while merging.
> 
> Otherwise, For the whole series
> Reviewed-by: Mostafa Saleh <smostafa@google.com>

I'm happy to drop the 'level' field if it's not used. We can add it back
if/when it's needed. Rob?

Will

