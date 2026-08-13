Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F13C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=VWzDmzaSohfXNDpzSvOTbywfXkmzWVFikcHjO6Hw6u4=; b=l7Kxfrovcagggr
	qfEdGWhMUIHgD8cDFLsWSK4TIVYxr1j6xD7IO7HKAjcahFLLqj7ylnny78P2pVT51qOMrH/lBWlDz
	W5QuEpHVzwgxPiLo68epQ+H5If0R8MPJm6pn1XgkRdqx/KWLAldIKryEO3t5KxYviX8qBnC19cZ4x
	RlxMAVGFJ2f0F6/NR8We/wkENETRzvF2qy24nFKYQpNRYAmppQDPnIQEWMVUcbxOq0L1IFajAQhYJ
	EUFj5rqOvRMZtpANQLYBZgKrSPP2s00Rk38RQWD6CyvJIZGmiNBuIqDlRBR+rG9Y3BG+s/U6bPhDb
	xTbmLmC68oRrw1a80rhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYuo-00000001FdC-1Ts5;
	Thu, 13 Aug 2026 17:08:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYul-00000001Fc1-02ZD;
	Thu, 13 Aug 2026 17:08:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42647600AF;
	Thu, 13 Aug 2026 17:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB171F000E9;
	Thu, 13 Aug 2026 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786640902;
	bh=VWzDmzaSohfXNDpzSvOTbywfXkmzWVFikcHjO6Hw6u4=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=oMexpM9HgR/F0qhmie3lMLfDUJpZIBemLcjAJuOeeXJ7qClvyHWtAJ7CACr2xcuca
	 PI15FrVmdVqRoxp0SvaXKM5/JljD20eiiESKQyaqqyIRjYhc/EOwME1AZBJrqjLV+1
	 q20DhdzMkeIvxgOxDTTFthCM9BV6rNF5lZyMY8RflP51tVam2ROq+LJ6M+H9BF+T8Y
	 3T60TyZBPTn1crYl9EO4WTzem+JiL7xet9FlLKkEiKIixiKu9WaHTYQgDxEdcf+lmh
	 p+9A1YSS9kBCyQjMvaSkyqceLZW4q1dAsGi8LBwFo5YliGzhxUFcuO3wjGtVDfjh8p
	 o6WUseK5r910Q==
Date: Thu, 13 Aug 2026 12:08:20 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/2] PCI: mediatek-gen3: Add 2-lanes mode support for
 Airoha AN7581
Message-ID: <20260813170820.GA1143871@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806165334.7328-3-ansuelsmth@gmail.com>
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

On Thu, Aug 06, 2026 at 06:53:32PM +0200, Christian Marangi wrote:
> The Airoha AN7581 SoC supports configuring the first PCIe0 lane to 2-lanes
> mode (x2 link) by bonding it with the second PCIe lane (PCIe1). This is
> done by configuring the PCIe MUX in the SCU register.
> 
> To correctly configure PCIe0 in x2 link, define in DT the following
> additional properties:
> 
>   - additional reg, 'sec-pcie-mac' for the secondary PCIe.
>   - PERSTOUT reset for both main and secondary PCIE0, called 'perstout' and
>     'sec-perstout'
>   - 'airoha,scu' property to correctly configure the SCU register for the
>     PCIe MUX
>   - 'num-lanes' set to '2' to enable PCIe0 in x2 link
> 
> In such configuration the EQ preset are configured to the same values.
> 
> To permit correct configuration of the PCIe link, additional logic is added
> to assert and deassert the PERSTOUT resets. Support of these additional
> reset was introduced in Airoha clk driver with commit
> 6712f48eb3a1 ("clk: en7523: add support for dedicated PCIe PERSTOUT reset")
> and on backporting of this commit also the clk driver change will be
> needed.

I don't see 6712f48eb3a1 in upstream or linux-next.  Is this SHA1
going to valid if we merge this for v7.3?

