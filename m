Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A18C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZaSL3UfRfdtZiyP0Mv8GvP9B1y7ygwVTI/Z95WCCrw=; b=YfkPdbSAWLwjMsdMMWsCG9mg3N
	+Z30cyxsEGvIb2mpD3AsHbFgup9ROHHoAl8BlEVUEzhxPgW4BuZEi8OgIrFxL9fUPSgvCqNnqwAc2
	Q5RdW56WUHJu3jcAuOCrdO1Lk+bP/ysS9mnyBs2EYkSC2+EpW1+2BngkG4qVUHavTNhihG/BdRh4U
	m6Mk4cE1qxaaDuOu/l++NzS0nOAOYnf6GxC7kavK8EqpcKvSIFBCmsr/Ss09Y/USaBWt1nQhiEaVR
	Gd/H9jKTtmbmAKVY+kQ9doGx7a51sDdizPOeH7U9839Z/fJNADHZvNoHEzQqxTM9TL8OIc6SCXpiz
	63vRNBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkAW-0000000BdCy-3s0L;
	Tue, 13 May 2025 07:35:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEk6k-0000000Bcdw-3HSM;
	Tue, 13 May 2025 07:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3E22A4C739;
	Tue, 13 May 2025 07:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1299C4CEEF;
	Tue, 13 May 2025 07:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747121481;
	bh=EhbWA/fYXzkyLPQUxgI20hDPqumDuRqePumMowGijyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lSoct5VeThmG9Uk2X7jPd4YheCkTAWK5OSTVo6ya5e1jkhiGHcAU07RcsUIVh57g4
	 7FYelYEgh/0uNpnMdY0YEYEh0KRc0kRuIsiF2bvW3iNy0My6hoh2+dFBhbkH4ZEMLK
	 LDlCx0cbfraxGFNt+t2om4NIQLfpcRfh5YYJxfoD40TFJRXP+CGPmRL1mflxQdFRpJ
	 H4WM0oFW+0AhxjkOXEvedz+MvNzHyfrzsj2OLtC/g5Onzm21Y21ud4E8xbltFb1Bv1
	 qVmEzeeL+BzTTBe1Kn6sdFa5g6lysYDntkcKBOYDafEmZfbeUnK5J28mSYqUpU1BBD
	 qFxoktbRlEJ9g==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	stable+noautosel@kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/6] PCI: endpoint: cleanup get_msi() callback
Date: Tue, 13 May 2025 09:30:58 +0200
Message-ID: <20250513073055.169486-11-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513073055.169486-8-cassel@kernel.org>
References: <20250513073055.169486-8-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026; i=cassel@kernel.org; h=from:subject; bh=EhbWA/fYXzkyLPQUxgI20hDPqumDuRqePumMowGijyU=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKUvhpKFWa/qVPIKtA/oPLqbJlWxgEt2c82IZPSTtoLX LMPmcrUUcrCIMbFICumyOL7w2V/cbf7lOOKd2xg5rAygQxh4OIUgIkUX2Jk2FJ296Ox3+0p2eEt 13nmCAf6PFa0uX/TReZBxOYV4R/XpjIytEpHiIY6uxVO71jn9G6+r63CvDt/Lt1PWjexYqGqr9o TNgA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_003122_945860_AB963850 
X-CRM114-Status: GOOD (  14.38  )
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

The kdoc for pci_epc_get_msi() says:
"Invoke to get the number of MSI interrupts allocated by the RC"
the kdoc for the callback pci_epc_ops->get_msi() says:
"ops to get the number of MSI interrupts allocated by the RC from
the MSI capability register"

pci_epc_ops->get_msi() does however return the number of interrupts
in the encoding as defined by the MME Multiple Message Enable field.

Nowhere in the kdoc does it say that the returned number of interrupts
is in MME encoding.

Thus, it is very confusing that the wrapper function (pci_epc_get_msi())
and the callback function (pci_epc_ops->get_msi()) don't return the same
value.

Cleanup the API so that the wrapper function and the callback function
will have the same semantics.

Cc: <stable+noautosel@kernel.org> # this is simply a cleanup
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/cadence/pcie-cadence-ep.c | 2 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c  | 2 +-
 drivers/pci/controller/pcie-rcar-ep.c            | 2 +-
 drivers/pci/controller/pcie-rockchip-ep.c        | 4 ++--
 drivers/pci/endpoint/pci-epc-core.c              | 2 --
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
index 112ae200b393..78b4d009cd04 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
@@ -262,7 +262,7 @@ static int cdns_pcie_ep_get_msi(struct pci_epc *epc, u8 fn, u8 vfn)
 	 */
 	mme = FIELD_GET(PCI_MSI_FLAGS_QSIZE, flags);
 
-	return mme;
+	return 1 << mme;
 }
 
 static int cdns_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 24026f3f3413..03597551f4cd 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -532,7 +532,7 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
 
 	val = FIELD_GET(PCI_MSI_FLAGS_QSIZE, val);
 
-	return val;
+	return 1 << val;
 }
 
 static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
index c5e0d025bc43..9da39a4617b6 100644
--- a/drivers/pci/controller/pcie-rcar-ep.c
+++ b/drivers/pci/controller/pcie-rcar-ep.c
@@ -280,7 +280,7 @@ static int rcar_pcie_ep_get_msi(struct pci_epc *epc, u8 fn, u8 vfn)
 	if (!(flags & MSICAP0_MSIE))
 		return -EINVAL;
 
-	return ((flags & MSICAP0_MMESE_MASK) >> MSICAP0_MMESE_OFFSET);
+	return 1 << ((flags & MSICAP0_MMESE_MASK) >> MSICAP0_MMESE_OFFSET);
 }
 
 static int rcar_pcie_ep_map_addr(struct pci_epc *epc, u8 fn, u8 vfn,
diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 85ea36df2f59..85ca7d9b4c77 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -340,8 +340,8 @@ static int rockchip_pcie_ep_get_msi(struct pci_epc *epc, u8 fn, u8 vfn)
 	if (!(flags & ROCKCHIP_PCIE_EP_MSI_CTRL_ME))
 		return -EINVAL;
 
-	return ((flags & ROCKCHIP_PCIE_EP_MSI_CTRL_MME_MASK) >>
-			ROCKCHIP_PCIE_EP_MSI_CTRL_MME_OFFSET);
+	return 1 << ((flags & ROCKCHIP_PCIE_EP_MSI_CTRL_MME_MASK) >>
+		     ROCKCHIP_PCIE_EP_MSI_CTRL_MME_OFFSET);
 }
 
 static void rockchip_pcie_ep_assert_intx(struct rockchip_pcie_ep *ep, u8 fn,
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index beabea00af91..cc1456bd188e 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -293,8 +293,6 @@ int pci_epc_get_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
 	if (interrupt < 0)
 		return 0;
 
-	interrupt = 1 << interrupt;
-
 	return interrupt;
 }
 EXPORT_SYMBOL_GPL(pci_epc_get_msi);
-- 
2.49.0


