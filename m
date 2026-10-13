Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E4BCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGN8I51EsiCeoMuqdEJrefdQGvxBjSECOZmfLFe8Da8=; b=bkoyxH/HCNxFH8qenfkgaN0gbY
	h3cyf2vtpN1MAVRFOCKPjuM2Ucby+d6QbWbrEUYPDWFNC5fiN9AWjfqFnzawbEr+NURrky1zvVE8T
	qhvJg8PcFmXVe0Du8IGpmgkOclAF7FG1YoB37OWS6qNqIJ7ZCANuhRQxMUDw5HLyCVp47Q7kFIM1k
	ruyaSoxMeaDJD2JTgmyaJf6cWWo4DeetW5fNKZlbAp5Y6SX2gcq4G1ykYxzZAPxfH8Q5dD+DBRV3W
	lBuLhdy9Oohb5lj34OioHblPCAXOKjBCsAxVkJ04x/IXDYQXHSaThKhay1VG+69U686pOFQy+yXKp
	cznEDctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX0m-0000000CDv2-27W4;
	Tue, 13 Oct 2026 07:33:24 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGX0k-0000000CDu9-1nF5;
	Tue, 13 Oct 2026 07:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791876802; x=1823412802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NzspRS2hDrJsjAe8AK0YYi1dL16p14T9VINuEY50WDA=;
  b=bFRfs8gFtJYPRvsEwQnkjIiT6kZygTHZrKXXIbugGiOQQnYj3Sep/8+l
   s99BKD7zOaivQFrXhQ6N9zm0o9uS/u6i9E84L/uZ+Dc+VAfCxUOUCpOSY
   DFIT4XEYsVSHdoVJO+1A3HRKDs618nMZKQdSkZYOwmnPEE8dhQ/kDCBEv
   zSuyuIOmDB73AULfA9AvKUeNxIQ1j2swOeD5JHCEvx+m/2/02TfSgGpEp
   oRmLmw3nnEnhVRv3UpHlievPG/4ujN9mmPLTh9W9HJfhLMB8Uh7H2wl/A
   xTBEyw41v2vuINTqixuzSJirhZSuOAb1W22TDuXczU8O2n9POxroZuYMr
   A==;
X-CSE-ConnectionGUID: YCTLMrwZQe2fcjiuEFjbXA==
X-CSE-MsgGUID: VmF+icJyQriCJXe5U0K/og==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="479793"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="479793"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:33:21 -0700
X-CSE-ConnectionGUID: xXh+qmemSsK620RE9vOEtA==
X-CSE-MsgGUID: vIyL18cTQ/SYvrImMz4a5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1193790"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:33:13 -0700
Date: Tue, 13 Oct 2026 10:33:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-parisc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 6/6] serial: 8250: make port operations work on struct
 uart_8250_port
Message-ID: <as3etnbZatn4sbfx@ashevche-desk.local>
References: <cover.1791873876.git.jirislaby@kernel.org>
 <c59fa203f325e0fe7601ea0fbc0d222c8b37f9eb.1791873876.git.jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c59fa203f325e0fe7601ea0fbc0d222c8b37f9eb.1791873876.git.jirislaby@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_003322_554275_A70D70CB 
X-CRM114-Status: GOOD (  29.25  )
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

On Tue, Oct 13, 2026 at 08:48:51AM +0200, Jiri Slaby (SUSE) wrote:
> serial8250_register_8250_port() returns a line number and the other
> port operations (serial8250_unregister_port(), serial8250_suspend_port(),
> serial8250_resume_port()) accept it. Many drivers then convert the line
> back to the port using serial8250_get_port() anyway.
> 
> Switch the interface to struct uart_8250_port:
> * serial8250_register_8250_port() now returns the registered port, or
> an ERR_PTR() on failure.
> * serial8250_unregister_port(), serial8250_suspend_port() and
> serial8250_resume_port() accept the port.
> 
> Convert all users accordingly. Drivers store the port pointer instead
> of the line number. Several drivers kept a private struct only to hold
> the line (airoha, dfl, em, fsl, ioc3); these are dropped and the port
> is stored as drvdata directly.
> 
> This also fixes two latent issues:
> * For a CIR port, serial8250_register_8250_port() used to return 0.
> Callers stored this as the line, so a later unregister/suspend/resume
> operated on ttyS0. Now the CIR port itself is returned.
> * 8250_acorn checked ports[i] > 0 on removal, so a port registered as
> line 0 was never unregistered.
> 
> There are no more users of serial8250_get_port() outside of the 8250
> core, so drop its EXPORT.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

Why not having Ilpo's Cc in the below list?

> Assisted-by: LLM
> ---
> Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@kernel.org>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: Ray Jui <ray.jui@broadcom.com>
> Cc: Scott Branden <scott.branden@broadcom.com>
> Cc: Al Cooper <alcooperx@gmail.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
> Cc: Thierry Reding <thierry.reding@kernel.org>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org

> [v2] include err.h (Ilpo)
> ---

...

>  	seq_printf(s, "%7s: /dev/ptp%d\n", "PTP", ptp_clock_index(bp->ptp));
>  	for (i = 0; i < __PORT_COUNT; i++) {

What about

		struct uart_8250_port *uport = bp->port[i].uport;

here and use it accordingly in the below code?

> -		if (bp->port[i].line != -1)
> +		if (bp->port[i].uport)
>  			seq_printf(s, "%7s: /dev/ttyS%d\n", ptp_ocp_tty_port_name(i),
> -				   bp->port[i].line);
> +				   bp->port[i].uport->port.line);
>  	}

...

>  	for (i = 0; i < __PORT_COUNT; i++)
> -		if (bp->port[i].line != -1)
> -			serial8250_unregister_port(bp->port[i].line);
> +		if (bp->port[i].uport)
> +			serial8250_unregister_port(bp->port[i].uport);

Since it takes a pointer now, make it error pointer and NULL-aware

	if (IS_ERR_OR_NULL(...))
		return;

there. With that being done, all this redundant NULL-checks will gone.

...

> static void serial_card_remove(struct expansion_card *ec)

>  	ecard_set_drvdata(ec, NULL);
>  
>  	for (i = 0; i < info->num_ports; i++)
> -		if (info->ports[i] > 0)
> +		if (!IS_ERR_OR_NULL(info->ports[i]))
>  			serial8250_unregister_port(info->ports[i]);

See my point?

...

> static int aspeed_vuart_probe(struct platform_device *pdev)

>  	if (of_property_read_bool(np, "auto-flow-control"))
>  		port.capabilities |= UART_CAP_AFE;
>  
> -	rc = serial8250_register_8250_port(&port);
> -	if (rc < 0)
> +	struct uart_8250_port *uport = serial8250_register_8250_port(&port);
> +	if (IS_ERR(uport)) {
> +		rc = PTR_ERR(uport);
>  		goto err_sysfs_remove;
> +	}

You can get rid of these {} by using PTR_ERR_OR_ZERO(). Also do not define
variables in the middle of the code (it's only allowed for auto cleanup
variables and for-loop iterators).

...

I stopped here, I believe there are many similar cases which may be amended in
the same way as pointed out above.

-- 
With Best Regards,
Andy Shevchenko



