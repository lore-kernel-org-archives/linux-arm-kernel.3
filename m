Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFF3CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc09GahdLh1WLCD12oxRoEIfCyVdAcZXe+NVJ4ss8iE=; b=Vz3AH1N/Hum38DWSxQJ9SOGE+w
	lOy6SlJgcGbwRF3Rw5o7VnGRFBzvn5whTspdexIcFgwwhS53mSplgVKSBO3MIG3r1eloQtlUFsmp/
	1+5Ls5Ccge/eNBuOk6KeMgSkwk/mlqFSUyP4KcVEVHghjWyytL/iRGBveBX1h432ygfy0zEdsJM4K
	oEZjDuf8yyzwcztoH7Y8EO++CSyRDRBq+fqCNSz9rg5V+jsA060E/xaUo15U4FzuItnRrcMoU9fOP
	upxhphcJAVCE6LVTdMsfU8YE5i3aYMspzFNnscTCY54MoMFz4G7jzxlRNYUd6PLx/0sO94jcoQ9Ur
	bJKjBveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oI4-0000000ArXD-3HKA;
	Thu, 25 Sep 2025 15:53:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oI0-0000000ArSH-0xTC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:53:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46c889b310dso9202055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 08:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758815626; x=1759420426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc09GahdLh1WLCD12oxRoEIfCyVdAcZXe+NVJ4ss8iE=;
        b=eZOLGyL4guYvTJcOZceKseqI/REk7/tAGDkpXThROWV+0gWiFpZNO8mnt50ligQmbK
         mfLiBRgcn9xJ2wMbaS2Q7PjW6U1TbyNaVLOKWiEmEii0n7q8Hs5BBhGVwXBgzPIZj6gM
         of+02g2EkkcSVBaoOezFqNDKoNC8hEW0hriItWDA/yMJmDmYAT89rZ6478ESiWtVWC4h
         ebsoszflNSVAGfkTMcoL8N+JbdAn/h7eIA818qwE2+IkmjzrI9btBpqNk2rJ8r6xv4Dw
         45X3k/t7L5LoYU8ARZluj08gsucLeEkf2mHTHbY/0ctk46WWKGjSi6ruvMFcxZ102hTF
         CvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758815626; x=1759420426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc09GahdLh1WLCD12oxRoEIfCyVdAcZXe+NVJ4ss8iE=;
        b=fRdAKRjEDVYaz4ZDUE5rDy/4CQIZZtOWF5fZ1DfFBeAS8hu22WsAtj3DBbrD7B02A0
         ydmD3beUGPCxQrdNBtG3OR97lzSgXvfxKZ/WYFtf7D06Hvz3IHhGXJMrHAmYje2K+z4I
         oX81xlDzRR/qVdgyYDKhpAPcOsizSMKuoQKjM8gEZiWHthPEDFINAOYt0MmvlGjYA9em
         4ue1kvmojoCMNV+ROn5e/1+kr3IIO6SGxNo7iiX7x3m2D1NF85XaEv6bMwqLPjy2PNU1
         THWyvEAl9rV9owmcfQFR5OWQWKfSxZHonD1ffTaUNMZo+13AF4b3Su1NcqOkZmGWGwf0
         gVxw==
X-Forwarded-Encrypted: i=1; AJvYcCXR8FGlUiAPO3RsJmHutj7o+GnHUeq8WY6Wstfel0Yl2F7Bd+Km6IOVbiVIcW+9OWUfv4V2gqtBHHq8IPTFF8oY@lists.infradead.org
X-Gm-Message-State: AOJu0YxP1w9JAjH6B9aEan8D2Bszy+5NiLtqcfDVpqFmhWqYv+VHKOce
	WhEXexnqU8TsSPcO0CbeYpvp8tyiGvv+5i20J7WSyqbuoNJ4PlEB5B8D
X-Gm-Gg: ASbGnctKiJbxhLdW4xQ/5+0D48zbW+sV4YMNBbZ3GQFWnp8xzokeBWV4ipi0V18KGn7
	EL+o0YjHKK0tFVy6TzE6TGKBRBgMyUVmvcXDmnyB+EnzCksN2g3UPQ8yex1lrch4VBFrDKxiEy8
	iXF1GIFJTnqwbND1u10w+u/G3xkcuAqY0KAJDjHxDfyjNu6mZuVd76EHQXlOm+kdZ3R1uGURUF2
	XhFenhY9TqeaALbjV17/bAqb1345jwR/F90zJa+vFkjQRsCgArgpzdWYMbMCoG0/jxk0SHAbuA+
	9DIU9Y3MYRyAMhV1sBOUGK3c3eEN2G9vFiAojZ3mp+WWso+TzKStxAvc2J2Gbx7Brib33tg3pvA
	VQfcqN+zHetAyUeJYS34dCc3n6fVpGOO2tMpbaNNopviIazbDKwCYV4PQXKOcTd76wGt61Sw=
X-Google-Smtp-Source: AGHT+IG2qaZ40+rYML/8FUKAPUFnHb8/tAbzRd0teawkTtDKY5USA03HWVuV/ealVHMZ83GuucUnTQ==
X-Received: by 2002:a05:600c:3b93:b0:45f:2d7b:7953 with SMTP id 5b1f17b1804b1-46e33ca926fmr36448905e9.18.1758815626035;
        Thu, 25 Sep 2025 08:53:46 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm98449995e9.7.2025.09.25.08.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:53:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 2/2] PCI: mediatek-gen3: add support for Airoha AN7583 SoC
Date: Thu, 25 Sep 2025 17:53:09 +0200
Message-ID: <20250925155330.6779-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925155330.6779-1-ansuelsmth@gmail.com>
References: <20250925155330.6779-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_085348_282067_EB84BE45 
X-CRM114-Status: GOOD (  13.65  )
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

Add support for Airoha AN7583 SoC that implement the same logic of
Airoha EN7581 with the only difference that only 1 PCIe line is
supported (for GEN3).

A dedicated compatible is defined with the pdata struct with the 1 reset
line.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes v3:
- Add review tag
Changes v2:
- Fix alphabetical order

 drivers/pci/controller/pcie-mediatek-gen3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 75ddb8bee168..6e68ed75b564 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1360,7 +1360,17 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
 	.flags = SKIP_PCIE_RSTB,
 };
 
+static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_an7583 = {
+	.power_up = mtk_pcie_en7581_power_up,
+	.phy_resets = {
+		.id[0] = "phy-lane0",
+		.num_resets = 1,
+	},
+	.flags = SKIP_PCIE_RSTB,
+};
+
 static const struct of_device_id mtk_pcie_of_match[] = {
+	{ .compatible = "airoha,an7583-pcie-gen3", .data = &mtk_pcie_soc_an7583 },
 	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
 	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
 	{ .compatible = "mediatek,mt8196-pcie", .data = &mtk_pcie_soc_mt8196 },
-- 
2.51.0


