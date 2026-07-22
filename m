Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9A6C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8G4blgcZphXiC5BXNXULNi1/KsmrDWO8yQMPeL7wdUQ=; b=pmmuo/zBGZ5vjp
	8L7cNZ3hx6iVO9tK7eOqvQOkdz0QrscOl+4rVCCihjgPJqcjaZFTAytU+2MrBHEfj03qa+3Lz8utv
	lPv3atdMr5Jp6d3hfGDJyTp/s3Ai7Z4Xz4JQnT9zjVLfUVv9HOpk9ilzpUfmzG8Hd9mik8SYHKri1
	eF83kwWTQOd2O18SRW0pvWZQ+qpgh/XoCABe5hR2xZD6gc8lMJNvGSK93EcjDIzPVCXpXzrmOb8dL
	BN+XNCiJmpZRCks92zhHqtuEoalhU3Qko66cbuk3pLjnBHTHgebem9Xp4tgfdn7f0STiyiBph8f0t
	W+kEPxRMxeaoYIVQ90TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma3q-0000000CNej-2F4V;
	Wed, 22 Jul 2026 16:44:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma3o-0000000CNec-327u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:44:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2182460051;
	Wed, 22 Jul 2026 16:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5E91F000E9;
	Wed, 22 Jul 2026 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738683;
	bh=8G4blgcZphXiC5BXNXULNi1/KsmrDWO8yQMPeL7wdUQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=MVHw4FJ83+OxlV4XAR180oMC8CBNtKJgBX/aWLiOB4zHtUJsJAu6zosfPHl1+mJH7
	 H2CEUBVtYHZqnygyNVKrWWYnQxMAgnfV3SSfi+EDntXv0YGiDmTVVZLf+w27tXfv72
	 GadQfdXJCrKLBkCrMVHTYQlnU4DJyii6fZ4etmnc4kTiJ2T37y9gMRTp+btvC7z13P
	 9AtV1GflF5xxk1NvFpcsrncULkBqr7gaJspKXWeI9zYluWuXjcQbs0LNLZGvrzLeeE
	 2NhhBtEZzkBmbEfm20AxK5CstZ+YBHSsTedXcWl4dPdxZ7k7s0VF+JNN/xd107CGLb
	 4/Sm1CDdP9aBQ==
Date: Wed, 22 Jul 2026 11:44:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thierry Reding <treding@nvidia.com>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH v8 4/6] PCI: tegra: Add Tegra264 support
Message-ID: <20260722164442.GA742885@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-tegra264-pcie-v8-4-23e51589229b@nvidia.com>
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

On Thu, Jul 16, 2026 at 07:07:15PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add a driver for the PCIe controller found on NVIDIA Tegra264 SoCs. The
> driver is very small, with its main purpose being to set up the address
> translation registers and then creating a standard PCI host using ECAM.
> ...

> + * The various memory regions used by the controller (I/O, memory, ECAM) are
> + * set up during early boot and have hardware-level protections in place. If
> + * the DT ranges don't match what's been setup, the controller won't be able
> + * to write the address endpoints properly, so make sure to validate that DT
> + * and firmware programming agree on these ranges.
> + */
> +static bool tegra264_pcie_check_ranges(struct platform_device *pdev)

Drive-by comment: I have a bit of an aversion to boolean functions
named "check" because "check" is not a predicate with a true/false or
yes/no answer.

"true" usually means success, which is the opposite of functions that
return 0 for success.

In this case, it looks like "if (tegra264_pcie_check_ranges())" means
the DT ranges match the hardware configuration.  If it were named
"tegra264_pcie_valid_ranges()" or similar, an "if" test like that
would read better.

