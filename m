Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BE1D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 04:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Km90EERVGOkwzKkKYlpxgw75D/tpvcaDBTOSh7gZR7o=; b=zthIfSf0TMKnVs4US4Ynk9zjlG
	NSycmA8F17B+Ud3za4FokYdtL+FVxpTZj18ZtdG3HmH1SEZT1JqAWG7nE8Hvf9oqHYc2b0d/K/cu+
	TxzgDf2b6Fkpa3vFQQIa5q7iFL1z8duwa+pxhUxQRG1mPo/YpSZqA5Eh3ePKjhwr5JAH3Pi5+EaGj
	1HoWKWe6RCME7F+vST6wPvGJTzFZ2zcf2jNkB1O3skzeeDP5yR0egoogEbfNVUowcsi3KhMFuiljX
	k+ju8L+PlqFrhouHRZDbmbg+8YzDUmyt8Fu2Gjz0FPP1SuPXyFbK4fSyO4i6lUTQRZPRnWcdHWcHl
	CQB6+Hkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOph2-0000000HYDB-4BvQ;
	Fri, 28 Nov 2025 04:02:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOph0-0000000HYCX-3UkA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 04:02:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS1NKpt848714
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 04:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Km90EERVGOkwzKkKYlpxgw
	75D/tpvcaDBTOSh7gZR7o=; b=WuF4foGbEw13346JmgFws6thH/j7S4NYllX5/s
	QOExsn7uEIkXUTMsGILsOV08ofSHcvunbLS2mQODf1mn/c3LIMM8AiVQk6OnYlCG
	qN0xawy2pZfv/XxlRJrR2+BStX7i4Sbbs32EenxSKQF051wlbzyT2KWfzNNq46Yn
	gyByZBPUVwUKKSse8QsMKJlXG9/QdO9BjxF8MdhBxk4yx4+X9rtxD/z3CJE9Qa2c
	nFrhxq3kFdsrWKbtSvsspETn6Yhh3/NK6agmMcQ0FRCmo0RAkf6yTpn26qkUHtWw
	jzisjA5H62vYLVjbFo6kIiKCUGpIxRTdDfpMaw0TUl9jEMTQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjda2e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 04:02:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-882485f2984so28908406d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 20:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764302564; x=1764907364; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Km90EERVGOkwzKkKYlpxgw75D/tpvcaDBTOSh7gZR7o=;
        b=YJqf+K+bNuCKM11o10ItiSxA8AFeJqc/m0gqDe7PcZA3Vb2tQRmyahk3SmSYTsAo3I
         +TEHIbiqHPGmHX6cElfLgsAVNKkzMotSep2BOkTt9GLuw+iaomsKzXR29iDnaNeTaUU0
         hbz1M5U/APxf11CqMnIbtECPP7oP9k1tQjl1He7g1wzNaJQMOo5CSYCLz6GaqEhfGCT1
         O5mSq0X3b+/DbKivM/DR8Ybw19/8j8bWNCsGyOfItd0KKAn9SNh/ZCVGJto5UnYqlEoI
         /U6jBAi9ywwdB73kFbLVpzHxllIxLNvvzO0DfMSK4Me2AL/ipan7VKITCMI4Cuc0y4Xh
         B4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764302564; x=1764907364;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Km90EERVGOkwzKkKYlpxgw75D/tpvcaDBTOSh7gZR7o=;
        b=iVivJ9C3PlOMvJ7MaxqTy88WBnOQuhlDU/nuWc7PL4/vAxGqtiWlTbrU2jZklHXmcp
         mkRPcEkkH2h+/XmfEsVKhubngB51IwiDyPvdE67F+/iuHjzYW2MK3ih/H1oIsJdEzx6z
         qZMXvRqMdlFfRTFRsFt4fJNneO3eCvb9D3PJb9AgIhZfzBq+I2Mi/Ee9LfEWjMaMKMFo
         zuYPbuScs8Tks9RFGf0N9BmCPfuui49mgM+yz42aO/r/QCPTUtiAWjHQiNUfUXd+pcwj
         MZTuJJy0+aXfjklT6zqpJSg91ZxJckvT56LPZDUxD6uQWvrm8DnNyUGB36qc1/KVMMUM
         +l0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMSlGZCsfR703KyaHeJiXVZgoQmpzq8yMNImGCIRzQaylYylEQkM6IGo9ojkoNN+17t56mM/jMRjBiItI/dsK8@lists.infradead.org
X-Gm-Message-State: AOJu0YxbAel+EM7/QOPWOGzJU4VgbhYrGBsUJ4i4BmeegrE20MjO2ryG
	wsXbfuEp/qro4meUyd3YknRggYWaZ3VrpR2RRIZeffRYMw4ZRTJmn4JunlYGswzoY7QH2dW1EVq
	f9U7CGsu9ZzNIepJReirAlHAACobboo5mhD5UjMm+/79HEIENrvKO/jM+uOts2nkdxJCUT/PiXY
	sKOnjboHuycQ==
X-Gm-Gg: ASbGncsjGAIjEdCjduBCSz/m/a5BfDAQXWglm44Yt+B1b/Y83XU3QRdmUFcdeu4Lygu
	1VrYwMjVbfTpHs+WwlwWlozMPmEUnnHjaLW4zfeppV8ZMrohgLyf5T7MdBJfqDezvy6CgcxWIWQ
	tvTWNk+dcVZUhZgHaOgwq69caTA+hV0LnEBxBTf0qnWVR+2OhEnH26SWGQC3NWB1BO9qKWmXS/9
	Cu2C4wIEYOogr7Spkm2jAUPDZP31cXFCNEbWLbvFpox44Mb93U2KTYzAXFR9v3istJMN5lrv2Iv
	zGy5i6nSfIAaBNQQdKOUBafQjVPPMevHq2+AsNo7kBfNMFINQ+NarW9CgghzYZc+cH/Fjnju6Pl
	K4nc+VcXBIm1DPDVEy0ndIdb8bvOE24T9w/53TQpnFEyojQj2tbLGlKBUigJ66zWUZVSTovnmC4
	VfxNPmdOsHYssZ5ZZau8KK1OQ=
X-Received: by 2002:a05:6214:c61:b0:880:5b9a:72f2 with SMTP id 6a1803df08f44-8863af15c67mr188255366d6.20.1764302564223;
        Thu, 27 Nov 2025 20:02:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPiaceggIXXN4PLsZBK/FQj5IB7TH/SWuQbD8CInf1Xf7tRDsFVrV5L5VeyLZD1ApkvAk9aQ==
X-Received: by 2002:a05:6214:c61:b0:880:5b9a:72f2 with SMTP id 6a1803df08f44-8863af15c67mr188255056d6.20.1764302563776;
        Thu, 27 Nov 2025 20:02:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b063bsm889609e87.41.2025.11.27.20.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 20:02:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 06:02:42 +0200
Subject: [PATCH] ARM: multi_v7_defconfig: enable DA9052 and MC13XXX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-imx53-qsrb-pmics-v1-1-a96f43ddbb59@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOEeKWkC/x3MTQqAIBBA4avErBtITYyuEi20xppFfw5EIN09a
 fkt3ssglJgE+ipDopuFj71A1RVMq98XQp6LQTfaKqU75O2xBi9JAc+NJ0FrdAzOhzYYByU7E0V
 +/uUwvu8HCKcxCWIAAAA=
X-Change-ID: 20251128-imx53-qsrb-pmics-532fb7ab4b37
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g3LRNLCrYXLZC2Jel5BppEoAhXanY8wJmV/cSMYtpus=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6am3CPWJ+JR7+q4mkormEXPxEc4drhozj09Xcun8mdPt
 Pr+vCudjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIy0b2//53tm9IW3TX7Hpy
 5ZVnf9Iku9eYpUtL9mpvVTu4z2faW9GbvTMOb9TvCH0Qut5QMen3ptW53mW2cUsCbR7Idzs1eSa
 eufzZwSY1fnr8dY8m7w07889kxVe1Oki0RYkHbf+Yeyq+qJv7x5L8goXfG17vkuB5nJr0p2ilhp
 CNsYyDkWORxK9b+c9E3mUU3Iy2EHrtarspl9P6eOr/i74q2xqiA/jfCk9eNqHiqVS6ps6tNvV5W
 2v3Ptv/srZ3W9oJr7mXpc07rsU8Yw8odFy9zXJT3WQdm/dn+fk91y6ewDOlo716rkzX46O5u7wi
 y28HF6deUMvbbJB0i28h1yPvlo9V+qHfwv8k3Z4RpeYEAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sPjkVsVlTeieTpOCEavZDhb_FbGh4ksD
X-Proofpoint-ORIG-GUID: sPjkVsVlTeieTpOCEavZDhb_FbGh4ksD
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=69291ee5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Bt1r0AIcz5crCmy9ufoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAyNiBTYWx0ZWRfXxyylNBSZi55G
 MCkVgwG68QzGLULeeHpylBGpKho4p7MedfSVNadOgxCw5yFNcd2PNxR1mwVOxD+tm55joDglEaA
 Wja1FlcmMNMBA6TxnAbTlkeiyw9l+oiXbI1JL1h/dEafu7BeUv9ZbmeuDB6Hqlt4Y4y5+rLQuBL
 8eVcVHaeZLWoxn/XtII8AwCuoK7PHwk4zfaqDxXTUlclBIgCf9YNCAsgvnZPm6phuMkieaj1/4o
 YKRa977g5WLPY9XrY8vwHX+nYAe8J4sqY+SeDk6GB28JgID+Q7u6EURy+mvgL1l8G4mrvgQCWWC
 rmQgOrL+ieSrwZJj/Vfj9kX3S0ovLKboO/FECBMzwQsiBVqPzxEn6FOhhspFOSRVVAB0xbmFGkY
 n5E1OrQh67sHjqibpi9nkdE4l50RIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_200246_880021_06FB6B4B 
X-CRM114-Status: GOOD (  12.32  )
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

Enable PMICs used on i.MX53 Quick-Start Boards: DA9052 for i.MX53 QSB
and MC13XXX for i.MX53 QSRB (it has Freescale MC34708 PMIC).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7f1fa9dd88c92cf04e3b1d9c05166d0f407b3f65..7b12bfae76716bf092b3fb41afb2178ecd148e24 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -598,7 +598,9 @@ CONFIG_MFD_BCM590XX=y
 CONFIG_MFD_AC100=y
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
+CONFIG_MFD_DA9052_I2C=y
 CONFIG_MFD_DA9063=m
+CONFIG_MFD_MC13XXX_I2C=m
 CONFIG_MFD_MAX14577=y
 CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=m
@@ -633,6 +635,7 @@ CONFIG_REGULATOR_AS3722=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BCM590XX=y
 CONFIG_REGULATOR_CPCAP=y
+CONFIG_REGULATOR_DA9052=m
 CONFIG_REGULATOR_DA9210=y
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_GPIO=y
@@ -1026,6 +1029,7 @@ CONFIG_RTC_DRV_RZN1=m
 CONFIG_RTC_DRV_VT8500=y
 CONFIG_RTC_DRV_SUNXI=y
 CONFIG_RTC_DRV_MV=y
+CONFIG_RTC_DRV_MC13XXX=m
 CONFIG_RTC_DRV_PM8XXX=m
 CONFIG_RTC_DRV_TEGRA=y
 CONFIG_RTC_DRV_ST_LPC=y

---
base-commit: ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
change-id: 20251128-imx53-qsrb-pmics-532fb7ab4b37

Best regards,
-- 
With best wishes
Dmitry


