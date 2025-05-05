Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6726C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7Kx9A5RcVyySk5XPwueezuDsV04Mz7gwEanL31Yvno=; b=eOOkPUKKM2XeQD6FwnQKws/bee
	ONVnrJAmPDZnEsaK0N2AF4idrzeRcSzY9ujKhnWSSfAuZqJn7SRH97GEFRz6sZwKV/Yiz78irwoMI
	7gen+cjLS9gQky+oQaCmxOkJVrIyLdO2l/weEBP+RTOSOQt7aw7ntFhrjyJbU9w5X2ph0IduK5Gz3
	1FesahNnWTisAOhB8eBYpG3Etzi4NPTkER5RTuqCRT0h9Vm23KaGtK1wVUI3nAawQQbgq+kuFA2U+
	ydtD01vbEELpY1AkVD657tGU9CBkWGMxpCuk/jXPEobud4GPbGm044m6gL4Wjju15NzKUtqxkmQpG
	xE46HhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBsBa-00000006vvr-1c0r;
	Mon, 05 May 2025 09:32:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs5o-00000006uop-0pQM;
	Mon, 05 May 2025 09:26:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BADDDA4C762;
	Mon,  5 May 2025 09:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47554C4CEE4;
	Mon,  5 May 2025 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746437191;
	bh=/qLNq6Ah1zBhiF3Gu9j00ITANtVDvo/o2g4ubZb++T8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oed7o53SNZOICzTHjIxx3lU/LvGYFJSyr3zk4Mm0uKsC58q/g6J4bYRrpUyCFOGky
	 u+Dsk4KFA95NJqhONAYYx9429ML72bWY3XEw0QbltdI4UVM4Yegq+o2wA8YydeLgmT
	 PN4UWCSHMFxhwBSKTva1sLQzRtARDcLKvqZz+Yj0b+D1ogZ68AJ9/NiOQj8BmKjZoG
	 1TfcqheXj8x3V/AM4O1BiBNsYtjfrdq/iwuUyfNmSe8KMjjdC7G5QVlfEbJGjgHxHa
	 qy257ZXQIk4i5u+Xb510UleDEuDktjrAbEovYSroIMFgdh70crsPfzauh+a0K9Qkwt
	 VF+ukSPwCUQcg==
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
Subject: [PATCH 3/4] PCI: dw-rockchip: Replace PERST sleep time with proper macro
Date: Mon,  5 May 2025 11:26:07 +0200
Message-ID: <20250505092603.286623-9-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505092603.286623-6-cassel@kernel.org>
References: <20250505092603.286623-6-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=cassel@kernel.org; h=from:subject; bh=/qLNq6Ah1zBhiF3Gu9j00ITANtVDvo/o2g4ubZb++T8=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDIkWnQcZa+xFjLu/Kpp9+rqJZkKjlOlyz3VuRq1jlY19 h2Nl7LqKGVhEONikBVTZPH94bK/uNt9ynHFOzYwc1iZQIYwcHEKwERq3Rj+WexRMlpU2ms6NWvn g09v5B4Ush9vir5ntYlLfFmOSOTT84wMT3+UBOZ533AROnHJTZ6L9/hCqffSYVGBzk9cbi04fPM GLwA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_022632_296295_7567B68F 
X-CRM114-Status: GOOD (  11.22  )
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
index ed8e3dfe80e0..eb2931b39f7a 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -231,7 +231,7 @@ static int rockchip_pcie_start_link(struct dw_pcie *pci)
 	 * We need more extra time as before, rather than setting just
 	 * 100us as we don't know how long should the device need to reset.
 	 */
-	msleep(100);
+	msleep(PCIE_T_PVPERL_MS);
 	gpiod_set_value_cansleep(rockchip->rst_gpio, 1);
 
 	return 0;
-- 
2.49.0


