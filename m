Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1135F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eij1fNfU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kGwUjsFC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1UqarJdnrqp/DfiWbclF2YkSY4vB3u0si+XLCDT1tY=; b=Eij1fNfUFiYwJvFBDd2i0nvtGy
	a5hSygstkjlEsRvMyVy8B27sbxdbxK/VHToEfqfQ2jHIHdrE6TGlR6hZjMicXjqVJcXpHwIvBSFFq
	YpB0tYmC95q7Tt+6wivoaHPSMVvMdcsusdg9K+UtBav8dwmFwqiI4t4DD12zfIx+gHBqFG+mFBnXC
	tE2zL1ncnsLfdmRkkNFs4VkHMtvnY2P5k8OMMTiLJ4QdzVlliXCe/DD+kw2Y/fQrtrCK8qbyimhDo
	b5mjZ2Qy3zgv4yi7pBZQli6PRsadi9KfCOV1H1llBZVqj7C9m6s3ibECnInoZhpXrgD48vTN8g9dd
	WgxNNviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ92N-00000009fqz-2BxF;
	Tue, 20 Oct 2026 12:33:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ92M-00000009fqG-1nIU;
	Tue, 20 Oct 2026 12:33:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30FBE43E17;
	Tue, 20 Oct 2026 12:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925031F000C4;
	Tue, 20 Oct 2026 12:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792499630;
	bh=O1UqarJdnrqp/DfiWbclF2YkSY4vB3u0si+XLCDT1tY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kGwUjsFCiJS3S3Rk/cVOwOaaQdlAH81HhLYPGFfWfpy+n7j8xZzZKqTv81RLtN/mJ
	 LEBLMTyHxp/lSDlQvjpwmycrh/r0rXTNBH+tPudXpqR/fi4KNjV/iVU5dxqpN6FBMg
	 0NxuJ2EZ9S9hhTO7wNjBff/O5Atoj73nLEWkKTO2n2iP3TWtNnBEGL8d/tQFhe8nnO
	 Qo5KAa4pgmVO2heCHdsqZmkjSxIFq691L0a85x07bJs/Vcp0kDunvBm7A/p4DW49Vx
	 77S6OaPVbixb6xxOmE+W6ey9zCsSGyoe5UO4pg14dF35GWoxCXX3MiAAOSlrQVg3Pg
	 votHzb9xRugVA==
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
Subject: [PATCH v2 1/3] PCI: Match the hierarchy's MPS to a device's MPSS as necessary
Date: Tue, 20 Oct 2026 14:28:55 +0200
Message-ID: <20261020122854.1500883-6-cassel@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020122854.1500883-5-cassel@kernel.org>
References: <20261020122854.1500883-5-cassel@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6332; i=cassel@kernel.org; h=from:subject; bh=cz8OzAa2g3cynTBMBAWjwV86whP3PQhdKO9yXnIb2X8=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLKux7UzHHqw89+d+VeUlsicP351ddnUP+eWe/dO+KQvv FGLeV2VUUcpC4MYF4OsmCKL7w+X/cXd7lOOK96xgZnDygQ2hItTACbC1sTwv5Yv9HINrzPbibMs Dq26tu3lceI9Sgd9vi//ofin2OjvP0aGy3bGOfsS3l4qW9y/udBl9uSiOraE095ShzuNZhx9Fq/ ODwA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Only do this while no device below the Root Port, other than a Switch
port, has been added or made available for driver binding, i.e., during
the initial scan, or when devices are hot-added or rescanned into a
hierarchy without endpoints in use, such as an empty slot directly below
the Root Port or a Switch with nothing below it.  Such devices may have
drivers bound and DMA in flight, so their MPS can't be changed safely.
This is the same constraint that makes PCIE_BUS_SAFE limit fabrics with
hotplug bridges below a Root Port to 128 bytes in pcie_find_smpss().
Like the Root Port itself, Switch ports can still be changed: they don't
do DMA, and the port driver doesn't change Device Control after
enumeration.  A device added next to endpoints that are already in use
is left at its current MPS and pci_configure_mps() warns and suggests
"pci=pcie_bus_safe", which is what already happens below a Switch today.

This only affects PCIE_BUS_DEFAULT.  PCIE_BUS_SAFE, PCIE_BUS_PERFORMANCE
and PCIE_BUS_PEER2PEER program MPS in pcie_bus_configure_settings() and
PCIE_BUS_TUNE_OFF doesn't touch it, so all of them return before this
point.

Fixes: 9f0e89359775 ("PCI: Match Root Port's MPS to endpoint's MPSS as necessary")
Signed-off-by: Hans Zhang <18255117159@163.com>
Co-developed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/probe.c | 78 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 9a178e0e5f7f..ccc3e9202c2c 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2207,9 +2207,60 @@ int pci_setup_device(struct pci_dev *dev)
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
+	/*
+	 * Switch ports don't do DMA, and the port driver doesn't change Device
+	 * Control after enumeration, so their MPS can be changed as long as no
+	 * device below them is in use.
+	 */
+	if (pci_is_pcie(dev) &&
+	    (pci_pcie_type(dev) == PCI_EXP_TYPE_UPSTREAM ||
+	     pci_pcie_type(dev) == PCI_EXP_TYPE_DOWNSTREAM))
+		return 0;
+
+	*in_use = pci_dev_is_added(dev) || !pci_dev_binding_disallowed(dev);
+	return *in_use;
+}
+
+/*
+ * Return true if any device on or below @bus, other than a Switch port, has
+ * been added or made available for driver binding, i.e., may have a driver
+ * bound and DMA in flight.
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
@@ -2259,10 +2310,29 @@ static void pci_configure_mps(struct pci_dev *dev)
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
+		 * Only do this while no device below the Root Port, other than
+		 * a Switch port, has been added or made available for driver
+		 * binding, e.g., during the initial scan or when hot-adding
+		 * into an empty slot directly below the Root Port or below a
+		 * Switch with no endpoint in use.  Such devices may have
+		 * drivers bound and DMA in flight, so their MPS can't be
+		 * changed safely (see pcie_find_smpss()).
+		 */
+		pcie_reduce_mps(rp, &mpss);
+		pci_walk_bus(rp->subordinate, pcie_reduce_mps, &mpss);
+		pci_info(dev, "Max Payload Size of %s hierarchy set to %d (was %d)\n",
+			 pci_name(rp), mpss, p_mps);
 		p_mps = pcie_get_mps(bridge);
 	}
 
-- 
2.56.0


