Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C22CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUa86KA/9pb8zT8ckC7YrcjbTr1MPvA4rLMmDTY8nxQ=; b=yH6qekVb75Zk+8kRfTjNE5ED3Z
	fhs0HyOLmvNtbPeSRNKkNdPMeWeyQNS5+GlREUZd8BxD7a4UU+vo4E0N5BfWR7+o83f8ecCPPoIg3
	ROZ+sgqvbecc9bIGXqcJLJtpVhWSiclAR4lCdf64gZ+dQltVoVcpvG6EVtzJ6UCimrd22VoNKbGUz
	pjAchlJ75v+j/Mclrog61b2/JQVubuTJGAoz9/GR+94pHP09DBJJmYyv3azg6iSguqaXfbhpcGdWW
	VfT35WURuayAZ0aWI5isXHzmMGW1DSXahT/m/HMg4L59vq5ZinKE7TyBCZkPFyGxyAjFVGJ/H6a/d
	nQoFdQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYdb-00000000MGL-0bWI;
	Wed, 06 May 2026 09:33:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYdZ-00000000MFl-1cEW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:33:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 192A81A9A;
	Wed,  6 May 2026 02:33:42 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 121A43F7B4;
	Wed,  6 May 2026 02:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778060027; bh=IZLY8Od/jlGnZF5LC79Qdlll6Ee7vkl35M7QFmD6W68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6Ukjj3lJJ9saUZHFgnhiV38aC3+rTVz0nGFq1hYsyA1BXjC0aCOjp8PdTSSXVE8F
	 wHOXA9fzwT1rBrUsz3DRwgTSdkz8FY7+baaOW8JG0l9CtLOiqCNorybnERvxS3tVck
	 smFmpLd6qD8cfDMRz4CzIMw6mbuwv3OHZIudV3lk=
Date: Wed, 6 May 2026 10:33:44 +0100
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
Subject: Re: [PATCH v11 14/27] coresight: Move source helper disabling to
 coresight_disable_path()
Message-ID: <20260506093344.GD3778514@e132581.arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
 <20260501-arm_coresight_path_power_management_improvement-v11-14-fc7fb9d5af1c@arm.com>
 <f3d3d2e6-65f8-4ea9-91d7-4b1fc3882a83@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3d3d2e6-65f8-4ea9-91d7-4b1fc3882a83@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_023349_595621_4A40F081 
X-CRM114-Status: GOOD (  21.36  )
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

On Wed, May 06, 2026 at 10:05:47AM +0100, Suzuki K Poulose wrote:

[...]

> > In coresight_enable_path(), if enabling a node fails, iterate to the
> > next node (which is the last successfully enabled node) and pass it to
> > coresight_disable_path() for rollback.  If the failed node is the last
> > node on the path, no device is actually enabled, so bail out directly.

[...]

> > @@ -580,12 +567,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
> >   {
> >   	int ret = 0;
> >   	u32 type;
> > -	struct coresight_node *nd;
> > +	struct coresight_node *nd, *last;
> >   	struct coresight_device *csdev, *parent, *child;
> >   	struct coresight_device *source;
> >   	source = coresight_get_source(path);
> > -	list_for_each_entry_reverse(nd, &path->path_list, link) {
> > +
> > +	last = list_last_entry(&path->path_list, struct coresight_node, link);
> > +
> > +	nd = last;
> > +	list_for_each_entry_from_reverse(nd, &path->path_list, link) {
> >   		csdev = nd->csdev;
> >   		type = csdev->type;
> > @@ -639,6 +630,11 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
> >   err_disable_helpers:
> >   	coresight_disable_helpers(csdev, path);
> >   err_disable_path:
> > +	/* No device is actually enabled */
> > +	if (nd == last)
> > +		goto out;
>  +
> 
> This hunk seems to be different from the one described in the commit and
> should be a different patch if at all we need it ?

This code piece matches to "If the failed node is the last node on the
path, ... so bail out directly".

But I should have adjusted description in commit log that first
mention the last node failure case to directly bail out, otherwise,
fetch next node for rallback operation.

> Moreover, this looks unnecessary. We already do the check to see if we
> didn't enable any device. See CORESIGHT_DEVICE_TYPE_SINK case.

This is required when support range - we cannot assume sink is the last
node anymore. I can move this chunk into patch 15 for support range.

Thanks,
Leo

