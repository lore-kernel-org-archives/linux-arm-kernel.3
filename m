Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462DFC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=; b=brLgAKzQ6MhYm8Dv/0uqJTJl68
	w1sHsp1GSPNMoXH0V8Z50ZAPX8T5aHwEjQyW0/OjWk4G4T8fJqbMG3dgsh32cVV6Ge5fdNwVjqViv
	3oEOCYaG+yjrUsa8bUMwWRiGCkW56LreHUN6Zo3rGnGiRtJYXrpTNQUtXkF+7mFLXJ+3fNlXTYjb/
	kLbqak+qwJb2g7kb8wJunyRN/Kn4917MrYXguvLLoAxlMxDTR0uG2df7nqomC/MwzoK7kbXr/6+mw
	R2mroMNSR88jruG/rBWty2upJoHxjUqV2zZZEmFxn0YMCBkeTgYv7YRtDd8DowheYt9HzacVsX6Fq
	1LgApt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwW8-00000005fgz-3bI0;
	Thu, 06 Aug 2026 11:44:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwW5-00000005fgV-3Zz4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:44:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nl4k1579059
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 11:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=; b=X8I2/bokvg579Grg
	p6iuuu3t9iiXVg7qF/WMUz3MvGU4h7/kgvBGacekChzws2uwQu/EuzQ9VLy6G8UG
	fUvfcT67dtVpfKfM1NP5FvPf2cU4KBZOE/0uEBqluL0z+3gGiKpUz+/28qJBE7dl
	q5iLcsnFS+o1+fUhGvKHhvXveG32kJ0LSvx8GmV0OPK0sg1o9Nfl+ZU2xqdIgc31
	i4+V/tskd1n5JH8aACgNTBEtlY0lCS85c4U228t3G32cavEc/Rxg1RWyxHPE2+j6
	bXsGCFASl49rVwk+4yNxBoDT0Fd2gZqbwstf3h/fk/n51OZVUS5ZjbVe/ojZ9aMU
	/DwfgA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hx6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 11:44:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848860def2cso2493288b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016644; x=1786621444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=;
        b=R9+jW4Wiiv1kkHIK0BPgxFqy4TEf57snuLmk8+RyAX62AG++h5EqglXpPWfD7Zav6i
         BVHMIsjFNOSfxewCCqMFKkJbWdDp3Uw3wxVXbejxweMHTis+lUWt6AV/3XKeA4LKopPI
         GD+lUuuBx0PLHNdR1Yxg6NxpQmvRpxk7m19gVsnD0qlypVydwYpFqRUsQAiEWnF66ZS2
         Ug/il06AQuLqHG6lp20v0oSI20neqLK70JzHDS2Fhch2lLXH8rTVK+gW1dE1HDOBzPoO
         LE/BECx3MkwDx8Rr5FVha6YrfTfp67sOgYOtRZPqbeSXCkdbTARe82LdnQC+ePYCJaEn
         +ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016644; x=1786621444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=;
        b=CiYn+6ChEuJF/aHsBbyzinOzNCjA4hA+19Dr2RThudF9+3l9p9B4VpisSowrnMJ/nE
         7tv4oogpfZf3Y6zB9Lv64iadnrN+705kzlRY1DIhQzbANjawZgT7hkFzY+lwRBRUz6vO
         LLgXS4P4bFoY9MJPuN52he3fzv57f53nofc74bWJ8PKqKUnFSh6+gXbIxrGD0ytezSGk
         rHqX0dtYZpbuK6l3K5VKEYD7qR9mM8J/8ZcUpehRLVt2JqWgC0pl05y1Typ3mBv1jx5t
         VbKbRB4nQBMqrzv/Ud5uiZMgdZtCkl/KiuW7OF3/hPCC5RH5jf/GWbM14DrmlBonShkz
         nl/g==
X-Forwarded-Encrypted: i=1; AHgh+RqTkUX7hw7zYaUq59XZUPFR5wzqJyZSsIGBgEg/vu8j+vJKWdi0CHzqr3WzCMwY2V7gcMDQEJjgd2kvujS1r6rI@lists.infradead.org
X-Gm-Message-State: AOJu0YxiHs6jiN2cDM6MF7uOGXj7CfLUwt3BdsupJ6cgE7eHQILSn1uZ
	FhdWowxwbVjK9nUbPlVsvZUnQlGmdCJ8a1LY4MRc8r+zR6OmKoREDbJ2d5IP1k4UPgplKBWxgoT
	sOARklwyLKVAEOj/cs8REDCzxfou0N41Ty5tjK5WtGuY64ThuuhohEnGLSJavytZIQA3lv6S+jC
	hgiQ==
X-Gm-Gg: AR+sD13KSDicH+oD0DvbtN1i3vOdKiWNPXJT/3xMNHdTnsAectOSvMrFqYNsHr6ntak
	VI3ck+8obdcq7B/fKQNnND4js1gpiQNTs08q0MtJgYu0LBpzSCY61bQ42SJZmxZnCLtBgr5SaWr
	+oLoefBUXjLgUhSpn8W18YEe729pt/+dU0ljEQsa+l2hFaaYjpxihwyb8wvfC8mAKs6YpwZviyh
	2YfFf9tLTIejYUWqi5pngXadwgNHH0O3VKkjYVLLR7/mAiTAwlpY0uwSYqexXDW0X07ARdGD5rT
	fLbG+Z+81P47+uLBi9cNeCGutr/FrCSxO+Ac4qW7E/jHsYBYGhyu35GR0V07eIXZhIvCzVEZkPB
	1uSBhOHinMCnUw0RQJPsk56qdIupLot8=
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr15131063b3a.19.1786016643817;
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr15130998b3a.19.1786016643390;
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:28 +0530
Subject: [PATCH v7 3/5] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-3-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BsfY/RscSrIjGVNJpro8koyU58IFtSj27D+QRreyTuE=;
 b=5iO8ro9F0y5HaNuqHqy2tlRv6TBHqL2SHdP2suiPVV+hF8RhV/0nGXdaOKPtwXGRmfsPDDos9
 UzjC301rQpYBgNf/2I7PodACkZnHELG4/yUPGlSJmdb+3CNA3S897gg
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: VB4fuBO52VF78D5SJ5naNcNbLQY0co5T
X-Proofpoint-ORIG-GUID: VB4fuBO52VF78D5SJ5naNcNbLQY0co5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX46T+pK4UJyJp
 ss0KK3FR1a25aLYiKUwomAh7JJUH3q1/vHqUk/SLPHwJfCSm+VMM1RFCt459L6TlVogbPfiKmYz
 s4IHNUNq4ihjhkFPONYRLKNJJHUJlyulVfWJRrGtbrHiu8aZybWtWBaCg+RcHhY7yMYP/+qrnF7
 Mq2K2dki1egUH4e5BAiuXCTUeoc4FQ2Mzg4mi65mSJARthCP6MbPAUxJFwMyEbk/hY2N5Ecocfd
 c2bE/DtPq0YqxGCmTjpBhamIbvLNtuFoEymFNj6x5dcoWRwtmWFfw7+F8kvH9JKPxZjjgnxOqFL
 JdzTmDMREANQp618VTtvPSgAyvJfp47lnnRsjZ2pKtTaLjOanIIv5FzFriuW+i6UIetZNLS4fGy
 VhgTUat2zq0UgiNAFF1yxP38pZJIzL0x63Ao83KJrpvWSb19SBR2qhTipzyMc4/8PL5xKlVTWLB
 0QDAxqJrYE7Feh+oOJA==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a747384 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX9KrpmnspB4aJ
 v9Yur4xDpDYR90J94Kj6NEonHfuSVEEMboOvxMLzFuClAy+jqZ0nnmbdQyEB7GVHjJX22QtIuyK
 jeICF+/j67i187SOoaoPeLLjVh0Uk7w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_044406_012367_FCFB4617 
X-CRM114-Status: GOOD (  12.59  )
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
index ce5887b9b1d4a186fe967779b9615ab4e4727ff8..661eca4ba85eb83f776278a6750cb969a409c974 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -827,6 +827,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
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


