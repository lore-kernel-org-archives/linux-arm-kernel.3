Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F43AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=foAa63J/b9MKnOgT2LeXgHAm8HGxgkFUQH2neAuo/u4=; b=UPRJ0z1ZhjsSnn
	VePq46xK41TXtHIx89xL/ddlmtjb+uVXe9V0ONgKRVlyy+Oj/sksNa21GiK592DD+hxGDu/IOBIr0
	FDWB9kh3dS0Lv03atOF8robCR1+5Yt+YGNEhwvPoGPKUAG2qmBIXZLi/z2J6NsQG/jboQ8obTph3Z
	qqxON/v7gf/aHxDrKxa4OgrWlPyhEV16tzg9bBSMgGnumcis/9Wy91Tg8bOh4dQ7KKG43BbFdXzr6
	vfTxvlB3OBuG484bVQBukuixGkLzcjmrUI9iL1yeElH0sCTpvsJYTFVEzFuZDrUBufE3zfiA2LInY
	iBcgE1f+Utm4m6rA2izQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWv5-000000060aT-09d2;
	Tue, 18 Mar 2025 13:23:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWtO-000000060J9-0bZ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:22:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAcTiP028635
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=foAa63J/b9MKnOgT2LeXgH
	Am8HGxgkFUQH2neAuo/u4=; b=Ds8mcdfAosnl9tQ6IHX9YmkghuV6u6DkEYYvvU
	EejzIPeBvOz+joqXb2eGUDvCXENu+9/u9aPJ9hOyoo1emIPzwc6t37REsk35WQfp
	iSiBsqC6sFv2pE9VnyXrd8trNvBzQFZKb3TYN2EgzH5ZHVRiqrTIR19NBqKUy3gP
	1bbJxg0vcdtr7AQM0/fRM7oLVbZYwPJYOTJH00I+WNG99qcmhfOa0ziqnD4out33
	0ItQnE6tNSqbmOK3AdrBGcjHIrkud3QrIdX2TSeRqkwNhpl5CaaTt/BeTepzQ5y0
	H/J1VeGSgVZy4eNrrSM0Z3Ofk+9v5jQgTC5kV1UKvdh1Cfng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtj1eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 13:22:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4769a1db721so155020501cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304120; x=1742908920;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foAa63J/b9MKnOgT2LeXgHAm8HGxgkFUQH2neAuo/u4=;
        b=hA3FkCLOPPa2odKKfi6wC0zV/i1QXclunlTISzLHQnVEdErRpuor07RhrqMbromnLW
         RgybdMXRNptLu4fp5meueAaptyXx0SwyYgrE7uHpoEqiMjExUYlZaj64Wr2JvG59FNOG
         2pf579cizKKMLWVnsKCrE9eG8B3TQ0JNiE/Npbu9NfqI/udZw9hI3K7Y6dhjJHb4YLh3
         FLDrY/Q3fwxiYcXiyNk44z0WmdIT1YTibxmb/bZBrC6BXbwxEh0GVlZvnGgKPrWY1jbF
         DjKziv6M4vbG3RWCtLKPLU2iZHAwpP9YNvg8fvRqf+Nd67376LfD9OjIy4rt0H/nGEj3
         0Nqg==
X-Forwarded-Encrypted: i=1; AJvYcCVKz6v8Lk474Rfvift73EalOcFYeQZjeUZdTeiorkku/y6cL69Pnp0Wy3hNTABLafjHUpD68wy0Y2l0ZAiwVH17@lists.infradead.org
X-Gm-Message-State: AOJu0YwIfI81NbMjUzqRIhVX7fHxVgSsjNSjXPMambklLIaQjALpOfNE
	JAIx34r3AnhpEbOMB7wzgb2fd4cvWQirJctAlMAqIrYSIwapp9aQaGElswxa/S5T6RTmHjhiOpl
	Uv+vJgp4PXYe2DkifbDHbROYvtMFMgtKIfY+sr0fR5QTEZA65iF4av9QWB/ERc2y3jyW9ey56Cg
	==
X-Gm-Gg: ASbGncuGfDLy1KxBZPceh5MJGy9bPpU9ksdaW2rMCwm3ZvSPLUM+KSlsKfHqQV4BDZl
	DLi3Nku3XVY9Sw2Yoh3VCvBSGZ9ZIYyhBHyNG+ct7kwqQ41j1goHf7c3w2Vo+6Vx0QF/S+g2VmV
	9kEGVNHzlRuKtlU2GrSwBoT2BAWdGlnz4avGJgMeGlUAVT2gWFWDR/xK6rdvVRuzGxpsWiaTtbY
	stR0F91tn++M5LuWC6wx5W4X74YYtTFzl8U62Dvth0EtuzG7FrxviDDwbsgZdAsmkneMC4bMMLl
	J3JYTP1Vu3Ha9Upow8CiQfpv/P1yTuTors5QvXDpC/ynDG+NbzvrBffQILBaTH+UAc65rWRYlOu
	MfG0nD0rlIDfWrYWFmgKYrXSsUuT9
X-Received: by 2002:ac8:5acd:0:b0:476:9d42:72b1 with SMTP id d75a77b69052e-476c802ba00mr258510611cf.0.1742304119940;
        Tue, 18 Mar 2025 06:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5xRrN4P7GgdcdFfWSEdn3/eaA62cu+TyWInw5rMY5tiGZiIeh/hVicVGEIvD/iZOks9Vx1w==
X-Received: by 2002:ac8:5acd:0:b0:476:9d42:72b1 with SMTP id d75a77b69052e-476c802ba00mr258510231cf.0.1742304119537;
        Tue, 18 Mar 2025 06:21:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:21:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/10] ARM: qcom: fix APQ8064 schema warnings
Date: Tue, 18 Mar 2025 15:21:53 +0200
Message-Id: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFz2WcC/22MwQ6CMBBEf4Xs2SWlWBFP/ofhUNtFmgjFrjQY0
 n+3cvYyyZvJvA2YgiOGS7FBoOjY+SmDPBRgBj09CJ3NDFJIJeqqwd6tONG6MB7RWtFTfTe6PTe
 QH3OgPO+2W5d5cPz24bPLY/Vr/3tihQJPShklSWrbNlfPXL4W/TR+HMsc0KWUvnH9RuKtAAAA
X-Change-ID: 20250317-fix-nexus-4-dd0fe3bca987
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pD9nQ3S0AV8e5xPXa4OL73t2TUcVpEgZCEjRkziAolI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN0ZHkxukViI6yox2GwpD5iZDFL5r9YvlOsq
 YZ4QZ48aRqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdAAKCRCLPIo+Aiko
 1RaECACc9n4EphtEZlVZI9PNl14eZvqvZzZclORPyLSrXQ7u2JHYSsj/xS5jAW7JTredLb7ufMS
 7q/yKgGwuICclKXffMIQ6eGkFeNNFyM5mcn+MYgX3Jas3MlqpeUPiBFhvn4aL/f+MTbxzPzYf7p
 s1MTedwj/CBTkeU2EkGukV6ltA6mWavhuQDimy7ceSnCw37UjXisYIFyfuwM4T/WuVYqP4y2cmW
 1PtUqR177WL0dwVv1J6FRjzu7fro16VCkoqFViceyOnyPvNou+vNR+9fIwfaNpSdJouy4I9b4+u
 GfRIJ8XUl6lZWtV2IG7rqyPMeEFogaPB8aNfZlasWx7z44W9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Q6PeQJt4BHvvFQPqpOOHr32lHm8sFR_J
X-Proofpoint-ORIG-GUID: Q6PeQJt4BHvvFQPqpOOHr32lHm8sFR_J
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d97379 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1L3cfQoGvoLiuUpdNDMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062202_208418_31EDC06E 
X-CRM114-Status: GOOD (  14.76  )
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

Rob's bot has reported [1] several warnings for Nexus 4 submisson,
however none of those warnings are specific to that device. Fix all
those warnings for all APQ8064 platforms by extending existing schemas,
adding missing schemas and making APQ8064 DT follow all the schema
files.

[1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Corrected Fixes tag for the clock-controller patch to point to the
  commit which introduced qcom,rpmcc schema for APQ8064 (Krzysztof)
- Switched to syscon.yaml (Krzysztof)
- Reordered ports in the static replicator node (Konrad)
- Fixed hwmutex node address (Konrad)
- Fixed clocks in arm,coresight-static-replicator.yaml (Rob)
- Documented clocks /clock-names in qcom,rpm node (Rob)
- Link to v1: https://lore.kernel.org/r/20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com

---
Dmitry Baryshkov (10):
      dt-bindings: soc: qcom,rpm: add missing clock-controller node
      dt-bindings: soc: qcom: qcom,rpm: add missing clock/-names properties
      dt-bindings: arm: arm,coresight-static-replicator: add optional clocks
      dt-bindings: mfd: syscon: add qcom,apq8064-sps-sic
      dt-bindings: mfd: syscon: add qcom,apq8064-mmss-sfpb
      ARM: dts: qcom: apq8064: add missing clocks to the timer node
      ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
      ARM: dts: qcom: apq8064: use new compatible for SFPB device
      ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
      ARM: dts: qcom: apq8064: move replicator out of soc node

 .../arm/arm,coresight-static-replicator.yaml       | 13 ++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  4 +
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     | 15 ++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 88 +++++++++++-----------
 4 files changed, 75 insertions(+), 45 deletions(-)
---
base-commit: 9f789dc174dc1a40754507a962a4e9e7c593e2d8
change-id: 20250317-fix-nexus-4-dd0fe3bca987

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


