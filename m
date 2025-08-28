Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A0ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH0s9yKloivepHo0VkuQk79EV0GNYwLeAdz+CShJbJE=; b=F5DZN6wsA34Hi90ObS8PQuP69c
	hr594asRNn20HeYKhwLuV11N5mQ/+UhDhBvukdGOLUss72dPZ7wPr3H/dCq790ow3jfdFoDMXQ2gL
	uneA4Kueq92czaK1qMGvjReosIGQwYxLyNH2pAU+AdHv6wQmVOwxyW/tkQkMiEaEyAUcm5J+6xfq0
	jHQeZIS275m+scwl8yzhKDO2porndpfWKw65hvRgASLqInYH0mg1IZA6/eaDCVvWk711OFOQ7MyHh
	kxc7NS1SLZt0zE8GM5IUb5mCwU2FXqhNeBbsgwBF273CnY7J/P0suGQiRy1JSh3o0K/2x6dzk1A4w
	lR5bPJIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgM6-00000002QdE-35M9;
	Thu, 28 Aug 2025 17:24:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbSo-00000001T80-3vAE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:10:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S6Be94030242
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JH0s9yKloivepHo0VkuQk79EV0GNYwLeAdz+CShJbJE=; b=YFL6eLAnQBNb+9ji
	gr8NtTF3af7ZhnHWqNHsuqr6nH0oARxi4/mF0MLythSKjNyUY0JY3FUlU0iiRZ5Y
	UHo8IbeddO+J0HbiQ2wxQXbWXFvX11dYQ4n2cSGXZ8b37k1M68mrGoL7KHKr7O0o
	LMMWhUHzh9wINrtNTnbw/7xDK7ENia3z+DWC9oxCKY4BJodnYKsvqdpDjDMX6Zqb
	E5u+0qtkfggWm+j+/NBQ9m3Rrci0MFVu6Vg4C4Rrp3/92SxWahU9xTF7XiGx18xm
	TUihd40F15zf7/aX7a9UOR9BW33l0k5qEdannLyTfTQy1qCrdYqFNLPLsUJp1eIz
	Hg0tiA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unyyk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3235e45b815so1088601a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383045; x=1756987845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JH0s9yKloivepHo0VkuQk79EV0GNYwLeAdz+CShJbJE=;
        b=lpMOWMrmy6AXapVEtC4MuX9mK5yKvnkNP5p+ZXMnheCycpETVq9QU0XL2ZlWpEAie3
         W/cCXWKmrkgL/e4MIqZM07kWgNBXLH/MDBDsl/MTBmC/E2YSki9HqFx1kct/LhZ8Kt0k
         q8UsQ9pkPRCqClF5xi9Ap2NzQTy/ye9qkaFabNHYWWGY2VAqAWq4dDhvjfKaQIDff5dO
         sb2/9rbNxRLk8mnxOnPteGVIzO8wZRDzVRqEwvjoO1JHZDGiK1sq2egJpAZVWYdSUkc/
         S06e8FNziMdZ5YvoSRncyVxDtYhBIW45It6b3yGdicJ/vzKAYmyPAHh6d39mnY5SMUJh
         m5sw==
X-Forwarded-Encrypted: i=1; AJvYcCVHjWb7F02G/mRsYfGAk9SZHsv2xQZBgztlAx4BOa65qgsOolbDJdKLwHp98SMzE7xe3/CGsg8aQLKTFctKoCzY@lists.infradead.org
X-Gm-Message-State: AOJu0YzB1+VsYLNPMOraFcY4mjXbu8z9Vx3HoH0W2UK7vfKaf+o3YMS6
	p9QKVDlh5H4cwhOi/FETvJrjIXD9QH05DJMgm8GuOO6eVGddPzE1VOF+uTS7SNjW90G5ENeRHWl
	tFtUmkXgQC9ZTp3uBvgfrtfgOQhX25cdtRyMSQf6xxwnq5ukk5T71EGcfQO9t+DgAwSRd55GVCj
	jMeQ==
X-Gm-Gg: ASbGnctu6nZ/o+h4ajAE8Z5T5Lu7hORfo6jIroRE9qSoU8DCLczVZQEBkh5AoZHOBzJ
	zCl8rDxzfcLuBML9z9NbnhqQcRG7SNVEDyvf1RUnX33QXH0xO3+AvAopnPvohDo/GT6q1/5ctY0
	95nkSoZv0lGDqGRkQc9ssSH/sCFB5yrIv8dTv/Lw65usgD/J472kAskS12ww/K42doUBUyLiGTC
	uFVVrAtbGh2hssAwu/0On1L8mFrxMvj1QMzXXqltgHYs2FjxAnGUHTBZtubxJb8FxbD7jcGC4tw
	R6aAUiOCAuDMuW2c54uCqDPHNLhxHg0GbXMWvNrqrTRRuPUf66anNn0ChVZKkEsuytbynu2USRM
	=
X-Received: by 2002:a17:90b:3f87:b0:325:55cd:9fd2 with SMTP id 98e67ed59e1d1-32555cda0a5mr25083451a91.20.1756383044326;
        Thu, 28 Aug 2025 05:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh+FZuvrtHdatmZz9NFDOZX4EQHu2edGUNAKaj+LzwOmKyiYcPAJDdxI13V2Rm1b4wPERPWw==
X-Received: by 2002:a17:90b:3f87:b0:325:55cd:9fd2 with SMTP id 98e67ed59e1d1-32555cda0a5mr25083377a91.20.1756383043588;
        Thu, 28 Aug 2025 05:10:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:43 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:39:03 +0530
Subject: [PATCH v6 6/9] PCI: qcom: Add support for host_stop_link() &
 host_start_link()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-6-985f90a7dd03@oss.qualcomm.com>
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
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=2834;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JLQioafU2Ha99tn/qTONrjpmtaS25D1YyPb7oDSQVMk=;
 b=3DLBa9Wbs2xtxAeBnSSZORHDlNgEkMWEmLEKsGR45JfGAYrdxo+fhjGG2bBtb8588SB4Y5YZO
 4i8Je/MeHLkDoxHV9YbpJJiY9H4K1KT7rOrj+Eb0UGwJkdPegzEFR43
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Z6Iksi7yeKNT6xi6hS6AnYwfyW9UqYdK
X-Proofpoint-ORIG-GUID: Z6Iksi7yeKNT6xi6hS6AnYwfyW9UqYdK
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b04746 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=dstPO7x8LWyc_yWpthkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXxHVBEcuGtZVY
 NInPcGqacs+KExA0eTFYKYoRwIFoVI+TpbrTdrYT4Ma3tDoA2yC69fPtwivGOEB3XL2aH/F24GE
 9XPIuqJJxtHLsab9YpgruNPM5QmlyE82zzPakOZcTkEB3IF89GzxV7h93BzfKlYv2T0lSWCHQfZ
 AU2d+V1m3Es43z05m5vstAUm0cl8NpOEoyg/LPZjGeJ/ve9+3wrYr8VBsxeIXohK8M44y+Fs6zr
 1ZvkHbXQHQNHLu4elas9IO4YTWLfkS0yLaZdbU0Q4YKHHYoeSK42IjV6itsuWKz+bVl/Rrsw6+g
 sNdv7bOQpe4ZyAyeY/8NL1Zq6CGNHV669h33QxAjYOUBlfekcy68wBCdq2UVkz4+1rD72PpeprO
 9uIrCwW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051047_102203_2D9F4070 
X-CRM114-Status: GOOD (  16.45  )
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

Add support for host_stop_link() and host_start_link() for switches like
TC956x, which require configuration before the PCIe link is established.

Assert PERST# and disable LTSSM bit to prevent the PCIe controller from
participating in link training during host_stop_link(). De-assert PERST#
and enable LTSSM bit during host_start_link().

Introduce ltssm_disable function op to stop link training.
For the switches like TC956x, which needs to configure it before
the PCIe link is established.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..8ec76fbc0787ae305e9c63eb82fbc999d197a123 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -250,6 +250,7 @@ struct qcom_pcie_ops {
 	void (*host_post_init)(struct qcom_pcie *pcie);
 	void (*deinit)(struct qcom_pcie *pcie);
 	void (*ltssm_enable)(struct qcom_pcie *pcie);
+	void (*ltssm_disable)(struct qcom_pcie *pcie);
 	int (*config_sid)(struct qcom_pcie *pcie);
 };
 
@@ -642,6 +643,37 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static int qcom_pcie_host_start_link(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+
+	qcom_ep_reset_deassert(pcie);
+
+	if (pcie->cfg->ops->ltssm_enable)
+		pcie->cfg->ops->ltssm_enable(pcie);
+
+	return 0;
+}
+
+static void qcom_pcie_host_stop_link(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+
+	qcom_ep_reset_assert(pcie);
+
+	if (pcie->cfg->ops->ltssm_disable)
+		pcie->cfg->ops->ltssm_disable(pcie);
+}
+
+static void qcom_pcie_2_3_2_ltssm_disable(struct qcom_pcie *pcie)
+{
+	u32 val;
+
+	val = readl(pcie->parf + PARF_LTSSM);
+	val &= ~LTSSM_EN;
+	writel(val, pcie->parf + PARF_LTSSM);
+}
+
 static void qcom_pcie_2_3_2_ltssm_enable(struct qcom_pcie *pcie)
 {
 	u32 val;
@@ -1435,6 +1467,7 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
 	.host_post_init = qcom_pcie_host_post_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
+	.ltssm_disable = qcom_pcie_2_3_2_ltssm_disable,
 	.config_sid = qcom_pcie_config_sid_1_9_0,
 };
 
@@ -1506,6 +1539,8 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.host_start_link = qcom_pcie_host_start_link,
+	.host_stop_link = qcom_pcie_host_stop_link,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


