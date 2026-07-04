Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB6C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 06:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twxwYxRmy/ED6kdut27R9zoWYJZWRuovBYug6VGDQO8=; b=Y5rNOov90T410UM8U+VDYrWemN
	Lds26xPNAHukkXdVXZsUXHsgyipsap32UQyxrC6lJJvl/WiISrNAxJeNCp3HMKwD+KTwS+KFFsIJ4
	mG6hCnYSfbtn1L3DqtWezksXebdSrAiLiWnZKdmFiO6Mkt0/Pbn8r36iu9mIxjkUgMt8WT222z854
	oOBaqY5YnAV4Qi+n3EgTeYFrClxXwU4OpdmeyNvdU7TpaJ8tqPol9MWkHE1X0SyDylmlzRNPhUQD0
	aJ8/amQkF+aoxEApuq/spnohusghPWzXCs4KFZE3qWLaYWV6K99xoU3CiExun/HWXm9wpVanYHudS
	croOEBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfuL5-00000008Eoa-25jK;
	Sat, 04 Jul 2026 06:58:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfuL4-00000008EoQ-3Mq3;
	Sat, 04 Jul 2026 06:58:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC53A600AF;
	Sat,  4 Jul 2026 06:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E577E1F000E9;
	Sat,  4 Jul 2026 06:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783148336;
	bh=twxwYxRmy/ED6kdut27R9zoWYJZWRuovBYug6VGDQO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zTghH1S2R3TvjyyEYlf5+GkKS1W4kHPJyIzBYOknmXCccDaU6p7Kg7GlMNw1gbN0o
	 OJ9XFwBMS2wWs+sjpcEwz3GRSTfIzyIMUHV32MitbmYkzqCkRqRv5HNXm2evY5KE/f
	 fjA7h3jO1Su11fdyuKp1UHhVq7wXgTD9A5F2YYXw=
Date: Sat, 4 Jul 2026 08:57:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:MEDIATEK USB3 DRD IP DRIVER" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:MEDIATEK USB3 DRD IP DRIVER" <linux-mediatek@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] usb: mtu3: allocate phys with ssusb
Message-ID: <2026070400-radiator-plaything-c266@gregkh>
References: <20260703220308.294247-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703220308.294247-1-rosenp@gmail.com>
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

On Fri, Jul 03, 2026 at 03:03:08PM -0700, Rosen Penev wrote:
> Use a flexible array member to combine allocations. Slightly more
> efficient to have a single allocation like this.
> 
> Add __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: add max() call to prevent negative values.

That is NOT the correct solution at all.  Please do not just throw away
error values and assume all will be fine.

greg k-h

