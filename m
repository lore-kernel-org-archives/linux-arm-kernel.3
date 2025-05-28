Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4888C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehqDeg13oyew9TLKS5grv38vFykrmlLsB/LhIMhZ56Y=; b=p51CWx167MW47SjxRF4Z+jD8Wl
	kG6cSDo1zo/nCexEYAkS47gDDAxP9NODwHZ5o7yFWK9/lR5w0iwNY6T4XWYF4Mvksqdd0gTgWMIQO
	pb9IhUjqRkXHqI8s0NCBXOj6zC77cplOnG6FBfH8GbLC1QPmnBwUR95x8YlgryvL7MDy5LIRHCd35
	gOa6y2W9DItBd496py6nTjHEqwG6mwM5wQH7Dx7kkGzsrPzb47AgXBcRWRC/cSUKaKremqq47uXYg
	NjXl+U+mXCKyZ12gbYGO1F4eCM2QL0e1Y+kCH+ASnlUKN0OLIdK6op0GX4wU1pDdwqzpTrFskEoVp
	6zXByk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCLY-0000000Cbq9-3Y6Z;
	Wed, 28 May 2025 08:41:12 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCES-0000000Cb2W-42Pz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:33:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E62F842EF2;
	Wed, 28 May 2025 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748421229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehqDeg13oyew9TLKS5grv38vFykrmlLsB/LhIMhZ56Y=;
	b=S2tjY6dnzn6uI6BqR7uuGXs1v0QN/q3+dw5WAfvcPMBbi3o5zTiPQWklaseNVwhYmmWdBC
	HrR05Iy36DmnH/Zt50lppYOrfJybzQYti9JSWPkFaa4AZVNaSv0Di17YCfxBOto/8L0ojW
	QAdzmUCLWrtb+vHfP1pdM1G2MaPjiVJ+8T6v/jQ8yofbS9S3tw0WEypnDag9Ur3xTXJvbJ
	iDjzCfTsbDlzrsFgF1NCQJ8KniHV4cj7hyJEoBlP6oz8ieduUrtAv8uKol2YUf3Eab8vZM
	5L1sMy6aIQ8RV+/S8JFcprtZMAqknDFyD9V5nQogY8qeMpN/oPI77iV5yNhAtA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 10:33:46 +0200
Message-Id: <DA7NLJ1CKSFM.3FWBC90NACTRV@bootlin.com>
Subject: Re: [PATCH v3 1/2] net: stmmac: make sure that ptp_rate is not 0
 before configuring timestamping
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Jose Abreu"
 <joabreu@synopsys.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Richard Cochran"
 <richardcochran@gmail.com>, "Phil Reid" <preid@electromag.com.au>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Jose Abreu" <Jose.Abreu@synopsys.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
 <20250528-stmmac_tstamp_div-v3-1-b525ecdfd84c@bootlin.com>
In-Reply-To: <20250528-stmmac_tstamp_div-v3-1-b525ecdfd84c@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvvefofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedugfevhfevueeggedutefhgfevhfeltefgieejjeeijeejveegtdehgeefkefhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehjohgrsghrvghusehshihnohhpshihshdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvt
 hguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_013353_133287_F905A46C 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed May 28, 2025 at 10:29 AM CEST, Alexis Lothor=C3=A9 wrote:
> The stmmac platform drivers that do not open-code the clk_ptp_rate value
> after having retrieved the default one from the device-tree can end up
> with 0 in clk_ptp_rate (as clk_get_rate can return 0). It will
> eventually propagate up to PTP initialization when bringing up the
> interface, leading to a divide by 0:
>
>  Division by zero in kernel.
>  CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.30-00001-g48313bd5=
768a #22
>  Hardware name: STM32 (Device Tree Support)
>  Call trace:
>   unwind_backtrace from show_stack+0x18/0x1c
>   show_stack from dump_stack_lvl+0x6c/0x8c
>   dump_stack_lvl from Ldiv0_64+0x8/0x18
>   Ldiv0_64 from stmmac_init_tstamp_counter+0x190/0x1a4
>   stmmac_init_tstamp_counter from stmmac_hw_setup+0xc1c/0x111c
>   stmmac_hw_setup from __stmmac_open+0x18c/0x434
>   __stmmac_open from stmmac_open+0x3c/0xbc
>   stmmac_open from __dev_open+0xf4/0x1ac
>   __dev_open from __dev_change_flags+0x1cc/0x224
>   __dev_change_flags from dev_change_flags+0x24/0x60
>   dev_change_flags from ip_auto_config+0x2e8/0x11a0
>   ip_auto_config from do_one_initcall+0x84/0x33c
>   do_one_initcall from kernel_init_freeable+0x1b8/0x214
>   kernel_init_freeable from kernel_init+0x24/0x140
>   kernel_init from ret_from_fork+0x14/0x28
>  Exception stack(0xe0815fb0 to 0xe0815ff8)
>
> Prevent this division by 0 by adding an explicit check and error log
> about the actual issue. While at it, remove the same check from
> stmmac_ptp_register, which then becomes duplicate
>
> Fixes: 19d857c9038e ("stmmac: Fix calculations for ptp counters when cloc=
k input =3D 50Mhz.")
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>

I realize that I forgot to collect Yanteng's and Maxime's RB on this patch,
and I guess they remain relevant despite the second new patch, my bad. I'll
remember to add them if this needs a new revision.

Alexis




--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


