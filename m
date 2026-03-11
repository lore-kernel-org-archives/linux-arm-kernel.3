Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A045C1049515
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=; b=XxLdS3hmQLSnuluif+T76Sj2rA
	7gCr9SBXexMReH4wIa/o7/W2kRUYCWOlB/GWsmWoF0VwzXOS7iAe3FewMdTt6RVL+QsLXQigwW83L
	aYitivXW5kPKxBA82wHSEsdZ8W0A+lVBNyHrBRy2IsYozDeGx6tRos9GNsz/tS2DLDN2ZHL9oxZn8
	XY+cRw40k5ZcdNH7TfA7Z8jK+neYT3VNcfl4XSEGmcB59gT3lPXWoepYhbg1g7WkP0A6cZ7L5XZRs
	XvKlp8H/X+uj+LmtE6E+VTOJzcnm5zznHMU7fVtIHcPOYW4Nm/ZZAcXhUStPhsst13HWDvfwef7k3
	v7h4GvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GmW-0000000BQNk-2ZR9;
	Wed, 11 Mar 2026 10:27:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GmU-0000000BQMQ-11to
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:27:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6hAjE2676536
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=; b=npOBf5EaqDgpNRp/
	eJChLrp+bcqb7qUFw7PsXocRwTdCeZjkLZ11TegHFzDPY0sT7MtX9fYrUXyNcH0f
	daT4UdxHQtkBaPboSxi3IS804Thcb3CTRw5X352M3rLLLB91huy2yVN56JUKT6Zk
	yU4HeEJVvoF7QHSTHYYU9pbzXXZk1P62dhnIaK7am7FTQCpVAmdzyinqOkQNcYR4
	MAj+eu4mzuWUI+LdIcV28b+NLXgSZN3xl1ayGn2kByH9eVMreO+ejYQ83pI8qXgc
	dsyM0NhRCb1b0jpZHMqfeFWW2yzvdw6GCSgBvkAJgQZtaWnIngXaOVm273F1uPjU
	xq5fsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd0vvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:27:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso128526865ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224829; x=1773829629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=;
        b=T3HneJvHnRK9lUOkcbdoMPfiWwUopmnU/reaD+nHFyUPHbKAmg/DrBrzdxiUb98hf+
         OaLXDKHUBWc0iTttUH9yeQ5TW91C7XbW1yiiJLr3uvnpDKrSAkozvJfN20dAJHPFEq1f
         A/3oieshjfVZbeNJlsAc6FdkxB54sdG2Sed+MDsoXst/OFoaEdSXsqTJMMlhS9ykSqM+
         nC1O42nWcnPzNGM35JP+4ez2R504szcNEfuOudNDT3S3V5qJcwELVJNnoU3x4mEUFXMn
         r8r3O9sYqNlxe6r/Dj/WcKQoaGKgBFY2Sb0TQPOO15Jd18L8xym17GIt+9v35ODWl8/5
         WiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224829; x=1773829629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=;
        b=hBORYXU36GCw/bhVeOUI8p63GPa/LqIGgX4BvcfFmND8VFgY6xkP8Jjiutapg/QZSK
         +7eReliPMsBoDGKpKGYhJ+rc6uRFZSCI6Kwu/upqGGDltKyJFE3SBaNhpdbB1xRKH2VJ
         loNrszSDo0hz8kevDJ2Dxbag0pikFNMvPqknXIj8JxNZxjMvKAmlNBzo+WZ8FS/EJHEV
         +Cje9xZhg4GiJ3LEedwkM/bx8GoHqfX6zIBxX4BzWLB1qTzGcEjDm6gwmHIBAy5RFlFY
         VFZciMC6eDNkS5isexYCAJC6z+ZabdKuGoDdQhMLZ8FwuTfQYbKUog/7FvoWB+4gaZFi
         8Mkw==
X-Forwarded-Encrypted: i=1; AJvYcCXoURh8VqkD5/c47aZaHDZdEihUwXVrYrtT6xLOF/RmU+4cWDIL3IY/wwJrwjnAC2mWNDyvItzq5B21bwyHDb8w@lists.infradead.org
X-Gm-Message-State: AOJu0YxitfzRgE8g8vcLbds6YMjjgJNNcj+/PdmnyWGQ+l39mmpHLNlh
	d2zECBA9xJB2MPTp1d4VkWWmqs8YhdLOP4USIMUH8ko+Aj/plRQzLEB1ayEmKJ8SIiiK7bVKhW0
	OZmr7WIMhbclsSA+JTQ0MApZlVWfliaGLzHrytf6EC52cwRAe1GzdnXkV9in0Iy+tI6ucamEDN7
	kGQUfwAQy7Kg==
X-Gm-Gg: ATEYQzzxOJ5MyQ+nR94RGiqKRaUvj3DCC+T95mqkU72aOcMfdzgZEqujuLx8Tz/z+Tu
	lJEnldYtczRYEO1+D1XOjH4NWEBkwlRBllLP+x0sJy+2s9V0RqertNiPCYWN6xqVHkZEO72WqMn
	uxngR5PmUIAqbi3d4X4JmjU0vtf0bKYEWzLI04rBBqqBB4/bqzT+GXCLVv3y7tiJqCnxxtxMkkb
	VTak3Sd5W7096z0yUQyrfVzSAlZm3uO1OF4Qkr6zfsBNRWd3r4XbeD9rLj3mvb3CVRX4VI5U8SO
	ACZVSIW9N/Ao3VEtRUAd0PyXBFw3Dz3+gcCDbaojg8bh9PsD6zlg7NR2XZ9or+yGerKtvmMdXlG
	1csgHwy05KvAZKsD40r9mPhgO6fQGV41K5cXgzz4LGpPsC1zj32LaLvhx
X-Received: by 2002:a17:902:e784:b0:2ae:a73c:f773 with SMTP id d9443c01a7336-2aeae8c5744mr23019245ad.41.1773224828678;
        Wed, 11 Mar 2026 03:27:08 -0700 (PDT)
X-Received: by 2002:a17:902:e784:b0:2ae:a73c:f773 with SMTP id d9443c01a7336-2aeae8c5744mr23018885ad.41.1773224828202;
        Wed, 11 Mar 2026 03:27:08 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:27:07 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:56:48 +0530
Subject: [PATCH v3 3/5] PCI: qcom: Add .get_ltssm() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-d3cold-v3-3-4d85dc7c2695@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=1941;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pO8vVScrKCYroJtbrmCEg0jsQAkeOLwy64wLlBodYLo=;
 b=mBoYVYbl4in2XbB3yxFCeM/XXBIXcAl9LHDpdikA7pS5QlbwM886Ekp6fjfgzZwEbo3PkVfPH
 g7ToHnyZqlfCURgd+My7B1OtZ+2Bc1yVqPNI1oQScXlvgARxdS/DGgf
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX8Jb6g4rRVwSY
 uJ2J3N36gxVeqYd1O90nfkfuMY76U5+jLmylW+SNQFoQxYy4xFlMdwRTc+pxq96HNHejlxUuiuD
 a71jY/V2WCI+KdeD7d4e8VwdDzlcQRC/tHAnPNhBEwGUssyUQwmEjpbBf67Zkm5p/Df47gtOXBh
 nfd7HG4YLrPV5zzbMAjTGyGMbvcQbs4KmMP9bdPPYjOjNqXD3ix8jJmytLpWKNzYH75SuSMys+v
 73y/1XOlxeO5fv/wHqjF1PwVwOKEn0JbwlScjNMIcr7EsAA0+bnbAd/sHs1bsWWU5DzeUIb44Sp
 5x1oPr6jXxjxH2+lsLWMHWqa8bqQhbG+dPUBSKKhrSxywrqdSDKmxfW5ou6vuFPoHzY3ImrM9vk
 prItv0HO5f0Vvz9SVH4yU3epy0x5x+KnOmyyP7q6l5f2wkNyQ3qOZ5qf4xkE1z0fk/rh9jFK6YD
 RBQ5+jWTB5BTRHEhk1A==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b1437d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: RCu1l1fb-nEpUGIQfbpqr2dGzGLiSM9A
X-Proofpoint-ORIG-GUID: RCu1l1fb-nEpUGIQfbpqr2dGzGLiSM9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032710_297393_85FA3194 
X-CRM114-Status: GOOD (  15.00  )
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

This helper is used in place of direct DBI-based link state checks in
the D3cold path after sending PME turn-off message, ensuring the LTSSM
state can be queried safely even after DBI access is no longer valid.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc75fca1b123e70715e692a91a9135..b00bf46637a5ff803a845719c5b0b5b82739244b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -131,6 +131,7 @@
 
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
+#define PARF_LTSSM_STATE_MASK			GENMASK(5, 0)
 
 /* PARF_NO_SNOOP_OVERRIDE register fields */
 #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
@@ -1255,6 +1256,16 @@ static bool qcom_pcie_link_up(struct dw_pcie *pci)
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
 
+static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u32 val;
+
+	val = readl(pcie->parf + PARF_LTSSM);
+
+	return (enum dw_pcie_ltssm)FIELD_GET(PARF_LTSSM_STATE_MASK, val);
+}
+
 static void qcom_pcie_phy_power_off(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_port *port;
@@ -1507,6 +1518,7 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.get_ltssm = qcom_pcie_get_ltssm,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


