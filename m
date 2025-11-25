Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52372D0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=; b=c3jtXsPyAtCqqHQsy69JHEYYgm
	M03T/KOqkrx8n2onKaJxEEgwYrsYajgtJ9dBALOkGqPYoNnmbulIXOTOBRPi8cug4gO8Hn9JIJapz
	uZDJbUr2LQg1pt4ylfsIidQThTefkgydIPOJxOMo9mRr1qX4gicpJqWs50qjLinO+hR2RyZOZJQoP
	LUw3Lrw//bspXjfuYcEQWde/n4ahnaIGU7W0MsWqA+xk26l5PblK9FbCepNq0iAksIvi8Y2EqUmyx
	5n/8NRj6s7b+9Vs0T1BvzTSV+vSndoc+W23p8asc9/mNpJbXNiVzZXE8clJ8+4Uahrt5r6ttJ+hWb
	UfIE2/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx6v-0000000Dgem-1D3Q;
	Tue, 25 Nov 2025 17:45:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx6s-0000000DgdH-3qRf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:45:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9wNNL2659063
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=; b=CIk+mNR9ZkMiHU2V
	NUV85Z+vWMJ1lvwQa4IcB1LitcaaRUDS+oIDx2psUThKh19+4apDlC9GaDEZ3QVg
	KzIIO3Z0qXVmgk/7YL37G11MmJRxW4TkDa1/QBsUVnUZO+hab679/2PPuvrU7f6j
	V1y7LEfKlxQYfz10bNMY/zqWq4MFlR76bTK1BC87bNtUmLZY9U8riZr0XDlL1qds
	PqXqPL+S2nHJjHRNW7ZV/zJaT6obQ/TzrNLZV4roK5pfLDnvqIAcGORRELKFSSs7
	V/PwOTkinn0CrzWHYdfZuT+VmW9mz4lqzNxNAhIUPMafxM13nt9lAnaCINP6zJjL
	BurRLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9x9c7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:45:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e1cf9aedso139879665ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 09:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092750; x=1764697550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
        b=el+md5KbEd11dKJ1bO/w5vMrZ2zI+HKoRl4+W8XTaZ41hF5a0cvI9cA4stoF1CyLG4
         vDQMOISe/LeHi6T0ZoI3XIH+O8YrW8NJ670ZOmWEVV6yV6DPhbpFVrGnenL33tVWuzYo
         WjwQ1MiT4mlb7uxU8x4wkOoWh2uwyEgZpnyt/XYTgrCyVJsUm2R+npEm6u2MRrCzdZY1
         WBCc+SKbNdpG2JO0bmkDAmSaXODpa7Ru50XqbL1kdQQF76f27bhVHMeqScV9iCaAfTpq
         aSAKPfjTQTleASSkAtPzle7EGXbIxf0sJ/e+WCn8BuneOTB/4hmfNwMZd0XPj557+beD
         qYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092750; x=1764697550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
        b=Fhlb1+/HVJ4o9l5APZxjQJX//0p/XNnMGdKBCZ348/k36sCptsihfwvh7FmOtcWys1
         QrIhw0ODgamvlwUR404e9v+uwjC+577Zqa9MqG45Y59+A+rrSpEpYT13hDecLPqGWZoc
         sqp54BOLl+c+hEwUG7Xuo1sYFBKNN6gl2tmWwdmS0Hz9ZNaJUn1ItOu8uV9udeEYgvYV
         WyKZ07jUIegZwxhOK4O6sQWt74ZpMc3KpwtF4NGoPbrJzF+6edR6zhj1vF7SP3R42p3k
         TOEskeLEqDVeWI57kK8F5QKTnuf9lYjRVL7sKkDEbgWB4blkWrMBer3141AoLgPcoL/e
         MdAw==
X-Forwarded-Encrypted: i=1; AJvYcCU8PBqYQ3C2pHbEfHZJJQMnzXTAw6qyc9dF4q6fSCeXAUGsKFsEJSTb59YB3WaNPsWCNhU2nDTTIMt5OXmfX/gz@lists.infradead.org
X-Gm-Message-State: AOJu0YzmXlYP+/vmTwg83yNgO43IHP6Xt4ITYXAe09gogzDKTnpq3XBL
	FIb0xVM3lmVVPf25LZoDaJs5YeHfmdMZzeQWpBmJowjXhk1uOvFUPVD1Eas92GmSbWU+W07CgfT
	kgk/b+JsocGYU8IF33molO6Pve3bvnOVc/KPj/5ve9ouBNLxaMvZX6QY63uEchpptKVi89TJWs1
	RGeg==
X-Gm-Gg: ASbGnctwcQw3gLrRQlGiDHeoX3FWlstjnpASTg0yRKS+tem/oMm4f4JLjBMFZVAUV1P
	PPG8fZFA09m8NLWrwSZZYCM9K5cFhxolaWgDO6Ww9zTln8Qd8wDhi0iswEAa/QvlLYVj0AsZdkB
	d4GeYOVcA9LBApEbjiBcNv1hS8KTzMgf3ghRIpWvw/v9cWmTR+F+hf0p0/TV0bteEtIl4ahW2UK
	0CYcI8mxG+DCXUP/UxTDxlPD24JORMCX8qeCb+YH1RPYISMUZVQKaGf+tUt+5AtR7c2V51mD/9X
	t0CJvjk94+DdZW3mp+yi7Znj6vL2PePq8MlXnlfVvDOuUQwmC4/dc8KeVVnxZ3u11RkJRh8MiLt
	il0DtE2eOkP3WtgT4c+8=
X-Received: by 2002:a17:903:32d0:b0:297:c272:80ec with SMTP id d9443c01a7336-29b6bf5f043mr212996655ad.42.1764092749651;
        Tue, 25 Nov 2025 09:45:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvwp9H67m9nkeaPfXf+UyZa2R9bATzOBDe1yjAHO6XFle1m9u8q5H+vR7VP0wbSA9gBQxQYA==
X-Received: by 2002:a17:903:32d0:b0:297:c272:80ec with SMTP id d9443c01a7336-29b6bf5f043mr212995425ad.42.1764092748212;
        Tue, 25 Nov 2025 09:45:48 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:47 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:12 +0530
Subject: [PATCH v2 03/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Rivian PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-3-fb44e78f300b@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: wS-h4QzQAuYupu7KpQU1_oqKu_NL3DGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfXwvaxeZt16Zbm
 LKwHc+9wzlDUEmv9i1dziQ17Nqb7RNEtlnwmV4Tmtp/3sd+R2BNT5QaCqBYBKOcWA7O0eOc2Gpo
 01t4x2GmLCqKFr9Kdn6gDEm6Tz5odsu96oO+zQIQcPu5Y0/CBjqp2F+qkmMsFRZrhdWLg7KzNkR
 yrBUVuTRSBWjjmkUIuQwW4iJDQzjI3xvGga3PDtmCN9hLHVq76HL0RRRPYPnT14JbMhYd2+/z9B
 eUR2QDl/peHoyjTSi5RlMmCWj37iFH4dM+WEGN/Rsf/fMNZzIlFYeaFjnxg6nMDCGdgMC9B0f5d
 GbLiCFtfjbRFGWPhU23Uv5vvtVDCkwcSHqRWK3Py/FF8nCdb0lSnwXh1mkMIaAj3O8xNHxZGpr/
 UBcECjx6+jXwnFTqhgXy/H3MpI3gdA==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=6925eb4e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fFf9reVGpRxvdFVPZdQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: wS-h4QzQAuYupu7KpQU1_oqKu_NL3DGQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_094550_966432_2A6A65C0 
X-CRM114-Status: GOOD (  15.44  )
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

Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
PLL ops, reuse the Rivian EKO_T enum.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6f50f0c4b984e991982ee8914a496c00c4ee063b..3fbdee6e67f9c82a2b93f2624a112934f01686d5 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -243,6 +243,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL] = 0x28,
 		[PLL_OFF_TEST_CTL_U] = 0x2c,
 	},
+	[CLK_ALPHA_PLL_TYPE_RIVIAN_ELU] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_USER_CTL] = 0x14,
+		[PLL_OFF_USER_CTL_U] = 0x18,
+		[PLL_OFF_CONFIG_CTL] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x24,
+		[PLL_OFF_CONFIG_CTL_U2] = 0x28,
+		[PLL_OFF_TEST_CTL] = 0x2c,
+		[PLL_OFF_TEST_CTL_U] = 0x30,
+	},
 	[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO] = {
 		[PLL_OFF_L_VAL] = 0x04,
 		[PLL_OFF_ALPHA_VAL] = 0x08,
@@ -3006,6 +3019,7 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
+	case CLK_ALPHA_PLL_TYPE_RIVIAN_ELU:
 		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_TRION:
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index fc55a42fac2ffe589ba270010eb47c0816832ca7..da7d3d75592373cb2df472b9976f8c7063dc5021 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -32,6 +32,8 @@ enum {
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
 	CLK_ALPHA_PLL_TYPE_STROMER,
@@ -210,6 +212,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
+#define clk_alpha_pll_rivian_elu_ops clk_alpha_pll_rivian_evo_ops
+#define clk_alpha_pll_rivian_eko_t_ops clk_alpha_pll_rivian_evo_ops
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 
 extern const struct clk_ops clk_alpha_pll_regera_ops;

-- 
2.34.1


