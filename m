Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8443E6816B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMBPdn2LsAmivgwpb9UlFxbQ9zyThXTU/1K9VkXS3k0=; b=ydwpcr04gCFlbxttjR0pUyTHbQ
	3+PuKOZ/OBTK6tMPhJoQxrIB973vmSW/LG38msrzCENQ/3dwTvjc3CQukOdgnLUVFNgSyxjb2U58L
	0k0llqGDuL7fSjKh52I9HNODpOPuUJakmDwSBGKVwffHtS43esM9Bq6MAT5CZJ3R2DOIcxZe1fb8L
	rhEDylHQvyvJ6GXIY2uqWA4/GcdR97+ZSi+bzcgLjQleeIVIEebGHoyjfdqRdFn/DwqRb0Cfoacqb
	XhkVpMcvurluIYEI7JW7Ejik6aaXhpwEtWjZzWegRSEnL1456qHrKGQUgOEKVU3AIyHjflYXA9kkP
	G+IevWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ7F-000000086O0-0Mpu;
	Tue, 17 Feb 2026 11:19:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ7B-000000086LK-3xYn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:19:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB40qQ1943469
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMBPdn2LsAmivgwpb9UlFxbQ9zyThXTU/1K9VkXS3k0=; b=UsNyqI0Pm/RmWoKl
	ymA2wqIzXteu5X5pBcvJ6asNk1aNLXpsaFUORhO3J/G24jq7mbr7a8smaMha9G3+
	LaBYZlcaXmO/UtpQ7ZlD+48WYGsmSUS6MlVLZV+Uff1Uo89y4/mqxccHU8jwYZLt
	3nW+V6heBwywIxUGP/zKp/TAfkoiBW6yDjjG2MoHCi3mJJdzjTLctRzkfl47WsJ5
	n7rUHjnIEIKzriLWiCYYQ1JMK5UZma7bHyKlq20eiI0nG+J1L0wj2hrCG1GQaCtP
	KltZ6j0esTAhfMDt8hwm7mFOBrbDVX35HC820e4+l2dVh3hjUEWMIR7sVQMak2U8
	ce/Udw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g01g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630753cc38so17018748a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327176; x=1771931976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMBPdn2LsAmivgwpb9UlFxbQ9zyThXTU/1K9VkXS3k0=;
        b=VyjQzKjYvv1BddUA9cUj9X1ArCpK67GpFrWVsIAsdffVX50kNQFtcuvzTZkN4hrp7Y
         3aociDeuE3FQytNzbGtOY7dMyVcKxDaY1a2JP3BIH47I3KUhWcbWdn4qsg51wA6WL7A+
         7QkMyp4Mj4yIu77DjcbFj2iwf7EuNwDVp99S83xSZN6I5ZkLWJiUq3btFTcdbIkgn9Fe
         FpyWmelPwlLuuwG1XvCMTr7hCp/le6ZVLXY3RbLL93uV24rjAsh+/4pAt+ksSSXYsSFZ
         ESF70tfjddaD3VYBRDTYitTPiKYy3rHoja/3S0e7/XDh/od0O6EbRkvywY50vfzq3VYq
         yQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327176; x=1771931976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMBPdn2LsAmivgwpb9UlFxbQ9zyThXTU/1K9VkXS3k0=;
        b=kVSqV5CPQcxkE1bQPw+lCaWc9R+AA/4eip5fxCTlGhm0000Yn4wc9jplld7+fQ3/jL
         fxBVmGZ15rebGg/g0bCPvWg9tUdcf/CytLyKKyLZmaFlNi22fe6tK5vjF1ha+swcTPui
         6uqmn8tyvFh1ETg1iYEud85Pk9EzokHP94H3EfRvfxVczxmImh4JYecZOZNaYPcVWh4C
         s5Yn3oVqIb/zFxsQTUkJYBjHY+uf77WCg/CgKCVQ+l5DwQN0fY2RxrTHPaYzqLMkUffh
         I5do1nsp+chdXt2vZuob2kSbEDlrbNd2eKoLHl7UAmz1gDc1fgo1768P3Cl7A5UPwnFh
         vfuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNETZyc4rEgTfWlm9kQM2eT46B9fdiH2WEArs9b7P2lpcZYXJBXm3dSE9YVXFbx0RNER8T2PHQbjPtyrpe4AED@lists.infradead.org
X-Gm-Message-State: AOJu0YwuDaEYXiLKSy/jTPnk3heNf3rSgOtlqluwP/t7pk202J/gKYic
	Q9BYePRrXV/7HR6Dca8vfUgbPnMgsWDjgcK6TwyqP4PlXzEPbdiywoZuSYAs2IaXedWD158C/tx
	we0BE4MHi8CH8FMVJFsOD/yCL9VFYEmoVCX8HzgSWaUY3ui6aBpqA6bHXkbPtxAhXwqwJSEPSru
	v6kg==
X-Gm-Gg: AZuq6aK7IguwD9WySF917JNwSPnFAgXZJq7etj825RIce7xj6rGy7MDCVAVehdakUMu
	vBpA5Yx7CDj57FT0v4AKczUcA5mcOMwcNQyz1tZq505b57n0+sxJ190lNocbWezCPfPjoKzq9ON
	xpN4UbdfhpVXbuBcBu2mb01X1R0bPpeTH8iMAfP2560hbGCOQED6jsDnTEW+6q+SvnGUeTj3Kuh
	t+ntvOYmux1aWc6Vv0xpO297FAwLRUMuN28DHY2Op4Lv7prlqKkvugvZbyd34MxdfZqRHcvbyUT
	QMhb/qg3K2iqAxR1gdy8kADiFJZQGVmIiK2AMgIuGeow8iWNppejV2ON3KgXnXshRplHDme91n8
	meZK1cvVD9wcReOvpDyntBN7/ECl6P0meOv1m5lDdygeEpvOGqXWJYthl
X-Received: by 2002:a05:6a00:2d28:b0:824:374a:13f7 with SMTP id d2e1a72fcca58-824c613370cmr13273742b3a.55.1771327175583;
        Tue, 17 Feb 2026 03:19:35 -0800 (PST)
X-Received: by 2002:a05:6a00:2d28:b0:824:374a:13f7 with SMTP id d2e1a72fcca58-824c613370cmr13273711b3a.55.1771327175048;
        Tue, 17 Feb 2026 03:19:35 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:34 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:49:10 +0530
Subject: [PATCH v2 5/5] PCI: qcom: Add D3cold support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
In-Reply-To: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=6515;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=IAVEMPt0tOVYVQCFgBm15tr3uSMRBtLlDbxbCnOFZrQ=;
 b=wjF9Ok40l0LOgqKQkkPhl/h8dRDieyHrE+JHl4vXu3qG6H5Qh11tQtZ8Q5SfvNRzzzehxTmMs
 jJvG1KZaYAcBoHrk9mJo/xorBCcy23VvTGS4SE/tE4tf96AU3a1QeZ7
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfXz0gP28dpMWmp
 7LJVDgCPNz+Xaq2t1Dc7Qg1rqpfQEfOITBpc3OtYIOWm4nVGMBwJAUI1rxhFKS+I+Wl7rIKEW/e
 TgVUyQNgnJFgTwiCI1ftaspI2VqacEmu6HbwcwTCexkrpFFmlysCSXLN56NXgmwi73lVIGhL0qs
 b5EAGyM2BBcQaUGUOJ+HKCovkDTlR5/YEQate4x2ciEDBnsl8ngjDQIAhSyubXFgEWbEkjvBVnx
 uP8xN1Sz/bGgJ3HyabDDUir1BPFE16vqnoHWq+u9AOA459JIEQlRs25nsIl3RFj7LiJF0O20zUT
 IX3PvJHxAjVPQvEfEu2fF26DSWjRu3dPPEuhAJPgOgIZECmyfcVqt34J9y6R72/+dZPxMp/B2E+
 a6CCXU1Yd6Hwx9MPOKtGA0uSkZGXefP8bL2lMyqhrPNyZvUxUwN4tydBPwNxes4UPlFO1QLT2G1
 upFUKmUkk4pWlArNMig==
X-Proofpoint-ORIG-GUID: -3AK6CyAEbpdRqzZJu7-dX1PpbuviP4o
X-Proofpoint-GUID: -3AK6CyAEbpdRqzZJu7-dX1PpbuviP4o
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69944ec8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=RN3yzfvplrNe8VIVIhoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_031938_141028_74118CF8 
X-CRM114-Status: GOOD (  27.48  )
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

Add support for transitioning Qcom PCIe controllers into D3cold by
integrating with the DWC core suspend/resume helpers.

Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
into the DWC host operations so the controller follows the standard
PME_TurnOff-based power-down sequence before entering D3cold.

When the link is suspended into D3cold, fully tear down interconnect
bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
by keeping the required interconnect and OPP votes.

Drop the qcom_pcie::suspended flag and rely on the existing
dw_pcie::suspended state, which now drives both the power-management
flow and the interconnect/OPP handling.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
 1 file changed, 74 insertions(+), 47 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b02c19bbdf2ea5db252c2a0281a569bb3a0cc497..37442bbe588c36b0b0414cc4d0016da2d8424a87 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -145,6 +145,7 @@
 
 /* ELBI_SYS_CTRL register fields */
 #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
+#define ELBI_SYS_CTRL_PME_TURNOFF_MSG		BIT(4)
 
 /* AXI_MSTR_RESP_COMP_CTRL0 register fields */
 #define CFG_REMOTE_RD_REQ_BRIDGE_SIZE_2K	0x4
@@ -283,7 +284,6 @@ struct qcom_pcie {
 	const struct qcom_pcie_cfg *cfg;
 	struct dentry *debugfs;
 	struct list_head ports;
-	bool suspended;
 	bool use_pm_opp;
 };
 
@@ -1401,10 +1401,18 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
 		pcie->cfg->ops->host_post_init(pcie);
 }
 
+static void qcom_pcie_host_pme_turn_off(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	writel(ELBI_SYS_CTRL_PME_TURNOFF_MSG, pci->elbi_base + ELBI_SYS_CTRL);
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,
 	.post_init	= qcom_pcie_host_post_init,
+	.pme_turn_off	= qcom_pcie_host_pme_turn_off,
 };
 
 /* Qcom IP rev.: 2.1.0	Synopsys IP rev.: 4.01a */
@@ -2069,53 +2077,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	/*
-	 * Set minimum bandwidth required to keep data path functional during
-	 * suspend.
-	 */
-	if (pcie->icc_mem) {
-		ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
-		if (ret) {
-			dev_err(dev,
-				"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
-				ret);
-			return ret;
-		}
-	}
+	ret = dw_pcie_suspend_noirq(pcie->pci);
+	if (ret)
+		return ret;
 
-	/*
-	 * Turn OFF the resources only for controllers without active PCIe
-	 * devices. For controllers with active devices, the resources are kept
-	 * ON and the link is expected to be in L0/L1 (sub)states.
-	 *
-	 * Turning OFF the resources for controllers with active PCIe devices
-	 * will trigger access violation during the end of the suspend cycle,
-	 * as kernel tries to access the PCIe devices config space for masking
-	 * MSIs.
-	 *
-	 * Also, it is not desirable to put the link into L2/L3 state as that
-	 * implies VDD supply will be removed and the devices may go into
-	 * powerdown state. This will affect the lifetime of the storage devices
-	 * like NVMe.
-	 */
-	if (!dw_pcie_link_up(pcie->pci)) {
-		qcom_pcie_host_deinit(&pcie->pci->pp);
-		pcie->suspended = true;
-	}
+	if (pcie->pci->suspended) {
+		ret = icc_disable(pcie->icc_mem);
+		if (ret)
+			dev_err(dev, "Failed to disable PCIe-MEM interconnect path: %d\n", ret);
 
-	/*
-	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
-	 * Because on some platforms, DBI access can happen very late during the
-	 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
-	 * error.
-	 */
-	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
 		ret = icc_disable(pcie->icc_cpu);
 		if (ret)
 			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
 
 		if (pcie->use_pm_opp)
 			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+	} else {
+		/*
+		 * Set minimum bandwidth required to keep data path functional during
+		 * suspend.
+		 */
+		if (pcie->icc_mem) {
+			ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
+			if (ret) {
+				dev_err(dev,
+					"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
+					ret);
+				return ret;
+			}
+		}
+
+		/*
+		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
+		 * Because on some platforms, DBI access can happen very late during the
+		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
+		 * error.
+		 */
+		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+			ret = icc_disable(pcie->icc_cpu);
+			if (ret)
+				dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n",
+					ret);
+
+			if (pcie->use_pm_opp)
+				dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+		}
 	}
 	return ret;
 }
@@ -2129,25 +2135,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+	if (pcie->pci->suspended) {
 		ret = icc_enable(pcie->icc_cpu);
 		if (ret) {
 			dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n", ret);
 			return ret;
 		}
-	}
 
-	if (pcie->suspended) {
-		ret = qcom_pcie_host_init(&pcie->pci->pp);
-		if (ret)
-			return ret;
+		ret = icc_enable(pcie->icc_mem);
+		if (ret) {
+			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
+			goto disable_icc_cpu;
+		}
 
-		pcie->suspended = false;
+		/*
+		 * Ignore -ETIMEDOUT here since it is expected when no endpoint is
+		 * connected to the PCIe link.
+		 */
+		ret = dw_pcie_resume_noirq(pcie->pci);
+		if (ret && (ret != -ETIMEDOUT))
+			goto disable_icc_mem;
+	} else {
+		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+			ret = icc_enable(pcie->icc_cpu);
+			if (ret) {
+				dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n",
+					ret);
+				return ret;
+			}
+		}
 	}
 
 	qcom_pcie_icc_opp_update(pcie);
 
 	return 0;
+disable_icc_mem:
+	icc_disable(pcie->icc_mem);
+disable_icc_cpu:
+	icc_disable(pcie->icc_cpu);
+
+	return ret;
 }
 
 static const struct of_device_id qcom_pcie_match[] = {

-- 
2.34.1


