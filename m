Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F10C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=EytIa57dGphkpoLpmiPzevg2ZuEnpiren4W4NqbNY1s=; b=vPI5KLunMCs6vs
	ycLNW8AAB/tofrMNV3woQftr/hndW8OWl5ZjrTzZAXvdg8WbA2qg5J38HOm5PzTdZtnAwomyQxxkr
	8ElCUjjtoVMDNbUZfw3TeB04lgNAJsGl3R3kPAjF9KUP9Vbu0UCf2ZOedthIWeTssHtRiO49hjegT
	xyF9isWoD8ik4qjlMpmbnBOKJyuEwOeGJZy9LSaQ9EAldz+AmgwkKShI7TYk/VK3/ro0nD/XKqwSl
	qy5L5oMi3bWnOv072xxJa6EWbxihgn6xhogbVlg+GMmHcmiQcos4UkPhIbps2KmNXT6OA4U+n0pkZ
	nJTXMB5BGtkoxFAI7EIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZB5t-00000005xSl-2owB;
	Tue, 08 Jul 2025 16:22:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAYH-00000005rt4-045J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25FD561426;
	Tue,  8 Jul 2025 15:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E8CC4CEEF;
	Tue,  8 Jul 2025 15:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751989692;
	bh=tWWxXLhF9k7Gu3NnvmZwkqT4bKHY1QLga2J8AkBZ/3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tqXXvbp0KH/w5rcpoNORi5g5+PyEHhFyUHHZP8tDIPYN1h9/SGeJ8I5Yaom8l/T2A
	 y05ApmDsitoAxyNH4XqRnH2Bs/teWZbQBYhm4rCX2GJZhcvR0ZtRuC3N8dVsFH6COw
	 vlpD9IvbSlg6YBD8FOcYEhBSEJtwknVxKDPoafk0Qj3OXy/8G87lTO3eofRHdtMKZH
	 akMURjHkH0Nsiy4hzJ8pC93lHDT0HgI6IH/+vvGUL4d0GHTjYqP6JHANdsUXb9s2ly
	 WVo0jLOC9Z9fRYLoh18Me/oKsQxk1Q7k5N7Q20as7CDTYas48NrGzB2Xos1ZkdzWyF
	 +gIUGMSE1qMUA==
Date: Tue, 8 Jul 2025 10:48:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "mani@kernel.org" <mani@kernel.org>, Frank Li <frank.li@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: imx6: Correct the epc_features of i.MX8M chips
Message-ID: <20250708154810.GA2146917@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8676B8D14A5C54E8C32025BD8C4EA@AS8PR04MB8676.eurprd04.prod.outlook.com>
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

On Tue, Jul 08, 2025 at 07:34:57AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> ...
> > On Tue, Jun 17, 2025 at 03:34:41PM +0800, Richard Zhu wrote:
> > > i.MX8MQ PCIes have three 64-bit BAR0/2/4 capable and
> > > programmable BARs.  But i.MX8MM and i.MX8MP PCIes only have
> > > BAR0/BAR2 64bit programmable BARs, and one 256 bytes size fixed
> > > BAR4.
> > >
> > > Correct the epc_features for i.MX8MM and i.MX8MP PCIes here.
> > > i.MX8MQ is the same as i.MX8QXP, so set i.MX8MQ's epc_features
> > > to imx8q_pcie_epc_features.
> > >
> > > Fixes: 75c2f26da03f ("PCI: imx6: Add i.MX PCIe EP mode support")
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > 
> > "Correct the epc_features" doesn't include any specific
> > information, and it's hard to extract the changes for a device
> > from the commit log.
> > 
> > This is really two fixes that should be separated so the commit
> > logs can be specific:
>
> Yes, it's right.
> Since it's just one line change for i.MX8MQ. So, I combine the changes into
> this commit for i.MX8M chips.

I want to split them to make it easy for users to understand which
changes are relevant to them.  E.g., I have an i.MX8MQ system; do I
need this change and what does it mean for me?  Is it going to fix a
problem I've been seeing?

> >   - For IMX8MQ_EP, use imx8q_pcie_epc_features (64-bit BARs 0, 2, 4)
> >     instead of imx8m_pcie_epc_features (64-bit BARs 0, 2).
> > 
> >   - For IMX8MM_EP and IMX8MP_EP, add fixed 256-byte BAR 4 in
> >     imx8m_pcie_epc_features.

