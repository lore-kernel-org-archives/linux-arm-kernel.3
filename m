Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAFFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBc+H6lNDSCY0P/ZGAoCaWqWu97NXbYVzEJgVsi6CPI=; b=u/a2fkLaMybzJDkJghYcpbA64B
	MwE5tbvz3I20QjIYwcE9Mr7cEhVh7rvNw1pFwq8HI67/af4VPyllNr4nOqIdv4Mm67LW/VWMkrFFD
	AxV6sHNMkE+HSPVLbcSd4h4Sb33mPxNGAp/tXrAs6l54hMtDp356nyTgCXV/AMUPLNnUi9Gnf1zLQ
	WAttqnkDEuPj2NgLp+4iNn+qe8vnRFxOEWE4QmDLT1GTdLrVOIG5SM/b023GpJGH++YYdSBs5nsDD
	ausDEZiftM2wkqO3XZxGdakMD6Mla/1TQgbl8f9RuE+Fjngk83KTtcEaMhaLNOTYgSxaeU9zRKuvb
	f4dcETYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt16o-0000000DdNI-24uo;
	Fri, 14 Mar 2025 09:13:38 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt10p-0000000DcLQ-3f3H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 09:07:29 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52E97BUG1638695
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 04:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741943231;
	bh=PBc+H6lNDSCY0P/ZGAoCaWqWu97NXbYVzEJgVsi6CPI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=I9Gnyj6qjLjU0xS0CUgxLIJLbySBdjn0ux91+G+Hk2P9/s6bLE2OX+auY59sWPwaz
	 jAMEbPV9PCvP4qGZnRbZsZ9wEIWMobRZCUgRX6v7ZBsfc/ztQnRg5RQcaJHg+DMcxE
	 u7wleChfDMdOUk75jk0rbrJ4oMXC0tg2OAe1QRPE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52E97B6S005456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 Mar 2025 04:07:11 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 14
 Mar 2025 04:07:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 14 Mar 2025 04:07:11 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52E97AxF127218;
	Fri, 14 Mar 2025 04:07:10 -0500
Date: Fri, 14 Mar 2025 14:37:09 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Thomas Richard <thomas.richard@bootlin.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kw@linux.com>, <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <vigneshr@ti.com>, <kishon@kernel.org>,
        <cassel@kernel.org>, <wojciech.jasko-EXT@continental-corporation.com>,
        <bwawrzyn@cisco.com>, <linux-pci@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH 4/4] PCI: j721e: Add support to build as a loadable module
Message-ID: <20250314090709.oaaxhapvg4fxdjc7@uda0492258>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-5-s-vadapalli@ti.com>
 <88b3ecbe-32b6-4310-afb9-da19a2d0506a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <88b3ecbe-32b6-4310-afb9-da19a2d0506a@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_020727_956866_8118944F 
X-CRM114-Status: GOOD (  13.76  )
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

On Fri, Mar 14, 2025 at 10:03:01AM +0100, Thomas Richard wrote:

Hello Thomas,

> > +
> > +	if (pcie->reset_gpio) {
> > +		msleep(PCIE_T_PVPERL_MS);
> > +		gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> > +	}
> > +
> > +	if (pcie->refclk)
> > +		clk_disable_unprepare(pcie->refclk);
> >  
> 
> Hello Siddharth,
> 
> I think clk_disable_unprepare() is a no-op if the clock is NULL, so the
> if statement is useless.
> 
> https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/clk.h#L1157
> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/clk/clk.c#L1237
> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/clk/clk.c#L1099

Thank you for pointing it out. I will drop the unnecessary check in the
next version. I will wait for feedback on other patches in this series
before I post the next version.

Regards,
Siddharth.

