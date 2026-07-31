Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003C0C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b0WP9UtSycGWgT0Cka3pRWgg9clGjXOFM9dlEI2iaWI=; b=Vwsk5/X09HQIS/YSxpai0IaMZe
	9k6hPzGlIq2oaNhNn9wO3EdH90oTt6tLrYSTlukIpZuxYp4daRZm4BlIX+QeGuOPmwy7l3IXeRO9S
	HuGtPMA799Dl9/tCYO68uTFnTyFoCkKLJ2wfL3R+R2UZf0Dtlp0rOoobzQtlm/72qwEQY37mw16bZ
	YOu7+SGATP70ixYaVOH/hRbFb1w06GKZ/Nbh2Gu8Bx9Unm7rJmgSBNerZUZUCzwTRxfk9tMyI/KwG
	UIP7I61ykX8lNcI6rQ8XoEdUFV6jl4fTlach3/VKHlepZusUMm2c5HZX7aD/rmOvKp9i8ITcndU17
	f2QwjRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptAz-0000000DUBL-3GWw;
	Fri, 31 Jul 2026 19:45:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptAx-0000000DUAt-0mN6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:45:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VIdAPS959141
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 19:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b0WP9UtSycGWgT0Cka3pRW
	gg9clGjXOFM9dlEI2iaWI=; b=e1OtCADzWgCbQDeTXK1uGrKnTo6gIPRGdjQDge
	cnG/yshPP7u0HGXDaOVwf3icsLn3c5aG4GjbPrYcaMw4sDkCeMhSjCaRKjOP3IIP
	mKnWFyeW2xqoo2Db7e1nIrooqS1ykCyfhYKDj7q1k3/UlHvKgdsoVzen/pDw2IPZ
	dAfQE7h52HUTqN3H0DX+Tl31QGARe7pXttNqH0lUHzgZ1ajtW4vGGSpkFrs0HSKS
	76KgB62mxsm1h4l8CxvpZBg54AOGqvZimgxJ0ZMlKGcANS/tbgvlYEtpLeyN1RkJ
	kJPevz/sqpSH5AVJtO0BVtpqn4n6yj8tSs7ouNlcZs25Q6Cg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1326pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 19:45:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2126900a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785527142; x=1786131942; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b0WP9UtSycGWgT0Cka3pRWgg9clGjXOFM9dlEI2iaWI=;
        b=iZAB/rk9efn+QgjPhiZDRCEbXZbC8xtVvKKyH7qpx28gOtq7/We9AkwYBETHtrJODN
         5PFeOUfurUhJ4eEZXw7ckq2fqewEDtqxMsrxVuZSejLwTupnY/UdMkKEgPfUAVUpb7Ye
         yHJmodg2nc0by/5k+OxodmWRnhTSdwnNHT4RqCu5uxWosLuXKaAvJOG/ThulNr6O6bS+
         fiX1O9HNk/do21FtF9ZZ/d+VA+OdA+kX1kLHSxTamEbq6nEON2ItzKg4I5tjwRRF6Vfc
         a7Oljp4GrP24M3FxTcFXsTkcpKGvWsLwqClOblGuTY6AGwhG98hXP6xTK295J481a7PA
         eSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527142; x=1786131942;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b0WP9UtSycGWgT0Cka3pRWgg9clGjXOFM9dlEI2iaWI=;
        b=dOsCafPecB57jdw/LI0rVunJ++UfoJ1XL3ZLVoctCvolbvJJe54l8kJ1vjEnRJ3NOB
         z9FLNaMYwE1nOIz3xjHEg3/SNrzW7X2RMesLyNbYft6OqKE0CWhPtSP0BcDXlzFGH9Lt
         xR/KoEVOEua4W5PKINWDIV3k2FsREQiug3eUGvDJe8ibrrCDDM+qntTMrVyPinAO63RX
         8R16MVcBGgYkKG07TdHPdkLhPgFgAGoH058TjlJEn6ElIPo3wzkZ3KOxiMQGHKyS0oyn
         f1NlwRpDUKXzGwt5uxKYPlWOFrSQnT3v0PPZpvbonciN4wskP59XOuqfKDTPr/ho73Ib
         5tRg==
X-Forwarded-Encrypted: i=1; AHgh+Rosv+RQxuCzz0FbtHIa1kHJFgqumC/G/j3WVhQZR0x7qj1WzI8Uv2HTEfjdHiPuWQnf92QBRlDcT9/lyhhdwsXi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqu5Jm09dByxsDzBmR8QQaoVZuqgnv9hVcJvUZtf5axYc/Soju
	88wlI2iQTGPU4lFtXQD8EabbuLhzWxsQ2D+GHuHxcuDBvVOkKy3M+Vv74O/ca4Sl5hYqz+du6UX
	iT6jXdhY2HbanxmhsqO05qEf2KE7iodTh+c+sRfwRPknzDPqVH+lEuofryW/MY//aVsrLXOW8Mp
	tmNQ==
X-Gm-Gg: AR+sD106t7XhOH0dIZQYYKQOe0GBPiCu97fO4wD7UZrK+MdakVMGbN0bAsK/bOvBHqr
	nMxn/gA7rCngPH+LY0vvrmggpV1IIa65whgOqLA52K0IFyWZkD5W6dHQ302sehdaEs4REm76SOL
	noTnLjhP16Xbyh17BI+Ihu84vpBd+MNpINIB5eiXColPLlVkbGoXAD2GjywmDi13+fxDWgDl5GP
	ceQz/4qqfz3wm8dHQZxnJHPyxCFtKPSB0IxlfbreKa7FPrlHqlE6DLKE4wnB8QKZlaSeB218Zx1
	1I/Z9XeEDNQsFBkL2lN2p4Pq+m6HLRI65RHMHZoF6+Ixu8z94W3apcyWhjTh0nMYSbiF9RQ+FgC
	NWD5HXaVf/764jmZRqm2IYRHnaK0IncE=
X-Received: by 2002:a05:6a21:920d:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3c92a543d28mr1058856637.3.1785527141882;
        Fri, 31 Jul 2026 12:45:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:920d:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3c92a543d28mr1058816637.3.1785527141362;
        Fri, 31 Jul 2026 12:45:41 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm11489915eec.13.2026.07.31.12.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:45:40 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 01:15:07 +0530
Subject: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEL7bGoC/x2MWwqAIBAArxL73YKJPa8SfZittlAmChGEd0/6n
 IGZFxJFpgRT9UKkmxNfvkBTV2B27R0hb4VBCtmJXo5o9ImRb9Yew3Ggubxlh5YfpFavalBqFd0
 GpQ+Riv7f85LzBwOGvbtrAAAA
X-Change-ID: 20260729-cam-rivian-pll-config-fix-e5ab4844b06d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE1MCBTYWx0ZWRfX5p8Ott1QsB7K
 hZMu0QLAacm3eb0td0hmgOrYADrFah8/aQ00tNxG2tyTTxIHzOWxY6QYxetnmAmLDarPk6cTb8X
 s/3rw2cyZritBvLQvJfUsuRJQUicHtY=
X-Proofpoint-GUID: lpffNGs9TpZl6r0sxgU-PB6TKxDlR4a4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE1MCBTYWx0ZWRfX2oQeacxIK4/8
 cnK5cqnzrWTjusuZONux0HzxtZuOFYZD3rVNt+StMPKd2KUw7FAr6F6uhR3POvy25E6Bqy+Zjzf
 9mf4ikt/N8mIH/jqv08N8js05pyojscq8N4817NbN/1W+D1jMJGcketYD+yyvcFA43CkComZSTY
 5cS8I5s2L1l7UyiYs4aDoyJqtEnglG/j4uW0CLra7R+oShjKS//Aq/Pn0U5iPQYYF3/6ISqjJh9
 kp9U4Ca2oxWwfKXwdR8mG2bG/aXUQ2VFQ3h8O5y6731fyq+n8P/NP+SkMyn9hVTTmcr9DwGTgQ0
 4P4Zibc3B8nYfVvJGDmLSQwIPTYePfxN9R5VS9EW7jI8SZwbg8m+5uHg7GFzyrXbabieRmstrsM
 DF9bAdwMD81kBqMsaFWSaImTjhnw0AIWF0ZxDP4aoDGa0HZJALdO3SBAEw2FibhYS0tYFyElQHv
 96ct96QTHTM/D+hNzzg==
X-Proofpoint-ORIG-GUID: lpffNGs9TpZl6r0sxgU-PB6TKxDlR4a4
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6cfb67 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=orJqCwW2HSwFgp0icTcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_124547_355972_530CF09C 
X-CRM114-Status: GOOD (  13.37  )
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

clk_alpha_pll_write_config() in the PLL configure function skips writes
to PLL registers when the configured value is 0. However, hardware
requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
for a few rivian PLLs.

Add a clk_regs_configure() callback to ensure these rivian PLL registers
are correctly initialized on Glymur, SM8750, and Kaanapali platforms.

Fixes: 97255eedd690 ("clk: qcom: camcc-glymur: Add camera clock controller driver")
Fixes: f9580bafd39c ("clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC")
Fixes: 92aae35f667c ("clk: qcom: camcc: Add support for camera clock controller for Kaanapali")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 7 +++++++
 drivers/clk/qcom/cambistmclkcc-sm8750.c    | 7 +++++++
 drivers/clk/qcom/camcc-glymur.c            | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index c96e9196d908e5d20f24ecaf94393633f63b6ab6..b5bafc1e7d428567cfec1eaf3c044bfe90059151 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -394,11 +394,18 @@ static const struct regmap_config cam_bist_mclk_cc_kaanapali_regmap_config = {
 	.fast_io = true,
 };
 
+static void cam_bist_mclk_cc_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_write(regmap, 0x18, 0); /* CAM_BIST_MCLK_CC_PLL0_USER_CTL_U */
+	regmap_write(regmap, 0x28, 0); /* CAM_BIST_MCLK_CC_PLL0_CONFIG_CTL_U2 */
+}
+
 static const struct qcom_cc_driver_data cam_bist_mclk_cc_kaanapali_driver_data = {
 	.alpha_plls = cam_bist_mclk_cc_kaanapali_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_bist_mclk_cc_kaanapali_plls),
 	.clk_cbcrs = cam_bist_mclk_cc_kaanapali_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_kaanapali_critical_cbcrs),
+	.clk_regs_configure = cam_bist_mclk_cc_kaanapali_regs_configure,
 };
 
 static const struct qcom_cc_desc cam_bist_mclk_cc_kaanapali_desc = {
diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index 69abb756c04f2afba45db2dd371ee12f7b4366e4..45788ddb9dcc62a7c5d8efe086a235a337a18a05 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -413,11 +413,18 @@ static const struct regmap_config cam_bist_mclk_cc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
+static void cam_bist_mclk_cc_sm8750_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_write(regmap, 0x18, 0); /* CAM_BIST_MCLK_CC_PLL0_USER_CTL_U */
+	regmap_write(regmap, 0x28, 0); /* CAM_BIST_MCLK_CC_PLL0_CONFIG_CTL_U2 */
+}
+
 static const struct qcom_cc_driver_data cam_bist_mclk_cc_sm8750_driver_data = {
 	.alpha_plls = cam_bist_mclk_cc_sm8750_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_plls),
 	.clk_cbcrs = cam_bist_mclk_cc_sm8750_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_critical_cbcrs),
+	.clk_regs_configure = cam_bist_mclk_cc_sm8750_regs_configure,
 };
 
 static const struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
diff --git a/drivers/clk/qcom/camcc-glymur.c b/drivers/clk/qcom/camcc-glymur.c
index 81c1e102b110e5baca82db42bb0479d8db28db1c..6d022bbd2ce2ef5a7040abc2d5efe806ea45f0d9 100644
--- a/drivers/clk/qcom/camcc-glymur.c
+++ b/drivers/clk/qcom/camcc-glymur.c
@@ -2235,11 +2235,18 @@ static const struct regmap_config cam_cc_glymur_regmap_config = {
 	.fast_io = true,
 };
 
+static void cam_cc_glymur_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_write(regmap, 0x2018, 0); /* CAM_CC_PLL2_PLL_USER_CTL_U */
+	regmap_write(regmap, 0x2028, 0); /* CAM_CC_PLL2_PLL_CONFIG_CTL_U2 */
+}
+
 static const struct qcom_cc_driver_data cam_cc_glymur_driver_data = {
 	.alpha_plls = cam_cc_glymur_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_glymur_plls),
 	.clk_cbcrs = cam_cc_glymur_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_glymur_critical_cbcrs),
+	.clk_regs_configure = cam_cc_glymur_regs_configure,
 };
 
 static const struct qcom_cc_desc cam_cc_glymur_desc = {

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260729-cam-rivian-pll-config-fix-e5ab4844b06d

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


