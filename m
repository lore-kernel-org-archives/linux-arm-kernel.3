Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6760CE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SY9dzjKuFYaWIhOmfp5jeHgUuobuUgczbpetRcCZ/E=; b=QcmJD5Slg8ThHllMWQUoUyferD
	VaHfbaf6EAjhAZ39/bzGljnohuh8gmvXCF06cjS6ncNC4PXk5zBZdZum7WIlH6zJAW8moQaNkOcOt
	UjQtWSN9Tuy5jCgUsAxMSsLLxLbYgtoZigPQyFaC1WHf+wytcTunElfnayq1uDFZxfaHJA5vEPO+4
	3XOUpcAw/zAqqOaROo9207lZVEJuq6yPWry/GUAh2Dur+ScRtc5HbfLTjT9PJGXPy9OHBnFyA5Vrs
	Ej55lt7Z1M3szumVDQB16wl6c3Nm2lnzx2tcVg/m/87FzEWd/Yj6BdYLl+fAhQpH3DljAKtpCBowl
	mMwAGlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHiD-00000004nAX-1wj6;
	Mon, 13 Jan 2025 10:30:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHg4-00000004mjt-3ElR;
	Mon, 13 Jan 2025 10:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99B7AA40DAC;
	Mon, 13 Jan 2025 10:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEADDC4CED6;
	Mon, 13 Jan 2025 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736764091;
	bh=YjPRYyKxFWfwBGyFIc8FXbd9BDk5/XxDt0/Kay6MfyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k46+ZMIP6SHUP2Fkk1BFOsyeCxNX7n2Tbjur95ZFq5q2DbYzf7Sq7EDdqsA8gxEw5
	 570kJOPmVAKjtq8E9Y0dQK+N6RUIYBoAPh1pf8BclgS2AoQSKlvcj6V+7UmQC7mIvC
	 d5tqvfmtzqkpnwC1+bmRQXvrRUAgd99KDExOArPK3jp+uz2O4kmquwgbeLJQpflqNN
	 lAaxMVXiDX/VqfFItKZm0K1OR1kNR9F6xwBYmpfQKxM9JI+JctSA9RMh/y5e2JNAqS
	 g/K7zuvMLn60B2XgLZ2+GjAoNBJ7fDdNtAb9EFajN/cChTAQ2P4+8MBXv3SsExmI/6
	 VH9T+9u0N03Cg==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 6/6] PCI: dw-rockchip: Describe resizable BARs as resizable BARs
Date: Mon, 13 Jan 2025 11:27:37 +0100
Message-ID: <20250113102730.1700963-14-cassel@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113102730.1700963-8-cassel@kernel.org>
References: <20250113102730.1700963-8-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520; i=cassel@kernel.org; h=from:subject; bh=YjPRYyKxFWfwBGyFIc8FXbd9BDk5/XxDt0/Kay6MfyM=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNJbXs08/n9iHc+0po1bBV95XOt7xmsjf82T498kUZ67P 91vNnQs7ihlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBE7GMY/kpNM51z/fnWH8tX b7Xh0/42q2HXBuZbPxdmfDMJZlx2vlGE4X9Z2e8H766k1KS8PhzEVXg+4ctaAwNWl2L7hMSNJ9o X/eEBAA==
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_022812_945026_1D0E67B1 
X-CRM114-Status: GOOD (  11.68  )
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

Looking at "11.4.4.29 USP_PCIE_RESBAR Registers Summary" in the rk3588 TRM,
we can see that none of the BARs are Fixed BARs, but actually Resizable
BARs.

I couldn't find any reference in the rk3568 TRM, but looking at the
downstream PCIe endpoint driver, rk3568 and rk3588 are treated as the same,
so the BARs on rk3568 must also be Resizable BARs.

Now when we actually have support for Resizable BARs, let's configure
these BARs as such.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index ce4b511bff9b..6a307a961756 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -273,12 +273,12 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
 	.msi_capable = true,
 	.msix_capable = true,
 	.align = SZ_64K,
-	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
-	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
-	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
-	.bar[BAR_3] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
-	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
-	.bar[BAR_5] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
+	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
+	.bar[BAR_1] = { .type = BAR_RESIZABLE, },
+	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
+	.bar[BAR_3] = { .type = BAR_RESIZABLE, },
+	.bar[BAR_4] = { .type = BAR_RESIZABLE, },
+	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
 };
 
 /*
@@ -293,12 +293,12 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
 	.msi_capable = true,
 	.msix_capable = true,
 	.align = SZ_64K,
-	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
-	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
-	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
-	.bar[BAR_3] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
+	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
+	.bar[BAR_1] = { .type = BAR_RESIZABLE, },
+	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
+	.bar[BAR_3] = { .type = BAR_RESIZABLE, },
 	.bar[BAR_4] = { .type = BAR_RESERVED, },
-	.bar[BAR_5] = { .type = BAR_FIXED, .fixed_size = SZ_1M, },
+	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
 };
 
 static const struct pci_epc_features *
-- 
2.47.1


