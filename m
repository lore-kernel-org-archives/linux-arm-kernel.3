Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA5DC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 12:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3MAsT/5jmnq7D+I/vzzYnQ2rNRlEGR0tDCcvGwj9gA=; b=dJ7q2LU8ht7LCb0Pnp/DffTLcZ
	gSBR/jKW7BvuDpiStRQVfw71Q/raAdyXzub9QmQCWjzmQlxeVZPnqJ3qDEwJyOKaJcNxa+fKyiY/5
	og8kthQ/kIwvu1KYBUcIjdJldz81xNsBPzGP7dasxz5z88gnM8VwQDEe6LsrNrCCrcBqyd9ooqpbT
	mBACneM2v+cUNGk4kHvCr0m60U5fIzdgfuGirjy2KqP75DiYZ0LFsGXKUJbs7e3ut2sUlwFnXZL+x
	ZucbFFj0DBlbTZEHBGKLhTwa2wyV2ggoLT9h4esprX6K4Nk1vCcqFM/7/k9zw4jK3aUQ+7s7Mt9PH
	klv5U0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKygP-00000000WD5-31TN;
	Fri, 30 May 2025 12:17:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKyeH-00000000VzS-1Sb7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 12:15:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D31616F2;
	Fri, 30 May 2025 05:15:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78BF93F673;
	Fri, 30 May 2025 05:15:41 -0700 (PDT)
Date: Fri, 30 May 2025 13:15:29 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	Ulf Hansson <ulf.hansson@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] pmdomain: arm: scmi_pm_domain: Do lazy init as part
 of probe
Message-ID: <aDmhYZydu5UlTxF1@pluto>
References: <20250530103527.2244951-1-d-gole@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530103527.2244951-1-d-gole@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_051545_431760_30362B95 
X-CRM114-Status: GOOD (  25.50  )
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

On Fri, May 30, 2025 at 04:05:27PM +0530, Dhruva Gole wrote:
> Optimize the SCMI power domain driver to only initialize domains that are
> actually referenced in the device tree. Previously, the driver would
> initialize all possible domains up to the maximum ID, which could lead to
> unnecessary firmware calls and longer probe times.

Hi Dhruva,

this in general mostly fine to me.

> 
> Key changes:
> - Scan device tree to identify which power domains are actually referenced
> - Use bitmap to track needed domains instead of initializing all
> - Only perform state queries and initialization for referenced domains
> - Maintain proper array sizing for power domain framework compatibility
> - Keep full provider structure to support late binding
> 
> This optimization reduces probe time and unnecessary firmware interactions
> by only initializing power domains that are actually used in the system.
> For example, in a system with 100 possible domains but only 3 referenced
> in the device tree, we now only initialize those 3 domains instead of
> all 100.
> 
> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> ---
> 
> Hi all,
> The approach of doing a lazy init was briefly proposed in this [1] 2024
> Embedded Open Source talk. It was also brought up in the monthly ARM
> SCMI meetings that take place and it didn't recieve too much opposition.
> 
> This greatly helps to improve the boot time, and I have some data to
> back this up as well. This[2] experiment was done on a TI AM62L SoC
> (which is yet to make it upstream) to measure the time taken in the scmi
> pm domain probe function when it does a full 0..N scmi pd init vs just
> the ones being used in the device tree.
> 
> If you have any feedback on this, please let me know. If not, I will go
> ahead and post a "non-RFC" patch assuming everyone is mostly on board
> with this. Also request other SCMI consumers to test this out as much as
> possible to see if it breaks in any situations.

I'll post a few minor remarks on the upcoming non-RFC.

Thanks,
Cristian

