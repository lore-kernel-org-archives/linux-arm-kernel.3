Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94646C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4ChSjx4fk69gfHv1GMVRwlzOo/IGJIW9wvLwq+kdsI=; b=NYCBgP4QnkEWSvyv2hBOTk2ypY
	OdDqNHwqIANWPsfWu4kaDjfIq9tWIK25wcZvw/cndrpRV8XrSQFGo3sWjmJUKfJMZPuPbbuTJuaNr
	5Zid58zd09roC+5ASwKY3aquFRqQXMXrRbL1X0Z9W6iRjxE0i5xGjxmGV3FINjvJ/rBrLxFjsO1kr
	yHpyIUoS/+UTtekZb4y9uy+vbooIl1pNuxjumJKHCEvINqHtUZNiBSNLCclzOT9W7IDJkEirzcBjL
	0iEjh8Xc9qudd0BhEvX8I/YtpKswytyuQbQRVeQPKojjBDydJFjrPdLe3m9g8ksW3gQzZlX3iyqO9
	k+VEAgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9tb-0000000FUsf-2upG;
	Thu, 05 Jun 2025 12:40:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9iD-0000000FTj3-0tRr;
	Thu, 05 Jun 2025 12:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0D3EA506E7;
	Thu,  5 Jun 2025 12:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FADC4CEE7;
	Thu,  5 Jun 2025 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749126527;
	bh=OsTzD+oORNTzhAZmxmT/ueCMxPcm05WUBUz9VWZM/PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2s7MXZrn6Og/9t2StYKytwNqM8xht9QkdPBaXhclk+Rpfm8jYQGfNh+/87G9Z7Aj
	 bUjNTQDxBwTbexMFcNXzCn/g2ap8mMmhubkmnKRIcFwa7OM2PqvMrSk+Cb5DhL05VG
	 RUNxClMieuWFyzVnIeyEAYVQVdGLK1B33ObOk+791RlcHnjPIbuKqV+TU7+ghzBphh
	 BS/IkXrrg40u2+6oU3XMvhlPhqFNhgW7EwLTg3XwTJq+IDQPbJixpzZCQmwoPv528A
	 /98ac8Rix/Iw+xCS0pULxLA1GOPJnaZCWjLb12W3cq0O7Q1ODGUZHPfWTnUfC9KkDR
	 8jNrzYlOgItEg==
Date: Thu, 5 Jun 2025 14:28:41 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <aEGNefEgf56P-mBM@ryzen>
References: <rrtrcwajj4vjvbqzosskdnroqnijzaafncgckoh2dlk3c4njvs@twop3vyidmh7>
 <20250604184445.GA567382@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604184445.GA567382@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_052849_318288_98831719 
X-CRM114-Status: GOOD (  19.03  )
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

On Wed, Jun 04, 2025 at 01:44:45PM -0500, Bjorn Helgaas wrote:
> On Wed, Jun 04, 2025 at 10:40:09PM +0530, Manivannan Sadhasivam wrote:
> 
> > > If we add a 100 ms sleep after wait_for_link(), then I suggest that we
> > > also reduce LINK_WAIT_SLEEP_MS to something shorter.
> > 
> > No. The 900ms sleep is to make sure that we wait 1s before erroring out
> > assuming that the device is not present. This is mandated by the spec. So
> > irrespective of the delay we add *after* link up, we should try to detect the
> > link up for ~1s.
> 
> I think it would be sensible for dw_pcie_wait_for_link() to check for
> link up more frequently, i.e., reduce LINK_WAIT_SLEEP_MS and increase
> LINK_WAIT_MAX_RETRIES.
> 
> If LINK_WAIT_SLEEP_MS * LINK_WAIT_MAX_RETRIES is for the 1.0s
> mentioned in sec 6.6.1, seems like maybe we should make a generic
> #define for it so we could include the spec reference and use it
> across all drivers.  And resolve the question of 900ms vs 1000ms.

Like Bjorn mentioned, when I wrote reduce LINK_WAIT_SLEEP_MS,
I simply meant that we should poll for link up more frequently.

But yes, if we reduce LINK_WAIT_SLEEP_MS we should bump
LINK_WAIT_MAX_RETRIES to not change the current max wait time.


Bjorn, should I send something out after -rc1, or did you want
to work on this yourself?


Kind regards,
Niklas

