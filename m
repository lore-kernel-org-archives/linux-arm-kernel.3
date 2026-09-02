Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E06C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7VyQUQWJnOntAVMrtqSWEPb9QZWEDyQ9M01GPlIB7rE=; b=VGOT2ZFQmavW55WEH217hupt2p
	+kuaAVD6VN3A8DfE55X0DEsF5otMpytmrNVSCC8xkpjs36uH1Ro6CmyKUNt9Vh3kDbo1a68PtRPku
	yxkPJdJ+lpkrt4QowEB9lphJn0R6DbZ7bdYucjurTloJl70d8tw+fRBwT0bzqklFLz090hL64d0+2
	Ocu6H/kJXjb/zT81UONiqzybJ4UwhM4fueEEzR40gIJDCpVnfBMxFpW0QBU/cen+MjSDKzx3I49c5
	ydtpqowkGFYo0CmBWM37Y8If56nB0991qhU6cCzmFhWl2z/aGbImVNO0dLHnF38iB126H7w1RR9vq
	eFHm+ZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o3q-0000000FHnl-3oTP;
	Wed, 02 Sep 2026 16:43:42 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o3j-0000000FHjT-1h2k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:43:40 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-853c947bfefso69848b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367414; x=1788972214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VyQUQWJnOntAVMrtqSWEPb9QZWEDyQ9M01GPlIB7rE=;
        b=nTZEX8bNGdZlC3L9ujo4QAEn6Ihv/+laAvER2YSaa5y2fQxW0BrsHwoa+4zi4T6Ebv
         Uza3OUe0jvNod8zAbx/ZqFVhReSxLdKOk5a/kBJAGYGBP2e1wP64zj33TWwcvuBfA3pa
         i1WcYELdmaI6Ep5X4ZzfYNyYV/2Zt1BQeqV31tbvnpbHf8pq+Y6wWz2eLIOKktDUvcHn
         MBnCju9NhjJukyzG8Gdc7az+J5YpjZSG6v4QbJuYHsZxhm+XGZyI02VYINKbGCH0hFWv
         C8uG5iwCfsrMN8KoYeTsaFeGUK902SRgVSOshfwu2WOrxNTHoEyoAg8KwJ73jkSxpVx6
         E7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367414; x=1788972214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VyQUQWJnOntAVMrtqSWEPb9QZWEDyQ9M01GPlIB7rE=;
        b=hxMb+EXHKrymZ0+VlSoqYIhHExnETtpoFiXvleZ1P22IF0dBNUl8Xn0XCB4BOkdOrD
         KP4kDSDW0tg6xws/+5+CWGRf5EB6qt/rAe0dgVS59GJxr41Xu8WOqUZ/z00h03oZi/7h
         X7RZZ6DudbCfTdB340ySmzKshIutQT7U4eKWiKK541dzRg8hCO32whuOscouNe4K2V6I
         3uBmL2gIHyXeJFD+9R5EED4Vb3B+ImICRferrqH7Ln0jorbZYkff6DlQ3UkLBFhnwR2n
         kefA4Z9h6GfzNoUqIiAmWWkjDqIcbHSkQgRG6wPdm+7ODe695vtPwUT+FP3AL8ru4xAz
         8+VQ==
X-Forwarded-Encrypted: i=1; AKwUvByNOBDEmlbf/45g2JLBeRnAgzi/J459Tgtj6k3LYJcBbnamIQIZmyujS0ZQYPA/giAhn6GOqjsGrsJIvl/OojLx@lists.infradead.org
X-Gm-Message-State: AFuF++l9trNWaIeKRCqdtlHQZ2BzFLbtgY4CMZ/UB4mciJzl9VDdYP7z
	hno5QPnn9c095e4y4bqRqyJQcBlkOGXiqWRb4z1TgLhZIsiGvaPfBbBC
X-Gm-Gg: AYBFou2QfW2KuLDz8SC51+q2yCxjxqv5chSRlOJ5eBFMrPv54jWI1fu1kzxQqmfNzcZ
	AW4QeXlBRPPeMykIhdey8zszCA7+jPUxdBYHBRdOwbAt6nmCnH9NAYig4Km6ouCginw0Ngb+k+X
	amPvH8gq358AEhkqL8Hy/nYeekVUyRsGXur3fn2l1y/dgaOvw9hEdBYrne+i3pvZ0CVxOdu2XXy
	qZJM52cKkRCy7YCM+eRRzUZ2lynb4fSCiOZunkow/jkSa8KbwcQ4SlXnrhzt0GRIbgmXLfE7Ve4
	ocJLHbQwaLNOaHPtlIxfay+FNdy2kdFxZ9y1yKEE20jxeYR4LwQOfH9CA/MK5PK/WOH/1g1N4Dr
	W76A71pmHkkP65QZtkzShnFvNs+tdIw57SmjLZYW9uBsUzgKfhS1cPTvrGWIfPNvjOxe1/tCaLp
	vTbYRO1hCPaDFqub6XeoqO/criVdrc8wkOZ8yLI5JwxMR4Pj8Nm5ZjQ9nT9h0HwZec1DGKAGwF5
	u2vhGJ+iHmAA2ZNRkwIpcVqvklCK+pGjdcuxb/uThDfn26Z1Wc7
X-Received: by 2002:a05:6a00:3001:b0:845:cad1:d691 with SMTP id d2e1a72fcca58-85ffc18a90amr422148b3a.5.1788367412611;
        Wed, 02 Sep 2026 09:43:32 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f4140sm1691158b3a.1.2026.09.02.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:43:32 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: [PATCH v5] PCI: imx6: fix resource leaks in probe error paths
Date: Thu,  3 Sep 2026 00:43:13 +0800
Message-ID: <20260902164313.2901302-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094335_450617_1C942BD1 
X-CRM114-Status: GOOD (  17.52  )
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

imx_pcie_probe() leaks both pwrctrl devices and power domains on failure:

- imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
  and adds device links to them, but nothing detaches the domains on
  probe failure or deferral, so they leak.

- A failure of devm_pm_runtime_set_active_enabled() returns directly
  without destroying the pwrctrl devices.

- A partial failure inside imx_pcie_attach_pd() leaks the power domains
  that were already attached.

Add imx_pcie_detach_pd() to detach the power domains in reverse order of
acquisition and register it with devm_add_action_or_reset() so the power
domains are released automatically on probe failure.  Add
DL_FLAG_AUTOREMOVE_CONSUMER to the device links so the driver core
removes them automatically when probe fails, instead of tracking and
deleting them manually.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Fixes: 2c5768344f88 ("PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()")
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
Changes in v5:
- Register imx_pcie_detach_pd() with devm_add_action_or_reset() instead
  of calling it manually on the error paths

Changes in v4:
- Use DL_FLAG_AUTOREMOVE_CONSUMER so the driver core removes the device
  links automatically, instead of tracking and deleting them manually
- Add a Fixes tag

 drivers/pci/controller/dwc/pci-imx6.c | 41 ++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b98d..ec8339e03d58 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -639,6 +639,23 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
 }
 #endif
 
+static void imx_pcie_detach_pd(struct imx_pcie *imx_pcie)
+{
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie_phy)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie_phy, true);
+		imx_pcie->pd_pcie_phy = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie, true);
+		imx_pcie->pd_pcie = NULL;
+	}
+}
+
+static void imx_pcie_detach_pd_action(void *data)
+{
+	imx_pcie_detach_pd(data);
+}
+
 static int imx_pcie_attach_pd(struct device *dev)
 {
 	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
@@ -655,24 +672,30 @@ static int imx_pcie_attach_pd(struct device *dev)
 	if (!imx_pcie->pd_pcie)
 		return 0;
 	link = device_link_add(dev, imx_pcie->pd_pcie,
-			DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
+			DL_FLAG_RPM_ACTIVE |
+			DL_FLAG_AUTOREMOVE_CONSUMER);
 	if (!link) {
 		dev_err(dev, "Failed to add device_link to pcie pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
 
 	imx_pcie->pd_pcie_phy = dev_pm_domain_attach_by_name(dev, "pcie_phy");
-	if (IS_ERR(imx_pcie->pd_pcie_phy))
-		return PTR_ERR(imx_pcie->pd_pcie_phy);
+	if (IS_ERR(imx_pcie->pd_pcie_phy)) {
+		int ret = PTR_ERR(imx_pcie->pd_pcie_phy);
+
+		imx_pcie_detach_pd(imx_pcie);
+		return ret;
+	}
 
 	link = device_link_add(dev, imx_pcie->pd_pcie_phy,
-			DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
+			DL_FLAG_RPM_ACTIVE |
+			DL_FLAG_AUTOREMOVE_CONSUMER);
 	if (!link) {
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
 
@@ -1955,6 +1978,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, imx_pcie_detach_pd_action, imx_pcie);
+	if (ret)
+		return ret;
+
 	ret = pci_pwrctrl_create_devices(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
@@ -1975,7 +2002,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))

