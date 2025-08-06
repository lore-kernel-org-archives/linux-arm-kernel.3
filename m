Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CC9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cv4haX45oKdMVg72ERS/j4e3qPSDopAb5gwwqYP2uvw=; b=ofuLMBo42p2UdqJlbM/euGSQqd
	PyU2XrP5wC/2ZdQBC9jgMWtHG4NqtsB/6nEUbpb3xxcusyhpM6RmiOLzdVFTwdU+qg9QqZJ61tr7V
	7PyF2KLzdjcVte8JWSkIFC5Da1FDeJbmLpC0FbU3YWVmDQCWFdDaMhIlr6WNd4kLa2H+LmoPXPFVW
	UAV9052ja+M49gzTd5gxeir7Ht2lXB1nNO99ibk62hqCG5NV+JEJgYdZ9d5eC/GV4H4/hlQDoamYf
	UX9Y1gQSkK2SqLljUn4n5WT8H759nW/DCQPxp5gR2IeWOKlZii0iLWO416HzTpnHWzFDhTpEbP2LO
	0a6qW0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgc1-0000000Fi2d-1dle;
	Wed, 06 Aug 2025 16:03:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgMD-0000000Fet6-0jcm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Cv4haX45oKdMVg72ERS/j4e3qPSDopAb5gwwqYP2uvw=; b=ypEhLyZo8r7ycsxnFjMUnnEo+Q
	v1KCxi00qW4ArcZ65sAhjMZXElRq3CFwZMlQCCsiHys6SXS4DkI/aAyTzqd0kLV/GW1mlFaWrN343
	FPpDUvCk4u07yOvaL+AhPNauGecx0mCW18siDTrcT8WaBz1zItd0/fcwfYbpX9pCjOaE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujgM6-003tdJ-Ez; Wed, 06 Aug 2025 17:47:06 +0200
Date: Wed, 6 Aug 2025 17:47:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Meghana Malladi <m-malladi@ti.com>,
	Himanshu Mittal <h-mittal1@ti.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix emac link speed
 handling
Message-ID: <65645f94-3a61-47fa-ad13-9daaf89e926c@lunn.ch>
References: <20250805173812.2183161-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805173812.2183161-1-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_084713_214322_3A42C34E 
X-CRM114-Status: GOOD (  11.32  )
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

On Tue, Aug 05, 2025 at 11:08:12PM +0530, MD Danish Anwar wrote:
> When link settings are changed emac->speed is populated by
> emac_adjust_link(). The link speed and other settings are then written into
> the DRAM. However if both ports are brought down after this and brought up
> again or if the operating mode is changed and a firmware reload is needed,
> the DRAM is cleared by icssg_config(). As a result the link settings are
> lost.
> 
> Fix this by calling emac_adjust_link() after icssg_config(). This re
> populates the settings in the DRAM after a new firmware load.
> 
> Fixes: 9facce84f406 ("net: ti: icssg-prueth: Fix firmware load sequence.")
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

