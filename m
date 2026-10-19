Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5E8CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OTDn3FWCzGLjmwPJc3E1qKtb/Hvkb223pzi7vRYRaU=; b=drr8ESowqX7XJrL9a/r8ceRaQA
	prfp3yCZ2SVw3IR4vaNFNuKgR01mo15BSpEsxBnWW0hEEtg0w7nBffseSTkYUAIEi9mK/P+5jbjrs
	9WTx+ZjIQoJ2x8FtCNUUWWFj8I+5kZ4/2O52+jjv317cG1WF1kISBZbCxSFuI6Q8rEBJeCqDu+lzy
	lqD02iusEYxi2PBJHgsZZtuXZYgQxSDMcDk/I+wQXefI2uRn3t4rorLK8Don+rHRGJVFLSyVZnwpE
	Jw6+/hbSDvmP5NRHokFnzhU54Q2CfVJgdFuusAIFkrNIwU6COc/9JGO0wyhHYvLESo90HZZHoxomp
	IHXyTTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiUW-00000006qVL-1EZ2;
	Mon, 19 Oct 2026 08:13:08 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiUT-00000006qUr-0CEn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792397585; x=1823933585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OpxKsY4pQMxWXG5ginCdqOe1JmpLsqB7ew68KaUuqRc=;
  b=EymBeA/rf1WQZ80KV/bdeF2t9x7XgbHPsmgjvEv4OhugMC3J6AFhJCGr
   7/ik2CIYa+DgYzP4F9OD6wGIJSKo9YxNL9oF+Bb88IiYWHBdi6yzXI18k
   bhPcaJ0AqoORdJyNUzqGXEZhFOkSC66xharhdLU+R/PvsKgTy5LVxViGb
   L92QkpqDYMBAkk/D3TXa4sO9aD+kYjU5PcsGHGlVe/reZeTSfVpL8YRFj
   ZfyXaoHDw9m+khtan5jDtGPAb9bT0N4fL4ZaU+/HSbp4vsq+cet+2RvMS
   y9HJWo7rHEHsUZHKVIEv+dBX3NwCpf8lDe1AwQCQU86YpPhTNPdMfmKHY
   A==;
X-CSE-ConnectionGUID: PWzi+SvnRmKI9DX4ZfxBvQ==
X-CSE-MsgGUID: jQa2LyoXRBOUJbNvmEFtpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="944082"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="944082"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:13:02 -0700
X-CSE-ConnectionGUID: P7yLX90wTAyjhQhKT6K14g==
X-CSE-MsgGUID: J7SAvJEoR5mx5tic2JqxOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4321776"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:12:59 -0700
Date: Mon, 19 Oct 2026 11:12:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Message-ID: <atXRCJjQGcSKZ_X3@ashevche-desk.local>
References: <20261016130328.1037616-1-arnd@kernel.org>
 <20261016124839.0d5564f7d7e036ee782a0486@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016124839.0d5564f7d7e036ee782a0486@hugovil.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_011305_123546_E4EFF596 
X-CRM114-Status: GOOD (  14.23  )
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

On Fri, Oct 16, 2026 at 12:48:39PM -0400, Hugo Villeneuve wrote:
> On Fri, 16 Oct 2026 14:59:47 +0200
> Arnd Bergmann <arnd@kernel.org> wrote:

...

> >  	switch (up->port.iotype) {
> > -	case UPIO_HUB6:
> > -		outb(up->port.hub6 - 1 + offset, up->port.iobase);
> > -		return inb(up->port.iobase + 1);
> > -
> >  	case UPIO_MEM:
> >  		return readb(up->port.membase + offset);
> 
> Maybe change to a simple if/else?
> 
> 	if (up->port.iotype == UPIO_MEM)
> 		return readb(up->port.membase + offset);
> 	else
> 		return inb(up->port.iobase + offset);

While it may work, I would still leave a possibility of the default case, but
Ideally this should be a simple callback level change, so it will be checked
only once at the probe time or so.

...

> >  	offset <<= up->port.regshift;
> >  
> >  	switch (up->port.iotype) {
> > -	case UPIO_HUB6:
> > -		outb(up->port.hub6 - 1 + offset, up->port.iobase);
> > -		outb(value, up->port.iobase + 1);
> > -		break;
> > -
> >  	case UPIO_MEM:
> >  		writeb(value, up->port.membase + offset);
> >  		break;
> 
> Similar here:
> 
> 	if (up->port.iotype == UPIO_MEM)
> 		writeb(value, up->port.membase + offset);
> 	else
> 		outb(value, up->port.iobase + offset);

Same here, see how we assign the respective callbacks in the 8250, for instance.

-- 
With Best Regards,
Andy Shevchenko



