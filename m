Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44787D715EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hu27MEk2joWcihG8erKat/1jVTiWwwVOoOBwBr4PT6E=; b=djjTecE8QmB9wYmSIHrr/09cRV
	riEWEPf/fMUPwlK2YoDJFGmqh/6foTCu/q4lFyHwkC0X3GYKsLPBJ6JRThx1TqYrGDGsnYrUtgpeO
	7v54d4ffs0uQqlf+MwunalBwO+Z6nKz2Vgc72c1V/lhqff2cdKvUh1EXVIoXn6C+YiEelm/n23/S9
	/GVctHTBo3o271PYqGTQIZkv75XYWg2NaP4ErAa0PrXETx7DeGUrgxgfwQwGC4si6JKv70Mbz1j89
	eLZQJ/mVUYtBjo6o1O9lCWwjdBxIJyHRzrLWtE+LhrZAO+821m8vpbs13S3gdhp9mhkMJ9coES+RX
	wbjcHjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjgAy-0000000AMUx-2WPT;
	Sat, 24 Jan 2026 16:07:52 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjgAv-0000000AMUb-1vhM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 16:07:50 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5014d4ddb54so37869571cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 08:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769270868; x=1769875668; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hu27MEk2joWcihG8erKat/1jVTiWwwVOoOBwBr4PT6E=;
        b=ixWXXClKbINz1/ZUkCHxDxJVow/B2I8knuzyUgFQJkhlYf37xahHsCY/AnU7PIVP5I
         ErzeRecZg1evZ7TWAZ7xUpU4VRjNYiNcP++DQsm+pTMR9/52Ipuk/SMblAffSOkpqbtT
         aOUJarfPWtt0T0SjeucZWIFzwlm9XEKUynvlgg317uhdYe7C9DN/GkeCJaH/xxzN3Mh0
         mKb66bhaY+gUjo4R8RSthkq+U4LHtGT6trnBiPziUaQtVF3QGxz5ri1YdJvwU5rVl8S2
         /lU4gUlTmy0CYNVF5lXqYfrumukmt/TbMoP95U4LHq3nEY/MgMb8zK+rVFvb0hzjDg9s
         oJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769270868; x=1769875668;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hu27MEk2joWcihG8erKat/1jVTiWwwVOoOBwBr4PT6E=;
        b=BPJzfuDYBoIksF7AZ+QcSAyAGQrsJaXingrDlPulqlBmicgfSmfnaoBKSO645DzzVK
         rjRiZeNKcmMcjMuST2OZjHonrFBqws0vaxK8l3FjQpczBuUFJbRwvwgDnuXls6LU14e3
         KCxE42g0j/xecOlaoKK8uRcv6DFHtvneYyG9Su48jHbeTsaqklrFcCU2AYlZec9RZWau
         5TXCoEPMYdJkh22lAM7Cg5oePbcAYBtf1EDtyJa8U9Jpi9TXqanU8LV+R3L8QAyLeB/S
         5I71VqQJ8ie/wf+kKMUsSLWxhQXOZ2V9jox2PnpREr4guFfXqnAEXkufIgfVGSHc/YMz
         CKzg==
X-Forwarded-Encrypted: i=1; AJvYcCUv2yTecrWwS35Z3eVTmGjS2WT5D5F6aMTWcn8IgOzT2XXoyNmOhWA305pzZyTcscO4LjvZr0NDpbu65xd+HSFN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8P5yO+9PIlJOukWigdzkeQzF3f6p45VzmEFzidCey8SnQz6S6
	yITps1LUh1Pq7AFYMLQqPl6qQk6ErGuhhkPtdr98gFKiWM8L2sEMRJyx
X-Gm-Gg: AZuq6aJtw9qqOBVmfLQoSOXwxX84Z7pL8+652GTnxZVKxGElzouD5yBKWiFCrZVHUBJ
	ZoRstNOA3GrRDFw+p4VKZDvzVmk9BYn9ExXGxOhab59K2JzM4oBeL82UZVPBgIDv8cEynSyq9wa
	wB+nHB09EwyN/ozMVhAEi7Jq3cZpwwB1GWA/Jyq4uSSC6vWLBFc+rE3NdrOXEW4NwdE8z+epLuZ
	FdgLY7TTVM6WigpLer3+QLe+iQntJ+HPGdW3iA0ZQ1PtpovjHFJ5btb1d3Z6qvE6Y1YSvTMg8ek
	lvtKF6pCueJ29n9nbG0Al1crIZWWxybexSPfyxxQmbat+W8qIOa9RbEpv1H4P6krQXhfg+cfKNG
	RG9BCuZEJbxnfivILohm8r3bdUAglJ+fezjO4AxOq/g/Lbo9C9lXzzuW//g==
X-Received: by 2002:a05:6a00:744e:b0:823:3056:c2e6 with SMTP id d2e1a72fcca58-8233056d753mr1391339b3a.67.1769269376898;
        Sat, 24 Jan 2026 07:42:56 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318666c16sm5093118b3a.24.2026.01.24.07.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 07:42:56 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 23:42:45 +0800
Subject: [PATCH v2] PCI: imx6: Fix device node reference leak in
 imx_pcie_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-pci_imx6-v2-1-acb8d5187683@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHTodGkC/23MQQrDIBCF4auEWdeiNtWkq96jhBLUSQZqDFokJ
 Xj32qy7/B+Pb4fkIrkEt2aH6DIlCksNeWrAzOMyOUa2NkguFReyZauhJ/lNMey11bzrtEUD9b5
 Gh7Qd1GOoPVN6h/g55Cx+6x8kCyaYwvaiezRXofh98iO9ziZ4GEopX1OB0H+gAAAA
X-Change-ID: 20260124-pci_imx6-f97d70887dfc
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Trent Piepho <tpiepho@impinj.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769269369; l=1739;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=N8BJ2XoL6RWsSMDXgT3y0d3NEwsWENvOGYzbokKPriQ=;
 b=h6ad2YkaTwuh/K5r3ATTlVSOlDZhd2RIYTIws/ygz/DGkZChc07DnBrwAdCZ7SBoQUMA+VBAI
 YHNWHD+cMCrBBP0h/b47zCHs4WZV2TsrS6/fjuhJKNurMo7ouhPSHlC
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_080749_545038_3C6D075E 
X-CRM114-Status: GOOD (  14.91  )
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

In imx_pcie_probe, np is obtained by of_parse_phandle() and must be
released when it's no longer needed. However, it doesn't release the
reference, which cuases a reference leak.
Fix this by using the __free(device_node) cleanup handler to release the
reference when it goes out of scope.

Fixes: 1df82ec46600 ("PCI: imx: Add workaround for e10728, IMX7d PCIe PLL failure")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Use __free(device_node) clean handler to fix the leak.
- Link to v1: https://lore.kernel.org/r/20260124-pci_imx6-v1-1-6f4379fc5160@gmail.com
---
 drivers/pci/controller/dwc/pci-imx6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 1d8677d7de04..f459d05ecd7d 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1643,7 +1643,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct dw_pcie *pci;
 	struct imx_pcie *imx_pcie;
-	struct device_node *np;
 	struct device_node *node = dev->of_node;
 	int i, ret, domain;
 	u16 val;
@@ -1670,7 +1669,8 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		pci->pp.ops = &imx_pcie_host_dw_pme_ops;
 
 	/* Find the PHY if one is defined, only imx7d uses it */
-	np = of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
+	struct device_node *np __free(device_node) =
+		of_parse_phandle(node, "fsl,imx7d-pcie-phy", 0);
 	if (np) {
 		struct resource res;
 

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260124-pci_imx6-f97d70887dfc

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


