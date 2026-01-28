Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51D5D25B47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MI2ACCcBLhNm8EawqxzIFOQ8LYd0rskoVDW7w3nT58Q=; b=i5LFU1lNwvl8c+T67mFDK13U6f
	Cy/6pAOtJNYfLMO5zR6esU55VT5kOs+jEcwBYXlub0UMA1iHna/ln0fkFSOK6uKJiMgrhVMUFOHZX
	zfQpJ4lGo0EkTTPL6Gqjsir5pLUD3Zh0Od5zpmyv/rUETmJCFEfyYZXK0kAH+KP6/1bMPMDdC+DqF
	tO8IzBPZBEOq5aUjSHtticMhFeCQWDpi6tWo65IQoxA+ba8dlQMgdEkxZJbArKrYAcOrXCbHLY3ly
	CtvnNxjZA/kX0zEKbB4U4HMpi5wloUFAYrl+PwE5hrlH8AqNiXC8MoNdWqro8GDhaiefZUYRw9wKV
	BMPmI84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3v8-0000000Fwf7-2YVv;
	Wed, 28 Jan 2026 11:41:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3v0-0000000FwcN-40Xd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:41:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92UME3907761
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MI2ACCcBLhNm8EawqxzIFOQ8LYd0rskoVDW7w3nT58Q=; b=lGCW27WfxOhtkMg0
	xmAYayt5U+Y4tPqs+Uhg0uS4WmAMsvMTCmP16m52nowl8wApNPqpodNX8gvpZTju
	iX9dlYsJ6iO/VFEqU7MWR6GOiLGS6305WEwB//yfv6xL0ADbMADFJquemAasWEWd
	Bbs0NFoYlsIRhIVnc7Ox2E0Sd6JzgPASWJt4pDBu/tAC47Cch8q0qv4G4sE5XDhe
	3Ne6hfc8LNysM2HYBOpuuljmwVCrjJRYZbrig8DblK0I/henJJErPRUTfqbgIGiB
	Kl86j1oypwFeOd8sGoZm3a7O33LGXruVlX+LD36QEcG2rwNo3jCu+cxQ+A6RSz7B
	OMKPXg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g0bky5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:41:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so12532793a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769600465; x=1770205265; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MI2ACCcBLhNm8EawqxzIFOQ8LYd0rskoVDW7w3nT58Q=;
        b=P4X+EpC6OHNsSZnWJ1JNl8sF4wBLpvMWn5Y4owq+fwuaBTA85gCVsVH60ZhOC1doHM
         KaWTryTmXfQwuv61Gava2sMShqqjYbyNQvFQDpai/Oj1Uwitb58HaJK+zn2ZHj/LyCmg
         tkMKOn2h4yUZGGh8P4f2h0jlpUZeMKq5rf5rJVNrMmGW2me3mksfD0V47PcGxdz+Wkc9
         glnnotxoDQ5nyiWWLKDYE8S1fOcCQCyre0sl2TGXZJ8CBIh8nzswKP0EsbyfjYFBk3gF
         hR4kJjR97sRSSYtia65q94gokYa38D3oewPqyMGFhlMwqaBn5ee2fYKn9AIw5zMOADAB
         UFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600465; x=1770205265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MI2ACCcBLhNm8EawqxzIFOQ8LYd0rskoVDW7w3nT58Q=;
        b=LWQf87AiLsuUv+iLgyoZ6KuYqLhxtMVNldBdyY2qolwg87DUdq8SweIqszxBS6J3iv
         ZNhrDcUKkOCcCL6na0Mk9CWltkTzNu+i+5Jf5xirI+Uh+CctRPIcO5R2erc4CXMegGHh
         b4dseXTnE/oMVH8raiG0IXCOgtvvt0l/VpHd01Uoop96hzYaZUdhYnyBCTmpRAcEpzVl
         Nf34B2+f8nEox0XpgrPcOTzMpXBPi6+xALpvRQ4dt8ODxYxDrbG9TIKT+6jDHzOEXNnc
         MR8G6O3W4UgYuO9hVfxCOngBjbQ50h4nd7O2YxzkUlYJGOTHh/LJfZdPR1hf6aWTG/eR
         1n5w==
X-Forwarded-Encrypted: i=1; AJvYcCWza42nrIsm3R/1W3MNCNZaTMgiL8kLWb4Ru3mybwHtmcgVt9IqdJeNzvhNIFEiK0RFGDHKrFR0VTVX95/N4cQw@lists.infradead.org
X-Gm-Message-State: AOJu0YwoRr+jHHsSv9G7k3pfQCIibys/M8WwDSpylnX7J1c0ssXg7LS5
	5+wmTurN1RJQqS17pQmLUj1f/4ITnV83UzkpibS7vbUhF8qO3/InHG67aT/Ut1sPE8TZavuwVog
	RoV0Qouqrac+K4rlA7VSLYSjcz5mreeoUYfsyVXZgKjIVZ3o/soIsxm+p8Li4gRGiX8sCdAK/hf
	d6+A==
X-Gm-Gg: AZuq6aJ2FJ7Owhc7oMZ/WSsV2zqTpdmFQmczS1GAPteizEsDClquXJLeOprRKfSgzcr
	UPmtw0oFeYpvD8C+aaB4K3ROIzepFcLo4lkvfPA1njm8m4OP4bMaQri+0h1BDRgG8dMfI0Rg4Wv
	Nai83rdk6ladF0Syc4sHyKDXEbLjs3M3fOCAxBrF5ABNVTH4GOdfxUlR3qgKjL3kb4ZdJNC1g1S
	xdwRitdnNrZXkn79t05XseZgr8wsBgEhE66V4RJD5o5sPhXA79rb5aNkrXDeLlMX/1xLs+W2UWT
	l/NRnS/kpW/Jr3a15Y1bU0jtY6w0qjLDmcq0hsGW9f229lYNfuOELT8RSq0DmlbxBLJgQJ1hS/c
	OgaNQhlPVnic1phsszkmarkaLPSRp1szyj7sFZBfWmeUi
X-Received: by 2002:a05:6a20:9f05:b0:38e:9c64:bd39 with SMTP id adf61e73a8af0-38ec6551533mr5233563637.44.1769600464647;
        Wed, 28 Jan 2026 03:41:04 -0800 (PST)
X-Received: by 2002:a05:6a20:9f05:b0:38e:9c64:bd39 with SMTP id adf61e73a8af0-38ec6551533mr5233528637.44.1769600464044;
        Wed, 28 Jan 2026 03:41:04 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f41d0sm2010678a12.27.2026.01.28.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:41:03 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 17:10:43 +0530
Subject: [PATCH 3/3] PCI: qcom: Add D3cold support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
In-Reply-To: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769600446; l=6254;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=HVoOGzL63Ijzzcm+Ssa/TUlQo3nbrzHFSzAS3cC/ySY=;
 b=CsCdEyib+IazFFEPavyzrwGgd4MZSvEXbcDP68eJlH11HaYRD0YNkrmgi8ygULfmBrSAlkeyQ
 wq6ImzoJ7xsCVXM7kQgEAsJ3AC/yE4UYBzxQ1iYDV0csAg8B7Rcy0P2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: oh2I0ljg7moiDMcSaqojufIJyLMb-YgF
X-Proofpoint-GUID: oh2I0ljg7moiDMcSaqojufIJyLMb-YgF
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=6979f5d1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RN3yzfvplrNe8VIVIhoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NSBTYWx0ZWRfX1Wp8Eziazuen
 sGt4AxyNemEeaKiM+Pv1Nn44smZIm4FhlylhbO3+sH2ok6HXSh6xeGhtkbMSym6iHDQnu2YF4At
 5F1QkcVlQegAenmCWwaYWuuYiYjsnLPo84Guo86Tek9PmBh4qJJndv/A02CAdheReSCKAV5OUWz
 n4NVP1XfBa+WIpVSdIp7iFC3yJeCSjXl9JL9kNLW9n/vEYkD5sluArZJe7J0qpNqi2Cg5WtICMG
 eZrObtYkj6rhfu23laJALcfTz/gPZjVuQSNpQFig2d2c7dHtgn+4F0kSBD7CYyFhLsEMvGaCxhP
 RwKc6Yum4PT+TJhbq4UlTCylthvKVBDt8qdxeRe6dTHsPtkfjc4+PnLOvCJ0VTkc4lVRJl4esxW
 BiPOCEyalCQoNuytBXRDC7IcmFyEEmnLyHeakw8Z2vLoTHdq+hbpzTtkqmfXLHydayWCtBw/R1x
 3BMRkIISF+3T0mk74+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_034110_021666_1C206222 
X-CRM114-Status: GOOD (  26.07  )
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

Add pme_turn_off() support and use DWC common suspend resume methods
for device D3cold entry & exit. If the device is not kept in D3cold
use existing methods like keeping icc votes, opp votes etc.. intact.

In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
in the controller.

Remove suspended flag from qcom_pcie structure as it is no longer needed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 114 ++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 46 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 7b92e7a1c0d9364a9cefe1450818f9cbfc7fd3ac..bb4e5a29c452a6c0d4b31b2a9ff3aa62b984fb64 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -150,6 +150,7 @@
 
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
 
@@ -1075,6 +1075,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	u32 val;
+
+	/* Disable PCIe clocks and resets */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 
@@ -1355,10 +1361,18 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
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
@@ -2016,53 +2030,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
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
@@ -2076,20 +2088,30 @@ static int qcom_pcie_resume_noirq(struct device *dev)
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
+		ret = icc_enable(pcie->icc_mem);
+		if (ret) {
+			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
+			return ret;
+		}
+		ret = dw_pcie_resume_noirq(pcie->pci);
 		if (ret)
 			return ret;
-
-		pcie->suspended = false;
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

-- 
2.34.1


