Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2C8C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=; b=A+szZGWAPgFGo18KM7y2cyl5CT
	/JHSz7kYNWXH0cUULT3QCk8j6ChyEZWahKLP/tHP2pNdueDW/jUfGfL+Dil8Thhbk8AVcC0BWlBva
	pl5N4L9po7Yj3e973Xv2/9lBIaE4U9gYo1HAI1poZX6mC9g+c2ytDTdS2a2SRgtQjhdv6JghOYWls
	uh7HA07mLsOzMH+opsRwqWiA+vrl8L5Iq++SWmboY1A0vGNiASlU58PKoRIiYkcb7KdEN4EdyPYwV
	Hy9Cs/LEk2M14CBsl1KHEedNa72+2F86DKyjXlzURubgpyfyp7qPGLP03JdaLG92XZWMZPFx4CUFb
	BL7zUQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkcS-00000007sHR-3bYs;
	Fri, 03 Jul 2026 20:36:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkcO-00000007sEF-0DMA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:36:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPRY2890134
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=; b=SZxb6vtTWsuUX97G
	SzcIb6CGjrgSesGPlc/VNJiwcsqrxlLNsVGeFauhYH4fgRIVWmV25pfpcYn284Tv
	L+NcnawufYpSOTZOWtrx2/CfO1xWv9FPBNaN2FHzkDg7NZoqqzikRV261dd8c4Kb
	IG5lJokMeN8qBCKeXLXTEO8PnABy7osOcXKlQoKbyhwHU80MqpcpbjYogTf8lAM+
	XAerE8rByHdKnfMafJ0YvK/gwSzl98V1D0fvYZFpGL4OqGlh9nTIXstlBMJNqZOe
	IsyZMKeq3MLfXDSwwU4zKpAdMXLFqThg/rnCkZd+nnUpROlaDI2SOygyVXKoQo9I
	l/CR+g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j030py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:36:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso1421525a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110971; x=1783715771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=;
        b=Uy4MWMOJOQe8GK7Ks/kRiEqt/ksRjY2gFlloWp6z6UjYVCrZ0zWqkcW45Syuy2Iofm
         8U6fquvKhxpd8okhq1J3N1wov3PMHod9mFNPRh4gH3Je5c6Pg4HlLVplUZIf2jQoPY9a
         PH31vn0cIinskvjOAVmA4qFnGfDtOIKYwaTP4TjNO+U763/pK7AC5iXaUa5PgrTZ/XgS
         U3TF8NvsHla0EJ53YiqO+g2DZWnNbBy7LK2gWdCAQeIdsbLtYtgvWmmoJj07N8fNVVME
         JV5f5VxkD3hxCA+YNbDr4cO/GgDd6+t+/7OSQLr9HTnej05Q0sHpwt9CNllAy7sS3Nlq
         6Ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110971; x=1783715771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=taQ9EvWyaan7heG3WK46TYaRVPzXBOWXtP1BA9vKA5Y=;
        b=SwdemcUMx87hFsOX1htOnUXs9FY6kKxl81+KvSVi1YznfSv0pPNoXtNAqKCcaHaxrj
         HR1T+8qFbXlBuqcY841Bmht1EO58VK2VaUHLoCdTTkLEWlYlJqFgUthkex5JbpaMcsEm
         R+IPRs4dEvHH+TRKz7cPmjGr9dEjBS5riGuchiuge/4B+g7wh00Ww96iGff6u/zp59OG
         mrvAUenZc+v5zkj9EA4roh2SZoHDD4pOGD9XNJhenoW+t7y3GZtNaxqI6faVbBTXHcIT
         TJJpVQUH0cbuCV2JmgFnN7HSkpY7LkZJrojuSM+S6rczws7xWE9AYjCtzlmI4KBp6Sgc
         B+sA==
X-Forwarded-Encrypted: i=1; AFNElJ/NoXXFDvTW+SGualYLrzgF4WyQeACYiZiAVP+gdToSBpufN4JGiv54ZkbAvO5hsBxn7sjRWeMQhzztl+PTaW00@lists.infradead.org
X-Gm-Message-State: AOJu0YxzAmpAj6/vUUlvEcWXxfIzoz18OC2K7oktnsd8tXuTpj9mNaNE
	v7ENhcud8KizSJn42zGZo6LavYswjzoic/UXsUyds5auegqAFmWWSjyclx9okyjPezLJbvRq82N
	QEwU/m0E5AGcgPVYFXzKRI2gBOVJVsX2iYshThlZmvjiwvx3oQITGoRHU1K2rKoMsfUZktgh/vy
	TGMg==
X-Gm-Gg: AfdE7cmlHPjMkO9QuD0wRWOiNWbr09zb8CbVgAE1miUi1rwyrehn9SioDG2oPTPMCFM
	h9TJYq+pWWHXHOZzLDqitX3TiGawnsVlzKDCOniPVdxM58YfX1YtjwfvHOrl1WI7ldbf0be8/uB
	ldR5030L0gkKdOYRT/G5PFIjlb/etj25Am1ltI7GTARnSvn71wi3qOWcjQQeEUNrKjE5E2x1coU
	cpzIFkXZR1JJ65mQJGPu2klhRRQ5TIX5N13p5rFEqX11+vfQleCjjgNfzgQ0x39k21wpi/UeJhr
	gRLkOx8/IkFECyXezmBF+IU8H9ZYBHxeY7E7KqDLb6iMG1tBPbslI91FZsbObvvN1fDTls+TUfc
	XbSNbno8jKC87tHzUQYAAuj1D9TCA2qKETDA=
X-Received: by 2002:a05:6a20:2447:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c03e4a33e7mr806127637.32.1783110970895;
        Fri, 03 Jul 2026 13:36:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:2447:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c03e4a33e7mr806080637.32.1783110970442;
        Fri, 03 Jul 2026 13:36:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:32 +0530
Subject: [PATCH v4 6/9] arm64: dts: qcom: shikra: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260704-shikra-gpu-v4-6-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1335;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=74nTS/9j7but5S78vS03fz5EaK8dfgZpR5pvQr3ISuw=;
 b=fhhF8bApESeoCdnsnhF6TzHQXTVfkzqJcFK9FQLBZgaMco8/KlnHfQggBrdsaT5VC2tQRhWNy
 UjnSFkiDIsEAWy1Jg6evvcA5ibpUHPzGK0ZoBVjfcDENiYdb8fIeL9R
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: YYLZdHtaxQFJLGTf2C1VW7p04Ko3RXon
X-Proofpoint-ORIG-GUID: YYLZdHtaxQFJLGTf2C1VW7p04Ko3RXon
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX/wlf5aRRNKaG
 IAeZ1aV2VU94W84upUIrrbEbYDnJOOLuJKgaRPzi3/QNGbzsia7ZsP2k7MD0g82mMwcWv/zIQHL
 5zMTrNBI+OmJi7w4uQGFs7bY2BJtD6o=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a481d3b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX5qeabfDJJ6Wm
 EQ4hrJSKP6550Wt0esSSyuMORhu9FYF1I0zHMKMSU9gV/n83AF6yriLPeXTnbwv6f7BPDFFIRjG
 h6LSmqVAgA92b2kJIgoIdkU8pJaLiuDZQC9wNY7m1htwcIXwREgQBMhTweOR6pM//hNdF39ovS0
 2R8SoBwBu7Di58oOmWV+4UaqIQ6eBiDRISO0havuYJMNuLrmKCf8o10QMNzgWDkyYpvZDEYt6Xi
 lA5XL2HtIPr7Bpx4+MDYxuTqLrp/tZGhWgbTmd+sBXOWH86rRUPEbCy95kbIsl7WClq4ZW9W7kM
 BEPbnDgQfH86zHP6IbatRsjG0IQ80ralwUOt+HG/Ck1s5cRJXKZv9Elkj2sttY6NTrZnCTVQw0Q
 RQf1Wmy8M/6anAW2o4KhrfWH3auLj694LcttjtAa6Zg2QQQR291GKncRCXRHlQ1Ck0c19Y2KOxS
 wSERSPx6/F0HIQfoB9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133612_109488_F4E5E13E 
X-CRM114-Status: GOOD (  13.99  )
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

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 115°C.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 34261221664b..eeeaa369d3a7 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2510,6 +2510,7 @@ cpuss0-critical {
 		};
 
 		gpuss-thermal {
+			polling-delay-passive = <10>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2519,12 +2520,25 @@ trip-point0 {
 					type = "hot";
 				};
 
-				gpuss-critical {
+				gpuss_alert0: gpuss-alert0 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpuss-critical {
+					temperature = <120000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-thermal {

-- 
2.54.0


