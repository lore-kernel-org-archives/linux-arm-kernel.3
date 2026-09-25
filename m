Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A9CC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIEvTG1E/6K4iV46NsQPQYrjluXsxkDyVkbKJN2nwsk=; b=DqKDHpb7Iix8NEz2/Xr13jTE1k
	FQchPDu7KMohywPFvl+7DwJzkV2SdTHqjqpnSaskh5N9i3tXwzPDudDMJWdygB9dwAn9fqRvfYn4j
	/pZbhfCa+MfdKqj8m0mMl+CL+Rl1WmtqgIECXsusdOzKFgs09pDD42/BEl82VACd5iOGlpYelej4D
	3W/pMxkAueyEVBImSUk6vYpjcRWKHxKWPkjaY949w3lwW6N5uv+SzDkl9gK5+zXsmgOCyzD/KtaK4
	0ml4IbLYsCQ0JPan3ajQXW7t1B8AXYz1y2r9EdpvqkNbKhNmX2dpJKsaj7LyfqpcKdza3H6Qq8LeA
	xdTcM7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA67f-0000000DSxE-3b69;
	Fri, 25 Sep 2026 13:37:55 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA67d-0000000DSwW-3Bdu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790343473; x=1821879473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=no8+looG0WsomoDxrT8Jj4yE0i92R+oAVoUxuTXdUlw=;
  b=LT0orXYrai3yspv/zU0L6DRzCKM7mvFhavM3ZTOVISrwkSnj+vT0wST+
   qBo7/njJRt74tex6wJmnY48qIWk6VdSwqK6bAaPNE5mnkPJPd8QTg7CDf
   p66sGy7ywEWdbFfOmvoYavHNyIbIMblcOuUJtuLLr0dCYu7mRTxzqb0y7
   VLIXyS6wWdmbKWD8PsN7rY2ZINj7CarnMvla2nKe0a/PHU69zqR5Fw593
   iw0tt4F7zLOZCbr0begekQQTpQ7qXHBbwFhkKicWes3SjnD5ogiqZagxS
   +avhOO81Z1CwT60BgBHQEDkgTm8vrbeGMtbeFmCJMTxjdFzodL2uEglLe
   A==;
X-CSE-ConnectionGUID: cnSASVQYRKSI9mTtfXHzpA==
X-CSE-MsgGUID: xkcw3Np7QeWS1oUcNUbF2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101300674"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101300674"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 06:37:52 -0700
X-CSE-ConnectionGUID: LTl/mEoASz21F6/05k7vHw==
X-CSE-MsgGUID: QXWscqDORNukc7p06SItzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="279042879"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 06:37:50 -0700
Date: Fri, 25 Sep 2026 16:37:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Malathi A <malathi.a2000@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()
Message-ID: <arZ5KxIp55qA6UA7@ashevche-desk.local>
References: <20260917040511.103232-1-malathi.a2000@gmail.com>
 <97e4ab26-b147-4cf4-97f9-307903f14e61@socionext.com>
 <arUvJyvChXXcasSu@ashevche-desk.local>
 <3ea1f574-ddb5-46a6-9bc1-7a8ea84c54bd@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ea1f574-ddb5-46a6-9bc1-7a8ea84c54bd@socionext.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063753_836276_36E893D2 
X-CRM114-Status: GOOD (  25.32  )
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

On Fri, Sep 25, 2026 at 08:32:20PM +0900, Kunihiko Hayashi wrote:
> On 2026/09/24 23:09, Andy Shevchenko wrote:
> > On Thu, Sep 24, 2026 at 06:07:37PM +0900, Kunihiko Hayashi wrote:
> > > On 2026/09/17 13:05, Malathi A wrote:

...

> > > I'm a bit concerned about the error path in uniphier_uart_resume().
> > > The clock may have been disabled in uniphier_uart_suspend(), and
> > > clk_prepare_enable() can fail when trying to enable it again.
> > > 
> > > In that case, wouldn't devres try to disable an already disabled
> > > clock on detach?
> > 
> > Isn't there is a guarantee that the .remove() is called with PM runtime on

After reading a code of driver core I see that this is the opposite actually.
The PM runtime might be off.

> > and get, meaning it's called with the enabled clock? But if not the case,
> > we might use PM runtime force operations (resume and suspend in the
> > respective cases.
> 
> My concern was just the case where clk_prepare_enable() in the system
> resume callback fails, leaving the clock disabled before devres cleanup.
> 
> This driver currently only uses SET_SYSTEM_SLEEP_PM_OPS(), so I wasn't
> considering runtime PM here.

So, in such a case how do you see the scenario when system is resumed (Right?
Otherwise we can't do anything, like detaching driver from the device.) and
clock is disabled?

> I don't have a strong opinion on whether runtime PM should be involved,
> but if it guarantees that the clock is enabled before .remove(),
> that would address my concern.

-- 
With Best Regards,
Andy Shevchenko



