Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF855C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIB6iLDPCJcMmUiRYGBXhnlE9N8R0dT+TFD3aMt0v0Q=; b=4Y+Nm2tNLkSaMB6O2UGYkY6Y0z
	a5YPVo8mbhVXUjTuvKnRdD5knV9XLOXftD4FbpB0KmfSulPg/nXVhx8osSt/ptjZOfwtwvGQ+aHhn
	OxeHWWcQl6WL5y4FI1jelrHD7uwLvHqiqTO5+MGXPzq+D1WGvAzXXdzkqjSGatAgpIZiwqSilbmZn
	9waej2xPS5kN1gx2W4VMcWj1n+vB/8R5SirHF5LMT6sEuJDsWIvodT2GR/10uJ5dnGJujdpy4o52U
	bZe5YRZAe141iYLgdkF5P7tLQoYeNkKWLgtRaVsSUlXAlLei8QPPAE8xMZHNXTe8qHSLQyszcjk2m
	8QL3OufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L3K-000000003Yw-0Bmg;
	Fri, 25 Apr 2025 15:33:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JOg-0000000HL5e-1oua;
	Fri, 25 Apr 2025 13:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC61A6847B;
	Fri, 25 Apr 2025 13:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C85DC4CEE4;
	Fri, 25 Apr 2025 13:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745588837;
	bh=qi5h6vjHGkHHkMx48KdWOPGfCyT72085egpIwqt06EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVkHX+kql50+epGydmhjz+95MQSE8WEDlV87c70IY7HI4V1UG99qCiZRm1luxGYeO
	 BVUaapBHvKfebXlGIwSGgPRO1pnmU00p2MUxCjvBFZEvNQ0Wke+4d9nmwMNwSkqjeK
	 7DvdYe2JdWwvsenW+3ms5MsvBk4A7gUXIGS614Xh0d3FeRP9g+JidG4w5MUU5wef+B
	 u7JuJ2bVjV1wS5LpFglBj3eelV/u0rhDOWAQqec5PEBdJELIg64PiO6k90NX4ZRriR
	 drDucaxBTBnQHYnuTN84bbCm6mX7qLCkKbxUde4DshAfnex+OCWaQYmKoHHZgOyCvw
	 eF4uPsyzoOzqA==
Date: Fri, 25 Apr 2025 15:47:10 +0200
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
Subject: Re: [PATCH v2 1/2] PCI: Configure root port MPS to hardware maximum
 during host probing
Message-ID: <aAuSXhmRiKQabjLO@ryzen>
References: <20250425095708.32662-1-18255117159@163.com>
 <20250425095708.32662-2-18255117159@163.com>
 <aAtikPOYlGeJCsiA@ryzen>
 <a4963173-dd9a-4341-b7f9-5fdb9485233a@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4963173-dd9a-4341-b7f9-5fdb9485233a@163.com>
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

Hello Hans,

On Fri, Apr 25, 2025 at 06:56:53PM +0800, Hans Zhang wrote:
> 
> But I discovered a problem:
> 
> 0001:90:00.0 PCI bridge: Device 1f6c:0001 (prog-if 00 [Normal decode])
>          ......
>          Capabilities: [c0] Express (v2) Root Port (Slot-), MSI 00
>                  DevCap: MaxPayload 512 bytes, PhantFunc 0
>                          ExtTag- RBE+
>                  DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                          RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                          MaxPayload 512 bytes, MaxReadReq 1024 bytes
> 
> 
> 
> 			Should the DevCtl MaxPayload be 256B?
> 
> But I tested that the file reading and writing were normal. Is the display
> of 512B here what we expected?
> 
> Root Port 0003:30:00.0 has the same problem. May I ask what your opinion is?
> 
> 
> 		......
> 0001:91:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd
> NVMe SSD Controller PM9A1/PM9A3/980PRO (prog-if 02 [NVM Express])
>          ......
>          Capabilities: [70] Express (v2) Endpoint, MSI 00
>                  DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
> unlimited, L1 unlimited
>                          ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
> SlotPowerLimit 0W
>                  DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                          RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> FLReset-
>                          MaxPayload 256 bytes, MaxReadReq 512 bytes
> 		......

Here we see that the bridge has a higher DevCtl.MPS than the DevCap.MPS of
the endpoint.

Let me quote Bjorn from the previous mail thread:

"""
  - I don't think it's safe to set MPS higher in all cases.  If we set
    the Root Port MPS=256, and an Endpoint only supports MPS=128, the
    Endpoint may do a 256-byte DMA read (assuming its MRRS>=256).  In
    that case the RP may respond with a 256-byte payload the Endpoint
    can't handle.
"""



I think the problem with this patch is that pcie_write_mps() call in
pci_host_probe() is done after the pci_scan_root_bus_bridge() call in
pci_host_probe().

So pci_configure_mps() (called by pci_configure_device()),
which does the limiting of the bus to what the endpoint supports,
is actually called before the pcie_write_mps() call added by this patch
(which increases DevCtl.MPS for the bridge).


So I think the code added in this patch needs to be executed before
pci_configure_device() is done for the EP.

It appears that pci_configure_device() is called for each device
during scan, first for the bridges and then for the EPs.

So I think something like this should work (totally untested):

--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -45,6 +45,8 @@ struct pci_domain_busn_res {
        int domain_nr;
 };
 
+static void pcie_write_mps(struct pci_dev *dev, int mps);
+
 static struct resource *get_pci_domain_busn_res(int domain_nr)
 {
        struct pci_domain_busn_res *r;
@@ -2178,6 +2180,11 @@ static void pci_configure_mps(struct pci_dev *dev)
                return;
        }
 
+       if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
+           pcie_bus_config != PCIE_BUS_TUNE_OFF) {
+               pcie_write_mps(dev, 128 << dev->pcie_mpss);
+       }
+
        if (!bridge || !pci_is_pcie(bridge))
                return;



But we would probably need to move some code to avoid the
forward declaration.


Kind regards,
Niklas

