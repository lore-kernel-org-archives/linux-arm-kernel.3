Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784B8D41D61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3hHOU+xmmNy0cjln+gRm3o5Z09CstCUYxpA5W75tJb4=; b=aSNBBtgzlVW+4VTkF/nlpBiCG4
	RFgA0U/P+4LKOb4dWi4I+TF4oWDf1ekIx2LB7FstbLpHdGxuqXRCNCaDrDleD6Ct6MQUal8uTG0pG
	/AgNvmxXN8U8bkB2UAnWjQ4rXKheic+IKfl/OwuTq/vDi7D7OmNAVNJJJqb6JEIgkagKT7y8RELWu
	mkEUk7Am9y779poLMnK1lnePfNbgY0Cua4h55Q/m9bzZQy66ivJXIdrPnvFdhtQNThR1QLo5cVpuV
	5RHJLh3XHbyPw6HpiximZnPMg2NlSIgFgxCwtYXlDUOgz7CHxkUFiOpRmCoikpvtYFHjax6Tuhcjc
	a0cf6JrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkvo-00000002Oyu-1GgI;
	Tue, 12 Nov 2024 07:03:20 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAksN-00000002OMy-2sRR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 06:59:48 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2V0tI026802;
	Mon, 11 Nov 2024 22:52:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=3hHOU+xmmNy0cjln+gRm3o5
	Z09CstCUYxpA5W75tJb4=; b=AvHBHolHeIZXBXzAZYxQxuqUy/Efbzo45j8zway
	3uL9bZnDXcjwoS37i3V8AV5CYgZu5kG/Lb9sqqQ29E/58P8JygY55kIR+IVqJSiH
	v9An1g2tgAtml+DgKF4L+Rn2oqiC6CFsFL5L7dzyfwsz2qszAlD8v1mBru91eoic
	hDHQpvl1sXzhjLxyqCVu8xYnGcYs8fBPHY420xbXRihOtUPWjYnyukVRgf6X9IZm
	urjTNfYzulOrioRwijeyiLoemmIL1nMZ8zFipx2ZTAChTUk/vGvN092iJbJ+Tp/8
	+UcuuHVeU8DeEkV9HNZlwMtgxnX/gSpSVGnUIHGJRxq5DYg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42uxa40bnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 22:52:34 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 22:52:32 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 22:52:32 -0800
Received: from localhost.localdomain (unknown [10.111.135.16])
	by maili.marvell.com (Postfix) with ESMTP id C385A3F707E;
	Mon, 11 Nov 2024 22:52:31 -0800 (PST)
From: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
To: <lpieralisi@kernel.org>, <thomas.petazzoni@bootlin.com>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <salee@marvell.com>, <dingwei@marvell.com>,
        Jenishkumar Maheshbhai Patel
	<jpatel2@marvell.com>
Subject: [PATCH 1/1] dt-bindings: pci: armada: add system controller and MAC reset bit
Date: Mon, 11 Nov 2024 22:52:29 -0800
Message-ID: <20241112065229.753466-1-jpatel2@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: j28e8jnXFbR5Ng1p4bFkYk-VW7Y62nLd
X-Proofpoint-ORIG-GUID: j28e8jnXFbR5Ng1p4bFkYk-VW7Y62nLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_225947_754279_24C8925E 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Adding Armada 7K/8K controller bindings optional system-controller
and mac-reset-bit-mask needed for linkdown procedure.

Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
---
 Documentation/devicetree/bindings/pci/pci-armada8k.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/pci-armada8k.txt b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
index ff25a134befa..a177b971a9a0 100644
--- a/Documentation/devicetree/bindings/pci/pci-armada8k.txt
+++ b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
@@ -24,6 +24,10 @@ Optional properties:
 - phy-names: names of the PHYs corresponding to the number of lanes.
 	Must be "cp0-pcie0-x4-lane0-phy", "cp0-pcie0-x4-lane1-phy" for
 	2 PHYs.
+- marvell,system-controller: address of system controller needed
+	in order to reset MAC used by link-down handle
+- marvell,mac-reset-bit-mask: MAC reset bit of system controller
+	needed in order to reset MAC used by link-down handle
 
 Example:
 
@@ -45,4 +49,6 @@ Example:
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		num-lanes = <1>;
 		clocks = <&cpm_syscon0 1 13>;
+		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
+		marvell,mac-reset-bit-mask = <CP11X_PCIEx_MAC_RESET_BIT_MASK(1)>;
 	};
-- 
2.25.1


