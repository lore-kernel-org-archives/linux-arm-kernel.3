Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7117C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qa7nM/+jKtg1HCqC+sdDdPuWIJ6eeiZoNwQFGtncwDU=; b=Rpqy6RYa7xzMrctSl9VnGuRgY1
	jzbJOebPnfpnvre3aMIon7wRzcu3cGFdCqeYaxS3uSF7mZsYHlaVY4KBb+Ic/HuVYF7dpp3P0Mbv1
	ppL1XuJkF1rCdPE72r7pGsP8JLwg6Pd6Tqr3XZCAqwVbZnRhUXFq6fZC9RY1NLevhtSKabIA6NMsG
	e3l2uNedqmX99LdO63r375s8cwhYepBnL59wi2tePwG7rBaXPIddyYgQugIskqDmly0NgZD4YM/OY
	JICH0qOKiP8suS9oADBlKSVTXiU+M3vhJwPC2Wo2KHyhTLO0h7ILxlIWrDWfQSb/uUetsDa+35hp1
	FaEJcBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVp-0000000DbLL-1CFD;
	Mon, 06 Jul 2026 21:05:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVm-0000000DbK7-3rjt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:05:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEN8Q1429170
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qa7nM/+jKtg1HCqC+sdDdPuWIJ6eeiZoNwQFGtncwDU=; b=J4DbrB+jhOv5gxN9
	x5IJA/SUxXqaEzWIz+uaTGf9ENjmxrOqUsWX5e8hgxA8bI43ilfHl6PNDT0DG0vb
	WCzY6/oaAcbo1o2Wvhrk4DC/yMZwplNKpkhSHshUGp/lACDR51i2Q0X7Bdocpt2D
	NCco6LOMC78ojg3oIgwq7h5fMW7mprv12lwMWVliMGgduqbgfDtPwo3WRBXkAWZE
	BI77d7v2gE1knBq6320z2tUpFnbDdGEpQe9F7yhe++5G/zc/cBgpxR+JptWFiMkL
	UsGKziW43XCuCrV/T0d0QxLSyA8ngBux9b0bjlIV4Z8fHPm59XSMM4OEFWwpGWnJ
	3zJ6ZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxuhed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:05:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cac01e89e3so3744345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371954; x=1783976754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qa7nM/+jKtg1HCqC+sdDdPuWIJ6eeiZoNwQFGtncwDU=;
        b=ekXIDBYbA+aMzcdN8B5UsBQKHLUVmPRGh9ZpkczptRR8i4urqbVv3nZ1r22oCIVs//
         zJDtUiIJX92opnoM9zLhfG6S6wRvxFdSGdT0yutrqZYhiGgoWYbnNn+KTT9g/P84C/tp
         S0FJcPpOV+ojC7Wgd7swIq6ULYGaFamM01lG++4IOj6gCvLbtr2tjMMXKPNDwURfXgNR
         bwPcMfcvXp6whpFKHJO4//Q+FfifYS7En+OOCmvzP/0SWJ01p8mXya5Ourg09ApUkadD
         nMPZ0z3wY9jZMIZgvuf21YwkzD8J36ZgHppaLHNNjNypCyDaQ9zVEcYu2faUq66bCXyj
         9AQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371954; x=1783976754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qa7nM/+jKtg1HCqC+sdDdPuWIJ6eeiZoNwQFGtncwDU=;
        b=jwQycwQr8/MRlsHuCSzy5ltSM+Zy9lHcR9gTe0UWMYTpcVqWy/rF5s13Xqk7BiCaDj
         Pn7UloGN6+zTn4SfXJkDtqoYfO/IpDjOcxC2Ns4XjODgj/mG1BwVXVImqtgkdr5MsJy4
         jxxhH2lO3Tav7em7g3133O15koG5yo7ZSdpnIK+bR+ppy8MUZDAZIyDevSoehfMmkOzV
         eHh7xnrNdw1H9KW0d4zDOddKPHQueR1JoulWAxpeSBSum/4Xocx1zQMrk+iuHSjT1iWy
         I/HwoHHZC3XpkEiDw/3YVkrISTb7TSsLTCclDni7EKnky2f5uyIccItv4mtxoDe/5r1E
         g56Q==
X-Forwarded-Encrypted: i=1; AHgh+RoII6pkAFnsJaFx+GP5tGRofkEK6cjqckrIP7kew2TjNWI53Qi7Zi5aF2Lc2PRxK77zGpEJWtCX3WLNLr5r0uHq@lists.infradead.org
X-Gm-Message-State: AOJu0YwhWj/9aKMBVz1CTkXsuO7dyDfmbOI2Bgk84mu8sXylSAWvI41y
	KxwFIDRpRbznfwybqohvd86M/+nWmZA3waRIPhOb9pKnN2TUaS2blbD4lZJfnDnw6xkL/kt9YB9
	geZgvEV9FtrKYukn3YCgKSZ3fX94uz2tPB9bRA8ytSKW0QO1kLq+CaPBmwZFqby+OGJoi+6i1GN
	wurw==
X-Gm-Gg: AfdE7cl2oNZzgmzGpebrFGV4eZ5V+R9yGpllAVU7Hgdgw+FMT2BpOtVeRoHTasb9HBp
	U+YTWenGkQ1uv/qfUmncwcJ6vunWUAFuv9BPceX4OveTSPhXYVfkDDA0iZhJf/Wpjuh9woZoBNi
	ahWUmoKPnpFsHbFsOw88M9gUoQ3oEYlfbU/gnoFv6l1FVWyMlmU85fnZeZbdRHbyFvKoSY6XT3P
	2GkD5WISCh9lSP6HtfOvHpltzYcW+iYug7wNDBDHU2tXNifOve7U5Gv7TFlWBbRFGFrx5LfzexB
	T6ohtunOO4gz5MA6rr6rXh14eL9nAVy7wyTHJfCdwd7Ox0HnczYQGCJbtS0bjSu/e95+f798cip
	FhiDrCEDHqsC13XXd0sMjIAIhrrNuDcSGzUQ=
X-Received: by 2002:a17:902:e751:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2cc92ae0e05mr59298055ad.24.1783371953837;
        Mon, 06 Jul 2026 14:05:53 -0700 (PDT)
X-Received: by 2002:a17:902:e751:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2cc92ae0e05mr59297795ad.24.1783371953336;
        Mon, 06 Jul 2026 14:05:53 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:52 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:38 +0530
Subject: [PATCH v5 6/7] arm64: dts: qcom: shikra: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1469;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B9OVGtbnZYkfAOGV7e+idMmskau8zD6EYz9PXmb17Gg=;
 b=EocsNCEZuvcYsspXlMq++ZuX9obJ9DqG9XuT+DH7vkNuX9uG1zfPZU+oZXMB/dZF43gnqSmnT
 sPV/SafOjxCC6F8qTmUW9Uv/DOprP1rlIUxv5uQc60NlDPDMd8kGgWM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: lghl72faM48MGv2jaw6v7NM1lZyRwct0
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4c18b2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QmmV89ZizECaiV4F4FsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX5wivb7s5ktE7
 q46JoHpUjtcqyAHstafqocAqQWZwczW+jK3wusXE/AAIdH9V6R4GZeoLp0+U2h8yh9VB0JNrUZt
 vc2XH3Vci1snbKmPBcm1r1BhgJt0rT4=
X-Proofpoint-GUID: lghl72faM48MGv2jaw6v7NM1lZyRwct0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX4b4ipTfgkWie
 8T/8rQQD8Ub6OCJNf0OQErXP7r8hw1RCnNq9rJHHRLsLKRV0W7Vn1HKQpaiePdz7cX1ZqW0Bgw9
 tCJUTyMnKAbd8NEZDYRlUJ4gRv+4n6LLrQtK/9UV1XFnJn5dUjXCXqEhONmyYXYFTStxRO4yKwS
 BNU7OGQUaIV3/iNzQFrS+sqkdQz97zsGEJqwi3BsVXk5IFG6gM9hCdhSpMrcVmUrjyFB6Rpyn+o
 pPdVCGVnlXqS+q+adHwsG50KNJAfq8qzkGRsTHZW27SZK4GFxRviI3OfxwPeqsIyo4NT4nV0PlL
 1IZdRkHuegbGnWbSfed+NisCvRMIjY21pyUyg35glut4qKA07Vi78Mu7rmaVvB44jfUPY9+FKtz
 ifX9/qs3Lksm2pLaIToVfxMxy8r/NkI7XYzikq7iNXEXmOfPYUWZAfnMMdq8H6SoqrSOCpIdZZ/
 8l2CJSv8uCiCoPOTdHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_140554_968019_4439D510 
X-CRM114-Status: GOOD (  14.78  )
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

Set up GPU cooling by throttling the GPU speed when reaching 115°C. And
use a passive polling delay to ensure more than one "passive" thermal
point is considered when throttling the GPU thermal zones.

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


