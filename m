Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DE0F357DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUo4vtr12HAXaUXM31/ATv4Xjd7UfeFJnf/tlsKW30E=; b=2eQTSuD0kn5hCt+vaOEwoB/bXo
	GJC0bSJdcaU1XNWL5+FB/kZiMhbX1jyiv9HfBh+c5E7teQ71xesxk5BWrzrMdEVMbFCxwCenbsXjZ
	qKVbdXV+JK9bt9t4XZNVcxiaulLrxRmOKJBL4VGadO6BuqWVlZC9RcM3wap/spxsMb8loZbYrPg4K
	8sMHjtjWv3k0JjWLxM3XABeVZ7UxHLwYjSVIQpvbKa4xvlrQvoaki9NaEJZkwmaLp94fQhlXcaWIL
	srSqyTfHnlyK0dvYmHMz7C5UsfWP8xODMJs5Ix4CFc2gs9miAVdBJs7xDxirs0FF/mp1626sOapPO
	d7g0kaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Ei-00000003PZD-3rKp;
	Wed, 25 Feb 2026 07:23:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Ee-00000003PUi-3SEy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 07:23:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ad3f12a496so2299935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 23:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004184; x=1772608984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUo4vtr12HAXaUXM31/ATv4Xjd7UfeFJnf/tlsKW30E=;
        b=lDhKP6sSEcJ5TihNZe6YZjrFwy+Phto+2suN7hJotoRZoJ0ei78JMD5NQnGCp2OA2S
         weaLbnAXcmUsHfvKhI5minVjjqUf2oMh8SycPYTVUMt+vkMrUu6cu/ftgo6f3TV2zNCL
         AAlYLhoZDUe72JXgg1p/0LsH6T0oloFaw7fcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004184; x=1772608984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oUo4vtr12HAXaUXM31/ATv4Xjd7UfeFJnf/tlsKW30E=;
        b=LJxHmg4j/ZLobRdQ97DYGShs7FUS8ijsOYeY4DUt27QY2wG5snrcVQy8J9BacFwzUn
         AeuLfpsUZzOPeyOkS2WuvUHILsm3h4dZKNKyNC7S0xTxyps9c+RLKE6XkxCQJ037btsG
         SPV46PFPqMAHfNemd1fh3xQXUSVJAVgi7mIOKMOKD5u+pGmadn+JpZNDnFAcSXyvjTe8
         X1DPaZVEybBdhwdliKbqYW5dRJ+XRgEW/od4ydY4OQDpvz48KV+hCFcEVcHW+bQmYqnO
         Cnw6SSRHL6K/BtEcTrYKyYxXWux3EiEp0j0iZVjce3ynsl7bBGajCMOPrsntLZiydCHS
         VXKg==
X-Forwarded-Encrypted: i=1; AJvYcCWELxiw0uh5KT+eFQ1M2zI++YhIy5VxKSTYrp1odvFKZj82pci2Pw0i58VTW9CTArOr3l3pnbsVDM1ekeI4I69Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxDorkIx5F0CaO5K2RL05xn3f01P0GbSFngiE+vlZk4WMBeg9F+
	zxpJkoIv7VmLR9n0AOnezDMB/NRzgJwQoWA5Smps3/TATAvDgwK7LK7LJx3ErXz14A==
X-Gm-Gg: ATEYQzyXQZhpVqqSvF+n4MSk1aaP2wl8DOKOnR0ONtNXGG3zIDNc5OwVb95eNqqJi1s
	gN1ViUKpyv2wRkMSb4jBbPZxONK8drHDTqZVoh45wv2Gvy2Pev4UTKhxtcH70Zs3GYJK4nEJWkO
	cJeoTQvUQCg4UpbDwwf1PqinNIj5XNlfrhs1C0EWQKvAEkgQ8LfWGb4Z86vRJuUsLYSx2svPbJO
	nSOzfJBsGd16XS7UdRmN7GzfNhfhv50PF8NZJ4B4vhV3xAxkoQHYv8Ia2Z4Nkdrb7w/7ww6y+j8
	qk3HlqBbCjhHONLP/Sjd80cwAln4vYOcdlh1arpdn4xsx62AL3egxx6gVDDwoB43PffiECpp+E0
	VU0LkFv9rb2M8ALEHnqsDy65rgfw4ZKdg0s5Mw1P0G5Q7QCGcHTyjzljhnLdq1yJVYDD2eMWkFR
	3WdlJa7NcoaHIcC/Vjp15oQcN7zYVRtP7IKPURpIKxRtUr1NVSyVWwbjTs8+hr4vyIaXV2i+OiJ
	AgmYA==
X-Received: by 2002:a17:903:230f:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2adbdc0fea2mr28441365ad.3.1772004184166;
        Tue, 24 Feb 2026 23:23:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:23:03 -0800 (PST)
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
Subject: [PATCH 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Date: Wed, 25 Feb 2026 15:22:22 +0800
Message-ID: <20260225072225.3345307-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232304_880836_0E60F4C9 
X-CRM114-Status: GOOD (  18.34  )
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

With the new PCI pwrctrl API and PCI slot binding and power drivers, we
now have a way to describe and power up WiFi/BT adapters connected
through a PCIe or M.2 slot, or exploded onto the mainboard itself.

Integrate the PCI pwrctrl API into the PCIe driver, so that power is
properly enabled before PCIe link training is done, allowing the
card to successfully be detected.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 38 ++++++++++++++++-----
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 7459e1c1899d..93e591f788f7 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -22,6 +22,7 @@
 #include <linux/of_device.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
+#include <linux/pci-pwrctrl.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -421,15 +422,23 @@ static int mtk_pcie_device_power_up(struct mtk_gen3_pcie *pcie)
 		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
 		       PCIE_PE_RSTB;
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
+
+	err = pci_pwrctrl_power_on_devices(pcie->dev);
+	if (err) {
+		dev_err(pcie->dev, "Failed to power on devices: %pe\n", ERR_PTR(err));
+		return err;
+	}
 
-		/*
-		 * Described in PCIe CEM specification revision 6.0.
-		 *
-		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
-		 * for the power and clock to become stable.
-		 */
-		msleep(PCIE_T_PVPERL_MS);
+	/*
+	 * Described in PCIe CEM specification revision 6.0.
+	 *
+	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+	 * for the power and clock to become stable.
+	 */
+	msleep(PCIE_T_PVPERL_MS);
 
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
 		/* De-assert reset signals */
 		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
 			 PCIE_PE_RSTB);
@@ -449,6 +458,8 @@ static void mtk_pcie_device_power_down(struct mtk_gen3_pcie *pcie)
 		val |= PCIE_PE_RSTB;
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
 	}
+
+	pci_pwrctrl_power_off_devices(pcie->dev);
 }
 
 static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
@@ -1211,9 +1222,13 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	pcie->soc = device_get_match_data(dev);
 	platform_set_drvdata(pdev, pcie);
 
+	err = pci_pwrctrl_create_devices(pcie->dev);
+	if (err)
+		return dev_err_probe(dev, err, "failed to create pwrctrl devices\n");
+
 	err = mtk_pcie_setup(pcie);
 	if (err)
-		return err;
+		goto err_destroy_pwrctrl;
 
 	host->ops = &mtk_pcie_ops;
 	host->sysdata = pcie;
@@ -1226,7 +1241,12 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 
 err_teardown_irq_and_power_down:
 	mtk_pcie_irq_teardown(pcie);
+	mtk_pcie_device_power_down(pcie);
 	mtk_pcie_power_down(pcie);
+err_destroy_pwrctrl:
+	if (err != -EPROBE_DEFER)
+		pci_pwrctrl_destroy_devices(pcie->dev);
+
 	return err;
 }
 
@@ -1241,7 +1261,9 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_unlock_rescan_remove();
 
 	mtk_pcie_irq_teardown(pcie);
+	pci_pwrctrl_power_off_devices(pcie->dev);
 	mtk_pcie_power_down(pcie);
+	pci_pwrctrl_destroy_devices(pcie->dev);
 }
 
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
-- 
2.53.0.414.gf7e9f6c205-goog


