Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AFFCDC198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=; b=tjLtolpmXwIdvwf1wKMwShLOEU
	09+yl5O8NtoEs25OUgqwtdqg3CmOdzVPol6YNckEBATMqmvLP721c+lc9QHBRlgnUliwj7B4r4uDJ
	rNoxphhgnBS5lD7P/LIgo2qxJWB5umCOXfLlSNb2bDV4YcnLv9iV6vCCRmNlbBWWjeJ2/SrvutKms
	l/xTCzUn8sUgd5cCpmhyhHPaJQYMZ6CKaK6U8nr1Rs9as/esGZAU037K4iNB1tA0pDABkMUvcbTLD
	dssE2sbVnmWbIiG9aN6ZViCNgSJjDJWmx2uMkGb8RqfsUPqDk54RVhmXDPJEdEyziJh3a/UTMvVYq
	3hBPo4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ4j-0000000EZ02-2xwm;
	Wed, 07 Jan 2026 09:43:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ4h-0000000EYyp-3X6c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:43:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079CKc72453915
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 09:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=; b=I18PnfuipaqPS9wX
	kF9iKeVqVxwr/RMebUMxFldv4ahClAXpe+Fg+56naXfIltprBLc1G+gFIVD/QhcD
	iDHjCi2dqQSqny8BsV3J+pyga2YvqeDDrll+fmFr4ag7ekC7U9aK0Evj8gXtYmca
	/8CHnwKGTLjLHU6AIVGYZhDVAIhv7nhOzFqjwOHreGrMGb4ZVQdONcmnOZ2TDRYx
	rQZ2f30PyIy66ikpRdw+NbdC4g31a97seoSY1jt40JyvQcTofvYYxfvYObUQPzXt
	qamYSDbSiXx/1CLZUzrIPy0SmwdJ44jdMkQjF1IjEAOVaEyDOVC6lxUnZ1tHSuBn
	+od1sg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbg3ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 09:43:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7aa9f595688so2664170b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779010; x=1768383810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=NbokwT5R1+EYYotNzvtYbBJ/85pOQz8PZXdNTBMH9xDuBuRDlYLMRc0CLQZbcl/xnd
         CXJj5qM+/wDgSVUCzISFtVt9ceNCoeAgGHnjv6w/QVioYjY6fpWfUouhYcM46l/XnDCa
         Xa6THb3I/Ina7rx7Sm/3ei6NmF+Gi7eWKquOn/cCNLQuLrhPm/MNOMcctc9vAun8DHeb
         HkRyxwEoY5pI1KVM/bJQGpLE4Vw6yP6JjxzO+qkbw/cYrxWmknTorinHGJdF2rJq8yya
         YKqsjJVPaYWwOng0FEPmF+60AUQoxEwvI0M4cWAiikUQu5TZNE2UmCRshvZhq0EXMBwF
         3p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779010; x=1768383810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNAIbN5I0fCUsYofWx4o+kJjxaJJuy6D9amY9U12/wQ=;
        b=TrGOy5aCQk2FaSDtZBSzHCepU3gMF4ZkTTgr1lq26tql3K0Z23AHpV2g74HNW/1drN
         eUrIK4EcWqrA3Xf/CskYeTwrke6xqEZzrZug6CTR/PE5MkVvJO0IhRHuTiJUdB9UZwxk
         DSIDbK6nwwqowv9B6Gd+fjVYLOO69K83U6cmR3UIcOO4rwOM1IJe+SiL+zOPT/sqO7Ie
         8pZEpXOUFllexMMCes4yAcfWx6dZmZsS5keZWay34WgrHX/CmFHlWRjlrcs3fDvGQRVk
         Ky8BEFQ1soZTAoXf6jRd6W4E2sr110hSQuxlev8ejQQlAGISSFzsCpSG8jqEIGDMKXPr
         wDRg==
X-Forwarded-Encrypted: i=1; AJvYcCXQUxFb3a7TdRWvQeCR1Dkb6MAtb/lpcx8rbN2aJqvnQwRdUYY+dt+x7vbLJSouqLKYNkFAvlulG9gic4oiCjpe@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe5R+WynmKXkwVWzi5eGcdsm20alGLzPtZ5LQpgios0T0MoYhA
	qDne9cftWewaVsiXn+f/M+QaIygWmL2s8DVSs6s9hs95PGfEFPIrhn/xAM6KW1Ch/YkHUnDkiZ6
	Ov3MCr8ZVx7mTjexXYtN6wLbd9au7/vuBYO4hdBxFHJzsVexLJ9S3TG4xm+drV6L+5NzF0bHfaV
	5vvUt33YddDw==
X-Gm-Gg: AY/fxX7d0X+sg4G5oSISvCCg2UFHe14dYyWmbOjSIt3oHZGujb9JmxRQgS+7DcUUeU0
	N6kaY3w5C1EsaYv2724ZKgMgpPcjcH9KV9sVzQaTzZ5lQSCgYbXUrxeC/yB8289MukuLk6ET8ba
	7PORmU77JJHoPuhNEtTkprRUaLB9zLQZTITQ2/RKP5UpxO+PVO/cyO5w1GRV0zEnOAN9S67JzTj
	srB8Q7tyrXHAFZlITnKjsX+mgRjNpmR8CMgkDFR0CdHdusGdUAbDKPk1csByd7Sh6r7Qj7kFKkm
	s0hFdHMc+CToTQGo+AVhM//nWQub7ZUTI164KDP8zrgfXbaCeE5vY0acktXDQNkMIoHO/mfGgc4
	bCLwJsoFAl783QPgvqZPXK3qMRVP/lczWyw==
X-Received: by 2002:a05:6a00:8007:b0:7f6:5158:5b49 with SMTP id d2e1a72fcca58-81b7de5c201mr1814974b3a.19.1767779010375;
        Wed, 07 Jan 2026 01:43:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMv8PnJ3CXFfRzrWhWCZsWCgO5o82SPURinQIFa1qFxjuJZcsiNvT/2i/W8Cd0JCfLWwcqdQ==
X-Received: by 2002:a05:6a00:8007:b0:7f6:5158:5b49 with SMTP id d2e1a72fcca58-81b7de5c201mr1814953b3a.19.1767779009939;
        Wed, 07 Jan 2026 01:43:29 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:29 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:04 +0530
Subject: [PATCH v3 01/11] clk: qcom: clk-alpha-pll: Update the PLL support
 for cal_l
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-1-8e10adc236a8@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OCBTYWx0ZWRfXxqJHIh1rc7oG
 hgY+TGwzg/3kza7cVsxEPONpX9cnetgBZoBpMrOFAbv9SITmbHXq6L6mH2tVKZfixOXZFZ4hpQh
 0qPE6w/r0Fkd3+erB1IA3Cm5PWq8t54htfPrJyMmgbyXDfRvg/Y2kSh9wQyCRY/Wkx26diWa7BL
 GuQnO9skft4gxe6LkhlpFmM1/LbGu0zY6d53oOt4Xx0BtjlBoV5jAyrChTcsRvcvsn0XP6wpPQ9
 6BD6zmbvrRMEcvGLCKoLKw53dyIBr+7vQICJfpbiYgFjPl9Q8HfdPVPcJkHIgGdO7Cozwn108wS
 WvVB05cuPQPGMMKQ2LSLnQDLybUyraDiMgJtmiOq494m4NDvDaHbZmvIV1ItkIYYiWrBR4FL8vU
 Nr985eRlzN52sYrAgvw/lE3DOZJIByvzL/fhlNT7EGC164clV/H0kulfQw+QYFraYFxOYxa0gJr
 8MPAvy+5V4SBBaCBBnQ==
X-Proofpoint-GUID: D96W5iw_UitYhPgCYDZt7OwLZJiZN8_l
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695e2ac3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QKPxMsH92d9TYhJkRyAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: D96W5iw_UitYhPgCYDZt7OwLZJiZN8_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_014331_895887_321B04D0 
X-CRM114-Status: GOOD (  16.49  )
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


