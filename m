Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4065DCDC198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=; b=ldH0xPBy9PTXAm68NRHtJPQjIf
	c8UyIoDqEa5V3o6lhvf7QGLFuQLeDV6r0f55mYWTtSQsw9153VprhwD1nTFncLkVJRS7kM+cxEkhF
	XGpYIij3yykO44zbwPukAe2kyeOcUSX1FbKC0xAKaB5fyCLoDLi49OGqS4i03/DZbwKkl2KU1T6ah
	4RWn99Bk4cEvDGyshpeL2Vy4pZhehcRwc9fQDYhhsqfill3QTuoSOOu+DyW1hnNfpb15CH6R8lOpM
	ruH793T+BYiu/m3YO3GJ7g78lMhELcFbTuyNGsH3l8Xn3XlLR92UfzFHQayPpfr2U/hHHz9CukQJI
	kV1M/4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ52-0000000EZ9h-07Wt;
	Wed, 07 Jan 2026 09:43:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ4v-0000000EZ58-1oRZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:43:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6073YbIZ3888906
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 09:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=; b=Ozuw9KO+XLGIjCyq
	9yEL5vyXjHzQBj1MmyqlWtdpct72F5AqBBYcSwHQdP2CqsqriZB8JwKdW1OuFpn+
	1wYpL5xlhlnrjzR/ucFEjrM1aY6HWRiMdznSBe6htuU3L03ymf498WrVRB+5PwQO
	wfR5DrdD0WyO36Eun1YyIF5xFvJ/VlJ/Ro/sqA3l6NnX4xzpwqj+uL1zqtRrPuX3
	jZCVzGLWEXYG/f9BeX8VmrUB1bmHO8pY+CxcTugbknXdHQhA5ivQzzAp+ta+j1GR
	V3BIUNFktjjMEeDKW+hUrKB1ohPRSWrK2U3TQojtTVoejnwl83KC2Gzqzf1nalkl
	S6aE/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0jt3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 09:43:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so2945964a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779023; x=1768383823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
        b=b0foks8xHo60I+BrTL9yyBqd5BOAC9dYRWTVsy80qrpPVckZaLsLiVbgxf+guIrdD5
         lSg16C2KQcFzl6ShOwFnXXuHvn+y1VMY4JDhnzlhbjNaE7aW8NQeEl2L5Vwxa8CWd1bg
         YEDiztM4HnldeSkPCCrowkR77Q6bfDHD2rI/seGuDAXlDL9OXK7cYPxT+kej7b9C4v7c
         R7PBdG7nhFDNPr5XoYAAQMxVGpTD8Z13gx/FljDCWxvZ3y5WTeqyGWlHrVCGC/3PzONZ
         j7r6OfTLc72SuSx1C6f7eZvTYx/EeUhwmV0Z6gWIv7NY62lZeWLucRga5oLbQU1ntt5P
         nE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779023; x=1768383823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONv0dzy9BraFiB+TBKyhUqYoYWxp7ST7mWMojgH7ofw=;
        b=mWA8md7R4EYOWlbyH3PLJcQRD3UkWA/imAFL/UiXoChyzt9ZdVulZ6teA18xsUJzgn
         5+ZmQ5GMS8Lc/4PtyTDACJ21fxK8k4lCQDHOhExhghRriCR6G9FlWR0Sh1W8GqEXG/Ch
         ZtRxGfjqfVFr2lcLzpYa0ggdZN0/2niNEa+iLChkuNlfxA1F9WBJ3Q9/b0BUIQhx04T1
         VS0bWfVri4kVSHbe8qN6uV/M1ZjkFTefmP/kKqpO4f7gdBu+997UPlZin4ojgJAI54I3
         MWQtWtX6QYGwILNWryKrIRBsx7kiG+KVsVRQPOgxM4rf778Csj8JS+n2bJmAjv9GcXJq
         1XVA==
X-Forwarded-Encrypted: i=1; AJvYcCUAFgRUMLALuFGuRifoetwjwTBzuubllbCwSO1MHz7VhEWUvvO7ZUPdhvCCXs0ebG9uJbL/MIJriY4LqfRP2Ev6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5lLAHcwApYkSLa1KP7E5C7SlhPQjJ36OJ8bpTSyX7irdPVrfH
	TYgAUHogxP0a1uuLdU8vivL6qy+UORUeo9B99JEPXTsCOooy5YWJa/RWo6jKpStseEda31Zfd4L
	NR+NdgeuYu9Rn9Z3tTew/Ic8N0kwFDsihm3wo+kMfei/qeBCjl58nnbsy/ccq2Z8ydQbrAIdZP4
	DGikWOS2KrPQ==
X-Gm-Gg: AY/fxX6/VJiSUPcqmc6jYMCSJlCalfc17qAOHcJf9o4zWwKAeCQeJkbXo09+Xx+iwDT
	WiTTqO1USESNFqUzh0T93D1tRkwXMMekZDV565zRNPrWmBOF815NhfdaBxtixST9PHFz8PJ5dAO
	U7fyKPHdn7tkdfIf6t+CCeCFBRSjFgajwStXS+ZmK0FOTUqXFKPc6kDIcasnhI3EUy5mkdxBp8O
	dpgqBjNZ4saZiX6e0XZx6oPxkm9rF7wlKZ8QF8XvYX9b6HLAWUtDqjdtWtUqMXy+94U+ykiQwkU
	XLZSz5KEgYqrIOyAtzbOolsVbswxmVeTRE5DUV99Lf2pZeaA9cr6S8eJmed/X6F3pfnLAH8am47
	UXCSqpUGdyXdF61mAzs/NPtY9drMWwa0gHg==
X-Received: by 2002:a05:6a21:99a8:b0:366:14ac:e20c with SMTP id adf61e73a8af0-3898fa66b18mr1776778637.74.1767779023049;
        Wed, 07 Jan 2026 01:43:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0AnOJy4NH19DQo79E8i5R6u4z0mklQ6JkIdwaoZ6T/2epP4OoF3d39rajQElEH1uLuGzY+w==
X-Received: by 2002:a05:6a21:99a8:b0:366:14ac:e20c with SMTP id adf61e73a8af0-3898fa66b18mr1776749637.74.1767779022553;
        Wed, 07 Jan 2026 01:43:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:06 +0530
Subject: [PATCH v3 03/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Rivian PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-3-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: oBU0Z8uZDd6qVYuLo2CbhfZjzyJplHNN
X-Proofpoint-GUID: oBU0Z8uZDd6qVYuLo2CbhfZjzyJplHNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfX7PwmJs9FxbtE
 KuDQ//0F32LkA6JZO6XEfVDUuBcPlMT9b8CzZ9B/nsSH5B7ODAbxRSP1Zoy1e8O4gOjjOLtXrTG
 f8Y5GY2eaYW5itGYkOHIKBJ4Mt6DLIzu3BcBJK+5kh28wOTn6u20hDlH5csMU/nztY2ugpv5MlG
 Ugr+n4qSq2E+AmAZgPKp3/jEOihvRb3Gp7wIE0fmwmtHU6HJi0/6CriYyMkV6YXNGL8XynN0cC3
 GlpRYd1ADURkzSvA19M1Mgj6S1ONomH26mNQFIMtUGWbHSYDJ6d/1BV3wQF1AyoeSJdiVYkZk4a
 3AQgqcUCi7KBe5XBn3CQkl2oxbTzbygEfvShnMTizaKzjl5KG+S/8D7eFhfywJ5qKiE55wbPq8S
 rD2+X3WUrj2U6hr2KK3hYErSIdWZjSZ/fKPiCZxkjtsR3s4lzN8Dgpt86jyYqVubmRjRLZsMnIc
 c7lib6Kgcj1NOgx+XcA==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695e2ad0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fFf9reVGpRxvdFVPZdQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_014345_805415_7F3A48B4 
X-CRM114-Status: GOOD (  14.96  )
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


