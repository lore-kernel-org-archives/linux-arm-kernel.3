Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49824C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=fuE5zxomrGCq0GkhNU4Csjx/hc
	6T/HP4jAJ4nKOcXLt46NiRG26n6MpGSJiGA/oatOHqCFjPyTVcqM8xQBf9YSI2IukKFbEkQAYEQcJ
	rx465ERa2NPyI+Onmht/7n0OovA0IeA7YC4Q57lRZ+VIGxNI54fO7bSB6OOTc0QDZr+cGd5cz56Ji
	truuMy6UT+iGJ5qxcEyWVUhf7jXx0tOxQzO7mbjg3MpiQ6mBPwfAT8/qAN162cl2S7eoB6c+bnsow
	8XbI7Q7Meo7yxd+dlQ86KEUih1oNr3ZZb7bSVaBdjHbZAgirP/w3MJu8FV1FMAXd7y4pkzcjRt6tZ
	UZfZcUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd89-00000004Mjd-2lEY;
	Thu, 27 Aug 2026 16:39:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd86-00000004Mi0-1YU8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:39:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbfOl3829408
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=o83TyDGb6xN8gMsb
	k1u4uhRg6AVRaGyBZly3yJylYQopQlfd8SX+Wo9UEXt+L+GJZ9qzDIbeNzbsVomG
	UqPe3SWefrPwtG/p0etjLFCYFeh1vdT0IaRnjRwe1fkPJUkd3S5G/zEYlXySjspu
	UNBc6r3NGpu1lQOjcFG7Xws2VEaqbuEvWXJAs+dGHKuAlGiGoMseyFRUer8gqEq6
	NcQ7yGhg9gK99UrEc7qwrwJKnXXrRjm3JeNL/Vxieg/aKPau7p6xy4pJ2oerTcAy
	5dg9PdsAxNgY6/v+xMzZmaZ6DI+HP97NfRJ0nf6gUsRn1Op4hwxV4BLfiFQnSMXj
	otmmow==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7s963-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:39:05 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb6429750eso195720a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848745; x=1788453545; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=gBAUoF8BJKDInrUrykN7Ov1Sq/eLDCDEFhDqo8z0TJKM/Ft25QmuUoz91poWDM1mOc
         gy8jVcMwVQgvkoXnsRxhJynV5+fqt1nof8FzwEgcqYhj1KTX7GoIC9Jv2WtdE7yTAL54
         jbZ3py1b3cnDGQE3V5S95OVNclKzzSTCBcq+vQ0/9yEYsym/UYhfGM2L5I6ZVD1WfvVi
         iaYUkJGnm9Ne7bb0ByfnPbTJS47eFcA1zGmpwuCwLeFuGkz0eFMjrTC6bYCuokd2BD6/
         7h8NZk8wvLOIm6yVNJ+uO97JiAW6458r4yeU8oM2uJA4F3H30zPH49DG/FCufaoiFlL9
         IB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848745; x=1788453545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=JIVG1Cf9BTtyHumarEmnOnMbq9vnTsD8hB7kLgEwaQwlQMHi2GP3N3/k4OMVZUoBDF
         5hw3Q1RVeXpFh/I3puWImF+HGaWKrP5htrFY/WqY4Icg+24j6IV2tZF7axBFy0mfkyAg
         s+0BucDKGcdw9d3oJpIWZpyQVyaQjNm1D/p1fdFljxmXZqwJrKd6Q7KtPfgeMAugdU/U
         mv3wnlMi717+YmCl/+RKAb5OxZNvlP+eS4/k8LYJSAyeBNLEdB9mUxZeanwcNHWCkt6/
         uis4IXgQghXS0obfp0O1w085EHCQSb2jegc4KLKDPrvcLIe+cU4aKqMDLTvpgdOmNons
         aTmg==
X-Forwarded-Encrypted: i=1; AHgh+RrBNrExUOkPmZwj9XU14eb8d/r9FZaBsLLAD/FUtABNvkqIDYbJMRQOsSMLAmzohpVa2mHmp5355rdJoTCNfa7F@lists.infradead.org
X-Gm-Message-State: AFuF++nt3z+mQ7hEdEmzfKdt0GeryQzIZXzyQ1/TUtWYzj4WyFfIMy0m
	xV9z2hB8YZWgUOFpPAvuLSDpQn5shhq/mriyhEuD4DudfZxlIXEspfGRN79kh+KnDSYgGgrWSIE
	Sb4q0Pzzq3EWHi+YqDwHbFao90mEELKZJyhUA+BkJfOuRwCd8hIfdRoySdjnMHfpOysQnX+F4OG
	WSmQ==
X-Gm-Gg: AR+sD100olf+L4IBPbqbuFu8kEkOfOeBO1hta7FSnKgyxaedcQ5TarBrHtF51bga1bb
	y5PPsnBTAo2z/CFW9WHPa1ymYBA2MBELOF/5pBUSMNL4hEE8RM9/5NQy3e7ArxqRv/DF8bZiUUM
	yijLb+srXsLfktxe2aaUUUBcwi3oeVgAGLtx0VUhAdVYsuHZkDO5Euayks7OvCDPwuEUabuaYJx
	++hVE9X/V1Noq/RCAUYUVHUMvznCd7IYXmoGERn6wjgVedQwkwi1eC1ozY3h8/yw6AwgF5LTV+N
	G16fS2BAzz1Qfvpz9uxUEw/Wn8V7FMjy2HHJY9ZdDr6N3+jlcmH9OD2a3aVk7pdCu49C2BoTXkC
	AmWFTaOqWlIpXjZ7MycQ+d2YsIDJJWg4KrPt2jMYgkWoiFJOcUNVQnRWAINPBhuJ3DkbkJvo4fR
	19mGoIeWAgKuWIjkkF4M2dfi4=
X-Received: by 2002:a05:6820:c319:b0:6aa:d97f:453b with SMTP id 006d021491bc7-6b1a04e4f2cmr13126297eaf.28.1787848744959;
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
X-Received: by 2002:a05:6820:c319:b0:6aa:d97f:453b with SMTP id 006d021491bc7-6b1a04e4f2cmr13126243eaf.28.1787848744519;
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:39:04 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:06 +0530
Subject: [PATCH v4 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-5-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=2134;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
 b=O3qlxz7x08CxfPx7NLFQOLsmocO6gj9/OPvgz5ckr+LYjwS8kVRwv1nhMSuHzk1SITQ2RAlQZ
 oh0cx0wx1jqDxuqlif9h+RqOAy1CpyG+tAYF0Bac5NKmhO9lTdGgQOA
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXx87hlDgNcUJk
 Ha/Z1SkQ950qTfEUBb4hFEg93JDf3Dm4OqJcTDC+xpWXG22OhVZt0QigZu46EOyBzmz01wqzrzE
 MgH0nBEzCcmsOcg1RXZdCGJVVsbMujaFTinZrHhqIEoe7pwqoifSD/xhsvtcARjrODnbDmJNWIk
 CDTmKIQRbMZBXgfimwML8iLwqFWzWdWaMJFmgZvXMItlpd17wA1cbWhGQ3MvUMjtps9BeqBBh35
 31/UMvccHXn0f6qEbHB2JPsNsoBbPKWDvj/0IrIZgNn9kRbJ0WLanGmeGgqHPBlwAXiCA7Z/+df
 j828Mbhbeo3XlahYubOTgoMLwZ9ziKeawXgOCNHpZCoMS+pLIgPQLfPMrWj9cR+mC3J+ZJa3BKC
 irZJMgtGA+wbOTSmcZMSGBzuI6m3L15io4l+pqt5kofes+6MPtn0oZJZs//Hpdpqd/5yHVbDy1e
 mkvnc2b1QizDNc9hfiw==
X-Proofpoint-GUID: F1b1KwEplqa62Nw1Z8ETO1z2DCVaSWho
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a906829 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: F1b1KwEplqa62Nw1Z8ETO1z2DCVaSWho
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX8mMXzel4r7E3
 SbEvHJDL8phvmKelJRTPWxGpjWzQEBwzSpP402+oPZsZMasWUAnCyA3FtzWCDLerZiRsNLxXjbB
 tOtFdcJ/CQUPMyOE7owj4Mz2smXDdSs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093907_330572_D50E95D5 
X-CRM114-Status: GOOD (  13.80  )
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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index a224a94ae273..ec8700b6186d 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -937,6 +937,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
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
@@ -1097,6 +1111,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0


