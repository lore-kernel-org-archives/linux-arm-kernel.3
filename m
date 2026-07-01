Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DDEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 01:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=; b=IrqZfaDRf5gnwU5CwWQ7CMOOsF
	GCaoJOuqyczfWaIh0XjBWAUC3zzaDfbyjUxFdfVQTYcZPUuE2k8pSLQwlRe/V9wKSEgXsbXdVZ3JD
	4dKokE6tPd55uS9IwE/+ivw0WnPWdV5opKzyFjVPJb/hgxtVXPMZvFvpRUvMKGBjwjGbmdWcBAIuw
	h9JnPkt3EYFDNqgkCUvvhc9CbFGECwEAgxyGLARVVnx/q8F8l8ECkp4Dv+bU2nY+S2CszX5JA3OzT
	Ne1X/zBD12jgUGVjaNgPbt35FF1SVjQQ0v6TWe62sQKKQDmm0C4CH2qHEi7mlsdNVA0oFHuKxo74s
	XdHisAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek9j-00000000TZ5-0nSn;
	Wed, 01 Jul 2026 01:54:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wek9f-00000000TYP-1r5W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 01:54:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6610ufoF3682515
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 01:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=; b=IxQnoBnYLCE0xjJ/
	RkBsQiaBvM3+mcEbx7F+Tb4QsRG3As3v4rkSSbRPYOiyBf+0wzyOZGG3BWK1Qbwj
	0rA+aL1mmQS882X+LEueytoEVA9vSuep7o4FwaahqgMrBURaD0G6i4YxXsFx/pkc
	PkGs681eWtn3N4v2uP9jiXu0Or45gbkxbKOy2QNdj6htApD0UJsZexW+NjnYjREq
	vnyiwnZfsXScTV/vohSABBTLguj41SezfXy9z2gmxu/kpYj21tg7B/ZjkD7NBOd7
	N5g6AAfd/D+hS0ZlVgw/vZux3o828Fs5yUX/YzsS38c88/dAo2/EbBwbcoDudv8m
	7CsbcQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy04nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 01:54:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca0d4fb061so1886855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 18:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870861; x=1783475661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=O/obDVKsttC3Y5mBXUbwba3JYwnyK6kADJSm20ZRo6w8ToHcJqxt/2NN+uVUKa7w8J
         jfBLzrMIzrEV0oT37h4PqV7ify19dU7/CLJorRHltgSr3wfxM6kRqvvDhDkS4SuVrWdt
         QlNSYRfJbzLC+2RdfnvQ9y4OIG4IK6RqgLablzz9EtFSBFKMug/ISj/poVvnbmcezB2p
         YW4Igo93nsPKpBMdRXMVCyKewambMefrk9WxBdF3aAKNZUn4Nf9hMu/vKjkTa/nKZJRF
         w+kNEbaW8ni68DSfzSNDZRMH3YGKWorwIDRCepP3d/q65ux/2fath4EOTTnbnl6mKD6+
         grhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870861; x=1783475661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=hmy3vzBzlwIvflukWLyQI/nBLpREamg/fFR3YnvdhTQIDcaI2m95e3apcVPy99gdtE
         1GUEGAp/R6aqedfNBqhVEoWM9z6zKL6xriseqRLz4+2EZEcCJMdO/3YW2OB7tsK1/Rdm
         IPsqGAFOxB7oErfFvOj4YuC6j3UtAQd8d8h+OtD9RRvULVrXCzXdvK/gkErpFwljXIPa
         L+xun9B0Chs+aXyCqB+OzGIM1vVp9k2zjZgfSECwQKym0FKJXbAuvFSr+PQpGxcNRmxJ
         LzeCpRqpWDhxUpnV3p6FyVkp9Ie2WXVGIIOdr9bVlzTg1cEPj8aD+RMAbYpkE9ISC1Ft
         IP9g==
X-Forwarded-Encrypted: i=1; AHgh+RoABJgT39Wus1d0RtJMoZFkbgg11FDMEoe2LydyFrDR4orNb/VdKubIZsMAFu91v+OMYnVhc3kC/NJQ43Utdn/H@lists.infradead.org
X-Gm-Message-State: AOJu0YzR574P2KZV/054wwLQXn5EW2+srBKjWdp1KiRS6MaAxIkEI5zO
	zlOLvj8XZKB9Xgc8JJZmuL2mwsCkYOL1RnCmM7/cHXD7mD4Ha+iX++ikM9g63VzoLH403F9heBs
	hX3vC7WVcU+bDuyCVGEE0Ipw9DxG9mgADy1TVlWxoM+jIN7YhQthKstbudnRJMGROop9wW39IAr
	HLlUSridc0Y4nR
X-Gm-Gg: AfdE7ckEitCzFvJ0mMh7G3wE6Z/f48mLlYRq+CgFWNUhUJg1cuhQSZi5N0f+8mPFhVW
	jDvauznnkyoEQ2M18WE/s5kGX/Ac/lDLWo066qSQHa7rYoVjilskBL48NXxNR6fyZfN7izTCzBm
	uq9s3LI/PNEfuGCQJdhJmiN4ZQLy0/tN23GC5+AbEunDiwPa2RodpdD5RPAfY2mG7Lz6bCWOmZG
	OvYy5KYxZlRAnzjQ3zEZq0KOfL4/V8YFYOHpr660kRIGhYcwnzpDfevGyXoDXf7mOpyAS/SBitt
	vO8lQviEVxYdsN7V1sv8r3sFXsWCEkQAIeQIda5y0n3Ue4tKgUU92ikmBmNQxDowDzV87LEQjv3
	bq8hZpDwhAAhWmzII0vfG57q+p0JOkSXjfbXNdVUk4684Qhm0x1CuYL23lqzNngB4zfqdHhcpPg
	==
X-Received: by 2002:a17:903:4405:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca2ed3225emr47983555ad.28.1782870861303;
        Tue, 30 Jun 2026 18:54:21 -0700 (PDT)
X-Received: by 2002:a17:903:4405:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2ca2ed3225emr47983195ad.28.1782870860759;
        Tue, 30 Jun 2026 18:54:20 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:41 +0800
Subject: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=2337;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
 b=+n0qnK+pFSH04EldYDI+hf+Zxgas6gCR+hrbok3yDDi5msmYlbV1vYiQa2ihdiT3LHOdGn579
 KLEO6OdJqi7BV3Vi5aDpmizSZHWGrdXVuX9w2gJHpTjKc3GXEstDlp9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: VVQM1oPzWjVfAJu7_AyeAy3RIspcLDrr
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44734e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SQ-coMCA98RGVnoR9hcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXyhbU0MtyXs6r
 pUOJuoviWx8sZS2fx9RAOIngEDTUR5QrWYqSqHHpAd9sOoLKbW0SS2MLiZiCkbPtJdr29AAYwYm
 N4YBqC3qV1Y+PA0VCQFmk/Z0u0zo2ttAc0Rtf5V3PgmKuwUexMqZgv0Yq0Iy6E2f2ihOxwJ5h4Z
 0+ynnaXy5gD40jGY63T5RF8srhnAVjFH0PqgZ1tASjGaOtVBPSjPpE5p9a5YL8UCrSIBqegBScm
 m0k9Xo3AjpnpsTeJxvyw8pDsP3mgqaVpbnOXOwhCGLeSHT6AAOjWBnbxFBsdny0I+yTXadedtij
 hxEmFseHa+x87A2a7TWyaN4g70jCyRGcrf5tjbVR45A4qMN+x65DII/AqjHiOQqZhi6xLz17qV0
 0uSzD1MQS4/7/tI6sIXK/fQWnrTSc3n6cAuhGH2OgAFqI7+wxXVmmmqkIY2FEZL7Z0Ob82My34e
 5MW+IfsiREmB1haOMgg==
X-Proofpoint-ORIG-GUID: VVQM1oPzWjVfAJu7_AyeAy3RIspcLDrr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXxGEf3Rk8u9Ee
 uKrTXLYrfQ39PD7pQgmkhINbvz8OaT5AxgkOaEVUWRgGkn53qnztRA1bIdILjOn48v/1h4wqapy
 KXg+bKXGA5aIjpQZ90HtlAdygpt1k8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_185423_837697_B43A7FA9 
X-CRM114-Status: GOOD (  16.23  )
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

The TNOC compatible previously only allowed the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
AMBA bus.

Convert the compatible to a oneOf and add a standalone
"qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
standalone string carries no "arm,primecell" entry, so the device is
created on the platform bus instead of the AMBA bus.

Add "qcom,coresight-agtnoc" to the select block so the schema matches
nodes that use only the standalone compatible, and add an example node
demonstrating the standalone form.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tnoc.yaml          | 39 ++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..7e6e4b17a6c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -29,6 +29,7 @@ select:
       contains:
         enum:
           - qcom,coresight-tnoc
+          - qcom,coresight-agtnoc
   required:
     - compatible
 
@@ -37,9 +38,11 @@ properties:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: qcom,coresight-tnoc
+          - const: arm,primecell
+      - const: qcom,coresight-agtnoc
 
   reg:
     maxItems: 1
@@ -110,4 +113,34 @@ examples:
         };
       };
     };
+
+  - |
+    tn@10980000  {
+      compatible = "qcom,coresight-agtnoc";
+      reg = <0x10980000 0x4200>;
+
+      clocks = <&aoss_qmp>;
+      clock-names = "apb_pclk";
+
+      in-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          tn_ag_in_tpdm_mss: endpoint {
+            remote-endpoint = <&tpdm_mss_out_tn_ag>;
+          };
+        };
+      };
+
+      out-ports {
+        port {
+          tn_ag_out_funnel_in2: endpoint {
+            remote-endpoint = <&funnel_in2_in_tn_ag>;
+          };
+        };
+      };
+    };
 ...

-- 
2.34.1


