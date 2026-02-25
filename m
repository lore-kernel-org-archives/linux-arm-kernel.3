Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7C5F357DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS0Ykx5d3ml8rzk8tsHJLTUHxdInYPjDBS3HSjaXmrs=; b=0wr6VQWyv7EExiZVIzFFXTHPAm
	B00caiAxCmaXeBRQSrfbxYs7T/KQzptdpLgnl78VUWzItgVFahcbhMYfzpq/zkoLZsQxc1jIm+ETY
	M6vn0Zk7BTPEX+YY7CMC3TWa8fHzvMMvW8j9jBp9prUQPUW0gou+Vu5YhhDfjj3+YPpJW8jwc8IJA
	CrJUvoV7A4T+UnQyQueDTv4xuAeUls7bISrNITuIzFt3u/xxIAj2TIgavbMmoRuJ4QK4RwNAAIM0p
	mvTnHvtCtfqF4Qz+jLBfsS/UQQiOdt5gt1V3xXWm/lsFK5QHt6F1lZ0CMNhwgvhJfIayacMO2RJWo
	kmrWrT0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9EW-00000003PLB-2Jgu;
	Wed, 25 Feb 2026 07:22:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9ES-00000003PIO-2vCR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 07:22:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2aadc18f230so39348395ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 23:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004172; x=1772608972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QS0Ykx5d3ml8rzk8tsHJLTUHxdInYPjDBS3HSjaXmrs=;
        b=ER1V7ojlqYee2D7FS1SZRwfQMzwOJEJ87Z93vPhLVwlshj99OaxbQ1pyeJK6+ba96d
         rwqWAaziNQjpCOzDaJwwHTWIvt6u6Aofa/DSCYP6tn7AM0cb0L+28tdxW9RcbHb3+CrN
         o7EcMgYCYUKqf4eBNqeMVMQIztYnwmXkuH6P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004172; x=1772608972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QS0Ykx5d3ml8rzk8tsHJLTUHxdInYPjDBS3HSjaXmrs=;
        b=n+/zuOYLwT07GeEWyidwCfhhtILBP7hiWutfH+JBhC0zyPexas9kyzOml1MTvzE80n
         IvBdKyOPOcx3K2j3/Z7rc2DoPulSSYUb9J/r9Hv2qiY2XW9aFdZ+lWmPkAxnYze4pSYz
         3qsLfWUBVgxBDyyv7tWIonsjJYzWwicDP1vqju7+oYTrehtPHpuQk7SbeKQrgV2qz0cs
         60DIxk+kw3ga8xj+JfYm0BH5Y/Thgjfvwa8VZWYpVHY5zsTS++Uxoe0e64g5wb7Bavjv
         /PX20S/MXyBZDAYWnkwytGmlp65Ek2Nr4VbB3DytUtdSkzszPUtKvtOIcRzSpY1XmBgz
         kjmA==
X-Forwarded-Encrypted: i=1; AJvYcCXUXMsocHCidDsu2aOuR5tQW1M8uqlSbi3QPtD0tu9U0Cs+VXx9hNndnKQhd20IrbHtQv/8v+iN5Fe3WsYeaBau@lists.infradead.org
X-Gm-Message-State: AOJu0YzuAhL/u9vQ++U8QwOb8MYrBoa1oKvCvV85VlOPde4ebc5nPEzw
	ksgVg2tjqmBXBQcuWvG1WpdQXqNiUhMmCABAQJmfLOBpK8d2Vx08ZCMYY2MMkd9KjQ==
X-Gm-Gg: ATEYQzyADKd6z2kd3+FVjS9auYpiw3yED4bA7j+dcPzygeX7PtSsWtJniKRmpzhw3dN
	PIjPge3cvLpk5AJbF7fVZbDloIzUopvJnJZmcC2ilvoDUMO+5PWHH2KApuxoqVGVo0jm9zLPTHq
	blXNhwPekSgAth90CwKN/TbAUB+yDdIb+zNXBg73ICnUzalqQ3Vzc3Maard9H1CxrSI64wW1mSo
	Dp/8En9AJBz3+bn/diUuS8wX+3Q1sjbbEtH7uKLGtwXDQs1fviPE0gb7lB0xBnSw8VTlrpOI/6n
	5PBjjD2AAtMcqMyJkKv8/bScnvlv7Jf8C3AkBZfcVucYZ8EqMD1xF6dQoYn1C0DzNsBEkZYjBan
	ymm/TaHGl1n3cJaXdkYRriJgwZJ1jKr6AkqkiJvLDEFEPW+XkPOcUFv4kFHqvkit6wuM81UHQpa
	N6FJNgmvnGJPT0jtpAnC5c6RUAOvkzJbewRlKpMDDDLsGLTMUuYAhr/vLiVGU6Z0uxuwBoxpFfO
	Hyrk0VRZfpxJkCP
X-Received: by 2002:a17:902:d4c6:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2add13fda8cmr13861915ad.27.1772004171868;
        Tue, 24 Feb 2026 23:22:51 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:22:51 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with dev_err_probe()
Date: Wed, 25 Feb 2026 15:22:18 +0800
Message-ID: <20260225072225.3345307-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232252_756424_2D7BA5E9 
X-CRM114-Status: GOOD (  13.78  )
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

mtk_pcie_parse_port() in the pcie-mediatek-gen driver has a bunch of

    if (err) {
    	dev_err(dev, "error message\n");
	return err; # or goto
    }

patterns.

Simplify these with dev_err_probe(). The system also gains proper
deferred probe messages that can be seen in

    /sys/kernel/debug/devices_deferred

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 36 ++++++---------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 75ddb8bee168..1939cac995b5 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -876,10 +876,8 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	if (!regs)
 		return -EINVAL;
 	pcie->base = devm_ioremap_resource(dev, regs);
-	if (IS_ERR(pcie->base)) {
-		dev_err(dev, "failed to map register base\n");
-		return PTR_ERR(pcie->base);
-	}
+	if (IS_ERR(pcie->base))
+		return dev_err_probe(dev, PTR_ERR(pcie->base), "failed to map register base\n");
 
 	pcie->reg_base = regs->start;
 
@@ -888,34 +886,20 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 
 	ret = devm_reset_control_bulk_get_optional_shared(dev, num_resets,
 							  pcie->phy_resets);
-	if (ret) {
-		dev_err(dev, "failed to get PHY bulk reset\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get PHY bulk reset\n");
 
 	pcie->mac_reset = devm_reset_control_get_optional_exclusive(dev, "mac");
-	if (IS_ERR(pcie->mac_reset)) {
-		ret = PTR_ERR(pcie->mac_reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get MAC reset\n");
-
-		return ret;
-	}
+	if (IS_ERR(pcie->mac_reset))
+		return dev_err_probe(dev, PTR_ERR(pcie->mac_reset), "failed to get MAC reset\n");
 
 	pcie->phy = devm_phy_optional_get(dev, "pcie-phy");
-	if (IS_ERR(pcie->phy)) {
-		ret = PTR_ERR(pcie->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get PHY\n");
-
-		return ret;
-	}
+	if (IS_ERR(pcie->phy))
+		return dev_err_probe(dev, PTR_ERR(pcie->phy), "failed to get PHY\n");
 
 	pcie->num_clks = devm_clk_bulk_get_all(dev, &pcie->clks);
-	if (pcie->num_clks < 0) {
-		dev_err(dev, "failed to get clocks\n");
-		return pcie->num_clks;
-	}
+	if (pcie->num_clks < 0)
+		return dev_err_probe(dev, pcie->num_clks, "failed to get clocks\n");
 
 	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
 	if (ret == 0) {
-- 
2.53.0.414.gf7e9f6c205-goog


