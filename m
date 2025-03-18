Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9F6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=; b=k5BjGkoFYGs4jjh/KXawN6o3Vf
	U8ZKrVy5PYnRx0EdGQGINjJKtqHYyQ70F16W+NR10nn/HawbP2Fnz8Ohvl95d5AlaCMAVEm2ijJDj
	zsAJWUd7MitJ8cAxykvWlK6p4S+UhsmJmKhWMfuYGIyc3xMMDjuPnNm6AYefCAJquqhRbKCbZCQ0O
	gi/jLrdofKAMUpEslUp7nCbXG64YtVEO7xAb0Ibw8Bf+q2YZW1FvbDbOymxBrS8VlGcjJqGNDZJQe
	hpi6mUIf6y4HW42bpDb/ska/APtbi1oeY4q+Mt9YfmXUaHVHFSaynmfGWHJH4Mmfj7O+Ry+yEDtZX
	eKCHrupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuX8j-000000062jt-2ij5;
	Tue, 18 Mar 2025 13:37:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtz-000000060SF-0Ij8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAhmIM020851
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=; b=hLi/SnNipXI9DgKB
	IRef0gKYJGkf1DaVVKyHOJ97drZXpJM+D4XKvKeE0oGZT1oGxAiDjFtwq1Kdq7CR
	HSbiWUshVDNUfxy4XqTykBY3LTYN0XHldgOH07fk98WpcturGnBoETEcM37ZskCc
	rju/gp6rD2BuyWxxVvzq3LvYgDyyX4e4M1WF/LuwHREql5UtY+QbhVy4Bmik8ZSj
	qwNFWG9Y/LQgCsoIcgypBjt4+A6jWYOHctL6h9oyElxTR7oP0mSOPt2WGNjT9nNn
	/4OCYlQXkpdZt1GrmejwK1vJqHOu0GODXxHk8K+Im3j2Dq3BGw8MaJYa0hqMP6Ed
	yjdPDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbhxgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4768d63b1dcso114406901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304137; x=1742908937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=;
        b=hES8GcjHaOr/zx0ieLJnIXxwf/j52aD9Y/u4jL3QQiGuKz27TRlL8DP5ISEbY2CpPc
         JqmLMU5b9bBkgKtkDFpa4+8k9ENm1O4mr9hSBRNg1nkS/zHn9cerShoNECWpRWBx9igx
         Olb/ANtyzmCz77aWRLjlXNjbPBl1VeglrQYD+JQyy6Ij9pF+u7wIui/3lx5vtftrGLPu
         RrdwtKSj7kiQutoGRB16ubcR653nb5DwQeIHEEPY+Rkj+SKQGwoMs6iCBiZSkvLCSSxw
         cw7ktceaw2M+bg6XXHyyUPq7ZN4EinYgGqlSmvciGelFGhGAWFSpcS/YtSsKsLa0tnVs
         /AnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtjurkqpiFG1TwSgwBl54O6/NJLIuBKZhjPllu9e9pLvomqxXWiTXUrfSFiraB6+DdmU0ALeGzdOjtTfH/WtHq@lists.infradead.org
X-Gm-Message-State: AOJu0YxclLYgDKbjjwMhamMooFfQXHH+vdVQZdBCXt/RuNtKHNkw/GQo
	ouxY0KZ/KYFMTUrJSS/DIqKDwncCrQBwOldkfkFG0TddnUmsPg6lZsokHGIfTuCZ2XoPIYEA4Xd
	/Cy4XvLpJRZqCKgr64vngmVWcnz9reQjUCbbSZ4E8YCrWHOiGmdxm2pgEGVXIArKQA4fIH8drUw
	==
X-Gm-Gg: ASbGncsU5375A6AoQ4HNBcylmZsLnjJaF83KLur15HEH41G0myVoJA6e3YT8S60rOyS
	HG3apWNbtZzkf5/Y3o0kQ51e0UbELvVn3XJWMI4UDr4tuMgSRAsRYWSIx2orYYRWDbSBV9MUfC5
	9Jo7hZbAjnNvVb/kDTKmVdQh5hZxnVYjKXL7KgAoBaxRaPB96DoaflP3ousdsULAFMkLySxQVCk
	4hI2AVfRI32NiuF+cZKSL+UcFiiX86/+7S4jz5Yq/a8ghDcHuW7Q53zMIY4I5+jFO866K6bYJUl
	G4O1F8Ow4ESfgl4BUo96MirmUFyahza9pZOliab+UNZcfQcYw4vxCyosAaqqSQyLHADw99NqwZA
	UZFsjTieIjA1dmxUubsNpja6eWjuG
X-Received: by 2002:a05:622a:5793:b0:474:fa6b:c402 with SMTP id d75a77b69052e-476fcecd39dmr48511311cf.18.1742304137586;
        Tue, 18 Mar 2025 06:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKpVjZU2/I87t1KC+ZmwZYuLeZn6cRvCjLGhHZX7oBvEfdheyousKKIxayf6GNx8oPkiFQ+Q==
X-Received: by 2002:a05:622a:5793:b0:474:fa6b:c402 with SMTP id d75a77b69052e-476fcecd39dmr48511101cf.18.1742304137251;
        Tue, 18 Mar 2025 06:22:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:22:01 +0200
Subject: [PATCH v2 08/10] ARM: dts: qcom: apq8064: use new compatible for
 SFPB device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-8-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=euC9lx8IKVS/A4UdhCZ5+fvdurao8cR4qkRb3bHColg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN1nSWhjjLdnnXpPzLp1PCByMmTFxTcDQMxT
 coRRyEqPtGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1Y19B/4oz0SL/S+qapQnn843C0bdimTThUshN1ijFu4oJQkCKffFEqAgetU1nZhHUhmeKcbCKDW
 2sLuRIW8bwouTGzUF8TknWW5JJkb+no5lAEVSnaYAeNE3VaZYdV0yz/NMYezXfs58JeGWoCC4e8
 s5SidFCWQe1cmq06LwCjhckq0Knb4UUUCGRdaoJn+qhIX2IJs/7eOuCDCufDsVfLqSnnvbLYBow
 NOV9CYr7L+oV0XyNDUl2o5amELlZ1HaDdMtTiQXCwSzO4O84HesESI3z5rC3D4nTBpEWqDR1u9w
 2vBt4hKxclxTvhfCa0U5VeSH0slZ/CPJhgMUHQfgqUkGCSoL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67d9739e cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=vGl9qbW8TQSvOBFUlmcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: TPyNj9rKZ8Y5F-zEHylhkEY2UlDWtS2O
X-Proofpoint-GUID: TPyNj9rKZ8Y5F-zEHylhkEY2UlDWtS2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=800
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062239_117890_82AB2051 
X-CRM114-Status: GOOD (  15.88  )
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

Use new SoC-specific compatible for the SFPB device node in addition to
the "syscon" compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 41f8dcde20819b3134c38dcb3e45b9e5cc24920f..a5aad4f145dd368aabed44cf520ffc037018b37e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -1086,7 +1086,7 @@ opp-27000000 {
 		};
 
 		mmss_sfpb: syscon@5700000 {
-			compatible = "syscon";
+			compatible = "qcom,apq8064-mmss-sfpb", "syscon";
 			reg = <0x5700000 0x70>;
 		};
 

-- 
2.39.5


