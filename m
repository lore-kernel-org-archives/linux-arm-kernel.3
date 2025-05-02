Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F59C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hELQrWuXUM+aAj7DDR2P78YfqFJRmirAUm3QvQTWzQ0=; b=khAGNgIYZiWjF2arhZ4xupqcMO
	OAyaXHhm0rhToeXzoWsdubGkiBVXK4yajshOnwWv6UcEDwb0Se6l5KhekpWaP8KbVRvXUW/w/nxp/
	wu4lsAwMNlhNHN8B1puQsKuQY+AvgWQz1YX6ux2FkrPEDUWArbGvvhaINnYeGz+Iq4CNs+sCcLpGJ
	8ED/BR5efplvnZxFjHgvjM9wJHKW493dZImIPN2y4c4w0QdKVugDkChFp0YlKPdZeKeQ+ggZgzZbv
	P6UyIkAp95gTJWpgokLHnwQAU2R+Yv3N1mxzeAqS9mD4rIWJHLWHM6tDXRa849Gazw3Xl1nYFq6Lv
	auO8juYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArD2-00000002AQ3-3yA4;
	Fri, 02 May 2025 14:17:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAr8t-000000029ZA-0Gp0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2A405C5BA9;
	Fri,  2 May 2025 14:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86FFC4CEE4;
	Fri,  2 May 2025 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746195209;
	bh=yx8MFH01X2N39XwTWzq6+ATHZglg/J+RztBenNzgst4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HEJCUjNAg/oXF9wvqym9vnorYBbBg6HAk8rKG4heSNpO90IPRIhdrchKRHxuV5Yia
	 FDObzWatACdFKKIjNTGgziRG8XDnlbX3tTHP5pumonsFOuTe5HXLxvUDbpg8QKr1eU
	 u1S3Qb29+tkYAE5kDYb7itLzsZNPRnFmJGqErxsK2DkTO6Eeg/pafXwJG1eV2fwAUO
	 p4jQdZPZrqfAIhQLrsD3cQvilI+D/ngIya0x+i95Ynr2jv646qdUHjywWLzec/8oPk
	 7znjw5WTNKwzxZBjNxCbspkFRExq+NZ7bz5DVg39YkN7nV/01JHWgffaeRdIuI1Cii
	 QDzMKHL1LUpDQ==
Date: Fri, 2 May 2025 07:13:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v10 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250502071328.069d0933@kernel.org>
In-Reply-To: <20250502074447.2153837-5-lukma@denx.de>
References: <20250502074447.2153837-1-lukma@denx.de>
	<20250502074447.2153837-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_071331_146793_CD6A70B9 
X-CRM114-Status: GOOD (  16.55  )
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

On Fri,  2 May 2025 09:44:44 +0200 Lukasz Majewski wrote:
> This patch series provides support for More Than IP L2 switch embedded
> in the imx287 SoC.
> 
> This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
> which can be used for offloading the network traffic.
> 
> It can be used interchangeably with current FEC driver - to be more
> specific: one can use either of it, depending on the requirements.
> 
> The biggest difference is the usage of DMA - when FEC is used, separate
> DMAs are available for each ENET-MAC block.
> However, with switch enabled - only the DMA0 is used to send/receive data
> to/form switch (and then switch sends them to respecitive ports).
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Now that basic build is green the series has advanced to full testing,
where coccicheck says:

drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1961:1-6: WARNING: invalid free of devm_ allocated data
drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c:1237:16-19: ERROR: bus is NULL but dereferenced.
-- 
pw-bot: cr

