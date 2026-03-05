Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AF5EEF33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErWliXlFzZLPiPi+HOPVdOq1nti1MLUqJWvk2Mt+DVc=; b=1wqqLZosZCFJVgjg14pSORb2PT
	e7T1CggVRH2k5E85u+Zv1gTnzSImSmifYF/JOJuMfqlkQkaiW30/DFLHT4ud2TxYelHyt94cU0yEW
	nLtLUQiu0lo+kwVaz9RKlteiCwEeJ38jV4qW+iF8gJmgVYOgxPdcw25s9BxFKj/0Qy5LZPhEmPIy5
	utxWDwIfD8h3T38Jwp1Gy+tm86UUkoSCWBg7N0wL/2tcT0MjY1RGVuxBCX6n7ErRKLCnX7Q8WBiWB
	03+M9gYDaArYLqUbAHutrQ7OvAzPvrPf07iS6rDewlIWz9B8JLcFFN/2tsGuObL8fehf0U4iB+BEk
	1TlfO+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iH-00000001JrZ-25yW;
	Thu, 05 Mar 2026 09:09:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iF-00000001JpG-2IOD
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ErWliXlFzZLPiPi+HOPVdOq1nti1MLUqJWvk2Mt+DVc=; b=QwWf1vviAs/PdET6jNLhJNogC+
	rLSl64PMYdLEhNgezoaXE9SRiMNJ+krNirfcY5DNrxnI8dQip8XgDypvjdkqtk3hX+IudwcB/Rfrd
	cywm+gga2DOUUe8yp8MWeA9btw2y8sHt2tVSMjqv5hRalHysLf3RR97P7fHPM58MsHeqmskpYSeCW
	9qMPHBD0P1ny54gFc6xyuLoA5ir0nIgpS5Er4x45bN/PMFu3E3iMEe7H0ydOgGqgBkkAliTIXNiix
	dkgugVN6qlhOX66+rBw2j6dfGbsHpzI31HWhYTKhVGmXFZjSuyIp4Qnqe7e3qDKkDqZB1BrozR053
	2ZLnD6qQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4iB-00000006HtZ-0vm4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:09:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BqGP1193322
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 09:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ErWliXlFzZLPiPi+HOPVdOq1nti1MLUqJWvk2Mt+DVc=; b=pxD5fvTFh6pv09Mh
	mmG1JNtDSiZN3bF9ckWmy7iusYCqkkpq5wDOYgtTLNJBkM1uJYPplE/hELFSLqYD
	IZN/ysIhzTFA84bj2CifG5fAkRc0F1vTcdw0qEAT1JFNCfAA39g4kUcMO+LAseIV
	jqEDf6QQO8P+IgIYyXNjdE33WRTYjcFSUnxSl0f5QYfKQCIgujTu5rhRh/KO0Qom
	YA+PNwmTtHYabrXYeep8LOHbiduqJd06jShvWqJq81Bm7M1EZ8uO4UiRX+AIB543
	O4CO2s1NPSStza4c323vlr0DL6xxOS1pbhSP4yHQrqAZdidW6wui37F9fE1zpBAc
	F0AsJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwgauun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:09:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a129cd2so5339507285a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701774; x=1773306574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErWliXlFzZLPiPi+HOPVdOq1nti1MLUqJWvk2Mt+DVc=;
        b=Da4pp9mPr8+QmzEqDUwQdaEStoTu3b0tUoXsfVYUgvPdPHFTtuL3OpMYtZc/DU6ZZI
         fk21nWqjDH1+OJaupoI1exEYNwL88n11lzEbAr9X7IlDn+HFsm0XeWkoB1qZykAPNQ0m
         IOreuslNDteEPHPZRvBL14ru9KRhqo4HR+UhJa8kEcopGkpPN0dSazxgwVWhRsp+hpmQ
         AlPDq7QldInkGkl+3125PI7wHnxy9PMTj7QG0wUJ/8ncAoT0a5Ji72Msmp8xJIYqPx7x
         ZRNeBx66ULKACQMi0QOR96kS68jgFHnW6a3OD/5A5DO6g7HAYvpeM+IZukk+SQ+H7bcj
         uC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701774; x=1773306574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ErWliXlFzZLPiPi+HOPVdOq1nti1MLUqJWvk2Mt+DVc=;
        b=g7bdlUbU6qfLqIePUyLITLzBY5kl7WvqSj3yXbT3ed4QV+v0LLPXEpQp7jyBkQ9TVd
         BqdCI3Er6GMzwgYl37QNTE68/YtPMeEng7SO5OVEo16yzVNV5riEqqzUKf+aPgVNOv+7
         NH2/m8KF3sieZxpcmVqkDX/ubTIxges9ta8/PuUzg0HJgcRVUcwI0KmTEypKbgt9QLHE
         kxHKS58+JXbcOgYAh9DW0+PEnM8PlBUCBSWg7Ai16LshbccidM8D+zewF9/maoV65ETc
         hHdgo+zimRA6ePRBtzdpUE6Yu3WyVoHHqhDmOnXaPmMuhbUbSpTOEwLvh7tEm0jSkX9d
         fIsg==
X-Forwarded-Encrypted: i=1; AJvYcCVrDQEOK46/eEpHkANrrYE26+vlDx9OxG7O9XlCqWD5QwEgJ2ZUb8CgvzmBf+hWITDei5yVXic+qomyY7s2Rv6X@lists.infradead.org
X-Gm-Message-State: AOJu0YyuamPRMwLhMemxnXeo5beRvpXs0QZrP8NQaez+mTWgXHLzrr8c
	so0T9h7lDbCDqMDzz3kRten0OOKDJDnIrccYJCAxDAHhdvlgokS940+tNaA03AsP//Oj9mRjiJc
	LHQYMXZTdjcPm5RPB5Uck2+ssR9eRIxzWQ0nK+AmCHQHr7bHbyB3yJHr9EuewTHdqd+jHvAN9Fz
	tVNHRrRvzziA==
X-Gm-Gg: ATEYQzzMxT5qXil2swjHeFMa91qp4TbBvKDPvEclR2By5I5ZN2RIIVRN/q807cPgpSf
	7cxaNjbuJgjQD1GaRtRygLxRX1K4WgtniDNK4GTtURITvXxSta8k6UJP3m9SJPIN0la1WtyhA4N
	50oxZF9iCpKlBXSyq9Um4odoHLkMZDDWuZDcNwC+OiIMR9DSyxTfS5A/PewdxeMCAVF+a0J4cxL
	6Twj/bdTZs2fQSIszOXrBRehF3EpaZq+k4Iu+UBEe5vYOGM5dV9TPtbgB1rfrA9cPXNxu0SCpD8
	nlmHehg68iY7bs1tmoUkKx+BX4z8Soe8ICHC7OkN2TAJ05hizssJZXPG/vjJ4E4PzJ+Le47ZKrv
	mSpaVKSeEfArZ7YkDl1RH3Htf0NS1fN9tpKSdF6OoTLn9
X-Received: by 2002:a05:620a:269a:b0:8c6:df6b:93fa with SMTP id af79cd13be357-8cd6352e2a3mr159775685a.43.1772701773720;
        Thu, 05 Mar 2026 01:09:33 -0800 (PST)
X-Received: by 2002:a05:620a:269a:b0:8c6:df6b:93fa with SMTP id af79cd13be357-8cd6352e2a3mr159773285a.43.1772701773230;
        Thu, 05 Mar 2026 01:09:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:09:24 +0100
Subject: [PATCH 1/5] arm64: dts: exynos7870: Move I2C address/size-cells to
 DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dts-exynos-i2c-v1-1-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7820;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Vu0U+uodQM2vRCCFHaRzh/6ti+sDJbXFNI3AqN6BW4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhG7rT1a7SSEsIbPl+uSbgi21hzQIWjQOQeb
 WQHt99Voy+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalIRgAKCRDBN2bmhouD
 17OcD/9Qc+iFQXmVgMw7CDXgIImMcP66CuOSMRASFlzz4OH1y6yJmd9aGQ6tp80da/PhHNEOCX9
 f3j4A7PExFNP6NzqkvNJnxaIV9UEnsAY6ytmI0oZbdG+mgLjiBoaEkT6JM/BvOtdEvru+PQWdOh
 ak+6GuNMK8BuXiB8yX5kUrRcDBFKpCpw4YlMwNvgoyA3APHiILYYBIJ+fVM/YQQHEA+Wd7PYccM
 OI5DoVij5CQyu0n+EqtAVqtmwlSPkQiJqoiwcdRShitiZ5S28zx5CK9Zvsq1W/gZ1HgkWsujMKD
 fbGH5q7CcLdTkp/c0ysNjTkfJgVmSGFNafmTtqUkTWklfrLOgmhievdYreptTTfW8ufRvO01JzO
 aBervUfaKTYPqUUS5cF33/HDauHmfKCgitiiZiiBAMbtHUeORCktmitcstZhU3vBIoNS29o23D7
 d/v/767S7Go5kPdJCAFWxVd2xYtjRa7fUjsBw1i9KGuct+VPJ8f39jHRieUI0fcf2K+/eyvfruC
 a6TyH2HozXjDe8kLnyhSuYUGEWmCZYOAgNKWg1J6rlklQGAbg3B6nj+u8na+GVVZdi6PU9whhmi
 RCL3yqqX09eZx6v3TWjzxUSAE7Prd0dTa6f3/UICAVnx2uQCHwTg5SoIU2lVx2rYAzoxHkJvixr
 pKMIdNqQay/jIGw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a9484e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5Z7oIvSdy9aBhWt1b4QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mDvHJ9yxnnxN6FnyA7iBZ5OBRrLzcqzo
X-Proofpoint-ORIG-GUID: mDvHJ9yxnnxN6FnyA7iBZ5OBRrLzcqzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MiBTYWx0ZWRfX3P2pXVvHkIod
 DnRtAjXvYZhmvqrax3H77EOFjlCsynSqb1huPtq6lmYAuSsxdbf81C/pKn5MgbVRMjujDE0NqHZ
 fvso4mIzgLHTrlrHHArpVLHrzPB4HgtzQmvAFagotowcyljkDkwFNT+qKBSjj6wiXrjrGglA/Ss
 rO70GH9th5Q1PB6EyR2qg9agSwVLKeJ0ailNKHZzRN16XluhVYEmqbbH14c9JROc5NZ1au8ZpBw
 jZQpkOwJdiVI6kxt6f2lfFt5Gu3XLKEJwBeki2AASIl8LMxQkoqj+mS1IBPE/UXFqon7dg54t5q
 kKf3el0ySEW95ITDWNF5fxmvtxX6D3l/PvTvlr9huupac5gnuFJE3zqZBpAjAYx0aKSS04UMAmR
 XNzhE5KSp+qvvgauFoD94BIf+xN5dpece4oRQxWZre8OmM0Xvm8frY6H2d8cu6HT2n7VZSyY53o
 PMPXUHfYq5CXO+2oQqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_090939_627121_39373A64 
X-CRM114-Status: GOOD (  15.09  )
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

Convention followed in all other DTSI files is to define I2C controller
address/size-cells in the DTSI thus reducing code needed in each DTS.
It's also logical, since I2C is a bus and needs definition of addressing
children, even if the bus is enabled without the nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  9 ----
 arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  5 ---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  6 ---
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  3 --
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  9 ----
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 48 ++++++++++++++++++++++
 6 files changed, 48 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index 6f40ca4350ed..0888cd2faca4 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
@@ -158,9 +158,6 @@ &gpu {
 };
 
 &hsi2c0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	status = "okay";
 
 	pmic@66 {
@@ -394,9 +391,6 @@ vdd_ldo35: ldo35 {
 };
 
 &i2c5 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 
@@ -428,9 +422,6 @@ proximity@48 {
 };
 
 &i2c6 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts
index d685bc0703cf..36c327668db5 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts
@@ -129,8 +129,6 @@ &gpu {
 
 &hsi2c0 {
 	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
 
 	pmic@66 {
 		compatible = "samsung,s2mpu05-pmic";
@@ -358,9 +356,6 @@ vdd_ldo35: ldo35 {
 };
 
 &i2c2 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index 09f2367cfec9..de30d0970336 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -383,9 +383,6 @@ vdd_ldo35: ldo35 {
 };
 
 &i2c5 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 
@@ -409,9 +406,6 @@ accelerometer@1d {
 };
 
 &i2c6 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts
index 1da826ca1087..079b2b581307 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts
@@ -334,9 +334,6 @@ vdd_ldo35: ldo35 {
 };
 
 &i2c1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index 29e124c72e9d..29be4764f84d 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
@@ -398,9 +398,6 @@ vdd_ldo35: ldo35 {
 };
 
 &i2c1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 
@@ -438,9 +435,6 @@ rmi4-f12@12 {
 };
 
 &i2c7 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 
@@ -464,9 +458,6 @@ accelerometer@1d {
 };
 
 &i2c8 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	samsung,i2c-sda-delay = <100>;
 	samsung,i2c-max-bus-freq = <400000>;
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
index 2827e10d6962..19f9ae783587 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
@@ -220,6 +220,9 @@ hsi2c0: i2c@10510000 {
 			clock-names = "hsi2c";
 			clocks = <&cmu_mif CLK_GOUT_MIF_HSI2C_IPCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -422,6 +425,9 @@ i2c0: i2c@13830000 {
 			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C0_PCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -437,6 +443,9 @@ i2c1: i2c@13840000 {
 			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C1_PCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -452,6 +461,9 @@ i2c2: i2c@13850000 {
 			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C2_PCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -467,6 +479,9 @@ i2c3: i2c@13860000 {
 			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C3_PCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -482,6 +497,9 @@ i2c4: i2c@13870000 {
 			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C4_PCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -497,6 +515,9 @@ i2c5: i2c@13880000 {
 			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C5_PCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -512,6 +533,9 @@ i2c6: i2c@13890000 {
 			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C6_PCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -527,6 +551,9 @@ hsi2c1: i2c@138a0000 {
 			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C1_IPCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -542,6 +569,9 @@ hsi2c2: i2c@138b0000 {
 			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C2_IPCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -557,6 +587,9 @@ hsi2c3: i2c@138c0000 {
 			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C3_IPCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -572,6 +605,9 @@ i2c7: i2c@138d0000 {
 			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C7_PCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -587,6 +623,9 @@ i2c8: i2c@138e0000 {
 			clock-names = "i2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_I2C8_PCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -602,6 +641,9 @@ hsi2c4: i2c@138f0000 {
 			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C4_IPCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -617,6 +659,9 @@ hsi2c5: i2c@13950000 {
 			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C5_IPCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -632,6 +677,9 @@ hsi2c6: i2c@13960000 {
 			clock-names = "hsi2c";
 			clocks = <&cmu_peri CLK_GOUT_PERI_HSI2C6_IPCLK>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 

-- 
2.51.0


