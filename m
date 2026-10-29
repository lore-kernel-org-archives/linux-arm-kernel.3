Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A621F606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VvKJt2P9;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dlIRY8iS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EgkPHMHLTM0OJa/gTROG+9KF0iCc6Eu3UkCLei8s4MQ=; b=VvKJt2P9PFoM/Nogc/q6VdoHzi
	owAFWbIE0b9cIovBSihTa/ir6/LOpqOPGYU7zuWP9DrG9tCRBsQxhK0AwvsxVQVTZsmu6f/pCnxtl
	Cn5D3uz+UeP88s2TEgik8qBkyxRU38yi56enXXPyrPKmx+oIlpIiW8rQXoazRuIVIj5jVQ3K5C4tC
	FhseIyRaE1QiUPBTgNOCw/9nvU02Zl8saEOy1BHDuj9BFfUthXLlFE3ok6R/7C9s81821xFaPZVqM
	LV1ABQsX8WbQMr1PgbYJ6NPAq1hb+hsRzkyPjJ+XdvilbST8J9sA49qxZYNdk3EH8kYJm2EMiTigv
	lfVpMrIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMR1Q-00000009Vos-2FJy;
	Thu, 29 Oct 2026 14:22:28 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMR1N-00000009VoK-281I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793283746; x=1824819746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MgJL8MuqM9l4uyQAiqFvrF6SdMQF/UIm279xyhJToOY=;
  b=dlIRY8iS1DJ2slP1XCUIw1hcqo6Aody7JXuUZMIIpKcXRs7owuXSkQqw
   QCdHAL7PwunsGk8cWs0SXevjSgTKj1l5pzgdNk0tD0t0A/KxPn6Byt4E8
   Q1P0FmJHqU1cawWYejfQHPieXgfdCUOSEPXWxCI6nJnb4dSoExO0J31gP
   0p2IpHEwURUDNudtYcf+LY/pkwDsLKUxopvtKj5+sRnECBsaHitir1PM0
   JliV+sKXycQoCiZojf6JJ/qDFhDQC2imct9ODanlUMLYReg0AYVkJPMiI
   qhL05ODt3wjCuKBxogwGi++3rIJNltYEiPkpVrGHO+GHldpGDs4Vdp+Qm
   A==;
X-CSE-ConnectionGUID: 4pd1HQX0TM+okELrDp0vjA==
X-CSE-MsgGUID: xnWAOoYkQbu6ZAxX193K+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1925617"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1925617"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:22:24 -0700
X-CSE-ConnectionGUID: yr/uZ8XsRG2FWMf2URIasA==
X-CSE-MsgGUID: egHmc43mSROKoKZDsLbkbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5261220"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:22:16 -0700
Date: Thu, 29 Oct 2026 16:22:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
Message-ID: <auNWl_thBnE8JqBE@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_072225_590715_6C71F79F 
X-CRM114-Status: GOOD (  21.41  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 01:37:01AM -0600, James Hilliard wrote:
> The generic RX timeout path pauses a transfer, copies its data and
> terminates it asynchronously. Clearing rx_running at that point lets a
> new receive reuse the buffer and cookie while the old callback has not
> yet run. Inspecting the new cookie cannot distinguish that callback from
> the completion of a new transfer.
> 
> Reserve the receive buffer until a worker has drained the canceled
> callbacks. Keep FIFO access separate from callback retirement: after a
> successful pause and termination, clear rx_running while rx_terminating
> prevents another descriptor from reusing the buffer. Deliver the paused
> data before allowing the interrupt handler to drain the FIFO through PIO.
> Normal retirement only releases ownership and leaves subsequent receive
> handling to the UART interrupt.
> 
> Preserve the normal completion-path LSR read and gate DMA resubmission on
> the receive interrupt enable, so stop_rx() prevents another transfer while
> the status read retains its existing side effects.
> 
> Reject new flush work and PIO receive handling during shutdown, including
> late Intel MID DMA timeouts. Stop and drain retirement work before freeing
> the channels and buffer. Once RX has stopped, allow the idle flush used by
> DesignWare LCR recovery during shutdown. Clear the shutdown guard before
> startup configures the UART and tests its interrupts.
> 
> Check pause failures before accessing the buffer. A successful pause is
> the quiescence guarantee, even when a provider still reports IN_PROGRESS.
> Also accept DMA_COMPLETE after a failed pause: completion can stop the
> channel before its callback acquires the port lock, leaving nothing for
> the provider to pause. Retire that completed transfer normally.
> 
> A failed pause with an incomplete cookie is ambiguous: hardware may have
> finished while its completion interrupt is still pending. Canceling that
> descriptor can discard the entire completed receive buffer and switch
> permanently to PIO. Retain the transfer and retry pause and status in the
> worker, with receive interrupts masked to prevent a timeout interrupt
> storm. The worker copies only after a successful pause or reported
> completion, then terminates and drains the old callback before reuse.
> The pending-pause guard keeps callbacks from copying or resubmitting the
> transfer concurrently. Retries sleep outside the port lock and stop when
> shutdown takes over. A provider which never pauses or completes retains
> RX ownership until an error or shutdown; a timeout alone cannot establish
> that discarding the buffer is safe.
> 
> On DMA_ERROR or termination failure, let the worker stop DMA before
> handing the FIFO to PIO. Keep the requested enables in the existing IER
> shadow and filter hardware writes during pause retries and recovery,
> including termios, RS485 and overrun-backoff changes. Apply the current
> enables after retirement so stop_rx() and shutdown remain effective.
> Hold a runtime PM reference around worker register accesses and keep RX
> on PIO until reopen after a confirmed error.
> 
> Abort the DesignWare idle sequence when RX cannot be stopped. Allow
> the empty-FIFO timeout workaround once DMA has released the FIFO, including
> while callbacks retire. Exclude FIFO resets during RX DMA recovery. If the
> provider still cannot terminate the channel in process context, retain
> its buffer and leave receive interrupts masked.
> 
> For OMAP, publish the shutdown gate under the port lock before the final
> RX flush and interrupt masking. Take the RX DMA lock inside the port lock
> in the completion callback, and serialize the runtime-suspend flush with
> the same order. Drain the UART IRQ before releasing DMA state so an
> in-flight handler cannot retain up->dma across its release.

Can this patch be split to smaller logically isolated (to some extent) pieces?

...

> +++ b/drivers/tty/serial/8250/8250_dma.c

>  #include <linux/tty_flip.h>
>  #include <linux/serial_reg.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/delay.h>

When adding a new header to an unsorted block, try to squeeze it the way that
you get the longest ordered chain (yes, interleaved with some unsorted
elements, but still).

>  #include "8250.h"

-- 
With Best Regards,
Andy Shevchenko



