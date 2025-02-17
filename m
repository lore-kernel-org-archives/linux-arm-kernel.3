Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CB7C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAGtuSGnAJbFIWye4akCd27rqLw9hT82QDxjef7qsU8=; b=wAMIA0J1Ylr35w+PA4yD8jgouh
	3MkFAhHI/pLdH0/0D8tm2bS89ADBcMaxVg/IcGPThZ3Tpmq9sedkJy70T2DFpT/4mj/PxXQax9xR3
	oobR2y6bGdm42+08nNyihstkjkjcNOOxpBxuVfBHB4r0307Mp4HrRFqHf19xiWt2hIe5GTeQmXh5r
	ohwzy0TjYjEOVl0FvyU6MCblSq5pUCu62kuoKFT1z/dFRviywvKFXWRh7A0mqDs8oiZ0uMhngFTJ1
	FUBjZUBskpe/UreYg2t19DQNKlpa3jt4BDZEjB/X15RkmpQjwgSyyraNkeFhwtK0dLNnZ1STraGL2
	Cgt9H5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2Gl-00000004tOZ-0C1b;
	Mon, 17 Feb 2025 14:38:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1tO-00000004nt6-2UGT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:14:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66C82152B;
	Mon, 17 Feb 2025 06:14:57 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D37D3F6A8;
	Mon, 17 Feb 2025 06:14:37 -0800 (PST)
Date: Mon, 17 Feb 2025 14:14:34 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/18] firmware: arm_ffa: Framework notification
 support + other updates and fixes
Message-ID: <Z7NESuOgFZBSxgR-@bogus>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
 <20250214113628.djl7uq6kpwut7yax@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214113628.djl7uq6kpwut7yax@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_061438_670909_F0A0729C 
X-CRM114-Status: GOOD (  20.25  )
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

On Fri, Feb 14, 2025 at 05:06:28PM +0530, Viresh Kumar wrote:
> On 31-01-25, 11:24, Sudeep Holla wrote:
> > This bundle of changes mainly have FF-A framework notification support
> > along with other minor updates and fixes.
> > 
> > It adds support to allow multiple UUIDs per partition to register
> > individual SRI callback, to handle Rx buffer full framework notification
> > in particular and general framework/interface to extend in the future.
> > 
> > It also adds support for passing UUID in FFA_MSG_SEND2 which improves
> > the multiple UUID/services per partition support in the driver and
> > an helper to check if a partition can receive REQUEST2 messages or not.
> > 
> > It also improves cleaning up the partitions by adding unregistration of
> > the devices as well as handles the presence of host partition in the
> > partition info.
> > 
> > It also contain fixes big-endian support in couple of functions:
> > __ffa_partition_info_regs_get() and __ffa_partition_info_get().
> > Big-endian support is still not complete. Only these changes can be
> > verified at the moment without any additional application or testing
> > support changes.
> > 
> > Regarding the FF-A versions, it upgrades the driver version to v1.2
> > and rejects any higher major version than the driver version as
> > incompatible.
> > 
> > It also fixes the mis-alignment with sync_send_receive{,2} function
> > prototypes.
> > 
> > It replaces UUID buffer to standard UUID format in the ffa_partition_info
> > structure and fixes a typo in some FF-A bus macros.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> Tested-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks!

-- 
Regards,
Sudeep

