Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7D3D41159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=; b=PPEWUhru914WjvWMxnrQWgouy/
	M+oPEz05mxUuAm0zVk/uI/+YhGEc0x3ZCu3DPRuMRxs4F23BuvG2gT8lblTiS7t3jVPwnj30a6GUl
	OruCio/szoD56pMAMJFljqBtO32u97WUbrNNCJ+JrWy4oIYBdp8ZNbOSDC67MNFjm0dBLGJqApBB2
	uwXon+kG23wdpYqnaasjygYGNaCwVA96apT1/6I76WZExeiDM3pw/JX16QYwT7Mrpvn1EeS3uBqBC
	j+6CRlZ1QjnPeNPAsHXBPf3zTCu06Wpcvo2DvLcexxH2TtL0aby6d1YFr3j2RHUiVZ351rWBmKUQH
	avAyR7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKMM-0000000C8KV-0uBE;
	Thu, 15 Jan 2026 10:13:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKMG-0000000C8If-1HAZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:13:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fxa01171463
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=; b=CJUfNhBxOo3pTxZ4
	3RO9aPIy1FWoIA4JcU/SRpJHHUjytf6O7B4S4+yYEoy2dQZzhO90ZraiU6+8t1Mc
	udl/2arYKyWRAnKczl6u1c4p88hus91WNjoIsH3levkx5WlVB/5L5cGajkf7nWML
	sLqJEZANkA1qQacK/4gecfSV9VFCP2O6mRBiqgjAcP0obJTIAPCjqumX7s86wHAJ
	HGEjrz2ButmdihkBA+ugqPoiY+KSTvN6qRyfhJmFcrUTc15CmH2MZL4i0tUi9sC/
	rgC1U+a1JQIkp7Z5d1OUoHptzl8HAdh9c3IgcgWbnJifq/0DmxWq+mAB2mbinWUF
	e1oqtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84ah5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5311864d9so177528185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472016; x=1769076816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=;
        b=PZu372RTNLysEZoSnAzZGY8Xk+NTp1L50GcYDS1R4FN/ZpcH5rT9GmbKmbwQFRUBwF
         h2vF3hYVaHxJXmzXPCh/C7x5gmHfgT30uBdynV3gKXXl6GZ7bqdqjI5b0579tACpsOrK
         l8YauBpdASQmX/nPamdurTqOhGt2sA+kAVVTEoyG9SRpmbS3SodghHX5CJL4Xg4SzzwE
         swapIEhn/0Q85ltutkFMNP69PP6yqgjAZQuwywo/5AZy9+h0uLzvUIth6ZqaroXWrKy2
         8Fkfu4x6pLPly6IIBln5LHp/aHvb4CKd7jxqYsER7KkFZgYrTDQod0x0RsqgMwM4SHwX
         uYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472016; x=1769076816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=;
        b=dEhTi+TvJPC1FGWSVg3RwT1g60WNXwZg13ux8qb3cIfkc286YNgjXR3mqBk4RNe+vw
         f2voKnBUEzy1ioyNGpQMw6oikjKFLGSOzADLFL7F7DEFJPT7Qadksoj99yqoCp5oEcql
         DL3dQspD+fyLAe8IAytMS7TBT+Ab1DeoVquKWkpKoDJ1b/nZ3sjmbub+Dxj7RtRCrAsb
         8rhxRXfk2INjjcdNao0o6IjVcDOoVNX1c6jSz8h8310VLK08GQ0CsZyHkxm+P/Y9uxUV
         PJdA33w4CwqnldceODbk3w3DiZaWXY/aW/lAMsS5eZyakXsCT1KFsqm02hw3kmK/QyeL
         4htg==
X-Forwarded-Encrypted: i=1; AJvYcCUyeOKsWz3QhnGZieaP5dntK0gU66f93nkbjJl7p3TuOGl5rOgb4Kglt2X7fYkhVTvlJgxR3wmWsFzkCtWI0VHU@lists.infradead.org
X-Gm-Message-State: AOJu0YzEpbPk24MpyZUPivneu1cUqXkh0GbmFFJn2jn1svmHqfuAVdRt
	qqzXZ3BBkCb6mIwi/D/k14TtrM6J2gW/oOK+X9mgmYIzNc+N01lR8WwEmUvz+dANsx53m919aPc
	lUetp5p0WUFEzj4vR8Cmu79gdgy5LzsSnBXo522peDddhWrYFBibQbmF+je7SOQEAoXwmy3s+ym
	CBlg==
X-Gm-Gg: AY/fxX6ACHPfUSFucGfm14avCOvvC81uOVrmbdI6JORkEPW+DtPyHakPErfKwUHeoGB
	XBoBsqob5EWajDZeuteiapA2XXsoqTI7Oq+ODsqQlUpQtyGWR0HjzSXXxMmBFbtfNJ9D6paGV/6
	1WhFrsiq91OWmay0S6kh7PUcgtqTkx6S7ziZzXDmgXChssX2nQNK4erB75CIumyIVyPDHRabwfY
	8xeWv5Zsyv7J1ai2MnSJaDK0pPo7O5FK/GPsj7YNyziO6oUyHvSxQ5DkcZYbE2vaZ2KqRW/C6RQ
	0lbbkcAU2FjVh/M8xfMW/QtqoeXGWR72UFob2YScWILUSATIDTauapfBJX6Vlpq0yegCaVsCb2U
	vB+enWH+R8PJ+1uaCjyJgEsCGtGtaVrp1H5zFwtX9j1hUc0SKm2guAYs9KBWdNNJyyJci8gUnMY
	pt
X-Received: by 2002:a05:620a:2552:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c52fb1ccdemr819225785a.21.1768472016147;
        Thu, 15 Jan 2026 02:13:36 -0800 (PST)
X-Received: by 2002:a05:620a:2552:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c52fb1ccdemr819219585a.21.1768472015581;
        Thu, 15 Jan 2026 02:13:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:40 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-4-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EUwITNGph9Sz556YywpxKThBBpgFxFypVVqI/HuOP1I=;
 b=0q1i37h0jVD3ntw9Vu3U70sABycxfu87F4li7lGcRJwkx/MEcqkj7wdamB2OCdQqakoNOQgsG
 V8ZIfTI3VktCPlJ3kOvcr4OtTPhZwG8rakNTebLe6U4d+JV39oMNoNU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX5b6iTLEcjtfx
 XkKRNJU63YSaSWlt81vk8cH2tqu8o8YmdkLW9KpHkCMfw7rh/xQW2dDBlhRwiAWWUs8Lnq5ZmyI
 Dc/pmK6oY8UM6sL2NtVNQyJJypyVx5ogxL/D9mjjj70OTWosAC5kJULrRaLDRQgkcIxrzBa4mhs
 NTtYu0wi6E3hi+KI+fP3HOKGx8FA27uCMcNSf9s7VF0MKWix2zyj08OwNOEvPVpJty4hs76WyQr
 2TSWu+/+uXLX7qr+o3TDm4VCiHjyx14eT1dwhkI3fuU7Sn/2Pk8RslXByLHvZO0hZbJLTsDVfsK
 KbWOk95YyHMteFRkt21r/6mpliKk0Tcx7v1rodBCO3S0nkRW7hzb4YGxitexpQzGv54lW3y6VL+
 UvQK4oRKNOvye4QW+/FtdXlTnslC3fVs9DEjjcG9AVYskj/XGwpAX1Wuyb08ws+qehUTo5owDB+
 AMcviOqP4Q4pefn4+sg==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968bdd3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tfCBMw9KTM5U2-pTabYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0UKvPVSU87YwNUK5gPit-abc28-wf3tV
X-Proofpoint-ORIG-GUID: 0UKvPVSU87YwNUK5gPit-abc28-wf3tV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_021344_376413_D04C8527 
X-CRM114-Status: GOOD (  12.46  )
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

Define pinctrl definitions to enable camera master clocks on Talos.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 162bbe353b62342478885f22972a816f1b60d820..f77c7faa97561a0a95974de1a39cc4ba0e43f663 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1554,6 +1554,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


