Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62B7CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWFHeWBB2Z1DVoBR2DS7ksl09YtGQ2DsVW2EAUl813A=; b=jqf+RyagmMlXRpIG4bTOBM0/Bo
	ZWgiEQYyO4snvJxDnJ0pF/4+rLrs2X6Qry6OSfo+z2sDUOLLem7+3+VgzYq2iZ27Hu18WmnbAmV7B
	5syxTH3lt9yo9zw0aTzBb/OzJKg2MBk1yzbKnUJq7nJYN0OPYZHt/9BlqgqWpvg/IOiB+SVGUEFQE
	RtTNYnQHZUEU0tAM/bV3Zibpl5IAjJ5yxSwhzYPce5PKyutKOl7TUI6GHq1CaP4kodoypIgiB7qWp
	PAygAglNYxVwrxBvMBwWHqAfrTgRXo0wgRKZqpdg28t1Tf7Tz0+4008KahlwtQ5WJiMmDDVZ3Ti9B
	IDE2p8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgM8-00000002Qg4-3l4X;
	Thu, 28 Aug 2025 17:24:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbSv-00000001T9L-3VQ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:10:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5VqxM015944
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWFHeWBB2Z1DVoBR2DS7ksl09YtGQ2DsVW2EAUl813A=; b=ceoSp/Fp9vgYXEnd
	SdujOuKjRJYYH/R3AtzwKZc52D251SeEICqLQSv/FB8rm/YPTfi2ZuGG9KlkMW6R
	Lk47LN6Z9spDvtEgshwf1jpqwsFb+79j73mvMp+nLBmCDo+6y2abC7USZPRGM+rR
	n4Z32GTiiGdaM3zWk4bO2UQ6u6wXudreJdPMUkl2m83tPe5rK7CRc7MkP6WK/OOo
	t29uyEGWzt0Y+uIXOd+s1dclzVtVeEVoPw7l3Co+XyglLpS5YbDglzgxfix0t9Ag
	FgGSHvlLKX3RGt2nKDLNFyZRN3yN+5jlGDCEWQeHFO909/SpaBeeWnYfTVHZer1P
	aqWghQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf2dtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24636484391so11384345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383052; x=1756987852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWFHeWBB2Z1DVoBR2DS7ksl09YtGQ2DsVW2EAUl813A=;
        b=JGDkry3cEcDZ9a07ahFOKzJoBwsXyNo8wIJXeegLN/2vuq0tJ1/vQ2x5pNXsAgfZ4o
         p1Q4K1ArTbULKFiPTbTyc6ochhLDYZA/MZbAPIW4v26rR/ivI+KK3Sb4LImIuBAETTdC
         83n+AMXVen2fuydxketHCSCTr3DfcK1mJzJJY5weenzYzwD7r9xgl9ogOvxnpOBD9Sm+
         4vqI6ugHOFJh5p7v72RzU4259nZeCTJlbKM5JXNhDH5YyTwZB3pEA34q7VFW4KnSyQTV
         AfM8Gwi3C+h8VIK9b31f+vcsQA2g4M75McJieV2qjgiSmhn1bDkxTw+809kGKR/ecFPp
         jeBA==
X-Forwarded-Encrypted: i=1; AJvYcCUvH8BshJoDwJrJqg7EhiI9HzWBGzLTg/Vh3a2MivQ8Pfisgb9vEkD60CBsRWxGiAtlHmXzo+hOQ7OPLzKyPIUr@lists.infradead.org
X-Gm-Message-State: AOJu0YypSt8H0HxAjuXxDHPSOXxkdWedMEiPiMLz4iP7EHGeXBwYH1ml
	/t1s4adFhVjnMXdESd+fOD/Q4gAzXP+/tvSLw7UkY6Gngl1u3Q8pCchh6ikLRMjLSeMPupXbfX8
	Aa0utMf/9MyjGXgR1mdCOgHmZVtJZKuIKcPE10/ID6TkqAkibv4T0geVbeG1WMPS7IyqFnsleYt
	0iqQ==
X-Gm-Gg: ASbGncul/S5Bvq3BrBVyaD4IXjkvY/D1qbmR/y6v+hes+fSxEjUBHMokWxpRHpDpwef
	riRornE8HnmH7BojB7F0yiSS3RZNajdM9WrJR1EbCKo9LQoa5lDUfiup8Q/8zzaRRt0fRV8yuEh
	nRmG90AsUYD0GBYyA/GatuZc6QqlHB6iBzOb14fFMtq0j10KMt3lSoxMCHe/igg+Dw2actU/WMf
	uz66oUIEoyqMf1ij7epkcFmEdM1I6S/b/jw0BUMGlV0Oldff/yMXHJuHVFyD8bpZZAJbgoAKqIZ
	erTqmjcn/TfT+ETjb+n0eqkTKYTPmt0LyVvIFejqQrx527IvX5c+unDzgYW7/n3tvgsf8WnhSjI
	=
X-Received: by 2002:a17:903:388e:b0:23f:e51b:2189 with SMTP id d9443c01a7336-2462ee4579cmr306306395ad.17.1756383051566;
        Thu, 28 Aug 2025 05:10:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd0NBJm7wYUW87oKHBUWxZFqtYLB2Viy/kWKLH/ZpGsIecptUNfwMGjJrdNd7WqDcbo+qxjw==
X-Received: by 2002:a17:903:388e:b0:23f:e51b:2189 with SMTP id d9443c01a7336-2462ee4579cmr306305605ad.17.1756383050865;
        Thu, 28 Aug 2025 05:10:50 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:50 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:39:04 +0530
Subject: [PATCH v6 7/9] PCI: Add pcie_link_is_active() to determine if the
 link is active
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-7-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Shawn Anastasio <sanastasio@raptorengineering.com>,
        Timothy Pearson <tpearson@raptorengineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=6997;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9GiN2/tUl02eHBu5x+pmqTOtPVE1/FNwqyLaaSoZu1w=;
 b=7p67LiPjVWlf+ukePQQtECRvT7Hd+sOl/Q4ApcZA69A7MFauJiAm0LrZbq5yW50wMgpaXUdMB
 6spcJ8FbmB+BUEBtMyO+c5jGWzToR9VHc/hL1lDssvnPl9w6ZtEGfBm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: vO5V__AP8AvMQfseQyoT5uYwnZgqdVVU
X-Proofpoint-ORIG-GUID: vO5V__AP8AvMQfseQyoT5uYwnZgqdVVU
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b0474d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=DLE-xEQoUa54y48t:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=_AprYWD3AAAA:8 a=c8k0nbeVto6RhVnl1UYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fKH2wJO7VO9AkD4yHysb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX/2khfH9RU8da
 q0g6la6xb8ayIW7CEjStpgS1Bjqk1v/HqIQKCrFiQA/AGepxLUEw2kVTCL/goTdBoAAolM8MvHP
 xL28HGVBi511sgsCN86gvN5i84hc95bPEvo8Gr3fIom6IrEy9Z1aq0HY92LuFm8jjQn5oQshh4t
 ZjKKKnoB4tgVbby7FN3H7J098SaunoN8y5nvL2+1Zy6WZVrkC7RxM4N4hNs0h2lVTxRu5nsMViT
 ES99OutAFvp68flwM90Xy6P7uOId6UhaIfBnSY+aQ2KgUxBtGCZhTVaVwBusZhmzk3/oUjj+Htl
 9sVTEg8C/as27O5Qk/U1NG2OZPhGB2XXItOKp9h6bpfTwO3IbYkVgXBYaZUQzlHpZDla/3kOa89
 l0N98Bey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051054_005318_E3414879 
X-CRM114-Status: GOOD (  27.12  )
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

Add pcie_link_is_active() a common API to check if the PCIe link is active,
replacing duplicate code in multiple locations.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
Posting this patch again as part of my series as I have dependency with
this patch.
---
 drivers/pci/hotplug/pciehp.h      |  1 -
 drivers/pci/hotplug/pciehp_ctrl.c |  2 +-
 drivers/pci/hotplug/pciehp_hpc.c  | 35 ++++-------------------------------
 drivers/pci/pci.c                 | 28 +++++++++++++++++++++++++---
 drivers/pci/pci.h                 |  1 +
 5 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp.h b/drivers/pci/hotplug/pciehp.h
index debc79b0adfb2c8e06aabb765e1741572685100b..79df49cc99463829f563db1dc8014a51ccfac0af 100644
--- a/drivers/pci/hotplug/pciehp.h
+++ b/drivers/pci/hotplug/pciehp.h
@@ -186,7 +186,6 @@ int pciehp_query_power_fault(struct controller *ctrl);
 int pciehp_card_present(struct controller *ctrl);
 int pciehp_card_present_or_link_active(struct controller *ctrl);
 int pciehp_check_link_status(struct controller *ctrl);
-int pciehp_check_link_active(struct controller *ctrl);
 bool pciehp_device_replaced(struct controller *ctrl);
 void pciehp_release_ctrl(struct controller *ctrl);
 
diff --git a/drivers/pci/hotplug/pciehp_ctrl.c b/drivers/pci/hotplug/pciehp_ctrl.c
index bcc938d4420f3ddb301c1ec6b0bce0d7f9541658..6cc1b27b3b11a77678c24e464fbc61541a0bfa38 100644
--- a/drivers/pci/hotplug/pciehp_ctrl.c
+++ b/drivers/pci/hotplug/pciehp_ctrl.c
@@ -260,7 +260,7 @@ void pciehp_handle_presence_or_link_change(struct controller *ctrl, u32 events)
 	/* Turn the slot on if it's occupied or link is up */
 	mutex_lock(&ctrl->state_lock);
 	present = pciehp_card_present(ctrl);
-	link_active = pciehp_check_link_active(ctrl);
+	link_active = pcie_link_is_active(ctrl->pcie->port);
 	if (present <= 0 && link_active <= 0) {
 		if (ctrl->state == BLINKINGON_STATE) {
 			ctrl->state = OFF_STATE;
diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index bcc51b26d03d53ef7cb22b8e5868aa25b5ceedaa..2905ae7c9bbf7f9f656ec21ecd2e6bf9f7b5be47 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -221,33 +221,6 @@ static void pcie_write_cmd_nowait(struct controller *ctrl, u16 cmd, u16 mask)
 	pcie_do_write_cmd(ctrl, cmd, mask, false);
 }
 
-/**
- * pciehp_check_link_active() - Is the link active
- * @ctrl: PCIe hotplug controller
- *
- * Check whether the downstream link is currently active. Note it is
- * possible that the card is removed immediately after this so the
- * caller may need to take it into account.
- *
- * If the hotplug controller itself is not available anymore returns
- * %-ENODEV.
- */
-int pciehp_check_link_active(struct controller *ctrl)
-{
-	struct pci_dev *pdev = ctrl_dev(ctrl);
-	u16 lnk_status;
-	int ret;
-
-	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
-	if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
-		return -ENODEV;
-
-	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
-	ctrl_dbg(ctrl, "%s: lnk_status = %x\n", __func__, lnk_status);
-
-	return ret;
-}
-
 static bool pci_bus_check_dev(struct pci_bus *bus, int devfn)
 {
 	u32 l;
@@ -467,7 +440,7 @@ int pciehp_card_present_or_link_active(struct controller *ctrl)
 	if (ret)
 		return ret;
 
-	return pciehp_check_link_active(ctrl);
+	return pcie_link_is_active(ctrl_dev(ctrl));
 }
 
 int pciehp_query_power_fault(struct controller *ctrl)
@@ -614,8 +587,8 @@ static void pciehp_ignore_link_change(struct controller *ctrl,
 	 * Synthesize it to ensure that it is acted on.
 	 */
 	down_read_nested(&ctrl->reset_lock, ctrl->depth);
-	if (!pciehp_check_link_active(ctrl) || pciehp_device_replaced(ctrl))
-		pciehp_request(ctrl, ignored_events);
+	if (!pcie_link_is_active(ctrl_dev(ctrl)) || pciehp_device_replaced(ctrl))
+		pciehp_request(ctrl, PCI_EXP_SLTSTA_DLLSC);
 	up_read(&ctrl->reset_lock);
 }
 
@@ -921,7 +894,7 @@ int pciehp_slot_reset(struct pcie_device *dev)
 	pcie_capability_write_word(dev->port, PCI_EXP_SLTSTA,
 				   PCI_EXP_SLTSTA_DLLSC);
 
-	if (!pciehp_check_link_active(ctrl))
+	if (!pcie_link_is_active(ctrl_dev(ctrl)))
 		pciehp_request(ctrl, PCI_EXP_SLTSTA_DLLSC);
 
 	return 0;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b0f4d98036cddddd88e2011da09aa6719b738651..50b53fc4092ccb6df2dc801b76f70f9df08447de 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4919,7 +4919,6 @@ int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type)
 		return 0;
 
 	if (pcie_get_speed_cap(dev) <= PCIE_SPEED_5_0GT) {
-		u16 status;
 
 		pci_dbg(dev, "waiting %d ms for downstream link\n", delay);
 		msleep(delay);
@@ -4935,8 +4934,7 @@ int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type)
 		if (!dev->link_active_reporting)
 			return -ENOTTY;
 
-		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &status);
-		if (!(status & PCI_EXP_LNKSTA_DLLLA))
+		if (pcie_link_is_active(dev) <= 0)
 			return -ENOTTY;
 
 		return pci_dev_wait(child, reset_type,
@@ -6241,6 +6239,30 @@ void pcie_print_link_status(struct pci_dev *dev)
 }
 EXPORT_SYMBOL(pcie_print_link_status);
 
+/**
+ * pcie_link_is_active() - Checks if the link is active or not
+ * @pdev: PCI device to query
+ *
+ * Check whether the downstream link is currently active. Note it is
+ * possible that the card is removed immediately after this so the
+ * caller may need to take it into account.
+ *
+ * Return: true if link is active, or -ENODEV if the config read fails.
+ */
+int pcie_link_is_active(struct pci_dev *pdev)
+{
+	u16 lnk_status;
+	int ret;
+
+	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
+	if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
+		return -ENODEV;
+
+	pci_dbg(pdev, "lnk_status = %#06x\n", lnk_status);
+	return !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
+}
+EXPORT_SYMBOL(pcie_link_is_active);
+
 /**
  * pci_select_bars - Make BAR mask from the type of resource
  * @dev: the PCI device for which BAR mask is made
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 34f65d69662e9f61f0c489ec58de2ce17d21c0c6..5368a27f3a208ce95d39752459f1029beea2fcca 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -228,6 +228,7 @@ static inline int pci_proc_detach_bus(struct pci_bus *bus) { return 0; }
 /* Functions for PCI Hotplug drivers to use */
 int pci_hp_add_bridge(struct pci_dev *dev);
 bool pci_hp_spurious_link_change(struct pci_dev *pdev);
+int pcie_link_is_active(struct pci_dev *dev);
 
 #if defined(CONFIG_SYSFS) && defined(HAVE_PCI_LEGACY)
 void pci_create_legacy_files(struct pci_bus *bus);

-- 
2.34.1


