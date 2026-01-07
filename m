Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F90CDC198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=; b=2Fq5rP5s5SOl4p7RtZJZHNZt3C
	VEZeDxu37Ou8jlPShj4RT6nGawe5mzGdxl7FP87uu8Q/8rCZH9R/3elW5qaiTd+4VHFv8JE8OnNN7
	jIxVjBA5dX29HM/ebCPU1bRSblxd5pTI2QI6NbcPHbTY4iUntgFcKc9gbsUn3g+4izCNhVnyJz3+R
	IZvlz5ixTeUpUO+s2zL/Vw9XeTH4DjLggNpu28qpYdKQxrHIAHB2Br/qzGya8qy5NIM/csiCKeSf5
	Ri0CEL/Q26GMFfU/V9EeswRzwLAkkiSQBSj0mSxHCAAeSmJQDC/JSV5DQokJ6iS9Ig5Lo19m2X92M
	90bNRGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ4r-0000000EZ3u-1T57;
	Wed, 07 Jan 2026 09:43:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQ4n-0000000EZ1y-3u1u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:43:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079dtIV2593330
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 09:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=; b=eWCp5y3QiYa/iNJs
	Xuco9jDBKf78KOPp57OjunFmWI2m2ZSuPAGlwDhEuqL8qo4k+zb4Z5TXkRUOllSa
	BigaLHXPvqnKwMmb2KrJMPT0wWSgsMBCVBCBk436eAuvRCmRNwn4bn40iEE1biE+
	sPyHVfFVTb70fq4LJi7MU9oZBeTVL+ekh+tqLUqRREqijoAgzhOfe345gBXPKMNe
	4j8ucnbwTSYW3GuQDSVi0yumCnICsOMl88TqSJKc26NeVNzmWVAKQy/QHZq64bPw
	FODULmhOgcxzSRwEyTGgxO0t72W7Kv1jkyhhnJJOIRh657hL5kRVTVVH+20iaCu9
	swI8Vg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2900dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 09:43:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b90740249dso2662413b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767779017; x=1768383817; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=Lv9qFWI3cfyzqx8vRk8cKi3HCkBZvA3Q/bnuU9qbFzmclJPm5DBbecyCHZxTcfLVbU
         QjqQPlNM5QwwHuk3a66pbYlKQUQ5vDg9Iv9CR6/NFTNBRzhgngCRWea1ktBhXmiaC6zq
         L+BEzcRzRu0R452pquBB8uQjMTwJFFeOO0RS98i62Nrkt6BGXaVNfSErsZqECSBlSbOn
         c3I7ARxuFinj7R5wD+W+WYEsFnbBRCvDclS8d4AVNubp97y1V4/R4GRYn0jtXVtZb3er
         XsD5ftLFe3E2Z0ibElFfGcDOfrWjBpgx/NjM5glf0IMLAF+inzblnm1AaJmvL99RSlcG
         LEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779017; x=1768383817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=ZY02vhjfWZLwoMPcjGFMkiHkKCzhwqJmEHCUSOgjd22aD21KyfWzwiFwGHfZhOrWVc
         w+MXCrQU3OUUN1gXocgCHnwlbi7BfyLFees7KfpJd4+ym9o4BGSyQSWXjeOAYrb9IqC1
         5vfb1mViEBpOFti/pCnce4siZ60LFxQIq060CqvrYrjGfD6maTdwEjuu0osjUsT8wlZj
         njvrsrZtUfr/2U5qwQ9fh/pFOyBqzKLjbW0gt+FmZjkslQA1BdCKPdMviNEY0mszaomA
         HCfj8cLzqSRaMhWJqtAtJVieyxq/IrhVEapcfgKfRdC0cFP7SNXGrWKp26wbau+YqYsA
         QRLg==
X-Forwarded-Encrypted: i=1; AJvYcCWRQ62wFa7QTW4DKTHv8wKPnXknsMLvavyEl2i8eKUcLvIEYzX56YEkkPwbKZf7I8f3c9tS0I1ItdqL4ywQ6JmV@lists.infradead.org
X-Gm-Message-State: AOJu0YxICgm/Xlk3P6zJ0qC9ma8l3s/yJaK6LcfZ+z/erj7BXyfy9ERF
	1sp3BXumsdHLZq51KpqQEoh3WMLQorTJyrKFGYLtDiwyxxK/4RrJOxqHvVvl7qBavqWOpWy6w/w
	at2chB0VNtMDTEmqUMKqVOaz0zy5fnP5o/aWdw7ZhRLpUTeDLunqvYQ1zzs+vI4jkLrZLODXEuv
	8r5pNic9Ylsw==
X-Gm-Gg: AY/fxX7F/kIICGUkSPIxh673dLHJq5KviRIMO3gKrdr/cdNmOsjz0xrsGmYEvjnVMSU
	DtDzXNw246U/fLEYPi+jBByXkyPimhxOZtsTo5R7sIaIMKZDU52RG5FIq3n1YaA+mvEnOyDLIpi
	vyIT0qfmxglcY3k35yk2LyA8tzV9ZHy4/IAGqy21zUn6Bufa4hgBvMYSLWwd/qZwYK+xABhkjY4
	XjE1gaC24OhO6i4nh3mVnA/g7iurmLu2hVF/Z7MNaMA7sSg0IY9GuFLXQFnGXfWBg1biJEV3zsd
	Z8T8kHMKJ3Zhc9pKz8946QVDvyqJWVfK/zjKrd6P7XsoZX1pPxYK5AnrXq2VJW+aSDivELS7h9Y
	zDLxgWuRI3zm2D4Sd1iEjyGgxOklSgkcFxQ==
X-Received: by 2002:a05:6a00:908b:b0:7e8:450c:61b9 with SMTP id d2e1a72fcca58-81b806c99f9mr1789479b3a.41.1767779016700;
        Wed, 07 Jan 2026 01:43:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOWDHAkqPtCZbyeZOE5BJsu/fKSrpRyXFy9kFumozQWK84Dh8TlS6n/YwBzyrzffHXHc0jGQ==
X-Received: by 2002:a05:6a00:908b:b0:7e8:450c:61b9 with SMTP id d2e1a72fcca58-81b806c99f9mr1789452b3a.41.1767779016235;
        Wed, 07 Jan 2026 01:43:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9568sm4472944b3a.15.2026.01.07.01.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:43:35 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 15:13:05 +0530
Subject: [PATCH v3 02/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Pongo EKO_T PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-kaanapali-mmcc-v3-v3-2-8e10adc236a8@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: OzNFvn5aoCG5Jd819wIu5lnTe-zyKaaV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3NyBTYWx0ZWRfX815cjfvzrI1p
 nplzmIXaOqYglSsvo4DNnaxBlqoV0wpubBg2z1QhsmQqF6SEyMGOYquMFUAdP0ME87fxXnquB8k
 G95TTKiS9uHthB7ZzJW4MelJrb7L+tey+W71ARBewQPIcJUP+cWCFJh00wXYvmQQ/AyN1qgIiPz
 In2tXyzLhma786I9fncrcatauActUlfoMlgNFfkt39SOUyoetfol1Mk4zjNmxm5zPMeA9W693/R
 /224GeggmBdrM+GnhesSdQdVbx6qTnb3Gc4aLzpueAi2aMt3lG9s362+MIFuutgmEtlmTx0I+h5
 ntKXCAP9J4nm18bavfwRYwNbJefhK8oxmhsJQGYa0Ls/9FWYvVLajggbXQKMlm7NJFFbltjL7ZM
 rlTPPg5m2Enjbn+2knZCy2lMUxDW7w1PxO6fs++XSMpF63IhcPkAvt1CFPz2UWzqIf+n+OQbZvY
 5lRLD3D9H+HxIg2E30A==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695e2ac9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVs2PR1jS8wsPJa1_kIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: OzNFvn5aoCG5Jd819wIu5lnTe-zyKaaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_014337_976250_DD7B5181 
X-CRM114-Status: GOOD (  14.20  )
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

Add clock ops for Pongo EKO_T PLL, add the pll ops for supporting
the PLL.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index ec5b4e4810300fa787420356bb073c24bb05da62..fc55a42fac2ffe589ba270010eb47c0816832ca7 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -28,6 +28,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_PONGO_ELU,
+	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
@@ -207,6 +208,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
+#define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 

-- 
2.34.1


