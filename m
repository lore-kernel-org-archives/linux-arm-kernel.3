Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02795C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35TBaT2+83Cg64d1PZlPRf7THWnfYz9oGJDXX9UMi2U=; b=bL0pC4VUN/KF/MLC9c+qqOowls
	8ZCMrAxu29kNMDc4LPeRDyZYbA4Aq6Z237KGiui/qy1pHip4TEIA+CAsC9qOmUBp22eNZXu5bJJoo
	Os2nlTCs4Q3CpRSwuiSG1XziPphWZb6JF96R/HnPAnYCPJwmvEwiFbqObR0VScGHGT0Z98dLdyoUx
	qgsGWF5aVmIgiF9s/HHxqTncbbOh6MpePXGPOROEgWAGMi4aDUcC43c+UPica7SWg2DyaRrs5F6d4
	8z2fxUxKLPqAO1pOGIBgPTC01pE+kbYJWrkcyP7h/FP1mexekKP80sq680l4hBCAid0Hu8OEU0WwG
	fE8D6XLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuX3M-000000061rI-23Wg;
	Tue, 18 Mar 2025 13:32:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtX-000000060MO-1QlE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8plWS020489
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35TBaT2+83Cg64d1PZlPRf7THWnfYz9oGJDXX9UMi2U=; b=aFInx84sQ8RRn8rX
	+ebrdMyeQtsOLzwuTjX0ks8vlW3s+vxGHb90WdnsqD3N07FmkHk9PLBfdw/0IiEH
	XBi3E9HYqs+hNndU9Jb9LR8rRgY3Wb36SAyRhjOMa0zYt9k7sIfGwazM/541imZL
	+h3fGB83LUrRRNLUSuo7eHkoBjJqgbGSrr/JQOs63l9o4XLUDguPhxgbDcOKGsCQ
	ocZRBTABb4AdK1kjPCIqH4Pl1JUbXkjSjMf4MZD16nYWHD8YYlrcb98F5XETw0j2
	JF4JEcbywHZRhnE++nuXGk4/IK9VKDAKV1U66Eguzqp7AVQV0Ah8iF0z8WY57FD4
	aqim+Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4re2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fb5a7183so101571356d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304129; x=1742908929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35TBaT2+83Cg64d1PZlPRf7THWnfYz9oGJDXX9UMi2U=;
        b=eXsAnKFfSwHzSawh6rB7vKzQMjA3pcKJOYlAX+9SFUeIzzf/a+1LOninbF8ma5vZks
         OyS80b+BYEwec37ZPfPmP5ZX/jh+YbGHIHIbvI6mvJqFv3TLqnon59May1cCRzmABQTc
         qf4jqOuH+TC82oVUYfjuKDh01OYqtURw6xKWCXoWT+3CMQYWCMhTl2yM757WdKL3DQ3j
         tkT9Xo+6MQJGbf4xGyQGOX+CIrHLu2Q4QKauadE1SVPAZ9dhzEAT+jfzYBl5hCr74uoh
         MCtArFd9OPnO8IUTspXVlKdgLYoMy4o/AYAcgRtWR/hu3zwgw/KTh+00om3jI+ebu9Aw
         W80Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPa2qHPY9/OG2VJEyrX1KyPa236POt00TC4tGHNilONIlAboedcnGkmi/+j5jaXPJYwthYVRk3hhoGTOCqyLpG@lists.infradead.org
X-Gm-Message-State: AOJu0YyYXhAehte6T8AyB2eNU3/pSNHDvOOe2Je+5IML4DrYvxykwhPA
	IWVd0nfrdFkNPTAd+XwHaf/pRdz7JYD8WnanyS2ald7UERqWQfZRvFzikx60Y2R0VGKTXVi8i6A
	SMmueXOFiLlhDbGyHV/e1EryZfKX0/KUK40gu3qF04O75A5VtcxvrEY7N14HBi4LHR1g5iERxGA
	==
X-Gm-Gg: ASbGnctUwcm/DbD2bKiPha+y8JFvAo5ghketbDYxWAQrMGtbocDldqO8s3BVyaEZ0NF
	+3aHkcXOpk1MYyr2IltPVlnokq7dPVTC8dcH2h/4lj5lSkNcOcpbxY4dsk5NL1YC6F4yIiGqR2x
	QOK67vDhJWlkCUJyxj4BzoEniE8wwtPMfLQd/Upd60G51mlYPE4NrQT8iNdv5mJolfTiI6l0zUZ
	PzqAH2z9C6lKKU8EYSC74gMwyUIJcSzBVVzVylOv3+w/LRLVoXTaVFFkEIR/7qntEwYK+JHWc8j
	pw2Y3F8oAUyCYGo295rbd2VO7z09W8mae2CU52JilsVH0s3bgbjUBvtj+mXWuoYDAOevQkxZ0Am
	75wSE9tKrkN+0veiY0HUOmpm4Mw8a
X-Received: by 2002:a05:6214:e6d:b0:6e6:5e15:d94f with SMTP id 6a1803df08f44-6eaeaa8e068mr235422016d6.27.1742304129531;
        Tue, 18 Mar 2025 06:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEid2bgsa5C6EGyKhom1hcOzDqdCNsgC6lqLPAGPrirEYmAM0zizkPcxE56W3DH8hIcoDwtMQ==
X-Received: by 2002:a05:6214:e6d:b0:6e6:5e15:d94f with SMTP id 6a1803df08f44-6eaeaa8e068mr235421536d6.27.1742304129179;
        Tue, 18 Mar 2025 06:22:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:58 +0200
Subject: [PATCH v2 05/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-mmss-sfpb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tLjVCeidA4XxC4ytznLkRf3RhpABAtXsV1uxmWtljSw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN19yjeAE/FrJ460aVoGzoua8M7KKbdxkvWW
 fkAut7kGcGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1XkSCACU5gFpR9GRidct5OYxUCvwTTBl0VvkrjXfm5OyvOGome0NlRe7kBR4WWFfsG3BbUej+0u
 YfikvKIAqKMeHbRXXm9lBNvHZAV47bNHobS3PLJ2gOB9yBgYrLBUOFYNh4Mr8U/JK+3LaQMfSpk
 U83YvM/skgqyHhikgZ1kgXhwoiWiyN3ZeWviiP+MfTkU+JyUNQjkvR5HXmmI7TU2DqgYnCdj/QO
 qvrPliGG++ZGYITm7rxp/0k6V0PVtGXtonhIROkIM+LsYdZp2tpTqlZTfPd/t8oL5PjjQOTQW7/
 9cYvA32EgCddLLgZJ3FGfMNC+hxG3N1Mi/s+01T/BaKQ6Cqc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d97382 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: bwx3qSnnfMxWDmKP9S3_DcfXsFbCleDb
X-Proofpoint-GUID: bwx3qSnnfMxWDmKP9S3_DcfXsFbCleDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=957 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062211_506467_0070942C 
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

Add compat string for Qualcomm MultiMedia SubSystem System FPB.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0d2530bd05b8c114232926e3ba8b0fed99e276f9..60f153cb57d56b00813cf65070fc4636141c5b52 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -95,6 +95,7 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
@@ -196,6 +197,7 @@ properties:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos

-- 
2.39.5


