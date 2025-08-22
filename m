Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9468DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCwy3dvuIrMdK1MGJRfo/KSQbLvNU+8cRJsdk8nhlss=; b=TqAP/zx3q9XD9fU8aDW9hw6aTc
	HWRmUkUGnz2hw0iaf0hoGxvaphk3q/u67167lOBgXXndyU7K8OnicYYbKm1Z6rBOR6d7H/0lPXVGu
	jmDMyg5J2gGOTBFRzl2hoSvK0VhB24DVjGnVToLdj0DlLaTnzuWe6uL7r4mJaFcdy9N9/f+Bx+7Wh
	hWX9EV81kP0RPqI3Na/uhPRYbVa8vOykS5xSBovTFmU9ZGLpgvkRu0elan4KcUIf+eaBXLL2U3U8u
	SLgPglaGYH8gDxHBBS8oYP7ou0/SoTa3oTT2H23V263K1drjQhio3tQ3vZ8Y3lfn3U1kImDyz6qV4
	e/xiKfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTZZ-00000002zrA-2ocU;
	Fri, 22 Aug 2025 15:20:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upP2M-00000002Chf-3df8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:30:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UL2u020890
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gCwy3dvuIrM
	dK1MGJRfo/KSQbLvNU+8cRJsdk8nhlss=; b=boOos+9CSb0d7q0j2KpZIC3i8sx
	Om9eaEQEiOdoPPDmEtMO3Ym65g96W4d/O3nxB4YM/6EYKea06xwiEUEPt1kS/Vch
	0O2G0NOXDP4CvevG3gWcMQU2Mo/7BThNNVIUKCo5ozl49Vrt4sh/qm58Jgpslfya
	iZZFQlecBZxjDvagnLXjsmRPhRHLVdI7mWjCsnUg/1ZKVmBMo9wtVfR9lbVlIMDv
	ukBQqy2VnGxC62Q1gF2bLMo0k57yWfc9VbxwfT25RhC/34GlTeia1g2zrcK40HqV
	EWanCILbUrPVpjajBnk6p4jz2tpId6YXhFetdsC3UJC+xQvPwzxvjGiMjow==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290w8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:30:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47610d3879so1686798a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 03:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858620; x=1756463420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCwy3dvuIrMdK1MGJRfo/KSQbLvNU+8cRJsdk8nhlss=;
        b=kUMzsBNIf/hVxCW1KBQnYlFimwE5FfHz4hqFL9ppmUtUijfZRmIKQoQshiqAe8raZR
         8N9N/KofSOlV83qHjU7jai7M/xHC6B2BCRsMpE8EAwh5jkn7y32NYU5slwc6zdJ/BEIh
         949RCkBajEmzkF0BXgv1zbKHVNWWMbZZLsQXfQjkHazZdO4ETxFaQSIiN3yMrE3dO0Zg
         d5qFFnkmbYU9WQDDk5Oyw/bBWR9ObneB9YrnzX/ViQQaFaGlhsPR8/0F4MszwWr1H0XX
         r7uW4I4UI6CowYJcKNDVijndx6Py9AXiq0etw7SeMP2j9+zqod24x63NjUvnHOqDx2vD
         JFJw==
X-Forwarded-Encrypted: i=1; AJvYcCWhYvDdSWPkPXodGT7TglLvzU+M9wlfGsAEJrMab6LBtaqN6/XL95Lonv9F3N/tS0+6Srqhexas7NE7WqvKWYj9@lists.infradead.org
X-Gm-Message-State: AOJu0YxG+aJ1uH9Fc3xbX0WVXAo4vBx7ixvbWOth7Gf8vVCgrVHSY9f8
	Ouu1B6ChCiymcoqZThBAzB0NqMwTXRM5Me9/klw5XH8iRIOH5lHYTeTthLZOULdsvdsjyGhNsXT
	zHx/1QjcFGjqHKJw8WBi7L9XhSTmrG2x+U9riKLTyRBU9EXGGfCJwq2AKJzrNZTP7qPYrlgrmUl
	vAeA==
X-Gm-Gg: ASbGncspfIc6CMK6rkn17A3o2UfB58XiW6BbIF8qbhoD7JY/AsUrlpmSY9DMu94wHbP
	5Kl14NukvDlbkSO1U0oJlGUnWRMSJ4GB6NiwveJV0IpmsXmnI4X+ctxy/wziZAjQi9KlN0AUtik
	jCJfiaeovwmgWAUHUkbdux7EEUVtIBn9/IqrGe1ebz0nymq7Ee2TkDVEAw+SuAEvSzVVspsL/VV
	s1G0QkTTcV+cfpicncuzkXRQGaeJFk4nGw3I1WA+6bimxrzQ4Up/5DUIrTuR03S9zvNKNXBGH99
	4EubTngh5+jpqgwccDCD4Ejk3WGx2GIj1IME3Jps7s8sCD6PCewwmn8Z68UllhMzfDYl4f9uC+b
	CL2Uih3IMqzX0SZ8gSwDi
X-Received: by 2002:a05:6a20:7d9e:b0:243:78a:82c2 with SMTP id adf61e73a8af0-24340dafb84mr3496885637.60.1755858620417;
        Fri, 22 Aug 2025 03:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9UES8ED+cVPXc5NWnC+wayYDGQg0OQaM2qTYYN4XoyrxVTdh+n1/tYchJ9/zAVN44IosS4w==
X-Received: by 2002:a05:6a20:7d9e:b0:243:78a:82c2 with SMTP id adf61e73a8af0-24340dafb84mr3496841637.60.1755858619984;
        Fri, 22 Aug 2025 03:30:19 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fec0e9sm6825196a12.24.2025.08.22.03.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:30:19 -0700 (PDT)
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
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: arm: document the static TPDM compatible
Date: Fri, 22 Aug 2025 18:30:06 +0800
Message-Id: <20250822103008.1029-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a846bd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5Z_N_GBq0btHVWfAyk4A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: JQMqGB2DsHb3wsB-dlYp0if_gM9FIyM1
X-Proofpoint-ORIG-GUID: JQMqGB2DsHb3wsB-dlYp0if_gM9FIyM1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX29zh+t+tVAJi
 z7hJiouxArCnK1JBd+1/IgCgrtIFyO7+FZBREP6ENMTXe+Lpk+KxPfzhzxuon6Y7gvYv/6PLcpP
 OI9C6zBuMoe1sQpgj0kQPkC2ZGmXCNeyQnMw0kK9H3OmKGbm0/f9ZQR2Agh2wHr/MRlgthEgUOF
 Jpj5nop2nklclEApQIveLVTYnD2BSkjV1tVfLl8KhjXZzLFVGPp5oUcGMwBXyj98wV4kzj5HMNK
 Tt+e/V+EqERV3Ig/du10aap5wNzUSsuDOVoF0T06riEStF6+mUFaYiLcTpbwYRG6vh008ghYUjq
 uwi1jv9fVwmsB1CZJV3EohYvetGv2exbgY9qoPjmdXg98whYGaUyjw58M63B81BIg1+R3a4UV9b
 lhDG9um+qM+YUIlLBj33lezNmt+K2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_033023_022957_460074B3 
X-CRM114-Status: GOOD (  13.23  )
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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-tpdm.yaml     | 23 ++++++++++++++++---
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


