Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67CCC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a63fT7bhSuMldjdZ7yO3VP+InN5D2IzEf3aLPGv6ixM=; b=RRuK6pGf1z3EI8RiqkiAhPefS2
	v05quHZoc/7HfQWjKiM73ZibUo7rHV0fFmwEhb96vYWbwAIbSPE+LlgVsfZ9bpERbKPK2XVGAUt3U
	pmjN4Wkj3y/WGtp1Mlc7sCTKL67vb6P2Tp6ELQcCD7clyCCpNK8vgmgkiepCZ/w/i2JN5Aev4oR/t
	9K/jU97KdMIuIFDjthUsEU4xhJDBA+a0WdGwtgJGU3IiAB7LqOC7k1SMIf1c2NI6cFjGtRiLn0joN
	4+aX9aQs/zNMVrKzgwXobby3ttpmrAJZ0gfD+D/J3chdCdyAvMJsvi41rLyP4dTrN5U19gJQokQnW
	b7tYMjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSzs-00000008VDj-0uEq;
	Wed, 09 Jul 2025 11:29:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRQD-00000008BMk-124v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 09:49:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4F281655;
	Wed,  9 Jul 2025 02:48:48 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FF443F738;
	Wed,  9 Jul 2025 02:48:58 -0700 (PDT)
Date: Wed, 9 Jul 2025 10:48:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Use modern PM ops
Message-ID: <20250709-olivine-macaw-of-rain-94cb43@sudeepholla>
References: <20250708-arm-scmi-modern-pm-ops-v1-1-14bc9c352888@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-arm-scmi-modern-pm-ops-v1-1-14bc9c352888@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_024901_362820_4FBBBA23 
X-CRM114-Status: GOOD (  11.89  )
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

On Tue, Jul 08, 2025 at 04:19:50PM -0700, Nathan Chancellor wrote:
> When building without CONFIG_PM_SLEEP (e.g., with hexagon or s390),
> there is a warning because scmi_system_power_resume() is not used due to
> how SET_SYSTEM_SLEEP_PM_OPS is defined:
> 
>   drivers/firmware/arm_scmi/scmi_power_control.c:363:12: error: 'scmi_system_power_resume' defined but not used [-Werror=unused-function]
>     363 | static int scmi_system_power_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Use the moderm SYSTEM_SLEEP_PM_OPS to resolve the warnings, which is
> what SET_SYSTEM_SLEEP_PM_OPS ultimately expands to, so there is no
> change in behavior.
> 

If it is OK, I plan to pick [1] which additional uses pm_sleep_ptr()
to avoid additional warnings.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20250709070107.1388512-1-arnd@kernel.org

