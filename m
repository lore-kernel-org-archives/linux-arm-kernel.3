Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7474FC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 01:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gJTfLnp0J7T2ypG1rf2UnD2iP61DjaHR8pWm0DBXUoM=; b=1YY+OXyQ/p7mKxRVjChrIc2YyA
	yFPcxN4jnHpAGn+4Gr4CaJkM2T5cRNpcOlZnIJWMk9WKa2QtzHPFFLZVHxpnkw9vY3zX0n/WNSy8D
	V9pZq/9FFPcRXUQycbbLOSXiYJ5TsOMtLUj9Zh2NxKf5SLve/yNZ/e+bBJAIqRO75hVU2pB3nJlzq
	nWTWjTfONzEVL1rKTFdcAyrkYw/2wdSPiiQSsdeYeSPeCQkFHjQ+ccsG+Nh7hjAQgXMFD11SHWG0N
	0xryFv2NA9zgIYFDfRSxo+jnBI0XBg9VN+QQYeBlYONj2kpCAEgNumChULwKW/2yG5WPl78Ne9KqL
	IVShQ7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxwkW-0000000ExXo-0ags;
	Sun, 23 Aug 2026 01:11:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxwkT-0000000ExXI-2zT7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 01:11:46 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8485ef63b68so1712373b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787447504; x=1788052304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gJTfLnp0J7T2ypG1rf2UnD2iP61DjaHR8pWm0DBXUoM=;
        b=N8JLWcT3h7VME9l4EVIM+Qg/9JdTtFqru3hbU6fdzG8BkEHLohqsl80xPr7i7mb00x
         GEr1M3ucdgqFcxvmPSNGk705TMrLPLJU6z3Jt6NLhb77D/PPrell0Z8HjPljf65SAY2q
         SVQCTJ4gKq79Te3E4AieIyxzLywwOoNlLV043j7ZgV5gv++vVJGwwSRciQTrSEFnZWu/
         kZA3Ko60N3aFfvBMyj5VqqF0+/CHURP8X5z0l/DgcfL2n6ij8i/eChWIDFqZaxq0FeMx
         mqMNPNAvLWlWneF5W8FlpWM4pEsbQsCt2ug2EZzkJAdTDRvg9HNkIgigsVs5L+I3VTqZ
         4FzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787447504; x=1788052304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJTfLnp0J7T2ypG1rf2UnD2iP61DjaHR8pWm0DBXUoM=;
        b=isb3kx0qV+sYB9Qo1tlULnDADyeAuKf+7f6vLvCbW8Ap9wD8hLv/oAzrsVCbqOD+bm
         DJwbV4ysFIEGqpLr/ETDTedUpClEMeGtwmPy2l4JLeg19cJDRjaiWKK8TN3zybsljoNt
         WsVS0AS4gdCWBmWdiDbK/T5Orbjtvg1LWYz3u2I3BfEyXtZjsIeUa8oxqt0oTSBxitg7
         kFeop6ASpsfbSU5AyakPHe60UB0RleWENEwyS9o3V32XzBj1s1PB2/5nXGn2S/M8aQMs
         E4PiT5ygYpezv1GYldCBKCgQIyELZAYI8hajnDQ3tcxKTi16oELvZxjdMiqFQsHjMrL6
         tHJg==
X-Forwarded-Encrypted: i=1; AHgh+RrH5CE2taSK0ld0YZcthetyhSbTGbFoGYEKmTc0ruGzr6Z8c2wQJpB475NsUUuNIB2tO9UdiJO8h9e20Ea4kN0K@lists.infradead.org
X-Gm-Message-State: AFuF++k4WtROm/gWEPx4iSQTONTQGBIOYtwso54leXB8fwU2v1vI+nhD
	4toiDJIhBkrwnhsner2zjXUzqizhpZh4Ks/omPT3ev+9HG2OYejTWKmC
X-Gm-Gg: AR+sD12iVn4WagZqRPn81+whV5y14Vjmyo5L8Ont049nVkaFAhVTEOdmRedV2Qh84Cm
	ltnHgKvB+kfRpuw/muOD3fhyM/PrBBrqL10COdpMGGaNOjr3qUUcYb8tr5otqijqXPWIovBB2Xo
	SkBW58whMeQMdPKXf5lii6ocOEsXF3oaAFjBE94Kd1liLR9aeV7PPCYjjeL/9g6wEGBOExfVY3k
	osybPKBX1hDD4BwNY1fphTFFAtZTsSTnlVPgB6gLziwy4nWo8F5vUJNPTRgGGz5lCFuTUcTnqq9
	I3agck37wsNO5pqKwdzWPR6xFWL9LjtjdsvMOCuxN8bUXHEQD2BXdvLwZA9sDvFF45k21nSGauG
	2Rsr4H9gkolKe1SrGpik/lf4inIEyhrZphv6rd+crIJj/I4dzaUIzIsBVNTGQ7rvUkquc0YuFr3
	HdnBd+Kwhie4dzgOwx/dOcCRIUNUItY096QCzpY9BoHZvLsv4UdQpJOxxlLoGLs617X7gf4Nhbg
	L2lnTtZJ6+wtyOWXv/yAyI9XOlWgctpOiHcVFfrLbYgiAhDHnc0
X-Received: by 2002:a17:90b:558b:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-395c33371a9mr31055560a91.2.1787447504358;
        Sat, 22 Aug 2026 18:11:44 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49b406bsm4272706a91.8.2026.08.22.18.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 18:11:44 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH] PCI: imx6: fix power domain leak on probe failure
Date: Sun, 23 Aug 2026 09:11:25 +0800
Message-ID: <20260823011125.2876504-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_181145_758331_47D5BC67 
X-CRM114-Status: GOOD (  16.63  )
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

imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
and creates device links to them, but nothing detaches them when
imx_pcie_probe() subsequently fails or defers.  This leaks the power
domains and device links on every probe failure or deferral.

Save the device links and add imx_pcie_detach_pd() to release them,
calling it from the probe error paths.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..4df548679 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -182,6 +182,9 @@ struct imx_pcie {
 	struct device		*pd_pcie;
 	/* power domain for pcie phy */
 	struct device		*pd_pcie_phy;
+	/* device links for the power domains */
+	struct device_link	*pd_link;
+	struct device_link	*pd_phy_link;
 	struct phy		*phy;
 	const struct imx_pcie_drvdata *drvdata;
 
@@ -662,6 +665,7 @@ static int imx_pcie_attach_pd(struct device *dev)
 		dev_err(dev, "Failed to add device_link to pcie pd\n");
 		return -EINVAL;
 	}
+	imx_pcie->pd_link = link;
 
 	imx_pcie->pd_pcie_phy = dev_pm_domain_attach_by_name(dev, "pcie_phy");
 	if (IS_ERR(imx_pcie->pd_pcie_phy))
@@ -675,10 +679,24 @@ static int imx_pcie_attach_pd(struct device *dev)
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
 		return -EINVAL;
 	}
+	imx_pcie->pd_phy_link = link;
 
 	return 0;
 }
 
+static void imx_pcie_detach_pd(struct imx_pcie *imx_pcie)
+{
+	if (imx_pcie->pd_link)
+		device_link_del(imx_pcie->pd_link);
+	if (imx_pcie->pd_pcie)
+		dev_pm_domain_detach(imx_pcie->pd_pcie, true);
+
+	if (imx_pcie->pd_phy_link)
+		device_link_del(imx_pcie->pd_phy_link);
+	if (imx_pcie->pd_pcie_phy)
+		dev_pm_domain_detach(imx_pcie->pd_pcie_phy, true);
+}
+
 static int imx6q_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
 {
 	if (enable)
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
@@ -1999,6 +2019,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 err_pwrctrl_destroy:
+	imx_pcie_detach_pd(imx_pcie);
 	if (ret != -EPROBE_DEFER)
 		pci_pwrctrl_destroy_devices(dev);
 	return ret;
-- 
2.43.0


