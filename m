Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9BBD0EE0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=; b=jUD98V9fLDBL1BX4bqL3KfZDdK
	MOTChkrxmSq9TYhy8R/jZ3lQNWDPSOEU01qRcJYQDqkGjtwZ4QodQYiCPeVplx3F4S+2UjfSEiheW
	VNiSE1sqRSjbIMh2sa5LtQQA+PQ4j5vtnftIl1sQFSalhLzMfE/k7ala/mwneeOpBRgSqv5zo1kn+
	FDq9UVLf19ck4WyMF1DNBPJ3erNiRT95NuzheuM0+YLkqZV35xVMRsPES5phTyT688u+A3735a0Ia
	KtUqPTYpQlnspSgPYU7jz2vNu22qoonq9vn2urzC7rDDRWPfs7HqGFrFkl3gF38jIPTf+XG8VIkjw
	ijqMMKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx6h-0000000DgZg-4B2m;
	Tue, 25 Nov 2025 17:45:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx6f-0000000DgYu-290k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:45:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9xD1j2650394
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=; b=ov2+BXhlfhkyjxkj
	KnbJISDEgql4rZGwgyntBueF9Ij1iGIq03/TDSXrd62RP9FeJU4y7R9QiB2XtOl1
	Z4SzFET1nFR+V75xgiUxI2LoJS+YzoPXpLIk0K1Rpvt3Z60F5hKwpGTe3drdhUqe
	7Dm8qb3h0Tbey/Ww8Ld2gMycMnvsJ8jFn2cYk8Owpw+lLVrKtW+z66gL/XtISYDR
	ogayitwjWUHVWC8JbofZZL0kaG4qVLgzlyTu5SDmiEeCiVtkucdEcSn/CrRw5m8f
	/Yv0DtVCiSaZ3PhUPqsIf4+dwFwNCYNbDG8SMVFkrLukwhKcKE8ODIU7g6fHEq6/
	T+qBEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabscan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:45:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297e66542afso200095595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 09:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092736; x=1764697536; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=fFowkp4/c8mYuExtdXB6pSFPkeyF7RKXQlTUAGr9sY2jVVdn4yhvQqfZH/MU69mFfw
         DRRO9Z1b0teA3pxf8wFZd3mkUdmq3GIrRpvxIQrU2PMzWsGdTFBH076Jb+ZqB+vSEmt/
         jQK5zoFokXdOZk2X9lPfsRiniZ5LIo0bD6hB/m097XvGeYioU7SbrYMcdQZ5qy1wMvR7
         BxBWikJVdHqvDy9b/x4gi/M59UlffsRGZgOkFrOVkofOJxKYsmTVXpftRvVWNAn5WyWi
         KcPGe7TxgxZVqAE8mmMFrQf51EX/JBQQC4JTjJXo+N3lqsCJPBp6qOgZs9RXw/AZSKdd
         A9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092736; x=1764697536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=Q+xxIHBPT0KQKN7E4vDI7lsoi/zm8oVJnagH92a/LYoSEUUMNMcUd2aJjDq4EKYAvx
         ppPhSsFH471utaZEOhFWfkU1/zARJv9/viZxSx2jmikqKaIE4NMfOfo2CZWc1FzmC5NW
         nJuGEV8NuMYhO0UmPfQxcw6/MAmNINc1OmHpVzeHn4FZ8TNc7NGdHYR5HcJTo3Mg9ZL9
         dXMfmU4oQ77mwdBdVQ8betLk9dGsTeIuRLDC2Fo0I0d78vLJfqxsOVT7dJUD8nNdUHZZ
         mfiWXtwPhcGKgEmgKqgdIMqWeiDoiXExpZJzlbkFP36q2JdWi79IQZ7yMWSJ9ZEqs3r8
         /TjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSy/QPj3xopvAltM2Ar558M39guNUIlxhzEJ+XVbkmoyczE8dGfzrxWR3qeukD8H5CYa1jIktak6iZOt+Mny+z@lists.infradead.org
X-Gm-Message-State: AOJu0YyyMF0VxHbwXcxM5fYbrwHkcDE5Va7PfjcU/e+cRrTVaFZzOSwV
	zk6ON6QfCRKdeXSwZhi5bfhn3VbdWbsXOvuBkxBu4L8iPN5qJ0E2ysOz2HHm3WbFxk27E4fb7tW
	3spVF7EAPR3kkMnaYa6h4o2gtzo6QbXWBWulpuSLTVe7bclgLOlRUUjUkK3dqDkmCTT8WHYEnnC
	XFxg==
X-Gm-Gg: ASbGnctHtRQK2ly9qWLfZnBGHNWng9kbCjFq3Zz4sA6lmN9oeQr426Vr6pF2yCoGKor
	RDe4/3p8t0rlgw6eU4rEaRHwn9//Zd7BasVw/uh7+l4mdbxsisfI9Db/thKjGc4nmNk/++UUvFa
	G4fDwlzOHWpau0eTsiTERZj/8EJl146TXmJC03LqaZijCu4n6ACDLdlQRcI63m7OFayaiFfY3jv
	pJA6U3Xe0fiFDcOWFxjUJoIeU5TqW/dsmdA4xjFqEkh6oFx3T/nUJrvr9ub61ZVbZZ8ZvB9mL6s
	+T2/NfZADxvbUyLWxawkIjoAQ/2fwMHUrODbBbWbCc7KPUv6GMge3Hdw3ZoGDvi0bkzrIYmaS15
	CAsuNngoZMNMLmNPKMi8=
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id d9443c01a7336-29baaf7b90bmr40218205ad.20.1764092736459;
        Tue, 25 Nov 2025 09:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxPsF73cA1rD9RUUeKsVhqXSVlzd8Y1ZhLmKg/DCFPDWbHJfilV2yMNCSYMEKyoA6qt4Ypxw==
X-Received: by 2002:a17:903:2ec6:b0:295:96bc:8699 with SMTP id d9443c01a7336-29baaf7b90bmr40217975ad.20.1764092736060;
        Tue, 25 Nov 2025 09:45:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:35 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:10 +0530
Subject: [PATCH v2 01/11] clk: qcom: clk-alpha-pll: Update the PLL support
 for cal_l
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-1-fb44e78f300b@oss.qualcomm.com>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6925eb41 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QKPxMsH92d9TYhJkRyAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: bvt3eaLCC9W6pdIjk_K9YOu3pF0a64OK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfXylK8jlkC6Ymk
 VUyALgMom082MTQAZMljFkGlkqyjnu9/o1PjB5d3tB+lKlpI1a3qReZ8H1F1s9OEMv0j2zMyZ/k
 YFg9ywuVnqydLLve3r4/ESWZDjIDnZomSkCOVXa+83+bR9ShSwNYrWn5m1PukRf48ydQP74b4OX
 WpPn9oDW55bcvUwOYKMgRKKgx0zjHx3z2t/MtGb1hGs3qBR41eI2B3BFUYm2AKETPG8Gw7urv/V
 iroTUlJbVLGKP4Jwy9HM4056Wyxhe6eQS4Rqe1+Vhhq6wNQSkFJ5axPIG6IsVjz8yzDQLr7mdgd
 nfB4KeU4LV8TIp/Ewsfwl6rXJu5znTdvrhGAHNCVa7XCDUUMOL8iTNVYDXel6pryCA6Cs7TZQj4
 g/fu98ypGkxnKKW6YEj1eNYo3QwxQQ==
X-Proofpoint-GUID: bvt3eaLCC9W6pdIjk_K9YOu3pF0a64OK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_094537_560864_701B9EE1 
X-CRM114-Status: GOOD (  17.29  )
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

Recent QCOM PLLs require the CAL_L field to be programmed according to
specific hardware recommendations, rather than using the legacy default
value of 0x44. Hardcoding this value can lead to suboptimal or incorrect
behavior on newer platforms.

To address this, introduce a `cal_l` field in the PLL configuration
structure, allowing CAL_L to be set explicitly based on platform
requirements. This improves flexibility and ensures correct PLL
initialization across different hardware variants.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 6 +++++-
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6aeba40358c11e44c5f39d15f149d62149393cd3..6f50f0c4b984e991982ee8914a496c00c4ee063b 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2338,7 +2338,11 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 		return;
 	}
 
-	lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+	if (config->cal_l)
+		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+	else
+		lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
+
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), lval);
 	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
 	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d..ec5b4e4810300fa787420356bb073c24bb05da62 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -128,6 +128,7 @@ struct clk_alpha_pll_postdiv {
 
 struct alpha_pll_config {
 	u32 l;
+	u32 cal_l;
 	u32 alpha;
 	u32 alpha_hi;
 	u32 config_ctl_val;

-- 
2.34.1


