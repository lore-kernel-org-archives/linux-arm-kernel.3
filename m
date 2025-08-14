Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEB0CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gE5Ndyty/cA1p4QbLkcL+EeDdV/Weo+zkVYWs1MqQI=; b=xmlELbPPqqTjRgmTj79hWL6g9k
	El6kswvuWXvs3MdxUZDy4GUe142Z9bwxOkb008aPzdCITEc2WUlmmOGq4v5fHLLDTCg2pm/6Iexgs
	yeTUVQ1UehYFTBAxr9uJTQLhJnr12+em9H/2sP5XKKyKe6gYAd9ID77Vcjdd01QxDF/Pi49z4hE2h
	59kxzd37WkjKsPxi+SJIAq4Hfrn/xV+g8WV2+Q2pcPReDNPiNxquUtHdAM2z67SRzvQpMstEEoftX
	kp9taaQkENUNm3iuitmmfj2sayOxjx0r/8sarpYC/kkPOA3qekUccylHyZz/8ekrdFA0ddsbnunVu
	mx77NWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma8E-0000000HWMu-1zFN;
	Thu, 14 Aug 2025 15:44:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZmB-0000000HQ4P-2vNA;
	Thu, 14 Aug 2025 15:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04469601E0;
	Thu, 14 Aug 2025 15:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7BCC4CEED;
	Thu, 14 Aug 2025 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755184916;
	bh=bnwImDFP8yprdZXpvaKvJiFlBgbcOtPQck+heCkeftQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PhTbI8+NO0IIFwKPy7fVDrmaYPg/p5Xad/MBUrPF556R+eUA/2I9z1+uyKCjFcckg
	 y8E+W5FnEtfQZpS+nYRnaAqWCHsrPsEmb2mqykDGimVeWj/5uc4rnQPH50+ohNhcUg
	 XtE4LZG9Ts6xZXyUk2Aw1DZLYZ6Qk2CCasFvbVRpuR3dqslLFQZjND2Cz19vLc+EVr
	 n7pxQeno98873Hn6H5OPtPqmFFDuM2Uhk5BNK1Y4nbX+/2dj3EB3UN46dPRGvysthW
	 dq3zG3e1pq0/cWwoCFIm4a3iCUjKrUQi6XqkKZD5mqI9ZC+YrXuiZFqN9Z0k7hxy/f
	 ZGPFTeA4Urcgg==
From: Niklas Cassel <cassel@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/13] PCI: rockchip-ep: Drop superfluous pci_epc_features initialization
Date: Thu, 14 Aug 2025 17:21:22 +0200
Message-ID: <20250814152119.1562063-18-cassel@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814152119.1562063-15-cassel@kernel.org>
References: <20250814152119.1562063-15-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=864; i=cassel@kernel.org; h=from:subject; bh=bnwImDFP8yprdZXpvaKvJiFlBgbcOtPQck+heCkeftQ=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDLm/vsW1JF8eq6k5e/8m3mzeWexPv6SkKLdXvEq5d/ax slTFqS/7ihlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBEngszMnybnpNoXtm3rvNM byDX69dKXd3mYSrm+/Mbr8YsTvdRvMLI8Dhte0rJ5f9nTpx4XR50MPTdzKD5nyIuOIurL6nbryk WyAkA
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

struct pci_epc_features has static storage duration, so all struct members
are zero initialized implicitly. Thus, remove explicit zero initialization
of struct members.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/pcie-rockchip-ep.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 300cd85fa035..799461335762 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -694,7 +694,6 @@ static int rockchip_pcie_ep_setup_irq(struct pci_epc *epc)
 static const struct pci_epc_features rockchip_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
-	.msix_capable = false,
 	.intx_capable = true,
 	.align = ROCKCHIP_PCIE_AT_SIZE_ALIGN,
 };
-- 
2.50.1


