Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5961D47CA4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 00:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1eRiumhwT1jFnEjddrDgH/CWJ+xyyG+XDRoYPOP7Yg=; b=aTSajku3a5+WqkZzLb/wZDQssG
	vl3MgfYwVRARWDw6nqwyL4YAYLDkUr6Uzj7mdyoUW1A86CfdTyd0HxBWRUW+xvJcEihxCvr4QDTMr
	WyOOebtjeVTw85Oc5YfoZsomZdGhh3Rf4fflR1s8PKS24NYtvNqv5rSA/zn8ny/3OTpHp7YrvAWAp
	sCGuppxP2jFon/8N+HXqyfQAagLOf0K27wbrdEgbpGHLPJ3uJaFP9sJCaoypZnQlj/vTYUxI761IF
	HFhM3B4aLrki9aBmodHv1d56c7pTXEyW3h6UVjoKqPHGV9CGRnG7x4lNpsCtwC+gX/8VsoCswwswj
	mS5aec7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXHu-0000000DLoJ-0Qay;
	Fri, 16 Jan 2026 00:02:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXHt-0000000DLo8-0D9N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 00:02:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20E0360130;
	Fri, 16 Jan 2026 00:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B599C116D0;
	Fri, 16 Jan 2026 00:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768521719;
	bh=ymO7TCM2EVQsIwtIh8wgg2R/ryyDXJBI9O2DKENFKG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+2DqPG0bGqGe0MRh8MBRcVmQ5ABzYpbZ/pFDfpa7Nvx3L6lKnHeWfRfLLGF2VXR7
	 VXFB1UQY9aImryNQkQ9qJXAVfIUf5DAuRfp66EePILqltJG5han7pzYINQ7Wcm5+V0
	 iViof0Lqz571ha0RnDcgwQdLwV86zTMcUgF0+LemQ8vBDLs1r3/a3xWdM+flIK9clH
	 yhZX1uTT0Ys8b/JUc1Ze109xfnw5Z086OSEVAHqBq8Vmtwpux4JqqR/V4+hmt1HKkN
	 ftdtJHK0Fn9bq6y/jlO/Q9thFlgKYNaFCdkDVIJx+IQs2r/j9aA3I9FZYQNGhYmkeO
	 Z/cN/7Onv7Ejw==
Date: Thu, 15 Jan 2026 18:01:57 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <t4pd72ff2ut4xr7ke3tzn3vxhyxq4kr6m3tublurwchynonouj@y4jgc3zqa5tw>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebm6tn3swrzqqzp5qnd7zkasqxo4nqcz2gt3w7j6sxqx2ryyn4@pwrkiumm442t>
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

On Thu, Jan 15, 2026 at 10:18:38PM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
[..]
> 
> The kernel was never broken, it is not a kernel change that introduced
> the regression. Why are you trying to change the kernel?

I always thought you had one of these per SoC, so assuming a that a
single-soc system presented one entry would make sense to me.

The kernel is supposed to abstract away hardware details, that's clearly
not what we're doing here.

> If it ain't broken, don't fix it.
> 

Get over yourself.

Regards,
Bjorn

