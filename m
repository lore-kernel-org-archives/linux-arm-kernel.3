Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173D5CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJHpdmr2NXtFEk3A9X9aIw2etVmtC3q73hrlmlo4/OE=; b=EELmU6tp91MMe4EHlHuZgfLqcg
	Xo3BIJYtvsVbPgiSTpfXpLv4xjAazc+Ob4AwhjefTim4s6+vAPpGg2xttsFcEyxkpbEe+4csI5leb
	JvQ3Q3Ve/tMJiZa78bh6+SEPd4Nf+5+/R/k9Q81iXlHUwqXMwo3DrYJIAF6NUthgyvIL9N3DWZxw5
	jLYsR3Zrm7SzRzH1tO4C/DvSksA6WSnbZh1HiXPZDmgq1/WyjuGnCEePW7R4GsW6Iq5BiA20g/6hK
	v2wUHXovao6I3rZ8tPLV2x9S5h+u08QXHVLh/Plunk9iCMuspRSc+YMqSF/qd8On5Bpafj30qovFi
	1gm+Is5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOe6-0000000EAXH-3PzX;
	Mon, 27 Oct 2025 14:56:30 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOe4-0000000EAVg-2g5m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 14:56:30 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-781206cce18so4720356b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 07:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761576988; x=1762181788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJHpdmr2NXtFEk3A9X9aIw2etVmtC3q73hrlmlo4/OE=;
        b=efdS3w11bpHaEEadEp4Fii1X/c8oExZAv/cyVOBjs1sN/8/BJDlUo8CDelUpkelfJT
         65EaReL7YQ2vASZ7gBXUihX6wxaVKbSoNebYuVg223UezQVA68o2+g4lSPpi15CzbdmL
         20ORgELUQU1amPUHE3wNm7Uv+tSIp232JsXSdC0zpqxDhwLbDhOnk+EgtwATnog2zBml
         3PRIMb/oG9GHqtWN7CzELady0XM72y5yup3XCpVyGFoEhuEK5rL1kCLsWq1AhZtE8F0Y
         kZmj1Rc/MRkryErUpnsuuChR9z3W8S7n+pp1+I0YjyHfcN07ThF+yQ0B0SGKo3lM/JUl
         ByuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761576988; x=1762181788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJHpdmr2NXtFEk3A9X9aIw2etVmtC3q73hrlmlo4/OE=;
        b=aTFIx3qzj7II4w4qUIGrteiRLrONBedL0AAXFWb5lFFF8SZGLY5aKDVNkymlch8VIv
         2eyxbW6V0GRNGzCtMoxGbHTQq/MYW3q54Tm1q7S1MpUpDJIxV8rknM6X06DiypPgSQjT
         SIf23prd98kmPoVrybGPCuirOhBQySHWkgLFU+e/Q6BmlS8mtf5/ANChwfp4FfwLnLIg
         WlcQLs8BljvW2eUiTmBtd9LqK4DBd+vmzXEnt3YB58XE7uHyz7UbDoRg4VNb/U6vqg9H
         J4x6brc0jBAUaPGAucpbSImuksKr0u3cmOPsPyJv9tYGcyQR/ENl4ru3YEKuuEPVVypc
         3Z+A==
X-Forwarded-Encrypted: i=1; AJvYcCW0e1sszDiKywFd5cv4L4+x1/fWuD4LGXR79Xq+l8JYRNusnLyK4eWs2Zdl0s59XoclsNbPndPz/p8uCL21MEG1@lists.infradead.org
X-Gm-Message-State: AOJu0YylIRraN7QyHqimfuiBqPMU5aZUJrFz3CUhopMjPAqljWaBcxbs
	/sAqJpUTPrwajDoKQuTYDoVNVQ9Fq6BvsWyUiZk/a2ns+u3m0RjgyXIc
X-Gm-Gg: ASbGncvUZ6LP3sL95RA6sPTE9ESWY2k5miDhRApg+637QtJS0fALgmmQxp9UPGTPMkD
	iHgqD6KBMNtSOjQZGAvmWtuOf1DQz5awn339YU5ISca/2fM9QbdRvpeXRcO2eZu4ioL6AYzC564
	WH5NXfry+ds50eYTTRVsEX7NoO3URDm5gWyJE6QYKpR/00U7wS8gqs6EqQyl8Q9uQD9y+jl5G6I
	xMnKCU7ooDfqnbd4vE+xCeYPlgNTlU0loAg4Ma1kPFuGkpxIlgYWVSGUuiT9uGK8gwZDP5FsA7y
	uAK6z3URW68bF5HrCQ5Enet7SpBjjx9hjhh1AWAipnRHnqUJDtFWy8T9bTjNSDrSJBojL/qvVgS
	tLfazNdT2G3N0jLf+dJcA5ifEogndEn0pJeqDGSobW8zKGyzhsEA2R1yuQceYnLvksjBNIpPqKA
	==
X-Google-Smtp-Source: AGHT+IFpo+vKMKtPf87tmaXVzNFkUX+AxdjSTgekyu9iCoaPZB3m/DdveKL6EgBsKmZAINobovUjew==
X-Received: by 2002:a05:6a00:6d48:10b0:76b:ecf2:7ece with SMTP id d2e1a72fcca58-7a284df06aamr11245249b3a.12.1761576987961;
        Mon, 27 Oct 2025 07:56:27 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012b19sm8373372b3a.12.2025.10.27.07.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:56:27 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Hans Zhang <18255117159@163.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 2/2] PCI: dw-rockchip: Add runtime PM support to Rockchip PCIe driver
Date: Mon, 27 Oct 2025 20:25:30 +0530
Message-ID: <20251027145602.199154-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027145602.199154-1-linux.amoon@gmail.com>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_075628_677283_08AD7CC5 
X-CRM114-Status: GOOD (  16.02  )
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

Add runtime power management support to the Rockchip DesignWare PCIe
controller driver by enabling devm_pm_runtime() in the probe function.
These changes allow the PCIe controller to suspend and resume dynamically,
improving power efficiency on supported platforms.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index b878ae8e2b3e..5026598d09f8 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -20,6 +20,7 @@
 #include <linux/of_irq.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -690,6 +691,20 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		goto deinit_phy;
 
+	ret = pm_runtime_set_suspended(dev);
+	if (ret)
+		goto disable_pm_runtime;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		goto deinit_clk;
+	}
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto disable_pm_runtime;
+
 	switch (data->mode) {
 	case DW_PCIE_RC_TYPE:
 		ret = rockchip_pcie_configure_rc(pdev, rockchip);
@@ -709,7 +724,10 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 
 	return 0;
 
+disable_pm_runtime:
+	pm_runtime_disable(dev);
 deinit_clk:
+	pm_runtime_no_callbacks(dev);
 	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
 deinit_phy:
 	rockchip_pcie_phy_deinit(rockchip);
@@ -725,6 +743,9 @@ static void rockchip_pcie_remove(struct platform_device *pdev)
 	/* Perform other cleanups as necessary */
 	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
 	rockchip_pcie_phy_deinit(rockchip);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_no_callbacks(dev);
 }
 
 static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
-- 
2.50.1


