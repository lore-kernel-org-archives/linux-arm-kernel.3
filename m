Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE08AC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 20:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=; b=tRxtfGRqEMf9BxNsZ8swdLQ/4a
	1ni4AYMZUD3gAdWZdI8UyHzzyCo2EDfE8eHZoXjubNqBtWzcL5pNvPuLJR4ysbzAjuov0Ldtt4oi6
	oDFKF7YsAYwjtlHYKM+qn+lEM6eTYwefs4OCsw9lJ5r4RRYD/jE117vdj5G39UpCUSjXuxEczsN2c
	qsKxA7y//9I9/PdMaJP9DqWucQmF/VA5GOChhgIU+ruT2LXzmhJ3Nrk08v03dKuJhrP+N6oODEmF6
	KuS8FzV3ksXnihqNWAbpflJZKYJeiKDOisOLnUym/P79bTRmWdPZqust8we29w5cp6MMhyRDyv7at
	SD2K/WAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wWo-0000000A5sy-0fFg;
	Wed, 16 Sep 2026 20:46:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wWl-0000000A5rj-1mHd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 20:46:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GHP7rN3238097
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=; b=FGkxKHRqdkxCE3fW
	zl2QlsrkmFR1lZZFof2rb0NcGJBVUnjO9epOivpV8+eWyH9zPzERqgnFxD17h8VX
	iYgnYzci4wkQsb+4jposJL06jHvBaex1vK6mhQWjvgHbRJW3k4B8MSteNjUEpwDI
	hf3mHqzaf+MVJHDIaw9JPaUG8QsUyVQ6w5j5dKwx8kggdcDNa4kE8wD1Wav/R29B
	DNokNgcwKCHOaPNaLpgTNYaVlssI9Q+637MCBBEshYyuNB9o+guxbBcGTDFkXkaL
	UQqu/0hxrg4HldK7149K+j5P+fmL8WWn/9Ygffv+60+vJHJjUP2hvtjcO9xCt1zR
	mvfGKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqyga0s89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 20:46:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530f9b8cd29so796681cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591606; x=1790196406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=;
        b=glyj5z2ffDGFQQFAO4W2yL3vS8Z4zNKxxEQeEoWLxGfMQrLo0E2vQZuOcY/CkSJyKQ
         F/hXBoqhApcsEv1p8bK9BAJD6LZJP5GoSpsyqHHnLy/6I8OKHP+gfMm4VPTfn9dvtiCY
         DMXxgoOvX4xssdtWo2fj1lj/tDZMgvlBCDg5T7kX/o6xYk6Bl0pWDpdjEhbCq9YCo3Ti
         bAOY0o7PSl9wL1rzH5xvIBbSAanfhd7ZFQ/JPHvUJ7WIEaWjKIfrrX0bTbcs5oOTCB/G
         31gAQfIcT7HPC2jAF+z88k841tSnC2yexk+q3yxo9N141XwzuyFPndL1ZPWYrKw7IV4Y
         atFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591606; x=1790196406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=;
        b=lba4vLjHYtYLSgYj1RfOHzye76GRm95xlW9i0jXU5CTA5OdGsdlclTgY0D+yfK0ogk
         cvFCGlcRUn8OmujazJYfds2dPMg904bApe/NcsZtZT5g5iYgzif1XU9ECbpAAoJE7ju9
         T7srlxPaT5Aw2to7ZtHy6Aa2h5FIVpYzfMhCsVv959wgjo/cn8pBPoAbkjW9CSqmQJU4
         azR/luUNuOtn5JZ2uqR1UZ3mhhFZh9cYlbT1GQR1IJjsqwyL3h6xziQKi1g6kMs0lwh5
         tbzsTf/Xj/RIWUZ48Onlxz/S/X/POx4T09SDmCs+Ye+KSEyjLw2/3CRELvmygOY99z4x
         5V8Q==
X-Forwarded-Encrypted: i=1; AKwUvBywkQJSfmSdzbJmACgpF0UFD7IubiNaWOlBKydRjMsHCwCobZQ5z9rG+MiRQvCvvWm81DXFlTp0q/JtJfhfXjol@lists.infradead.org
X-Gm-Message-State: AFuF++k+Y1rwKRwL746DIvJo1YXHfAogD+CnpyKGS1dlayeRkPjGUPj8
	uFU+Unn9pyEdeOQ3YL57EVnXjEbtaqDDvNzSSuzD2BXBMCKBMZ/82yg0nGNVI3MXUodKAofaLO/
	GrodkS0s40jCVUYAIay1NXv9I/luCc9Qrkr9ayScy24pCuz1dxxIFCUwqny5kNUg4lCWDWKjzZc
	VTuXKoATNSPg==
X-Gm-Gg: AYBFou3rXzcaKn0lrvHiou7Oh4or+qyAQJ3hWMj5pCKTCMTBYzv6k+sZ3xjZFJGpMtd
	4KJYVSgfxPMXRpdnULPZkvBJ2cmw8IeJy86HI+CnnInY6fi9wefqS3x6J1NzAkxYtT8zq98uCJy
	LhG4EWI9+LzqmTt8KtKkR6WVo2y3kPl4LyLdfWMbK1f1mitEhbKlGrGl5JSCiyNMVgLxvKXtIm7
	rnI7IJVA5hDfXDYqfTQTi94LoGfiY35h9s7li27nSKwT4RKE7fne5cOrhtBmmZCLzIGoI3eR4WD
	Ui2khhA3LtIOb0MHHj/ykysbdoMtcHFyB7/PFCm2XKhEvUrOpCfSfVS72VIzBzLcdfUAp+LF8XZ
	8hitZ6ae216wuCK0pwqTP1MQ=
X-Received: by 2002:a05:622a:151:b0:530:f1d2:f39e with SMTP id d75a77b69052e-5327ef109e7mr69027771cf.40.1789591605628;
        Wed, 16 Sep 2026 13:46:45 -0700 (PDT)
X-Received: by 2002:a05:622a:151:b0:530:f1d2:f39e with SMTP id d75a77b69052e-5327ef109e7mr69027291cf.40.1789591605137;
        Wed, 16 Sep 2026 13:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 22:46:33 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: Suppress a few intentional redundant
 whitespaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-2-81b86685d068@oss.qualcomm.com>
References: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3910;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEusXuICV9Epshdd6Pdkkas8eIUI83cgzBxWfSGQQns=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwAsVybke5T91kM1TocXoFt05g3wt+bikxgUG
 w+wM22d1WKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsALAAKCRDBN2bmhouD
 1+lOD/9TFBqkLUx+ePlnMqvDYZKE28RQugErzOJgTzp1O32YJZrIzFPBcM446BJGdLR7zIOsOyJ
 jiMu9DVpm1SsTAlUX7FdNyFRtx3j1yts/ZIrRd3+3ec/9F9o5U3fJW2TVGlHLTPBJNG9abphIm3
 F57hiSEdrx3nJM1vWMgkalBI3CLkTzE69NbxHrfLOHfoJHJZdNR17MqK3C+9KbVg8dnoULT5K/J
 ZLpFa11hAVy+dvLo3yiPhy/ftAafocA+tY//qkMH78zlyeDBTzlIqV69N9kV9FXWnk2ITHaBTVD
 ykces68TVXSqRQbe2jvoS4+DkwgqDfRYdpopg/meFoqA/2G2Yx5+8rk/x84pPbbFF6mQv/HcvS3
 pyDWrFjzMpTuJ2yGeQOu45tfq+EgUXLt+ZNXBy5EKrljKX0Ch7cU7J1YsV+v0mE8r6NoVdf7oT6
 Uo1UPJZ01bDpReL2Ae8brH464IniDAFDiUuu9tc1LIGiPbGEK8ZG3aDEa3M8QzZ07gcJ0APFBO0
 3szZUGdX6V/GIIEDlrP3zxpRacohiXUoiGgJQ2ko9kXLM4M1ttYQUWXWhHHLMMpiykv90kTK7z9
 QVEgjm7XIvJqxW8klT+fVtZQ+ttzcS7lkRT0bVSsdrz2KZkBfFJ8ndTgHwhfTmVJGaf3GDQ3AJu
 gTjh9HR2CZ4rEww==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: kxuppr7x5HVFg8aZj146cqTB7cv4TgNm
X-Proofpoint-GUID: kxuppr7x5HVFg8aZj146cqTB7cv4TgNm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX7KWeyyla4Q1F
 +Us6ImKnJB6h05YXaN6qFsHczPmX1tTrWS7r4q23VbzBuNBTQV8n+2PcMBnpi4zc6Sap/0BCH6/
 zOHXfbDdRDuqPYg+RiOGS2Da7cFqdeM=
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6aab0036 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=I0iP3be13vs9ipy7py4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX3pMXoQYRdu5Y
 ZeASURYShF/xecPsqkHSvJ3Ss6nNbRkPndeixnOCLzkStuI5U7AM+HBXKz4DY4tu/1FTJ6dCbHt
 CEtlRksUhS7uxRcqF/swnRTwR8jTBxNIZBc6cMCr188STIMpYPnPJH+3rSzfuPqskrkLBmaeOyu
 CICQzcaYZLKK1VAnQgTWF64FfQb37OKMDpu+qHQ3CVYxkMAerOwZ4oGpUxR8ZNnpE+6Z7HnBJ9E
 tg6xtLT2V1yKFFdYeRBegsG3OayHS5A0vCNGWkrAHks8OayNCB7atBjKov4e4tTqDY8q7ZKgmhl
 82l1mn1o8w1tjljMgqdn/qLyAvATt7zAVK6UUd3f4CoIAkxjoTO/vHxGCNMozrKye34uUsAJu8h
 MPLqP+AqCWqVCD43qKafygzp7tCvE4e8x/Ya2mTnOLSM/avShyER7aVGvKfPUu3q5NZFlCQfI/z
 RQnSpzLzZefHc4tDFcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_134647_587332_3A36E253 
X-CRM114-Status: GOOD (  12.43  )
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

Ignore redundant whitespaces in a few places to suppress warnings from
`dt-check-style --mode relaxed` like:

  sc7280-herobrine.dtsi:357: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi           | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 58ea0532c0fb..21179ca1219b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -354,11 +354,13 @@ keyboard_backlight: led-0 {
 pp1256_s8b: &vreg_s8b_1p256 {};
 
 pp1800_l18b_s0: &vreg_l18b_1p8 {};
+/* dt-check-style disable=redundant-whitespace */
 pp1800_l18b:    &vreg_l18b_1p8 {};
 
 vreg_l19b_s0: &vreg_l19b_1p8 {};
 
 pp1800_alc5682: &vreg_l2c_1p8 {};
+/* dt-check-style disable=redundant-whitespace */
 pp1800_l2c:     &vreg_l2c_1p8 {};
 
 vreg_l4c: &vreg_l4c_1p8_3p0 {};
@@ -368,14 +370,17 @@ keyboard_backlight: led-0 {
 pp3000_l7c: &vreg_l7c_3p0 {};
 
 pp1800_prox: &vreg_l8c_1p8 {};
+/* dt-check-style disable=redundant-whitespace */
 pp1800_l8c:  &vreg_l8c_1p8 {};
 
 pp2950_l9c: &vreg_l9c_2p96 {};
 
+/* dt-check-style disable=redundant-whitespace */
 pp1800_lcm:  &vreg_l12c_1p8 {};
 pp1800_mipi: &vreg_l12c_1p8 {};
 pp1800_l12c: &vreg_l12c_1p8 {};
 
+/* dt-check-style disable=redundant-whitespace */
 pp3300_lcm:  &vreg_l13c_3p0 {};
 pp3300_mipi: &vreg_l13c_3p0 {};
 pp3300_l13c: &vreg_l13c_3p0 {};
@@ -384,6 +389,7 @@ keyboard_backlight: led-0 {
 
 vreg_edp_bl: &ppvar_sys {};
 
+/* dt-check-style disable=redundant-whitespace */
 ts_avdd:      &pp3300_left_in_mlb {};
 vreg_edp_3p3: &pp3300_left_in_mlb {};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index ed3d29e13021..afeb6e57e0aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2480,6 +2480,7 @@ swr3: soundwire@6ab0000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
 			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
 			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
@@ -2527,6 +2528,7 @@ swr1: soundwire@6ad0000 {
 			qcom,din-ports = <1>;
 			qcom,dout-ports = <11>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0x31 0xff 0xff 0xff>;
 			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
 			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
@@ -2591,6 +2593,7 @@ swr0: soundwire@6b10000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
 			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
 			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
@@ -2644,6 +2647,7 @@ swr2: soundwire@7630000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <0>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
 			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
 			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;

-- 
2.53.0


