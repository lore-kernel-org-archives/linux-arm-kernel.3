Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8134C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7macVYl6YjnurDIauzgO7hvqeoRbbfrROTBUYO7oFw=; b=WXk6quOmZckLQc1iUqJE0Ds+ie
	HG8eOb0DhIKy5NEPlvDNSTjDsGppE/Ji2U9fucO5o+jcKyYC+DKafMaPiepeWI1lif+BXQvFQ933u
	FmfIXogxWKEbczKImVDF8jSHez1CcE80tF2jnsmd1pawrfTRPGM/oO928KIM3N2Ya/pz1GxD35+BU
	3jBzeGH9wOJnu+LOB3s5j9BGN+xQu3kH73SsVayr93idfUBA2LcmVy6QxfyvgSWPWdPZSv/AjqhNB
	SlehWo9UKoXgJg18N3kfra6P+vdUphB4G4QAKUY2nDPYUJovfh9l517I653aWenRGySloZlt4Jqz/
	11ln4+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ndq-00000000W6s-0YYH;
	Fri, 25 Apr 2025 18:19:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N91-00000000RdJ-1bVo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuRp001337
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7macVYl6YjnurDIauzgO7hvqeoRbbfrROTBUYO7oFw=; b=nys2H/rlL/hFc2Z8
	EJNAVx01tS4LSm8vtOeiRU9MCZhJ7HnXTF3R/dZ4PyYZtr/mPfIO0a/5/GCZ7IUy
	BglgrrvrAo4Dq1Byz3ut7OiDi8slpTxRXAQk/KOVBP7hCWF7pnq5kQIrI0DblALI
	k2yjRPHkjidvL8GCnHps0R2XKA8ZVKwJFH7KobNfjawxa2N28AxySoH4srwXjpci
	k5SIl0tQKHULt7E4OetqrVGXHyMcJDJTsJdPGq7zkbe1r2xpP9pPqH0bWDkyHqOR
	7a7bkOBQ+juDc/PG0FuQAqxS2IbTbzpOkYLq/gKiz40w/b3M9tyVcmlzje+bC+/5
	Ys8Cdw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3hvxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e90b13f5c3so52977136d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603241; x=1746208041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7macVYl6YjnurDIauzgO7hvqeoRbbfrROTBUYO7oFw=;
        b=WlqKlrpmHPRBYeNjCdgQ3apGFrJUC9scgUOwwuwlgcoESUA91GfsogPreDCrJz9gMd
         p4/mTyU1/d1iPP8NG3vtv/Dzbip/nIMCxkyHs/nQ6UcZryOK2AKuyl0dhdzzDCi+zwu8
         LBHessX9XPLI6C2a66uFPuYu1C2wWRFZTpR1eVm5GyMMarsJ1T0gLwmRdnLvw5hjMVFI
         BKEowGiR4cNoc0sM3fCzRuDMYWlPZHtd1pMrVVdpdSZT4BP3R7Ax53nfRYMgK3ttJ4CJ
         0J0/BeRaxr/hPfy0SqFOQhXKLm8Zi0/bvq79JB270Bi1Tn9eQs5wBuuHdVeOcHXDScx7
         9XgA==
X-Forwarded-Encrypted: i=1; AJvYcCVCmcSpuTifeIlC/gACFEmMHoY6Oe7ajsOFqvZc+rQltd89BwV+Ns9obbqzHzenYv54ovkjjdvblmZtuoej8FEX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzih3hY/XyxLOZjAcKbg25OKbitkVWR+ZtALcqnZWH7IU1b9x7o
	kLOHVf346CeLc5EIe+IEffEo4B8tqX1HsvUJVW/VFFHsf1nxQSh2f3Q6/ramWdb81dQRiXcPckL
	BhFCZ8WsAIptjdh4D00SWSzn4npFEWhD1Ltbi3NKTREwt++1EQoXLinnw2s4z66J3WZ92LnJjIw
	==
X-Gm-Gg: ASbGncvEFUAxiBoyP8lwImf9YEmHwczT5SbpBnuQxme4EYNeCNWaTl762E+3xUqhFPA
	0BIa427vBOTh/KX63gGFOvkQ5ip47kbfT1mHE4xZJ76bi7b5/2p6Y99GZEPGJm3T5Z410AQzGtd
	6bupaC7KeiSjCQvsql0it9oAu7KBR2Qp1/l75y4JuakrXIC2Lw+QHGUf6+maYSZALpvfcv2NYLN
	yARct77IlEMX3UNCUPLf4w2V5OHMoYENMkRT4CApdbZsMvp9Z30CqISMr8CO7jPuXgOy9E2fBGL
	L88/VVq8LfeJ5MYsEIOvYZtrpfVI0TQ/W30AsQOjk7fdR11Lv5rYs0ruwKlvgXl7MkxJjnvRgEn
	8ChWCjhBYqH1jrGRgV/BwDm+n
X-Received: by 2002:a05:6214:262d:b0:6e8:fb7e:d33b with SMTP id 6a1803df08f44-6f4cba43cccmr52613156d6.33.1745603241732;
        Fri, 25 Apr 2025 10:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1y/cmX+wofdmApf8bVZN1nkDanwc1sGDomhzutzvDrC+emKmIi5qJwN4N9Of1eH0a8pSzXw==
X-Received: by 2002:a05:6214:262d:b0:6e8:fb7e:d33b with SMTP id 6a1803df08f44-6f4cba43cccmr52612466d6.33.1745603241240;
        Fri, 25 Apr 2025 10:47:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:07 +0300
Subject: [PATCH v3 07/11] ARM: dts: qcom: apq8064: add missing clocks to
 the timer node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-7-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qxwwAQssnBZBBVKru2sbCtWxws/ZOFEbWlTaATtYoOk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qaAADJ0lbCiZwXhskZFM8uo214/Wv+vE9Xc
 4ZpNVcuJ/aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1eUwCACE9zPnyTlBc+5X5YSE7INFDKajrJeYJrqbo+51TuooEwM/Qw7nvb2azH6lM7URIZWHnJ7
 f6EGXoiMs7cXZiPjJqk6ReEJnQFYTJPl2qtzSonOXOuYZitNw8xzKYhghosgiOipOlv6QAXQeOa
 Nsj5qkrLiT8PSvbZ2ClcuFQkUOGT94VcaMEFpTAahsH7UCUK/Vt5gbOM86zybLUQNiQC9WEz4st
 5VAhTC9QerpKDbbrheGJJDs4DCZ5uuJI0L33UECLKsXFn7yY8yTVBIWRn0KcCP1ywgpVxtaHaAo
 b3siArbuFtZqGM9vpawf2jOXR912K6ixrHHPpQqiFQ03FZDJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX8DNodeaDEyeD hyD9v/MpuHLZlr+65rShYjatQITiUlOVIMwrHxZHqpuiXBTatj6jZgBYSDEIn+f+perDG5L4ycX 26hk/PVN1nNiWcEtMwqBJhfq9ZSkrvD6SDSzwDn+1NjQbNzRYqhOMD+5tSm8GKna1gYJoCzvExJ
 QznGIA8nI+8wOfSoqsKV6aKNm0Aw0+UEyHVqMyh/CfRTBV3ZLwI2WiLdEQ92UODTmmfRkZD9m1t kCKKTKo0wFWZxnVyJjNUsj5viRpruLjeoeUwpfpXJrpU1wvdZNt2NCdabxMhjv0g1wFNyjXGBBb t5IGpGoiTG8jUCGZBu0ZWXTIWT7KJ5f8ET6YAae0PR2l8QuatJd5ZM/aas00NVV1z+XLOXpiQmf
 QSGRuG6XZ4fSbFRk4tt9n94mtTAnsB5mRMOLJC0EaXW8Ww6QmLU2zQvKJBZWb6gGS54RoAh0
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680bcaaa cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ZANWpg7mVWKCtM2BIo8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Y_CjM6x_ypDXNvoPSMDMEAoLZBSufdFQ
X-Proofpoint-GUID: Y_CjM6x_ypDXNvoPSMDMEAoLZBSufdFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=941 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_104723_427792_D4C71D3A 
X-CRM114-Status: GOOD (  12.60  )
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

In order to fix DT schema warning and describe hardware properly, add
missing sleep clock to the timer node.

Fixes: f335b8af4fd5 ("ARM: dts: qcom: Add initial APQ8064 SoC and IFC6410 board device trees")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -326,6 +326,8 @@ timer@200a000 {
 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
 			reg = <0x0200a000 0x100>;
 			clock-frequency = <27000000>;
+			clocks = <&sleep_clk>;
+			clock-names = "sleep";
 			cpu-offset = <0x80000>;
 		};
 

-- 
2.39.5


