Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC66C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 10:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=pw2hvy6oPgtayEM/cYpDW1zyLY
	Q8iN1x4Twlf6bZb9KvwBCh1OJ/tS8yvS76bh7TnNyi5oBbJtGmIwRomNuD9nrS+fUl7XUkCJ0x39d
	ePHRSHCZYpJO1daS9hdknmqk61V7gCWgbx2DLbB12xquGxjYkszC9jCSl2NC+U8lXSTSxyeQsbG9F
	swRg7RQqLESCKj/JHX/OPPYKEEv9846/7WYi1Ppb5yXeBj8Fh9Z7PLAxPVXBEhXZXoSpcMD/c1854
	ufBqc2oxVtsjoM7oe66ElLyv8isIZq4Rp8jERNPnSKg+L3jmWodZ0LRNTLbSIHMPfhIHlXYBE+owO
	lObiazpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufG4w-00000009e1x-3CL0;
	Fri, 25 Jul 2025 10:55:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFM2-00000009XF8-1xrz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:08:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8aq0K023710
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0SmpNFp+B8v
	w9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=KCoNpFp+ntjOinka8/ykKwlqxo5
	eoWqWTAXhw/GyATRod1St33CuLKOTmsNOsWA00Y4rDkvOzSQIxesWwK/+kCH6OWm
	5mNJIzQhWfZaRf1jJGotTGU4sd0pqqEjOSlwtGrCgV8AiPaRycRQXVSsnRkPzuOM
	KF6kunFyKrzuDgzRcCXMingcKGtlWbq8QYdtL1LdGWxoqv2+r/pghS2K2z0im/vX
	asxBACcLDR2/qgj/vk8Jrtxzzczj0XtVzeVjxbmv5WmgAtn49r5Oiw2l7t4+VebF
	EOZYvWGtLq3p/SZ5SoSpQn/X/a8y35QLAqZL7yFXbvajI6JDPa63+Wa1qFQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2r9p1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so2694887a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438121; x=1754042921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=;
        b=ps9Kkn1/Yznn3zOcR4l9wMWvYeV92RiHmawTftL7OaKqNhCwdTxYljMwcXH6ZbUa4W
         bwRDMC9KSIcR1Z+B8/69ct33mYD2+lxOJrs7uC9bdWvavYIMX6XWNdpiVwKF+GtVOtAj
         2MTBuwGV13e+hexXDO/aRRl85K8TbFolU6bknfz/zoo0yV2D6PpXncAsR8GMmp17Tg1q
         8gipjtkpUnG3vYgEj/0PjYtCZXq4P9goMP9te/irhUGHVPxvq0N+jmnkL9m4sQcP7DKJ
         KnqEq+xC4z3sP4UfRfzF9WXxFBs/I+heJ6Wr1kwi51CueHHi08sh/DQ/lMlWgMTPfWND
         dorQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlmGhtD5ibNawCuKW6UqG61VpF3b+TPnJZq1yttPHurxooQfW2PIarvSpyJpuHaC1fbjXaYDIgNIt4bb+1krhw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7t0PmgPARrUpgyHxa5MPz9cuXSqgetAvC8yhiu1WT/OlM6b2J
	vpH8k07x25hWr/9bvvGETOOVqxOWSbrJsky01mjPlGMvKBQ22DBnZHmAlG7nHFT4pyI6F1gdhfL
	3hFaVeXHwQZPZUImzsfifNtDieS6FAuRvUs8qKFsnB3oeqZMMZP8jm6d2x1ebBGwKOKm6kHypCT
	pfdQ==
X-Gm-Gg: ASbGncvJ2ZyBQVMGD0km65ekwGd6JZoDopGVsNmH19vdV5JmZPQwJhW5Dco/0bDLfET
	K5bWrLBRqMeBUbmV17VcsTh94vdV+rmna9yKC6mjpwRAof5vkBW49FWVrfHX3V1YpsAUXJLN0Q+
	lGYarbYxq1LilmnNaGPcDv06aDpDOAqwNstbyHnHxZl1Ibyzba6SKb7DQu7/xzejhksohIlAkQm
	wbBlTaujVZ0c3RRU1jdii+Ie+4prkfyhqqSJn0mnYCn95lqqytc2IQHsUeVlFsn2Y1NQcf2/k9Q
	OHBvRhNA9O/6AjeIvxuf1RZR5oC3OgsAsZ3enORvY974bAt+KoaM3czc5B47gKfPsA9B7ie79aO
	YyKzSTkgTg/Teuf25cGU=
X-Received: by 2002:a17:903:234d:b0:234:b123:b4ff with SMTP id d9443c01a7336-23fb30cc681mr25581135ad.21.1753438120985;
        Fri, 25 Jul 2025 03:08:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDcweS3brtm1EcH87xGsGwFbz42CYAlihlVwybMembexKMc5w9Vl7jZLv3ap78usO5Oa+23A==
X-Received: by 2002:a17:903:234d:b0:234:b123:b4ff with SMTP id d9443c01a7336-23fb30cc681mr25580555ad.21.1753438120566;
        Fri, 25 Jul 2025 03:08:40 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 06/10] dt-bindings: arm: add an interrupt property for Coresight CTCU
Date: Fri, 25 Jul 2025 18:08:02 +0800
Message-Id: <20250725100806.1157-7-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=688357a9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: P7pp8jNLQuYeY9lGwCXCrLIvwE59QL5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfX2dcc1Q9/nQZG
 07dkSGWEtlHb/Uftl3Y5kbvvFyTANtzLGXY+JeimOIPO5iLPZR6dr82tgX2bAlMOhvxTfswgaSp
 UcDNsDYvOOdw1oX/pJBO6f66NzAVjo19KHzAuLiMqjc137hODAM70wbxI3RH+ivNJn0k+faOXph
 nWyhoFMHquzBXKkNNh+dsFWPBnmvxlQeMnqAud8jfs37l4GZcrHiTQjqmrYN/c/MsDowk4P8I4C
 m8oxRuna01xw9BT7VMgd84yIuhZqZUOfn5hmBz3PPW46X2GaPfCwDxmp0rFTvUy70OJvTeUUhUy
 qp4LTXvLCCg8HiyEsOiFI8mnXYGdLb/ntbtxWzf2qg+k7/rqRTtfEIEAlQC3kJN/ov5/FFzEGEB
 YXWM3oR73fIkey/4JjpyfBDiOAShvE2JJdONHgHu5J4cgxanQHUcVufTYaDlQCzU4yfQG/SW
X-Proofpoint-GUID: P7pp8jNLQuYeY9lGwCXCrLIvwE59QL5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030842_511523_C5B055C6 
X-CRM114-Status: GOOD (  14.10  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..ea05ad8f3dd3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -56,6 +66,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -63,6 +75,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.34.1


