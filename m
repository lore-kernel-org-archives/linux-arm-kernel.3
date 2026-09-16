Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66A9C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jNVvA23hlsp7KGNObjrBr9Zcw4R6+mc3dMMlXbSnIk=; b=QunOKEdDvf142kezlvex9jcw44
	4m2KCjZICpiCYvcECikSPODcDRYt5Go/vzJtBJvnrFH323PbLZ6xOAJWL2DqLVlmnMxsQE8pR34IV
	DwQULY8ZTbT6EFBLYppJfU+5yXA2nk57b8enGm7f/PkQ9rvfk+mBKNYbMYpPYiAoFha/5caIfWzA7
	7CG4ZeF1I3I4e8SgMOB59pWyey/aJoAGXNB/rM+MXV8KK481vhlwZXnT5yhkcAo0E1+9domrQJ8qS
	lewWQvrK/ZB7p0wxRsHvBWzA74PiVSBGlY4jX82w+3WGf1EwocLsmhIlG0sn4hWxgu2UDx1QcssAN
	hiOW5hHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rjq-00000009bsj-0WN3;
	Wed, 16 Sep 2026 15:39:58 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rjn-00000009bp8-1fc9;
	Wed, 16 Sep 2026 15:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+j
	NVvA23hlsp7KGNObjrBr9Zcw4R6+mc3dMMlXbSnIk=; b=FM77KUzoz/q8V8sDF2
	+TE+4kpAcuHGX25nB6VwCaL9r0/gLitmPWkUsAEn3cHc5ySfNe0ZPvtU7g+IZpyt
	X3l/7hzIOmnykzRKvfG4p6xtFTM10cLLbb/YjiB/2NCOdAqeMGiA5xyMqt7P8n2g
	qtkhm0ytoTGC7EhNcm3uvdkC4=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnbxQduKpqGzAlBA--.54876S3;
	Wed, 16 Sep 2026 23:39:11 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	heiko@sntech.de,
	mani@kernel.org,
	yue.wang@Amlogic.com
Cc: pali@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	cassel@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v9 1/3] PCI: Match the hierarchy's MPS to a device's MPSS as necessary
Date: Wed, 16 Sep 2026 23:39:05 +0800
Message-Id: <20260916153907.60344-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916153907.60344-1-18255117159@163.com>
References: <20260916153907.60344-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnbxQduKpqGzAlBA--.54876S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4fJFyxJrWfWF45tF17trb_yoWrJw43pa
	sxWFWS9r4kGryfJa1av3W8uas8Jrs3ZayrAay3J340va1aqFW5tr9Yyr4ftw1xGrWxXFy3
	JF4Dt34UC3Z8uaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGNtfUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:a95a:12fc:887a:b0f1]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxB96HmqquB9tlQAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_083955_802351_8B84223E 
X-CRM114-Status: GOOD (  19.41  )
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

pci_configure_mps() enumerates top-down and programs each device's Maximum
Payload Size (MPS) to match its upstream bridge.  When a device's MPS
Supported (MPSS) is too small to match, commit 9f0e89359775 ("PCI: Match
Root Port's MPS to endpoint's MPSS as necessary") reduces the upstream
bridge instead, but only when that bridge is a Root Port.

That covers an endpoint directly below a Root Port and nothing else.  With
a Switch in between, the Switch ports have already inherited the Root
Port's larger MPS, the reduction is skipped because the upstream bridge is
a Switch Downstream Port, and pcie_set_mps() then fails with -EINVAL for
the endpoint.  The endpoint is left at 128 bytes below a port programmed
for more, so any larger TLP it receives is treated as Malformed.

Multi-function devices hit the same hole from the other direction:
reducing the Root Port for a function with a small MPSS leaves the sibling
functions already programmed to the larger value.

Walk the hierarchy from the Root Port down and reduce every device that is
above the new value.  Reducing only the ports between the device and the
Root Port is not sufficient, because a Switch may not fragment or
repackage TLPs: an already programmed sibling left at the larger MPS could
emit a TLP too large for its egress port.

This only affects PCIE_BUS_DEFAULT.  PCIE_BUS_SAFE already converges the
hierarchy on the smallest MPSS in pcie_bus_configure_settings(), while
PCIE_BUS_TUNE_OFF and PCIE_BUS_PEER2PEER return before this point.

Fixes: 9f0e89359775 ("PCI: Match Root Port's MPS to endpoint's MPSS as necessary")
Co-developed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/probe.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 27008e2ea5af..232bce2819f0 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2200,9 +2200,28 @@ int pci_setup_device(struct pci_dev *dev)
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
+			dev_warn(&dev->dev, "failed to set MPS\n");
+	}
+
+	return 0;
+}
+
 static void pci_configure_mps(struct pci_dev *dev)
 {
 	struct pci_dev *bridge = pci_upstream_bridge(dev);
+	struct pci_dev *rp;
 	int mps, mpss, p_mps, rc;
 
 	if (!pci_is_pcie(dev))
@@ -2252,10 +2271,21 @@ static void pci_configure_mps(struct pci_dev *dev)
 		return;
 
 	mpss = 128 << dev->pcie_mpss;
-	if (mpss < p_mps && pci_pcie_type(bridge) == PCI_EXP_TYPE_ROOT_PORT) {
-		pcie_set_mps(bridge, mpss);
-		pci_info(dev, "Upstream bridge's Max Payload Size set to %d (was %d, max %d)\n",
-			 mpss, p_mps, 128 << bridge->pcie_mpss);
+	rp = pcie_find_root_port(bridge);
+	if (mpss < p_mps && rp) {
+		/*
+		 * dev cannot be programmed to the MPS already in use above
+		 * it, so reduce the hierarchy to what dev supports.  A Switch
+		 * may not repackage TLPs, so reducing only the upstream
+		 * bridge is not enough: every port up to the Root Port has to
+		 * come down as well, and so do the devices already programmed
+		 * below that Root Port, which would otherwise be left sending
+		 * TLPs too large for their egress port.
+		 */
+		pcie_reduce_mps(rp, &mpss);
+		pci_walk_bus(rp->subordinate, pcie_reduce_mps, &mpss);
+		pci_info(dev, "Max Payload Size of %s hierarchy set to %d (was %d)\n",
+			 pci_name(rp), mpss, p_mps);
 		p_mps = pcie_get_mps(bridge);
 	}
 
-- 
2.34.1


