Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45354C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=; b=DvZShvJwENv2MTLYxc7bJyYUQT
	pqro/FgdkNzvjakrJ5SkKwyJNBW4GnFUIEz0bRrGz2IB0Br8wk8NXW4YhF1JFKwYgpfKwcCIF5C+0
	pq3pvfxKi+jZtyjn/OKu3uDwPUt98qyDfKlI0aAxsp/g8d4T4aWcgVp2mY1fEEeguaOtWXryNoR3A
	DJ+ZiKWsLj9ZEI1nXPQNIManD5zryZ4czPxectBbQmlShz/hDG6G2xaCrE7k1nP2/hmwzwBafWuKi
	BXRYwZhZFuQQ1cagXKYJ96H3wTn7x6jwiepxbWS8MGcfH6Zc21YVgyyjLN6QTKTrLkBiJ4dwMsvM/
	gPseTKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRr8-0000000DlRy-0EqK;
	Fri, 21 Aug 2026 16:12:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRoe-0000000Dl4f-12Iy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:10:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmGUJ2645589
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=; b=exBzJcqaIq9wwJQe
	NJ8C2aFeQTxEGuDq7YswVucBjbLHDdmFjC1AfQxgqsUIGcF6vVFpAIR9kSgyIUFk
	54HOmMzRJ9xHx+4aXiJwriH5AkCH0LQq4Ew8elrF4OMPGBt4WLLYteQ/HsXuJcjT
	VvULgHyzz6f549pvkP8GcgP13Ga3zM4cYSLlR7GNTvx8aiS0+Q7PpORDvGvW/DlS
	idYctx8WvLfQxJXqAGzkiqBb31VazanhqqCYwOBTnVqyBT9oAWjTVq8agDWrPOKW
	QiD02hD1AMdWlCtT+SAqCu1JPnG3te0l3ItQB2jOxt9JHerXKxrNHK3I9V3D21DZ
	c4GRlA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecbash3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:59 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45ea997c202so1664922fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328598; x=1787933398; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=;
        b=POWGX419+y/QW3gf18p5QPiT9xYBy3OZTY48sEetvCoEbIxXNzs+pTK9Ucjh7R8Wlx
         +Wy+D5irRA3dp3KTtGXZbAZYlDCoNwqtaH0zi5cxzGwlKpNYomiTaGfdnQjvJ1P9C2cy
         TjHlhLEq4hrnlAchp0qezJ61xLqbVLL4nwIodLwt8MYp2BV0R6MXZdU6Qf8vS8eSS5G8
         /ymCW80ElQatAaqRAUVFi44HBwsTdTutbuPkFlVSnQfhmyVUpDt4QDcrTlryY2E7WEen
         643gsxcC9ugJ7Vx73B7+gZGw4++iytsw8hH/Fir0n5zMlVq1l8XqWh3YrTWgyM5Fu6ik
         iwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328598; x=1787933398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=;
        b=p6fh6thRTb5ia9UDEB3wMvG+3vepGkO2+8wLujSuLd4yBgXeZBKPwOQCG76hywHL02
         671GrNQar+UOJk0x6c58mlaR6sILcI35ZL1+ZBi9dV28tzU/0t4nc0LJyEZXPQ13AGQE
         RDOr9B4lXef3WuPUwtDhA+hP3XUR6PrwS2ZZc+q4mjz3yY/ccYdHf9LCCPbARg2RfvIF
         OytxVZsLjMrwjS+1TBQlfAbc1ShC7cTDNd9hjk5KpiP0p8ydjA7bUGAT+bDmDnZhHbIN
         e+C1E6O+8Rv12ONKcc/euDb2A/EJXF++PeCNRUNe14Y+Wo57zOuciW2qVfxFzcRe2lcV
         x1Qg==
X-Forwarded-Encrypted: i=1; AHgh+RrGatQ8i4nz1q9jAs6TtqX9M5HAvurLJAUAQBatKw0CKEPW1ogy2CNFVdK2ZW7/H749PfpK02BJrS7paGvn4Slw@lists.infradead.org
X-Gm-Message-State: AOJu0YzJSqcJNV/NKnEggQ0zFqLwsT++nfO+AiKiNwK9fUwvwjdjAAF7
	M6Gkssh3+pr50rzIakFQlRnZp5H4nbqJqBZBzE5W+0Vs73fhorDGNuzMpq+XTsDZmNgRP9u6zeb
	r+T/6si3NeN+jOr+3qnqxkC9e4cKUT1+YVC2+PSQD4N61EkEoShiX8sKaPLeOkwBTJJdoC+M7f8
	IaJA==
X-Gm-Gg: AR+sD12vo/0ofrrOd/k1u5PyBNkMJRmho72IPW7GbRPTtgvoIuMNVLFgPtTrs2msWwf
	WNfk23ab2mXfsFLOZvfj//ys7LzFXQmIP+QSHQaRTEdNiF/LSxQcWHevuPrBR3+qgOP5F0L8YGu
	8leQc6rYtqZJiahxzBeNp8iaEgHO9CxBrfq9sr9OI06g4XerJtYlFwFCY3X8GpUE5rkHHDKDoJe
	eBmN3yIZ2HQGg2vsDOg7Ou4YNF5KK6mb8xopE7DBH1rvavm5BRbQuN0GndLPTLuWLRCBNjbDTar
	7TOWtsv0J+YmKHtXC+Ukg7T2e6tKQ+Gt4SoKGRjKe3P8QjWQFpR+0qLnHp6UcCWo/y47KUWLEH9
	rxUAaRMUugNxozlevUbjnq/NoF/wiM+WUpNQieDUz87+e48MrzSLQ2mVx3pxH4T+T+0k4OAcwaH
	LuLL75OZWcno/DlQazVOAfi34=
X-Received: by 2002:a05:6808:c2d2:b0:486:4892:d553 with SMTP id 5614622812f47-4b2eef57c60mr7714227b6e.0.1787328598411;
        Fri, 21 Aug 2026 09:09:58 -0700 (PDT)
X-Received: by 2002:a05:6808:c2d2:b0:486:4892:d553 with SMTP id 5614622812f47-4b2eef57c60mr7714168b6e.0.1787328597957;
        Fri, 21 Aug 2026 09:09:57 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:57 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:58 +0530
Subject: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=2081;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=IARJjUuJ8TzYCPtgJnhyF2BzcDD2X/PGevklk7LPqgQ=;
 b=KmDwPQXORl1Ra/lOX6PTLp4448/qlVRagyslHmyTMRKAmZ2TjRjYeGXCKrSJhH8L1o0oYoqcg
 mL+qVKKxt5UCvGeiVmeELj3lxlLw3pxFMOsKUgQ94CFkDvv8sp0mfH7
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX9x+5EWVHyPzg
 ZikMtiVHUggLK4UZJ6J57okqsbP0RQGFlNHJB9OC8X0P2HFn1u7tWlcXHDxgOtaPdKs0gf3wOyK
 gq2Uenxcikq9UTzLPJSAIaPjFTIoBFMhk0nj8paiqWJtmaBosMWyoAV07ZU/2b6UhZkLHBrYHkd
 q06HdTGcuDZce9c/JO2K8A/Q2mYF/rsppKVlPd6ekm1PXT1ZUvXZIQsPjaK+jrQ7D/aL/k/fq2E
 B7vdzcrtWZT05aXpN6lFYzANstiJ7omuxGkg0i6W/jqP6v/7s/yTNTaWnb4+68aEhKPV95nEr8U
 kKgAr0FKyd8nl9Zf0BgPTinkMDIavwknMEtcv2ieKMR0aBMgYFtyWtMlCimGh1g/s9VGDG0qETw
 LLpaUi0+LrVZD7PV2eWyYxXJBjSTS7MdJeNsEKusop+8pVTuiVNxHgZPyBuklV2nChXrwFSC9ud
 y619CX1rCF3ACSdc3Sg==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a887857 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: oO3OSEngm_kDtjo0QXvbDRCY_I4WzJ5W
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX/qe6buvv2NaK
 TrHQoApvngHOl80D8ajFD4rTIgLgUCR2BG08DkGLzAATuU3ZgnLd8CHvpGlMosfYLdg8qwku4vh
 GWyEf4MXEueEgVcb+w+z9NJ6cIebKpY=
X-Proofpoint-ORIG-GUID: oO3OSEngm_kDtjo0QXvbDRCY_I4WzJ5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_091000_415722_FE53195A 
X-CRM114-Status: GOOD (  14.52  )
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


