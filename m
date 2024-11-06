Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDF0D44D7E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rqq3lVdOu1wGohvmd24OZ66Tgodz6Iat0Lnd5WGEE4=; b=aJEa+u1/i2hV0ftAlVvEchBdQG
	HsexWM80oCgEJ2GVLNMIpwKklHtJz/0CB4NXQZ2z5+IVR+9tzV69oGAKkD6Hm9EkbeuHFhkU+hOtw
	Jdmr6TcSxahubLCEVmHJspRZlLktbANbQSEiDFxcgQxqmKmXjIvbqmsVG/lLV+dqwA6mwS4htiqR4
	mh8mlUgjb/YAXd4icRqZe+9mSeP/lubeFKVT6mcD2DxrAMNMMbi9hQV6fNFh0rj27ks4vkF+he4ap
	+yHR3wFA6iE2QiH5riFCSHKt5Zb3bBYS5X9SL0NorFu8OkEaeHilxukwr1ut5Gy+fpObnzYipMjHw
	3rgdSxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hed-00000003l3O-1mWz;
	Wed, 06 Nov 2024 15:09:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hcs-00000003kjt-1xO9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC4635C58A7;
	Wed,  6 Nov 2024 15:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E28C4CEC6;
	Wed,  6 Nov 2024 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730905637;
	bh=gDInCR0wfp7AiDJEzpDPeD8yUHQFH5BwUzUUeMJA2ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8P9A9nVE3+QQ3SCXAqR1BYNeWAHYwHmOkCS1zvzrVj4/6BFIUVP568kUgQjKxgGs
	 rrnSSoA5BdM1UfyRAAmANhUDdQujfQsK75rWy7tEqYx8GR9GQDVgctb45G4mUKALHK
	 QXuSavbKCJ2xdtqHboZuY83779Kdbq8qOWJKL4CXxypZGW62Ch5rDfNG0OuWlxYflq
	 qKeOqk10guCxuYlVro04IMM/JaPBWq1KD8iSvWpMOfSbY8JZfyJTGveNuHORBu0BMZ
	 fAC66Nx3aBtaW4ICC6+2OCXL+6BUEurt1vFQrvRUJtCqTsUuS73lxlWIQvHPIIEFn0
	 TXeQd++ApHfmw==
Date: Thu, 7 Nov 2024 00:07:15 +0900
From: Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kwilczynski@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
	"lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
	Frank Li <frank.li@nxp.com>, "mani@kernel.org" <mani@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Message-ID: <20241106150715.GC2745640@rocinante>
References: <1721628913-1449-1-git-send-email-hongxing.zhu@nxp.com>
 <20241103205659.GI237624@rocinante>
 <AS8PR04MB8676B83C73ABBA45A34C58DB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8676B83C73ABBA45A34C58DB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_070718_571813_9800CB6E 
X-CRM114-Status: GOOD (  11.39  )
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

Hello,

> > Applied to controller/dwc, thank you!
> >
> > [01/01] PCI: dwc: Fix resume failure if no EP is connected at some platforms
> 
> Hi Krzysztof:
> Thanks for your pick up.
> I combine this dwc bug fix with the other one.
> Can you help to replace this commit by the following series?
> https://lkml.org/lkml/2024/10/10/240

Sure thing. So, the following:

  - https://lore.kernel.org/linux-pci/1721628913-1449-1-git-send-email-hongxing.zhu@nxp.com

has been replaced with the following:

  - https://lore.kernel.org/linux-pci/1728539269-1861-1-git-send-email-hongxing.zhu@nxp.com

I took the entire series (consists of two patches).  But let me know if you
want me to drop the following, which is the second patch:

  PCI: dwc: Always stop link in the dw_pcie_suspend_noirq()
  https://git.kernel.org/pci/pci/c/f40d59f309db

Also, have a look at the changes to see if everything looks correct.

Thank you!

	Krzysztof

