Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA55CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=; b=tsLpR4Xi9PScrTQ7Em/k9VYC7f
	lw6cnNHC2d/xGL7QgX00ytfTUfXF8iB6XbEyuKc6eIa+tNHebahNor15JunDFvIv0WU0gPQDPtqVh
	i08rhZbqLHaCg2OfDCOlcFhXZRjURgqMBb/oX4CGQSmNqPmi1MMxTmmRvJhgV5AiaA57rU3q/98VT
	dW240mFM+LafnuAMLxZR9h8DJz0C+g5SGUvJapjGnK6EWA12xUvgT9e475xOD31r+ZVHkHk5BNn0y
	kou+Wi9XtiRRKaauBwO4pAo98gsV2c49R46bVP6gQBpY01otmI8kuMB8yLdBDoZX96XulRuiT0miL
	PJkzJFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMsW-0000000ASKa-1l4u;
	Fri, 22 May 2026 10:13:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMsS-0000000ASIK-2KAn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:13:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8kkfY3673706
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=; b=kSTySAbjKJJkJTGo
	5cRLUYa1Jn6d9NM7ZIJtT5S3YFCHomikpvVpsTPUz9+/HlYqwFEe7beB20nFdwMY
	53KoN9+x389KZThvcsegYZqlyFAGjxtK/GGIhNkSCsDc/VgiDtOMSe8Dr5CSfk/y
	IKfIWbRUY0ULG0gUASKOdcOEfAySZthTmqoGPQt3z7MMARqCGZ+qe1SkWyTrIBlJ
	cRpgHNyUD2j+BbWnDCxURRNlEQfjpVmgKmZq8iLb5B7btIaDpzvAnAl6wjmnAmFd
	dWkmnmpMVlBuW3c5AAWb1XSOHIr2KCOzAdaL7nbSRuLnvwFI5m5c7dx7aouLcg4o
	L1uCuQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea4dc48q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:13:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so6300846a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444791; x=1780049591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=;
        b=RDDaSSbi1BRU5fvWvNAm6CGNGfEAN+Je+jlKEl9BYuAZh6SKc+Y9qXtDKfkfrTNqnE
         I0OPBoJbjUKYl3oVstt+TSiQJEUKrzdE7FLYfD1yDXWJT6IrmtxEljqyzAj7vcN9NDkM
         Hikzc0+1kIkG7TbQqzwwzLn0tTVGvWFcUbYROmJMglaNIUDA2kXZPt4YKr8ITtoPU5wr
         sMguhGsJaa6C2Hu67SNAu84nD+0/1KOVdsUaw4CVTcL5N6BdSiRAm32pBhk/Sj6d8vKq
         SOcGVV+yf6AtAaUCtT2sAC7fqCGSwOG+49Jy5PpsYT2DfzW23DTsH2TuJSTiF/7i2fRI
         Hz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444791; x=1780049591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=;
        b=emvwVnSQEf+IGMpTKWDKXaM6RWt8a7IWOf2cg2rs0t2y3HVGsjjppc3tCD4TJ0amLr
         EHsGWERqn1/cVkAvZqkeLws1m9an+HkiQrEjkUmgKid19vXmaeA8zwJRj5n0eA2H4mXl
         dO5TkMUn/RJMqmGx9MtEvi960n5/uUJAclDr527xQmbKvQzdXLbX7BhIV/eDZ50fCAzy
         lGfKziwPaCKdsTnlst5qD7SernDVjn/0oWrkYYt7grRxBo5dy8+tsnwVukGwo1lWueRP
         s/eQddza9JqfICBMMsIeUCchbWMYRAvBLS8wnGkDUcwWJQ+hbTl7i4HCROrkdl5yYfhJ
         LJMw==
X-Forwarded-Encrypted: i=1; AFNElJ/OuoqGaUrUn5WK2iPHTjYnoTH6gO71cmwM8o5Wbyn+KgrWa2efld6TnKfS9oRTILWpj41cWEGXsUpA63gv+e84@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ3qGUL+yseQmsOO5atPL1xYWPXcp8Cj2ZsnKuwA0hiqwF4160
	Yjw5HHrszXhn5B8C939YL4xMNNLzsfM66xbQHHChTAWPxzUCY5CQs4096UNrwRVkeFu5USW3qy+
	pY9XO71xK3lgcwzMex3Q62R4y//+9JDdxrl6DMlm9iqOSjg0votLPl8toevuhvRYTJUU5OM1Hiu
	bBhg==
X-Gm-Gg: Acq92OES6vqW68zk2EHnMtVsgjHVfGpVeOp1Or6hgG7gXs+TZJ0baJQriSmC8JhBKVI
	CfprvXE5JXHGMTDsKHu8Ccv4IAedElitUoao9/SclKkYrw9irO9cd2Xvr+C+2zx9DX+dfZ3jsEr
	xxKDlVTNyVFBf3a5qGvdPpy7R3F5fTbUGHfHwJ3fzk54XFT8mMYCgkVR2/KlYw9mlk1MEEE/CRx
	SpIFpDoyZDqllf2Fn7HP0r+49We3DfwG4ZI4mgHAjCXJDB9C7z2rIwspu48reCh2I6t5qDCFIM6
	Q7j5+gs+uYLI0jjuZlQ0OioDG4kG2oVWTliW+XJr7KjYzTkj/m5wWLrS2BAzKa0Lx7rENn/xQEy
	VHfVSqXIbrRMALVDTQi4kcLEskTLeGjBoOH/04RUcKDEO7g==
X-Received: by 2002:a17:90b:4ac4:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36a6741dd7dmr2845271a91.5.1779444791301;
        Fri, 22 May 2026 03:13:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac4:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36a6741dd7dmr2845229a91.5.1779444790742;
        Fri, 22 May 2026 03:13:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:13:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:42:01 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: glymur: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-glymur-gpu-dt-v5-5-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=9184;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xn0Sr46RzO9QMjWQmKHE7i+3Gf4gRPK3q5UWU+NK1fk=;
 b=H/Uy28Sbk+qNyTEhNSg47YjTr7XYAKdDGhs35tS2R9fsH/5iIt2eB3i7MBqvC99rPJraDxMYO
 Zrt0jXlu1LGCLePzYFBh/1VOdRRLSWVr6yV2sjV20iX//ECmglHMfcM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=VefH+lp9 c=1 sm=1 tr=0 ts=6a102c38 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1xJfQSZ986TJDthxghQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: KBkwk0rWei1qZMfr4HaDUNOt1ozse1OU
X-Proofpoint-ORIG-GUID: KBkwk0rWei1qZMfr4HaDUNOt1ozse1OU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfXwgAwXD8Ubt/y
 iUlklcsHHrlwwWcJFVPgmw77dE8uAeth4oIj6u3wpBfiyOdIwXu4T52Ok5c1d41krCYLZQRIIDT
 mKLvoFid6PPmOoNAZXvnCU/SQoUqrHoxTjTT6LiJRkeaeNx6HK+6aM0YrrFzssONAd/A1ZgVcCP
 5tpXveObkXGw1J74mCcDqZzOkr7xjWjGdIwwY0F+hu75k6Z3nsMg8UquON8yHOswKw1/dxpXxhB
 DRfzVzS4c/VBhN4dGYs4xx10PsFVti6717TJUg85UBtoPz/3oHBHPyjhQNpBwM/TzQDRaEN1NW6
 v44lrtBVT2SXCK/QEgrcgX8BkA1NdjrF5DgMadA0bklctyUEs8gFi6eaquRi7ltwfB/9dzL8r/v
 64uvWJpXceBgmQeHbwIciRtNFb6Tis4wcWepPs/t0nexKQ3+hrgeP0o8fnB5ooSadvZ+coUxqva
 +QjpvRWDBeK77CwyNTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031312_602844_1544D247 
X-CRM114-Status: GOOD (  14.30  )
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

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

The GPU does not throttle its speed automatically when it
reaches high temperatures. Set up GPU cooling by throttling
the GPU speed when it reaches 95°C.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 240 +++++++++++++++++++++++++++--------
 1 file changed, 184 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 01a2e32e503b..e109fb5b35a4 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "glymur-ipcc.h"
 
@@ -7149,13 +7150,22 @@ aoss-7-critical {
 		};
 
 		thermal_gpu_0_0: gpu-0-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 1>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu00_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu00_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-0-0-critical {
@@ -7164,16 +7174,26 @@ gpu-0-0-critical {
 					type = "critical";
 				};
 			};
+
 		};
 
 		thermal_gpu_0_1: gpu-0-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 2>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu01_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu01_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-0-1-critical {
@@ -7185,13 +7205,22 @@ gpu-0-1-critical {
 		};
 
 		thermal_gpu_0_2: gpu-0-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 3>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu02_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu02_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-0-2-critical {
@@ -7203,13 +7232,22 @@ gpu-0-2-critical {
 		};
 
 		thermal_gpu_1_0: gpu-1-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 4>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu10_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu10_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-1-0-critical {
@@ -7221,13 +7259,22 @@ gpu-1-0-critical {
 		};
 
 		thermal_gpu_1_1: gpu-1-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu11_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu11_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-1-1-critical {
@@ -7239,13 +7286,22 @@ gpu-1-1-critical {
 		};
 
 		thermal_gpu_1_2: gpu-1-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu12_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu12_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-1-2-critical {
@@ -7257,13 +7313,22 @@ gpu-1-2-critical {
 		};
 
 		thermal_gpu_2_0: gpu-2-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu20_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu20_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-2-0-critical {
@@ -7275,13 +7340,22 @@ gpu-2-0-critical {
 		};
 
 		thermal_gpu_2_1: gpu-2-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 8>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu21_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu21_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-2-1-critical {
@@ -7293,13 +7367,22 @@ gpu-2-1-critical {
 		};
 
 		thermal_gpu_2_2: gpu-2-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 9>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu22_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu22_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-2-2-critical {
@@ -7311,13 +7394,22 @@ gpu-2-2-critical {
 		};
 
 		thermal_gpu_3_0: gpu-3-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 10>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu30_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu30_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-3-0-critical {
@@ -7329,13 +7421,22 @@ gpu-3-0-critical {
 		};
 
 		thermal_gpu_3_1: gpu-3-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 11>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu31_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu31_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-3-1-critical {
@@ -7347,13 +7448,22 @@ gpu-3-1-critical {
 		};
 
 		thermal_gpu_3_2: gpu-3-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 12>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu32_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu32_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-3-2-critical {
@@ -7365,13 +7475,22 @@ gpu-3-2-critical {
 		};
 
 		thermal_gpuss_0: gpuss-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 13>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpuss0_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpuss-0-critical {
@@ -7383,13 +7502,22 @@ gpuss-0-critical {
 		};
 
 		thermal_gpuss_1: gpuss-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 14>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpuss1_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpuss-1-critical {

-- 
2.51.0


