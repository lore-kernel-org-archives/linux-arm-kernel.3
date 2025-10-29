Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3003CCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgL5OSB/LlXjPB9KeMiUSBoV579HCQc0pGIvC9Q0kz4=; b=DlPPRVRxfrWcaIrAE3TwQPCGTM
	d//8qiSLgG3LAGv+c0dayL6h0o8BXwBn5sWvVaFMtKPfP7TKEEbZ0JoI7ollReCbl0llNp/bz/H0v
	x2r1YUr43irvc4Fmt5pI4xXQf4YaXE/0m/1lDBrnqSAKobmg+w/TpIPEYuyb2En5ZDytwAQ+PZ5z6
	CmDuZZUgZMZTO2bJs88SbA2LJrLfbv/FPcJtjgRhFZp2MPm2DGLYr8rCpbUsFvgtWuTCYjL+Kw4UX
	gogTMJhvzipxxYn0KlhOLMJrcyA1pSBCS/4nmag13U3l1ucgJ4YYSOcakaLSZLHgrsbCwSOrj+pqO
	1Yujg9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4O8-00000000zYl-0MHA;
	Wed, 29 Oct 2025 11:30:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4O5-00000000zXD-2pdw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:30:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uski3720370
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgL5OSB/LlXjPB9KeMiUSBoV579HCQc0pGIvC9Q0kz4=; b=DE69YI6llUWPsvdK
	2eEaivv2B+oU1s0fHOyUrUwZBJdarFBCVjWLHZYtcLoTK7h5m3KlYMIXwvj6zsdI
	xSpb3IoDHPtvZBo45tVkz5WQhfslR3J93W3WCFpQWPdVwSRC0iAJvjPVR7l4G/pv
	mq5RETV1+hreNoGarS7JNhQxu91bMraZkFmCuCALwe/Tv/33YLUjC4xwonJESLJL
	P0buCBedKZ/I9MucD1qhuCfw1uMahv1TFg37cKGmSph7w0mj7lq3SgGW0QEhLFoJ
	WVYDvwxxIqBKoFIQqCViDqAHWnauJME8QfgvTall9drvcjZ3Mvg4E/ux5CDuNIiJ
	GclK6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a22caj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-286a252bfbfso169689675ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737444; x=1762342244; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgL5OSB/LlXjPB9KeMiUSBoV579HCQc0pGIvC9Q0kz4=;
        b=T/Tp1kbRc9dpJxkWzsp9dNrLU3a9QwNBmbtkWQ2vxCE/gjIHAakyf0/R0Kw/3b0qgN
         qnSswxlA//UqNSLyK0clFqnv/+TYXMMV353lXv/Gpn4m9+jakKtsAC6KfvSEiLc0br8F
         9aTrXsucIkwqmuapsGxAo8hO7ltuHMu9DjKA4L6aExNjYxpTS6Gz4dxfUsJohn0cg4/L
         vEZfI0XubgPzqzEoahrlQmc/CsPXb374Rxha1GaXgn9i25RVI3UimyLCLPyCR8se8PEL
         xvfMwv1Kehb+UEPdJWL6rZOfj89pcWTMWf/GfmTIuEJiOGsnA19qjZ+r4mpGAN7hPb2o
         Ajig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737444; x=1762342244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgL5OSB/LlXjPB9KeMiUSBoV579HCQc0pGIvC9Q0kz4=;
        b=SmeztKVzNB+YhhZn0WQV6XYr0O/7D86s2ay0xHT3hOKPlvPyfd4bLs8wFZM7OlewRp
         8ZJu0KwcqrMYTn+nnI1UVdCiDHf7UqFM2L81OPjW7ZYBk3hQYlId12UtI0yQalEgaKoq
         Px1x4ZDZza+O2/A9RLuZtoZrSW+5a+g3Ed0EsHjV0xVhvGRTmY7Viut1WjLwCdR0grru
         ROr2IGlGUd9ZVmdfAvgWO9nibcS3kyJdPK+A7R+P0wCJOw3r6hdtxC94EBotH0aCXV+4
         AsrMhXrInkHQc/l6D7D+eKyaVRqUB7fpG3RzRW9nyw2sCUFC7z9pCIBzgWU4DGm1l6zO
         4D7w==
X-Forwarded-Encrypted: i=1; AJvYcCUPJPw3KRnyhMWGu9PnP+yqB55VGLI3VVe+evT3sVOwNlyJvq5QGg4ehOLl0wwzAmCbwmTsSI8Jxk6/SLIUXibq@lists.infradead.org
X-Gm-Message-State: AOJu0YyFxuzIyWD9nCr5gSluPMIYDUVrvZanVNGEHKEsX8jaiqOcODNy
	GyZJVzMo5twNJjwh7iI6hPslzkbvG95mbxK+wp4den2GnAEq59ZHSDqhd2VgCH/xk4Fbo6Bq/Yq
	kLU2tIClKxyoPuVdaZEnh+3KkDB32izrYh/VaN0NsBmJZ+Emj5YNNmW6viKJBfgoaE8Ql+VzFUb
	sq1Q==
X-Gm-Gg: ASbGncu1dwrlSBWq5qyoLF9G3zmULCF+Vgo91g4PuikolV0OjZOjcCvYDDP4flU0lz7
	f3ViVaT4opK6JPjpWBIivPYYuFCxQS99nlGMohPAyXOpB+p4SYnPW2fs00G3VIVERVGdiOtWeN3
	MHIRmgB31hMMQ9n+aJiEAaQQWVOfw638dztlwgUZfiY196DXJSLdGiosq4giQyLfSMXUI4lCDpk
	stq7RFM3HFVbJm5BVXHjoNa4GhPU6EQdTIX56CnkRGzzJTVDU8rq+iu6JdXpC6ASdRgIynd1Juw
	IVqxJ4NcCjdtxz0Yw3jkNrzOm+jiBxo81BWsg3q4YvfNcXi1u/xR5iVSIW4e10SB0T0y654UuBF
	ljZY1zTrZQI7YntT+LmBC2U79bmKgIOxwDQ==
X-Received: by 2002:a17:902:ecce:b0:269:87a3:43b8 with SMTP id d9443c01a7336-294dedfaa82mr25711805ad.4.1761737444099;
        Wed, 29 Oct 2025 04:30:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJyLsEMvXCp+Lqhoe7+83sMpVNkVgslqDw8ZcMIT25DGYtnSJn9/5QFnN/lFGONxEq1y/8ZA==
X-Received: by 2002:a17:902:ecce:b0:269:87a3:43b8 with SMTP id d9443c01a7336-294dedfaa82mr25711345ad.4.1761737443407;
        Wed, 29 Oct 2025 04:30:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:43 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:59:59 +0530
Subject: [PATCH v7 6/8] PCI: qcom: Add support for assert_perst()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-6-68426de5844a@oss.qualcomm.com>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=1479;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=/0zY7f+/NmNwlOKeDfkudP6y0/Cc6rFCysp5ws1L2xI=;
 b=2/MPQfCzaTDI0jwXow2vCfR0h4ZcC1BUmVn3V0PWdjPoconL51iUp68mvJ0BgnlrMSeD7xD0o
 YPHpHYrQfqCCAqgUT9fjnXTawRabKEUkMc7R/ELwb3T9v8filKJ4cfO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfX80kxLxRynk4D
 XTO38iV4D3CPS9Q663uVbGIasLp8F7NGXAG7WedcINFmwvmxN3cWZlM4Xute4JbMNk+ahA1n6d4
 cb+jYsYzfcNjojOzF0235qgdrquiQwUxZk8jPzMxdAjIt8Oq4IYj6gjkTA9tsVOttcv08yLOKye
 eWBp1lSfpSEY4Egl2NLaNcuXP3InirpWSHi5asZ89fRAuJBY2YeBByZaE6nFuClKv36vTCV9f2e
 QAAnOnuKMjUyAAexu2SOK4qdSYh0e8QeiyNS3mhyzrZPUHrETDII/lorPO86aIKmglWGy2SXZA2
 joaKKWh07VqLt+IJEeDX+8700PeylbEEW2q6rTMO4wbFZs7mC4wzQABvinFL+PWD1Ck3NGE3buY
 AIzgw39YrIMhAWSrImf75ai1T7plDQ==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901fae5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=j2XxTBISUlk66HYKGUMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: UMSB5FFgQZbBFEHr4Zej-WQ0CAN-kcG8
X-Proofpoint-ORIG-GUID: UMSB5FFgQZbBFEHr4Zej-WQ0CAN-kcG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_043045_733623_A2EF95D1 
X-CRM114-Status: GOOD (  16.23  )
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

Add support for assert_perst() for switches like TC9563, which require
configuration before the PCIe link is established. Such devices use
this function op to assert the PERST# before configuring the device
and once the configuration is done they de-assert the PERST#.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 6948824642dcdcb1f59730479b5a3d196ebf66ee..a6ebcbc19d3c8b28bab53f516ae2a2b42701ca6f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -640,6 +640,18 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static int qcom_pcie_assert_perst(struct dw_pcie *pci, bool assert)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+
+	if (assert)
+		qcom_ep_reset_assert(pcie);
+	else
+		qcom_ep_reset_deassert(pcie);
+
+	return 0;
+}
+
 static void qcom_pcie_2_3_2_ltssm_enable(struct qcom_pcie *pcie)
 {
 	u32 val;
@@ -1448,6 +1460,7 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.assert_perst = qcom_pcie_assert_perst,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


