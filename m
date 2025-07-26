Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048F1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 20:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEQ/O/dUeFT4kf7sbjll2TCOt7HhPtMwycrCc85dABQ=; b=esTmjyeiu6jdoY1TlbmOhxVFH1
	PBnLMqP9QfXuBhftalWrmQrRRPH9TS+qwGluVkOsuQoIsp2qsk4JbJ5+SoN+G2sFcjtKnsvUyS8pQ
	tkS1We8NQP/ha7T/mpmY4y8zQduRuzX4q7nwKZgSHMaW9a7FFJQYe9BXIsYxV2kDKDFKLVsVtywKA
	hmedBPuHRjnf4t/XXjTiI24FbSH5aQC9+mm2++8cwvZYZcVxyfihsiLG2poI6f0EdoxHk6cLSVQ+z
	nP+Upr7/+6IzlQ0afySu7TReXKzCGl/lJ8qhZCvb+WCrRGSYAD7mPfBVsagdwbrRklFCMMuwNXBHB
	8vrS0Y/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflkJ-0000000BsH5-3Tpq;
	Sat, 26 Jul 2025 20:43:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uflfC-0000000BrZy-2U3j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 20:38:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2961B4452E;
	Sat, 26 Jul 2025 20:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28052C4CEED;
	Sat, 26 Jul 2025 20:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753562317;
	bh=TM1X9dVzWt5HlEVegL3MeEeWKrIa4mosSp2FQM2bPWU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aNU60zaSue3QS/YiAPQeSr1K1UrY/FTwKyMWopez4AwEFrglQwUtZX14ihVBZDeDV
	 eJXm4ybi5yFq3LoY0kshG3ZIqcyDhXPIJc9Fb+p6yWZPk+JWEGIE2aGYHzBVN0azT5
	 20cWIEzpmdQfq+P6P8jnFJdPgl5Hm9I2KAHfSsMtdRVfpuC4S52ax3PLkm0PzvJoO4
	 wXgN6SR2ks9F2S5mvKkJJfS98EQop2hD1XI53rSQmiHkeLaz3RlyZOL4LTt+9E3eve
	 AmVaI/UBGu+i4xHpD7xYyF2o/br8k7EBtSZZd062T5sLiiEri19Dn931ZcWcVzh4pw
	 /9rStvr3EIppg==
Date: Sat, 26 Jul 2025 13:38:35 -0700
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
Subject: Re: [net-next v16 04/12] net: mtip: The L2 switch driver for imx287
Message-ID: <20250726133835.6e28a717@kernel.org>
In-Reply-To: <20250726221323.0754f3cd@wsk>
References: <20250724223318.3068984-1-lukma@denx.de>
	<20250724223318.3068984-5-lukma@denx.de>
	<20250725151829.40bd5f4e@kernel.org>
	<20250726221323.0754f3cd@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_133838_661924_AA957DDB 
X-CRM114-Status: GOOD (  10.61  )
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

On Sat, 26 Jul 2025 22:13:23 +0200 Lukasz Majewski wrote:
> > > +		ret = register_netdev(fep->ndev[i]);
> > > +		if (ret) {
> > > +			dev_err(&fep->ndev[i]->dev,
> > > +				"%s: ndev %s register err: %d\n",
> > > __func__,
> > > +				fep->ndev[i]->name, ret);
> > > +			break;
> > > +		}    
> > 
> > Error handling in case of register_netdev() still buggy, AFAICT.  
> 
> I've added the code to set fep->ndev[i] = NULL to mtip_ndev_cleanup().
> IMHO this is the correct place to add it.

If register_netdev() fails you will try to unregister it and hit 
a BUG_ON().

