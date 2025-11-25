Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E43D0EE0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=; b=OUpPtr+3Z8WgMT88ctVy3UFxLb
	cCYncx8PF0h2ClwIqcE1q44EIqDG19+eU5XbKSEUXgdn3vPqZlMFFoORYR3WkDXq8mvgIVwCDYrHb
	NzTuVzDzxkH4ys47yKCuf6lrri3N2AziwZzdDLPRR1Nm/Q0CPSLC0DGJCBFeTOiasHFY9bratUJXL
	Kx+mRkkmkxl+GSw6ihlctFsgxN9Eu3HVugLPnVfOYjJPe22W+K9F8xJtSJUI9L5gbiYAVr4PCxSzv
	7trCXPwxKyUV/bIGre25PsdXYVw8UYLJ0M2+UrrpZSHxpYpMswYq2xQM6A8knEHR+pw+NlJ8uJ6iw
	rMm2H27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx6o-0000000Dgba-1ET3;
	Tue, 25 Nov 2025 17:45:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNx6m-0000000Dgar-1197
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:45:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGKucB2655379
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=; b=OmejZUaHSIegwbWP
	nYdDKnAN04CA26fyMpoDRm7bJr173/6TLRyaxlqh/LnBBE5MyYruowlXN2Cr8NXx
	6osWJAYb/UO7W7AHKOnEQrqjW+q5KYH2Gtyr05JqHckHhKxgnL+0CDpzgfGIOTID
	4WmrMrpECw5a0cIlDI8l7zNdqjzhmpWdfzDulpr3oju1OFw8agWBfSXxTUO1k/vt
	ADCd+b6OVehes1/cAPd7pFPT24iBtXn+HBLeEL3GisM/4Uth3Vb5buc+VeURhikg
	8CC50KF6SNHKW5yvE42yPoMqW906F7VvDgbvzT9RmQWjM3MaI45e9P6Sm0vecoHV
	oGSvgQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxskxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:45:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2958c80fcabso155080975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092743; x=1764697543; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=H7eawClvouSlbLOD09pt44RFhXkvsU/bSkEHQzVsdgQO/BghzNMQmqP34cs6zoUGIr
         7TWyuNhKbzM+6tIZCWW1E/9o6PoBlMNaZ+UVmnLYIr+DZuEygEYU7O1GBztf69pU9DOW
         VYkEdjWHrRPnUjQTu59pa0ycgwxaI/4wmxlPAxLapfuEV+/S2ErXhh9UbL475bkM5VTE
         Jjs+OdcM7T8yvjW6SQHCb6KqyANAg6FZepjsGfFGWaQbRR98wj5cnRqHXXt2cnNuku2K
         pJO6E4WCC1pZPkIjtuqnJOo7xaP3JE6wgry1wIU4HXEEk9oRaB7XzwQvFIHUpVTBXkI8
         j63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092743; x=1764697543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zs+wzUVsHrOACRE2ziRvoBtbc7mFezrDRI5e7QURVTc=;
        b=qaSzP+mJ1QKH9SsGCNNLyxC5BZESffDEPKQsV+HZH4g85Oy4e9kAXWD7PVN1kc2Ftu
         2UumPGwmlGJDUUrXJPBKeEHLviyWvAYkr2Ap6+4/EfpbSImIgImnimAH/9Op9ETcr4lR
         20jOXmzOH7wzWZs9rinAf0N7nd2zGBW0nFk4sCPAeEcOBrAVEm+9qajOhD4oRmMbUdLC
         sHMvHrelqMNb3vx1qJXyTJN8dm6Ro6t8D9LNx0AUmk1LrmCfy/pc/2B10tAvyOI5N+gY
         Sunv8Tyutgbi9N0jM2sBThpELvJNPBugT5BQNykn/MD2cnN1co0p+zRppP0NcH7YDAFw
         bj7w==
X-Forwarded-Encrypted: i=1; AJvYcCW+QEutMiH2LiwT96tT14cAHKXhkD3eYV0IXGcX+e3zy2ELTXwQ4JR3ZVsACJsXrqSHyfH4PL3D00l+/xJYfLv7@lists.infradead.org
X-Gm-Message-State: AOJu0YyWz9s0ZWEJa3YAJtXwzTb8OFZLXJUIfyg1PTS+Q2i9FT83cLik
	BfbYEaMrM48gVtfUkJg/ZVAQ2PkRjbwZOZzSwP/VIU+rqma3UOt1Y2k9DZobXJV4EWXIPeBUyMv
	lA5HL8p8dULv+ipJd7TrQxwv8WPO94pYeUQvajdxQ7ZOtCa+6BfUzNOD46KJxs1m8Kp4FjM/NMz
	lZMe79WAsEbA==
X-Gm-Gg: ASbGncuvpxs624DY1qHSvXw7KnBcs7i0qQ381yLtRE2mSVXK6gogSnsZzEWQQ6MMKV7
	p/VMhF+KidaL0imn3q5f4h3oJV1E8ACc0/1F8t7exTw9z0cZNigScXe8ZqTW9eh+0L0Yt10laJp
	4XC/HckleSrhys5k/JH0/7b78kiJT+BHqrgq+W/Dcj9nE9thkdbAIgwzF3dNTJfvpC7RF8a7/BY
	uxWunlpOcC9zsjcYueeK7QwK0yjFhrr/rqQpV+ujIEZ1W/40bexevG/EcQ/0fON8QrIE2dtYLpR
	YC75WA5sbz+BrkDjD7bHkNC8VeTtbfyqycJBBSnj/nkTOlDBMrEe/n1e1jFqbWI7DcETdIGmLhF
	kOpV5zyg2v4kmmG/MR0c=
X-Received: by 2002:a17:902:ef0f:b0:295:745a:8016 with SMTP id d9443c01a7336-29b6be8c765mr182969025ad.11.1764092742592;
        Tue, 25 Nov 2025 09:45:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWkvU7FtwVCjG3746418hQFphvRV7z9bBpLk0ElI56NuQn8FoZbZcci0AL6j/gHuF7bZXtmQ==
X-Received: by 2002:a17:902:ef0f:b0:295:745a:8016 with SMTP id d9443c01a7336-29b6be8c765mr182968755ad.11.1764092742112;
        Tue, 25 Nov 2025 09:45:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:41 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:15:11 +0530
Subject: [PATCH v2 02/11] clk: qcom: clk-alpha-pll: Add support for
 controlling Pongo EKO_T PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-kaanapali-mmcc-v2-v2-2-fb44e78f300b@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=6925eb47 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rVs2PR1jS8wsPJa1_kIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0OCBTYWx0ZWRfX3SRcNSWsC8Qg
 szUaQGZ2rSLdyQDXil0lixx/yuM+ejyfdgjBOsQHS23dxufXJM2lY1ZdatH/sITTeWLn0lorCy+
 7emaQwMTtliYee0Nf9L7kuFj7ZDXYjq7MKQvTVE/zt5DPJKNXDtwqRU0AwvMWUe7SSlLnlpPGRV
 nHfFCQfsghuBdyNHzK12vQUhhmyuwOt4qYJNhRODmjT1gK/WO7FR9WY2p633Ax9TFr4R3VXdgFi
 UlFhQ7zX6zFdeD5y37zRbFCQGu4QhTkwgtuk3R+iEncTvB96/sdW2w9DoVrDRUqzPFps/suiS2b
 /0RTSGVAJP2+K3GmUNuYxYbYqkYlhVudDhKQtdzcA==
X-Proofpoint-ORIG-GUID: eWtfAHu--0tFCJyd90Ndbx0cG1Z-ozWg
X-Proofpoint-GUID: eWtfAHu--0tFCJyd90Ndbx0cG1Z-ozWg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_094544_291453_4F788797 
X-CRM114-Status: GOOD (  13.89  )
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


