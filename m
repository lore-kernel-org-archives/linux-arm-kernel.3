Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93687C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tmcnWUPyIMUbTM/uIlg1zfn7rYpCy3xO2rspCYwIYU=; b=A8QFCOJR60jK/nfaWJpH9jMRB5
	4fYTNbgwYtn9fIimMHcCmMDue18HMmPeZEPgQg853wbXFCb+ds2hghCCQkVSeTi5TLH4PJ7NmRej7
	fat539UWSWXhUPaKoOywOuIvXwk04bjP9saY5IpKsR5sAQ+04x3xgMchssQvPWKbiaEEJi2leYjrX
	PusEVUYbvM5xgDRXkm9TOQZ5jttY6OA+Lo7I/lcWFQDgbSjAL7IlAptrZu5erO0jow+tCPgfsAuy2
	fMmvjRUyQqBe+da16j5/x7E4rvVWwP144cAcDfTXTWUZNovG7YNGKRZsEbyvWSIYFWC2oZJqmlwI5
	67Q60q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fmV-0000000Dzji-04H2;
	Wed, 02 Sep 2026 07:53:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fmT-0000000DzjN-1Ji9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:53:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BDD2E43AA1;
	Wed,  2 Sep 2026 07:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A152C1F000E9;
	Wed,  2 Sep 2026 07:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335592;
	bh=8tmcnWUPyIMUbTM/uIlg1zfn7rYpCy3xO2rspCYwIYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YeUwKnO0aqAduF+uSSsSAmOGd/c2NJbpyp5zAMHi+oXtgRnWF9VRdFmwiKhlWzUHg
	 nldT/19uLnIos8sIHSv98f9k9FweM/xZEvaciZvX0vclTGFKi4JdHX4VHan28BGUYy
	 UqDwlaicU+KdKdOGPgEw0vRH4p6ehgakJYq9M/l8BQ1XxbfYln6YVIOhxHuoa9J2c0
	 tC0wl49PBWwUDF+mLZNDHURn+eJeQDincAO1W7P2onaX/MaSgJ7oeWoWZWhIorXrKF
	 SPybOKpwGREVSdAJc4O9DE+RKL2Lhdn5Ivc+t4BMFgoxmGay3rIj+NJ8HiSUIMv+hc
	 pFWyt3v+h138A==
Date: Wed, 2 Sep 2026 13:22:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Zhijian Han <hanzhijian1991@gmail.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4] PCI: imx6: fix resource leaks in probe error paths
Message-ID: <kyuxfl6wmsytudadd2dazw7norz25mpsk6bjsfxsj2cpo7yj3h@eujfdbehavzm>
References: <20260824150454.3511203-1-hanzhijian1991@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824150454.3511203-1-hanzhijian1991@gmail.com>
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

On Mon, Aug 24, 2026 at 11:04:54PM +0800, Zhijian Han wrote:
> imx_pcie_probe() leaks both pwrctrl devices and power domains on failure:
> 
> - imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
>   and adds device links to them, but nothing detaches the domains on
>   probe failure or deferral, so they leak.
> 
> - A failure of devm_pm_runtime_set_active_enabled() returns directly
>   without destroying the pwrctrl devices.
> 
> - A partial failure inside imx_pcie_attach_pd() leaks the power domains
>   that were already attached.
> 
> Add imx_pcie_detach_pd() to detach the power domains in reverse order of
> acquisition and call it from the probe error paths.  Add
> DL_FLAG_AUTOREMOVE_CONSUMER to the device links so the driver core
> removes them automatically when probe fails, instead of tracking and
> deleting them manually.
> 
> Reported-by: sashiko-bot@kernel.org
> Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
> Fixes: 2c5768344f88 ("PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()")
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Frank, Richard, can I get your review for this patch?

- Mani

