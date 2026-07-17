Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9C2C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIxX9V7ZlAsMS/XeKD1wi/ZYn+sJql2jlFMsVI+9BPM=; b=fwOk6oU+u+L8dH+7iI+AOcBR4I
	JSSLESfw6u++Q7zTJj4JmUPiRw4KVlJjGCxLqPtdgkykXwg64y/B/6IXriggmLWFzkNP6EVNY3xGx
	YCNS/aVet6iuxBnjXaZ/GnbWpNOmo3u7k/bszEO11Q6NzZICXET4XhkC0BFzk/IsJUPBtN/W4UtJc
	ZD63oS3FwL5w4bVG8EL94JtmN92ObTP43DNDwuMycNR+klo22pWlGAAQH798VWCze7XC2b3Hm/Hua
	OFne6rlGrifBjZFTbRef8HlwT0P/Wd49SI1V9H5YMpaEyN8bU6ouO8MLqtalS96xYB7xEjpXXlwH6
	Tcn3saqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjNf-00000002T6e-2okc;
	Fri, 17 Jul 2026 14:17:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjNe-00000002T6H-1hwu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:17:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 614D860A61;
	Fri, 17 Jul 2026 14:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8101F000E9;
	Fri, 17 Jul 2026 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784297853;
	bh=VIxX9V7ZlAsMS/XeKD1wi/ZYn+sJql2jlFMsVI+9BPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NHbIHiJ3lTzssQNHdOIzQJTQdEB38TrEtiK2yrcYfcOzlgTceZ+leLuT7FqXV6rOI
	 gsH3Xw/DRODI7bqEDiBYRi4TxjDwIFOLZOudv2GndE6GJhhMpNZPExHY4lDM2HO88V
	 DyGIUym4TcrjZ9UC4opoyWzF6nYSySk9V3eoQhDg=
Date: Fri, 17 Jul 2026 16:17:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH] char: mem: keep arch range checks overflow-safe
Message-ID: <2026071710-flanked-espresso-5b06@gregkh>
References: <20260625085800.4505-1-alhouseenyousef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625085800.4505-1-alhouseenyousef@gmail.com>
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

On Thu, Jun 25, 2026 at 10:58:00AM +0200, Yousef Alhouseen wrote:
> The generic /dev/mem physical range check now avoids validating
> addr + size directly, but ARM and SH provide their own
> valid_phys_addr_range() implementations with the same wrapped-addition
> pattern.
> 
> Use subtraction-based upper-bound checks in those overrides as well. Also
> make the ARM mmap pfn check avoid overflowing the pfn plus page-count
> expression.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  arch/arm/mm/mmap.c | 9 +++++++--
>  arch/sh/mm/mmap.c  | 4 +++-
>  2 files changed, 10 insertions(+), 3 deletions(-)

This should be part of the char/mem patch, right?

thanks,

greg k-h

