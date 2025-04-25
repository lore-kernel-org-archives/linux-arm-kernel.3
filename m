Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9666AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=; b=nqscgZTTCQ/h93gCx/DRWGqHCN
	skfPsJl78ip8+4rqPzgdpHY5oGoHIae6BT0Szn9Zquaq/ezHYcAFpEGKyNhKUT42UImLzCw/eYkDB
	4orftXr/PLAnODJ0r5idfmOdGdaO19p33B6e3q2uW0148ZkDIF8nyIYGDKgcekUwFe3e3wxRViPQs
	dIq6ilVPyR3dFihE9skKmMDaUfPSTrz95xtpy2OFfAXdPDoJWSuViNjp3Ryl0tx1wleY/BejPxQMC
	vMn0bVXZOdS+uzqTSfjB+tfMqPpGlk6Sc1XUmmgJ8WAaMEqiU5SgCEwgKeZlpvCNVQCe4t5l9jHgK
	Nw0e+ddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NjK-00000000Wls-0i77;
	Fri, 25 Apr 2025 18:24:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N9D-00000000RhT-0HUc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 17:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=; b=pV/O50NgUOu23/gg/mcTygxfUk
	H+84Rb+weANK5R7Jc2qTZIjR9paphJu01CSmEOCqJ+yg3V5+kxPOS+Y+N4Y4lFe7Zqm9Ck7MNnTGz
	UIhBb3TEd0Nr9/zBSNUD34eFhI1Rtqh1JbscY8/9lbetTaEkSXC2z6oOrvff4ZRDExzaXoQsPDeQl
	cHIj58FQgn+11GRVpNkTHAD3FIC99dTkfR6XIXiO5EG3m3LShFC/5f1oTK/PvX2C2FBVZUdSKKTou
	UzR6i3mgFU7Oydlu8s7+HlZCH2NpMTh77bwGs1GzKAyMwAgSXuYMOf2k24zVyqfVH7lm4qfwRW8YO
	1hVU2DEg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8N99-0000000C7iY-1ZCu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJq3o004639
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=; b=j7QGIM+hkbkOZMxv
	i5eO48NUR/jzm3EdeCb24hpjzmsTbl9KoYgSEI/jv/aJvqTYc51nMumFjdtcgU2x
	Yd8wMd4vIMn75KtzgApMshVnDTfqGA3a3w6eNJmUyms9vP71jJLMr0sMfwlJ3oby
	EbHqj7l4dlnfeu5j76/0yykjoUG7FI72lN0jBP2NRsIbK9T3HfI2YEXvYj3/2gxT
	gUMvEpt4+4K3X8LEGWrL4xh2XHNxLjtlGReD8eu0Q2auDiTKj/mN5dldHL4DgmXB
	9qreJM//zy7bva/1NZDLwzky6Cm4XTBZDGPxbNVcFgqaMOK7ZlXPaGxOzdO8cRYu
	JsEcBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09w7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0a3ff7e81so441736685a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603245; x=1746208045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7IO4GSFLKL+RE89vjiv//aIMcE3MIuPp86OVbDzpdo=;
        b=Jm/K+7wvg64vDrKR5ax49HpISVQF2MgVOWyPQ49u+l7Un0JDlDifeLN0kBjdH/EYaq
         lKbAHYqgpkUDWHZox3TosyniQaMUxOsXUkKjYdJ6BByjQ32333z6AewLEwRWLr25FHrV
         yGnCbk6euGg92IFwW7J0HA2gYzVieK+GFcX3hPD3ZsOxprmg1v8+2Cixz2kBcy2B46jd
         rxemPh9cffc3KQk0VfSZwDfvKhgEDzCqo6nXTXVqyBei6F4uHeMZIOqwfOaH45Q+xVHY
         GscPmZ23AuXlfAz18oHQvbv2Ajk0N8c7GZDHBDi5a4hH/Yfj6Bbf/vpo8hguq2ETdkf6
         bniw==
X-Forwarded-Encrypted: i=1; AJvYcCX/t5er+8mN9AvEG2L3LpvQk46OYeIi57Hn0prMTa5lfVBVEGkamriueIxpa5wp1n/D051CZRNFwIY5lpLTsgql@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb/O/tVo23GLG4pQxWxVsR+xFfScaXhKQtHhVIx26fAw7ustjK
	MQFQjlrTSU3T1lRS7CDdGf+rrHcANXFQEAg7Oq8CijB8ANsGeJxkT82534Wo9IE3Ec72AAg6PGU
	J7rFmKv1uNTDKrUVqdSvhfBCDRbCNLORoebt/MSk22m21rJC2QGQSWZvrBA1Jv4LuHwRoBb3hWg
	==
X-Gm-Gg: ASbGnctDL5yZMRT8TXrSfsnotdn1X8G7nhTNKvt3VtQjZyF8XMGlYJ9I8HPsLYFUnYA
	oEzDbcDrqRtyQ+WwVUznqmonyWMn/D41JtgEkcRzGFxGihrlp044qWnDvLkLkyEmI7YJ2+ztg1/
	SLOFtt9eBGKkSrhbCXfFedF+JMO5dHK3KvlpMbLAlFumXM9xdGDkCVXVY9ocXzK2BqbeBv6sTOA
	oE5caWdO9WIppIvKl1fjw0Yyg5vhcIB+bGebIWv/Nk7nLD7d1+tTkRiQQbMSbVo+bOt/DFrCxVH
	bzw3Ok7sRNbK3t1eeTmKaBtzhZB3cg2uM9y8EnnUkgaBKvWceXXQMB+YFnsJmfFTbV1s8zFedDW
	F9wjsqxRi0G7uOETSE2X+HXMn
X-Received: by 2002:a05:620a:460a:b0:7c5:50cc:51b3 with SMTP id af79cd13be357-7c96072d7e3mr483415685a.33.1745603245188;
        Fri, 25 Apr 2025 10:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtWO3ZUcxDc/2klMeYlZoJrKhUFUwBPFBESBgrjTBIhVNl7tUqNE3ZLJF8IgE2UQDL/2QyLQ==
X-Received: by 2002:a05:620a:460a:b0:7c5:50cc:51b3 with SMTP id af79cd13be357-7c96072d7e3mr483411885a.33.1745603244862;
        Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:09 +0300
Subject: [PATCH v3 09/11] ARM: dts: qcom: apq8064: use new compatible for
 SFPB device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-9-da4e39e86d41@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=euC9lx8IKVS/A4UdhCZ5+fvdurao8cR4qkRb3bHColg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbUyp12J3iMaDl11OPJ5HVt9azxGa85+/2j
 8p1wI4mC0OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1ZfKB/9/byvswDJiseb44Tt3uF9K4YrTdBCHtg254tQgElwLWqcU9hk5NvRAi8z2vKudgCBgBNx
 cg74FHwlrFHkxx5ai1CJfnMFWEYVz2tbHYNxCZQ5PhfYHRup7l8aHp4IGdjZ8aojWMM4EODrP7V
 MAGHgvmSpYadXcoIEzRRtaLw1S4b/64wDrdFchuqxFxRL3UL4d+74lgm+DUw4eIeAzN7AcYm1DR
 fpPb30O8zULpjxiuiXjmO7x7Xyghp/A7h+RbNE4KD1gjjUk7P1vegKFj1R6h9foCyujXQBjoP8x
 910Qvr8H9SqLd5sRuomxDw4y6g/FckzUURkLnhiHeVLUVVyR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNSBTYWx0ZWRfX2DeMJ9oBH+9o xkolHgOpkmxCS7bLTYcTp9QdwzmGWQ492RULvpE8kJTGLjKeB1fSosEZ72DH5FbtIDg/bQMztO3 C4IDJT8He4SwT6bGGvYMthsu+eM0WQ2Q79+obG1M0ZgJ5ueKQcFGO03J8NiGt4PcrlTf/HwVi2i
 VGYgYDiYmXWdUexD7LlgSm8DP+m2UbvzPho+jaXS22i2pKQ76Cptsk8VZcTmLxTGzM7lRJPOXna 5kdHttE26chvLBmQTk0Fv5qOWGMC9LGSJc/KMrFwYt2lu8QwDoCOMA3BiSDR/1cw0uaCranmSBI PmUUiaLUzErZLtEt2D2o3Kfk+HsvxFEud3d0JfpCWsMxscfPPusbplXizFIPUUtpX76phu8gluF
 9VK+hGTxo9TiegJqgGuptBliKPXntpFYU+SwPehO5vqC0ZNo5A3iaIoISA5KGrDe7JFD/x5F
X-Proofpoint-GUID: NEmFXaV9vNGyCPo5UPFZHrdKMFrmi62n
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bcaad cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vGl9qbW8TQSvOBFUlmcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: NEmFXaV9vNGyCPo5UPFZHrdKMFrmi62n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=793 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_184731_782506_B99E758B 
X-CRM114-Status: GOOD (  14.24  )
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


