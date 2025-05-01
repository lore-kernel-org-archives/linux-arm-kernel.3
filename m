Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4D1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuwbnLUmLsNgADGlP2nutgwWH5INbtXkPxxT2I8/K3g=; b=Gwdfoexdkq3Bq+dw5YVW0k/OEi
	6AeOVmtmmpqb8nkT7zsFIcTCzIQK6Tz0ARikIqLhWWahhtOQr6T4837OFPYpP+It8XbmrMbmiiVdr
	r4nrdlLlzb03RD7eZMy2/IY65wHr9u3QO4zidi822x+KKeENgEM1yzx2lsxxUIiY3nkTUZUBeuZif
	pgiW8kHfwP+9IHWn/rvuznWKY7pCzBgtJThfsq6ANzuQ0ptHCRdd5s6Q9KwiugF4aJLrR2KIOibLS
	WpS0y2ICRhJWqs/GBLINEEj0vFaGooWikxyn5HA9P/DdzSYtDm/4gewElrNY69w7PW1PPOWy8khVn
	OeiS1yzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAW1I-0000000G6Lf-44Hc;
	Thu, 01 May 2025 15:40:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVzO-0000000G6Ar-0viv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40BFA44C55;
	Thu,  1 May 2025 15:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01E2C4CEE3;
	Thu,  1 May 2025 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746113897;
	bh=XFFOTdP/3i3niIEuMBBcyJrNjW1QjuABGAb6m1NknNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQFf8QFkg9xartG2fb/Sf2lau8ALekMhViwng4WjSIJTupiajzvvSwtZgcOsf2DvD
	 rhglop+yqL0FI6xBMktUYIVWiBLuSUnXtWsAqeszyAPDi7HaqGCghkFjK7X9ZCgukN
	 cpNzYesEMP78VqIWrU7yz4T3EwhBHE0vYXawsOLI=
Date: Thu, 1 May 2025 17:38:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, stable@kernel.org
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Fix NPD of usbmisc_data
Message-ID: <2025050100-getting-curler-88aa@gregkh>
References: <20250422185601.80199-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422185601.80199-1-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_083818_287169_75BAFF45 
X-CRM114-Status: GOOD (  11.81  )
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

On Tue, Apr 22, 2025 at 08:56:01PM +0200, Stefan Wahren wrote:
> The commit 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device's
> refcount in .remove() and in the error path of .probe()") introduced
> a NULL pointer dereference on platforms which have no usbmisc_data
> (e.g. i.MX28). So add the missing checks in .probe() and .remove().
> 
> Fixes: 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device's refcount in .remove() and in the error path of .probe()")
> Cc: <stable@kernel.org>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Does not apply to 6.15-rc4 at all, can you rebase and resubmit?

thanks,

greg k-h

