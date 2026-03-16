Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F889F506E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SwfuMXAqS/IGdO5yxX9hVml7zq0tJYSxGWwIUVVeuk=; b=DvOSo2jwYx9xgrj2/RVXRSTgiv
	WkoQqTQO5LApa0cCJm7jUnRLoV0tvprOp9/P83tmKfhV/WOHxJ9wPy1PhRCx2Qm9+ffSu58xVXLIJ
	cs8fET3EzGzekbSXRRCjwKa9VNomf7oO9OppPL6jY0G9uaOBXnHr3viDKRnwqDKLOZ4jLuREIUW/W
	wcqYHvuRStgVtx6UxqhargbMbLAm43DX+SxsE07k6Y8TKYHUEa54oAzKvsAN3bYteILVOsyW0L9Z3
	REBhvnc6bL/mdHwkb0EfPK7mEEqaO0TOKIwWtUKKpNasDkrURBJI4uSGLhS/2JNFUOkRbwH5rRCit
	HENKNRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w297J-00000004Cn0-3UvP;
	Mon, 16 Mar 2026 14:40:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w297H-00000004Cm6-1oKJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 14:40:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46FCE1477;
	Mon, 16 Mar 2026 07:40:16 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D2CD3F73B;
	Mon, 16 Mar 2026 07:40:21 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:40:20 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 01/19] coresight: sysfs: Validate CPU online status
 for per-CPU sources
Message-ID: <20260316144020.GF8048@e132581.arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-1-eff765d211a9@arm.com>
 <13fbfe69-2d7f-49fa-a191-98aea3fb1f21@arm.com>
 <20260316140242.GD8048@e132581.arm.com>
 <888e6c0e-f09d-43d3-a29e-ade9616690f9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <888e6c0e-f09d-43d3-a29e-ade9616690f9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_074023_517986_F57E0CEA 
X-CRM114-Status: GOOD (  15.28  )
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

On Mon, Mar 16, 2026 at 02:28:35PM +0000, Suzuki K Poulose wrote:

[...]

> > > e.g., add a flag in the coresight_desc.flags = CORESIGHT_DESC_CPU_BOUND
> > > 
> > > and then desc.cpu describes the associated CPU. Otherwise, defaults to -1.
> > > That way you could restrict the changes to only those that need the
> > > CPU (ETMx and CTIs ?) Also makes any new driver safe.
> > 
> > Instead of adding a flag, I'd use a helper to check existed flags:
> > 
> >    static inline bool coresight_is_cpu_bound(struct coresight_device *csdev)
> >    {
> >           if (!csdev)
> >                   return false;
> > 
> >           if (coresight_is_percpu_source(csdev))
> >                   return true;
> > 
> >           if (csdev->type == CORESIGHT_DEV_TYPE_HELPER &&
> >               csdev->subtype.helper_subtype == CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI)
> 
> That works, but if a new device type comes in, we may have to expand the
> list. Having a flag makes much more sense and the core driver only does
> what has been asked for. I prefer the flags.

Sure, I will add a new flag.  Thanks!

