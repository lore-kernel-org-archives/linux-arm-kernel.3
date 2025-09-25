Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6859CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=k7nwk9IHCkuPRfEFYGCG+MFc1LMBXB4XxcqLqO7soR4=; b=RkoYUyGZsr23Aub31EXnvDfgwG
	3lbpYqdDhqkx+bhL+UT5KXPeGISDX/CpedLyBAE37YLmbtN1Gv+drebQBgXR08YzohcsddT5ZK7H/
	uUjoBgJUeZuMOmCV18lb65qbcWt0NB0DVgnuURX+PS/q8YTd6GrpbJUoyVbMH74uipNbpbCvxRv2K
	uloNk9dPm6zYBqYgsNHe0kl30aaD/1wAWNcQG1DkSMxQrq/x0zskgHQYjT1maCfCnm5RpFYUITyBk
	EFyZCmCQd6c90nJcZ/12cDVySk4S+T2TkHw1EIaM1HsS06/OunRN+Ai/Ep+LpgXoOZH7NYhNGqQ9A
	a0f3gPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rR9-0000000CE6C-3xYQ;
	Thu, 25 Sep 2025 19:15:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rR6-0000000CE3u-3f8v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 19:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D91840948;
	Thu, 25 Sep 2025 19:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C103DC4CEF0;
	Thu, 25 Sep 2025 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758827722;
	bh=7MCu9WAn1XhTifdzDhG1kliHkb7fivInIPRnmRZyBcI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LcD8AaqXB/BQZIvkaRLcXzSCaP3SbfWtQadWYo5Amvi8SAxPZKOlNHJYI2RX/kRTl
	 YH8388EkQAd1KOQFD3vaVuso5ricLSBDYfBApSyfBg0doQNULBFHA0fjCrpJEIVx66
	 9xVzPhP0//4EETfvnP7/Pyy/wK7LGEQT4jrJZ/UBI+81zCV/7hlT0s8dfQnH8O2wh9
	 QS6JDsQXkw4fMJVjy1jnqK2ltXMSMEElAxzFidZhzaK1J4qm+7U3LKPyq0qBAsqlmc
	 /BbcSA/ESWpoKcrBnD3zlyktSnBV52expi0auAW4Gxbcrpu9ICd0drRFNqejZHOvOr
	 Ahna0RK7Sf37Q==
Date: Thu, 25 Sep 2025 14:15:20 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, chester62515@gmail.com,
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com,
	bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, cassel@kernel.org
Subject: Re: [PATCH 2/3 v2] PCI: s32g: Add initial PCIe support (RC)
Message-ID: <20250925191520.GA2175949@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJMibSgsEFeUvHswVy6zsHMn7ZXkpbhch06oQxPY9NocQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_121524_950022_5947A9FE 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, Sep 22, 2025 at 09:52:21AM -0500, Rob Herring wrote:
> On Fri, Sep 19, 2025 at 10:58 AM Vincent Guittot
> > Add initial support of the PCIe controller for S32G Soc family. Only
> > host mode is supported.

> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -255,6 +255,17 @@ config PCIE_TEGRA194_EP
> >           in order to enable device-specific features PCIE_TEGRA194_EP must be
> >           selected. This uses the DesignWare core.
> >
> > +config PCIE_S32G
> > +       bool "NXP S32G PCIe controller (host mode)"
> > +       depends on ARCH_S32 || (OF && COMPILE_TEST)
> 
> Why the OF dependency? All the DT API should be available with !CONFIG_OF.

We have lots of similar OF dependencies.  Do we really want it to be
possible to build a non-working driver in the !COMPILE_TEST case?

Maybe we should retain the OF dependency but only for !COMPILE_TEST,
like this:

  config PCIE_S32G
         depends on (ARCH_S32 && OF) || COMPILE_TEST

