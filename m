Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB245D0C61B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbquxhEPXmo7FFtZ3hwObv8VJWZk+IW7/8bXuYfpc8s=; b=Xa3osNk89KmQZwAN4JCvEvifYU
	97pwrNqEzIG+Z5alCuev5OYUFRItEOIEkO/k2p0DP6Odhaa7s1V8keOwJ+YY+o19lzAst89kVMh/d
	rc+MQYtLqCpmU8XVhCd0rSnig9XNhgb7+KkwklWsJaZZvQMOa6tZw5KpAKCuTteyq7p8Xb3++lgBq
	Udq8M1g6vMsAzEoYO+3qztFAsBJG8xv77sO8z/6I8T4YgxuGnITvbx/Koqe8d1ZiTOu17SYenhJVz
	JUEWl89BEZsMjRa8Lnbe9bBGBrsDGwZCg8pO5zYr97tQZDLnjmB1udFyNO8VkknjhgB7RWlxm0F1C
	tPt4yDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LR2-000000042ez-0LCa;
	Fri, 25 Oct 2024 14:37:04 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KvW-00000003vUO-1oG5;
	Fri, 25 Oct 2024 14:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729865071; x=1761401071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vykQeynThE6u8FAc/pLYpmAljLUA5z/Z2yEelFtBZ+w=;
  b=SOJYOtEejWu+zpDHnECBkMCai1Xquyz7Ps1ulDqKw+lVK/niDPuceyBE
   rZbTGjt167mCjiT2XugHVGdhWQN77UL/tq4QSSfkGcziINR8o5DE/dJpv
   t4LoQficrQhQqDt2wAIxUmYHqryxNtEX/vxpa2jrJ5+sWCBlGSEaevceg
   +0S9MsS0Z2jKAQDPxWE1VMSMQ2H9mk9kqnSqoSiZmKOX2LJ5uynDtFiGe
   8QfK225LWQMb3bUopNdMgoa0uQM1bB+7fpxodRnlcKRi5cn1vrj79vbdl
   meOksuePVhbCSBvfObcVnTVaMHYyzbHgc21DzS7H4S//ZlR84Aki3f9dK
   Q==;
X-CSE-ConnectionGUID: Utk4ItDtSJOd2UGVnN/txw==
X-CSE-MsgGUID: Y1DM9EXJQxmu0oMvfyoAeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52089959"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52089959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:04:29 -0700
X-CSE-ConnectionGUID: HLP2qWM+QlKxHT0e7YHuZA==
X-CSE-MsgGUID: BT54Y1PtQKOx3Qk7It9WkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="118380276"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:04:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t4KvK-00000006vxH-0VKX;
	Fri, 25 Oct 2024 17:04:18 +0300
Date: Fri, 25 Oct 2024 17:04:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Esben Haabendal <esben@geanix.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Stefan Wahren <wahrenst@gmx.net>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Ronald Wahl <ronald.wahl@raritan.com>, Udit Kumar <u-kumar1@ti.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rengarajan S <rengarajan.s@microchip.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH tty-next v3 4/6] serial: 8250: Specify console context
 for rs485_start/stop_tx
Message-ID: <ZxulYcgH1kTyx9Kr@smile.fi.intel.com>
References: <20241025105728.602310-1-john.ogness@linutronix.de>
 <20241025105728.602310-5-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025105728.602310-5-john.ogness@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_070430_559853_3E8923AF 
X-CRM114-Status: GOOD (  15.02  )
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

On Fri, Oct 25, 2024 at 01:03:26PM +0206, John Ogness wrote:
> For RS485 mode, if SER_RS485_RX_DURING_TX is not available, the
> console write callback needs to enable/disable TX. It does this
> by calling the rs485_start/stop_tx() callbacks. However, these

It would be nice if you be consistent across the commit messages and also
provide the names of the callbacks in full, because I dunno if we have a local
stop_tx() or rs485_start() or whatever the above means.

If it is "the rs485_start_tx() / rs485_stop_tx() callbacks.", it's
much clearer for the reader.

> callbacks will disable/enable interrupts, which is a problem

toggle?

> for console write, as it must be responsible for
> disabling/enabling interrupts.

toggling ?

> Add an argument @in_con to the rs485_start/stop_tx() callbacks

As per above.

> to specify if they are being called from console write. If so,
> the callbacks will not handle interrupt disabling/enabling.

toggling ?

> For all call sites other than console write, there is no
> functional change.

So, why not call the parameter better to emphasize that it's about IRQ
toggling? bool toggle_irq ?

-- 
With Best Regards,
Andy Shevchenko



