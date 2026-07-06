Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=; b=g/IQ1ukAjCDImt4G/rRbHd/UUj
	YTxgr3LzWuHNza+W2hqkf3C23s5+aeiRp2VflFQ7KKWVtn06Q4hG+ID8TF/dwJ814+URy9+s/j7P8
	0t9d1SWJq7wJJFsrLeVXFHH45J19Y0Zz/mPI+wNCobx3lrBugsn6YqdoVUO81imkzZ94DD6IITL5z
	0xTFz0pqWl2zJKIoLMaItsz9T5e6wku45jIzGh39RhVvLJxXaUfULJ+a7/RLuI/Xg+C+Nf2PJImGq
	3Z/v6UMJvAojZRWzxPjq9ObRnaK0vXSHzffRrpi+VY0ICrIizNYElltV+p2YHLu7PwiS4M0XqxoZN
	n7RSETVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr4D-0000000Df9B-3cJ8;
	Mon, 06 Jul 2026 21:41:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr4B-0000000Df6Q-05aZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:41:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEI3G1639872
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=; b=XpDozFu2LWxD0NRF
	QZAwx0qOAUTH6lndolSEVkfRt/n595rpztqrLrOuI6nsRg9//N6De1vFyrM1T4LO
	b7WRRmMzebi0hZmRsyHdfoMHK7W56FgClPjLXDyPlbP9V+LgptESY5iJgxJs3XeM
	smV2LG49t4ZteKBBOiNOrOuI/7Nl93I7ME/lJ7kk7rPdbdUow0DbkLUAY1O5ATxy
	wasw3XWaXBKMA3YBuvzd1B0EfKPhp6ptaBAagivk9zdlk4IvszFVLB4Kmu6RWybd
	Lx4VnLep/XuW+/3PYc3y1MPFtjD0vkg+sU6XzQE/eLa1kaM617t8pQF6joPn71Hn
	Jfx3bQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2yfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:41:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8895156101so5304951a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374085; x=1783978885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=;
        b=Qy/Tzbq0VXapOm7SO/8UJBr62x53gvK3pgkrMLmVomtNkm0ZsfHiU50BselIp7WReX
         ErcTv/d0rE2FPJmorkTw/AlArk2jVZW9zfhl/q7fxAXf6obodM4tlZJ0xsFslKVw8Ir2
         7YFlmvAZfqyssQXvK/d6eLtFY9ZV8eVpiN1fvZyRGoD2xXRtuWahVO3XJosLqQFg/ys9
         Sq4xe6Y7xj1I+uOgpOoSC4ZTZZhl1Hf7s/ghgeSIUZZA+JGMQddAB97leFf6mBG62QLB
         VM36p2sLYyjYfbbkQbze7yK6KXgeTY9fcRCELqkMe0FUskYWXFnB6YZWhpBvHmayVAd+
         45yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374085; x=1783978885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=;
        b=f13C9DOmkwpnnoXaWTkCvdUxls9jaeWkyKYif5u3i+n8QBJB2gzgb4ZDfeCFQ7F17V
         UdcT0/ibX7mO+WjfEgNuBwNZxRPOXEc/uwhgJ2b9rvhKnJ0AvPxTK7lFbdQZDlHQL9yP
         oHEj9ZyW9tQ919jXKNPwrEyAi0NADPNalI5PLASznH/IVzKNrD3xrU3mi9YpG5NXj6m3
         F1YBOb2RFaT907E53zxeHX3ZThUDsAr4W+4wL8BHrCvOGGXjdj1ZjYhOztJO5u3fYiBI
         W599cRq10uEkMTqtFVCw9MRivoqsZi6n2eaRyhJhT2b7Hcve9ztdPKJ8aihQfw76Ree5
         Gotg==
X-Forwarded-Encrypted: i=1; AHgh+RoR1AwFTSTrJuEvl11JNEhR8rE2/pVpeWPU65PBkPuKlHmu4YyEY6ktYgh0bFrNtb9xR0o+/InAV4yus92R0Nnz@lists.infradead.org
X-Gm-Message-State: AOJu0YwkBNFRErBvksAnoDyA3D9hYXnjqkkuJItVelSygOwKaazxJCWg
	Fd4vP7y+ROfQaOmE2hiiMo7O8AFWYJBabFG0AxSUm4BZJaJMflnnc4vE1hA/o96x/eOU42kqgMJ
	PhS/SV5HIeUFTnOy73wLOaa3GjwCvkQHpuvRiOzT7R6qokTtiIjeVSNqd18xBZ8iCw3x5Ig0gyR
	pnhw==
X-Gm-Gg: AfdE7cl+xBp5w272bhDSVpMw1dEt/Apz9v0hXOtYJKWWDsvrGIkU7KEFFt7Oemc3JRL
	PgM/Cz6dYdQVmDWWN+3aaPwmv6SN6GWqpDnLa1l9owV1q4sVskBosixprUU3OAYexAXNdiv1Yc+
	7YLsSs0y/SO/ZwwWT8QF83cdBZmPTRbHpoaCqfM2ZIlpynI1MtfaiyBbYPYN4V8bNww37lIdABS
	PBuwzTdyUyMgyqrNaDwD0hcxN9rI7FhFk6RSw+NxzEum6ZzCjgSYvJ3cHal/LKfCoznpPNu0I+r
	Gbgq/sIC1vPup8wE4ohBj2gh/tYayEa2J35nVXNEMlmULRZXeHoZXbW/HdY2g2lfKZ/AC0zG1hK
	55TqwDm0eQOsTATPm0OQCpK67IY0CS0I+Hj4=
X-Received: by 2002:a05:6a21:3d84:b0:3bf:aff8:f572 with SMTP id adf61e73a8af0-3c08ee92e86mr2157311637.32.1783374084972;
        Mon, 06 Jul 2026 14:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:3d84:b0:3bf:aff8:f572 with SMTP id adf61e73a8af0-3c08ee92e86mr2157288637.32.1783374084451;
        Mon, 06 Jul 2026 14:41:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:23 +0530
Subject: [PATCH v3 5/7] arm64: dts: qcom: kaanapali: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-kaana-gpu-dt-v3-5-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=7506;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Paj+Uxrzy46nVOxI8FJpxB45y1EA6N7DR+yUmwEsd28=;
 b=/9SEus1VLj49Qfme1/2sFJTqMKJoEjB2c+6dOgkvo1lNSZmEe+k4v216hrME+T4zoLSMe+JWm
 XpEGGms5RCgCKOFHbgu5qiERzejMXQJWm4xUY047q7Ntp9Fzd/QWmBR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX8HCEff9Bvu/A
 3JiPiX6WPhS3hI/0XOMPSjMEVg8/B5NkH7hlJogmddasnxE8mRSuhMGo+jg3OyxQkMyKXhdgue3
 n4jvAOzqU43CddGWj9xwU+KAVzQKmTFEAMgv6YOvyVxFF9Spo957ay05TH+a3MOahMwdshTjmQx
 A9268tiPyelcDusk1yoolT6hQz6f2y6HNh28l9IUPnsK5I5nkZM2jsGJodrzmP2gLK7vtgwAMxM
 dHT/kdxwX1qKa6ZiR1WVAA80l7EBvTM5r20pt1a8z4MBpdS0+scMH3qPElr/BU64+UmIWy1poBa
 sLx747VFVni6fyNE3GYCKbhxpaeaB/RRtkEnnveszzKGV7Yv/X7Nn/xfswByzrPvo/r5KDknSxX
 cUSzgM3LqV4VHH85ym1cPRM2V4YnAC/Fot/Gs5Cc+ndITgoSJZXrY18qAPAgwjAGBlSUXHfKM9/
 JbIvvczvaGtKK+9IdCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX6e6sIjIYNhim
 SzeqrfQ8yTK0EpP6LWJqYEGvmtQA5U7b2KSwDtHVbUQzMpiIB1BrsaHAd7qqyYvWZ2pzjmoR/8p
 rpwrSS6RYsUoJkxAy170+byWKLZxdYs=
X-Proofpoint-GUID: iOpCeNEFzoarDpxEH_5uo6BKFn8-3rqp
X-Proofpoint-ORIG-GUID: iOpCeNEFzoarDpxEH_5uo6BKFn8-3rqp
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c2106 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FGf9z4Ax-beoPfFoyYcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144127_183610_245EF324 
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

Unlike the CPU, the GPU does not throttle its speed automatically when
it reaches high temperatures. Set up GPU cooling by throttling the GPU
speed when reaching 105°C.

Introduce a passive polling delay to ensure more than one "passive"
thermal point is considered when throttling the GPU thermal zones.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 166 ++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index cce2e0a3f971..79bf32a9df83 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -26,6 +26,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "kaanapali-ipcc.h"
 
@@ -7056,9 +7057,17 @@ nsphmx-3-critical {
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
@@ -7071,12 +7080,27 @@ gpuss-0-critical {
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
@@ -7089,12 +7113,27 @@ gpuss-1-critical {
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
@@ -7107,12 +7146,27 @@ gpuss-2-critical {
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
@@ -7125,12 +7179,27 @@ gpuss-3-critical {
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
@@ -7143,12 +7212,27 @@ gpuss-4-critical {
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
@@ -7161,12 +7245,27 @@ gpuss-5-critical {
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
@@ -7179,12 +7278,27 @@ gpuss-6-critical {
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
@@ -7197,12 +7311,27 @@ gpuss-7-critical {
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
@@ -7215,12 +7344,27 @@ gpuss-8-critical {
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
@@ -7233,12 +7377,27 @@ gpuss-9-critical {
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
@@ -7251,6 +7410,13 @@ gpuss-10-critical {
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


