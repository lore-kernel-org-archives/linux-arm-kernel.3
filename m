Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385A7C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+Nl0kKjcqjuGAZnj8Tx1IXItznL5XPhT0qzRTVxNau8=; b=rwxaAhubp1M0VH
	yF6w5M7Nf2PR6BEvWUVxwWjBTmjcfIH6BdrboqZzW0jkBVZnHTfcH1RdVxV9N5geBVTub46qHpNEP
	/de/NHJoswjHvG7eZNjU4LD6fj7K2zMN5xFYti7fvPuF/Db/Zv/SHri/yNGiSJAkLODutsfMqJf0E
	3nEzh5jqNNuI0ip76R4Or24qzxyKbj1SSUVp9CSJYCSG/lvJxBcy2b/x33l7ClbNXzLBZOFpY6NIZ
	ujrnlPovepbRxIspX3pggTmdF/0Q0xK6DbJZwFaQ9lA6dJN1Lk6/2XBMci8cTjgyFxC6mps9uDxDU
	QjfH5zRtUADhqR0vEaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBd-000000061hP-3QMN;
	Tue, 15 Jul 2025 19:19:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubj7Z-00000005nsY-1izs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C99BB459B0;
	Tue, 15 Jul 2025 17:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7322CC4CEE3;
	Tue, 15 Jul 2025 17:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752599232;
	bh=9G4DPMLc3V6Kqc+YEESQ26iQmayIypZSFV1NfnFRgYo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bBweZLifiRV+tHUaSKX0xSnHlsH+cD65JbpVqEISEb9/xrkIq262JFfcbWxDZbzEX
	 WX1ozZlOj/fBILfQpCBNZ1iMEL0DbexeSyPI6y+U5q7qhzMMMa0X0QGqtkRGS3oGvk
	 8WwuVIDBKDFa2W8gDqMClE2/8KVgXv/aDcF0FUuOo5Fem/OOehhEBWwS60SKZ8oeEF
	 tTSv1f6BdjOv+80X5hO0dkwzLOzBjGU/yGvJkUtjY8eepfvyIBcSx1xQXAITQbk510
	 bo1Y6mC3Di83vV0gDwGCZ8AmTDnzdje9Hy4O+J84m+EqFO/rtpaJfLH1GNNKlnE5aq
	 d5wTyRdNez/RQ==
Date: Tue, 15 Jul 2025 12:07:11 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] PCI: imx6: Correct the epc_features of i.MX8M EPs
Message-ID: <20250715170711.GA2467369@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708091003.2582846-1-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_100713_468179_B9FE2742 
X-CRM114-Status: GOOD (  11.97  )
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

On Tue, Jul 08, 2025 at 05:10:01PM +0800, Richard Zhu wrote:
> IMX8MQ_EP has three 64-bit BAR0/2/4 capable and programmable BARs. For
> IMX8MQ_EP, use imx8q_pcie_epc_features (64-bit BARs 0, 2, 4) instead
> of imx8m_pcie_epc_features (64-bit BARs 0, 2).
> 
> For IMX8MM_EP and IMX8MP_EP, add fixed 256-byte BAR 4 and reserved BAR 5
> in imx8m_pcie_epc_features.
> 
> Main changes in v3:
> Seperate the patch into two commits and update the commit logs refer to
> Bjorn's suggestions.
> v2: https://lkml.org/lkml/2025/6/17/267
> 
> [PATCH v3 1/2] PCI: imx6: Correct the epc_features of IMX8MQ_EP
> [PATCH v3 2/2] PCI: imx6: Correct the epc_features of IMX8MM_EP and
> 
> drivers/pci/controller/dwc/pci-imx6.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

Thanks, Richard, I updated pci/controller/imx6 with these patches.

