Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FDFC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=d4FP0FJJEP1TpqyRxTXwD17LozGEk+UT3ax8UWeaEnk=; b=l6SvIVZeTeXYTx
	gRQIiWK91WnVOHSZxUXtqsNXhX7X7AgiPW5Hve7RS36JpTDtDM2EbG9w4GpecGS5P0spSrO6qxPKJ
	/V6WpvKHzER/DyP9tTU7nsDYdaKOgD0QZq0fy/xwdu13fvsxBwYQ+PCwFAm3tWGLoX4acQgyY38B8
	CgQTQ2tVlFNkE4DV0/iFKAGlEqXjfhekvbx57WqoyXwo+kT5bnAYklc83XE2EGRxEIhXisCz6b22G
	CWlxxMU5uzGgTjuVX2zTjEf9qEpiH4NAwQXVNx9eiv5vK1ptT5y+cfVoNCjLK+U503ifNt2NezHrr
	UadW1+a2o93j+9l/FuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGI1-0000000GUis-0HE1;
	Thu, 05 Jun 2025 19:30:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGFs-0000000GUJl-3rKO;
	Thu, 05 Jun 2025 19:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21A7E629EE;
	Thu,  5 Jun 2025 19:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07F9C4CEE7;
	Thu,  5 Jun 2025 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749151679;
	bh=L08Z+c86rt+7Uew7RNlKjl+fcB40BUMD0TL4zqIMrEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lk92OT84u8fE1CrfvOVMIyfSH1us3TkX1bnAlMhfHe9ioRSKeSoG40ZxKGzNftNXP
	 H6C27vxmEKD4MXvOjLJsf3zSBYp+zdlS/zmX5sUgjOPIHNPM71mv07CcbUqyPA1pJi
	 diUDfKebgiSQ39Mdo2sT15lzynBVESgGJ54txwHIoXIpnaYGOzb3SvYF5XpoJ78Ruv
	 GUk0bh2AQH1fEwt67fW0NPYFLj672t/uhGgi9HSJ+TX2IKsQFBXBXccoR9V6hUsYtz
	 pB6GE6uYVcYAG/5CW5J+RB5IbayIIrJyl6w7jfMVGvzd7lBK3ZcD2Qr9Trq543pgwD
	 Ma5PLN4cDZk7Q==
Date: Thu, 5 Jun 2025 14:27:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <20250605192758.GA622022@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEGNefEgf56P-mBM@ryzen>
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

On Thu, Jun 05, 2025 at 02:28:41PM +0200, Niklas Cassel wrote:
> On Wed, Jun 04, 2025 at 01:44:45PM -0500, Bjorn Helgaas wrote:
> > On Wed, Jun 04, 2025 at 10:40:09PM +0530, Manivannan Sadhasivam wrote:
> > 
> > > > If we add a 100 ms sleep after wait_for_link(), then I suggest that we
> > > > also reduce LINK_WAIT_SLEEP_MS to something shorter.
> > > 
> > > No. The 900ms sleep is to make sure that we wait 1s before erroring out
> > > assuming that the device is not present. This is mandated by the spec. So
> > > irrespective of the delay we add *after* link up, we should try to detect the
> > > link up for ~1s.
> > 
> > I think it would be sensible for dw_pcie_wait_for_link() to check for
> > link up more frequently, i.e., reduce LINK_WAIT_SLEEP_MS and increase
> > LINK_WAIT_MAX_RETRIES.
> > 
> > If LINK_WAIT_SLEEP_MS * LINK_WAIT_MAX_RETRIES is for the 1.0s
> > mentioned in sec 6.6.1, seems like maybe we should make a generic
> > #define for it so we could include the spec reference and use it
> > across all drivers.  And resolve the question of 900ms vs 1000ms.
> 
> Like Bjorn mentioned, when I wrote reduce LINK_WAIT_SLEEP_MS,
> I simply meant that we should poll for link up more frequently.
> 
> But yes, if we reduce LINK_WAIT_SLEEP_MS we should bump
> LINK_WAIT_MAX_RETRIES to not change the current max wait time.
> 
> 
> Bjorn, should I send something out after -rc1, or did you want
> to work on this yourself?

Yes, please post something after -rc1.  Given the number of drivers
and the much smaller number of msleep() calls, I suspect lots of
drivers have similar problems.

Bjorn

