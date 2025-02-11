Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C767CC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IshRt1fPZYUKU6G7/Vm5SXYDrTy4xIR0gMLECXxQfS8=; b=xT5CyKVQxB59iOcsSOBlUz0bUM
	yp4WiadxiQjEpeIgjVDL2vQZoBjpSIexOXTcbX9tgkTFtDkp3hgMd2SP3J6+1i84ZSDVcgUAP4YCz
	+vuStmojtuNPnT8mLZHWfwFg9i1Llgdr7YkCoBP3GrUllpPGCt67Cmtzfn2I7TPCoe/yc7hv3a22C
	chFQ1VcaxWDBdC9Lb1Q8qnDHNJA7YuJ9yo8ZjYoq17ajfmGhwR5/6A0aPpxztzl6JLxcIkPkNuHod
	pzktNdK6g62op0ccmcV7TOvz4WEk/rfiH5Hrar+nfnoZ6HvjAPsqXgcLNruD1RsQUdWT1H+Vdbhed
	XqzqSy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thk6G-00000002kI2-0cQD;
	Tue, 11 Feb 2025 06:50:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thk4p-00000002k23-37Fx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7F547A400B8;
	Tue, 11 Feb 2025 06:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55321C4CEDD;
	Tue, 11 Feb 2025 06:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739256538;
	bh=ZHfx+4Nv96WH3hNik5d0XW8kD3MVsgqww7n4KBECW7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubx07InaSxuiNjrbv0nXqqcL+taMxCjmOs+JENNvSFnOJYYXF6EcHOVS+nyRyvug6
	 jzwU6N9eAdOVDYezckWtKBO1sCEKi4WcOh9GgJM6gZXRPkAtz/mrWbSlGfVVwQsn6f
	 poFZXXp3CbTWEjppHBkTxxGTUjxj2Rsde4AEO9/0=
Date: Tue, 11 Feb 2025 07:47:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v2 09/16] nvmem: microchip-otpc: Avoid reading a
 write-only register
Message-ID: <2025021146-rope-angles-df16@gregkh>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210165050.496486-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210165050.496486-1-ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_224859_857162_2EFFC2C5 
X-CRM114-Status: GOOD (  18.78  )
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
Cc: devicetree@vger.kernel.org, Ryan Wanner <ryan.wanner@microchip.com>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 05:50:47PM +0100, Alexander Dahl wrote:
> The OTPC Control Register (OTPC_CR) has just write-only members.
> Reading from that register leads to a warning in OTPC Write Protection
> Status Register (OTPC_WPSR) in field Software Error Type (SWETYP) of
> type READ_WO (A write-only register has been read (warning).)
> 
> Just create the register write content from scratch is sufficient here.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
> ---
> 
> Notes:
>     v2:
>     - Add Fixes tag
>     - Remove temporary variable usage
>     - Reword misleading subject (s/writing/reading/)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

