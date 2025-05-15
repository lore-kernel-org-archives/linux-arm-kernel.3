Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7AEC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4gAXDPxWPC44UYdGNZ32+7sdPrHxBMRVWRq1jxqHZU=; b=Wnd1pdMseE/MmTzulaBgq0d6nK
	Qz9WIXaqdTJq8BNM6WgsTR7frV67KMcYqw92hjmPjZykhB/sqNzV3gPG/5adW7iBZs6jxO8dMMVn7
	mGN6vmLaKagtp4ebmQLLp88dgtn6pQThjLGhjWcdg5NhSxgBvtXRP+P9H3J+8G3UhEIoNDhnYJ0Fo
	sqXTV8qsiAAbg1g7K3lsQL3owFtChnUGrtkMEtfjfpjnHY6FCZFZ2Fuk8470Avks+SP7yIbW6TS4H
	ISY3FweSrWFK7hTJjlA8vE5JwCoZGBzbkdPlkbRQ1IYKvRpvakY53Lmh/F0DZWZuK7B4WcCtP2tAT
	VsaR9srQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTO7-0000000HPUW-2wFX;
	Thu, 15 May 2025 07:52:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTM5-0000000HP7a-1SDR;
	Thu, 15 May 2025 07:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 154EEA4CB1D;
	Thu, 15 May 2025 07:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC89C4CEE7;
	Thu, 15 May 2025 07:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747295411;
	bh=okgZ71SlRI1OxrfenXbRvEK2OBzl9XmUUegqvv09zLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beyqb5CK1kmn8uzdSGNFRMhole3qboOUioWcddIYpIVpMkPSCd8EO5j1L8+MpL7Pp
	 +Uxo/BtuRu1DSchP0I71oAf1NaAeChogZTdHmYDUsBAO8f3fOMoYWEf3YDQ1We6cpl
	 9PReyas9Ctyhj0HeQdyMX5ZQQZJKg4EKs8c3CDk4o9fNsJL9rmOndQW4EETTAQQ4il
	 oIpdtgilsh/OkjLx/9tQ5fjMMdz5K+oTpWlzG7wEZnZQycyoA0rjQ/LPHsMRS8MNsX
	 OCD8JsxlFnuPXRXzCz2lazIS5Zt+TiB2OdsoXjV5q1dpwIHekKD0BzK+DCbpB43a4y
	 HAU9Fob+RO6RA==
Date: Thu, 15 May 2025 09:50:05 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Wilfred Mallawa <wilfred.opensource@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Add support for slot reset on link
 down event
Message-ID: <aCWcrf4V3p7cxcpi@ryzen>
References: <20250509-b4-pci_dwc_reset_support-v3-1-37e96b4692e7@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-b4-pci_dwc_reset_support-v3-1-37e96b4692e7@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_005013_455199_579EC3D9 
X-CRM114-Status: GOOD (  14.50  )
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

On Fri, May 09, 2025 at 12:30:12PM +1000, Wilfred Mallawa wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> The PCIe link may go down in cases like firmware crashes or unstable
> connections. When this occurs, the PCIe slot must be reset to restore
> functionality. However, the current driver lacks link down handling,
> forcing users to reboot the system to recover.
> 
> This patch implements the `reset_slot` callback for link down handling
> for DWC PCIe host controller. In which, the RC is reset, reconfigured
> and link training initiated to recover from the link down event.
> 
> This patch by extension fixes issues with sysfs initiated bus resets.
> In that, currently, when a sysfs initiated bus reset is issued, the
> endpoint device is non-functional after (may link up with downgraded link
> status). With this patch adding support for link down recovery, a sysfs
> initiated bus reset works as intended. Testing conducted on a ROCK5B board
> with an M.2 NVMe drive.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
> base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
> change-id: 20250430-b4-pci_dwc_reset_support-d720dbafb7ea
> prerequisite-change-id: 20250404-pcie-reset-slot-730bfa71a202:v4
> prerequisite-patch-id: 2dad85eb26838d89569b12c19d70f392fa592667
> prerequisite-patch-id: 6238a682bd8e9476e5911b7a59263c3fc618d63e
> prerequisite-patch-id: 37cab00bc255a62b1e8396a48a3afba5e1751abd
> prerequisite-patch-id: ff711f65cf9926374646b76cd38bdd823d576764
> prerequisite-patch-id: 1654cca919d024b9a9190b28e90f722975c797e8

Now when all the prerequisite-patches have been merged to the
pci/slot-reset branch, any chance of getting this patch queued
up on pci/slot-reset branch as well?


Kind regards,
Niklas

