Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3EBC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwaJCgmOMKGwXsxGXWYWz/FIRprFUrDW+67Tgv3cW08=; b=PYLIQgA2LXJnuvWjI+b5mXknJ6
	rtkFC6ShxHZVUmsZMUmQfqiKcaIAZIlouEyquH+r2QOShhjkuJizhE4tqx8xEvQy2yrjSZHALPnVF
	FPo/DiEBJS3ZGDdwccPdaRHqWgNPqwxR/mTR99SvnxHycxFNJmXDFbaem6pjHLeFy9whpzVhzi3Ld
	G3Z/VMI/iIVkHV0lfXqcnroRQhXOrlByr5VeKbdF1CmrCldkaWy6m8uepnkcbBgcGx9W0GIpgH/tz
	UUdYq02v2idjjpt+LB9Cd4E3psIqSiirJnHg0BDkvAccsx5cOVLiUqGU8Wp5dghy/G82MTSLGKOql
	O/iV/zUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRHo-0000000Az11-2g0n;
	Tue, 03 Jun 2025 13:02:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRFb-0000000AyiW-2zn9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:00:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCCA612FC;
	Tue,  3 Jun 2025 05:59:59 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B0DE3F59E;
	Tue,  3 Jun 2025 06:00:15 -0700 (PDT)
Date: Tue, 3 Jun 2025 14:00:12 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
Message-ID: <20250603-jovial-whimsical-vole-029c39@sudeepholla>
References: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_060019_793711_8026B6FB 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 03, 2025 at 04:38:53PM +0530, Viresh Kumar wrote:
> As per the spec, one 32 bit reserved entry is missing here, add it.
> 

Nice catch! Not sure how it was missed.

If there is no objection, we must add

Fixes: 910cc1acc9b4 ("firmware: arm_ffa: Add support for passing UUID in FFA_MSG_SEND2")

I will fix up when applying.

-- 
Regards,
Sudeep

