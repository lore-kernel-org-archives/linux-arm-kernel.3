Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841CDFA3741
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kh0+1+chHjNEp1bDD22RGjxNzSGu6tfL89BVhbtvA6w=; b=bIO77TMzwiVIpNhrLLw3FEEUqL
	ySCcAAr8C9Xteac+1qlQLKTm2U2+ODeMvfofgpBtCUM1rv5mtDVsClQAtrNJTNuaQfVNI4LKdnHUT
	Z+hDRyrRT/+95Qarxm+y+BwJb4yJqMw+pmak98Hz9I2SsQ8IasI+VTQ9xTvMA6LEaQQsdQJp65rLH
	9vsMhh3h581CVwwfzUeTJIaZVgmm/JB22SVP1LOUqqJXGH+wQsOaSFkj+D3eZLMzKyxIzkqSCWg3Z
	+mac/5iGuYGsr12BYVCSxogLLAKWWhYbSDSACRaABa1ZUYEEz3+NRKx6JBvJiQtqmeWwfm2Xid4pk
	NpWo/d0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbf38-00000008HgO-1Lbr;
	Fri, 02 Jan 2026 13:18:38 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbf34-00000008HfU-2Wpz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 13:18:36 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so5504413b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 05:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767359914; x=1767964714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh0+1+chHjNEp1bDD22RGjxNzSGu6tfL89BVhbtvA6w=;
        b=CCWUutFpeRLJpk/7HSCsDYK1yXwAcOU/kpO0P4YPk0AQ3HQpSWVkiBX+1akN4lBCU6
         M9LAvW5wuAw/Zm77hI0l5No0UknesZLNbm6HshEgOcnvc40wmSb8ye6EzFO6B4jKdoaT
         Qp17iGmTT5gNX16ndO8+cBQa2yXp0wB4LmUktbMGRjlY38m0VLBaoAMcLF952gJxmeES
         7Gii+Bfsahm4hsugF6AVYqWfJyw9/opsZgc+yABf4RTclE05w8odOvJpSAULwz7tXRKf
         kj/2VSy2c6nWuUCU1u4DzUfPUejDwJbwaWRR/8dyvNWpfcv9t6yj5Sef1EIcISprikvg
         f8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767359914; x=1767964714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh0+1+chHjNEp1bDD22RGjxNzSGu6tfL89BVhbtvA6w=;
        b=TaaD/Fh+l4YQJEiI7G/I2tMnZlTmEgGVrvr4HqUSExzPnyoR0OROnuSvug+aVC3gi3
         X8JYAHAp3VllzHzkEkiUEFpzm6GkUzwxS/rwt27k/cn9G61Uqqb7RSrYh7gJbm0KT940
         3gqjwk0MPF5eGob5+h4fWf4aJT8spngNboRdHcAIPyOz2enKzBbt1z35RmLPhXYFh/u6
         QTbRJnLxEyLD2h/yKu1k/zyD5n29liydNT4IwyCxizsQzYsW0rmeclI/HL85iXJx0ngC
         POJN1l+L0AfRZxkRe5bCZXUcOdd60IxlqElsGqVLT7bBsoIYvNihVWDs4tDNx734HZKd
         v4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUqEnTnLwiNUP4w4AUEGYCxh1yh4izS5aMUEIa1vF4wb3q8j8+Ujp4GHJMgT3GJIbu91k3eQ1RbQQ+R2m3XJ2BA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyyhu3MP8MCVujtR/2d2Xx/HBVYlqNg6+sNzGqA3Qsi879B8OK
	5sQAWXYNyvvYsIcwltnRkl7B8dRqVGcYimisvASHdZEn357gbNc/OCUL
X-Gm-Gg: AY/fxX42M3SsPzvyyZWZLm3aQUq68C3Xz1SCYrWBYAyb4TS/yN62cgUrieu/NAwASxp
	/yB49LHmnCbEfw/BTuJ9ZsXuN2pIMcbrGI/SS5P0TGE1xf8qODxnaPVIK3GvZml7ObHMcsIt30z
	9WWjdN7yUmsq6Sm4RB5aJ2YxUhaUKKGL+0P0xYgYqjVqf8oceyrxdv8FF19I7R69X0JRpJNyvJC
	yhMcu76Bzs40UIFfl65g6zjClLUWyCSQ+FBF1YcF6doR5i0m/hmgEw+CCND3/ClSZAQUe3Xb+ce
	QKRRhFpeNVzVbvX9MVvyp2fOXleKSjdua2lrpxI64GxARZbP7ra1e6Dtb9m6idkWxoSnKBKtj+U
	GQzLovGP/hmue5XPrOdBUZK0VR5GtcE/IU8WkTvS/kSrNgsXC3FA3V65aNwt1zPc/V3CTlNy7hw
	GyTV0nXg==
X-Google-Smtp-Source: AGHT+IFOoSD4aT3DrhU3ikdyAs6DYGzFL5+ZFBK1G4TTasauTKe+kqxCEq8s+rYlew1jpVJY/wcLlw==
X-Received: by 2002:a05:6a20:3d07:b0:35d:8881:e69b with SMTP id adf61e73a8af0-3769f3352c8mr41132629637.18.1767359909649;
        Fri, 02 Jan 2026 05:18:29 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961e039sm35278770a12.7.2026.01.02.05.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 05:18:29 -0800 (PST)
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
Subject: [PATCH v2] PCI: dw-rockchip: Add runtime PM support to Rockchip PCIe
Date: Fri,  2 Jan 2026 18:47:50 +0530
Message-ID: <20260102131819.123745-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_051835_460839_293BCAD8 
X-CRM114-Status: GOOD (  15.10  )
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

Add runtime powwe manageement functionality into the Rockchip DesignWare
PCIe controller driver. Calling devm_pm_runtime_enable() during device
probing allows the controller to report its runtime PM status, enabling
power management controls to be applied consistently across the entire
connected PCIe hierarchy.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2:
   improve the commit message
   Drop the .remove patch
   Drop the disable_pm_runtime
v1:
 https://lore.kernel.org/all/20251027145602.199154-3-linux.amoon@gmail.com/
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index f8605fe61a415..2498ff5146a5a 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -20,6 +20,7 @@
 #include <linux/of_irq.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -709,6 +710,20 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		goto deinit_phy;
 
+	ret = pm_runtime_set_suspended(dev);
+	if (ret)
+		goto deinit_clk;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		goto deinit_clk;
+	}
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto deinit_clk;
+
 	switch (data->mode) {
 	case DW_PCIE_RC_TYPE:
 		ret = rockchip_pcie_configure_rc(pdev, rockchip);
@@ -730,6 +745,8 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 
 deinit_clk:
 	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
+	pm_runtime_disable(dev);
+	pm_runtime_no_callbacks(dev);
 deinit_phy:
 	rockchip_pcie_phy_deinit(rockchip);
 

base-commit: b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
-- 
2.50.1


