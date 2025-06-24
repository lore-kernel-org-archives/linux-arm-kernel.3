Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32660C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=d0sS2n9RP4KyaCDYjOxdn/SZGsnenwIW9+eO2i/bFdM=; b=x2cdzB68djsZy1
	BWMFNh/wXGrz2ofXuEXVcOr//2GlcJzVhyi7OR8MpTmnMXHhbeikamtP+iYRxrifkHm3VkMpDssLU
	lbxwVgKfDd2f+YkGQacDJzatujXIISNCqkVoQy41xEKiEdT5Ie7VPGlueebGPk/q379EvsTe1ZCg1
	Orhi2pq3krg+GOCDqqCQ7H1sXvRj8sBiZIx73kIgri9GOXgOMBvtsrAF3tUdhwkocAqSAWAxmHKJM
	v7zkCAaLhoD4Eqs9VNbCSHUtWdiDSxEz5biTcdf8WCCxRqcbmy3junpt76/K7Pgpf6XHAuZyjSkgy
	VlhYzJEo2XN4+UxZzrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUC0T-00000006z44-0uKq;
	Tue, 24 Jun 2025 22:20:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBhQ-00000006w1N-0VVG;
	Tue, 24 Jun 2025 22:01:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FE8961142;
	Tue, 24 Jun 2025 22:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55A9C4CEE3;
	Tue, 24 Jun 2025 22:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750802462;
	bh=oMqP58jBtpzhindTCdhlaRR+YnhL9McdIKzis2Sd23c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TzwY3hrJPk/8OWo+Z8/JCb/1jDkOJ6zOkhc4v9XufSwZJXJ+mru7NigLoLTQCZ9ol
	 Q8fbHYMyoFNK0ERXV+UYR/HjxPwGIhP7Q/9vsNy54QqCwxSHlfOqehw6UJRbGH3K5q
	 TV0xMxCQqLZf+6YMELdPSY1GYXwXqJjHBjxq5V20kqr0MYxoPA1cvlNC/6J8ZAc72K
	 QBYaYdJmonZJ0zTXZKv+Xk/DbC7U7sVMBqSKqxQCXDGMqmLc3enONWkYAMIKgZARAJ
	 I3g6WQ9hvVLxhLubYe2rTPHHZm5iyblrlQEBuUMDkSdBStTj7XNFlAf9RYLEZVUNEZ
	 TF+yL44fTk0xw==
Date: Tue, 24 Jun 2025 17:01:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] PCI: brcmstb: Use "num-lanes" DT property if present
Message-ID: <20250624220101.GA1532842@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530224035.41886-3-james.quinlan@broadcom.com>
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

On Fri, May 30, 2025 at 06:40:33PM -0400, Jim Quinlan wrote:
> By default, we use automatic HW negotiation to ascertain the number of
> lanes of the PCIe connection.  If the "num-lanes" DT property is present,
> assume that the chip's built-in capability information is incorrect or
> undesired, and use the specified value instead.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index e19628e13898..79fc6d00b7bc 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -46,6 +46,7 @@
>  #define  PCIE_RC_CFG_PRIV1_ID_VAL3_CLASS_CODE_MASK	0xffffff
>  
>  #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
> +#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK	0x1f0
>  #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00
>  
>  #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
   #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK      0xf8

If you squint, PCIE_RC_CFG_PRIV1_LINK_CAPABILITY looks a little like
these standard PCIe things:

  #define PCI_EXP_LNKCAP          0x0c    /* Link Capabilities */
  #define  PCI_EXP_LNKCAP_MLW     0x000003f0 /* Maximum Link Width */
  #define  PCI_EXP_LNKCAP_ASPMS   0x00000c00 /* ASPM Support */

  #define PCI_EXP_DEVCTL2         0x28    /* Device Control 2 */

So I was hoping we had an opportunity to use PCI_EXP_LNKCAP_MLW and
PCI_EXP_LNKCAP_ASPMS instead of
PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK and
PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK.

But I guess PCIE_RC_CFG_PRIV1_LINK_CAPABILITY is probably not actually
PCI_EXP_LNKCAP, because PCI_EXP_LNKCAP being 0x0c into a PCIe
Capability would mean the cap started at 0x04d0, and
PCIE_RC_CFG_PRIV1_ROOT_CAP would be at offset 0x28
(0x04d0 + 0x28 == 0x04f8).

But offset 0x28 in a PCIe Capability would be PCI_EXP_DEVCTL2, not 
PCIE_RC_CFG_PRIV1_ROOT_CAP, and I can't squint hard enough to see
anything related to L1SS anywhere in the PCIe Capability.

So never mind ;)

Bjorn

