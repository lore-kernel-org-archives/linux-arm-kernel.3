Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B7AC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=; b=j+Sg5UrabCQ5HOFVikWl0YHx1F
	gCalilELjZK5WKXpaclK0avBTsfR1GRP9Zsc9qXGbWqRyjg+L/2LomNETWnopRmRCc9hiQDlsHtsD
	BnxEKdGzc9gMzpSUCrjMfy+hsEjynHx3qLVHpfxtqHQlp1QqtyVSL7lEnaXBcnMTZiMi0rIqfw00r
	poBm3TdezYtRgt+TrgKjprtJMU2MJV6lqA+hzYGxlquxisy6L3JE1o8GDNc1o5CzKDvyfS7VWdUVQ
	vekTNf/O5wvlIiO/s3+YFzCnsiznbE9YVsw/gTVq27huIngeBEwbPlC0SkPUzxjEQsYtLO9Q0+XG3
	PxLNBE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOi-00000003Dpa-2fiE;
	Fri, 17 Jul 2026 20:43:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOg-00000003Dnu-12xt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:43:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtnc22653361
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=; b=DpiX1zfSRa6lldwY
	U3+6wAwK7OaEjUxXNbS6Hpa/Jz9rdmUiuJruNGa7Ft7Pb87qNd5/8ado7rOywoji
	4g8r0n5RFV7qkO1xsONitbbpmd6wSIJCznkxWiA0eV4tMGotcuuqFG9WordV/heW
	63GJ6k2CtjkSArYE57hlftCsvm03e/Gye8q3E+q1/cQUKZwicwmULldy9+pxbP8S
	FISXmm7f99LpO+yvArlXiWZNavYDNvcCVNSE2ypq+uC19ybeV6JwC7YwVA1PNXMc
	msb1YG+ci7MF2ImSX7AqWz7uJYIdoiN1XUfk490TItw3eAD8W/N1yOczeHCe7mjk
	l0VYyw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9pb8gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:43:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3811ae55313so4477268a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320980; x=1784925780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=;
        b=ICeG5zt7+1vjhxevO+5EyFI9LHPdt/0lJv74O4etazqr8MeMf4iMQMIp3Ot1MYtndn
         Z9owGbVd4CX6hRJv6VfkdvMNTpcyTP+BJt598wfiP08MuaE0rFmJn6nEABRSzn9g/jJF
         hdKITenNxfowzZa7juePteA8OR2LQE87DywgAjz7V99EuARa22DJL5J474vGqxIiWqiq
         b5YHvsYMvomNE9WMcvxTcR1Me/Ha7PCbUTfE35+ZWNUSyH8nCJHW4eqjdfKVhMApPKit
         L2opCMH0GWxlI4/2Z14CxWDHibqSujQCjxM8Gv1CO+2fLsG1vogSlIFd6HfyAwEf5BcE
         bHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320980; x=1784925780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=;
        b=YsnJECG1jK0YcMKjX/2pZCI6ztPaHd7tf+VaHD/aPUX3CTt6t2Zj19HCmzzJdrvzcg
         jwH5s4/nv3MH0GiAUjvFtwmMQ+4Q7CYOCamR7lyzsjQB8CUa/lrNyLZC7lDtdaX2bX/W
         IUJB/XbS2k1p2ANV13VO8/LazOfYZZohKiNrL2mBH5VscWNsxG2w6RZccrFfOXdn19ji
         ZARAJFbUsfJy8iK06I/Pvmt3dFwYciithmoRlt3Zr3kSchQLIRdeXk51BSD9kReDCpOw
         95W/U/mviLH6jLDjMIDRIwI8zQ7fzKcf0CpXld6LZj4SXTfoJ7saHbxrIfmIUueddNzK
         w4Zw==
X-Forwarded-Encrypted: i=1; AHgh+RpSNflGvyXNZrBKfCdxg1i2HxIwKeIvirNf/yhIuxgs3rxLgpfrXIHE5k72QdD2+PMjIoi52ISFMnuh0jJs7Zpj@lists.infradead.org
X-Gm-Message-State: AOJu0YztmloOn1QMKe7TUDkbnSFgLQkj23FteQgjnSHb3eR6E8YOcFaD
	tlcntrW8GmU17KTKaGUnnB+Weywgxewt8O3Wr+kpkiDPXIg2jGULurkernIHPIJ7jB20tfAzsZC
	QwP++Lmdj5+l8G2NCuj4e3UjPpRXJ8LNmW5usQRxE3gX78I7lPcHlA5+DTqTw7OY11Jm7LRqY2q
	aJgw==
X-Gm-Gg: AfdE7clUefEZcQpi95PDJMh4GTQibxaF71/B+I5V61f1/KqFLchkJ69Y373cVmI4BuJ
	DccHuHpWSubhB3lTTF4kfT48JpRLaT3Qzi9oNbln1IV9pYXKBM3jIvBE9tSjGE+JyzNvno9OTU8
	KSeNctwKgjpH+3gvkoVAoFDK/8S2cxJHc+LZOjTPtxEUu8kYgt8k+RTFtRsSEcPm95mu6AvDZjG
	S6eSkNZafXjz/fB1UhTFwZd1mbBHdgI6etYfzxCDbcMt5oZZPxbFopXMVeAriWRcYMKuEqmOIcH
	65TjzC8np0jBb5imADTRzUZjrcHwKDOAQWWFj8ulr9+m3SEj6ab2SNQJumQYDJXgm8V/oSkm2Q/
	ySi8CAhwU8AKAPqciMUCcEorT
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr4228873a91.28.1784320979914;
        Fri, 17 Jul 2026 13:42:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr4228835a91.28.1784320979372;
        Fri, 17 Jul 2026 13:42:59 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:33 +0530
Subject: [PATCH v2 8/9] arm64: dts: qcom: eliza: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260718-eliza-gpu-v2-8-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1862;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=I2qdHaXAWQ66skBdEcFBDJZY9iFXnEWZCtP8SvXbtEY=;
 b=Hr26za7eMf4CPEZuBeq1QpcGTa+cwNyDY7ry7ltZ24uYMQrlbbDQKhp1jH0P9FhBarogV3/ti
 yGBLL4sPirEAEkMVokLL3QmWaYWdYvOUfnk2qfLFmhYQ4OdQKTpPQry
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: NnPKVF9jbnFmIcrWmvO5EJYsJ0sRsyV-
X-Proofpoint-ORIG-GUID: NnPKVF9jbnFmIcrWmvO5EJYsJ0sRsyV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX2Ps1e9uWfVh6
 hwSY1EW0id3/LCIg/YFSHetJfpUTXZ8i5Cd6E7k/QAa0MqmtOWxoxdVmqJRnuW8JX3B9XaBbVln
 8V6L+zMhHNg14ig9ML13DJhyjnVI2x5bWU6q3PFAZSAZGOR8JO+l9UPc01UjBC87xww7RN2nPoy
 NGMzHt6i+XQadhyg4eoFBHk7MY6kF4TkePlC6dfokiyv2j0HgA6OamIsZGfMqAhFVUhiHa+4wHn
 FpS4Qxo4gIYZwsAWJQbQqXaNAyYRLbG8nTGrTwcONMAYKB8FDm2LkqUJrVXMGios+CYWNvGcRkZ
 i90QYDDVGD3yYICYh/Ky68tWf1aIGrkY/sHgRgzwiz0G1imXI38N/0+YVPkookoCIRv4EgFl2pK
 +TEPh0RtbaYOII0m9XbGGh0g/e1ERX/bygFKdNzWMXSH8xCqVC9Og9Yeoxxj0zTqMiU9o47YXYz
 7ePCTz2V7uYrhaXmrZA==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a93d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wz9XmjxeAwFrORu178sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX+BE1brnh/GH3
 Yzj1MAoMIwv+P1GjIGmrJLprpqWp/8RsiGeQjGZD1ReSU+31jmpuxFk+aIRL84p0I3Y0sBM4eCQ
 bt0XUJBrfgtqD33D9+X1YhmYa9CoxiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_134302_416678_F65223D1 
X-CRM114-Status: GOOD (  14.27  )
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
reaches high temperatures. Set up GPU cooling by throttling the GPU speed
when it reaches 95°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index c24c5e9695d5..7a6095495b5a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4203,7 +4204,7 @@ gpuss0-thermal {
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
-				gpu-alert {
+				gpuss0_alert0: gpu-alert {
 					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
@@ -4221,6 +4222,13 @@ gpu-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss1-thermal {
@@ -4229,7 +4237,7 @@ gpuss1-thermal {
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
-				gpu-alert {
+				gpuss1_alert0: gpu-alert {
 					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
@@ -4247,6 +4255,13 @@ gpu-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		modem0-thermal {

-- 
2.54.0


