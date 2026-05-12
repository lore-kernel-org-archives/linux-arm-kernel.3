Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EC9CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MArWRcgp/Ddnzv9IsMqMaR6EYrc4SmrwqNGh7+od2Po=; b=Sk6V8eNCvdU7PKDpAWBjZbYHQe
	HxoI9FYGCD5dZ/yW04eg0oiyKQZwMODXObV8oDEd+0vXaAg5wHFX6yX8lNLVfn45LdT5zO8mxHODb
	5PkXUQ+jOVml0J9Z/l/DRLa6USXz60Tux+7GPBgZi7cJNa6dKDjDPnxy6vuQmIoC+R9VinvH4fKSY
	BaViSvUqZD8Ulwbkl1+0ghIf/Z/zIHj7F6qODKlogKTh0hiN8KFo4JMLrT76ws4xS2VqzNXVkGLeN
	82ru/V+2+KaczE+AcmuqdKSfQmtOxMj+rurPwG+Gjec4unjk+DxBIOHiKd0YEHZ/JS0yDRsqOkHf6
	cG6u/k3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhJn-0000000Ft0D-36DP;
	Tue, 12 May 2026 07:14:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhJl-0000000Fszo-3dh5;
	Tue, 12 May 2026 07:14:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6A84600CB;
	Tue, 12 May 2026 07:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD69C2BCB0;
	Tue, 12 May 2026 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778570052;
	bh=g1gkbUsnWSdMZI7g7vFCqTGaKHg+bWKWO9fa+1v1mR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDnAZVazU1CPPk/nR7LPIrHfBHawgO8KnJnNyWNW1GvJ8DytEDFjlYXLsLSA83jBF
	 tWosRUCbAF44OkS9wcWhOR0ypjISXSJ6hsaRMwZpj36T1uSCct8VCUZ2Txya5OVjVJ
	 Ks3HxzT02BxSkQaq0N31sIF1AP9w4d+XOSZk0t3ZGMO4EDFwBfQ56wZRTD7FaVCA3h
	 eWhUqUqRpFFSt0buIk745fgfSWhO4H42PTmBg41AI7YlDuyxYVLHtd3DFE/UXVKNnF
	 AyktHd+C2E6JezY3FEEpzmR3pXHFIVRaRLgWtz83ulBiv3SMbLwM9ch/pREkmCmuER
	 7D4WxzB4wl/Jg==
Date: Tue, 12 May 2026 16:14:10 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, mani@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com, 
	mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
Message-ID: <20260512071328.GA3606279@rocinante>
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
 <20260511070139.GA1096586@rocinante>
 <e600d0a4-b93e-425f-a5f1-c76802c65622@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e600d0a4-b93e-425f-a5f1-c76802c65622@163.com>
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

> > > -	/*
> > > -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
> > > -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
> > > -	 * after Link training completes before sending a Configuration Request.
> > > -	 */
> > > -	if (pci->max_link_speed > 2)
> > > -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> > > +	pci_host_common_link_train_delay(pci->max_link_speed);
> > 
> > This comment could move to the helper you added.
> 
> Hi Krzysztof,
> 
> Will add.

No need.  Per Mani's feedback about macro being well documented.

Thank you nonetheless!

	Krzysztof

