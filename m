Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC3BC71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oQngts444u5p1/hneswhsBtdl7/imSNCCyJjMcoNX4=; b=TwXRLjXtw/fBp4AYHYSq6LZb/Z
	DOKt/KUUYUpODHA55Bz0/5oMtyJJjW8zy/DP8m341EJXMHTykc95tBICN96ycDoOrs2ExgaZWMAsY
	HIDeTeMJv+0Ur7HGbYBiOlP9rWqkmywoQ3TdGr7MorC/ahitqFwFr0TcvRzICwOXJDb3BDQDKH5gK
	VxH2y3eLT71BvEIKnT+MUtuTS7eJylafK6ey68/BfKsfbGeNSTh1ALjnfmHTOkn3EmK2ydN/Kagug
	7iiO7KJyZUXVGppgvt2sf48+FGNvGPuaXH47dmyUF3X3yfbFiDgIjrhJeFCAKOjcgYihTTP0fJjXh
	P4gADe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNPI-0000000APEy-23SS;
	Wed, 11 Jun 2025 15:30:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKOK-00000009pUD-3Q97
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:17:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E0FC15A1;
	Wed, 11 Jun 2025 05:16:56 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CBAB3F673;
	Wed, 11 Jun 2025 05:17:13 -0700 (PDT)
Date: Wed, 11 Jun 2025 13:17:11 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/3] firmware: arm_scmi: perf/cpufreq: Enable
 notification only if supported by platform
Message-ID: <20250611-cherubic-solemn-toucanet-aac5af@sudeepholla>
References: <20250611-scmi-perf-v1-0-df2b548ba77c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-scmi-perf-v1-0-df2b548ba77c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_051716_897111_68B272BF 
X-CRM114-Status: GOOD (  13.08  )
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

On Wed, Jun 11, 2025 at 03:52:42PM +0800, Peng Fan (OSS) wrote:
> PERFORMANCE_NOTIFY_LIMITS and PERFORMANCE_NOTIFY_LEVEL are optional
> commands. If use these commands on platforms that not support the two,
> there is error log:
>   SCMI Notifications - Failed to ENABLE events for key:13000008 !
>   scmi-cpufreq scmi_dev.4: failed to register for limits change notifier for domain 8
> 

I wonder if it makes sense to quiesce the warnings from the core if the
platform doesn't support notifications. I prefer to not add if notification
supported in all the protocols.

If the interface can return -EOPNOTSUPP(equivalent to SCMI_ERR_SUPPORT),
the caller must handle it appropriately(i.e. continue if it can handle
absence of notification or propagate error).

Cristian, Thoughts/opinions ?

> If platforms not support perf notification, saving some cpu cycles
> by introducing notify_supported ops.
> 

Sure, makes sense to improve where ever possible.

> While at here, patch 1 is a typo fix when doing the patchset.
>

This one looks OK.

-- 
Regards,
Sudeep

