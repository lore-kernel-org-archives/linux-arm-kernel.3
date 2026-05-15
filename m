Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC30CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azYrGFYJcArrhMc/4jBsN0eJtlLXO6sWrGP2OnPQSkg=; b=olmQaRZVIh4viFUHjHIO06V4L7
	pjyxoIN8x0U2qGY1l8RvtPiBiWfBpRFUCJSZUgS4mx11mCjzUPd0lZOKsOO8/gsBNbhKBhxLIe5tH
	FhlliEoyrZsxIFKJbYlvxnruaxb7nFp+ATjs7bS3QlOTd7/mSodzH1RukJgWlH93tQWkM8UVzV0Yx
	MRspy/nHNEJ3emFfdZ4bshqRI+DFEmIJ2Palq/0g8P4Bag9NQv4Znm/Hyq/AvcUFpLzQpfD9LtIlc
	4gsto0brLfXC5haZ+lLq1KXNzlMaxJrkrYu+2YWuLTcVywBSZMxLU/JcKiBg4pIsUN0PXrYF+1+gX
	+KpP5ykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqYQ-000000089xT-3LSO;
	Fri, 15 May 2026 11:18:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqYO-000000089wl-1Qcd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:18:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66FD22FC;
	Fri, 15 May 2026 04:17:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A6C83F85F;
	Fri, 15 May 2026 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778843882; bh=hdnT2rSiLjso6CNM6o27JC8OpHzATjAy38dvAzOX6iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TK+iwPcVSYtu355kSoesA7oDUYqeiR+Y7J1P2jHfUPHjtSQr1PLd8k9SgkZAHF/1w
	 PapGLu0RciGXoVBnY8ygMWHGpA4Yr9I3m39Af+5dRzVAZJgmkR1AtIP2QmePA4Xkpm
	 za3Ze9bVvqjTCV9HHrNmA8YCtW9CntOdXwS+AuTg=
Date: Fri, 15 May 2026 12:18:00 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 19/28] coresight: Save active path for system tracers
Message-ID: <20260515111800.GM34802@e132581.arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
 <20260511-arm_coresight_path_power_management_improvement-v12-19-1c9dcb1de8c9@arm.com>
 <a40b0d0f-bbf8-4ba4-9370-2b5be71bdc44@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a40b0d0f-bbf8-4ba4-9370-2b5be71bdc44@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_041804_428853_7D34B657 
X-CRM114-Status: GOOD (  17.80  )
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

On Fri, May 15, 2026 at 11:54:22AM +0100, Suzuki K Poulose wrote:

[...]

> > +	/*
> > +	 * Update the path pointer until after the source is enabled to avoid
> > +	 * races where multiple paths attempt to enable the same source.
> > +	 *
> > +	 * Do not set the path pointer here for per-CPU sources; set it locally
> > +	 * on the CPU instead. Otherwise, there is a window where the path is
> > +	 * enabled but the pointer is not yet set, causing CPU PM notifiers to
> > +	 * miss PM operations due to reading a NULL pointer.
> > +	 */
> > +	if (!coresight_is_percpu_source(csdev))
> > +		csdev->path = path;
> 
> Do we need to specail case this for non-percpu sources ? We could always let
> the driver save/clear the path leaving the core out of it. We can fix it
> separately from this series in a follow up patch.

This patch has a big reason is for patch 22. After saving csdev->path,
then patch 22 can totally remove IDR cache related things.

Otherwise, we can drop this patch and patch 22, this wouldn't impact
CPU PM stuffs.

Thanks,
Leo

