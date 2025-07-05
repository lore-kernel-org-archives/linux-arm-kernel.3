Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A47C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VQQYkVndGStCPetb0u9KBpkX6kw9yPI24YEYcxWZEdI=; b=dvsfP9fPy+z16d29drKqbyX+OG
	PXxx3ylsdUoasCIhfy4ZXceu/trI5WzooNzvIDDlbhRtVCZR9A2BsSxa9D9ZQP2hYQGSwQVsBTGkR
	hg535aILZ3dlbfZomyJg3Vq3K7cKNyI5kg1xfEZdchGWOljik8FhLq2DWKaSSB6mtTC1mYWRPY7Et
	cRLTW30lWUiYD+HMH/8EBs5JWkslThSCEHy5wYWwN5hUWbjJVSnX2nhEE2TUzzPCp70182zQX8lUC
	dscTVVS2MwFzAzee8kFwEPZKEhAwOnJC7H2tPXZAf0ppDMhd5eaZU/qdJIdYqUWmJULeIFMCJ8xwl
	qE4ZFG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY5Tl-0000000Gl0W-2E50;
	Sat, 05 Jul 2025 16:11:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY5RQ-0000000GkvP-34ix
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 16:08:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565ClOCc018958
	for <linux-arm-kernel@lists.infradead.org>; Sat, 5 Jul 2025 16:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VQQYkVndGStCPetb0u9KBp
	kX6kw9yPI24YEYcxWZEdI=; b=Qti5XGev3wB1tQ9SAzU+dV5xT98VKholViCmqq
	yIB2Tu+/ihCmC9cabslWbqFrQPI6J9bR28P4m9n0nrfvBkbkuVEt0CpHrK3ouUgV
	dBIz1M22Y3DrsA3m7fTCd+jkHxlrbjgzswnb7kCu9rraGE+1xUW+g7LfffMTeQAZ
	bjl5N2zlYCQ6GL4NTtf4cjjOWtSSrfUaS7PmVZDBTkdrUIXNLFDPwwP2N7juCpxz
	ctDHXqIHXJsgQz1D80O7js6ddYQ6j0GMwhmGcbAUD9FcGYfqQnnP0qHx5WFa1BuB
	DLKYJ4HhKebjwPjnK/Ab9Vw2SpPHk1n38t6Jnq5TZb5De2Yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ahhsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 16:08:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d44d773e23so461714085a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 09:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731718; x=1752336518;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQQYkVndGStCPetb0u9KBpkX6kw9yPI24YEYcxWZEdI=;
        b=XX1horeBqfy7spYCofK0t3iIv8SVRuN1Z4mV/LVB21DInolyDIPEek9jbq5Ee/y9MA
         E6mwTpnFKqkKxZRIyhfLtE0AXP5HMAU5CgX3tJtUH07peM4nQLpF5/BWy14OFXG1q4KQ
         tyS8EoUHqtyo1RF9Zdk5SWWbpq3zQ1tQmNvTFUhRVpdl5d03DzPdqE8A01oos6HMYcb7
         M7Acu046xk/ODChfcCwC7yqI4UDzkIT8mn4Stse//LOlKs6Jtx3BLxDSOLSb0HGF+JPB
         ubnYOMoRDqMRQcyT08IN4D8U9UJ9Ll8AjnbiazRCwl+wV9lRSvVTSS+CMtdiN/OsAjhS
         uyrw==
X-Forwarded-Encrypted: i=1; AJvYcCW+5KwKI3hFLOZ5/BsBAM+JMrVrBpLmuI2IoygemAkE81jQAxmdSLQdvDlGJneNKK2u5FEEaFGuJEv2a6AolKvC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4PD1A44LRwNO6eOKAExn0UMBJPdKhopwcGZuxmTNgKut2CEvD
	5VPiEhHCKY1rVF/92TRXW9dBQJIUs2pQkoad++tvh3kSaevu0KC0cWNQCvnS/K8Xuji2MdxjGIa
	UieRSw3xUPJNIwUArUH17sgublqMjIaLAFxXChG+Kb6JMoeohaK4iMP0qoV06wU7+vU4mJjm3S1
	tU0Q==
X-Gm-Gg: ASbGncu9Ee3uUhHf21p/o2oOYHPvfrpQTVFXUVKOyk8sfKzL1H4DVftyEwbiXwMcLuF
	SSdQ1tnmPblhm6eAD3LZY4ibU4nQY5uQ7URHvt0JvbBRRUHvSV5MzHLaWIDLvbF4IcCfGfo/euh
	I80yraCxnoAnlsFMFPVYDpxXgYGQ56ZouTew7yp1X4Tx2vLHkfoTm6bgzdfBcRbr8IeRJveNNCQ
	6ho4JO2G5bUmtGDWkLfn9BpPJmvr2DWL9DROt1LDl8KhwV2q3aEmuvB1XI8Op1LSMtudMkg77bF
	8/VVhisfCOeHbdsXOZd3YeLxCgrz5QouU1z8G0S4SLB653ItWHdqbdO/TC5x/5I9IIy9Tr7eXip
	lfRiSZecSw25kmTf6CFkeYZ+zBf+xU/GSzU8=
X-Received: by 2002:a05:620a:2b89:b0:7d4:4b92:85e4 with SMTP id af79cd13be357-7d5dcc5e457mr896830585a.14.1751731718503;
        Sat, 05 Jul 2025 09:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4B2sgfTjCGK/I65unoqaLkmK0M7K7ayKlHuPECNRLfJUUTIjG5F1QyzFuSBOHTi3v6JDljA==
X-Received: by 2002:a05:620a:2b89:b0:7d4:4b92:85e4 with SMTP id af79cd13be357-7d5dcc5e457mr896825685a.14.1751731717791;
        Sat, 05 Jul 2025 09:08:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f6dsm622779e87.123.2025.07.05.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:08:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 19:08:33 +0300
Subject: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAABOaWgC/3WMyw6CQAxFf4V0bck8GEhc+R+GBQ6DNBEGO0I0Z
 P7dyt5Nk9N779khBaaQ4FzswGGjRHEWMKcC/NjN94DUC4NRxqlGOaQ4TSsO9MaFGWulKqdvure
 qAtksHCQ6fNdWeKT0ivw59Jv+ff+ZNo0aw9BIaG3ttL/ElMrn2j289Eo50OacvyaKeWCxAAAA
X-Change-ID: 20250705-iommu-fix-prr-600451b1d304
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1nHVCwgtw92YQiqaocxAdN057/gIPobtpT6EJm/ltEE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaU4EPzKa9ZLkC7fTqOEgSArVBZofNCTdp/Sb5
 6FwPKWtOt+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGlOBAAKCRCLPIo+Aiko
 1V4XB/9PrB6vncaBwBi4dhAA54NytUNQgDHc1uBL88Sca8J1uPGNjP3dU83pKyS3dPTzWNbWHJi
 P3qCHpO7IpOhZcTOxn6JKQbKHGPbS72HwPfbRcvMyQxau8bTHH56A7zy4XMfbStA460Rv9yXwa3
 q2xwWoZmQwz2UDBAa5VcAHulN4szj+eIHAgAqZRxiD5E9qc519YrQ2WtRGuDtv0Kq9mmVL6Q5wg
 I0OpVpxZsTTEsN6KLKTdEwYISyDMKfyrp0WZrSNmBGxmabvnTGaal/jJ4wZlWFDvxJC4LHBmhn+
 XUC1KVZ6mIhKg1QxzophRU7GtdVBmUqpFs3d9UZlhP9w97dj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNiBTYWx0ZWRfXxqdfL0sBda2a
 8PzxIGIjlo/vByq+1fWAQGvOCfdpHqvaWILIzR9daiDJwINYjl901M2rIeqjaame7wETKinsuUR
 X99XTIGOrhqkiItsTLI60SsN9qW2D3TF9JjTiQN4OAIspeOsKEUyKp5UIZugcol9pjuPxgRc3tf
 oRADqYW+MiyTk6zyuiDhOdjQ2N5xpVzAjLTxqiCNpPBLits/QuDw/aIvXyxYqEeFMaIm47kw+WM
 YqpcrOVUK5tlhRS7wnSopHTRmluBrHyQfIYMN0S54ennw4L0mS6iPDWEb2u3X5pa5yNCUvCfEQu
 HGkcpkJ0xVyB9Fn9AsU2MOfJmMs2bFzwRFnnCniM1m4WwYZi9aTk0JvDvLAyZz6tSx+Aa1z+EMG
 lzuZ53E5xiQ0KAgRwb7IPWfqe+jSiIpaf164E76gkkoIIYre23b6nz21lmDe83o/MlQs7RUE
X-Proofpoint-ORIG-GUID: 8GKTbuZNS35mZFYyZECOnFiykS9NrSzt
X-Proofpoint-GUID: 8GKTbuZNS35mZFYyZECOnFiykS9NrSzt
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=68694e07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RJW-fAkOStluX_mlE74A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_090840_899026_22506388 
X-CRM114-Status: GOOD (  15.67  )
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

On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
because of the hyp limitations. Disable PRR support on that platform.

Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
I currently don't have access to other devices from these generations.
It might be necessary to apply the same workaround to other platforms.
---
Changes in v2:
- Simplify the workaround as the issue seems to be limited to SM8250
  only (Rob)
- Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d9c3ee3d084c215362 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_prr_addr = NULL;
 
 	if (of_device_is_compatible(np, "qcom,smmu-500") &&
-			of_device_is_compatible(np, "qcom,adreno-smmu")) {
+	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
+	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
 		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
 		priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
 	}

---
base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
change-id: 20250705-iommu-fix-prr-600451b1d304

Best regards,
-- 
With best wishes
Dmitry


