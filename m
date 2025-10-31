Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D45CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zln0QwhKcYthq0pPg/HD/PkBo+S/BsnpF5TZqOulmK0=; b=jYe4k5xKwtKcQTu6CmtDPpgfAO
	4KFZ6BGXiVfNdZEgxPzREnlX9uh+lUY0K9XKG1hsaan35/wnu4MA1JYRBbts2ApgIGIXM3COWdpE1
	HlCEfLnIomfBt/KozgSzfRWHk/qUXNpQ5g2lsc/hFSGaGxCoiYZAzI0woqK68qnBX0IMJDoOcehtO
	AfV7w7s5dBtL3prxCLs0EBxJg5Spi6Zo32zHf+wNgXsFdYd5sYceS85AJtK+uw6uNbHMy8jRlze54
	OS/Z+AyJYqvqYxPRyFSKK6xXBuF0PaGuijPCezjyjeehopvNmsV6+/+yjJn1cZsIUcRE6fnbSyZX9
	pA34FLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEskM-00000006T0F-3mEZ;
	Fri, 31 Oct 2025 17:17:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEskJ-00000006SzE-2PyO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:17:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C1AA3C0E958;
	Fri, 31 Oct 2025 17:16:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F8CD60704;
	Fri, 31 Oct 2025 17:17:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33D371181808E;
	Fri, 31 Oct 2025 18:16:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zln0QwhKcYthq0pPg/HD/PkBo+S/BsnpF5TZqOulmK0=;
	b=cLbifxJmwIvE+XvwKgRbRFJXt77MOSYc7FG8l4ctiYJqL0lJG+s5ItDxDEniaJMWs28o9D
	pJsZ2cDMtVMwXFAm6x4HciQz6eot7y6asiT/7OrtYqYRxUakg+z9oON+YjVfGqQY1jCJxG
	ATkvPl5wlkS2ifwr7ekgbGhDwufinLiLnkL/jwEIVKW06KMYfqR0TAWvtfuBI0STjghngK
	8EO4eZhs6eqrVkdWRUESlrM3SzxEI9wA5gYnuGbgFzR8J/traeZfUGUn2ljprh7NkHm8wp
	c6zNblJiUlIg5Pp19wHfiVNywsQgn5TOKUQYD4SAOmAJLj1ARptjs3rNla1Nzw==
Date: Fri, 31 Oct 2025 18:16:53 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Marco Crivellari <marco.crivellari@suse.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 4/7] net: octeon: mgmt: convert to use
 ndo_hwtstamp callbacks
Message-ID: <20251031181653.2832b992@kmaincent-XPS-13-7390>
In-Reply-To: <20251031004607.1983544-5-vadim.fedorenko@linux.dev>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
	<20251031004607.1983544-5-vadim.fedorenko@linux.dev>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_101703_763341_406EDBC5 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
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

On Fri, 31 Oct 2025 00:46:04 +0000
Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:

> The driver implemented SIOCSHWTSTAMP ioctl command only. But it stores
> timestamping configuration, so it is possible to report it to users.
> Implement both ndo_hwtstamp_set and ndo_hwtstamp_get callbacks. After
> this the ndo_eth_ioctl effectively becomes phy_do_ioctl - adjust
> callback accrodingly.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

