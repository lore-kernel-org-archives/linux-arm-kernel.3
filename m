Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA45C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItNu1IwQe8CD/McymhLAu11EHOEWUNt+AkAM5QImpm8=; b=YCA3qkHf4irPwzjWGGnufRtwX8
	JykAz24CKK8XJ2zBYfTb0X3b+qm7rR4i6IW5mjtc1V9/ot2nLx0KD2ghO58AgJSGmrrp6m673fQNQ
	7+2DyfCyFn/4sKGDv/xoNLjxTbLZTpogWwxX5IWvHyTheiSjZ9jexgr2J4+1yvlzPEcgIfb8IBgkW
	kwDFgh19Zqg1oIrZA5kdvSkyPiv4sN1gSEUpTjiQ0aAVw38ZsvOaGzhOK0iTQ2cNCZ7RAekZo/ZI4
	LOjyYi1cn999ggxXul/oxX0AYjZ+gfEZVs+RKftbAEKUUeUxvycEHEDu3zRJtFAN3pemyhcQB5DjR
	8Ccoc19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2v9-00000001FMU-40xg;
	Fri, 30 May 2025 16:49:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2dY-00000001BtV-1L0C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:31:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA0ED1424;
	Fri, 30 May 2025 09:30:58 -0700 (PDT)
Received: from bogus (unknown [10.57.47.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE6813F673;
	Fri, 30 May 2025 09:31:13 -0700 (PDT)
Date: Fri, 30 May 2025 17:31:08 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] pmdomain: arm: scmi_pm_domain: Do lazy init as part
 of probe
Message-ID: <20250530-honest-chital-of-growth-db31e1@sudeepholla>
References: <20250530103527.2244951-1-d-gole@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530103527.2244951-1-d-gole@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_093116_408404_8730B0CE 
X-CRM114-Status: GOOD (  21.83  )
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
> 
> Key changes:
> - Scan device tree to identify which power domains are actually referenced

How do this work with runtime DT overlays ?

> - Use bitmap to track needed domains instead of initializing all
> - Only perform state queries and initialization for referenced domains
> - Maintain proper array sizing for power domain framework compatibility
> - Keep full provider structure to support late binding
> 
> This optimization reduces probe time and unnecessary firmware interactions
> by only initializing power domains that are actually used in the system.

Why is this very specific to power domains only ? This must apply for other
domains like perf or clock or reset ?

> For example, in a system with 100 possible domains but only 3 referenced
> in the device tree, we now only initialize those 3 domains instead of
> all 100.
> 

Well, how much of these PD will get used in the final products ? I can
understand the need to use just 3 in devel platforms. Just trying to see
how realistic is the scenario ? Is there any other optimisation possible
from the firmware ? Does getting the state of a PD takes so much time
on the platform in question ?

> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> ---
> 
> Hi all,
> The approach of doing a lazy init was briefly proposed in this [1] 2024
> Embedded Open Source talk. It was also brought up in the monthly ARM
> SCMI meetings that take place and it didn't recieve too much opposition.
> 

Sorry, I must have missed that one.

-- 
Regards,
Sudeep

