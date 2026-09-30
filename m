Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4451FCA5FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSwgvDJ8bCkdzK3KRzsQi4XHuw+AgxkAx3ktEHZzz7A=; b=honz+JVIUuA/78OdNDlhQNPuH4
	ZLCr1/G55GzuyvFPDCVaz0TNFdyDeh9VisaQYzEGgVlxpdTZR2Wrmn5v7UrYxDpr1vx4wejSvlSnK
	TAQr9goCwemwwSa36cRy74lNoMQX78lSLfZsGHxPKaeGRwazx6knrsFF+DWBHGns7er2Ifl1xg0Fy
	XDCL7SXKRZyOA30TWPO/K9Jl4B+s4NVB2A0ZM2i02RvfzDEsXmFomw9A3QavK2C8dWVfe9OtLCsl2
	Uy7CxcyBMaNL8K8DPBzafR3arL4bYmZYIDhXK54949TUqfHYUz9tnNkGVo92n/k+EHkgToxkYIYAt
	h2T2BZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBve9-00000006NSP-22P6;
	Wed, 30 Sep 2026 14:51:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvdv-00000006NIT-20gz;
	Wed, 30 Sep 2026 14:50:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AAA7601DE;
	Wed, 30 Sep 2026 14:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D76D1F0089B;
	Wed, 30 Sep 2026 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790779845;
	bh=TSwgvDJ8bCkdzK3KRzsQi4XHuw+AgxkAx3ktEHZzz7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UF03NQeeQFakrobM0QKdTXcDNv/0m37rMtVFftS14c7N/Iz9vdXCdLy3k1wzBufA/
	 4cwrlObdOz/8fAOCtop9P+R1hPV5Krr0NmQqrZtbReTPhGNQeXHV2hLRpZ9osCgT21
	 WfNDEAWsfA/nGinp0bmHQ7TZldMoAoj1b/xOT6u2Ziode0StIC5SbFj7Pd5tqzPglD
	 2//t26pkX5Pi8BZtjWwmNAviV1bR8bAQmKOwytLtKgj3tj/OD6ioRtBLw/ZM/LaPBe
	 dbKg+AnOGhBTmFWoMifEeLSKpS1gAiN6iIiD/c9ZBhW81s56nMGc/gvzJtRgc/AOBx
	 /9I6LCo0E/FVw==
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yue Wang <yue.wang@Amlogic.com>,
	Hans Zhang <18255117159@163.com>,
	Myron Stowe <myron.stowe@redhat.com>,
	Jon Mason <jdmason@kudzu.us>
Cc: Keith Busch <kbusch@kernel.org>,
	mx2pg@pm.me,
	dlemoal@kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Frank Li <Frank.Li@nxp.com>,
	Mahesh Vaidya <mahesh.vaidya@altera.com>,
	Ricardo Pardini <ricardo@pardini.net>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>
Subject: [RFC PATCH 2/4] PCI: Match the hierarchy's MPS to a device's MPSS as necessary
Date: Wed, 30 Sep 2026 16:50:19 +0200
Message-ID: <20260930145017.1356088-8-cassel@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930145017.1356088-6-cassel@kernel.org>
References: <20260930145017.1356088-6-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5641; i=cassel@kernel.org; h=from:subject; bh=BT88USuGeykL9B1sorUB9b03FNnb7Rs3jMpDLquVOTo=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLL2Kq66Uhy8PPC02t7wDNP/+w0sozSl5rziN/lYU6n+Y a2upMy2jlIWBjEuBlkxRRbfHy77i7vdpxxXvGMDM4eVCWQIAxenAExkWSfD/5xLLDPfl0bL7rwR f/BnPOdDnhbh9Wz8VVuXX97o+tHLy4iR4X3kRDelhOb7+85veLHOQKWmvyJn0uabbAUchs9XWjG sYAcA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

From: Hans Zhang <18255117159@163.com>

pci_configure_mps() enumerates top-down and programs each device's Maximum
Payload Size (MPS) to match its upstream bridge.  When a device's MPS
Supported (MPSS) is too small to match, commit 9f0e89359775 ("PCI: Match
Root Port's MPS to endpoint's MPSS as necessary") reduces the upstream
bridge instead, but only when that bridge is a Root Port.

That covers an endpoint directly below a Root Port and nothing else.  With
a Switch in between, the Switch ports have already inherited the Root
Port's larger MPS, the reduction is skipped because the upstream bridge is
a Switch Downstream Port, and pcie_set_mps() then fails with -EINVAL for
the endpoint.  The endpoint is left below a port programmed for a larger
MPS, so any larger TLP it receives is treated as Malformed.

Multi-function devices hit the same hole from the other direction:
reducing the Root Port for a function with a small MPSS leaves the sibling
functions already programmed to the larger value.

Walk the hierarchy from the Root Port down and reduce every device that is
above the new value.  Reducing only the ports between the device and the
Root Port is not sufficient, because a Switch does not split TLPs: an
already programmed sibling left at the larger MPS could emit a TLP too
large for its egress port.  As a result, a single device with a small MPSS
now lowers the MPS of every device below its Root Port.

Only do this while no device below the Root Port has been added or made
available for driver binding, i.e., during the initial scan, or when
devices are hot-added or rescanned into an empty hierarchy such as a slot
directly below the Root Port.  Such devices may have drivers bound and DMA
in flight, so their MPS can't be changed safely.  This is the same
constraint that makes PCIE_BUS_SAFE limit fabrics with hotplug bridges
below a Root Port to 128 bytes in pcie_find_smpss().  A device
added next to devices that are already in use is left at its current MPS
and pci_configure_mps() warns and suggests "pci=pcie_bus_safe", which is
what already happens below a Switch today.

This only affects PCIE_BUS_DEFAULT.  PCIE_BUS_SAFE, PCIE_BUS_PERFORMANCE
and PCIE_BUS_PEER2PEER program MPS in pcie_bus_configure_settings() and
PCIE_BUS_TUNE_OFF doesn't touch it, so all of them return before this
point.

Fixes: 9f0e89359775 ("PCI: Match Root Port's MPS to endpoint's MPSS as necessary")
Signed-off-by: Hans Zhang <18255117159@163.com>
Assisted-by: LLM
Co-developed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/probe.c | 66 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 27008e2ea5af..d8e58e5ef730 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2200,9 +2200,49 @@ int pci_setup_device(struct pci_dev *dev)
 	return 0;
 }
 
+static int pcie_reduce_mps(struct pci_dev *dev, void *data)
+{
+	int mps = *(int *)data;
+	int ret;
+
+	/* MPS is of type 'RsvdP' for VFs */
+	if (!pci_is_pcie(dev) || dev->is_virtfn)
+		return 0;
+
+	if (pcie_get_mps(dev) > mps) {
+		ret = pcie_set_mps(dev, mps);
+		if (ret)
+			pci_warn(dev, "can't set Max Payload Size to %d; if necessary, use \"pci=pcie_bus_safe\" and report a bug\n",
+				 mps);
+	}
+
+	return 0;
+}
+
+static int pci_dev_check_in_use(struct pci_dev *dev, void *data)
+{
+	bool *in_use = data;
+
+	*in_use = pci_dev_is_added(dev) || !pci_dev_binding_disallowed(dev);
+	return *in_use;
+}
+
+/*
+ * Return true if any device on or below @bus has been added or made available
+ * for driver binding, i.e., may have a driver bound and DMA in flight.
+ */
+static bool pci_bus_in_use(struct pci_bus *bus)
+{
+	bool in_use = false;
+
+	pci_walk_bus(bus, pci_dev_check_in_use, &in_use);
+	return in_use;
+}
+
 static void pci_configure_mps(struct pci_dev *dev)
 {
 	struct pci_dev *bridge = pci_upstream_bridge(dev);
+	struct pci_dev *rp;
 	int mps, mpss, p_mps, rc;
 
 	if (!pci_is_pcie(dev))
@@ -2252,10 +2292,28 @@ static void pci_configure_mps(struct pci_dev *dev)
 		return;
 
 	mpss = 128 << dev->pcie_mpss;
-	if (mpss < p_mps && pci_pcie_type(bridge) == PCI_EXP_TYPE_ROOT_PORT) {
-		pcie_set_mps(bridge, mpss);
-		pci_info(dev, "Upstream bridge's Max Payload Size set to %d (was %d, max %d)\n",
-			 mpss, p_mps, 128 << bridge->pcie_mpss);
+	rp = pcie_find_root_port(bridge);
+	if (mpss < p_mps && rp && !pci_bus_in_use(rp->subordinate)) {
+		/*
+		 * dev cannot be programmed to the MPS already in use above
+		 * it, so reduce the hierarchy to what dev supports.  A Switch
+		 * does not split TLPs, so reducing only the upstream bridge
+		 * is not enough: every port up to the Root Port has to come
+		 * down as well, and so do the devices already programmed
+		 * below that Root Port, which would otherwise be left sending
+		 * TLPs too large for their egress port.
+		 *
+		 * Only do this while no device below the Root Port has been
+		 * added or made available for driver binding, e.g., during
+		 * the initial scan or when hot-adding into a slot directly
+		 * below the Root Port.  Such devices may have drivers bound
+		 * and DMA in flight, so their MPS can't be changed safely
+		 * (see pcie_find_smpss()).
+		 */
+		pcie_reduce_mps(rp, &mpss);
+		pci_walk_bus(rp->subordinate, pcie_reduce_mps, &mpss);
+		pci_info(dev, "Max Payload Size of %s hierarchy set to %d (was %d)\n",
+			 pci_name(rp), mpss, p_mps);
 		p_mps = pcie_get_mps(bridge);
 	}
 
-- 
2.55.0


