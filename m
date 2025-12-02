Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D836CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=; b=gKeAj9Ee9otVsGp4VDABYgG6K7
	N/URK4bLCjKvxjtdkX66+QX3Nre51Jt/O16PFxX82Kcuh9jvnVpdY9PZV9NrGVB4LB0w+3FLvdSK3
	ptHxcBr5ITT+XdRgOMdvkrx1f0+cuXpZ8Tnrr1T6CNcF1z9yMB2LEDijxS3+5yFP3aYIhQ/MetP+R
	AG5cW7tFGvLzkEW9x2RM+ugev3CG+qhxwx0Wv9bpJuF3XBQk8E9XjoejAhVKEPk1GBsTLVcynB23u
	TYdfKayQDCLa/ak/CuUj+zba/TCAqY71AM8VqTlQr8IAzR8W9LxjVG/l86UIw6spfwsJyvxwYGcPO
	Ma6fDSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNav-00000005FWB-11vc;
	Tue, 02 Dec 2025 10:26:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNas-00000005FUw-2qFF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:26:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B28N90Q3284660
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Dec 2025 10:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=; b=hcUfdKCeK3ttKukg
	EI6yHuGnaPwb3B9IGNWU3xzBT/Nui1J8//lLC01yB2Xt1B96IWQ774hNp7h/KGmY
	b0nC8Bjxk4rrvwCtYenxJyZK1Mc+JrJftWNRcdzqeNKQ2rKtsZoyI3D/WMaywYhZ
	HcmyDWrxmuZ89G3lvx1Nenm/noBvc2CRKmXFwW+isyi2kQuP36z6pozOz3NNxhPG
	kRu49IuXGgSPWlutavikhZoOudtXnBbWSTR+OvFP9FkjOsrV5Rp316nFTK13QkfJ
	7UfW2pvTczdviQqKd3wekUDAxRqHK5WXQeoT6rqDXYQFiNP1gnibP7x0Xw82Hh6N
	o74nsQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asvj90cwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 10:26:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aa9f595688so7576568b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764671209; x=1765276009; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=;
        b=iPfk8ojWapaou8P66XPyviiN9zG2rdSYMqhR+lPVZNy5l3nVHjr0r3ZOqkzz76R2rv
         dgY3ttZQERmp3NHtFKU2xVwW6byd5pdoG1Wq7eMQrHT/7myMaGO0Uu6Jfv6NRjmmeWBE
         Upo/pPRpczfcNMqknurZkwkGg2A1/18YjAzVNHD/j5oHgUUUXuIkqt8Rpf1DOmrenCwX
         VOaQmJULj/ncn/INoKgxpuHokqz7dx3IDbbL+Ojursl8mohocV+3IWHOkU691QF1D2yi
         ZhFZYfVso44fFZOJIt9pfI98hYBNOtLwEh5Pxj5TQp0OjoActGsrCKDUDNw+ExiJbxCp
         5V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671209; x=1765276009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyPluVgnUgAYmNSztPK9FzXm2nnVdVYGDg0U1TBzdaA=;
        b=Rhi1Jgq4G2kEGec327mNDSwJCeKeBCaxQ2+1W7bgeJMaDglNt84widt2ov81m0zZFB
         H632iYjwx/WF0FPDKZ8yLawaGv28UsaYuQoJELQvB5bhudlmMrppkiY3LnEBNVoqEvMB
         ebThprtF4Kx8UfnclEAGa+ZeMHT4bnJRFccWSPom9M47CCekP6r2ry5InpQQUET5W8O3
         Asc5cNhhZ5E7VzTexM9UnDlyHgSXFnJIdY8knz3/GYM+mzdn6RFsSkRh6q0k4P0o5kOs
         WvWHsSTDMY/oEIuYijYxbuFaWQeSd4humXL2BCrbwYGoD7/YYSRWFUqCRDrO/Hg6Pmc+
         se9g==
X-Forwarded-Encrypted: i=1; AJvYcCUy8c3FrCiEiz9zRGp7BmB9W3pWUUGyRrjG7bH3RTvfVO+GkEbnOyOVMW2b09ZRptuOcBTmLp2kOstbOoyzOg/v@lists.infradead.org
X-Gm-Message-State: AOJu0YyjuQP9LW9q8zm89ykUdt+0wPHUsC/zLNZ90zkupAsFguH4dVY6
	hOP+qwPqlCSJVx19Ve+PJfPTJ+IkUoS4LxTPHmwJwX6qGZuBmAHWZgiAK6zDbQ4OiDIB7yEYfAg
	xbSBB/dnTChSBrlWkJtPavaeF9REBqALJ+U844H9beA/WUywYzCzW8AsHUOFgRV6CoPXJqwvOqB
	+Tqg==
X-Gm-Gg: ASbGncv8Md7+2B443Qm9lTzA7ysYCLfk9MLQ1cKNuNjJPVhisV7vacrQf8XmuO5zhcO
	sXuumvf9qb3dNVCEcZF4cEMucjxfMZIG7neVEKe0CEHmfBNnz4XWawLP2HqltYe96+0UPRi7wwo
	CzyO6PYN2uwde35utLBiz4Vp/w5fN5Kcnhq2VK6Wr0BZptDGIGw4u65KnwuDv594ksFmXy+cj4z
	wpYxUzb8nJKS5xdFbINolgZVOlxkn0jZXhQ9qlLX/+ZcivRXM1hQ9U7BmHyoyv0svDvEst9L/D3
	FewL/4Q8MUUwXjH+AlAOpvuFJ9QuDfckQOTM5srgyo+LMrGwcjpLJyuMD8AyhrFrDmBXraALxc3
	BgQeDNGuoizgXwz8fPlgyhNqNCf32xjRwKQ==
X-Received: by 2002:a05:6a00:189d:b0:7ab:e007:dec6 with SMTP id d2e1a72fcca58-7c58eaf2874mr46343184b3a.31.1764671208745;
        Tue, 02 Dec 2025 02:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpNfD8nmqLv0TcMm5gxpZyZOh2xWWnJZnOrY2LiRkeixNuQOxOdAG4U5ATN7FgjOGKybBrhA==
X-Received: by 2002:a05:6a00:189d:b0:7ab:e007:dec6 with SMTP id d2e1a72fcca58-7c58eaf2874mr46343152b3a.31.1764671208286;
        Tue, 02 Dec 2025 02:26:48 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151ad4d6esm16379511b3a.26.2025.12.02.02.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 02:26:47 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:56:25 +0530
Subject: [PATCH 1/3] clk: qcom: clk-alpha-pll: Add support for Rivian ELU
 PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: YdC6E0pE0gtXBXDRrJGkJbaJ6nSwanLX
X-Authority-Analysis: v=2.4 cv=Hq572kTS c=1 sm=1 tr=0 ts=692ebee9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=03jAwwKPUxsBcueUP7gA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: YdC6E0pE0gtXBXDRrJGkJbaJ6nSwanLX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MyBTYWx0ZWRfX8rRc4swP8grL
 rKK7pxSihYaV8sztNWs2pDDfyXtmYazrDE/1I0swNRjfwfzM3TF7zfl8SgIr+mifjI95l7iJIF+
 05Kk8zGAl18eTeqYdXKyo++l8fOjg5ld1bE/N5RxUDCAMRJT9FuBIYiZimuDcm+kdQo7SG1SYsR
 VCncNSlZj+tSh/1CSyDT//UstYYB86d2atFy/kgm66sWV/SvvMCvYl2NZs+KEY+MHPm0Dth82Ex
 n3mug7S9YYA5wxuTzttwb8V3/TpLYgRzXFAMbo38R+QYGDI2E3X+6WafapON3xWBheeQj1TAzuY
 3XuOokcfquZjBzJD0gNLJVGmW4wq9kP6WvIVjQzhzrUv0hQWD3JE8VLdymcH3ymWhkMqrB8R0UZ
 4d397Jo+ZBLpWO01Yl3fFsxtN59yDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_022650_858086_2612D95F 
X-CRM114-Status: GOOD (  14.82  )
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

Add clock ops for Rivian ELU PLL, add the register offsets for supporting
the PLL.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6aeba40358c11e44c5f39d15f149d62149393cd3..8586649d76f8aef119ed51fbf1ca90bc5e3ce510 100644
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
@@ -3002,6 +3015,7 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
+	case CLK_ALPHA_PLL_TYPE_RIVIAN_ELU:
 		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
 		break;
 	case CLK_ALPHA_PLL_TYPE_TRION:
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0903a05b18ccc68c9f8de5c7405bb197bf8d3d1d..b4492197419a7f326a4f6e6607ccee58ced509db 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
 	CLK_ALPHA_PLL_TYPE_STROMER,
@@ -208,6 +209,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
+#define clk_alpha_pll_rivian_elu_ops clk_alpha_pll_rivian_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_regera_ops;
 extern const struct clk_ops clk_alpha_pll_slew_ops;

-- 
2.34.1


