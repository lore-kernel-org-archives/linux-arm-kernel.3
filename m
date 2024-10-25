Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC446D0C614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZapW75ypvRpkQehjf/3RN5BV82NVlV9d38g6oberKM=; b=ItinIcOfH5YlngcxTkv62DrYXt
	Wx4fm5pdVPR25Ji17w/Zc5mQp401YkSJ40DdGajIm6gwtzud47ufzKYyP16FuQ+LmHIuaCOg5GtMR
	JR5GBx+Y0pW8NzhyTi6J4rCcICJ5JEAnPzYqtwvPlqqqnQUChKVcQzVOmDI0LHdy914kbRnZQAAUf
	tHEI5k0tLCEQk2KbXia90WpTL3FuFb6M/8o/yxUd2QqpR5U4AFLPwTs5TrrYRdvORfV1dKy7nMgdu
	Sprms7PF/fk6qq8laRkgMwMZ5KeIPYrAJKBNoCBsSPslnQfvl3m0P9ylm9vaSE/LKTxDbQG7MDUGD
	qWt4zQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LHa-000000040iY-1KGA;
	Fri, 25 Oct 2024 14:27:18 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kpb-00000003uQS-2g4I;
	Fri, 25 Oct 2024 13:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729864703; x=1761400703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6VuCN7L4Lvp32KsLOP8nEDd2sa9hW4SN48lK8/qBOs0=;
  b=UCIL1LN7CnUH9BJYX+xY7mtTwH2/gEQmkbJO6PdyRFDx9v2/l6iRGsLY
   8w3p6dBsm6FIuZNHGvmYyr3f1lYTR46LSuTgxAWzGjNkszywAKxn0WwBm
   6kRUZWV+WQVJLsnTyMHtSdp1vQDu1TUor8qV0+SlHEA9y8/45BHowY7mu
   7iGmqkVIPsV7ZWzIQJmwYeR3Um+cX3J87QTgzNiooKjWVROESf31A2Re/
   AWZFZ7oVby8JzTK8L8+Xa1Ax5idcIW5fjj16rEcm8lJse4syBNBIEz2o+
   xEDxZvZpzS46OBsdKY8M4UNCyQw+KZzd16X1v+HSRCs98azpWvfSZjdlm
   g==;
X-CSE-ConnectionGUID: TJb53rmCR/+nw8owt5T18w==
X-CSE-MsgGUID: WcZhBGEMS/uUAD8LSiyRog==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33230989"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33230989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 06:58:21 -0700
X-CSE-ConnectionGUID: w88ZmuEJSkyVWZn3ToWBVw==
X-CSE-MsgGUID: eUoBHrpMQXOmX3CvFN8APg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="104226092"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 06:58:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t4KpO-00000006vs3-1f5j;
	Fri, 25 Oct 2024 16:58:10 +0300
Date: Fri, 25 Oct 2024 16:58:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Esben Haabendal <esben@geanix.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rengarajan S <rengarajan.s@microchip.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Wander Lairson Costa <wander@redhat.com>,
	Peter Collingbourne <pcc@google.com>,
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH tty-next v3 0/6] convert 8250 to nbcon
Message-ID: <Zxuj8rFQikEjr2gR@smile.fi.intel.com>
References: <20241025105728.602310-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025105728.602310-1-john.ogness@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_065823_741191_3B405EA6 
X-CRM114-Status: GOOD (  19.62  )
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

On Fri, Oct 25, 2024 at 01:03:22PM +0206, John Ogness wrote:
> This is v3 of a series to convert the 8250 driver to an NBCON
> console, providing both threaded and atomic printing
> implementations. v2 of this series is here [0], which also
> contains additional background information about NBCON consoles
> in general in the cover letter.
> 
> To test this version I acquired real hardware (TI AM3358
> BeagleBone Black) and tested the following modes:
> 
> RS232
> - no flow control
> - software flow control
>   (UPF_SOFT_FLOW, UPSTAT_AUTOXOFF)
> - hardware flow control
>   (UPF_HARD_FLOW, UPSTAT_AUTOCTS, UPSTAT_AUTORTS)
> - software emulated hardware flow control
>   (UPF_CONS_FLOW, UPSTAT_CTS_ENABLE)
> 
> RS485
> - with SER_RS485_RX_DURING_TX
> - without SER_RS485_RX_DURING_TX
> 
> The tests focussed on kernel logging in various combinations of
> normal, warning, and panic situations. Although not related to
> the console printing code changes, the tests also included
> using a getty/login session on the console.
> 
> Note that this UART (TI16750) supports a 64-byte TX-FIFO, which
> is used in all console printing modes except for the software
> emulated hardware flow control.

Thank you for the update.

I am going to review some patches at some point, but what I want to say here
is that if you have a new functions to utilise something, please also check
if the rest of 8250*.c may have an advantage of. It would reduce churn in case
if your series already exports APIs or provides inliners for such cases.

-- 
With Best Regards,
Andy Shevchenko



