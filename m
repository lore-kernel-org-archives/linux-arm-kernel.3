Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7573ECD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=; b=QtCZE0KkJRxmBVYufDw6HLIQ1v
	GG20RvQuAszSbyxwXlFDGNfVqOCugcIN4LcP6MfiySCCq0mlrb9cSMYVIvF2KyN2LEFs+giJ1tsjN
	pZOtR2ttzf5OD440fJqomqFLEuGE2iZZ8PAWyxYQXRC3/Yyscvm13uyB/zk/JNyI8cYReb1fIIDXC
	HW9WAoyRf46CyWFJ22byamO4Ux0LNIRbc0yRW/tCnVE7DDQr6W5SOSp1PTpNfHrjW3Ub2xdnh9390
	jkUiSCtO62l+SmXXFfk+PureBDTiFwmfMUmpIX9Gff2T8jiq4JhTJOp0Akc7G2buXZhi0uGYHJjqd
	siALxJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLd-00000002gAS-3vje;
	Tue, 26 May 2026 17:13:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLb-00000002g8e-2qKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:13:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dS93147096
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=; b=aEpLz8Si6+oGEx/e
	94nD1w4n3U/F1YKkmZ+bjrBcSs00ROga91Gs6ak/4IwKMhIPvN7uTvyEv74lLbko
	T2VRWTyyzE2amMz5ojCcfn+yRMf1jlE7vDrAUs3A5Bw1xYIiL4djmiyHbpKaaeKD
	Q54hOxZSbrIaHk40GxCz+uhdkLVnfzoOFMO7SkIwDYCdEzwvuVUiYxf61tEerfyx
	R8FYioriVa7PU8LnLaWEiydgMBOtLJaEaNiA/JyDpuj3othiOWBJdtx4H2oI52cS
	n4c+3jfeoMUw2wQAvH50k63aawjEY0ActGAJ10HjoMeqNJIcEHbfBNbNJnR6hDYR
	63d9Ag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3u4a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2be9e0905a9so71604865ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815622; x=1780420422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=;
        b=EP4ctWi4LVs31/FyDpRWBEYCAHxY+FNop3ZS7W0K2fNBMnpBwQJINNCqi487w5BIlp
         onOl3yAjOZ3m3ZR0Fvz0SQpbslaBzNid9DpQz0a+qUWMTdxCjJ2MWprsiCKX2FOenfKc
         5xjCgsy/c8iS1d6asFh28OOxY1GkIyLBBG2PTX3GD1KwoM6un5nb075BaNLERJZPpYDO
         MDx4VIlc6IFy2we5929LBIWH5IrVdhUa3tqEb44BdhvcB7VllTJO1VbY2ubxfgHbVudj
         okHlmtjj7k51gOvUCPx3rtnSFKkK13Bu9qyqe2h/x4mI8kH4YlMCQ6DPgywd+QqLXcfe
         koTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815622; x=1780420422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=;
        b=JfQ0DtUW55Di9GCrHW8GmDlEo91inWfnXuKz6JTXOead8Bm6NDQMG6Eaztn+P2V3PV
         mQwXUsrmulgY00VF2/56aabHmSIXHf2S/xmtXubkTc3w6n+2PHnVcdhKtL1Flpa9QSA5
         BeRpfQ2CcNwq3+IPgdujohC2zu3H8US0F/xfSYvDt/dEjTPH5EsJV+BHlQA208snwc4U
         YEtwnlb692NBz8UtY2CWWSChkmyeXoGkaB2gnxdKzVuslQtyf/2wvxrmQK4lb6kMTZl0
         8hrOn9hB0Xhk3jJqGpyf8ZkLHKlJ8Mt95ZDbhI6/8tI5FbgPAaW7gNOqyT8NNfd5dtC2
         56nw==
X-Forwarded-Encrypted: i=1; AFNElJ/NBwm5wfNp0QV+IAzKOs8ZBlurd4IPmdrNPrXQK4jk/V30P6sVS5M88k7qY4w68El1okNKO4vt1H5LuGiAPkPg@lists.infradead.org
X-Gm-Message-State: AOJu0YxO5sXXuTMSyMo6sZN1i/T1f4LxYo8H614rZ/q8ylGS6DS/fOkh
	nDOFTDE70lKspcHNT0V32MLkaGAe9q8QEyKe1S2H7XpDMl0EFBkrOzq1MNen7d4jUQ6LXkZocIK
	cKWHG48SkHrtLf8twBAecCZBnxcT2GrvgC7B55IpABVVlGVcznIWfZCPIDEftfPZsUG+SyXfkDb
	Bc1Q==
X-Gm-Gg: Acq92OHYX13MXFYQCNlCX0QAIC554yr/W+XX9+V/QqM7cF+eB1VHPCSaxrC2tqtRsAf
	1o77jHg/OfS9UJ5/+6godK/bgXegUSPH5LO0rhkwmA4z2JjZwj9MHbKke4QXosfYRw/X0o9ZYDH
	MSRIahyUHn9QA6CUSr5+iXaepgbOJUenOPfWu9nh8h0+DDuz0YKgSqc/o0fOH8e7vCFKrwEpCDS
	qG5+hFBSUTiSVG04x9i0QLGDhF+17enYQ6YSAAgJfJvtH4PFKLoTxz2LYr+c9v7yPxejzXSmUav
	6rWamH/BF5Px0Myy5zYHQAI6W5V740U+i4YAfMLfMpv9Kjpb87gBloVN+sW0l9lCusx/J4/KkIr
	xe1Z61AcmdF1+TwrMG3VcBdEAhWblwJ+EY7j52HqqiH8f3iwJ0o3/
X-Received: by 2002:a05:6a20:244d:b0:3a2:d79c:415c with SMTP id adf61e73a8af0-3b328fde9edmr19895548637.47.1779815621707;
        Tue, 26 May 2026 10:13:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3a2:d79c:415c with SMTP id adf61e73a8af0-3b328fde9edmr19895511637.47.1779815621220;
        Tue, 26 May 2026 10:13:41 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:50 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-6-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX+1OIRBVIa/bx
 Z3pcMOh7S1e+T9dmgqRaGxZccyTcbBuqsRQOOdV1noUsJtkaed3e2pmh3bGop8ixw23erPSw0Fo
 gOHCVBFzmvDfED6eg2djQ/jUbv6/iaOW8Gev6Ddjf7SDSELCfsEpdXA4Lhkxq8be/wysVMXbpex
 QTXaugCEVhY918OrjZZ/ZRC2fgyg5FCKWkYct58wopGfNtf9/Ev1Zocy/1zIBF7TA8LEmPSHRNf
 qGpeHkTlqf5Ywzb2E2eKUiuiKMpyC6Q0W/I9HZAH58JKMFtf8PY5xjecNVUSvpu2rOpCykws2Tl
 fqiwEOemfPNZtP1YNWWesEcDMhcV0AIZ/Xr4S3Xka9Zjnf62xzVu4LSCT9UOAAfQ1dHn3AY4HwS
 NIbW3emVUYqJrQbjR7tmKZIJlg7gj0PrAA9AoYJwDV4K6C1IUENs7qvFsZR2fEwgocJhhwf1n9a
 IHMRcC+AX3OYW6MatIw==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15d4c6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8fHhTolRNNEGZtKOGWoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fIwMZFDJRllvu2sw6fynolV5n5NDDJmK
X-Proofpoint-GUID: fIwMZFDJRllvu2sw6fynolV5n5NDDJmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101343_874163_FAA3F9BB 
X-CRM114-Status: GOOD (  12.48  )
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

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 46de35971f629ded990827ebd76134e652758ce3..3fdb0c45d17880f1c1c6b90ee6e91b154e313738 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			mclk0_default: mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk1_default: mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk2_default: mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk3_default: mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1


