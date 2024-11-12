Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C555CD41D61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y8kAf48zRXdfXrL1ttqlddkxo+AVK3OCruhgpqEThVE=; b=iR+ecLlg4tI57cgh6HNOBCPi2H
	Z0P7UCjIrWYk3bupWzdufAU7Tw4+AZeXpm3dIOsWeiZnjQK7dVPGXbICVEIb6RxbTlQv5GG++Juo4
	+bndLbXn2WRNDEgS/3aNj3ldaYXJ8B8Y/gdqQOUNzkJK7BYMJmU49Y8jj8UdEko3r1wwT2Gkc0gcF
	u3JxH5yjCELRGifWNOygLAb8RBzy4AuC8DXdt4gxK8KJHsnV/vUiH1TQgrCKT/WqBrSow3IDP1Sm7
	PGVYsri9AM6NT/Wn+sZ4VYPdxUohh8gzxqL3oFLpx864R4E+D1ZvNkmunmLFyIHF8h3e8MpKUxqeB
	mpFnOB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlOC-00000002Tab-2NJF;
	Tue, 12 Nov 2024 07:32:40 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlLu-00000002TLd-1ENn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:30:19 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABGF69W010324;
	Mon, 11 Nov 2024 23:27:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=Y8kAf48zRXdfXrL1ttqlddk
	xo+AVK3OCruhgpqEThVE=; b=kMdxqteFfic58zq2IstKvz/nXzkH508W+Fjj7Hb
	pihb47+yOF2QfjxO3i0lD/riUyiMVibA1WWBEgIGho06qc+sU4+/yMIL5r+4k5Ly
	8e2NRhSo56mh/dpyaluwk3Je29EIyUCpHhlFgggkpwHimVFZvUKuuCoSad9TnUb+
	DF6jsDZ6pWEYfQoz37VeSxMvmJDNkCJPHjdJkhckqAvjKRf9ZOZ+k1PB4/nxL48N
	IQ7VDw0QXRi58YRbsXDOVE9PhmTysvuPVljkrt4DRNyYIn1ug8zri24qa25LdvD5
	U0u7jYX27rhGuf1AniH9PMA7o9ortVgIBWUGHqNqwVfL1CA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 42un9d1dch-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 23:27:18 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 23:27:07 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 23:27:07 -0800
Received: from localhost.localdomain (unknown [10.111.135.16])
	by maili.marvell.com (Postfix) with ESMTP id E683F3F7086;
	Mon, 11 Nov 2024 23:27:06 -0800 (PST)
From: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
To: <thomas.petazzoni@bootlin.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <salee@marvell.com>, <dingwei@marvell.com>,
        Jenishkumar Maheshbhai Patel
	<jpatel2@marvell.com>
Subject: [PATCH 1/1] dt-bindings: pci: change reset to reset controller phandle
Date: Mon, 11 Nov 2024 23:27:04 -0800
Message-ID: <20241112072704.767569-1-jpatel2@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sne3GhOwqsbcT6kiprYrVMuiTvo7aQvd
X-Proofpoint-ORIG-GUID: sne3GhOwqsbcT6kiprYrVMuiTvo7aQvd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_233018_486932_11FDEB1A 
X-CRM114-Status: GOOD (  10.49  )
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

replace reset bit mask and system controller
with reset controller and reset bit phandle

Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
---
 Documentation/devicetree/bindings/pci/pci-armada8k.txt | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/pci-armada8k.txt b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
index a177b971a9a0..a9a71d77b261 100644
--- a/Documentation/devicetree/bindings/pci/pci-armada8k.txt
+++ b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
@@ -24,10 +24,9 @@ Optional properties:
 - phy-names: names of the PHYs corresponding to the number of lanes.
 	Must be "cp0-pcie0-x4-lane0-phy", "cp0-pcie0-x4-lane1-phy" for
 	2 PHYs.
-- marvell,system-controller: address of system controller needed
-	in order to reset MAC used by link-down handle
-- marvell,mac-reset-bit-mask: MAC reset bit of system controller
-	needed in order to reset MAC used by link-down handle
+- resets: phandle reset controller with int reset controller bit.
+	  needed in order to reset MAC used by link-down handle.
+
 
 Example:
 
@@ -49,6 +48,5 @@ Example:
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		num-lanes = <1>;
 		clocks = <&cpm_syscon0 1 13>;
-		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
-		marvell,mac-reset-bit-mask = <CP11X_PCIEx_MAC_RESET_BIT_MASK(1)>;
+		resets = <&CP11X_LABEL(pcie_mac_reset) CP11X_PCIEx_MAC_RESET_BIT(0)>;
 	};
-- 
2.25.1


