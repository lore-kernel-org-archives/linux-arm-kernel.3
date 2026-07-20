Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32B8C4452E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuWa4CSJ71smicbQ1SN4Kz4bDAAQ4V0JRNi12E/BNQ8=; b=INQcwgaQezX2kdF0NFtxUopw7p
	9R4K2v7EpUuZrOuT5o4ezzGSK/jtbaz+sssyrqyc6UDIQflErzGVg/xOmMQ5rBYV1JocRxAhAiuEA
	1mOzs3Qkw1dLEUgkWyyelNPp3fKnkz4JQg6RlZmfi1qUpmJrAGP6Yd/oohPufIB95/TAXBbl2Zmtv
	OUfgJA9J4boDJSc5/uW55EjB/zZjIa5tLIsp+mYR5Ydf2w+mT/vasSQ3g9IzgA4F5RLQ10QDY895Q
	IJ2fzdQS3OwjU6KUR2txnf+DE2H83gyhdlkOL4gLcOKlP/rpqN7zLyU+/dup5QZHz23qxeKWq1coX
	AU/DNOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltHH-00000007iE7-0uQ0;
	Mon, 20 Jul 2026 19:03:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltHE-00000007iCT-0ZGy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:03:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KHBrEY3442635
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuWa4CSJ71smicbQ1SN4Kz4bDAAQ4V0JRNi12E/BNQ8=; b=p1lZnIVFhxCOr2r8
	FwoScd1wsjRT4m8uBZ0tWMo+oovPVm8x6t/HCmP4KYw44iVRBlHpGGGjfuKx5IbS
	J8nYmCtjfQ0ZfS70yyautckKqMe5qikKvg8Xn2OB6ayjpi11z8KO69KJHVpVqVEs
	8xVq5gysj9paRKCOAOKvcm1rB9zLzGxnO8aURJs7CDcaydynPdhjyxpw5hgx3lG/
	a8VwGL9daqjTVwKnc6lCwnz0tIBgN/WwHeMt+bEdQdq7PXvdEDwRuJo7vtgU2t4p
	85fJITwJ628o7Z7rvUdHFczJt3FtgzDCKsrzMtMmvz98uGjkZoybboZ4zdtf/G9U
	fEySww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5rfbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:03:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso91068561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784574223; x=1785179023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuWa4CSJ71smicbQ1SN4Kz4bDAAQ4V0JRNi12E/BNQ8=;
        b=LfaJdJRG6cwgKcFAHUaseGyupE2HgxqUyMwYJnDrbKJMxtivMYNH/5ZEv0X3jZiXhr
         QsKKjWPXGUpIVP0cYOn/HBSfQgcnRKl+g03p7mp8ZCu73npjrzTe/koimxOuZjFZnEg3
         AkEzybd+LLaGSkG8Vdhw/K9D6/hj/f9SWjd35EsJ7g2DPtL12JRuD2vQbWujcH4FdneE
         kzwA0zCCQ9pvUfQsXto6ir2pqXgDJ/ve1CssrbPMnYf3W/oeXuf3juq8/7yc0Mn83Bga
         IgyTcEftqvGJQobCAbYXGRBw+1Imu/Lg/TODMVSn5tLvvTwx7Y56EavbSaQUsA4QigS2
         9uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784574223; x=1785179023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuWa4CSJ71smicbQ1SN4Kz4bDAAQ4V0JRNi12E/BNQ8=;
        b=mji7QWdP+G/SDICxEt2Q/tNJ0KvnPbHZXoOj5WdqX3Y3zw/UiL2ys1Rh4dkwJmFGuY
         nu5Equ+vQLRekAEl/DHKqMWNTRStd9abWO6G/7WA8wUCiV2+t4BLeeWUFYUvizd2fsQo
         1kBsdggVhqu7a8dWTHhJXCw1JWYv8h6i1QttSGrh5ihX/lig5X1P0fV6lXYgP1YBOcZu
         T+p6NU0PBs6NgwbZRHTqItI47cLdV2pX5bcDKT4FVdALJk0qIY6iqwYSg0482GCd+PKp
         Qq3LjY41LsPMg1MKWTzvm927DvQyPuLdLTgCWAPlw6wJBknjp492JmczEB9ZM16rdF2s
         I4zQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5BIejKufSx9hf0T25isTuQJgPiPza3zqjOmUR6b4bjp6aH9uuLkIXamBIIVM6byvf7pfP8hkzAlCjRsMqQ/Mu@lists.infradead.org
X-Gm-Message-State: AOJu0YxsYSLZOJeZSQiz+qB/4xl/lMGmdS1w8R6ThBj8vsDIB3/OI62N
	5R5oyBJ67Kd6prgUB+R0rzCnCNjK5byp8piw23oMjVWwYwbRsTmuirGuADSR20d4z0H7lhcsP5M
	hNUSrrc3wZiVGMS/pq9NI+RUTQ+DkJlgcsBYYcX7Mt2di/dkAUzV9BgDGCE9JpUwdMDRfLazzmk
	6eHfHxszK83A==
X-Gm-Gg: AfdE7cktJBgrNAI8QHkzAfZd6IVDe8SX5HjeL4IHVYC/Rm2Hjm0CFUDA6H4+/7at5DD
	ump7cqw1bc9z7hSFvz8hLtmondgIvz63Dbk/P1x4cBCvTeXURDwDhj1gw7IdDi5N0yZ1dp8Y38l
	Kcp5UKwHBuAty9n2zIaioJegoLF65TLsuU53iG1Bbo3zPEuueIGyUTSBbdK1DKWIBBQsLnGO3oE
	OuBy+W1Hfccjgq3uabhawbgnsMwGQwbsEpql6H1t2FMykSo0T95h7WbRM8w/vsfJ98G33Owwv36
	8DC5iSoK99lKEymQXNH/HvmpheTfEosnO3aDX1r+Nlem5bfWjcB52UV4mejHmAFB5IPnrcLND5w
	MziKzBTeueJcoDa7vIPUvItoK
X-Received: by 2002:a05:622a:5b0c:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-5213a383538mr134376661cf.5.1784574222712;
        Mon, 20 Jul 2026 12:03:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5b0c:b0:51a:8dc5:bf89 with SMTP id d75a77b69052e-5213a383538mr134376321cf.5.1784574222376;
        Mon, 20 Jul 2026 12:03:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954aa1a231sm181509845e9.1.2026.07.20.12.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:03:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:03:29 +0200
Subject: [PATCH v3 3/3] ARM/arm64: defconfig: Drop redundant Qualcomm
 interconnect entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-interconnect-qcom-clean-arm64-v3-3-942e8ee7ebda@oss.qualcomm.com>
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P3qudtq8aL5VayRLTwk45JoQ+Pok+bOMfhCUWilcNIU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXnEFmk3ZaxFirB5xz6i/Pw9DZ1VgvyXjLIt34
 tqnNQYkUxeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal5xBQAKCRDBN2bmhouD
 1yXjD/4mBaoS1yc+FLKpo4ORjSJV/YHXAbA4lLPhLCDmemdak9rj+o8HJ1ux406sL80xDANWdoo
 5EwFysLADJzOKLqQhGuHtXZ/TdIwu4to+ICiMVkA8rVBkQIt85odqTQu3oJfSmdRB9/ekLcn3Pd
 XRWHdvJeZXOOaizd5YXhZJ9LUCJajDs4mFuqt53L+xxNdydIC6iYoXQse77AEdyCb83gw5hV0SG
 rr/eK17QkeKI4LbUNPxJf8xR/ZY+1oPAr56jalsE0Ur2NfUvqYsquJmFN8Vmyq6e2haOiKzsPTS
 tu2HJwEBHJze5Y670SLOHaCUEntp+SB15guCTosHIhbC3Y/g6tylka59Bd3tYQS2VdG5iWnD3uD
 g5w55OREhD1DwiqXqopCWLMYIVabxi7LJQIKUcQZ/72SmrS63R0P1XTq4QoJOJJQVlQpP1ANqYu
 NUjm/HJ0fS7Ohw/V7vA6ZdeF5G+UeNa3XCuuhCIhQdtAGf7yn2x7+uuPsAjtO2eRt+MVHwSR4YZ
 YqriIGZAz+LeiSBupq8x/nUIILOZOYzq8Gnjc1KGANXQYWwZF7cLyz5l/nZ80epy5ZlsWevYTIR
 SMDRwhBZL0CyfIvAS5mDI+j/GyD/eeq0hSUjZyRIcpa2+UXqYsHEs63asMnqH/l/ZOI5WkZ+NQK
 GStxJDBZpEHoU3g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfXyVC2Aci0VS4e
 4ScjqyjEcqtrBTIxg4WPSGZDR3V4G2l1cP0bB/m+NzQWXSwV88N0pgjSs8UC6D90DJyWxj8iAI1
 OIvtLzL7y0iZnnpXtdGkO6DdpjLmNPG7t6HkL4T8ikm3DaWVy+pp9NjkbpdovEiglzd21T5FID0
 mk9Ps5QFu7AE4+QustODEXMtsKSd11iEZJbmlzaqKr5+45j8Eh6klgz38dNhzH/Up/966urhsgp
 ukkD2n4qYoMP3Uz+swGW2Ak7ByTgzddbcJMmUaUGYfdYWY/dUdIqaUnFGSxwNeKg0sa6m4aTpVt
 8szX+m0H2QpNoXRhS2w9ua2qeqNjB9xL9Z9teg9fXBfpVZb24ECDFpHhrYZ0BvPj0woZqS8jn+K
 wKqhEgtDvrLz+xiH/hlUlytIDTVHvH7w2PQSbxY0Z1gj35xHT+07noXSo5+oRuuc5g+AaIiU6nu
 B7QnOzhdcO16qnoDjkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIwOCBTYWx0ZWRfX3R8eY7WYmuzO
 vgQtzX0glFRugYvks5gZzeCYgDE6gYWjcTEVtVP/O+DHFplm6+Vv20vCDuA7HqY2/AhSE5wSQTm
 mHvNFOoy7VpqSsRTRyt7mlqi116RPRM=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5e710f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YAWiFM8ZlreF83lw66sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ibKJhUqq90tBIW_TlYueAX7yVi5WgaYJ
X-Proofpoint-ORIG-GUID: ibKJhUqq90tBIW_TlYueAX7yVi5WgaYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_120344_229235_9ED28BB1 
X-CRM114-Status: GOOD (  10.72  )
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

Drop all drivers from defconfig which have defaults in Kconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/configs/qcom_defconfig |  3 ---
 arch/arm64/configs/defconfig    | 31 -------------------------------
 2 files changed, 34 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index df0a0ce5b097..630e31c036a9 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -272,9 +272,6 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8974=m
-CONFIG_INTERCONNECT_QCOM_SDX55=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 91a3b2cd10b3..b11040fa9cfd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1863,37 +1863,6 @@ CONFIG_INTERCONNECT_IMX8MM=m
 CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_ELIZA=y
-CONFIG_INTERCONNECT_QCOM_GLYMUR=y
-CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
-CONFIG_INTERCONNECT_QCOM_MSM8953=y
-CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
-CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
-CONFIG_INTERCONNECT_QCOM_QCS615=y
-CONFIG_INTERCONNECT_QCOM_QCS8300=y
-CONFIG_INTERCONNECT_QCOM_QDU1000=y
-CONFIG_INTERCONNECT_QCOM_SA8775P=y
-CONFIG_INTERCONNECT_QCOM_SC7180=y
-CONFIG_INTERCONNECT_QCOM_SC7280=y
-CONFIG_INTERCONNECT_QCOM_SC8180X=y
-CONFIG_INTERCONNECT_QCOM_SC8280XP=y
-CONFIG_INTERCONNECT_QCOM_SDM845=y
-CONFIG_INTERCONNECT_QCOM_SDX75=y
-CONFIG_INTERCONNECT_QCOM_SM6115=y
-CONFIG_INTERCONNECT_QCOM_SM6350=y
-CONFIG_INTERCONNECT_QCOM_MILOS=y
-CONFIG_INTERCONNECT_QCOM_SM8150=y
-CONFIG_INTERCONNECT_QCOM_SM8250=y
-CONFIG_INTERCONNECT_QCOM_SM8350=y
-CONFIG_INTERCONNECT_QCOM_SM8450=y
-CONFIG_INTERCONNECT_QCOM_SM8550=y
-CONFIG_INTERCONNECT_QCOM_SM8650=y
-CONFIG_INTERCONNECT_QCOM_SM8750=y
-CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
 CONFIG_STM32_TIMER_CNT=m

-- 
2.53.0


