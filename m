Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5736DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iY93uillYbAEhypGcfpV06of62CUSSszqpwzg+3qJo=; b=ZK6kFPKWXRyp+QTjCsF+p/ZotZ
	tIWiOBlcz5cFsTtkF6uBUKj9rBAzOImfIxRi41MxGtAGlCTTCEWmhQpc7prnlOSQw8DL3Nu/Kqvbi
	uWsa/yAWfEO0lVG+I6p5y58gv56TSYrMZ8ATjOJjV4NvZ1QrU70sM+18F3ZiUAWTrxrYoUUyB/CQ4
	k+S9r+Vi4qXec+ApLRB462U5O6Z12/X/R7dHBTkqwXllW3pZYO8Qd53aK8IbTEEqIYMJbbzDXNaox
	/P7dtgEppWBFq3sMpudVeP6xmKmaWx2iDV2PhnRL01H3HIXAp1KFSyYNtbrPRGMGoLqUi1oIfesE2
	e1gLA1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunFK-00000002Gxx-32oY;
	Fri, 14 Aug 2026 08:26:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunFI-00000002Gx7-3iPN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:26:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E751A1BCA;
	Fri, 14 Aug 2026 01:26:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E89C3F673;
	Fri, 14 Aug 2026 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786695990; bh=0iY93uillYbAEhypGcfpV06of62CUSSszqpwzg+3qJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXFzW5dzsEtfZGFilJ2knhAROo6j21UJgk5LcCLF7uiW2VIaNDMl6GwxWziQI8cBa
	 Hjz0fGc+78RS3pD9uKuFza9mWYD266FKd8ExynCRS96xTU/+HIjdA81fJrgNvbuljY
	 jngJicUpB73C9n9Wq7Qzpsd+C73Cg9mQtSS8lOvg=
Date: Fri, 14 Aug 2026 09:26:23 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
Message-ID: <an7RL_mTsznZjeIQ@pluto>
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_012633_007803_A8195235 
X-CRM114-Status: UNSURE (   7.74  )
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

On Fri, Jul 31, 2026 at 10:49:31AM -0700, Alex Tran wrote:
> This series refactors the SCMI pinctrl driver to eliminate metadata
> getter callbacks to be replaced with pinctrl and pinmux generics
> provided by the pinctrl core.

Hi Alex,

I gave it a go at this series on an emulated setup and with these
changes I get:

root@deb-guest:~# modprobe pinctrl-scmi
[   15.329932] scmi-pinctrl scmi_dev.4: error -EINVAL: Failed to register functions
[   15.330259] scmi-pinctrl scmi_dev.4: probe with driver scmi-pinctrl failed with error -22

...not debugged any further.

Thanks,
Cristian

