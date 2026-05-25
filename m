Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0C8CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJH4eAuLTn/9VBHNDdS21HNu2w6MoQbVhjKm1wkjibQ=; b=RURCdPRlWWLa0PAADVqOT0/uWj
	zx1ro8SAXwB9bP6uwVGPhiefRMQIY6BHo3jU7xEYZYNVmYmZ5clwhsgYGH2LI2AvH5jLVWPAGrwoS
	Ud58cjoVtT3pbczKWpwTnSy2XPUmjbf6ZDSsBedW+4pAxz2jioZxXm6XAkqNf+Fs0I4GZshZthOjF
	tww3/4YgwMbDQhACONFvuyhYC3q8nUmpT4gPuJmqFlyo/OnjEstaIFPYwt1OPkYHpfr9I5FWwIv7M
	R/kMI3wQuDjAXd16DID8S34Ku7urLjxWaNuNhByTSbuSiRznQx13dPTmus0Dt67nlmw9N+kMNqoX2
	hYArhXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbGD-00000000Lya-2eMj;
	Mon, 25 May 2026 19:46:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbGA-00000000Lxq-3yBV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 19:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kJH4eAuLTn/9VBHNDdS21HNu2w6MoQbVhjKm1wkjibQ=; b=IVPbaRWQR0TemdNwL7UWxuUz9o
	1tRrIh+hBN1Zv2izgh3yWc0kW+yp+lH2LaLMd++hX6opoEDqpO64HECd/qHnC6gSuOy4oyVkBaM3U
	sZp/IOYrXDszYgpaTDYbYWc6DovI6ckV/ull6CSjCq70lhMb+ODUDtCi/k98HdVFbg2k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wRbFU-004VMB-T5; Mon, 25 May 2026 21:46:04 +0200
Date: Mon, 25 May 2026 21:46:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Meghana Malladi <m-malladi@ti.com>, liuhangbin@gmail.com,
	h-mittal1@ti.com, haokexin@gmail.com, vadim.fedorenko@linux.dev,
	devnexen@gmail.com, horms@kernel.org, jacob.e.keller@intel.com,
	arnd@arndb.de, afd@ti.com, basharath@couthit.com,
	parvathi@couthit.com, vladimir.oltean@nxp.com, rogerq@kernel.org,
	danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next v6 1/2] net: ti: icssg-prueth: Add Frame
 Preemption MAC Merge support
Message-ID: <ac753d51-0a1b-4fda-aae3-661ca5b8715c@lunn.ch>
References: <20260525182700.3135858-1-m-malladi@ti.com>
 <20260525182700.3135858-2-m-malladi@ti.com>
 <de0255c8-d751-4220-b0ab-88aef3a15f9a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de0255c8-d751-4220-b0ab-88aef3a15f9a@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_124647_018472_6A8CE9F5 
X-CRM114-Status: UNSURE (   6.46  )
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

> > +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> > @@ -44,6 +44,7 @@
> >   #include "icssg_config.h"
> >   #include "icss_iep.h"
> >   #include "icssg_switch_map.h"
> > +#include "icssg_qos.h"
> >   #define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)

Sorry for hijacking another message, but the indentation looks odd
here.

	Andrew

