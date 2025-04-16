Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5D7C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kxRWREi2/yn3kvLr3/tieNo8VjE5QaX3gIFqLkknoFw=; b=VaXwuvK7UD5e+yA/RA6aVBA/6F
	/MthBLRqOoBBLpUtdFWAQsXk4GM+48zpJbsoV2X+B0ep33M0AWKXfcPqbznzcxlUf4+6KDcj/3fBG
	v4zAN13ym322iqVM9/ItukkST1MvAkfmcVWvqODz7iKjYhQxWf+HDp301qWqMwXw+VFDWuH48k71E
	+RmzDojdFLSt3V2XW/LOjEfMuA5WyOmHjhGAL3WKLOmWHx/jdc5zBvcdPks+/KsR5dBpsUpVppIPp
	Dmnuefm4cew5Fq7pHMbyT9stLRXPP5p5nozcec8Cc9oNucGA6OEdRfftd3UGrGGDBZQi8wnfTmVy2
	Wxw6nHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54zc-0000000A8GY-1QJO;
	Wed, 16 Apr 2025 15:48:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53kL-00000009tPE-0fnB;
	Wed, 16 Apr 2025 14:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55EAC44BF1;
	Wed, 16 Apr 2025 14:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3340C4AF0D;
	Wed, 16 Apr 2025 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744813692;
	bh=YohtpSKfziHQfMPNcNaGHRCZ3p7uL5Xf3nCpnAqt2us=;
	h=From:To:Cc:Subject:Date:From;
	b=f1gwotxw8qmedNGFyJRw+hTIvIeLRizf3DPhc4hSAPcwnjmnwKmg5oalAo00kvQqv
	 +dpTyPmDKid5E7Mrz7nHDpP+08ZKx3VqELDemHzFHSvYKBt6Ya0zlT+FaiB8kDNNCI
	 JzExyn0z1sT06R9r/aTQps4wyyzGn4FH2zRVMUL2SIFSCnoBsYCqZx7jF/I2MdYgkB
	 x2O0oS+5yGdH16Tj1tMfiuLWxr0pPljQuuXmYNRqK2w+d8517VqI/H5T9W+Sty1LIP
	 0qD3yobzffiFR61gYw0tfd2SinZ7Kw2FZC7cdnMG9WEBoH/Y5pcuVLEgnDvM3JnNfw
	 XSx6v41BmWm8Q==
From: Niklas Cassel <cassel@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] PCI: rockchip-ep: Mark RK3399 as intx_capable
Date: Wed, 16 Apr 2025 16:27:49 +0200
Message-ID: <20250416142749.336298-2-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=cassel@kernel.org; h=from:subject; bh=YohtpSKfziHQfMPNcNaGHRCZ3p7uL5Xf3nCpnAqt2us=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNL/70ud225mUuCSez2hyl9kUt0ZzXSJuU5bvbUc/e4p+ m5J3pXSUcrCIMbFICumyOL7w2V/cbf7lOOKd2xg5rAygQxh4OIUgImIcjAyXP85/0uJXNy7F+y+ N7/ZGe74ESGX+mexQ5i6UlqQWsPFXQx/xabkxhZwKGRsnqK/tufL0ofbH/j//9d5XdhDW+mw7yY LBgA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_072813_216387_E0C89486 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

RK3399 can raise INTx interrupts, as can be seen by
rockchip_pcie_ep_send_intx_irq().

This is also in line with the register description of
PCIE_CLIENT_LEGACY_INT_CTRL, section "17.6.3 PCIe Client Detail Register
Description" of the RK3399 TRM.

Thus, mark RK3399 as intx_capable.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/pcie-rockchip-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
index 85ea36df2f59..626f6b31b0f6 100644
--- a/drivers/pci/controller/pcie-rockchip-ep.c
+++ b/drivers/pci/controller/pcie-rockchip-ep.c
@@ -694,6 +694,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features = {
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = false,
+	.intx_capable = true,
 	.align = ROCKCHIP_PCIE_AT_SIZE_ALIGN,
 };
 
-- 
2.49.0


