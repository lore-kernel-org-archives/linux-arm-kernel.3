Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D678C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b130bPAJHPNf/pKE6j8b+YefwbbZ9vGIzK3XSyiPhaw=; b=VlfeZHXJvUKh4IH2XKax/j1oQI
	3LIgdulvtho+ySGs6OxPY1IbcmQUGvQEXkv2dp40Aa2txG7ynfw9d3jjRthIxkp76HgVrI8gM0QpQ
	MHtfqGx8b5QpP3WjiwQ0lNtW2ZUrrmXUSunvvfR2BwzQ1iVonIi0INyPxbuf730yBxKpEbbcuROBd
	WGE84iOe9iRWU+9uzb/+zwWahE9JUXJ1jQgx3sTSYDW+AXTa8ZtjGt6PzltTkM+V49eko3Eby8cYE
	ZYU4N6lWMmu9JRwVfDbYf9qdoicLiukIeu51oCaswf6y5O3cJ3pfkiPFCwModwUeNqPrBH7VPkDpf
	0D+EKuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAQH-00000004vNG-22RW;
	Fri, 10 Jul 2026 12:33:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAQG-00000004vN4-0D00
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 12:33:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5573A40B53;
	Fri, 10 Jul 2026 12:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8271F000E9;
	Fri, 10 Jul 2026 12:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783686819;
	bh=b130bPAJHPNf/pKE6j8b+YefwbbZ9vGIzK3XSyiPhaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nSi6wN5mBUuDgAFXA5HTlCsy00feN6LpmFRylXWtoPjHKTzqWNVFnhVM2UZ8eiwVM
	 G6Ir838afNlquhcnb13tMc8l7k/5u/YthY+CiPZnWYCmsF7MSDkuwfohMUNsE4BysB
	 WtSUyQWFHeCuhfhFERZD/g4VJyDJ+FZRy1UZmv8A=
Date: Fri, 10 Jul 2026 14:33:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCHv3 0/6] serial: mxs-auart: devm conversion, clock rework,
 and IRQ ordering fixes
Message-ID: <2026071011-geiger-smugly-4069@gregkh>
References: <20260611033856.6476-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
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

On Wed, Jun 10, 2026 at 08:38:50PM -0700, Rosen Penev wrote:
> This series cleans up the mxs-auart driver by converting to devm-managed
> resources, fixing clock prepare/enable ordering, and addressing IRQ
> registration races.
> 
> Patch 1 fixes compilation on 64-bit build with W=1
> 
> Patch 2 reworks the clock handling to use devm_clk_get_enabled and
> reorders clk_prepare_enable after clk_set_rate to avoid
> CLK_SET_RATE_GATE failures.
> 
> Patch 3 converts iomem mapping and GPIO IRQ requests to devm,
> removing the manual cleanup paths.
> 
> Patch 4 moves the main UART IRQ registration after uart_add_one_port
> so the port state is initialized before the handler can run, and
> manages the module clock for console vs non-console ports correctly.

Do you have this hardware to test this with?  If not, I would just leave
this alone as devm_* conversions are tricky and prone to bugs.

thanks,

greg k-h

