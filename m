Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10211C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMt5GZOx7uYmsYsdVhTOVMnnLqkVcxRiQSTdVu7Zads=; b=x421TFHP4nF3x65dBXQ4aEIjy8
	n1Em/QJ0N/mynFFTFUdnZ+SGuUr2qZOvXJib3ipalBlmxWjIH79bg8aLmrz/w5UPvaD74knhITyQ5
	QogUDWcgPfGqtqh2k8Z1uREQkaJ7lJRyhv8Ye9N7Fe0S1G7oS9iKC13AXqi24tYwz2InipLf3S6pj
	kZtgNbQNEqPYwGBjvqBdSCylqtkcVwGjDcIazlSR08n1cJsm1XUe8basykuXX/FkB/BRKObNdqo6Y
	Nw+wVTSgaIHAdQShoeAwv0hOF2sfl947Um7+aZ9FMwSIsM+g5KBw87pI+Zu8mzFrdNepEV0TPQljt
	hi1UZbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Nl9-00000000X1i-3W5H;
	Fri, 25 Apr 2025 18:26:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N9D-00000000Rhj-2CP9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 17:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HMt5GZOx7uYmsYsdVhTOVMnnLqkVcxRiQSTdVu7Zads=; b=TLNBBnIKIydXmFb4+jIaM6A8nX
	0FqWh0uCm0eMsDANjU1irkKFYAbrb7OCOfgO1hXA2TefBRLxRvCwGIadb38IEYlYp4zLrLc7o8Uir
	RAjeUUrT79VjhZRaJbSbvW5L6YTgSzKsICUzhxGVGifc7Na8YamxlR/LqCGa/Ofif4Je7AYep7fuo
	RGFfdm3/ay2JlBPXvp4W3QwyX9rB+A2KHaWgwZNXXC2geyGvmf5f1ddhDwAOaEQbrIfTCmhLhj4wX
	D9JeOnOMWap26FRgKEb6MvTnO4y0NU79Q+PZSve4Ftogs2PSAGKz998LzzIOVWKdDf6oxs1Zm6Tz2
	pLo/V+YA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8N9A-0000000C7iZ-0rpk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqgu031947
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMt5GZOx7uYmsYsdVhTOVMnnLqkVcxRiQSTdVu7Zads=; b=H50Jsck46/XBOyyH
	2uTn9Sg1nnIR+OX36sQ1VNWz76D/kIRmXa1660ZyZN7YM6RNhh9aoqIC1w7Sd+D8
	vKBwQYRLqz6ESuP7mCxzAfUWvqAC4ZIGd1y5bBQMGS4LMIgJtG4oM8SC7zkQTzQ5
	vg7BA9XspWQJiRosugXxYOycvh0eRGWlqSE3FIdF8OKTR7Y//saWMUTmuZuvmFOt
	9DoHs6BGLu3qFLxZ8HS55CMHqA2iZQVhexgoLdKCAAh52b4BlitdPWkFtXSGmP5G
	AH9IvJgWlxOZOcpJ0zsGhTmo6PmqTRHLZcTiFfpojTj1IcVGwCv9vkTgFalMlwJG
	L7ad5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy9uvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so774332085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603248; x=1746208048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMt5GZOx7uYmsYsdVhTOVMnnLqkVcxRiQSTdVu7Zads=;
        b=AcZk4jupmVdNPm4ZYtX03OLqy++YPAIl2ilj8MDvVPttsT/1wnzAMxJA+Q6JjYri6y
         91WKI5g5QYfBOgFDWQsSg/E8iRLoefIxtZBgsf589/LHyCTO/8LCjzyvU7iXynHu76V0
         s5YhTuzEHzAbpuMPP1NTL8MsFp9fE6tAf6upZuBM4K+zlX1T7GDLhoucE0bNa6vpyD+/
         3e3CLBi1mAk0LK0xHXCknh9KtZnzx/v3yFs3WXYMVmBNQxqFItjkUWVRpDK5Umlg893+
         QCMsXebpHu66Gb1i5Z83eaYHM0gNyb/7++3UMm9MdDc/z+zIAVD03RgkiVyrKKT6DOCj
         plmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUd9kz5YeHNbOWwVzIK/Mb0tVT/SwPxLuT4wu7kIHnIj+LIJkb+E1dP8K5xMlXEk1i1MawzLmFp33y0cMnbl2t@lists.infradead.org
X-Gm-Message-State: AOJu0YxhlXh8HRDUxQ0/6qOaKbo9GImapu6pvJBQxm6zu+qNjcIexJDp
	0B4T0g6ZD4lqDggiMJngvPaNbcXB8ogaN8STMzZxILqT09xyyBi3FbTC7TQvaKEYb0ruDx0ODtt
	65QOwYtB+F3x1sWYaZIoa2TiH9Lst1Kloncl9StFlE9WwjhanOkaPSC82ew4UuSm8Ssy1vvtVwA
	==
X-Gm-Gg: ASbGnctGlyyxrDVBMUZuxOnJ0TU9rBuuVW6SA37bbRxlsc16r450mUNj5KZmmNjzsGh
	kyCQzJe4ySQ5dPWlxQCdiN9ghXI04HvFfdR0BX7yhUFiX5GfVM8SwGrnQkbxvg1HcEQipfqqnG9
	+Qdjl3dwzxYuoa9+apZhYSD6YUOuDfURuYPpWIgkM8xDDEAXKGhi0DKyolgXuouwnvcWQaV5pz2
	gEUpInhkWoavaaqrf3TO9x3e4LqqIfnO8ZW4FjFHJ+cTrp0e3g2o1j5x44uW9ogQ06ljdvy2K32
	uvQkkZkhVmLxXOy6hQd3Y6pNn5WMwcYJEZnjgBPxpRD3aEfxl7qw0AMDtAoWWq44LQgYOL9TatN
	Zah1nQhjqvB4DoBstVb663G9A
X-Received: by 2002:a05:620a:28d2:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c9668bfd12mr74049985a.38.1745603247885;
        Fri, 25 Apr 2025 10:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3trC1FSJEN/SFa9CDGpvg4Ez7sMdjuNRyKbDHpwzGHtEBvX6Pm+yI5Y6p6KdyeAWMtca/tw==
X-Received: by 2002:a05:620a:28d2:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c9668bfd12mr74045685a.38.1745603247520;
        Fri, 25 Apr 2025 10:47:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:11 +0300
Subject: [PATCH v3 11/11] ARM: dts: qcom: apq8064: move replicator out of
 soc node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-11-da4e39e86d41@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2411;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jeIMQed+uhzxiHzwczupq3qDXNwJFo7QnV0YFmtUdKI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbXu1dfN24xb8xCz+9ApPZBycXaRbf43SfV
 NPq6v9WU++JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1cx+B/4tqUNcdPfM9qIM50AHK4Bh5wV2y38lX12TL74q7WhA69pbPY/ng1rmKHkq+xlaeam2QQ0
 Ut9y9dKOd8NDsoRDf15MTMxT7Uo89JpRyzVWMDx1KmsGOaBHMtDxti6rQYQ71iEQktw9z8k6/Yh
 czOdGxtrFF5dGQyc4DTfpnSGk3FgCvi6WMN10fApn1WmDhYu+rHFPSURkt6vYrjjfr6bJjcLlPc
 bWwVk8u3QVIHaeXtbMVIq0quw5ROZT/b4LFcRGG2ycPvY5ZSfVup+RNFy70p4N8abSUjKx+UYa2
 5917GzZUEO8I/WhvOcUANl9c0SEVRie6YtXoS+zzUUx3QHUd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX0CHdLVZaC2Tv rZowxPemshADWQ/xoAxEmvrMbROeEOFjUz/eJoBWzuFd7w/uDMbSKjh9O8bIxxMQx7LqCMB0Kas aqTyFz2PvZH9JA4uxqAVFD9zJw5TGOCH0V+qrCaqeDTaTMY2QL0gnU0RqvMsxZbZgjSP+QGkdam
 KUGVexN1PZl1pPcTvGxQRW3efGstjVJBqX4F00rjY0ICbcHMCaksFz9AJy147OFvKyZxdvn/7vF ssej2AHESij4z2ofheGUdui10oBg6rsm2PugWwgq2SrlC/gywapyFLYOwxvev2eMZiFrV4Gy0mo GnVwQuvAV5t/wy3GNCJec6kLmr6ANh4KklE3PZePFNDm0fjFMmHqsq/Tz52lFResEa4hZvLAKhf
 ZzeniisowoYOOKMqS90/LKCKwQI96XKYvoyucVDmHt6LjzUE/GZt3ZP+QhbEtser8jOrBHWi
X-Proofpoint-GUID: OwUKetzucMU3gvcPsNcONe8AqbVRzlwx
X-Proofpoint-ORIG-GUID: OwUKetzucMU3gvcPsNcONe8AqbVRzlwx
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bcab0 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=LFh-nz-jDHZ_m6HcgWkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_184732_605788_A7B93AF9 
X-CRM114-Status: GOOD (  13.48  )
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

The CoreSight static replicator device isn't a part of the system MMIO
bus, as such it should not be a part of the soc node. Follow the example
of other platforms and move it out of the soc bus to the top-level (and
reoder ports to follow alphabetic order).

Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 67 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index b6533630e347c8fc5e3f0791778cd05760b3f3c8..b02e6739ccb20a287095d8c3e212040e4ac50fdd 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -278,6 +278,40 @@ scm {
 		};
 	};
 
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+
+		clocks = <&rpmcc RPM_QDSS_CLK>;
+		clock-names = "apb_pclk";
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&funnel_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out0: endpoint {
+					remote-endpoint = <&etb_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1529,39 +1563,6 @@ tpiu_in: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint = <&etb_in>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&funnel_out>;
-					};
-				};
-			};
-		};
-
 		funnel@1a04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x1a04000 0x1000>;

-- 
2.39.5


