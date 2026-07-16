Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704F6C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=88UMF+eU7HiAKdmWyHdi8ruaFAzo0R90LbSMbDbrqWc=; b=GzI8h1tlCK13tI
	YnDx4DPcnoBIYTV/tCy31BzDuoP5pgP0BwMFvSakgV2B0t251IqWCSNLqyTvRnKvPefd+Gzm7gxjU
	+LXd+zEDeEy14407TqUfbNMFG/JQaSTzk1RGJgHyZQZ0RM9qxM9kSZtuRzZrrKPFDayqbyZIecIuD
	BfTIWLW7RGVWGODKAF3FKNap1GeFcbI0j/CxEW9yKn2/K8M3xffojZmJvWPFkRD91+KIzxSAfVCZo
	7qmRZKyvTnDZZN5UF0mnbWiO+uHqsYBXHYl/+thyKC70GJ4tuwlRJY0AUc0H4l1YMrVSO9yG13Uy6
	6zmMRmJKcDw5yoTdFaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP8w-00000000C39-28uO;
	Thu, 16 Jul 2026 16:41:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkP8u-00000000C2z-300k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:41:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24DC840967;
	Thu, 16 Jul 2026 16:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EB71F000E9;
	Thu, 16 Jul 2026 16:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220060;
	bh=88UMF+eU7HiAKdmWyHdi8ruaFAzo0R90LbSMbDbrqWc=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=MT+Yp0fXYwTGnaSkIHjy79XOarEsKn3ydw7f9xPZP6R/37qfbxtN4MeTXYox9p9mm
	 K81jwZd8nnHX6DbVK8xWFQ06ybwVlgK7Wd01X+hLha4h6NV8o0Hu1NTwINky05Bvlx
	 Em7qhBhd4C6rfQqFHitDWmbAUonbKPS5161cyz1AENMb/2YDUL/VDxFd18Y4C1YhK7
	 TAqft2VkXHf0nivVmzHnA0MqF50dHqGpudxL2b83oEPFdHMPqdkMzvj+mP7Ml4h30n
	 sZMdqNnYIl/3f4PR1417cMt5bxFKYUTRuo1kYyj1B6YlEPoi/lpUzElPRW4w9G8tPw
	 zCTwHvxfQaGxw==
Date: Thu, 16 Jul 2026 11:40:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: Leonardo Costa <leoreis.costa@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"leonardo.costa@toradex.com" <leonardo.costa@toradex.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Sherry Sun <sherry.sun@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <20260716164058.GA16414@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>
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

On Thu, Jul 16, 2026 at 02:15:42AM +0000, Hongxing Zhu (OSS) wrote:
> > On Mon, Jun 29, 2026 at 11:34:32AM -0300, Leonardo Costa wrote:
> > > We are seeing a regression on Apalis iMX6 where the kernel
> > > doesn't boot in the newest v7.2-rc1 (it was working before, in
> > > v7.1). The device tree being used is the imx6q-apalis-eval.dtb.
> > > The kernel configuration
> > > used is the one shown below:
> ...

> > Can somebody confirm that reverting 610fa91d9863 fixes this
> > regression, or at least that 610fa91d9863^ works and 610fa91d9863
> > fails?
>
> Sorry for this severe regression. I have posted a fix that has been
> tested on my i.MX6Q SabreSD board:
> 
> https://lore.kernel.org/imx/20260708035928.580236-2-hongxing.zhu@oss.nxp.com/

My question was whether somebody had actually bisected to 610fa91d9863
("PCI: imx6: Assert PERST# before enabling regulators").  I don't see
anything specific on the mailing list, so I don't know how
610fa91d9863 got blamed for the regression.

https://linux-regtracking.leemhuis.info/regzbot/mainline/ lists this
as a regression caused by 610fa91d9863, which means we need (1) the
details to prove that 610fa91d9863 actually caused it and (2) a tested
revert or fix.

