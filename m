Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD53EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=; b=ZPoqRGrjRH07FLUwI3QVXVvqq1
	9N+l8XuSqxzVH4NLUVFbL6th7Ig4mBd/0IzuHzxFGBoqlevT+lq5DykYb3HYMH1xCxw03B/au+Uo3
	Kax5h9p9mb8H7lFA+79O+aROUAgXtHUsYdOdctXYLti8PcTLn70+ECWSBhNMCgeNGQhAoV5HgdqrL
	rZaH/GXHu7R297wm/9F2JlgmApCVqts5+7d8mzNFQzf6DZI8zWYxkFvrUr7y5VNe/z3VMJCjQWBPO
	kX2hfDvYUZ0CZVPmnN/hRMsUnQOFt7tppBEyTLp2don1SBa2IRQ2iNEeTQhsy9iJv5MdXdioq6bd7
	qiRntXOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyX-00000008jMr-3Nt3;
	Mon, 13 Jul 2026 09:29:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyV-00000008jLQ-36Ds
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:29:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KZQP774573
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=; b=QA4wMyOXTHlPrPYY
	fmbDcsl12WcIp0j/1fnBKt9ju0ZslspQRbo7j+ChnOaGWHuurGRLbrQJrfNb9y+j
	E2hxYcJ0AJ/17yxnEYP2OhC36TKbFa17kjypEy0oCjol5/WiIUkW7N55axO3ta1i
	/jo30J60RtwFBaXfU7HWOx/jEeBY4z14TJvTb1jvCtgpdCN3y1t+Z9c+zGcQIdJK
	8Yp7GIFgqag4gvFZnzI11Oox+fOoZa3hBhbIlduyzm4dVn27r7vWN1AYx9VfiqwW
	g8x6XPJY9z4+w/yaRiYhZZMS4APJlJ4bOJZ60DG+uId5lG+AcxU/pjB8bA4NST0/
	kuhLKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00g2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:29:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so3985635a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934958; x=1784539758; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=;
        b=Q9nbabCBXEs0yQmnr1mPBWszoW1f1NlRqihzM7+GtS29vLYBAGuHNnhUvanvpT78hB
         4GvSd7SMk0oYteq/FyHzTFiE4WfQJovPpk/LjHow56yrjnH2WQnBkuFPMXmJDxZGqZjs
         t3q7F5/z50+WqCJz7rNzbiqTTpy3FZb2tvBy2XEhEbOy0YxaRjNnOmISeAmou/JK/9SQ
         mOA0XS1wzlkQ2iJ8D0yGd3riLPdEyyD/t1IZKoXZdGa8p03XuHVOa+w14Yu61BPOccTQ
         r8+evodVyrFM4avbCYjUKOyi1csi3+dFURvbfAl9MQg5HTnwuIeI2fozPK1WWxV+LK6T
         rxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934958; x=1784539758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=;
        b=JERR2OQTAhSeROmruC+Elb4aXM/ngUS/AUqRroG3GcjFboGs/YnOAiPNajZ/TyhvHc
         Ivxm1yI4bWkN9ZPPhlp81NXsu7WDsaZL9QRX0DLfoVB5/g4ENz8In0WqJy9kcGEdGDWl
         5j1RizQSbu/KiYp3q6t5pPvAXtOq7U32ObZ+aTZx/U8rehIEz+WDhHnLNNT7LxtnZ27M
         qfCPrzaq1eyE+1tTiDVBYG7XsJNstgdMrUQp2kfsRYGJryyxIdXKzo2kMWs8yldJP4td
         jr52yP+pwmTQ3M9WuThdUxTiIP8Qe3HzJoCoA32S0KRwp7RBcZR50XufUPFhUXJ6MZlz
         kNPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGjecO2kKfVrc2s6kOcSpEc7P5lZNizfs32K0/jRwc9w2YqcWgbe+G64YTWK98lKo7+anW+Xg5lM7IYyhztr81@lists.infradead.org
X-Gm-Message-State: AOJu0YygwuLY/zpmqI6Fgdzml0hKursW7Kdr8I1NAYRFMOJ3IIAPtUZ3
	yLz4dVHqV5a5K0PRbRU9Wlj/oLtQMTHIXoLN+uekOkeeG9PseJpdpN2M8cawj1uiuH4EEc+F+jY
	bxAL6ghAy5UoacX8YvztLN1Z7BsvaQhqrmdixirsvHpRWeFyz+85H50Q+BVwf3nvJvk2+rcHyvi
	RzGg==
X-Gm-Gg: AfdE7cnC+lujUDwdPszuf7LZQL1XSJ8VGSY2ncyuiyEAw52/bGhSylR2bX4Sf4iD5Ts
	4w2Np2uSyYQm7Bg+J4TbJ3syWHs3LU4GDwpMsjVLkaChIm3DvevPBFvfHqDUog61j6/pb3hBlj3
	/0lenrKBzvCMk6l+CpOEtStaPo+MJmPgMI3TRwhkETv3wR2S6LD3QK1AA3+LcXmn4xGl0JO0Ea8
	iqyA6XhQ/vtVuh7WjEhQ19QKs9Pu0dgpjGT4ATzmfa9G5h5ebwxJqbdtoBmrZV5IjR+qdKPCz98
	iGXhiG1i8AlAr8dSw1gHJLgkozDUp/76A5V1Wtc62lVkFmqGyHCtsR0Shg9q64qQm1Srl7bsiBL
	2s/XEJ+tF2MVnFUKNG+Io9glUHGxVIOEXgXxjZqYIFg==
X-Received: by 2002:a17:90b:3807:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38d15364aefmr13934313a91.12.1783934957757;
        Mon, 13 Jul 2026 02:29:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38d15364aefmr13934278a91.12.1783934957232;
        Mon, 13 Jul 2026 02:29:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:35 +0530
Subject: [PATCH v5 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-4-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=T/77rBwVVX1NnOpvQiwPTXRSL9axwN7LYY783rOf818=;
 b=U6/UJ0ZuhTgT42D+LrPdvk+x0l9xbREy7lCdtIpjjzj7ojVC+DQMTPnJ75Fvh3wtLcFCoWcKC
 sDZmCvEJtCLBbWwZWcb9u5o5dodmN2XL/mIv5EVEys8KgJyKuveg38c
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX6FBqKyDjJCst
 DmBcZ0PpQ69sfxQLXL+3Ibvwz4mhHg9I6vOsDS5vFyg1MYjJcW+xSd1sLqwWV6JUhf/1ySipPkW
 1s5++jErVg86IvAjKxhQ1TS4i4LsLxc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX4a4pZ/T/bNlj
 SHKCSabjprVVVh1qTLNqOXxUsL9UFSP/SlFeojbWxSUtwWcOX5No/C7auWij9EGybYCvkWz3bgP
 4ZvhP1b8dEkqyUC4HAqUQop7ZxeZQHTpYteFRqVag3HH6uWsLtKpl/pilwBhOsxlEGYnRyms5aZ
 83UmyAh584m/zLQ0C1IJhNtWD2nxqxtZ8BZ39+uhkHRh95Mxh9MAaj1z8njOj7Y9DZM/o56lNzi
 F4sj8NjEEoO9/i6+r/CdF59iY4iyciRYL2L0IaFwETvpFJQ9n33fKXFzYb0xm2kMYNRNn4NO3aO
 ylmZxHGsU4lATrgJpJZGTvHoQGrtqCq82Z2RLAPLJKlAJ2mARCp4I/znVSeVe6q4Y9XbyxfEgYN
 acMK3xREaxR9Y1T5gswFYVZpmIsjBG9jjaNhvH/948lgJ9S01QKZySq1d8Yfqwc3dLHl3r6FmtP
 hrtS8i2badCxrnwnoJg==
X-Proofpoint-ORIG-GUID: R-IL7Z98cy3aGJLdiA2Judovi012H0zO
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54afee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: R-IL7Z98cy3aGJLdiA2Judovi012H0zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022919_901143_02D25577 
X-CRM114-Status: GOOD (  12.42  )
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

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 18da1380e52acdd8813625eaceac796e342efd16..d87a87b3a23cc869d35cbb9c2f802d425c9eb94d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -387,6 +387,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1


