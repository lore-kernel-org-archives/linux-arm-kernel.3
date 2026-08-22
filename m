Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5103CC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 20:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCNWFGT83mW7OgSsVZiAoeQGNFonxbot9+TzH4r5J3Q=; b=W9PBS4hbDvjrAwfbXIMRARbue2
	rs+141f2pBul8+q0MbEIq2z6gd+fcTefO1r23LtnxKGlj0bqRAZQb7YVdvFHcxtNigNBFjjrJl+Ls
	ayjYzMwKwBw5jqjSGYw2cUvEQlxGJfxdLfdtw7i8h8I0hYOmAUrT4H5TXoiAxSuIwPyZsvOD74JOc
	Lx5Gp/r6GH9loVv3jZ44j3QrU5Y6Tl6KBe2VkiSvt8dlmLw36y1Wb2GgtDQE89+u42410EABQPLFy
	a9T9kmrQmavqO5FU9gPNPw2qnBsgPZj9GCHE4LGl0nrusUiJuVVYjthW1lszjA+nOTOdQMhlGP6cI
	zJ9gpwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxsgE-0000000EnCE-0NT9;
	Sat, 22 Aug 2026 20:51:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxsgC-0000000EnC5-42oG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 20:51:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B498843AAF;
	Sat, 22 Aug 2026 20:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F21B1F000E9;
	Sat, 22 Aug 2026 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787431864;
	bh=kCNWFGT83mW7OgSsVZiAoeQGNFonxbot9+TzH4r5J3Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lTeWpoI8Dz7xVYVadfea210hh6nnhGR7P54LFF664QZu9VVwpXH4yZh3whrQeIVxj
	 T7jSbsW/WSmqHisnsaTAY29kTkZyBIdmbKBWcFZhCqKVnwxlb7QNXZmu0njeInkrxo
	 04fa+eAvUu4XmlnCOA8/IfWmIQj+I2H+GppfbXpv16gspM0sz8Dedjk+zymjCcf/NL
	 krsuYmNVoPzxKfoeujGMxff4GYUpHabLAJDfa9DfkFgKpQt/PByjJ0V45ZVaspSxs8
	 UKCwz0YjIzoPR2WvNWwJ9puYS/EXIs5GgXnpgwUC8bF39i5qx8inAK24g2aWQSrdUU
	 f4xgfFt6NOCIw==
Date: Sat, 22 Aug 2026 13:51:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: netdev@vger.kernel.org, wellslutw@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] net: sunplus: fix tx_poll spin_lock missing irqsave in
 NAPI context
Message-ID: <20260822135103.6711ba25@kernel.org>
In-Reply-To: <20260820130159.1584806-1-ag@ffroot.co.za>
References: <20260820130159.1584806-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 20 Aug 2026 15:01:59 +0200 Andrew Gaylard wrote:
> spl2sw_tx_poll() runs in NAPI (softirq) context and acquires
> comm->tx_lock with plain spin_lock(). The hardirq handler
> spl2sw_ethernet_interrupt() acquires the same lock, so a hardirq on
> the same CPU while the NAPI poll holds the lock would deadlock with
> IRQs disabled. Use spin_lock_irqsave/spin_unlock_irqrestore.

Please explain how the issue was found and how the fix was tested.
I mean - this is an ancient driver, if you don't have a way to test the
fix you should not be sending the patch.
-- 
pw-bot: cr

