Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616EEC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zp+kA094X+7twp5uja4H1YDm8f2Rm0D13sUBNmXg8Cw=; b=Rla3qwiBl06WG+e+ML/SZ/hYA0
	aM+ncPuhSuk1He1Q9EO35NCMLc1rlDONFBebwomsjFvibJZ6tkhUJHjNtifzRy6tM9oNVcmh00duj
	3BdyMsB4VIeBggttwpdMZuI8XP1IL5NM6IgnyCnYpXfAOIGuWleBSepFnx7Hgz5rM0swswqACJG1A
	/qvvp9xhKe9nWtXznFf0uVGP44rQIB3YcdDn4/+eRfi9GtUW68Ry42t1Jqi5UXVTQBbILDn7TQ5CG
	MmkTB+U9phec5UcL8Vv0nK0Lo22IG53VI+VOoXakH7VBq6U9tN0RD6g/uHcJh3ub4cUPFxK76rBMY
	Ie/fz5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPJ-00000002ADZ-0BZO;
	Fri, 14 Aug 2026 07:32:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPG-00000002ABd-1tcm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:32:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QpGP594176
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zp+kA094X+7twp5uja4H1YDm8f2Rm0D13sUBNmXg8Cw=; b=HGJngbYjRMOrarCE
	KFhpMptW1UjYqafDEYe2rL6wkNAV2KygZXURHGALi/gJZgrCPl8nQDHokEoT72Xo
	z9gRZfqQs5Z2MDrkN/GE6mJM/ABiOirplTtrJIzco3aEKCExCLOiB2Evl5v6/SnJ
	JR6gs2M1Qr1IpRyAyfl6WOczN5M1CnUU+4/waHhzwZwIbA1zkohAaTZlqgZeRwyQ
	YKahf3EMVSV7CcrSojbtdgfzSCI6oGLfTzsWdVW/KPiRLowSmVCPUug2Uk4yeJFV
	1vfkhGVS28IK6p4gzP/ApnuAZET5/qtLEvzZ0+O+NpW/qh0+x5raz3n2aXKjeVeA
	Eo6spA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4u8ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a67b16217so857009b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692764; x=1787297564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zp+kA094X+7twp5uja4H1YDm8f2Rm0D13sUBNmXg8Cw=;
        b=JG+HFsFAQuZcXZ5Wzri1+3E2P8QE9b6O+XUFA5X6Ep4EEExzZzgvXsu508QBWSD8fe
         /Y7O+FYuShWZnqH7flb7bMrMk4Qfx0Wzq7ptL8iM2uBtSSHIIq2jm2u/bT7slzTKCbwB
         rMmZkAKyxkZoDryImcdjevozHFCTGocdW99E+T//jkX0x6FQRYR3sZVreudfkoG6Tng9
         x6BH4xp5107JCizt4b0zEf6aaUkc6pUM7w7SFCbQ2DtG8/GU4dpRZVbtKaNsE6kI6z71
         ritJfGfiaFGoJkahk0RfFUD9pc40cHeYel3EzPtXbHuq8mHAEDBVNxMZxHWQIvgEzXOc
         Jteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692764; x=1787297564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zp+kA094X+7twp5uja4H1YDm8f2Rm0D13sUBNmXg8Cw=;
        b=m7MC0hD8KzS6/blneVgJ7ZrhBo0CSCcbAdZhx6vQpQtFhvCvpuadHZr/1Jz9cBMgGs
         NFPqhNejyMs/eO4XLoQowl56uPbOI8tI0tNxeFDPvcMFVIR/rOCVUGjzT4nfRz+7CgrD
         DsrjulxWjkdLsCr02C4aGijB5ifZgK60yV+RWIouFNRQmQwW6iDUDsjtvz9K3LwE7vgZ
         9eJOHU/4NLJu74Cx2Be4AH3s2CAxsw83T9rje/95x/TrVUb0bdaxK9j4a66CcTINw0R4
         lrDSkP92jGxqjLCmaqTqoKhLVyo8e+qf/4sl8JwRmS84LvwOyleFA4HzJa8oMQWASx16
         cBfg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6BOHq1oK4ER6tVIxHzfQaotT4mu0XV6I+m4AVyj6tAmAOxYfO1+xOe4/9zJk+e6sSy78jNzGRjVyvkI1U4RAR@lists.infradead.org
X-Gm-Message-State: AOJu0YwvuUdhgGSIMWvK4voMRNTrjfFSS2BguyYusmB36rte5VGFZ5W3
	7rkA25UQnwgO+AlrdacSxcyMdWL3fErPdqlhsgMSnR7iKXl9BwJVZ3gI/LDXsdJ6b1NoFjVyoUB
	2263UEnrqgY3oYnkKy7ree3CkZbt7In92cVfsQ66rrSjxnqlCg92IwT/FOnQ0vw+M/UtQD0NOss
	3K9g==
X-Gm-Gg: AR+sD11USA92QekvkOMSh7EznS2IQE3V1g52Q1ZmXgXyHj7ckYqScCP1LwbGiN6AKpt
	39LD6DFNS7Mfs5l/VcEfvvF1sDPZtO3sJBJeMU+N0Q66SmoDPv2xEZtsvXnqjtdJ86hXHpY8UNB
	rGWAGrZR7+Jp5UdpPGPFLHGFshiO7RrielFwbrnTHSsKfsu4WtNk8S7EfIbgd+pP73RpmDA0w6Q
	cO6ElDP1hZI6lTS71ieKHjvrW5q6VqcVe1YW/3UkJ29MAVtHhiVYvBKS8hqE+eJOISkwbLKRzdi
	ndfGehzDPJPUhjeJKTvb3Rk1JTQvUgQ+WGROV/NnjFHDk7zartlZ/Etzc4AQYMnr41vKEfh+f38
	qPk94/DCA6BdaBld8orC6L5nJZi44HLswOiphtiaUOXZ/ETFdRQNNtnQ2WEpdReVCUahXD/zmVN
	rDCROkMprbqlH7EQ9VrIfQwAY=
X-Received: by 2002:a05:6a21:3398:b0:3bc:5284:5445 with SMTP id adf61e73a8af0-3cc71d53eacmr4045601637.21.1786692764419;
        Fri, 14 Aug 2026 00:32:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:3398:b0:3bc:5284:5445 with SMTP id adf61e73a8af0-3cc71d53eacmr4045548637.21.1786692764036;
        Fri, 14 Aug 2026 00:32:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:43 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:36 +0530
Subject: [PATCH v2 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-5-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=2020;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=8hC59DyE4kj4f5wzO4D/36omhn2O6YGXfOLRxNZloa4=;
 b=Bp3nz6QUprcZk2VGvZmq2p8bTdzjWGyyjR/4qIxFefb+IZyXceD21k0toykb2OeXrboXpRTIL
 rAH62D/G2N5DfIQtvymarQsd9LnsiUadpWv7+b/csPnmAztLysObdNR
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: YG54NxxURFB96KWr-9cciJAmT2JzJ8xA
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7ec49d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=81ep5gnlwPa1PUBqnVYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX7QdnlmMqJzMK
 6Otj+ShO7KtzlFUHxwn41+m06ytt7CXnzlri4HkfJh1u56FyI2merywT5oU05NM9zaDte1AC8Sp
 1HOu4ywGSLM8A5GbP8rkEBuMJdmBtqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX6SHA11EHHHL1
 MdvPmltczzyr4RAGrInsujQpP0c/c43WW3KwuhBg/FotW8f7hsDRiiWE7oSd6IC8rf3qJrt9iAx
 LVyxl5bPKXpaF2PFA4AS2UEjjngObHJ+fWLP8ltJHdRfsxy+8LfIPteHVy+9QBGnQaLO5xptF/v
 +UCFGAPttIlRIrGPraassLyWtBELXp//A7b/c1sbHHlMmZdg0JJ9eHWLpAYCjS1JIpajXPfH/B7
 Z4j+aaje2d/Va/pfcDFrMWvHiCS3dBaLJ+d9rjcCHd7z7hl6pIwreeKWjif3/LURSww7/OQnMeI
 nvgcPcjwkjgIiKAib+TJUp0I/cAUWK92AolIvXFhnilnsz+xIzLY/VVIX2kPZnNYZ2wi6P/W7TV
 g1Iw6LlLkLyPXbMiXN7k8GbaZCxfg4V4HAA4M0abaQedk5oaE4W6RtTzOanzxpLCR1AsCJMfM6i
 q1B91p5umdVYf2TkD7w==
X-Proofpoint-GUID: YG54NxxURFB96KWr-9cciJAmT2JzJ8xA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003246_620650_EF9E28B1 
X-CRM114-Status: GOOD (  14.41  )
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

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a4e0..d8c3a6b12d4a 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -943,6 +943,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1103,6 +1117,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0


