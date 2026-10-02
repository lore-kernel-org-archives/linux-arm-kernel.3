Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A20CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElvCQz9IYbz+BJxp9eo1Z5bEYL8XU0GKr6zST1/WuR0=; b=F7pZZiquw/bKxj64n8BWDS1MH3
	OZrSWaBhwISPq0KN9JyxUsQ3BPxniHjRtSoarcPecESCVAfeXbzy191wGscYeGKX69cfZ5Z7w9ay4
	P4JaBXJo6MDbaQZVGPMF3LU95Eyj2F4Dxf52bBEmLEcw9ZR3MW314ga1Y84xT1W9ogjJGxVlE4Ed7
	etn6I+Lo/XX8RWA78gpQzFDQjdLpxrdhT/IIF36mnOPYdexTW2h5vSFvus8BStw9PtCz22Z0LTOgZ
	ed0KDME9LeU5s+sj7IMvU00CqKXWo1Zxco6DA+nhVd1AqK3r1OQH+vdZdb3HkMyiRFmaP2sPh7rUN
	saoTI5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZ0V-0000000B2VU-3UyB;
	Fri, 02 Oct 2026 08:52:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZ0U-0000000B2V8-0hgK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:52:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46F2660A6A;
	Fri,  2 Oct 2026 08:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11A01F000FF;
	Fri,  2 Oct 2026 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790931161;
	bh=ElvCQz9IYbz+BJxp9eo1Z5bEYL8XU0GKr6zST1/WuR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sg/y24rRAcEXOhQRX8+aKshGrVMw8+4m9vNZEP9K5iFQrTKLW4ZLuPHs9+sv+9msv
	 O1N1itY/xt9lsgDyQqHRzIJ5SsVySeboTU3exeOYAQJGNGj369euUwm4ldyMkzqIqT
	 3K82DO85lc332822y3Xp3wSZkrJIwz19cMj4Y/RSusL+SButTyfeNR41JvhHsz331r
	 o7QOhXGirmwgGDC9sP4RHvYvbU9Sx81gVs1cRkqrSlO2x6VL6SRbkqo7jXq99GUcrX
	 Ux4TXXY/qbU2FW6HLPTK/49qZLOVFO8RBi+8u5xVcESjn3cIe7zeR8slNIkTfh1weh
	 6UXtOh5mg0bbg==
Date: Fri, 2 Oct 2026 09:52:37 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reset: scmi: Set the device for the reset controller
Message-ID: <20261002-statuesque-blond-hog-fe0388@sudeepholla>
References: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002084142.1570378-1-hayashi.kunihiko@socionext.com>
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

On Fri, Oct 02, 2026 at 05:41:42PM +0900, Kunihiko Hayashi wrote:
> SCMI reset driver does not set rcdev.dev when registering its reset
> controller.
> 
> If rcdev.of_node is not available, the reset core tries to obtain
> the firmware node from rcdev.dev. However, rcdev.dev is also NULL,
> causing a NULL pointer dereference.
> 
> Set rcdev.dev to the SCMI device.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

Worth adding fixes tag IMO

Fixes: c8ae9c2da1cc ("reset: Add support for resets provided by SCMI")

Hi Philipp,

Can you please take this in your next round of fixes and/or updates ?

-- 
Regards,
Sudeep

