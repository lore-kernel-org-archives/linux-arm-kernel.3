Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7744BCD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57sKeh8lL4FkccDNyKYVDaGV++c0dT2p9qWmYiR1PEs=; b=sW1MjNmjw8dR+kDao90L+Cn7mq
	DVFj/vYk9PX0qes7DfXxWsId9mMNrL2v0tARoSn9aY0tg5WBHh4pZVqI2GRV+5Z3DZhFj0hw9lyHJ
	65EpNkFUZMmB2gXafDi/uZ7Lj92sP9iQ2o3c8rek9jSha6G2ZZrzSQJhi7b3m8jNHQbWgUCJlChks
	V4POfie7tHSPgD9N/pP9VUejPj6/E0z2wGGSSa/rCh55+Ko5LCbyVTEAUVwJfZU1hvvI6EWlbPjWV
	dYi+pw/IxQ7fMXP6pYi7gBC21A9PfZAy0EjWQ43YRyz/VjpVwQXLK/dI3LC8bekIQVk17T0CsrP0A
	HaAdQpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ34-0000000Eukk-0SVG;
	Mon, 11 May 2026 22:24:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ32-0000000Eujc-0mzs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:24:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6Sco2202208
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	57sKeh8lL4FkccDNyKYVDaGV++c0dT2p9qWmYiR1PEs=; b=iFX0tL1JwxTdVnpl
	FH2njcSk6DdK2fIRndW8l+GZvPaNPKNCDf9bhXCT3aJp0V3s+BjTkzfYvoSudep8
	s7T37BLi+w1GpiVu1bsR6L0bglurLgO25nwUBj9iQuAWppwEdOTQ2G81NEkB1EUk
	3iWEHaACG/ixFmip/w2m5F760FO6s6KqGtulq37Sd/f0T8r2o0rnWNHKNM9K3RoZ
	aJPWFvIerAUp+xD4/ngdjgpOn5qYkw4K3qN5hJ4Zu8ykTQF741lwvFZtX6y96RoD
	CxMTlB92XG8ESXNUzpEV8lZP+n3yE60mMRzBhJZlH92yyZHmEryoIzdiLtF6OxLo
	wwAZKw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuygfa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8375e2df478so2429031b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 15:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538263; x=1779143063; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57sKeh8lL4FkccDNyKYVDaGV++c0dT2p9qWmYiR1PEs=;
        b=OLd+Fnf/dmpq5TdnFep1sr2HBthJQliFGcMpWIAFoXSrhYlnulqSNBs0zDOXtvp9HB
         de95gTUaMVgv9YTedZf+1zaLr3ZpuQKBz591yL70yrBry63tj9fPwdctavR4aOKPig1M
         6pCKobH13kbtRK6woAmXpKhpcAWEZuJx/Wtm2TSxda9G2IrV4srPyBJEDbQukKkjZAHm
         XML7aVw7hNAJ6Djs3z+Q7kYbBjdirrw7vQyztTHF0fFy078nSry/50M03JgJRuh9OUr1
         2GqDda7Z35qs0jh+1BxBplJQlpNEhLTurR74FVp55Df4tRiLE11zzbqY/XRHguz7ZSPE
         8vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538263; x=1779143063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=57sKeh8lL4FkccDNyKYVDaGV++c0dT2p9qWmYiR1PEs=;
        b=ArKOHiST7L3UqPW2EyXk2ImboRjYVMFsCoMam2xmeZhbYlrVwbSWSSZchCkxh3ZsNu
         /eWzVdlb6ijik+ow9bStCjmKcPBobvd7HtSCf0PUb1DYd5kWHB4cErsWu60/Ll0LoNWQ
         yDbKE5sEN4cjAFcYxtzq0iy9Vy7XIJ54X+NdFcCozW6jC+2tKPDJ8Au81F+Uy71taPr3
         ujyhVnutnk7CYHgl1mURUWiYGQXfyK0v2vS439voSM4esg9qyCOLtbNPJzpAgaWEbr12
         KuHrpkFYNuHxQAjOhoNP3cw8GsLjaM5CmoojxPFz3NaIyrXuEvqEwXUtOUjWb1KVjl+T
         Aj2A==
X-Forwarded-Encrypted: i=1; AFNElJ+gA7cL5XvvfB8nEi+pJMFHSIf8PBmLPKDJdctdUd/k/Hh0ahv0C5dSFgcDOkNGzJt0/CX7jBk0klGXn/OuJ6eW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6KTKMZizRxmj3uVWkLBjEMWhgWj+WtpycuY1rVjQj4nMT5sso
	4sxTiqMkdm4yGydejCSO/AXlVnxvWlThbr8nUjTlR+Z7CwZlQlma+UNbkNINvPGjASHlC38Y3Mv
	AvTe7yZy6wxyfg3Ry/qQILQOpm9KL9pk6gMLKYc0LXL84ZMhLkuEkkm/AaSn8K3OcskFr56R+ln
	CPUw==
X-Gm-Gg: Acq92OEb9VO/M+VaMDwS2WDhophxsALWPUlx0dpgG6VvPX9qdc9+NSagWEMKkp84bLu
	DPq3U+VGLdvLj8sgpbOMF/eNwzwyDWJFdJ/WX5JG3fVGD0tjhEb+TBbfzDUZyg4ZnFzyIVWwXMS
	7VDizcT1JQcYj0M0ycocwCuSUDr//7TWqsFGF96PspM2E8fp5I6Hhk0btfRmZg9FSmDz3uUv/SP
	mXZS+t/kqKgmVYoHg84swBFDRhCbbWQKGwSKJTbeAFbKuZ4OjfhguCDPFpNbOpadTUWHX8m8oYR
	Vk7MqtwhavUIWPV+1t8ixta9V+QE6GlPvwMqgW05R0dnTr87P5mZaps7/f+TV2aUWWx2OqUa+tn
	RfRy0nEim+SNV8lhNv1I3kevTMvnrx3C76B+XEpcn935I0Q==
X-Received: by 2002:a05:6a00:4b10:b0:837:80a:5ac7 with SMTP id d2e1a72fcca58-83eebf9e24dmr308820b3a.45.1778538262951;
        Mon, 11 May 2026 15:24:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b10:b0:837:80a:5ac7 with SMTP id d2e1a72fcca58-83eebf9e24dmr308788b3a.45.1778538262422;
        Mon, 11 May 2026 15:24:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:20 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=7515;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ag86/kr8s9/wNu8KURJAXOYQ6Bs1j+iLqYPusIeA6fI=;
 b=wM8Owlud/s2u1nqMO3HiUFxdka2NfMzsv82KKylH8Ys+RapuHT1nTFY+UvTkFBsMlWzoxSROh
 bY62uNfVaVvBZFPfMENypFO/HWOelmtCw6Rc+QImvshXpSSNFRR5WwK
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfXyrpRauQJjCSK
 IEQGh1P5A6k7To/S8lKo9rv/UhZ6G9EOPyjKM27fZf1UPxoA3w/RMSg6M8LY/we4s7lPsma/Cos
 P1g6wynNmpVroJkSOxZizLs6HAMuD28cdRBX51bYsHYTmB/wR346SDPqTCj0NZUhmS9Bps4v5Tp
 q+eG7xjiLPqfNJeW64tHeORBGk4Mqr6XuSg1sGxRHklWZ+8pmMnu/h8w5F4yx8LdSkpFsWs6vBw
 eR6RTbvuXS+H+o0/HOM6/1svHtQcZJtB7Kh4Th+NYpIFTPQXy1dzaE5UII2IvMuwsJ6UbiiwMhg
 68UaQJOq4hqbJWbBMENYt9r0Qh0X4IcOPIc5NwUeOm2bTa1XbB/HTKhCbgCOomN1gO4juHhaOQ1
 95zCH/fxSlV/MGmnXX0WX1PW+QJpBFf23GMgFwsnBEVk9rpd2CPqpx+Q8tZrwnXB8EeKR89+R/D
 qT12NwXY3etfi1KvMIw==
X-Proofpoint-GUID: nRk4nybkjTWwHcRkdTatKKFP1sYyioeb
X-Proofpoint-ORIG-GUID: nRk4nybkjTWwHcRkdTatKKFP1sYyioeb
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a025717 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qhQHLv6gl62QQ5NPC2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_152424_233217_923BBB34 
X-CRM114-Status: GOOD (  15.13  )
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

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
 1 file changed, 135 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index c57aea44218e..5089416ec32c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -26,6 +26,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "kaanapali-ipcc.h"
 
@@ -7045,13 +7046,15 @@ nsphmx-3-critical {
 		};
 
 		gpuss-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 0>;
 
 			trips {
-				gpuss-0-hot {
-					temperature = <120000>;
+				gpuss_0_alert0: gpuss-0-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-0-critical {
@@ -7060,16 +7063,25 @@ gpuss-0-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 1>;
 
 			trips {
-				gpuss-1-hot {
-					temperature = <120000>;
+				gpuss_1_alert0: gpuss-1-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-1-critical {
@@ -7078,16 +7090,25 @@ gpuss-1-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-2-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 2>;
 
 			trips {
-				gpuss-2-hot {
-					temperature = <120000>;
+				gpuss_2_alert0: gpuss-2-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-2-critical {
@@ -7096,16 +7117,25 @@ gpuss-2-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-3-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 3>;
 
 			trips {
-				gpuss-3-hot {
-					temperature = <120000>;
+				gpuss_3_alert0: gpuss-3-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-3-critical {
@@ -7114,16 +7144,25 @@ gpuss-3-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-4-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 4>;
 
 			trips {
-				gpuss-4-hot {
-					temperature = <120000>;
+				gpuss_4_alert0: gpuss-4-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-4-critical {
@@ -7132,16 +7171,25 @@ gpuss-4-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_4_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-5-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 5>;
 
 			trips {
-				gpuss-5-hot {
-					temperature = <120000>;
+				gpuss_5_alert0: gpuss-5-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-5-critical {
@@ -7150,16 +7198,25 @@ gpuss-5-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_5_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-6-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 6>;
 
 			trips {
-				gpuss-6-hot {
-					temperature = <120000>;
+				gpuss_6_alert0: gpuss-6-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-6-critical {
@@ -7168,16 +7225,25 @@ gpuss-6-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_6_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-7-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 7>;
 
 			trips {
-				gpuss-7-hot {
-					temperature = <120000>;
+				gpuss_7_alert0: gpuss-7-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-7-critical {
@@ -7186,16 +7252,25 @@ gpuss-7-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_7_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-8-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 8>;
 
 			trips {
-				gpuss-8-hot {
-					temperature = <120000>;
+				gpuss_8_alert0: gpuss-8-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-8-critical {
@@ -7204,16 +7279,25 @@ gpuss-8-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_8_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-9-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 9>;
 
 			trips {
-				gpuss-9-hot {
-					temperature = <120000>;
+				gpuss_9_alert0: gpuss-9-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss-9-critical {
@@ -7222,12 +7306,26 @@ gpuss-9-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_9_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-10-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens5 10>;
 
 			trips {
+				gpuss_10_alert0: gpuss-10-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
 				gpuss-10-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7240,6 +7338,13 @@ gpuss-10-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_10_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddr-thermal {

-- 
2.51.0


