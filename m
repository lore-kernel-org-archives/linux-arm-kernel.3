Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43DEFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hq//0MaTtB+D8Slz74o3QINBfe6mU8ByJ3ZjSrdZlow=; b=vILYL4tElyfeTV/yzveKnvZ5RR
	JX3iYleX+GAXnwRco3b/Uw5/FEcjT4jh9h/h8asteIHfZSuTr467DFV8lF4qNhZFIayZskMuYoK9n
	RIV3vfiL2rBQkVrw7y40OcQulQxcQFxu0EIgja6TPXkuT3US2trqSQuTv/s73mKoFdh+xyj+R/SiS
	BUwsVV4VGv8sfsC9FkkYgpZ77FBhRZ4N/pNPfCYCQa2IL/xZdwFYyNM4RcNLPbQVsEGQvUmBmF4Pb
	orAsdbr+JObaZIHWHGr1rh6WjGQnPtPItb/8ah/Nc2FC/pOHB4ABEwMDswjDN3+Eu25CYmsWkAwOk
	2SPZw5RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHydU-000000032ZI-1tBl;
	Wed, 29 Apr 2026 06:43:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHydP-000000032V2-09q3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:43:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3XfNN019540
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hq//0MaTtB+D8Slz74o3QINBfe6mU8ByJ3ZjSrdZlow=; b=QettX4S0iLWjYPHi
	FTry+GOYf9EN4MCZS21DDK6lWwoeIaVCrqaYjhb12u1AuZHfDrJfpEGJF3H157+u
	TdRZUWD2xCLSIDpx+d0JGThXImnkN1LzSrY6sPV2Nqfief6hKiPeF8lOYgLboWgS
	F/39v47nnF9vgdFRT9bcq2mHnow7adqAoyWpgH6MpLid01qywToLqQDMMryqmknY
	wn923A9qek6cXlajP21RO5wni4uFH+YhCEyM8/T7IBsuFHBJul65tbOEXny/nhWc
	++PRj76dtgcuJSSM7P7ilXe9So2pT0sHSiuV87h8NEc42Vq+Is6T4YY5CEvTfnGh
	kNl0PQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eeabc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da86144daso11794144a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444978; x=1778049778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hq//0MaTtB+D8Slz74o3QINBfe6mU8ByJ3ZjSrdZlow=;
        b=gdaRUc1Ty6qJhLjJxnpVUJZrtsj2sWoItJyxvNWOgvTGqnmnmSrv5mrBB9Xl3m1ky/
         9U5feehMy4oqfXVH9cEl8uJdFXfmOPsW0Hf+7LhEKK9/GtjVNUr08MBgCyJu2kyP/vEX
         trLUNNeuIeReABEFBT75KuOCht/+U7nHwn5bww2V+w9VTahyaI1Evu/mbJK4t6H78MN8
         FBTnI5j/Jw6Rmvg8qOasroLybtvVpSI+ZMfL8e+84+ozG0lFVdTxj8MHF6wUyFAl4ABd
         EaFcscNgPFs+xlV79tNOJXt4YvlAHccd3lmhwh63rATkwrArVMXtrZh2FStf77K9Xt5O
         0j9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444978; x=1778049778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hq//0MaTtB+D8Slz74o3QINBfe6mU8ByJ3ZjSrdZlow=;
        b=MyUbaidXIXqbBnMKp4gnOhAFA2fKWhbyhdQyN5xo0N+/k5VMpYEac1uHwMNrQ3EpBa
         LlOF/imKn5lnSPaJqy9IysZJfzEjyx8jK5axZLTDHhqTOTp8n+em6C0LkdvKqcSXS+mr
         nWWWFCjgoiHer7TFXK7Y95i2KFBxveNJnmg7bJ03mVFXQSlYD6+kaA9ZU2rMEn/UthWY
         ycWsaDOOzaesYLHadWN7UU8K0sLEJFuOwaJX3TewBI2afAmCqTOeztwkPUK7OZ36/jTJ
         hHDbvr96uspn00rrWZxcfqAgOW9HR0B/2e5DUawyPA/gu8EDNOSnfp/1rJTTFfZmu2g0
         Tw9g==
X-Forwarded-Encrypted: i=1; AFNElJ8EIc7vD4qsQrh3bOytlIvHKqRBpsZNXZMtMHxO4qZ+wyXAaarHupFlV+mp3OUkNG5nchemENquDwjG9xPh+fGp@lists.infradead.org
X-Gm-Message-State: AOJu0YxHc9zFJiFfw9N4N5z3PL/DWpKeOJZkQBlrAnObnyWnscicGo5i
	M866V80oxtufFAFF9mXtyeiUTtBmlY3STStqFrwKn2Vf3V7ekrNBkO3r7Mqiz1bhHF9NK/VQv+r
	u0qURvOK+A/PD9VL5CWHZ3r6Rx/QCp+q0OT0p31RnRrCc37tQzcbHrOsF2++8F56MOLtG0WQyCn
	FlMg==
X-Gm-Gg: AeBDietHQhU5YS1oIlLSgTGHFhKj1tpFnXKCajrwvm2FDnG4TUtEjJwBR29ek/t4nuk
	RcPZeXGpjwMdTrDhxVsGo1EXBChU+2F525L1gTxQj34xZ2ondzSb6j5+Lkp5SN+Ahq0mqmZOsY8
	ViNkvHGJOg4kdNkRr+15DGbleMagqnquGZkofbjWH1mv5iEmQj07lR2YtwwLt/37dMiPaikFaCV
	SJxcXpjBEHBCN8BQ00HPcSGV1M/1raKyuxjMdmRDoukguxnP/iIMzA0xxlmIRSNGfrJC+gQMrCa
	w5auEPNa8bVlL62M4ES+x8gN/TbrPi1pEyJkCt06ek+VSgtE9zFRVtVlifn5L+1n7v1+hLytU8V
	6BerGjqtzOXKKcHMehXjsmGBH/zjQgTbrl3Flz+Mrg4DvG73uTCuFxSaVvCEqg9ZOaEo=
X-Received: by 2002:a17:90b:5865:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-36492046f97mr6801403a91.19.1777444977832;
        Tue, 28 Apr 2026 23:42:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5865:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-36492046f97mr6801368a91.19.1777444977296;
        Tue, 28 Apr 2026 23:42:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303d59sm2021414a91.15.2026.04.28.23.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:42:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:12:27 +0530
Subject: [PATCH v5 5/5] PCI: qcom: Add D3cold support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-d3cold-v5-5-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
In-Reply-To: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444949; l=8346;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pA76AmsNQb6QnqOiWK09b1zUzJDidnd19LIa2CcRAH8=;
 b=rBSaTdbJhOplkic9jOdMuWUYoZEN4Z5hY6sphVVqaapCV9NZRGxNjRynDSrXYWSeMPcIp8xB2
 /VMqJixAoW2CPphPAtumG5GxoEqm/AT6P2t6yJ4dDrOsgeIhSe5Pclt
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1a872 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nOXFll4yYCsuIFAjJyMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX5xsDIyGI26yg
 vpsaNW1eI+TK4wje/RUm2E8OlErk9ZCEwPcjYmfmiSV54xrbClCcF+9WIcaXOh19ZnlFf2MTKdc
 w6M/Pdy2+0u5WBPpMWcGcH8e3wimBzmfkutI+Edp+YEvbclmvgkT6ZwTMLCGC1VsqgaEK+ceiPz
 /MwoGejfeQ9B9cmk5BPfedmYtdubgZuPCV/n9SouVNd2QaSbpmCdug1Oa7RwLYvEgSZLfyyfotk
 618CkY0DVVG70cyBpkeSgILUaWm3ky1DB1f3u3p34sceC0+VPnf4sBebuMXLDLpatbIR8DRrx7y
 TuQc01wHYbPO3iv4hoUsNfhjKSaZyrLplwh2Ng0txDSlRymYQ56mHY4A/65fH8HIQqJzb2c1QS0
 X/UoT/XM2enLdZkP0VsyGcxAdMYDps35y8ijIaENLGFFTZY4wKu5wTLkwthiw/uZ1X2kzxJ2Bst
 kSoJ4XvkJq3whECCCQg==
X-Proofpoint-GUID: V5kFIDe-aUh-bQHjhfzyH5ZnyG3Br6l7
X-Proofpoint-ORIG-GUID: V5kFIDe-aUh-bQHjhfzyH5ZnyG3Br6l7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_234259_108917_A241D447 
X-CRM114-Status: GOOD (  29.33  )
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
to preserve wakeup capability of the devices and also not to power on the
devices in the init path.

Drop the qcom_pcie::suspended flag and rely on the existing
dw_pcie::suspended state, which now drives both the power-management
flow and the interconnect/OPP handling.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 155 ++++++++++++++++++++-------------
 1 file changed, 95 insertions(+), 60 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9dd808e85409..94403be5a05e 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -146,6 +146,7 @@
 
 /* ELBI_SYS_CTRL register fields */
 #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
+#define ELBI_SYS_CTRL_PME_TURNOFF_MSG		BIT(4)
 
 /* ELBI_SYS_STTS register fields */
 #define ELBI_SYS_STTS_LTSSM_STATE_MASK		GENMASK(17, 12)
@@ -288,7 +289,6 @@ struct qcom_pcie {
 	const struct qcom_pcie_cfg *cfg;
 	struct dentry *debugfs;
 	struct list_head ports;
-	bool suspended;
 	bool use_pm_opp;
 };
 
@@ -1364,13 +1364,17 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
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
@@ -1395,9 +1399,10 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 err_assert_reset:
 	qcom_pcie_perst_assert(pcie);
 err_pwrctrl_power_off:
-	pci_pwrctrl_power_off_devices(pci->dev);
+	if (!pp->skip_pwrctrl_off)
+		pci_pwrctrl_power_off_devices(pci->dev);
 err_pwrctrl_destroy:
-	if (ret != -EPROBE_DEFER)
+	if (ret != -EPROBE_DEFER && !pci->suspended)
 		pci_pwrctrl_destroy_devices(pci->dev);
 err_disable_phy:
 	qcom_pcie_phy_power_off(pcie);
@@ -1414,11 +1419,14 @@ static void qcom_pcie_host_deinit(struct dw_pcie_rp *pp)
 
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
@@ -1432,10 +1440,18 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
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
@@ -2102,53 +2118,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
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
@@ -2162,25 +2176,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)
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


