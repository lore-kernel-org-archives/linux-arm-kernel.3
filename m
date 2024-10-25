Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26120D0C61F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/ywLeMkkzQzLZSpngNjiaNdAW5tMuTEEp9hvn8FDLI=; b=gF6r4GXhUNUeRxb1lFnGEYlhcp
	SS8DQ+3TpL1kIfA9PvjXDXyPJEdE0T/gBVx3EtpqS9ZrGW07KOc0cNg2x1Uw6dDw9HllwphZzzaiq
	P38HzQi/kFHtijA9QjAgg+E6dDg8i2Yzg/of1Sk+kPQI05WoA7KMBTzb+YEqgag21pPi587tCOUDY
	0MDOBSEoXFqo2lpiUPqScLRxxd5DKgr0OpZbWIz71qG77PCcumd43iuFZmRm5b/lXzLGAQsgMDGeJ
	GsvD2PRXHOwfNKF0CrWpMZqm9y4WvFPnCAOBrcfjkooYpOUUEeQuNNENxwMWmkjQfHGue2L6epvZ7
	4oWCYCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Lqn-000000048OP-0otH;
	Fri, 25 Oct 2024 15:03:41 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LOq-000000042N4-20iL;
	Fri, 25 Oct 2024 14:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729866889; x=1761402889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7viiuER8jbmujoSNmtJXcCtGTp3mpZ8PS5MMH/KdKno=;
  b=C/yvd5GvyCyAhR4+DJq4bSB1rApRZ8vnwUC/L00kPxrABdgvuYfuRoEc
   DWHFyneRzPrWzA2SxEKKE4Q+7S6cCegsGcgAlTk1rTAfcaiM5+QxmQF35
   kylqX//AbbTfWzmERxf+3CMKmuGuggoGLSfNR5shjPkzodVuhau1Tpsc7
   lLXOenY3Nrz8GPYPjAXa2IxHEqRuVsRTrEWlt1gBlTFyY3CANcg4JkmZ7
   hGVK5Qc3LGKC4b1EnGDNu1GT+WnjNHDX46p1b7esQ635vaEAiMNKZc1Nk
   NyaQiDL+5Cr3Jr/EfdpB4nJ4Ss0vFlEUXfpDcJ3tG4k9wXdeJSqO4JNJ+
   g==;
X-CSE-ConnectionGUID: V0206GHtTaCDo4ujKP/QAA==
X-CSE-MsgGUID: Sj/s1KIMRpW270rxMJ6XJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40642758"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40642758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:34:45 -0700
X-CSE-ConnectionGUID: byLy1efMTj6exO2UKV5Ynw==
X-CSE-MsgGUID: 8C37kqSxTve1124j9dGQhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="84889931"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:34:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t4LOc-00000006wVK-3qoB;
	Fri, 25 Oct 2024 17:34:34 +0300
Date: Fri, 25 Oct 2024 17:34:34 +0300
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
Message-ID: <ZxusemBwE8t9cAZ5@smile.fi.intel.com>
References: <20241025105728.602310-1-john.ogness@linutronix.de>
 <20241025105728.602310-5-john.ogness@linutronix.de>
 <ZxulYcgH1kTyx9Kr@smile.fi.intel.com>
 <84v7xg2rb2.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84v7xg2rb2.fsf@jogness.linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_073448_600845_1B7EB21C 
X-CRM114-Status: GOOD (  19.55  )
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

On Fri, Oct 25, 2024 at 04:31:05PM +0206, John Ogness wrote:
> On 2024-10-25, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> Add an argument @in_con to the rs485_start/stop_tx() callbacks
> >> to specify if they are being called from console write. If so,
> >> the callbacks will not handle interrupt disabling/enabling.
> >
> > toggling ?
> >
> >> For all call sites other than console write, there is no
> >> functional change.
> >
> > So, why not call the parameter better to emphasize that it's about IRQ
> > toggling? bool toggle_irq ?
> 
> Currently there are only 2 users:
> 
> serial8250_em485_stop_tx()
> bcm2835aux_rs485_stop_tx()
> 
> The first one toggles the IER bits, the second one does not. I figured
> it would make more sense to specify the context rather than what needs
> to be done and let the 8250-variant decide what it should do.
> 
> But I have no problems renaming it to toggle_irq. It is an 8250-specific
> callback with few users. And really the IER bits is the only reason that
> the argument even needs to exist.

Maybe toggle_ier will be better than? I haven't looked deeply into the
implementations, so choose whichever describes better what's behind it.

-- 
With Best Regards,
Andy Shevchenko



