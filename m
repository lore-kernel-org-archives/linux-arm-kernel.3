Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BBBC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=RAIwGEOUwgQ+qtQx1Yr7Nnk4IX
	peMTFieX/LX6sO2OZHXfxSpNlZucXYSoRQxYV2YdbzIWrnxT0+u99ztAe17zjdvpfDrQDBnFIHQTP
	jMhPUkLurxJqqIgrhnKuN80xnNSLMAf5J0JxXkzJIPv/15SUMyUuWLd7W5z2E+53FOscji7AkHsT+
	VqSnz1J51PLyFfY1esmnnktO5mb6AXZ2sjAdGVjAE3K4P+oL/FmzyqFgxfELVaonKNXh2QOnnMKbb
	Ce5o4gHVm+IBDBqE9iBghoHhbW2GEyRCa1Aj5zIVXE6tq6DtoHb/0ZPOZf6A0LdgpnYGWLGZym8nF
	JMGXBQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGm-00000004VTA-3F0z;
	Thu, 27 Aug 2026 17:52:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGg-00000004VP0-1ug3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:52:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXfnH4084165
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=; b=dFjphGD1N1rclYjX
	8PSV+w6jwQkIr9YsWFTgstUfoQy0sQTtmwYkZwWGWf9WrrKhCCKDRV9Sy44n8wgX
	9/R6ju+uTmnYRNLj+F+bFhRAFosKeaoHAEdxTGctP4oFWJxbfstvSEJUzPcSqTvQ
	PNhSNznNXpI7RwaYqH/7/klKwEofU5m8o56E4GcbHF2B02b5CeFb4h1MbghFoCUj
	5CVoYfBPrK+W2mzMsTawrpG/17oOGRoBu2cW0Rr+OReb1yrcvZn3KQF8wr4wmVr6
	0MwOr0Bz145oMEBJLNBBgoFa5ucHyykmQjLc6lZbG9nt5zqEaGykFAl2Pl/yEXZh
	n+8o3w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7st84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:52:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso247164a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853121; x=1788457921; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=eB3+j+f4NRq84S/9z+U9EVV3agoLIqPYMryKLICpFNVFEYaxKSj5XSQV5ct5dveleo
         UWp6lxsdkK2ylGBCXXYZZQPnthQ+c/VQlNJ9gfIJCDA/5BdW/HAM6sG9fYQDyirMIENW
         Kbz81/em2qFhuMFFWPw8PndiTilJvQGdJvfwwr4HqEFPNT1BlqrO0Vok0lAPd4h5XAUi
         NsRfqqV0vnNfntcSEISsXyEqYcVbqaEKFUKl18vxIbDszh7Mi4sikV7mkfxLxPldq/ZT
         Vj58OUKDrEe6Gx3HFhJld7y5nPiMNekwB3Re5MVrtsmktAVP3fTeYtqyLndOHagwAG76
         MbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853121; x=1788457921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXdk8G4pm4CrNjX95hM/lx/4VQ+3Uhckavbrp7NZTHs=;
        b=sA1mL2C3MleBamuiJgYv5NDTjtCa7JGIefWMAC0P4+30keY39IWO6KRoRXHNClMnb8
         +wZqVbmWP2Bt896DGFn5IJkYTGU0G2lYwz//tM6Kmvoa40BDshtC2Hsk6n3W58GtkKnC
         YG2hoVi5joppoomhwHlgZASk8AAxJdpPxSpITeuUb/C0OnsHR2qY32CNN+J2I86vN9fu
         xvNxge0fwI4ufJJUP1dr9Dim2My8kW+px2ihWWy7qwZENciNzDbdfg+0muiE8rburrxu
         9v7CV921O87Ckts955CyZpHrvDbEQhbJEY4X3m27Ved/XiOZz2MFn25/x1YNTvlXAJMb
         +q2A==
X-Forwarded-Encrypted: i=1; AHgh+RrAFMWK3W1ywBkk3KbgsSbxGfXnxlhZHccaLVjIg4F1zJ886dHo8avQCBhQgBNdm5/8LtCiozik1NK6BF5Rnq5v@lists.infradead.org
X-Gm-Message-State: AFuF++nMRUX1OoiWIQHRES3q6chz67xdvzPKcC4paz7LEcQ390DCfpWr
	zSB2KN1Dd1JUhmovPMNkhAE5dlCr309CrgPQkD4EIQTURT2b9ddwewMZrYFVotheCT/BefNux3H
	dCods+9PutvMDfGucgahKUd2GbR9POt/xIPyjjUa+GNq6IrTczgGhQEwDQJPqmoLMX8hw7RdzsU
	uhfQ==
X-Gm-Gg: AR+sD12LK1ExU+v7Hl6oL2fBiIi91NWQI6lVdHmtTGVLRlXfXBRHHhaIFq2eaAm1f/x
	BqMY1+nPBfl1dGafEmoKPwugKqukyJaT/79qt6459Feh/Otcv030kV+lxbfBqW0z/BoVmdJoxh+
	fUbAuHENOCbYQo3jOZ0kDC4Uevi5R9zQ8fxnjx96h3yDrsb+xGsED/6wRPKchvsi3+SmpPxUA4M
	+RIj+C2crVDPnMze7AHlHd/TekKOVpw/ZQyQVbj7TgwgNbr10lnQ2olTyNEPL6Y9iLQ02J+CtyY
	drC7Pq5KFj7ed7gRkrtUzrR8fs/ZprdecYD86ikr2FaJDh9e+hScFYah3+mytof6O9nuFeXDAec
	PwFfwCZ5Ynd7URtExl++kmva1zaWDNHJKuW9DXHd6b/dE3W2DvhIO0Xe8k963IdAaWwHQN880Vb
	hzPDc6gxm50TB0P4dkEbMDK6Y=
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr15355805ad.4.1787853121186;
        Thu, 27 Aug 2026 10:52:01 -0700 (PDT)
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr15355045ad.4.1787853120764;
        Thu, 27 Aug 2026 10:52:00 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:00 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:08 +0530
Subject: [PATCH v5 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-5-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=2134;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=HmmI194gyOrC38jn1kOmQP92tC7eCM4pFbLwZh2jkps=;
 b=DJ/9X+zyxNdrjvjVzxUgzWUEDwu9bnEmv+BH8gG9CMZaVCq54yxqRXbSgGYGyRBaV5davTHKd
 C5aYGAAFLH0AN+pHU9UyxhEQe4FgERHHN0OYSx4KeaK5c2jJs9Qpcx0
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX/mQTmn/qEm/B
 HLqJX8wMzEU+Fr3cAyE2mgbvzLzdQj2irJ+U4QeuSczJuJ94wmvj3JDyQTmLJePs9ObEFZjPejW
 6LRWFcU44e64YrZ1eTj2EJzAQfjZ2mIUTBQQAfxb3JNxEm2VQ3vuy4/9fBB9nfgG+q0a0/qExLA
 65D7b96faI3MRa0Eq2r8kcbf/z801F5DJwUYTPWEyaJBEDMzSWyPFS02B4NnjeyDC/7ox8O4esm
 DTzomfexNeGmz2gohMzTMz8byVSE3exG1R2BoP4SL5slSaeCFjoEt3r2oBFoE4drINY/WeL4K2a
 pzcWBMazJUHBH8BWCfr+T+31Ln2kLdJDzjlzQxfbFJmybFsQXUuw9xVgp5NczVD3ECEGBvEJ1rn
 0Ac6YVVE+vbpkvM20yOuzkT/5/ZnBbQPnr0O+HbWdg30E04qBbl14sgIE0EFhhnbdZgwcI6gXTB
 D1bJxZk6ISzgVMQRC3A==
X-Proofpoint-GUID: Xgtdx8xzq-N-ybknEgeL3b0Ck5KKtnCR
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a907941 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Xgtdx8xzq-N-ybknEgeL3b0Ck5KKtnCR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX5LTSacXIa3S5
 REZJfTWAUdOrQtRB4HLmwYBVYqA8vmc+cqOs0O9u3JqqBi39/3ITMUGmrZ1u0uMlBYlSk7EW9VQ
 fw6n7OUMbRrVU8rymiX5/UiDn4PNM44=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105202_545410_7E6CA2D9 
X-CRM114-Status: GOOD (  13.69  )
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


