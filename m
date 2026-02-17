Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0750BE68173
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UqZI7iscHApYsWoxbSsIfOsBYwdXDoKOyc0XcojPzw=; b=k5+JPnBXrjPtCvYygZdls7pdzp
	XQIjh/3HL/w5WZY3FjpQ210BA436FQWBfac6DyciyXKf8X+xvws618iE5YnriuETNRveI6xf3IU7/
	IV/P5mr0K0e4XtrJDtmWbjfeEUgxMfh7YuqctMirAds0bljviV9VOye5q0wUIHQpqSeaCp4eaJmpR
	XZ5U7YweySbjQuw0Rs8XQ0dw+1D+3L5wnDea9NQITy1O80hxQISZXFDgHTU4VUWb7vY4LU2vUGnGN
	/EV1aVilIFzuDB6aL2GGduOd/E/xeYXZzj4O0/1nB1By334tw5j/jE0l4w8Q7dBcK2m38qFpzqrWw
	mQ8Ja/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ74-000000086IW-28dh;
	Tue, 17 Feb 2026 11:19:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ72-000000086HA-3YeU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:19:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAA2Bk2803486
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UqZI7iscHApYsWoxbSsIfOsBYwdXDoKOyc0XcojPzw=; b=WDnVMHKntMf7wzZf
	UJmFZWlfxOYLtbv4YWo82GzWA4NCgzanGcG2qFwa0HbXJjJaS51lkTfLard1TyNB
	urMSPCD0yIvFwxvT5j/qDX+vbeBG+xXdGSFsb2U7n3G42uqPWhBO+FVb4CG/D4ii
	dJP/+CpkgPwLgC3QQ/174RtPO7EvdEauzKirHDx+W6kWxKxQSW1Mv/Hpa0c0JPEA
	F6NIgEmAzimJJETKH1iZhhD2ik9O3l2VbvjaEfdugAc6oDWGkdPAcuo9IbtmKHMI
	iXyf5ixXPu5ajFX7oMKqpORlwBC2PFJVJQ+suIC1lBbD5wqvT8PO9ASZwTyWNpUh
	zfc29Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxuk62c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6de06e6c08so3028112a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327167; x=1771931967; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UqZI7iscHApYsWoxbSsIfOsBYwdXDoKOyc0XcojPzw=;
        b=S4JfOteASZMCcfK/yFZrd472Z/Wu9CH70FqUPQDoTrR+Zf6jxtpfZRQPgnxWzN2cse
         kFAC7QU5kqV5xtPpt06d8nJ+lGsgu/pOdtbUqpgc7+zbN4HH11HNxmYRJaXLJxc4D0er
         hzSLuT1ZYFARmIPEsUaOZOzgFuUZYhTKjw+Bj5L/WR6K3H8e56u7ZqOs+mud6H+Ty+V7
         v/GGlLj0zxevZcI+s2kwUKp665ygEg1N20IjG2rcxyrjAb8ag2VQxdE6sWEVEDhwPkjx
         NfJnyvPIE9WoIwHbXBMYIOweZnm05eIeB7so8e9d+w62F50Xj4bi6xeA2KvOPDW3KDW8
         BEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327167; x=1771931967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2UqZI7iscHApYsWoxbSsIfOsBYwdXDoKOyc0XcojPzw=;
        b=WzYIoCMUC2YccHocb3PzfHXvYwmkLIDFYQHEpyfp3YMEb7Ky+96a1Ve+zmmBltVjMe
         vflqY/ataoKF4ogk8uGnyPaETJN+bS7ijqLWQQVjIjyFtpf8PPS43J4FIBTN5uEt12DK
         i8VG0ezEfuXuW/wI4/CxrLD9URCMf4GTK3ZRCOuBCDjlOUY+Cti/9Hrw32WcBaON92lF
         c4NdxrqfmVF1IUGtHpYO6TjFXw3Jj9uFXicwP1NDqpUWZeOTJCU/E9W2sMl+8xvy/Phb
         y/NkptQOXd/0o+3e7/cF+jWSeMP/qiM9msZRig6vdkFRrd7Z7ituFYyoL1nO71S0HwjR
         hUvA==
X-Forwarded-Encrypted: i=1; AJvYcCVPHMdiYZxy+o6enTkQ6myB/u+5dLstE3kmjU4HPErBQkEsEJXWKg6tulfMKI6iqL6XpPAhaknwGh96qtEzBaBL@lists.infradead.org
X-Gm-Message-State: AOJu0Yybu+FdHggRDNcgzmhuWNw213pkObjHDKNwIrSWbHV1MULlfDLd
	ERLc4R7ELRa/syULHAHxfIrCp7HXCqkWHeop+8wHemxlDv+KZTucFjOnPXjq0HsdyjEoQ3VLypg
	04NIQeGvGm+GLfHWEEdMl9Jqk0QxIzfvibBlM8NGmDpT2rMie3SQ0nSlRQ8wcLQPhdqzIO2W2Mj
	HSIA==
X-Gm-Gg: AZuq6aIyPrTjU23M4Lkd5CQMsLXNfbIRBOw4D8MPli04PEmmJalbsTW8L8KBgDz1Vcc
	fzkFjmJJvWI6PxI4Qk3aT/JinwoMnuz4IC5hB4Hp3OqbLPNGQynFU/Yj29FXaGoMYo3HPBHeMO4
	iHfUE9dIv3dhG5NA/KxEUvwqfYRRJVUi14g5BXyV397oRNJ/MZx4VNFVVDfkz968bUFXQpMFB/6
	P1nGcptSADsujj49E1HqWGo0IYj5RIHLspJk2FB7FICRzEIDOyM+d0po8sN4Tm2qyN8PwIlgOm4
	LOZv/L2NlaLq9av4G0V+mXtIqq2vecrLVhSffs5y2IW97amNr0dWe0jxQxiP1Kfntnn7IkXBml6
	i8PnESG3g9WG8fCrsyeoOP52Ydm+D0q5gnLkMNZjXf6jtQiqXIK8ZvMu+
X-Received: by 2002:a05:6a00:1d9c:b0:824:a8ec:ed51 with SMTP id d2e1a72fcca58-824c94defa9mr11493629b3a.27.1771327166769;
        Tue, 17 Feb 2026 03:19:26 -0800 (PST)
X-Received: by 2002:a05:6a00:1d9c:b0:824:a8ec:ed51 with SMTP id d2e1a72fcca58-824c94defa9mr11493606b3a.27.1771327166245;
        Tue, 17 Feb 2026 03:19:26 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:25 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:49:08 +0530
Subject: [PATCH v2 3/5] PCI: qcom: Add .get_ltssm() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-d3cold-v2-3-89b322864043@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=1721;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ZcPk/Vi6V1NIpnr+WX6LGNudzcSd+NdHRwSIluMD/yo=;
 b=wlf3BtLYbA0NMXS2gRRkF9fo7E6YylcdKwmuOeuLWkmOYXxzeUzOvslTykYolcdSeh7TY+Q2k
 oYWx3bF2miTC2jawLmAMHHvoQseCHBVoL4fWsMIbES9uNXgRXzf+7Hv
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: yqscRlkmoCriap1S2jOplDmYelof-kYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfX3XHV2cqDe1du
 F+rGldeFRKZVpQqPkGxcw6gayWvBf07R3eIO2Yblm6aBmMFC4lrDy9FwmkIFp+6SknU4osd3tZI
 FHgr9kEj9HRVELjD1Vl5SsXeCh+eRsexsAU/M8vpP7g8VGdV/lvO4x7XXAsJj0uhCQB+O0qOPFj
 CF0G9CvcDf0sJyfXry2dC7n2pBr1N5jjx5YKKpr3eGjdEw2fslf6d/FRdatfF8+FMAz6wBvvu3/
 OfrCBNRAtFSTC8UK5QlLBGybzK3tpEusc4ZYFgglmqlHx4g9OsCSt5uEne/m7Pwsimzht4OyLAA
 uOiA12po7URcq/Tw11A4HnkjAQ2v50ZD5TjW9keHgRJX6IqxDavIyQCdf97wXogmOCmPs/D82BE
 IWMtCmFJdwpq3T7NnqlqczWD9E2Kj6XCOeSMLC701P3kjBsV/TXh8QhhImeUa4lA+MPKLZ6YklS
 NR6bMslr4e12Um/hY4Q==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69944ebf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: yqscRlkmoCriap1S2jOplDmYelof-kYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_031929_010731_A113F9F5 
X-CRM114-Status: GOOD (  14.29  )
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

For older targets like sc7280, we see reading DBI after sending PME
turn off message is causing NOC error.

To avoid unsafe DBI accesses, introduce qcom_pcie_get_ltssm(), which
retrieves the LTSSM state from the PARF_LTSSM register instead.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc75fca1b123e70715e692a91a9135..2c4dc7134e006d3530a809f1bcc1a6488d4632ad 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -131,6 +131,7 @@
 
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
+#define PARF_LTSSM_STATE_MASK			GENMASK(5, 0)
 
 /* PARF_NO_SNOOP_OVERRIDE register fields */
 #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
@@ -1255,6 +1256,15 @@ static bool qcom_pcie_link_up(struct dw_pcie *pci)
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
 
+static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u32 val;
+
+	val = readl(pcie->parf + PARF_LTSSM);
+	return (enum dw_pcie_ltssm)FIELD_GET(PARF_LTSSM_STATE_MASK, val);
+}
+
 static void qcom_pcie_phy_power_off(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_port *port;
@@ -1507,6 +1517,7 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.get_ltssm = qcom_pcie_get_ltssm,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


