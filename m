Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C811FC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+XPCcsxlxHhn+gNhWT0KKVmDZdRlsAx4uqcAXqWp/k=; b=G9MDV59y2nHC55z6ePpGUwKTRb
	fvjUR71yv0t87jmVX5UDbnOewW2i/7/4Xk9l5QU58A8ueiZjA/pGBNj3lUK19L4wWdHCrYJnGgVwX
	L8JNrqdU2W1/ygCQRA8QtGuUh6oJEf/ESZ5z6ttUCCJm2rKcugrdqUsMF+vFQ54Myoqbmag17MZ/3
	N2FYg58CBCTb5Rd9XV1ugvxxCW9wd8vtAIfM2AHAcmDRbJ/EV32TfhF9LptDmzuZ2ZQ5ABrYgcC+s
	NNA9brGAFaLq9THqNfMhteYu340LkE798Jdr8BHBpY3DzK4xp2b1VZWNRS1AyjzRDDwYnx2Ub7Pl6
	RLaKBSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSSV-00000000RK2-0wt6;
	Thu, 13 Aug 2026 10:14:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSSS-00000000RJJ-1WBH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:14:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D500314BF;
	Thu, 13 Aug 2026 03:14:36 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AB203F632;
	Thu, 13 Aug 2026 03:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786616080; bh=U15xNbiafg66CEIzVRlypK8u3rfXnTp1g65n4DJvfbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRwRbjBfKkbTekiHhgSHDee8iScOP7hLExYevoXGPxybcmXHsShvqyZ+n4Q1QtEz5
	 mUeoHoDZtuh/SyWCFDteMoc3Ll5a7OYCVoiYaZ7ECQgr+vO8kxFpeynNlNrZ359z0k
	 f+qqeNwpXN/5jj5Cc4D49oJoWzpEMRZd6kE/a10M=
Date: Thu, 13 Aug 2026 11:14:28 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Roland Dreier <rolanddreier@rivian.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Protect xfer->async_done with
 xfer->lock
Message-ID: <an2ZBM0LGFT139j3@pluto>
References: <20260812224311.904964-1-rolanddreier@rivian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812224311.904964-1-rolanddreier@rivian.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_031444_522551_2F40859E 
X-CRM114-Status: GOOD (  11.95  )
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

On Wed, Aug 12, 2026 at 10:43:05PM +0000, Roland Dreier wrote:
> Asynchronous SCMI commands are completed by a delayed response. The RX
Hi,

> path signals the response with complete(xfer->async_done). Unlike

[snip]
 
> 
> -- 
> *CONFIDENTIALITY NOTE:* This electronic message (including any attachments) 
> may contain information that is privileged, confidential, and proprietary. 
> If you are not the intended recipient, you are hereby notified that any 
> disclosure, copying, distribution, or use of the information contained 
> herein (including any reliance thereon) is strictly prohibited. If you 
> received this electronic message in error, please immediately reply to the 
> sender that you have received this communication and destroy the material 
> in its entirety, whether in electronic or hard copy format. Although Rivian 
> has taken reasonable precautions to ensure no viruses are present in this 
> email, Rivian accepts no responsibility for any loss or damage arising from 
> the use of this email or attachments.

...not so much to review with this footer...please drop it an repost

Thanks,
Cristian


