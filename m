Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C9C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27OiUkdd9dY65qiHQvdfNaIq0hdMleRRd73rMjuWsAo=; b=GkIPToELt25+3A/lirLSu3Xl66
	4Kyz2B8fXzi2YnWRE7VclQkmjvafo4BFB+eSSftXpSxxoS1RjqyI/C+B34/Nj5h5ff8QV6VS+qyKA
	yeBEZ5wiuHVaSSHsiOQfR1ET9HqBPKFRxvN4RRBChHjXJZIEq72xPxv3JBdSsrtK4IUUjs4pQ+FnN
	uN6I3OyFRfNQogsO2lsPDn4kX67FC7cwXoM1abDeTgx6DRxPYcdXpm++7Di3QgIX5GQr33pVHkpbp
	9fjJh3+LecDhfZewoE37mKc4bX225Wox0jSQ45svEjCicEw7qFaFYVsZYl9UoXF8ovfCoFPS/4Gcf
	0maM72Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttYEG-0000000Gpci-1RQq;
	Sat, 15 Mar 2025 20:35:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXvY-0000000GnWk-1oE3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 20:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3E795C463C;
	Sat, 15 Mar 2025 20:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5E3C4CEE9;
	Sat, 15 Mar 2025 20:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742069771;
	bh=dNILN4r+Al7Iv9FjmzWJiSbivc2v5KyuqPxcL2Ik9V8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sKbN1Os1kX1zfvoEE4PVo/Stbjod7xR1zcdkRhxv4BlOdEO/4fwpcfcdgggliVL71
	 i/5YftVY4/rL8KGn6ael+PzvSKO3S96LcbzD0eMRKiLMMltfQwd8VqkS3uG7LmJU7t
	 Cg2zZ8mBFgfC8IWuh2JPrhvVFVvdwKNrFlRv4aHq+QhLz84qqsVG1Fscjya+K9diro
	 50GZujYjTjISuHfBuaZwF8U8Gum43DZk75V/NlkhobM91eaw0lLlhB3RUIAOKMi8r/
	 QO54o/J/cD9K/0D6WXVX45j0S8Lw1jEgl1pNHEHO8hnV7Q9BxgF1LffLKva7sMHPI0
	 ibgp6dG9soojw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v12 10/13] PCI: dwc: ep: Use devicetree 'reg[addr_space]' to derive CPU -> ATU addr offset
Date: Sat, 15 Mar 2025 15:15:45 -0500
Message-Id: <20250315201548.858189-11-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_131612_582782_1E44EE15 
X-CRM114-Status: GOOD (  11.29  )
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

From: Frank Li <Frank.Li@nxp.com>

                   Endpoint
  ┌───────────────────────────────────────────────┐
  │                             pcie-ep@5f010000  │
  │                             ┌────────────────┐│
  │                             │   Endpoint     ││
  │                             │   PCIe         ││
  │                             │   Controller   ││
  │           bus@5f000000      │             ┌────────►
  │           ┌──────────┐      │             │  ││dynamically
  │           │          │ Outbound Transfer  │  ││allocated
  │┌─────┐    │  Bus     ┼─────►│ ATU  ───────┘  ││PCI Addr
  ││     │    │  Fabric  │Bus   │                ││
  ││ CPU ├───►│          │Addr  │                ││
  ││     │CPU │          │0x8000_0000            ││
  │└─────┘Addr└──────────┘      │                ││
  │       0x7000_0000           └────────────────┘│
  └───────────────────────────────────────────────┘

  bus@5f000000 {
          compatible = "simple-bus";
          ranges = <0x80000000 0x0 0x70000000 0x10000000>;

          pcie-ep@5f010000 {
                  reg = <0x80000000 0x10000000>;
                  reg-names ="addr_space";
                  ...
          };
          ...
  };

In the diagram above, CPU writes data to outbound window address
0x7000_0000, and the bus fabric maps it to 0x8000_0000. The ATU uses
bus address 0x8000_0000 as input address and maps to some PCI address
dynamically allocated by a PCI device driver on the host side.

The pcie-ep@5f010000 'reg[addr_space]' is the parent bus address of the
PCIe controller input, including the ATU.

Set parent_bus_offset, the offset from the CPU address to the PCIe
controller input address using dw_pcie_init_parent_bus_offset().  The
parent_bus_offset is not used yet, so no functional change intended.

Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-7-01d2313502ab@nxp.com
Signed-off-by: Frank Li <Frank.Li@nxp.com>
[bhelgaas: commit log]
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 2db834345ec2..bb87d0c5c665 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -904,6 +904,13 @@ static int dw_pcie_ep_get_resources(struct dw_pcie_ep *ep)
 	ep->phys_base = res->start;
 	ep->addr_size = resource_size(res);
 
+	/*
+	 * artpec6_pcie_cpu_addr_fixup() uses ep->phys_base, so call
+	 * dw_pcie_parent_bus_offset() after setting ep->phys_base.
+	 */
+	pci->parent_bus_offset = dw_pcie_parent_bus_offset(pci, "addr_space",
+							   ep->phys_base);
+
 	ret = of_property_read_u8(np, "max-functions", &epc->max_functions);
 	if (ret < 0)
 		epc->max_functions = 1;
-- 
2.34.1


