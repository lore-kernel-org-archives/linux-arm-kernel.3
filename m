Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107BFFEEF33
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33isoV0yWVJ9xotd+3ciXf4Msdfdu+7UChBrj+6r8Zg=; b=GXrdEzpjA2gWi23gCKWCK992K2
	TLunLr4b0x7JVMncVfFp55L6rSAakbN6k/Dkh+JU3tpR5+T0q/xvfdSUlrHoPVMRTbhYb2yHrjzA2
	EJ0zEcDmtXtT0kF1m/xtQw6j/VRwZ2q/YqwbWctDUU3zjqjgPIUXfHFIBVaw/O3WBxC3jx7sPx1AU
	wDrp7uQ1iiQDPkaAcDZ+N4aPIXEMnGf+mrZ4UCtm8TcC/6V+9aFozyo25gz77Fm0kNRg+ULwpl+lr
	t5vSjAGrJdMgNNd449qkUMg49n0mSFgaGD4SoLatS7TqVdgoNt41S7F8LnLWjskLMytvxifdOw2Z4
	kAsdZNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65w-00000006TYC-3dwI;
	Tue, 07 Apr 2026 13:03:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65u-00000006TWX-0FV8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:03:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376YpNh2327993
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 13:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33isoV0yWVJ9xotd+3ciXf4Msdfdu+7UChBrj+6r8Zg=; b=bCnvo+02LZ73oC4a
	eqaGfX+dMblgz/tmkFLmUryVC8AsbKahxJw3KkHa49PXG2aIEFG4pyZQBGTAQNqk
	54RqPlyHWxE+hWnEP07Gz6MBvzGaTWbyreMmBdoPVRjVSs1NonS/wvoiK1vZjQFi
	DFcDlMeD+SnxH5B+ZOTLHjfxAqca00CboKsTjcW4f6VDpEerqFRFcuHKosXPQA2+
	se4Gzic4JU8h7qKl7kCiLKes/msnmiIkMHgllj4+F4tEHDw/rd371UB6vnxoYwag
	mtfyotCOoZ9kBllaT3KB9tkG190fFMhiikAAWZ19JT7ZWCNxDI4rvfWTPSgTJzhR
	c0QwHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tsud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 13:03:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0c92ff4ebso65794195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567029; x=1776171829; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33isoV0yWVJ9xotd+3ciXf4Msdfdu+7UChBrj+6r8Zg=;
        b=TD1Li8InhKHP1aunREWHgyY5oZtKy8f/EDI4bFTsfPhshUyySGSHOJcK7xLln+HEzX
         53oZQTu6igSecgifc20jnbTjjN6wIoLfYiLyNZWsC2utDIayU7rxJbi0/9C3cT7mI9Vc
         7DMLweqS2AxeWjh3ON3vRERiCDqYornkRGlY/4YoHnpQgbpAmiSg/PN3q2DybOrW668J
         060J9tXIbAmzfmI6mxq4/KCiD01zIiBhLVRHxsGFE7IEbKPC9MKIw4IQAYCNJ9qOZCrF
         gXgM/EC4uxiTAMgrSiLnUW5P7mGVNU3DeOCmizl5yQCtusP4QlLzHGLjUFxdkWbeaEiS
         /fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567029; x=1776171829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=33isoV0yWVJ9xotd+3ciXf4Msdfdu+7UChBrj+6r8Zg=;
        b=RzjJjqPA21N+yikQIk63XBU/jaLTFYgdLaB8nFrS1RppjWdszOL72NgWrlud+HIi3k
         S4Mxvgy2I02uOmKAm1aeOb3n5TU4sBBPPflu3E9AdHF2tYgTm+/Fv84IqlQQqdzQQ8cQ
         9NwoTC6Z8vXL/pe++m9809HDhRMYoBpystRiY6nAUDQ3HLltNhuwAqfvlfBIVaSFS2fr
         VMbGDtGi0eLDwX1LGkVnBIihVSVlDGFhBKJwcCSZx91RbY60FkP99GISZIb+kEQTvTmV
         5/keO5lef6zyhac1uppmaB1QXWQ8ziTnfOrMAFMeq+SncK904K77fyoTggdDtUcA+juQ
         StgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxf9sHEfit7rGutiUofrvWXLMPuiOAs1eyjgfW48Phgxbflh/gbV5xq9OPjTUG4ZSmV/JFSwei8wd1w/XNqrTx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5RhhYjLEH4zytizbllf35k6ol7Jy/Is6HXc5CehnsOmVEAJdH
	3Apv7UjlmVKZniZE4HhDTtkO1v9qGsRmV9SeKagZnZBt6uOpy2xFzcvGd1YuWZUMMj3LSRb3NK/
	/FN/qQ5k+VYwuD6n8qkAsZG/Aal+h73Q+1QlwqfRcGsE+MdiqO5BZZlUBcAzk0YiOn8Sp+6req6
	jVbA==
X-Gm-Gg: AeBDiesDvDdQg4f0CbbfneJzEz4gRHK8Nl3DO/h0H01x402gEUoehs87aCQwQ+ympT2
	bgDab6ma/0r0qYGfKmh4jvFP2lKA7TL/8KUnFE1FOd/dDASwS4l9s31OVE2DRVHlhHAfiDxHUNc
	ZnURcG7dCI+SamELLBBNe4BJeM8t9DPYZ36zMPxNGsXvDFkIiv4xPTLlyYi0WrZRKzDjJzDltyA
	iIR8z8TVZnjTdPLJggVxFx38ygoS2yjGwc5yNACWd6cPABmTEL8DaEyhf3OMASIgi+Xq4nCHl0q
	+O5EhdwVRnhwPU8hsVAAn1zazhy0JllEilOqomdNeEmBWrj1BFq/lS43muCUjwXtBIksyKNjtA7
	Pn2ROuNjWVlfFnGEukKAqr6+76MkZZeK+CnzHJSWWNeCg67l1RBP6Gxdn
X-Received: by 2002:a17:903:185:b0:2b0:5be9:f423 with SMTP id d9443c01a7336-2b2819180c5mr167577725ad.43.1775567028623;
        Tue, 07 Apr 2026 06:03:48 -0700 (PDT)
X-Received: by 2002:a17:903:185:b0:2b0:5be9:f423 with SMTP id d9443c01a7336-2b2819180c5mr167577015ad.43.1775567027939;
        Tue, 07 Apr 2026 06:03:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 18:33:12 +0530
Subject: [PATCH v4 5/5] PCI: qcom: Add D3cold support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-d3cold-v4-5-bb171f75b465@oss.qualcomm.com>
References: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
In-Reply-To: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566995; l=7930;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=W1OhNcEspfBwAlfmZve2ZqD5tZvvm1E8mVApzAXXGuI=;
 b=o5n5mzRCb1hInEwIP9Lo/mkqs1V+NaPD+q4D06Qd+qeyiIvLq3qU775agBpWtloe/QTme7jjR
 nCXcRkr1zXNBKMFJTclv0uXBflgy6ODXlnpBwnYuu/TuB08Ps/73MqU
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfXwOS2NUr6f3cj
 7piUqORcipbilPeJuvqULXu4HyBJXo/aIiZq0gyt/6pOQ1a9sE8XphRkpjMg28sdKMHmdbwPbqV
 gcYMjYrEyI1Ufcvx9CHLyaQ9sIFOg2BlutPgWki7mV7t9aCm2WWLRrMlH/yVzCtkLZYL4+ugYma
 DsDbmqNKJjId2yelpqyIq31T9NqyiMPcKIaGtlAo7uWSHXDkELg87sbB40sqFX24zEcqOODX1Yu
 vIE5Z8A8Vn7cbyfbCC9TT0XFT53VaQN84WvcgNFZ/WTrt8UPI6/e70CI/lm6HHCoKX7Y98qoUo+
 v4bftmi0yWG0xM3yd2zLs2V9hTCVvfpnJniRKWamnarTO6dSsb2CBfuv+Hoi8eScLtLTFavVP7q
 mEvSilBuzd8YBSy5MMxsgouoltzRlW4Kq7YPv4/UnaQsodgfCYzq93qxFAZtbOwO3Usc0ZfSX4y
 +C1uidOM+wjjEHaHx5Q==
X-Proofpoint-ORIG-GUID: uLIMHhS_Dj5GgnfCXhJUWLMigj6NVzlo
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d500b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3yJ-4rlz3SFKGY1FFUMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: uLIMHhS_Dj5GgnfCXhJUWLMigj6NVzlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_060350_112015_30D323CC 
X-CRM114-Status: GOOD (  29.19  )
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

Add support for transitioning PCIe endpoints under host bridge into
D3cold by integrating with the DWC core suspend/resume helpers.

Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
into the DWC host operations so the controller follows the standard
PME_TurnOff-based power-down sequence before entering D3cold.

When the device is suspended into D3cold, fully tear down interconnect
bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
by keeping the required interconnect and OPP votes.

Use dw_pcie::skip_pwrctrl_off to avoid powering off devices during suspend
to preseve wakeup capability of the devices and also not to power on the
devices in the init path.

Drop the qcom_pcie::suspended flag and rely on the existing
dw_pcie::suspended state, which now drives both the power-management
flow and the interconnect/OPP handling.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 150 ++++++++++++++++++++-------------
 1 file changed, 92 insertions(+), 58 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c14c3eb70f356b6ad8a2ffe48b107327d2babf77..e8d109c44dd270610272906244d1afeec3664f41 100644
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
 
@@ -1336,13 +1336,17 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		goto err_deinit;
 
-	ret = pci_pwrctrl_create_devices(pci->dev);
-	if (ret)
-		goto err_disable_phy;
+	if (!pci->suspended) {
+		ret = pci_pwrctrl_create_devices(pci->dev);
+		if (ret)
+			goto err_disable_phy;
+	}
 
-	ret = pci_pwrctrl_power_on_devices(pci->dev);
-	if (ret)
-		goto err_pwrctrl_destroy;
+	if (!pp->skip_pwrctrl_off) {
+		ret = pci_pwrctrl_power_on_devices(pci->dev);
+		if (ret)
+			goto err_pwrctrl_destroy;
+	}
 
 	if (pcie->cfg->ops->post_init) {
 		ret = pcie->cfg->ops->post_init(pcie);
@@ -1386,11 +1390,14 @@ static void qcom_pcie_host_deinit(struct dw_pcie_rp *pp)
 
 	qcom_pcie_perst_assert(pcie);
 
-	/*
-	 * No need to destroy pwrctrl devices as this function only gets called
-	 * during system suspend as of now.
-	 */
-	pci_pwrctrl_power_off_devices(pci->dev);
+	if (!pci->pp.skip_pwrctrl_off) {
+		/*
+		 * No need to destroy pwrctrl devices as this function only gets called
+		 * during system suspend as of now.
+		 */
+		pci_pwrctrl_power_off_devices(pci->dev);
+	}
+
 	qcom_pcie_phy_power_off(pcie);
 	pcie->cfg->ops->deinit(pcie);
 }
@@ -1404,10 +1411,18 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
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
@@ -2072,53 +2087,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
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
@@ -2132,25 +2145,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)
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


