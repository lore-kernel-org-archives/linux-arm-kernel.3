Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98675FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rz5+8HKBObbUzWkRkJLrMIZCYQXi9v58Y1B9PohQInM=; b=f6u8sqiZuYXq4HsYE72FzgsOxW
	Bc2xXqexALGCf7FV4J1K0FA9T0uXGvIbmab1BqoDqnUwU4oBhtgTxBOyoFGADw5i695NGADTF6tfx
	Znsns+SAohR3oIPZpAAO4G3DuPdmKCPYViHo4wGmZgIb+vCQUcGVTM9Lbr/w9Md3EFRW/QeaTz6Ie
	JPVEpjtBZkrpIikeJm/AafnGpgYnljztZRgZwwYE7wNgB2mhrQc8W8rYF7smy/8Gl/gGgNhF/ZAkJ
	1beoeR66oxWNdMMxg/Y1gmzj8/cNjItckIn0ml+5r8f2FBnjuAMk7MYof5WXnzHB1boboM0XkVX5E
	MratIb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Yw-00000003d48-1ga4;
	Wed, 29 Apr 2026 13:02:46 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Yq-00000003d3b-2Wry;
	Wed, 29 Apr 2026 13:02:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37C9C14841EA;
	Wed, 29 Apr 2026 15:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1777467747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Rz5+8HKBObbUzWkRkJLrMIZCYQXi9v58Y1B9PohQInM=;
	b=X1aSroswucp7gpg/zRyamurUe94FEatr3CkLFyVcwVK8gdcpvPjF/sFtGyhB+90ndxnXHT
	8HZei4yi9Rh3wWQ9uq1KfQ2bhhcAy05niuSE7x8/ArSfCN94bs38t28rLlnynXiwDdtb6X
	Wctigieia+1vIdAo/UueqJN8i1pYoA03yQ+toNriBSz0BQUKmVEoI8HJaRO/ZY5HTd7cX0
	czQwW6LdQBbRtBWtTy9H+9WCsuX2n4p1ECaT7wzDWTUqmhzRGoABZPohs8QqWgZUd8l4yu
	6i8kIy1i6aZgkp5Y6kZ0zI4LpMsdzNWqX53xcSWpuwCGF1y90Ib+awmsPeG5Tg==
Date: Wed, 29 Apr 2026 15:02:22 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
Message-ID: <20260429-blazing-thus-c1a4eb9b6b0c@thorsis.com>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
 <20260105-at91-probe-v3-3-594013ff2965@kernel.org>
 <20260423-stoke-ocean-139dbe306256@thorsis.com>
 <20260424-worried-renewal-924d34ed945c@thorsis.com>
 <87tsswfnmy.fsf@bootlin.com>
 <20260429-lushly-greasily-c14c01c1aee8@thorsis.com>
 <87lde6cdc4.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lde6cdc4.fsf@bootlin.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_060240_828483_BCCED4D7 
X-CRM114-Status: GOOD (  16.71  )
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

Hello Miquel,

Am Wed, Apr 29, 2026 at 11:42:19AM +0200 schrieb Miquel Raynal:
> Hi Alexander,
> 
> >     [    0.958298] bus: 'platform': add driver atmel-ebi
> >     [    0.958451] platform 10000000.ebi: bus: 'platform': __driver_probe_device: matched device with driver atmel-ebi
> >     [    0.958566] platform 10000000.ebi: error -EPROBE_DEFER: wait for supplier /ahb/apb/pinctrl@fffff400/ebi/ebi-data-lsb
> >     [    0.958649] platform 10000000.ebi: Added to deferred list
> >     [    0.959429] bus: 'platform': remove driver atmel-ebi
> >     [    0.959540] driver: 'atmel-ebi': driver_release
> 
> Interesting.
> 
> If you look at the very last line of the driver, the EBI driver does not
> use a standard "module_platform_driver" macro, it uses some kind of
> run-once probe that is kept in an __init section:
> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/memory/atmel-ebi.c#L637
> 
> And this seems to be incompatible with probe deferrals:
> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/base/platform.c#L948

Indeed. o.O

> I would suggest trying something alone these lines:
> 
> --- a/drivers/memory/atmel-ebi.c
> +++ b/drivers/memory/atmel-ebi.c
> @@ -633,5 +633,6 @@ static struct platform_driver atmel_ebi_driver = {
>                 .of_match_table = atmel_ebi_id_table,
>                 .pm = &atmel_ebi_pm_ops,
>         },
> +       .probe = atmel_ebi_probe,
>  };
> -builtin_platform_driver_probe(atmel_ebi_driver, atmel_ebi_probe);
> +builtin_platform_driver(atmel_ebi_driver);
> 
> Memory taken by the probe function will remain mapped. That seems to be
> the drawback.

This works.  Sent a patch, see:

https://lore.kernel.org/all/20260429125930.844790-1-ada@thorsis.com/

Regarding the drawback: This can't be much memory, can it?

Greets
Alex


