Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061F7C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sp+ST8wLl/chjFA95pjbvu7RH5+AjrCnmVKgwrVuY90=; b=NOMjr/V4wYVUqLehU28zi4kTtX
	L6NA9MJXaiMPVrkvHeG49Ds0YNDd3HP+JxCC6MdB551rymozCBbpQJ1PBQ27Qyp7NT2Nsyy6SNNZL
	wwh2hQTT9qIWmDn/loPefEcitgFA9AeTSXf0zez0tyX0UR26QQD0NCDnea74xbmgQvFCR95b7BsJz
	UmyrKF82n24mQuZrwNSGplGf6N5tbo0a2HwMUkJLYCK/NZmA26PSOaj7FCZvFoSUVyvZ/Z3tE7W5j
	GzCi/XEfYtTgKvAgyiMe5rkdsA94EiK/d6zr1rR7ERFpJQ4HRToQaTk47KzCNBusZn2k6wxD4kf/B
	xlTqIB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHnM-000000095Bu-1Vls;
	Sun, 05 Jul 2026 08:01:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHnJ-000000095AQ-1HA6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:01:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6653GpOl573960
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sp+ST8wLl/chjFA95pjbvu7RH5+AjrCnmVKgwrVuY90=; b=Qx5yspbdlfUNL9ii
	fiFxRKEg9URPnF5RyoeNJjfADJQCSK3qyC5AfD6sEW2OE6/AoozW1EnPe5KkSxBq
	gKPJVcQw0bwKU24LhvZ+s9DJopAQI3recdlIKkAcBoi5fyS+V3JFCglRUiq+cuN8
	U7C6j+tdGmA28tmNlaOKCEbAv+8QH1ufWtpPj9VCrOGhNK+G+uXNMyUUzuEoxPml
	UCLHq+EuPap757k7hRNrEMa2aFQTZrgMUA4MU5oEmoXUGteUKnwplgCdL3mjmIJa
	n/itGay7c8Sjh1L4PLaGBmojl2oYXWy3Ks10LI0j/OepYOjWDwN+AKG0iwhPL2+u
	ncSDLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh2d2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:01:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso1564458a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238499; x=1783843299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sp+ST8wLl/chjFA95pjbvu7RH5+AjrCnmVKgwrVuY90=;
        b=d3f6nWJG6zR3Pyajn2HI22VQq+VSmCvO0awK+rOu7wXJV6jbZ+YnGjEZluUY8IStj3
         Rj1g0e2ExLO7LYHNGCVjt/QTaas5KHMfyRhjHRzv9Y87HqstDVH7znT+p5FpA/8Ecks7
         zsIH8La7chaIpIKfCRWOPhccCjPWE3xiCC3EN8MonajMo/UQYndDv8ZyhASBLaO2mde1
         rw0vFZf49sa4nNmroulCz941UjdViYJpVlB9yAiagHjxK58fs27n4E6AduyQCh8KRaVv
         AXfihwaAeh+qIFJm+1UjVP1A+1XNfIhiE80bGpE9Snc0pidVKJbACk6hbIU8VzEpWwvK
         GHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238499; x=1783843299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sp+ST8wLl/chjFA95pjbvu7RH5+AjrCnmVKgwrVuY90=;
        b=kR/xN1ic263njSe40jqbb0PhP/298EtrKscMfAwD1sf/WpMYADMKfoVNF9HpZrnsDW
         eqJJFBSAmUM0bL6g1qJ7KrHioPDd7JU9WV7Z8XNwY5aufFvtgKyc5QqUw5HrlErDE7+C
         sZOmFpr7nvnkvLVrKALr/zDnisYxdnSS9pj5IGTtDyZEgW4J/vISKJKSzjWCkLR9uTRK
         D19jPo3qGStTAsGgONlUcPsAF15QoaIjhPPvKnQ+/FcxzosgOMQ3ovANhRf8tyJ/a2mC
         TM+qKHirquHLOLV+v7iZN8AJWkRc+nXIuGF5vesMkVSZP8lpfnVn1uL/jtG7pRX2wZgf
         nYTw==
X-Forwarded-Encrypted: i=1; AHgh+RoU5qK3clpziqvp8Oub9nY8tRQnuw9C8gaUf89m2BbVTJMjcpvHVnqJjVw1YgCkrhWi++cIik0gUVFHFHYPy3ab@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8aQF4XswNSzeQlJvLSGHNzwB34e3iwcC4bmLa4wwskI4sFluu
	IkRS4jiNzEJUeJ1zktLFR5Y6U7mmVbLNqHDTwGm82Mch4YtM/nPnFiYvSihhjv0KRAU+zfVPDuD
	QB3r2Jb59PtiS1NS8F4EyEJA6qr3vvqrWeGuZBr2DBLW1sbSuIj3ccuTp9/kbAF82Fq1NW3Ie9q
	ClZw==
X-Gm-Gg: AfdE7cl8PLeB+HvvfgyMqPV1v/V1YMATzijjExAhe6Xw4WdBKaVjgLTcu8whNGYNeGu
	Nunb3LtZhNMm/KYEakd9FYa6/Mqy74cGeugZg+BwNHHUN3yv1if98+fdSs9XBK14gbcgCGhXh07
	gl6YQMsdxRDU+KNUZXVO3otyjP6jTKwyFbOXSvHw2nVAWznCJuDsyB/hIWUWyMiMqd58b0mcsBY
	c8ZsTrctBjZjHH9ZD9e/pxtqHSE+dSndbzMf73PPy3C/iNKU0VNOwCUjwrujATfewWNDdphBHJd
	UzSoIRHoBOMcB9yxkm8aelNspcPCe6g7JfaheXa6ofRHBhY7zy3gUONcWvFvjVEvgL78BX8qTkY
	WHi7hjQvlA3pZ81sM28D0QUEn2ADQf9rbk/k=
X-Received: by 2002:a17:90b:51:b0:37e:1ff4:44c0 with SMTP id 98e67ed59e1d1-38280b9bcfcmr5425923a91.12.1783238498592;
        Sun, 05 Jul 2026 01:01:38 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:37e:1ff4:44c0 with SMTP id 98e67ed59e1d1-38280b9bcfcmr5425826a91.12.1783238497430;
        Sun, 05 Jul 2026 01:01:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:10 +0530
Subject: [PATCH v2 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260705-kaana-gpu-dt-v2-6-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=7387;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=833JfZNihmD8RpBWS3GutFMgkG/8R8DJendD6ZgxV4k=;
 b=46vkw/SaKx8RPOpF2uonJXYMzaFLsyvH53JVEeoX2mQ6/NxyaRlwNAFQLaDS88MJT6fF1y6L6
 oV9ZsxiWnmZDhI1TDNu9FpObgoDGJ+U3IOcGvSq28OkNynzmTyXBVp5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4a0f64 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FGf9z4Ax-beoPfFoyYcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX3kVeQuKbAABv
 oxx36q1nBULDhRWbYNC5eSgWU40zoBu1ScpLEXrOW6IoN33eNW+bI8cgnDKFru6wKIrdo9U0sTC
 CX6i++k+tHX1HNZJz2p/CMJ1ymePbDucSCjG+TdXiQNAINmRZffd4fvwm1f3WWRTxmSQxDfh/dK
 Cu5NiS7b2X1Z4SJhOQ2OqGHVvLSRxxnsgERtjwSlAJmxzytsU21NUZNT+Cd4L21l0ifHfOSwhRZ
 28+UWXDBZtHaFb/CgCI7FV5kbM9b9qQCFhshqw5yQc4qw71bo7YvK7XbDaH/qAtuej7USOPVNQw
 lP0ul2DpoZI4KrWf/2KPoJWPQIIDNSlhbQGSXYwaT8b8sYFOuKpbsMIi9RHHnSCmFWORER4WSu8
 ckwAtMMw1wcSZwkWS/J0o985f+LyJE7OinZAn0zFJTSQXcR6VTIAthTVx3En8SMav6L7gO8SysH
 eOxzfQEAuTs7MMqMDqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXxw639IRtd/F0
 MjUzGQXKrFrKxrerkDQZG3r3NeLBZ3odLrLCslGh11KWMUwmvmDyoaWDqSne7YXwZ+8/BvV0lBd
 xYcByMBokVgKtTwdWl/yTcP8QSwMWg0=
X-Proofpoint-ORIG-GUID: cci5pEKKjH3O5_p56sjww-Y39MqbnEqt
X-Proofpoint-GUID: cci5pEKKjH3O5_p56sjww-Y39MqbnEqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010141_466792_2F2FEA21 
X-CRM114-Status: GOOD (  14.82  )
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

Unlike the CPU, the GPU does not throttle its speed automatically when
it reaches high temperatures. Set up GPU cooling by throttling the GPU
speed when reaching 105°C.

Introduce a passive polling delay to ensure more than one "passive"
thermal point is considered when throttling the GPU thermal zones.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 166 ++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 009f0ae1ee16..b8acd9665575 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -26,6 +26,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "kaanapali-ipcc.h"
 
@@ -7059,9 +7060,17 @@ nsphmx-3-critical {
 		};
 
 		gpuss-0-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 0>;
 
 			trips {
+				gpuss_0_alert0: gpuss-0-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-0-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7074,12 +7083,27 @@ gpuss-0-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 1>;
 
 			trips {
+				gpuss_1_alert0: gpuss-1-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-1-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7092,12 +7116,27 @@ gpuss-1-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 2>;
 
 			trips {
+				gpuss_2_alert0: gpuss-2-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-2-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7110,12 +7149,27 @@ gpuss-2-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 3>;
 
 			trips {
+				gpuss_3_alert0: gpuss-3-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-3-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7128,12 +7182,27 @@ gpuss-3-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 4>;
 
 			trips {
+				gpuss_4_alert0: gpuss-4-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-4-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7146,12 +7215,27 @@ gpuss-4-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 5>;
 
 			trips {
+				gpuss_5_alert0: gpuss-5-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-5-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7164,12 +7248,27 @@ gpuss-5-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 6>;
 
 			trips {
+				gpuss_6_alert0: gpuss-6-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-6-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7182,12 +7281,27 @@ gpuss-6-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 7>;
 
 			trips {
+				gpuss_7_alert0: gpuss-7-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-7-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7200,12 +7314,27 @@ gpuss-7-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 8>;
 
 			trips {
+				gpuss_8_alert0: gpuss-8-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-8-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7218,12 +7347,27 @@ gpuss-8-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 9>;
 
 			trips {
+				gpuss_9_alert0: gpuss-9-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-9-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7236,12 +7380,27 @@ gpuss-9-critical {
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
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 10>;
 
 			trips {
+				gpuss_10_alert0: gpuss-10-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-10-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7254,6 +7413,13 @@ gpuss-10-critical {
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
2.54.0


