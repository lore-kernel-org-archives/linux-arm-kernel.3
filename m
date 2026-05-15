Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E24CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=; b=v4QyvAwkGKOi8hQ6lv9eAuULkm
	s+6XvDWYGiHmGr7blmJsY1wU78s04v5AxFqMvC5hLRJa3lsGB365E3lLlSzE+/9SSf/mjLcjv85Ty
	G8F/4ksebdfyt+EYOhuKTNpsaXncLMKvjz8VLGk38vQvwqldHBTm7mGwVt+cZvcqfOwridM/fSlie
	Sn69a5RKVOyevXHJ/yRU1SFzfIMRmwD0LqxEHNuOkO+Oa2LDGkwZIXKUlf1TvX7HdUOF1PF00CtB6
	DYrACjN05FPvj6T2nz5D3HQ1lbla9VWPgVnxGOYE8XbHCYtaCcW43NxF1QULZd0+5s5i1NE9sFFHV
	4+upWG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrO6-00000008Hu7-48eP;
	Fri, 15 May 2026 12:11:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrO2-00000008HsC-2pKE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:11:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBU13Z1848082
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 12:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=; b=YeRYgX69CVp1RTMy
	3uoFCAnJNW3U9LUp3+WLIDD1NWbefBnXMApn4+qPufnndd7gjdsFY/68s4+7xIhz
	EFiU3WGsS8uiA7RYKv3QKS8V33KVN1OuMeJ67doqghVf8XVIc87R4EjbIWeof/fw
	KL2Ynhoed73Tv8KTeZIQJGnfq6jMJSwf4OuXaaJMTQY1rY9ikyHjVYPinzQV+rdr
	Ff5pJ7BIFYh834GyDNMbogG0BTepg49tn8viwMPKShbU4nSE4ndQaGsaH/lLtgJ/
	VLdQSjn8J6FiYLGR8PAyqgak9KYt994C1ZFCG6ikMRLqNlmBQkhymGqvmka7pYPF
	Z6EebA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t34m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 12:11:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6343b1bcbe8so4239369137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847085; x=1779451885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=;
        b=HL6xF5suNihtPWBeICkHMz1KGXlPr6Q3BVOX2xqNDiD1K7n268oLU3RA57mYtTVMJC
         9wW6BAXjbrfBGF2eTNG5KjqvivylIYRF7dT4hFZ8ZgEqRhlieYQMaOA1uvbFg48vM8/0
         lGtEBsp9sIMRLNQApR6fQZ8ykhHySEbMkPg/GROS+iATBOvSVBeZsdrt8P4hIwBN5+A9
         5elcz1SLsH28HCsG42SoMR0zrzhe63z33Zhnk0Hklyq5Uw3zmiYnKDDm0M9vPJwB/133
         zcWO/lJXdiFKtqoVLQyjXnI2QlzTtaS+Bt+KOnkqc4eiXdak4LDWUnMj7qX2gfwBVR6I
         y6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847085; x=1779451885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=;
        b=Alc2cnjISgwX3aL5dFfJT8zCeoLnQQ9aGc6Aw1pKbkBSq60cUcWQjwQ8oKZEYUPfSn
         8jfm/Gf+Iu53lA0yPteaUGsb8T6AyZcgNDnPc/Wg1/B+5MYkyPOZCz0RTJUbD37vs1+O
         518bitq97zER0YcDHzdYHmcZlOBLpqh6Vq8WGgBXVDFmHU5495fQsiGLNKleiOF40AAw
         iDKJcVrphZOxewRJbAacIqe3auDRnWIbjoEu9EIJMjJaDeQh4cUUCRim+iBdHazhfmQs
         fMkWG64tl5L3MNw9J6gGAhljhlacqYPZX7npbqhJ7a6FzAlNkaqvjyomtBtiqkrbHHS4
         IBcA==
X-Forwarded-Encrypted: i=1; AFNElJ/n+1ti5uQWCo/qqQiZad2L0m+mcGKSTHg+37Wr9DWt56SFYrEVl/CDSvkPisTyfrf1QbVHpYrG1hmESHWMTXAQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzhBKHBhJtV8P+nJ1qjpzO+k8KBG8/9J/9gij49TWbp8FncrAAd
	jet1EvteyGDwhF9tif9ARsoedUen/fwTwURxOjuP9dO2M3Y2Wd76a/qf2JxFMgkt/LNfS88v+sq
	Ews74yxRrsA2k1tvX+zwdglFA5knE30RTf9NdhImiKESu5w2AK4ApxjonF5TTH+7DaKFK/HlTPm
	4ymD/xwp23Sg==
X-Gm-Gg: Acq92OEy6zdMbRYPn0gu97YnERgSbL/X1dqKJbwwE17xX93yJfuxzJoBJyVJz4sHsJJ
	MDFrEWUGYjhWOqnE1jRzu0hLoLIVvwfw90nWE4n4gvbZ45rIT+g+b8gQZwIXTX3TmEadzKkLcuq
	bwjRljcWOtaAYxgchu1WZVfjKRfYHslvloBXYOftnRsV4OJU8zRnaXo4S3QhIM23U2PUKbdOoXG
	gXSrgBzAn8uAaCHfSEaKZE9db6hZHYreqamx7KCav1V1VuyJoiSFAvfHVkLQeyLHgRN66+ZHxF3
	pH7AyIrNIJ7+skZ/02/86W9/ga7g5XI8hRm24BqzHkNmU0E3ErzIwWbjnIB9dHvhXoFzgZa+Ln6
	J/UFSacw9R5eIRzp0NliYS3yYkEuSxmoq1G8uYpxSq5vL
X-Received: by 2002:a05:6102:3f4b:b0:631:28c1:1554 with SMTP id ada2fe7eead31-63a3cc0dc23mr1573645137.1.1778847084853;
        Fri, 15 May 2026 05:11:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3f4b:b0:631:28c1:1554 with SMTP id ada2fe7eead31-63a3cc0dc23mr1573593137.1.1778847084298;
        Fri, 15 May 2026 05:11:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm66855685e9.7.2026.05.15.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:11:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:11:06 +0200
Subject: [PATCH v2 1/3] interconnect: qcom: Fix indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-interconnect-qcom-clean-arm64-v2-1-adeebc73596d@oss.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQAWJBywT6pwqGJLKFwuedfSMNGXnwkl9Ism4JarDpQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqBw1mhAma1Kk7FbCijArenpJeNhTmVnIGkALV1
 KtJL8knmb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagcNZgAKCRDBN2bmhouD
 12QYD/9aaKMboLXLPWMgjwnKO2Be23qM/DK4PugY7JAqiYGANjGhjx9rAtxPlW1S9LIvvzGNgco
 9cfzcqQbdDYAVJP77tdtbL+UoOJ7i63UmDGeQsijiMrUGqtvzWK3D9R3nd179lJCauo0tzUucEK
 eA8PUEFnVw8DTKzLbnFKLCSbl7eOAUtkJpO/5eL3Wp1oaFQX9jBEWC9X75N9rHnZ6fq7fiPGWly
 +GDSO9SZ2vS0sLUZlBqeR4y4HqzHRzO9n73Ip713ouscPK0F8mJjzRmEEI+fYUfc7z/narbZurB
 KxMUeIF11FRX/2WFrS1y7Q5z+TCY2P1ri59s3l1fOLXjw4yi5XwacviJ/oTDp30AofSAvzai9PC
 84Lg9OkUFW2C0NEHIOqXZt7+67OHVf8Jotan3Dr3bby7lI6eJ3vgYox2xGRNtZH/mjplWbeo/yW
 HPyuvfnv3uMOIFB7XC2qG4AFFCrJbDL4u0BqKCoezCsy1IgwigkCtJ+KOCnDmFHqwGcWj8cxiQi
 t6O18lZKtdFlxf6gIR24UbY8E/lWAAklCZq8+joR+yyipoFovQqCQjf5XGqucPQbB529Tvs+XWt
 9llMzWTvdq1HdJcPXdBHRMrSTrdfdnzVIcSXXsX/wQgXujI3qGQRykwOQXl/6MBAnW4iLPM4ePQ
 Xd9i8x2Bm8L1bog==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070d6d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UCTw9GvNnafMAvUb21oA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfXzFzOcs/FxKSl
 k0kPJrX/dOhtjtmNSgry9VlrpwxtSVcBh53HaSAJewVqgzAVqwysE8IkbqBl7Q5zBcJz8oAYAQC
 U7jMjBEdNJ7Zw2GAU41SCk+0JnUWyA72VCihDVNNA/Pae9BgZzLB0h1hi0WPqu26yFsRAD7XYMV
 6WdUVETCwQl78lMpzUlcg9Kgw/cwVfltndzu+s+4sNvVcPWHjVwmzGm1tesXt4MRTcWIgW4T7zq
 1Wjy8b8iFmBEmIJTrsitpsy8ixWg3XdaGXeDOzlgbHoLyZ2QdslY9EZSp4k+P5U1o08AUdPrBsM
 pOyubaVgUDNK0indGgtxQNeaXdIJM4PDLKOCLGcwq/GDV+fLGaFxqqLtunjf7fVrdSVLMKnzerW
 E+2ZN+H9HfrhzVaiEWg36fHToFwS9mwPbmGfIMS+YI49egkByYT8uizR7zivFhqSO2iFV6p3wAy
 7Mjjkq00DZ5ewoWePkA==
X-Proofpoint-ORIG-GUID: Qyx1qn_C_PBzWOTd3P4xBz1VXtfOUt-U
X-Proofpoint-GUID: Qyx1qn_C_PBzWOTd3P4xBz1VXtfOUt-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_051126_849453_0554A64D 
X-CRM114-Status: GOOD (  12.96  )
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

KConfig entries should be indented starting with one tab, so replace
spaces with it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 786b4eda44b4..871663bfd094 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -9,22 +9,22 @@ config INTERCONNECT_QCOM_BCM_VOTER
 	tristate
 
 config INTERCONNECT_QCOM_ELIZA
-       tristate "Qualcomm Eliza interconnect driver"
-       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
-       select INTERCONNECT_QCOM_RPMH
-       select INTERCONNECT_QCOM_BCM_VOTER
-       help
-         This is a driver for the Qualcomm Network-on-Chip on Eliza-based
-         platforms.
+	tristate "Qualcomm Eliza interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on Eliza-based
+	  platforms.
 
 config INTERCONNECT_QCOM_GLYMUR
-       tristate "Qualcomm Glymur interconnect driver"
-       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
-       select INTERCONNECT_QCOM_RPMH
-       select INTERCONNECT_QCOM_BCM_VOTER
-       help
-         This is a driver for the Qualcomm Network-on-Chip on glymur-based
-         platforms.
+	tristate "Qualcomm Glymur interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on glymur-based
+	  platforms.
 
 config INTERCONNECT_QCOM_KAANAPALI
 	tristate "Qualcomm Kaanapali interconnect driver"

-- 
2.51.0


