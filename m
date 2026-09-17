Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431F7C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BcZKonsEm6iNlR2z607KW+Ej9GYIpjgHVKnzVdpC+VI=; b=JGc8OnSvXUdI33
	IsnTTfTRMAcL7TowbmRhilrqWy35t0wuzCntsZw4ap/s3IHrSqwubF6NgX88CTgXXceOJG7bxOIq9
	BNxZJ2NjJaydIW1JkLspdRAedDoxQElZg4xwZGsvPpHlDoLg1NIGdubix4YM29NlPGFas0qe2HVzj
	650RMWKAnYUUK2RL5PWa5JEIwp/VEF5g43COPtpM/7g1l5YeTkdr4bkxMFDxOX5t70FhDxsvCO9WH
	SzRA1yeOw5hKx19orSkGJMo6Ysy+9SIhfs7NB9twMADkjJ4YEFeGhuA8OS51UgiTFgp51LVNvfEMV
	k3ktdVuBcAqcaoGDE5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EWL-0000000BnCv-1Az6;
	Thu, 17 Sep 2026 15:59:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EWK-0000000BnCQ-0P8F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:59:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8ABE960210;
	Thu, 17 Sep 2026 15:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176A61F00893;
	Thu, 17 Sep 2026 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789660771;
	bh=BcZKonsEm6iNlR2z607KW+Ej9GYIpjgHVKnzVdpC+VI=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=VOt1Pnuv0J5qzuS/czmoPrZ8YpgfWW/bLej1RS+9XXu3txiRsUSdsbe7m1OdNV5gK
	 /MQk0j+5+h1hcHe6uQMCH6HujFlskKkENo9k/vZCLIobcHKtgndh0c0Rlhql0kcO58
	 sa8QWn67QcAeLJ5FX071zkZKGrG1FAiJu5AluIffCCebomScUSrr46rSHYRGg9OIu0
	 OkZudqQwsJnlrOTmYUd2ypaQqcQsqHpgKfjtrCX+x127+ynJIrc8zD8bdDLAYXUEii
	 +gmKPPmcWrW6XXfIpA4cq0YZX8tXsjwqj+LD9tom6Ndhs6EaCf5+5jF3taEo7s4oux
	 a2GvJXCj3TlLg==
Date: Thu, 17 Sep 2026 10:59:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Semih Baskan <strst.gs@gmail.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	rafal@milecki.pl, zajec5@gmail.com, florian.fainelli@broadcom.com,
	arnd@arndb.de, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rosenp@gmail.com, rani.hod@gmail.com
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
Message-ID: <20260917155929.GA1023894@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAsRjR=1iL+Nw0+0erVH2t8igpobXBfcqijz4vzMO7cW=ryHPw@mail.gmail.com>
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

On Thu, Sep 17, 2026 at 08:40:00AM +0300, Semih Baskan wrote:
> On Wed, Sep 16, 2026 at 03:01:10PM -0500, Bjorn Helgaas wrote:
> > If bcma finds both of these devices via EROM, why do they need a
> > "brcm,iproc-pcie" compatible?  If we omitted that compatible, what
> > would break?
> 
> bcma does not need it. pcie-iproc-platform does.

And why do we need pcie-iproc-platform, since pcie-iproc-bcma.c will
claim them?

Is there a requirement that pcie-iproc-platform must be able to claim
the PCI host bridge if CONFIG_PCIE_IPROC_BCMA is not enabled?

