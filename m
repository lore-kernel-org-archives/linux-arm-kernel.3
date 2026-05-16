Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAE0CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9CUaNuUHTduFtdY4JuTJyBwqK5u0AptG917h8AsQ7M=; b=VPxU3pgLG5iu4w/ZnWT4OIEHOY
	dsm160PTIEdYQDWe0FtFQWzzDl7/oJ/jWri+G/1p58AiMeApGNVn5vfzuijMHQTHoVKeI3EdxciGf
	M6xbtw6AfCeh2Sxz0mmTe2KM3T6udjkD+kCbOqXcLb9sHnExFpMzunheKfNPHTEjQBAWJ5pB23ulY
	e8Sf2wzVAq3gastIbCxBUGgwjgAcuVBiejnzc2wU8oRpgnEVUNqflWFXGCgo91Lz6ebuyMNg4ZaEn
	AwWsZ4H03pQ/VW9K2i/FdcJBnM8ficyhI7gKApHMDks7AIYbVg44++Fbo4CW8o3xyKzaPcAB55abK
	RfQgyklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBCs-0000000AUJ1-3tb7;
	Sat, 16 May 2026 09:21:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBCr-0000000AUIn-2AeW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 09:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7475560138;
	Sat, 16 May 2026 09:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA68FC19425;
	Sat, 16 May 2026 09:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778923272;
	bh=RptzUI/9dLkuw+X2YVD/z/myI/ty916as3fpPLYgGAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jz7wK0GGMPUK9P9chAnahfGDsKfQrsotbIj4xw3k9+dtLr7Tt/K6vft7Vlw79il/w
	 6CcJRtPsPh1bRiPFYNQZB6/Bwv/lzN4PE/3KVmqy/kFCPqwaJLQZQv+dYSIgrEIgcu
	 AJW1aXCKHHPsePjCHluoNwc3X8Sg8rBP+9rWE9ws=
Date: Sat, 16 May 2026 11:20:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, shawnguo@kernel.org, hcazarim@yahoo.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via
 sysfs_emit_at()
Message-ID: <2026051656-corral-edgy-290c@gregkh>
References: <2026051633-doorstep-sequence-6782@gregkh>
 <20260516090726.38362-1-sozdayvek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516090726.38362-1-sozdayvek@gmail.com>
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

On Sat, May 16, 2026 at 02:07:26PM +0500, Stepan Ionichev wrote:
> On Sat, May 16, 2026 at 09:15:54AM +0200, Greg Kroah-Hartman wrote:
> > This is a horrible sysfs file, and breaks all the rules.  Why not just
> > delete it and use the proper api for it instead?
> 
> Yeah, fair. The sprintf change just papers over the real issue, which
> is the interface itself.
> 
> Quick check: no Documentation/ABI/ entry, github code search returns
> nothing outside the kernel tree itself
> (https://github.com/search?q=scu_wakeup_irqs&type=code), and
> codesearch.debian.net also shows zero hits. So removing the attribute
> looks doable.
> 
> Frank, Sascha -- any out-of-tree readers of
> /sys/firmware/scu_wakeup_irqs/wakeup_src I should worry about?  If
> not, I'll send v2 that drops the attribute and logs the wakeup source
> via dev_info() instead.

Close, but no, don't use dev_info(), when drivers work properly, they
are quiet.  Make it dev_dbg() so that if anyone wants to see it, they
can dynamically turn it on.  Or make it a debugfs file.

thanks,

greg k-h

