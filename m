Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87C9C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYJK0qAVqQSmX0wxJ+vjxLsKfN7eDE/pw0TZNKcvAMs=; b=CsdqQ5CUf8n2/xy6r8NNQM1hWf
	zLDh5OQSUU8icyjBWKfYJGxErkHlVp8yzom3aooynI6d4N2lQNZ4wCMRGjPHF/pHig7gUpNz0ragf
	SIgbnYvE29yZJKTC+AZT6zkh8iORz33g7h13ePt9XxXIKMkzV86Jl+kEdyGp6Kjzblt+VgFtoxWSS
	3FKe+CGS1rHx2wPLiT6aTWKKrlA/AQHnLUQccPfNT3uGJ8KTfEWTnjm5A5Q5WVTUM9RKCGN+3Gb6U
	eoML1PkXvPdc81MWKgJ5+yq69HYsqJD2IaQ6A3J6/PQFF4qmiPdfZZx6CYl2I96qplLTJ1RRM2OUN
	balMP5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lln-00000008Cft-4B38;
	Wed, 23 Sep 2026 12:08:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lll-00000008Cex-0tTy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:08:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2439434EC;
	Wed, 23 Sep 2026 12:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9C81F00893;
	Wed, 23 Sep 2026 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790165292;
	bh=wYJK0qAVqQSmX0wxJ+vjxLsKfN7eDE/pw0TZNKcvAMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSuJGz6QSIMFbgbSk8AzeZk/GLcK1Lpeofju0iONrBxJQLCQldjoPVYIPezjlLFuc
	 JAvfMbn2upyr2+k8oIb6iwZVSGrscC2sdNvnesnjRbgtlasKi3AkEGtFvg/QimK/Oo
	 7umOOy2j732mh1RKgNs6jPti2pVU98mK96d/PFdw=
Date: Wed, 23 Sep 2026 14:08:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: jaidevshastri@vt.edu
Cc: Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] serial: xilinx_uartps: publish console_port with release
 semantics
Message-ID: <2026092331-pope-avalanche-40ce@gregkh>
References: <20260921-mb-uartps-v1-1-9fc2f3d4b1a5@vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-mb-uartps-v1-1-9fc2f3d4b1a5@vt.edu>
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

On Mon, Sep 21, 2026 at 09:21:13PM -0400, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> cdns_uart_probe() assigns the first probed port to console_port with a
> plain store once the port is set up. cdns_uart_console_write() and
> cdns_uart_console_setup() read it with plain loads.
> 
> Store it with smp_store_release() and read it with smp_load_acquire().
> 
> Found with MBCheck, a static herd7-based memory consistency checker.

And how was this tested?  The shashiko review bot shows where your tool
looks wrong...


