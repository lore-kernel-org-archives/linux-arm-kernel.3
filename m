Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B0BCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tw5R9y5vIdx4DruH+4aa9hDl3op6fluUl5HZvUapRbw=; b=fXPiPflym2A1jCbqK1oz/nXVlU
	iPoKrdNu2zBetBBaodeQ8rXQ1g9UOYtH6DaHUzKxMSqKDldJwNGRA6xlBdZ0TuUQe4D3yqJC+lr2t
	tJqmTdqHSqbP8pGgVRqg/AZnR2EG7pgXCtwc4AS4emM2icZEtkkrThR9Bsme1jO5cZ4i/DLb/VOma
	5V1wuqJWpWL4vKuzNHtPGp7ROUZZ+HM15U+Y0WHh0YI5GIyxxJStZKlMjsQ3EBRM6pQ+3tEkLarcN
	Xmaio54O49yOS8PfB8k/6cPGljAX2zXUL6H7b86GD+ZFB91V749SMAWI1zyrwB7ZDF8powCRW2C6m
	0gmqMtgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8w5T-00000000mSd-3Ln0;
	Wed, 15 Oct 2025 07:38:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8w5S-00000000mRx-4A57
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 236166020A;
	Wed, 15 Oct 2025 07:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EE0C4CEF8;
	Wed, 15 Oct 2025 07:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760513897;
	bh=U7zfYFj65AKb6ukgrALS6SRxw3Y19iCTGy3WE/Svwb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mm73rybAUa4liouUp1ux2SvCcrFlvCmbB7ou9O0CmAe9HGqkIoT/vce0olky2RbOa
	 9y04pz7R8H+v0zlL9W9Isda0uC3mxkDcIXfgkk3K+PcIFhfVpNPAOtLpe4R5poQCkL
	 SDrgoQ1zJ2PJL8M5pGpf4HTenh1zt1OQ2zOr08dOg4jBh4uwvzkYw0O5W3r5MvJvyQ
	 uy8r96mMmb36q8PX43BxJHoeFs0xiunSArEL1Jnmc5VyWy69wtLE83E+DwCLLwevBV
	 41u67iv0Og5LAcObaX5W6Dpfpk+yYwRLyA2I6xuhswcgj7WXTthAHTiGckNRscfWhj
	 xBldso6WyyxsQ==
Date: Wed, 15 Oct 2025 09:38:11 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v2 1/4] of/irq: Add msi-parent check to of_msi_xlate()
Message-ID: <aO9PY2Ze2ISkNP1Z@lpieralisi>
References: <20251014095845.1310624-2-lpieralisi@kernel.org>
 <20251014222940.GA913235@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014222940.GA913235@bhelgaas>
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

On Tue, Oct 14, 2025 at 05:29:40PM -0500, Bjorn Helgaas wrote:
> On Tue, Oct 14, 2025 at 11:58:42AM +0200, Lorenzo Pieralisi wrote:
> > In some legacy platforms the MSI controller for a PCI host bridge is
> > identified by an msi-parent property whose phandle points at an MSI
> > controller node with no #msi-cells property, that implicitly means
> 
> Looks like you intended to continue the sentence here?

Sigh. "that implicitly means #msi-cells == 0", the `#` caused this.

Apologies.

Lorenzo

> > For such platforms, mapping a device ID and retrieving the MSI controller
> > node becomes simply a matter of checking whether in the device hierarchy
> > there is an msi-parent property pointing at an MSI controller node with
> > such characteristics.
> > 
> > Add a helper function to of_msi_xlate() to check the msi-parent property in
> > addition to msi-map and retrieve the MSI controller node (with a 1:1 ID
> > deviceID-IN<->deviceID-OUT  mapping) to provide support for deviceID
> > mapping and MSI controller node retrieval for such platforms.

