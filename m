Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0425CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pgg2mLehIG4sW1T+6g2YquviHKO39IVuKuCo2yGa6ec=; b=L/3EBvQ2hbRb0YGSIC/aowjfZ0
	36/u6dW2KeZuzo+5aTDRK5b052CicqoykB0tBH0QxGKpdq9d/rg7IYV2QI0mUzmZoFssIjO/hRwRc
	+C84XYSqqTkmTz01RBjUBxoBGTXprLDjc0h1k2Wp2Nxp6GFDonE/bS0OeezsCiODvg58az5BKehX9
	a6bpxN9EyY6DanwolL3VSBcRKZlV4kfN98FODr+/bpSp3njm7yumZnEUi4eiQrpPBFeQOSIe3uWv/
	AXuxeVajk83J4iFXYjkvtnOdj8TfG5qLbdMJIKIElW+io+2BiCqtr2cXNkMtl206jE2QhB0dDTEQr
	c6+Re2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwtp-00000006crb-1sCo;
	Tue, 10 Jun 2025 11:12:13 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOw38-00000006Tdr-0fh3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Pgg2mLehIG4sW1T+6g2YquviHKO39IVuKuCo2yGa6ec=;
	b=jG12wcnhget0oYtzN2fj4tLvRJetIqjOpBoGVKmuIbqv8rcHUCsfvHsqh9zDyO
	tXh5wa75Egbi9zPJFsL3SN8TZ5c6SXffLIWMIruvnmn8ni7LjSRCKekefFo0GAJp
	SENzwVIxKPLZLaWicytt7ptq20dmOOj0A3PsFr3EVqA9U=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHnk8wBkhoU2NXAA--.14402S3;
	Tue, 10 Jun 2025 18:17:22 +0800 (CST)
Date: Tue, 10 Jun 2025 18:17:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: John Ernberg <john.ernberg@actia.se>, Xu Yang <xu.yang_2@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEgGMCCdO3rc6Dkg@dragon>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain>
 <20250610021243.GA1610560@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610021243.GA1610560@nchen-desktop>
X-CM-TRANSID: Mc8vCgAHnk8wBkhoU2NXAA--.14402S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWfXFWfury8Xw47Cr45ZFb_yoW8Ww1fpa
	yakw4fKw4DtrWYyFnF9r1xta4jkan8tr45CrZrJ345Za43u34Sqr4xKry5K3WUGr13uw1q
	vr4jqw18CrnruaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um_M3UUUUU=
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBK5H2hIBjIyvQAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_031746_564996_EF399A09 
X-CRM114-Status: GOOD (  15.15  )
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

On Tue, Jun 10, 2025 at 10:12:43AM +0800, Peter Chen (CIX) wrote:
> Like Alan and Xu's suggestion, there are probably two problems here:
> - When the system enters the suspend, the USB bus may neither at suspend
> nor disconnect state if USB controller/phy's power is not off and VBUS
> is there. So, the host still considers the device is active, it could
> trigger transfer any time. If the transfer occurs during system resume,
> the USB controller triggers interrupt to CPU, and USB's interrupt handler
> is triggered. If the USB's hardware is still at low power mode (or clock
> is gated off), it may cause system hang (CPU gets error response from USB)
> after access register.
> 
> With Shawn's change, it pulls D+ down during the suspend, and the host
> is notified of disconnection, so the host will not trigger transfer
> until D+ is pulled up by calling usb_gadget_connect. The USB leaves
> low power mode (and turn clock on) before that, the access register
> will not cause system hang.

Thanks for the input, Peter!  It's very helpful and well explaining what
I'm seeing here.

> - The current chipidea driver doesn't notify gadget driver when it
> enters system suspend routine. In fact, during system suspend/resume,
> the controller driver may not respond middle layer's (network) request 
> well due to it enters low power mode, so calling usb_gadget_driver->
> disconnect (composite_disconnect) is needed during controller's suspend
> routine, it calls function->disable for USB function driver and
> ends/stop middle layer process.

This problem can also be addressed by Xu's suggestion, i.e. calling
gadget driver's suspend hook from udc_suspend()?

Shawn


