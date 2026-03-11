Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7C21049515
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UWEk66tIWWw7Zu8KKDmTOs/vpX2yaROK7XddUYgkx0=; b=V2IpNaqZUl0pqnWfdENxBvrdO0
	7nm+0Yw501BYOX0sop87Rz6SBscT4BgDnz6X6woGk7aW5qBYkU/JxJRyOaoCvxdA1rB4dHnYTNQYX
	pv+oHa45Kxk2jJwGhuAGzSj2t5AAKNl09l854lTNYCOhCN0ikD1wsOz3YHM9wt88+NqzOKV7TJ2zB
	caiM7Qaoy5J2WVDTgJEByAJoP15+4whoEeCX60S2zcZ8DOu8e0KDxSkLxd5VHBIjWQk7OfpJURCzL
	RUq2XZHfOXfN+p6e9+qWzclCles1sRPFT+Yb7wjbwkSZ+JUZWZ36LSFmavKH58wr1lo8eirP+G5IQ
	hwBz64Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gme-0000000BQUd-3Fxk;
	Wed, 11 Mar 2026 10:27:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gmc-0000000BQSM-3lQo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:27:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5h2E3893006
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0UWEk66tIWWw7Zu8KKDmTOs/vpX2yaROK7XddUYgkx0=; b=j4ydBhnXyrXY+Y95
	L64lGMl5TB39e2h5birvkeaTnWCDQ60AvuTEwNgXlV0KgFocZu75Lpp0vwMnNVxG
	YPlyOdoAgIb4Cox8we9nSty/Ci5O5kaWgHIiNwndKOsS7JDWzheZIedxuFz4yGOE
	wnhoCeOwBAFohovg9Ciy/ib8pVzecKl7HnY1SPUTWy5UpvqS7q7diiiDrmqwgTcG
	wEq46vxWNxk+JB32y9XZY6vlwwGLLemzEyzPNR1RL//ikwp3Rfa5E+Q30dviTl21
	oA+y5WNfaQUHEHnqMhW7QHOb8y9OktNWkc7kzwkhhEbAgcsutNXZssO7z+aXWb16
	NG3Ugw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyvave-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso128530215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224837; x=1773829637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UWEk66tIWWw7Zu8KKDmTOs/vpX2yaROK7XddUYgkx0=;
        b=ASWYxLJIPhX0nQ1s6+JiXLKuwlSaNX1iDnp2ZuZLOEeLB4DFXsyhI192O+uEaNvPUv
         uQodaqCOEG+RrM8CK8IwwJxyWRMcrZaZDUhHvBEn9O1b0fUe6ixkMh62F/3CBu55Fy3X
         8EBUR0K0u5GKG+VJ+5hj3caxzGFaysP7+QiRwpWFtYsvuc7mwGHSboUBx72sLyyQH8/u
         NgzuNUIh8xu/vZxY3aD8vsvweJ6hPTaVlm35cWWtVZgKr4ypi5IFcw5YJR41fUHKU5Vh
         RlEm/0Zgd0L3WaPXd7Uhjvh+bHYmr4PaLIuYbeCj2ZC0nH7BHCdIiwr7PCXXVPu2QE08
         dX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224837; x=1773829637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UWEk66tIWWw7Zu8KKDmTOs/vpX2yaROK7XddUYgkx0=;
        b=rS3+37R2aIPnYjnWPWUVuh28WZVDGS0aeZf4sMpHfmJyyQDowYAPZ98/E1fLGtd7de
         Od8c7OhfU5PaznBCcA6GmCWHxTOrO4yQ7xDoxwD5BPSDQywKmwTkHVol57Y7iWqpHNun
         TTQ1nImHoTG3IBmKKWRf4S/kK5mvawe4GFt54c3gfFVRs+xJ5eXBi9NDuZg+lCMC45Il
         rayBu5MC4xEOCGwPb3GcbcN4yDb/zX/Hn9lRbUBW/ada1/foJr//MsUcvpoEBMa/FZy9
         uiYwu8GgCv3jvyDe0zuvb7fX7M+qbqG/Q2lCa3UiH39e5jzGW2IorMNmRz824nMXjKWq
         1jtw==
X-Forwarded-Encrypted: i=1; AJvYcCUjcQe+VsiICtz0IW4vg4PWXMW8Jj7Qvk7FlIYdvpa1hQinnCpxiJTcr2xVre1A9PpoH3842UHIWam2fAh9pvkQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwdSHdMtpFVzGEiAog8FudVzQTkeOK48bOYjY1iaDeUFt5lauS9
	kH+HPOM0l3alR02WR95itOgFEMcBH/ZBOsIleAGIjCJ7VFKBSWfd53HlCzay9tJgGVkj3BEmKw9
	sLmmFtCf1gpaM4m09YqJhDQNZYO7rJ9ZUEhWrR50XiPOwOUVFIIqhibo+7McVGbgIMPDK2FqM+E
	J8fzTk0lf8Ew==
X-Gm-Gg: ATEYQzyIOc2LseTrwNdAINhp6u2xvwyIR1NQMeMtzrsMZzrpxlPmSTouWEqpKqhX9Vn
	3Gc1FVxwTf+YVdUKat8tIA/KjRrnyDlch97GEy9S1Hd/L2AYdYqyWWQkScZ5PsM4P1Mc65rlmAd
	0kpW8wWtMxtII/PmkdGWNlxXcnlv/V8Ou5WKIOD6AOL3Xi593+dTXY60gh6Rx1gFMtFXgI98nMY
	QH5dFk5peHAjTvB3QdW3jBypb7zw8sebl5IKoeeLBroJOoVItJZelKqFmBybuKNei+2DOdpSF1x
	qAj5w4FvN0ErXuXppInPG4iedFtNwvAeLf5hbf392b/4TasgYfkuyB4P6V6+M4YKmKXRrAwd5SZ
	KsvadTBDVO+AMNQjguKlkk0mAGjro/l3SDIL/XEgraSXCsW/3gNg4mZ6B
X-Received: by 2002:a17:903:a86:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aeae882461mr21337055ad.26.1773224837429;
        Wed, 11 Mar 2026 03:27:17 -0700 (PDT)
X-Received: by 2002:a17:903:a86:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aeae882461mr21336755ad.26.1773224836899;
        Wed, 11 Mar 2026 03:27:16 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:27:16 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:56:50 +0530
Subject: [PATCH v3 5/5] PCI: qcom: Add D3cold support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
In-Reply-To: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=6534;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0v4Fkx+XZDjpsl3JOqkuJUc5cmWHZo8Xz0ri4m2aC0w=;
 b=SnIVcO4hLWZtCxfU7w8+oUn/qP8keFHFwEx8hZLsyGowOrb4LgEnu6sFoJS0pWt49wuPjv9rq
 wJHOkis+50XBeK+3nsfQvv9kOH6UvijOD9DQ7+BO/iBiHtFa7TKjEYz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b14386 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RN3yzfvplrNe8VIVIhoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5pnwNnmmE0sVvwNBS_szsm8ZAuj42Z1m
X-Proofpoint-ORIG-GUID: 5pnwNnmmE0sVvwNBS_szsm8ZAuj42Z1m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfXysthLn92zM1t
 5tVRpukgaFRByKux10hVCndvMHHBU4rWA4Hfqxhl+/0B0xRnr0+PqEf0OZaUbTvt9u+/uZnlCJq
 qkxCoEAUy7c2xlVlNrEHgO+in20qmHxQNOuqhDdiJCwTJ8Bv3FhFPEzoLTFrP9oDOl+PlF3X/Dt
 miYu/fRoOYLkV5wdv/y+4XA4ZHXXVnptMAYwPV2fHYiDCDPM7Y0Oqw7wEYmPO/hwm0R3WreQnDB
 DHNzg8IR1iucgENyvVXD0QP1EUPQCkHkBJkBFaN/DPmuoyjaLgtlrVMlhzNf/8ctYglSu4c7e+G
 3qJ9b5B9DGxXOHJOLblw0a/Ybzqn5CTrmwdJLaKNEbVm+JENhGolhS/VRhOF4975Y+Sy2pTnHg7
 MRPDPXZjUEmzly4Pk4PujyHdSeqAnN5W0Wj/EYsN4rj87ICmCfBOJMV2Yj5X8BVUyK7i+EyvoDj
 Z9QXbdhi3M3LMMjeHpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032718_992503_6241321A 
X-CRM114-Status: GOOD (  28.08  )
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

Add support for transitioning PCIe endpoints & bridges into D3cold by
integrating with the DWC core suspend/resume helpers.

Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
into the DWC host operations so the controller follows the standard
PME_TurnOff-based power-down sequence before entering D3cold.

When the device is suspended into D3cold, fully tear down interconnect
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
index c14c3eb70f356b6ad8a2ffe48b107327d2babf77..6c5e9e541d55ad7f90a2203b97847d15d56b59c3 100644
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
 
@@ -1404,10 +1404,18 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
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
@@ -2072,53 +2080,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
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
@@ -2132,25 +2138,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)
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
+		 * Ignore -ENODEV & -EIO here since it is expected when no endpoint is
+		 * connected to the PCIe link.
+		 */
+		ret = dw_pcie_resume_noirq(pcie->pci);
+		if (ret && ret != -ENODEV && ret != -EIO)
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


