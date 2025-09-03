Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2BECA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Uh+JdN6uD2OVYv05+5wOT2A4tD089bjuOjEP6iyKYF8=; b=RReiQuqjljq5k1
	b0UEpUql6y+NicPJdPNLQSnEkFrMdRjx+CdYsljLGf4nmBNCCmi7Z2AvOYDyEy0AdeVCFa+hwbbXm
	oNq2XBd4mEq+uNNnY8IwLmCqN6PxV92RirI2y11l0tvcPj76CA14gE9d7Zh7cSg8UXIs3SX1rzPTo
	nlRzXxDv05MKt2giX8okbDFfyguAcySLSS+Hh4Hsi05mHnSFmGshFQK3dJlCzMK05QOix4Sug7J/3
	0ohvsLluyheqIS9s6rhnDu5FEKaHEIkIQ2AvvpnSTnvqBZVvdm4Qc6qcoHgV6zZd2psOr2MK9y/uI
	IMggX8Ui0lK+fLqJCnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utv5H-00000007h07-2yTi;
	Wed, 03 Sep 2025 21:32:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrO9-00000007CS8-0vXU;
	Wed, 03 Sep 2025 17:35:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BFAA419FF;
	Wed,  3 Sep 2025 17:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19105C4CEE7;
	Wed,  3 Sep 2025 17:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756920916;
	bh=q6ydgpRA1n1VIVTSnFUEGYa1rwgxWt3LP1v3p67itsg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sOZUP0mp3NJ6r81IFD9cb54V0EIXSHPX4quWZcx7vduX1mse2py9qfzIn+h5zuWlv
	 IGIC8P0JLeQCX7+F9zxFxViT/V0bbbGHfszPFQCw3zic8XAUhHytPYFc0Fxn/E0xtL
	 qep8q3Ow1ncZvuj/xkcI5usGLSfQF8fAyLDdHx6wdbfKmeXfcBPL2e3n71Gipez7HM
	 LvU6ILGBUSCQd53RY2UApho63BbVysdM2MY263lNWtLOgxkLLk/DcTYCNJx2DeT9Bh
	 X9nDUEjFog3CwA+rj3KD4PuZBQM9JxKXdruBrmZ6kg59MR2SetrlWmH39myq1Zqtjh
	 A1fPV98oJ59HA==
Date: Wed, 3 Sep 2025 12:35:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v5 1/2] PCI: Configure root port MPS during host probing
Message-ID: <20250903173514.GA1207260@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76cdf841-2c72-4faa-b2b9-7b2098337de0@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_103517_305947_E0E9595D 
X-CRM114-Status: GOOD (  30.86  )
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

On Thu, Sep 04, 2025 at 01:11:22AM +0800, Hans Zhang wrote:
> On 2025/9/3 01:48, Bjorn Helgaas wrote:
> > On Fri, Jun 20, 2025 at 11:55:06PM +0800, Hans Zhang wrote:
> > > Current PCIe initialization logic may leave root ports operating with
> > > non-optimal Maximum Payload Size (MPS) settings. While downstream device
> > > configuration is handled during bus enumeration, root port MPS values
> > > inherited from firmware or hardware defaults ...
> > 
> > Apparently Root Port MPS configuration is different from that for
> > downstream devices?

> Yes, at the very beginning, the situation I tested was like the previous
> reply:
> https://lore.kernel.org/linux-pci/bb40385c-6839-484c-90b2-d6c7ecb95ba9@163.com/

I meant that this commit log suggests the *code path* is different for
Root Ports than other devices.

> > > might not utilize the full
> > > capabilities supported by the controller hardware. This can result in
> > > suboptimal data transfer efficiency across the PCIe hierarchy.
> > > 
> > > During host controller probing phase, when PCIe bus tuning is enabled,
> > > the implementation now configures root port MPS settings to their
> > > hardware-supported maximum values. Specifically, when configuring the MPS
> > > for a PCIe device, if the device is a root port and the bus tuning is not
> > > disabled (PCIE_BUS_TUNE_OFF), the MPS is set to 128 << dev->pcie_mpss to
> > > match the Root Port's maximum supported payload size. The Max Read Request
> > > Size (MRRS) is subsequently adjusted through existing companion logic to
> > > maintain compatibility with PCIe specifications.
> > > 
> > > Note that this initial setting of the root port MPS to the maximum might
> > > be reduced later during the enumeration of downstream devices if any of
> > > those devices do not support the maximum MPS of the root port.
> > > 
> > > Explicit initialization at host probing stage ensures consistent PCIe
> > > topology configuration before downstream devices perform their own MPS
> > > negotiations. This proactive approach addresses platform-specific
> > > requirements where controller drivers depend on properly initialized
> > > root port settings, while maintaining backward compatibility through
> > > PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
> > > utilized without altering existing device negotiation behaviors.

> > Update the MRRS "to maintain compatibility" part.  I'm dubious about
> > there being a spec compatibility issue with respect to MRRS.  Cite the
> > relevant section if there is an issue.
> 
> The description is inaccurate. I will correct it.
> 
> I plan to modify the commit message as follows:
> If there are any incorrect descriptions, please correct them. Thank you very
> much.
> 
> Current PCIe initialization logic may leave Root Ports operating with
> non-optimal Maximum Payload Size (MPS) settings. While downstream device
> configuration is handled during bus enumeration, Root Port MPS values
> inherited from firmware or hardware defaults might not utilize the full
> capabilities supported by the controller hardware. This can result in
> suboptimal data transfer efficiency across the PCIe hierarchy.
> 
> With this patch, during the host controller probing phase and when PCIe
> bus tuning is enabled, the implementation configures Root Port MPS
> settings to their hardware-supported maximum values. Specifically, when
> configuring the MPS for a PCIe device, if the device is a Root Port and
> the bus tuning is not disabled (PCIE_BUS_TUNE_OFF), the MPS is set to
> 128 << dev->pcie_mpss to match the Root Port's maximum supported payload
> size. The Max Read Request Size (MRRS) is subsequently adjusted by
> existing logic in pci_configure_mps() to ensure it is not less than the
> MPS, maintaining compliance with PCIe specifications (see PCIe r7.0,
> sec 7.5.3.4).

AFAICS, sec 7.5.3.4 doesn't say anything about a relationship between
MRRS and MPS.  MPS is a constraint on the payload size of TLPs with
data (Memory Writes, Completions with Data, etc).  MRRS is a
constraint on the Length field in a Memory Read Request.  A single
Memory Read can be satisified with several Completions.  MPS is one of
the things that determines how many Completions are required.

This has more details and a lot of good discussion:
https://www.xilinx.com/support/documentation/white_papers/wp350.pdf

