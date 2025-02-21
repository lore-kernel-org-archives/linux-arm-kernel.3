Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84A1C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=eqAN9zdmueDcpFIiEgwtgeJxkMdzW/TgQwuturGyRIU=; b=QIUp7ZPgtE6+KW
	1+qAy7rchkp4c4MCbfSKgDjaEvQl24rDXaz7QNe5O5TerBO9IBMEiqCFdmZFrIID484Ag1mYmFXwm
	bwTv2xcvPpCEBLzDGnMS7H7BO/Xw0bldBU6YnmtcHHAThNXvF0UF+9tQjA16agzJwWXzxGSBpX7vi
	qSd9nvLsJS102j7btUK1HrBlJJK0m5cuNMBrjbnZVNSR1zN4Z0XM+vZzwR8xgd9Evg6Lhe22fXgsC
	DSMrZvWdJ/2iRgvyAruOf5WHWAipeHeVkCyyHABGkLjpxJM0g2Jnc+xYEVNgD+ylDa4ocImjYORW3
	7WzuXuM9UEKfp/Hg6XZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlafV-00000006vNC-2Aib;
	Fri, 21 Feb 2025 21:34:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlae2-00000006vFK-29t1;
	Fri, 21 Feb 2025 21:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34CCD5C6DF1;
	Fri, 21 Feb 2025 21:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8B4C4CED6;
	Fri, 21 Feb 2025 21:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740173593;
	bh=YguojFeZQ1Lx0oD73VLf2qvbtWuaYfQHYVhFNJxGqcc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pI+OqPw3S1f4uPK/qsVZPlTlFkJWoXXV7COQC0U7sscNezGrsRxoHQ7/xOeYHDSev
	 Ypy/37X2kBbp8bKR0BpV/ndXbZBx4msKzDlYpvA/spRVQvSl7M8QkclZuW5CbNxIsT
	 fx4Xoe43a7Eg41JFcEXylnOFiG9MAojydrpN8PIAnbRmPBC1rlagN3UaI4VTNIBMp6
	 bzQKQhU/o9jw8wTKTlYBf7PgQScsDlbsfd29giuk+Nklsj2dHc63joYmTUXUMkzeZJ
	 WaKcwOS/8GOzvUSQYXRYDGv4r7SZB3pnHLj0xPbOC+cqft1mVBhEBaj7MJyrjJk4eB
	 6d0fuZiT53IKw==
Date: Fri, 21 Feb 2025 15:33:11 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 07/11] PCI: brcmstb: Adjust PHY PLL setup to use
 a 54MHz input refclk
Message-ID: <20250221213311.GA362736@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120130119.671119-8-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_133314_614842_25686212 
X-CRM114-Status: GOOD (  10.85  )
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

On Mon, Jan 20, 2025 at 03:01:15PM +0200, Stanimir Varbanov wrote:
> The default input reference clock for the PHY PLL is 100Mhz, except for
> some devices where it is 54Mhz like bcm2712C1 and bcm2712D0.
> 
> To implement this adjustments introduce a new .post_setup op in
> pcie_cfg_data and call it at the end of brcm_pcie_setup function.
> 
> The bcm2712 .post_setup callback implements the required MDIO writes that
> switch the PLL refclk and also change PHY PM clock period.
> 
> Without this RPi5 PCIex1 is unable to enumerate endpoint devices on
> the expansion connector.

This makes it sound like this patch should be reordered before "[PATCH
v5 -next 06/11] PCI: brcmstb: Add bcm2712 support".

We don't really want a driver to claim a bcm2712 controller before
it's able to enumerate devices, because that would break bisection
through this.

Bjorn

