Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774DCCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gKOtpGMiRhZFeAUlKqtMcOBotYFR7k/ihU/c5rhRHU=; b=TZZWmlE5taR8ENZTJnnj7+aQXb
	95sjsO0Hpk8dKK3l4ncGgr2O1oY+n+BNKryVPdJvDd5yJR3+8JqIlUabZxyJwgfY5fNBsEy2zOps6
	xjGEhhPzDDJBple67CuTrJlHmZpSxCjThuh5vIjByDEZNPwm4VJ6PoR1Y7KgD8pya/jN3NCNxp1cX
	Tn1GOugkFtYbE+ykcnXBGFTFnwmhiOQbq7rDfKdM5sf6eoRwUy5znoV34RzHMCFnJjLXqNyho+RMB
	M+68KgbNvKOL7sQDtTYdVu531FR/xO+Rkmk+hmChXzs2rWHCQe1uovlcyRNwFWpjKd7ujOqJBVbTM
	xDatTlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN5W-0000000GR71-0VQF;
	Fri, 05 Sep 2025 03:26:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuLYY-0000000FqJP-0VyA;
	Fri, 05 Sep 2025 01:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2ACAD6028C;
	Fri,  5 Sep 2025 01:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B47C4CEF0;
	Fri,  5 Sep 2025 01:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757036879;
	bh=nKN62gC4jkdDbMIOofqf7YTZbhCZ14cobe9mIKWrKv8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rfe/GuOpH8cuEJ12EXJjZnxs8Ao00R7lbvEgT0XnlAnjTPGcgGRTfCzYXpMwmE4re
	 JB1amUpWAPGJivhw+cKL6KuPsBTsuQbOX6PahAv8pplZuRsz/Ni6QerYmSW2QqVxTX
	 axOLcpsJsjs67pNZM8kmc7tn53I4bzAhMfSw04Pdx7w5YvtcAK33nmRv7ZvCPZBJ5m
	 LP9b0MfjoYzQwVKLI9hO+oSZ/zcJQTflFQ3sQaLFUh+0e/9roVzeGIx5lWoMueii7p
	 Hlr39DthJTA1kcp1gG4iaESqFyHc+AlGSQP880GSonx5SeeN2cvGKj08nQzQ3xrESI
	 Mcgm106muHXOA==
Date: Thu, 4 Sep 2025 18:47:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Phil Elwell <phil@raspberrypi.com>, Jonathan
 Bell <jonathan@raspberrypi.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 0/5] dd ethernet support for RPi5
Message-ID: <20250904184757.1f7fb839@kernel.org>
In-Reply-To: <06017779-f03b-4006-8902-f0eb66a1b1a1@broadcom.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
	<06017779-f03b-4006-8902-f0eb66a1b1a1@broadcom.com>
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

On Thu, 4 Sep 2025 14:07:36 -0700 Florian Fainelli wrote:
> On 8/22/25 02:34, Stanimir Varbanov wrote:
> > Hello,
> > 
> > Changes in v2:
> >   - In 1/5 updates according to review comments (Nicolas)
> >   - In 1/5 added Fixes tag (Nicolas)
> >   - Added Reviewed-by and Acked-by tags.
> > 
> > v1 can found at [1].
> > 
> > Comments are welcome!  
> 
> netdev maintainers, I took patches 4 and 5 through the Broadcom ARM SoC 
> tree, please take patches 1 through 3 inclusive, or let me know if I 
> should take patch 2 as well.

Thanks for the heads up! Let me take patch 3 right now.
I'm a bit unclear on where we landed with the parallel efforts to add
the >32b address support :(

