Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A54DC561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQfXRtcYf0xL3teECrHsF4YFPeJ2ZSOxgi8RaJwgZZw=; b=lgbY6ZuYQ9BYo4uglpJHghDLq7
	ZC37SIuKQLMDPrJMTGE2uBuLg+4lgOshO8ju9aBaV2k8778w02fhWxWZPL4TcvlKVeycNqAMeU69I
	1Rp/7uE7jsjH+mHVsF1zYFZV0Vre+3o7D3XKrqPAwp+neRCPNwpG4CK4StOSgNWBCR0hnrCmRBmab
	7pVG6ms84GNgTZUQRfmlVVrRip+ZuJFLjD5RF5W9aZPsPe/HN648QRt3X4RngVZTM/7b5NA7PJ6k5
	+OZjwuSVencVgmSwLrz73zmcW4J3Xfb/pEAa8/n6zSQiKm4uTq0PzAYxQmmvbuqrH6xNXJd8QTtMr
	hNHYuk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs87-000000056Qn-3ekF;
	Thu, 06 Aug 2026 07:03:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrs85-000000056Pe-3by5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 07:03:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2718D60AA1;
	Thu,  6 Aug 2026 07:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577AD1F00ACF;
	Thu,  6 Aug 2026 07:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785999779;
	bh=IQfXRtcYf0xL3teECrHsF4YFPeJ2ZSOxgi8RaJwgZZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IOslL54Ij39YUZ75iJi9qQ+YerTH+e1PSUakw0jhP4uzWy+8SeV/PzWDr73glZNaA
	 6jUSUygHJdd4qxWTrwclajPXChJmHKffdF0xirolSYpI4y5ri3N3188A/HaiB8TCvF
	 36fT3VimjLQSqOJzyMzi8xCzrKkHF24YVS/IHxGA=
Date: Thu, 6 Aug 2026 09:02:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: phucduc.bui@gmail.com
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER from
 IRQ lookup
Message-ID: <2026080623-repressed-griminess-e3fe@gregkh>
References: <20260806065254.28204-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806065254.28204-1-phucduc.bui@gmail.com>
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

On Thu, Aug 06, 2026 at 01:52:54PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>

All lower case?

> Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
> re-probed when the interrupt resource becomes available instead of
> continuing probe without an IRQ.

How was this found and tested?

thanks,

greg k-h

