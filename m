Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C62CCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gi5oBQd150ml6prGdotl0tqIGqGqxXPGsrnAZADhhF8=; b=Gi3HvsNccJTC/HI2IrGXGlnw34
	iRL3/PCK0+HoWuHXnk71RHyRfRAD72tw+mOmKOK5cH4z6LOUVPJkyLTF++VH1G257I5J0HRRVgV6W
	3wX2tROxan/lK5TDUIyUU7oS1oy6UHdi+Y+q3hWHwLDU7oKeiz0BTahkPl4q+SNfu3J1UQDoWCqIT
	H2GnEaIUlBW2itM+ZRVrEcZAsCh31K7p/t2kEFLlf5fqYAxX47KiTbgLU2o2JZGLHdzpqfXNZV0b/
	7kecXNka6f16EvE02w4TR/pBIN1YfWE+VZgr6gTb1oqT0s24Wli+I5SYXmE64dk23KsUcMZINGt3x
	eFCoRJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdkF-000000029si-1SLK;
	Thu, 11 Sep 2025 09:37:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdkC-000000029r5-3aX6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:37:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IYUo002343
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gi5oBQd150ml6prGdotl0tqIGqGqxXPGsrnAZADhhF8=; b=kAIiuCpUhWnrEvTX
	eS+Iai3UUJ9KwT9Q0Df2ec4CHtPghELY+riEuCSRrT02sXCHBtgWtR7SKYWYWVjm
	gVI9aZTwkE01h6zyQI1wgoI6gg7NQcqgSSPJIz6x+qIXufKlKp+j94VFYe14Q91x
	8EKnxscvJwJBeZOV2XMEf2MFpB+XfIi9Syxqr61bKOjmHGZwVh5PpUXoq1D14MjY
	4LpDs1Z2LTSVxU8FyxbLn8H3G5BJElTKkcmwtsnWqipw2rMWIXYqu10WEMtrUS32
	+JvWLkRz2Kxr1nRxNvL/Ie5lrSMDO7gLfHrE+iNkQFZnksnMukDwmtMW3+G342VR
	0yJA1g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8q5ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 09:37:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47173afd90so827798a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 02:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583450; x=1758188250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gi5oBQd150ml6prGdotl0tqIGqGqxXPGsrnAZADhhF8=;
        b=HqFzLvsVWO9vGslltw8IjLQIMy4dbuOGALHubj+hW2Ny7bxGBGhYwXKKV+KgkPCBiS
         rGbVsrnOq0Rg4bd1yOKhFNpFV6JBuZg7wTZ+0UDHBJ/HsoMNG1iF4Nu7VL/3V398TdqK
         /gbAHRoSCpgufN0AmDYLdhVS6w8Cqr45/5hUkmaxGftPGz5vYpi4CfNOnvNlSxUvwo0M
         TEkjp3FSAm6teCWOMRjHE6P1SyvOqGKcoazIlmjkSxTfqXNIQWU8pr0SD5hAyK8OZgvz
         wmVCknEW7d5XK6VLBSWHOJkg+9dFeTDn1E3//VUiyp79ruh/qcswWaJvXlvnIsxrbXw7
         hM5w==
X-Forwarded-Encrypted: i=1; AJvYcCXDVZLxCTCoNVA76iWAwGCIlFLrB5qfBYhx10hUqMMzXUoqokqQ69aD2C8ZBoJiHoOQ5ZPF7VnG2zMcyv4sJCda@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+O2YZMXXNSQsnAQbkoS+DjZmi1U+sey4ODK8eHtKlNTxfWnO/
	RZmWyr2ZTEf1h4r4107oR11CQ2O4HSJ3DnUm6lXtjr0Xxz6xXnuMqS4eBMFU/RuD561yDQxNlz8
	nPIughas6xO40K0pVO2iEc7vDZipKzgFeulAfNrmtZvBiTamyTaYBxxI1rdXjeWjvtiGq7i9Wn5
	dr3L9O3raxUprV
X-Gm-Gg: ASbGnctuCqvJv4uvfVFds0ArtaWg5Q/8RCb3W2VWVBhIEDUuTQ8TkDPHHuR81z7Ttj/
	T1Ogp0Gg0wsXLsfNBHcYsNPmItuRLE6LWHw8SgRevLMDBtUMR7UMc6WfODYEKPXC1dtCiYdbZte
	OumWZivFU0KmfDGQisyizkgDxFyxCI09mWqVc1Vmx8nzKQqX6NxLtPlsBvzBKCAllhuIwlkzi0a
	VDzwMyHmj98+2hvbk+kYmwYRPKjorZlk+5tjsd60EPGQPgBK7FLvjvkyUqGvd27SM1KRrxeyP4l
	fSEZU6JdwzG9qqzyjlv1bD3MXzKcuutjcMBNg6BWBrurK01brRT565ikdl6oF1uWKcxOp2NjQ83
	30GLYM69mmW8nzHTDaNcHgXIhKjE=
X-Received: by 2002:a05:6a20:6225:b0:25c:3979:ec83 with SMTP id adf61e73a8af0-25c3979ece4mr4829150637.58.1757583450287;
        Thu, 11 Sep 2025 02:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGklNx1s9kfakLwf6g2Z92p7sShD0ETtCefU8Z7wCR9fLvQflFFCs7h43CY/eaESOBS1daiqw==
X-Received: by 2002:a05:6a20:6225:b0:25c:3979:ec83 with SMTP id adf61e73a8af0-25c3979ece4mr4829117637.58.1757583449839;
        Thu, 11 Sep 2025 02:37:29 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b730sm1512930b3a.15.2025.09.11.02.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:37:29 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 17:36:56 +0800
Subject: [PATCH v2 1/3] dt-bindings: arm: document the static TPDM
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add_static_tpdm_support-v2-1-608559d36f74@oss.qualcomm.com>
References: <20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com>
In-Reply-To: <20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757583439; l=1550;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=HMl3fZ2Rn1YIATYS3PdgIW/HqL1qSbetF4GeJQOJzrk=;
 b=7h5NsGCmSvLr1eV1Pu/oVXpaH3coDnZcUXkOVrXKG+YON1GtXZr2Q+xCI0EWrZLFne7xQDtMQ
 z4gq5OLZsGmDRc+llzA4KT7zZbWCEPttkam8YvHFt0ncS3BUdSwjSnn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX8BO7j09jDJmV
 WrF8kY3Ro31t+8QzQnlV7H2nkBJwpaUlwC4tTFJotpa57et4uhaXgnADaSaWUc3tW5dUSOTJuXt
 AyBv5pDXFZLDWe06fSxf4hCNQeH5MrF1m6zsg/5wrIeiD/8QSLTEo45nFNx1S3yFl852XuUlZhU
 INm07AK3TyprRUrx7Sj/dvuVlTAGlolkY4KIfNzhIHZlhaaFKus3yg2H+4KQOu5KedAdCnR4FC9
 mcKxoMQ78XS343fzUlnw+deklMQpADxvmR+TmpXkeCdmtC76llu5th9wqGNxILcXOYyL+967FTh
 WrVFYrB5xjjkjidkDaviKaTmLk/zWF//cMsL4Tum+94RgLUqsxAPEF4vGrrYtcS5npljQmWqxr0
 DMAfEwlK
X-Proofpoint-ORIG-GUID: -JT0F_AxBRWKI73G0td6goKo2DvU6y4m
X-Proofpoint-GUID: -JT0F_AxBRWKI73G0td6goKo2DvU6y4m
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c2985b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5Z_N_GBq0btHVWfAyk4A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_023733_023346_F9E7621B 
X-CRM114-Status: GOOD (  13.84  )
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

The static TPDM device is intended for sources that do not require MMIO
mapping. Its compatible string should be documented clearly, along with
an example illustrating how to define a static TPDM node in the DT.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tpdm.yaml          | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 07d21a3617f5..7c0acc1f25c5 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -36,9 +36,12 @@ properties:
   $nodename:
     pattern: "^tpdm(@[0-9a-f]+)$"
   compatible:
-    items:
-      - const: qcom,coresight-tpdm
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: qcom,coresight-static-tpdm
+      - items:
+          - const: qcom,coresight-tpdm
+          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -143,4 +146,18 @@ examples:
         };
       };
     };
+
+    turing-llm-tpdm {
+      compatible = "qcom,coresight-static-tpdm";
+
+      qcom,cmb-element-bits = <32>;
+
+      out-ports {
+        port {
+         turing_llm_tpdm_out: endpoint {
+           remote-endpoint = <&turing0_funnel_in1>;
+         };
+        };
+      };
+    };
 ...

-- 
2.34.1


