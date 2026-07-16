Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F33C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DfTFlvTuJ9NehD+xuHhlkvJ5W5X3RAJvY9aSf5a6Rik=; b=M6yUvxId4ueanu
	fHrbjb2Gm8vnQLdn4wFfxRB9e9j/xrQVSMXq0a178FzncHJHcvP7tu/Nwi2wq4tWndKbV+DWvcXeS
	I962TOwyamLkjNsu1osx/8pMuRj0aosLqAl0QH2RWXy/jZWnggpNT6KoNFJXDM4t/qde3p5WbbuYp
	xh0ku6p62Dx5wlW4OGkTcotrhYXsRZy8YdHnNPN0upAAdS8N3cowfvRi0BokODf1z0COBVZeDtN2n
	Ks82zQJ1NxXXGNjcazsUet9B5x7dgEE+e5I4AeB7A3CX3XfpXjYRCSWRa2sLlS7UjbVHzoEoEHixX
	+kAjhEuiHKALloUwGxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPtN-00000000HHT-17C4;
	Thu, 16 Jul 2026 17:29:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPtM-00000000HHM-08BW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:29:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C582942390;
	Thu, 16 Jul 2026 17:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F411F000E9;
	Thu, 16 Jul 2026 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784222939;
	bh=DfTFlvTuJ9NehD+xuHhlkvJ5W5X3RAJvY9aSf5a6Rik=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=aEitLXbMPF+ZDmNzgzoeO2ISIaNS2tPrWwnLNqK8ednlZh1BFUnWStIW8u4B0nKBj
	 5DudZuSLRPdkENxkGz99NrkGQp/tgvpXWlOqP4HT2p0dHQr9xABISKJdOrfKWjgPN3
	 lh2/GE38DWMY7oVEtIknNPklQTVqmZf2DFvoqjwY2yJbqtKPNJEz6oWV8KWY8Z/LDP
	 5d0vO7bLRd7pGsSlzxHtcig3H+Bk5PxNnfYtudQR1J1Z4pj3LQ2qv03vf14m6d95lJ
	 rC53fTeCKYe5utGbr6GKS76/cdxmGjUKSIU814FPBcsVINFDSYVaZz2KPyBArCglEh
	 +dAxPGR80lyvg==
Date: Thu, 16 Jul 2026 12:28:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>,
	Leonardo Costa <leoreis.costa@gmail.com>,
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
Message-ID: <20260716172858.GA111215@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb92c269-efa2-4f39-bd47-4d1ee36169ee@leemhuis.info>
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

On Thu, Jul 16, 2026 at 07:16:31PM +0200, Thorsten Leemhuis wrote:
> On 7/16/26 18:40, Bjorn Helgaas wrote:
> > On Thu, Jul 16, 2026 at 02:15:42AM +0000, Hongxing Zhu (OSS) wrote:
> >>> On Mon, Jun 29, 2026 at 11:34:32AM -0300, Leonardo Costa wrote:
> >>>> We are seeing a regression on Apalis iMX6 where the kernel
> >>>> doesn't boot in the newest v7.2-rc1 (it was working before, in
> >>>> v7.1). The device tree being used is the imx6q-apalis-eval.dtb.
> >>>> The kernel configuration
> >>>> used is the one shown below:
> >> ...
> > 
> >>> Can somebody confirm that reverting 610fa91d9863 fixes this
> >>> regression, or at least that 610fa91d9863^ works and 610fa91d9863
> >>> fails?
> >>
> >> Sorry for this severe regression. I have posted a fix that has been
> >> tested on my i.MX6Q SabreSD board:
> >>
> >> https://lore.kernel.org/imx/20260708035928.580236-2-hongxing.zhu@oss.nxp.com/
> > 
> > My question was whether somebody had actually bisected to 610fa91d9863
> > ("PCI: imx6: Assert PERST# before enabling regulators").  I don't see
> > anything specific on the mailing list, so I don't know how
> > 610fa91d9863 got blamed for the regression.
> 
> That was me and might have been a stupid idea. I normally wouldn't have
> added this, but a earlier message from Hongxing Zhu sounded a pretty
> convincingly like something along the lines of  "this is the problem I
> already have a fix for there" -- and then I took the commit-id from there.

Ah, ok, that explains it, thanks!  Hopefully we can get some clear
connection in the patch that eventually gets merged.

