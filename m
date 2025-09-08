Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9BDCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYH52zP4BLHLbMP2mJl1IvUHZgKWLYGunlMb7vyg0ms=; b=JBS35cWtfriKRDkAahAuuO/Prs
	iWyHBCgYKntI0ydaLu3p84XRT16BExaTxC0aQbl51bRlimkWgnneKTRWvuzdRbqo18OJ+WR8m6C2A
	Y+WRsDenxdIBC5Cow3tvc0rOKLE8g2VNnlTAycP7X8E1cGd1wqvWa3H3CwMdRxDj+ltZDoHx+RyCg
	NQP1kWVByEJNsI9ZLczXPOKcRt4PeGqGb7BxrxaAwcQIAYYIGWUUhHKI/RIrjVxHymkc5/iMOMRmn
	EY2V1Nv8Q7Rkjed/g6ONPjlHlwZRA5tTGAgedoZ7pH2+VG3m4Vk87gizwMR+MhxLnRN4U36QVose1
	zT0/3Wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLd-000000010Zb-1ScG;
	Mon, 08 Sep 2025 17:08:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvau7-0000000GzMk-1BR9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BB77601A4;
	Mon,  8 Sep 2025 12:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17027C4CEF1;
	Mon,  8 Sep 2025 12:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757334206;
	bh=D6cneQQmhd1FoJDTC/XACRkYANyh+3X4gy7qW3UFAos=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hjqlUQvugGe99TOgR4h6szERkWrZoLhqLcNOL2cwplnO85sQCIL7+gkzaRfwiWlki
	 znXTi8CZIMYaAXqlqDpEH4BQa9yZJ5RVTgohMcvFedOVclposdrlC5O78FBNhHy6/5
	 SIviNze3FKbLtE2sitMdF7EjogdVAdynt7uQcf1cWw2lJ6Lmgd0UhHI/l1+TGuolks
	 aKsU1IFupqE7V3+tq3NiT0naS+YoQCRzfb7Mk3O4kP+1QT432XpD7BAqK3uWuyFEJR
	 a0qtK+bevHkpLv9xFgTzJ/Cic5/X81ZpdCbHsVp+96ScxC+e4SA+80np7vUjRyKPgS
	 4NmbxQ3U52xxA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, helgaas@kernel.org, kishon@kernel.org, vigneshr@ti.com, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: stable@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20250908120828.1471776-1-s-vadapalli@ti.com>
References: <20250908120828.1471776-1-s-vadapalli@ti.com>
Subject: Re: [PATCH v4] PCI: j721e: Fix programming sequence of "strap"
 settings
Message-Id: <175733420164.9759.8251040864412190074.b4-ty@kernel.org>
Date: Mon, 08 Sep 2025 17:53:21 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Mon, 08 Sep 2025 17:38:27 +0530, Siddharth Vadapalli wrote:
> The Cadence PCIe Controller integrated in the TI K3 SoCs supports both
> Root-Complex and Endpoint modes of operation. The Glue Layer allows
> "strapping" the Mode of operation of the Controller, the Link Speed
> and the Link Width. This is enabled by programming the "PCIEn_CTRL"
> register (n corresponds to the PCIe instance) within the CTRL_MMR
> memory-mapped register space. The "reset-values" of the registers are
> also different depending on the mode of operation.
> 
> [...]

Applied, thanks!

[1/1] PCI: j721e: Fix programming sequence of "strap" settings
      commit: f842d3313ba179d4005096357289c7ad09cec575

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


