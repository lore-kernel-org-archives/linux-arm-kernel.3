Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7987C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 00:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUpcsGsbA02Y7d3jqN5GtM9Hh4BPN5PWXSI2d8YVpjE=; b=taGMicEdwptaghxOLdpTes5vml
	Fe9rb42EiRZNFxQQx854axU1rm4uepvxlkT3Sa6UtolY7L8tdmxTGMSSAqNVduaAlLCh71jdA4wnD
	yw5h26tqTOIAJxCQouPnzznE9JYszqM0kuhyvuUzR+8rzoXCZENOb68KBdIouDlvqybKvVrnucQuS
	NmNOkNhQJg3r8xJio35ccadmeaZau1u2FWnh1uHuZ8LQXYp/KcTuaB6fx56BNxKeZzsY2MaPRJlDw
	fQW0ITLh61QlVhpIhZdLo1IgpRTtJilot3YgMz/pC5+1j9bsDH5WnnSn6YGi1FX/aUlWIoHW4Tg1S
	uc5LqluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1C04-0000000AhJK-1s30;
	Tue, 01 Sep 2026 00:05:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1C02-0000000AhJB-1SVN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 00:05:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CBD5601DE;
	Tue,  1 Sep 2026 00:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0661F000E9;
	Tue,  1 Sep 2026 00:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788221113;
	bh=FUpcsGsbA02Y7d3jqN5GtM9Hh4BPN5PWXSI2d8YVpjE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FrhEWBGxqcGwspjWh1k3Igcoxs3GHdUaopeeioX+qhAlV8Wj9m4sIxvBkKCdSPnfo
	 Y+z3m5R6H0FPYQcYfAZHIG/3PUqiwtxCrbO70T9lEhcOBvrFYIxmNP7hWlsnW1Uol3
	 hW21yWpK6FJJ+ccH/Pet+YYIDYITsfz2ZskvfF6+ttjJ+ziOCzwTIq6wz8r3l0icnQ
	 AFZNdbd/kV9/ftepmoNLeJjQSZ37VsvgLPjextGJEjx6CIhdMdc7qyXz37In0+gm+S
	 tWgMzhiHthZCzqnKnnHrqS+9bLQYkjD3h8AHSgMVZOpl8uKmAq6nFD+rHE39iERpM6
	 ptnQSBvTU32cg==
Date: Mon, 31 Aug 2026 17:05:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>, Esben
 Haabendal <esben@geanix.com>, linux-arm-kernel@lists.infradead.org
 (moderated list:ARM/ZYNQ ARCHITECTURE), linux-kernel@vger.kernel.org (open
 list)
Subject: Re: [PATCH net] net: ll_temac: Return actual error from
 of_get_mac_address()
Message-ID: <20260831170512.416ab382@kernel.org>
In-Reply-To: <20260827012439.162651-1-rosenp@gmail.com>
References: <20260827012439.162651-1-rosenp@gmail.com>
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

On Wed, 26 Aug 2026 18:24:39 -0700 Rosen Penev wrote:
>  		rc = of_get_mac_address(temac_np, addr);
>  		if (rc) {
>  			dev_err(&pdev->dev, "could not find MAC address\n");

dev_err_probe() if you're trying to handle rc == -EPROBE_DEFER

> -			return -ENODEV;
> +			return rc;
-- 
pw-bot: cr

