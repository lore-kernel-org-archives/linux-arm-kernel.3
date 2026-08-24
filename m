Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A6DC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GcEy1N5KBTqN53ZVbLUCAVWGTJK3E+IlMVbr5qPIo6k=; b=XmLDo7W6bani1qV3DzBjSui2Ih
	ISPS3kg/5ah/PmivODy6JBmM5HCi9rEDDBG6xG4o5J1O0YlSCnwIAIgMMpUyk0p8SHSG/RZdASqwI
	RxNc6ASl9mD5D0LjytU1sE8W50IyYOLs54JD/g67e3MsENjZ3rZuYlzXOyV2AbJ1Cq66hvceJ5ylI
	5h9AdlYgAFfXipLZcp3jtCOy/TwGMAfiQqPATKMW4pP79V6NAOjgT3Ge7BcxSuyo4n51AitURxB1N
	ltvm9EN5k7+nhSuVT5+MqrqSv7Jiuqa8et0yQjsClpQ1l8QTWhto/qYcws58VHAhMCVIzfwyyWjG2
	wt+93R8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWEg-0000000GrPx-3mqu;
	Mon, 24 Aug 2026 15:05:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWEd-0000000GrOY-2fAj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:05:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so2563196a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583914; x=1788188714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcEy1N5KBTqN53ZVbLUCAVWGTJK3E+IlMVbr5qPIo6k=;
        b=e8Hhut6U+nC6h8vg1iFJaTwhTmjU3jxHi7oxAp5ysUyJjSXcR0xUO07kJu+uJNKdTN
         ZhjzmfItPMzwbV7TcsPyeEBwO3olSHKo6SKb3eq3l6tU8BXTziQQ6O2G3rZ91Ba/IV68
         X0VgORW0jW7YLUMlGMIfiVQbvpNWvux2hlm+7vAVImDAIQX5swfQNB4LWgkpcVvhRF5j
         rPGVD3SzDHCK+Y8zK/wA/DutpDFAEIpxVCokjqipe0TxDuZ6FDDXjSq6AwIC8D1J7ttf
         Tfzq5ybhcodMNQKCXiuiY58nt7UOqFupAJlLL6GdKASBBWcBibMwHvRqJdn+W40RRTjC
         ibtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583914; x=1788188714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcEy1N5KBTqN53ZVbLUCAVWGTJK3E+IlMVbr5qPIo6k=;
        b=ctrv5qSEFhykeMANlpXsEXB2gfxnvL5gFbg4YIokSBqpPabzUoXNAvp9hGlqOQqeFw
         GZbU9E0RohJHI/HS+Nl37GCcsW3metcyFxR1AN3a+THCzMUkJ3w81YtHzObx2PPW6g5q
         rfHIdMYvch04O/rIBKvF5davFPY8yG6Ccz1cIuUwGTcEfi0+ZYeYS9eEG+vAAswkOUWp
         CZOkeRjM1/5qrR94B/0GEOlHsr/mEtv4o0oaWptk2irdNXRNIG376Fmrs/Xaf+nw0Z96
         B2EhjOjQkNWUpyAEJBuSWkJtAS3IIxO2p3gEft0mBp1JID9B5aAZoVzCAWKIcwVi5Nzo
         itAA==
X-Forwarded-Encrypted: i=1; AHgh+RobB18jy9Quhhf8iMJ4nMAemkaAP4mqAZ2XbCKGJv7Kyc5H7TPqX37Q0yqUEaYM3CdBqRrkHhXzqzR/lGq/Bx3f@lists.infradead.org
X-Gm-Message-State: AFuF++l+0/1EAM4flde2aKbvKPPNshx/jDzuNGwPyB6Mv8inppkDOJvp
	BnVxTtsOvKXeAO+4vpPQo8u1oLP/L4MKNwnJDqjJh3UzmZ+sYSADesdY
X-Gm-Gg: AR+sD11Xh7EPh7yKYh6muwmhaSi9uzym78KfJyW5702ZARCotx2rrZI4EDBh8za6ps2
	NeBWK2koNaJLT5996Hrr3mURUyOyIuCrLW/FAyEEarIiRWF+oYBvXVY+rYbECnHl/EPKfir2+Jb
	gO0YrBq4ShQ1I4f03YUxrUfuQbfOhP11vCrv2nBNb6q0ECcssSDJIbCh+KWYU0Szsw4ZC28Y9zp
	3rcb9D2PbXFo3y+TVP9bYoDf4qEHK5amnJWEBu6G/OUuKK8tZMZM8rJNGItQpA+ifBUbrm9o6Qf
	HSPoyithvJWxSvdv1nDWp094vrGhl+SiCa8kuyjeF22hH/429eDe1LjuxzjSXlG8yBiYJ5P5Ge5
	kFzTD4rbXQfdW/+zb3AlX58TS/1TGRUtDkcLDc9c4QCZOoV6a1VnOI2uCCXt7G/mIgAcqqEl0qa
	Tz4UZQ1XWQPApaxEcX+/pl9VhMYplTXIfVEQQnl6exB8FwGfMDnxNXsYjMriEbeWGPC41qXzD/A
	llFObj6LZjm5fLoAylC68R60fsM6w3m6V2M0I0xw9FDoaEVefptLJqKNoVCiL4=
X-Received: by 2002:a17:90b:33c2:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395c3597c56mr45416894a91.5.1787583914094;
        Mon, 24 Aug 2026 08:05:14 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af75acsm10232694a91.12.2026.08.24.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:05:13 -0700 (PDT)
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
	Zhijian Han <hanzhijian1991@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH v4] PCI: imx6: fix resource leaks in probe error paths
Date: Mon, 24 Aug 2026 23:04:54 +0800
Message-ID: <20260824150454.3511203-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_080516_409265_2B4C1A62 
X-CRM114-Status: GOOD (  18.03  )
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
acquisition and call it from the probe error paths.  Add
DL_FLAG_AUTOREMOVE_CONSUMER to the device links so the driver core
removes them automatically when probe fails, instead of tracking and
deleting them manually.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Fixes: 2c5768344f88 ("PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()")
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
Changes in v4:
- Use DL_FLAG_AUTOREMOVE_CONSUMER so the driver core removes the device
  links automatically, instead of tracking and deleting them manually
- Add a Fixes tag

 drivers/pci/controller/dwc/pci-imx6.c | 37 +++++++++++++++++++++------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..0b4209365 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -639,6 +639,18 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
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
 static int imx_pcie_attach_pd(struct device *dev)
 {
 	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
@@ -655,24 +667,30 @@ static int imx_pcie_attach_pd(struct device *dev)
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
 
@@ -1956,8 +1974,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = pci_pwrctrl_create_devices(dev);
-	if (ret)
+	if (ret) {
+		imx_pcie_detach_pd(imx_pcie);
 		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
+	}
 
 	pci->use_parent_dt_ranges = true;
 	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
@@ -1975,7 +1995,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
@@ -2001,6 +2021,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 err_pwrctrl_destroy:
 	if (ret != -EPROBE_DEFER)
 		pci_pwrctrl_destroy_devices(dev);
+	imx_pcie_detach_pd(imx_pcie);
 	return ret;
 }
 
-- 
2.43.0


