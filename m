Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64988C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgKT1GTAf1ZddatWy9KEqdf6+MO3ArUSWqetOd/t7H8=; b=jEFAXmPe9dgs9p+8G7pMMyyM9L
	sdvfREM6qubM3JaXvPfp+wrf6F4nyhqLaMiJMfjVd3jZiQb3zxPt8odhQfydTvLV6i3nzwMsSa0uo
	qEnjnb1Cm9dWtsGbFhGrZ5AhJAbvRW9r/x+vKG8j15ofq5Vi42U3HgK8xQyhHtteofXBYAYzuMuNG
	0+UTZe4UO2qGFfwniGP3vi4U6+B4X2+RWjkb09teNipED7wHz5WbfqjDE4Qc6nbM+iN6Z9f8LFh4w
	yswBMBzEiqEYkNdWzAK25+9TuKR9cCifSBYY3SJgmtDd12P2D+x+PLQdNqq3l+i2kfpnG9nvGNt95
	H5TCtrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Het-0000000H2AG-0qpL;
	Fri, 25 Apr 2025 11:55:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8G7y-0000000Ghap-3nB1;
	Fri, 25 Apr 2025 10:17:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF1926111F;
	Fri, 25 Apr 2025 10:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE911C4CEE4;
	Fri, 25 Apr 2025 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745576269;
	bh=jHetIDcoEMJE5Pmx9hfvbqtA0k/bgENuEA9snYJ/JQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVJ5ldkx0bzzY1siTZptS8iOsMb0rh/16B4dalCRuYsdMQMrTWOtVWXpNGJYSu4bI
	 Pki4Y99cTUBsZ0ykhSfWQKuC6WO5chHnfGNNxAKOlsCCX9Tcc16vOAzY2v8YJpV3sT
	 TJAcd3su86PT9qJWA6lqkKuaZrmTuoXJVRrIE6yWwINzDi0VTnLgJv8/XAvSuBBzE3
	 uV9bkJn+JAwuW5M+NTSyH1EedQSY66k7kTs4+G5c4/EJ2THhDU8zE2LC51SXHAOqJV
	 AdVDZeBeyvk542mjAKuzcXrQWY4sSlDC94JM3lZYoL2xbnK1BS5US0haYNRtQOiHAh
	 DRR5WztJ7O4VA==
Date: Fri, 25 Apr 2025 12:17:43 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, thomas.petazzoni@bootlin.com,
	manivannan.sadhasivam@linaro.org, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/2] PCI: Remove redundant MPS configuration
Message-ID: <aAthR8ZXSqfe6fzV@ryzen>
References: <20250425095708.32662-1-18255117159@163.com>
 <20250425095708.32662-3-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425095708.32662-3-18255117159@163.com>
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

On Fri, Apr 25, 2025 at 05:57:08PM +0800, Hans Zhang wrote:
> With the PCI core now centrally configuring root port MPS to
> hardware-supported maximums (via 128 << pcie_mpss) during host probing,
> platform-specific MPS adjustments are redundant. This patch removes the
> custom the configuration of the max payload logic to align with the
> standardized initialization flow.
> 
> By eliminating redundant code, this change prevents conflicts with global
> PCIe hierarchy tuning policies and reduces maintenance overhead. The Meson
> driver now fully relies on the core PCI framework for MPS configuration,
> ensuring consistency across the PCIe topology while preserving
> hardware-specific MRRS handling.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
>  drivers/pci/controller/pci-aardvark.c  |  2 --

Since you are touching two drivers (and the changes are not exactly identical),
I suggest that you do one patch per driver.


Kind regards,
Niklas

