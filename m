Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8D5C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydqGydIhuDDyl7HwNDKvgG2B2kc8Ep5uO9xnBpgbeig=; b=J2H0K13rSabVsegD0tYIcCYg6A
	+3eaq+654rhb4qd9T+EtwTT6xNV/V6i/CCyPBGbNvZCkAZsdqdYDeIxpMEkByxu8YTeOisPLtfPWG
	mr9XBfSV0xlm7EBhkb2ITHXesOFubk4wf5huDkQ5Rkp5Ip+tM3kiSU8Ia7iBKYBt2N4ENlQTjLTXs
	4SN1PV6qpZkLinYjGZpmH1W7ZDEYFRBnzIhejvcUeem4pBoSLfMZe+2OUUfB54aUsviV66niAwpll
	eZy7Vy6tNuuAVuSJWPiRSl/oqn9KdRKLLZoWIETtjrQ+AvT0oFlRTFAj87F77TxnLDrnlFGAFhvbV
	jGwaBi3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCD0d-0000000B0Ay-34l0;
	Tue, 06 May 2025 07:46:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCCuE-0000000AySy-20se;
	Tue, 06 May 2025 07:39:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7BB95C5424;
	Tue,  6 May 2025 07:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14F2C4CEE4;
	Tue,  6 May 2025 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746517197;
	bh=AER962ZuZOG4wg10/L/A+V16dE9LvDSa7EDpShemSR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HP0LfkvaCaUaq/ASe75mL4MzHbEBt0Siq4iUkOIixnsNFQUbcpi6mBrxSTCQ/FURw
	 rIC+BZohwUELQQgvtnW4rXOePJLkSKTn+0wbCnH3AVsXAUsVNnZdt8GadaFXb+nFB1
	 F9q7Hr/MvqlqfsDY4Ehy/fvB8eOJr0J95PcOV8ypo8Lx1b4hayjQFepDthrrtGLc2j
	 LmC6iKR9scGGgTWZJqKXMa6iHbRHVhf2Yfr4EFDJxA2rJH22iH0/OcaFH4/GZujFmx
	 VdZSnCSXBThLidB1jQMtk2LBMqfvZJUjoZ2PRLIMrgvMsBjpgNVsJPnSrRgZ1Q2Xfw
	 uZJG3PwfiZzuQ==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 3/4] PCI: dw-rockchip: Replace PERST sleep time with proper macro
Date: Tue,  6 May 2025 09:39:38 +0200
Message-ID: <20250506073934.433176-9-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506073934.433176-6-cassel@kernel.org>
References: <20250506073934.433176-6-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=cassel@kernel.org; h=from:subject; bh=AER962ZuZOG4wg10/L/A+V16dE9LvDSa7EDpShemSR0=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDIk9+zun3Xrp2Prl8+vjr79rMs+zTtpwfFV9tI3OiavO CJnn/VyYkcpC4MYF4OsmCKL7w+X/cXd7lOOK96xgZnDygQyhIGLUwAm8jyA4b+P7ffq8F0ucu9j rtcWTr0r1b/h5srN0xklQi4uzN9dv9eV4X9QFA+zyLsbFTO+OM7kKLz3km3Z/rln3+3hC13r6SW 2wZ8NAA==
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_003958_559029_3AEFA7F9 
X-CRM114-Status: GOOD (  11.13  )
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

Replace the PERST sleep time with the proper macro (PCIE_T_PVPERL_MS).
No functional change.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 6a7ec3545a7f..0baf9da3ac1c 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -225,7 +225,7 @@ static int rockchip_pcie_start_link(struct dw_pcie *pci)
 	 * We need more extra time as before, rather than setting just
 	 * 100us as we don't know how long should the device need to reset.
 	 */
-	msleep(100);
+	msleep(PCIE_T_PVPERL_MS);
 	gpiod_set_value_cansleep(rockchip->rst_gpio, 1);
 
 	return 0;
-- 
2.49.0


