Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A71FCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/0HmZCFvx7+L2jdTJYvTNKMrLPWK349J+QyxyxwZns=; b=kg2ukR8ZGwwP6H/ur/bPEN3uAQ
	fDlZaygO//XLhc3rEr9HWvTS8jbSOE3f4SNA1HFoy/fAPWjAC4f0sX8VlYJpD9XeEgOGy/ZMWoAgK
	lLK41Dw+cZr7t0mN+TiuOxR4NUxfLedUfVCiC6ipxt+wp/Of2ySRoeKr7tpFwqh0WQwJwTNygNwgV
	kEJiWIsekNygeCqG0bfe50SCLdQ4juXLQHr2ZB4LaRJ76CAeZ32iGE2UfuZkztfxL5qr0LvvSBM02
	WNg8XaZqIzQU+DkXG5GX8SAl5OcsMiX0ajTlPDa6/4553WTJu22QeV0vSVCQ2kWrwsZmX1tI71QoG
	+7eNEosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2sO-0000000GfGu-2jaO;
	Thu, 21 Aug 2025 10:50:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0M4-0000000GBsV-305N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:09:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C9F1515;
	Thu, 21 Aug 2025 01:08:55 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C97A83F63F;
	Thu, 21 Aug 2025 01:09:02 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:09:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/7] firmware: arm_scmi: move boiler plate code
 into the get info functions
Message-ID: <aKbUHFQhhmrKCgZ8@pluto>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <7a47cf3d-05e1-4702-87ef-cb7f36f03149@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a47cf3d-05e1-4702-87ef-cb7f36f03149@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_010904_790694_7C8FD65C 
X-CRM114-Status: GOOD (  17.09  )
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

On Sun, Jul 20, 2025 at 02:38:35PM -0500, Dan Carpenter wrote:
> This code to check whether the selector is valid and if the item has
> already been recorded in the array can be moved to the
> scmi_pinctrl_get_function_info() type functions.  That way it's in
> one place instead of duplicated in each of the callers.
> 

Hi,

> I removed the check for if "pi->nr_groups == 0" because if that were the
> case then "selector >= pi->nr_groups" would already be true.  It already
> was not checked for pins so this makes things a bit more uniform.
> 
> I also removed the check for if (!pin) since pin is an offset into the
> middle of an array and can't be NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

...has anything change in this commit from V1 ?

Asking because there is no version-diff and you did not pick up my
Reviewed-by tag from V1, so I am wondering if there is anything to
review or not..

Thanks,
Cristian


