Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FCDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL7jN6f+eBJVRlNozYaif9ayrUgthTONRjua2k2Vz4k=; b=MyHYHNGnNLbkjEozTIJILwf+lx
	ajD4qBfdqOTnmJ11CqMKlbmC2HwrDdQQAyhMQ4zJKZyZyX9EQ2h99J8uxcCXF+0K2MvBwbLf94PMy
	zXH7z+h4GX77pod5IYLKMwZZlluPPoyJBghLrMV3V9JN+Ih9uJYu2juAOK7FTWeLk/bL8AeXe/wm/
	7krMUdAfhvF/LXbevtm8bH3mUHMHn8l+hDcmVI8prBCONUXJkymayYhnJ9IgVeW6gaIM7rHitNQzr
	Zn1usppxsftJfp1773+D6uYfVsOXjRG+RzqUqoa0hIjaVV4lOTM44nOGLj25m3hipGnjUIlnYgF+A
	Bf08IAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NaA-00000000Vfu-3Fzc;
	Fri, 25 Apr 2025 18:15:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N8x-00000000RcI-2u3e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 17:47:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqZG031964
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PL7jN6f+eBJVRlNozYaif9ayrUgthTONRjua2k2Vz4k=; b=cLMox5l3ozjZgoY8
	uEhF0icCilZrkBV1AnO3TDE2Lthvp0blA9Dl2p8QYGF0VS+KzZiwgs+S0rJwNBbm
	x/zqODA1njV6DyPJjqS4Bf3N8BuPASjn3JBG2NH6ddiHvQ7K0sC/n+Yh8SX9Gsn2
	R9zJzXJ+yyrXiXomyPCuOdHIQNt5xbyaUJ2PNYDujQ3Lz51YvdpdL3YL0yjLXLeF
	3Yszz/6m+LyyKpZintLUL8Bf/jwRCdYQCWPtJbtpUvGDfRqOhtPIscpUZVsBqN3S
	GysgHjO6sxVzrJUEGVOPDXdGwi5giG+XwRvHiYU0qbuXnWYXH2bPYwGXXnT7DxkZ
	Yib2Ng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy9utw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:47:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so774264785a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603238; x=1746208038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PL7jN6f+eBJVRlNozYaif9ayrUgthTONRjua2k2Vz4k=;
        b=rs9/TBU0Nnl1BCPHzY7cVz5nK/YqcaXxdtQdz3TXloV4yFJ4vIuwqwlqjgZ+qvJ+jy
         YQXcvu0tKHRsNfzSSU9kqBv0EY0zKonUFnZn9gRNJYEsLlFkIYUVAISHLeuwnxVaJeku
         yz3D0oWZlfXcWzawaF7IDsWMAMJtjHmrrvOmF+dFWAe4aVXR3EqG62/C6pC1tSCkgb4g
         hge/V9lpEeGbA6aWrR1p3YbJn8tnrQWxtXUBIX0RXR5n1V6Lm1ep2d2ffQZ4GHGk2ecU
         BQoyQ5zon/hkXajQLcQVxe6BHj+FUKxsRpuk3Umm8/GcnmgUzTtyLjQ+CE691ZDKaWAc
         TcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnfgY6q7FqB59BMgh8ly9wNIkGzwDa4kISGI+HNVlvvGu6xeHdE3J6QeucUwGslD4sjzuL470gCGcOBDDCYFUU@lists.infradead.org
X-Gm-Message-State: AOJu0YzdoNnV4672PALYj8cKSLINRTspiIxa52C6BXfJ4M/aZ7j2ug0u
	i0hjNUoifxKqPXpxMnuklNaD6vfOREiivgpr+RLbhW//aA6jT0Qq43gI5zGSFiNelWGMQOHyuYf
	GkysWVB/4V0NP7V3Pprt4IkjBwebSnlBRnZ81Mwsf7L84Zolzc4Qszq8x9qzGCAbvLiZJhu8S1g
	==
X-Gm-Gg: ASbGncvT+jcok7tdQyH5NifzF11qhVsEMWBJ1HH2OFj/mQlCZIdQ+dZEBtkyDJ58Ykt
	hIulSi+DP1DH1vD1fzD7bVZPIzSLHF0k/mLYUmjqBM7Gub/rIcNx1iINHklfX0z6mukYOZQivax
	0X/vvGxEBr3iBO+2BbHzyCvVqqy326o+T9vlB/UoUOZXRnzglv8f4/SJdqr7/NSwvAHg9G1J64I
	H9py3333V5QiXAzGkQEgmeKYZvVmHkHbKqB0zbgLc8kK7Rlh8NqTQKH12lh+3Tgiis2rpnBpD67
	cCjSroF/fFSnFfnhWyYmO0A+nM/Dj71xtFhQvGrBNO6HS8A05SlQYTIzSZzuvx3tJoJ1wluHHXd
	Rw+5D8DDTTZtyr9kSnV9yUnDK
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c9668cda1cmr75282885a.51.1745603238049;
        Fri, 25 Apr 2025 10:47:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdL3OArWzBhvBqNzfsFrRZba+vV4aIlrDXD8fYlmtF9uaU4jSX4/V36YajbOCQMlIImOTPuA==
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c9668cda1cmr75277985a.51.1745603237688;
        Fri, 25 Apr 2025 10:47:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:05 +0300
Subject: [PATCH v3 05/11] dt-bindings: soc: qcom: qcom,rpm: add missing
 clock/-names properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-5-da4e39e86d41@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1d2THw15+daDuyiX9YdQivB5AYVR+M6/q3kC0xvZnOg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qaJPnWlePN4G06TY7fEEm69HG8cdexjAGYi
 z9VeXhWgCWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1evlB/9Ov2RvEXWeMwV1ap857cd7QPGS90ERiHjJ4txAv8jlKQr3TtRgpW9mYpCDGftZOWe64sh
 sl01bwEr9KWeKaauSSO12q4bNkn077fa++Jzjkw/g4vBuxNTC30ZVmqVOBxIEPLBLRlw7Y3uie7
 AmdkGsh+NVZ7yeTCLWCl+T1svFCPVGR/QVixHnjDa87sPZPtuKhvQ3qAEKO8GqrPzLj8Fa+iFkF
 oUlzhFpQ1cUAs/u6xSeW+K1KZPdpStNWbr9USOYVqLQsSzJSaHrvjZdkYXxJ+0YbFRlvfcSlvxx
 fq9+uVVmjwkpPYYXf3yGyKonDbA9oEmuLc4Zgf86H6ju5EYb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfXw547bD7ua1C9 WqpGCDnyZ92Jqh7yEYhs6sgAUAlHaLVZi19xPXGZ5ZzMyExkLBhxnNDamDpm3LOxA6gBrfmET3n MZOng/2yTDiMhWG9MRo9gpV8zA+iUDKpz4i3e1Y5J1ZazXz0SO/q2cDiyR1qgVT+OZQfFlrPRXU
 N1rsP5G3sAr4sIyhGLzqhV027XEIujIrqb/scI7ixCM+a8tBDEtT7cTwTPjhRhKF19CAHdQlxzt dY43RNmEJ1lcCE4elHbjKeoWtwqa7Z9GmA/CVl9cbhUsZEkCSiWblLmFkTHsbi1M54d9ypg+JD7 XJmCkn5ONzhEKTS4uUvWH0vG96p93ulILIgQVQAHHFBgVv8qZWOqjSADTEK8DVttNAPdrt4ydtH
 ch2MPe4SMN9cNBE+eblpZ6B196iF5IKcI6OQeEUhTkCB5xe09AkTsPwv+kcQm+cnrzeEC6Zq
X-Proofpoint-GUID: R_723aUDGzBFZZhA3ytwGrjXf9GVFPRu
X-Proofpoint-ORIG-GUID: R_723aUDGzBFZZhA3ytwGrjXf9GVFPRu
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bcaa6 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kK6--y4YYZXB64QPTQoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
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
X-CRM114-CacheID: sfid-20250425_104719_870035_9437B773 
X-CRM114-Status: GOOD (  11.09  )
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

Qualcomm MSM8660 and IPQ0864 platforms use additional clock for the RPM
device. Document it in the schema.

Fixes: aa0c4b815045 ("mfd: devicetree: bindings: Add Qualcomm RPM DT binding")
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
index 10956240df0856a4241d6032d3aff7d447af9ce6..3e8d99cb4dc368ab6b31e3e60eb5f7e082cd312d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml
@@ -36,6 +36,13 @@ properties:
       - const: err
       - const: wakeup
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ram
+
   qcom,ipc:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:

-- 
2.39.5


