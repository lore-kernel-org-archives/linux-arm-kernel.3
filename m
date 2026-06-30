Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=; b=KxYO+dH2VRIvfex403pOOinAEB
	4NrVou69U83TugAHFTX0dGfSCavv2a2dnDYyh+Z08qf2I39S98qzHyJW7qXkW6+naebg9OtGbjn2a
	UKpqJScrnjmMa9lSgtNCulTxDj2MAv00kG/HEUgc129qfJn+GtuDcF0OGwHXK9O85ymCf7Oxa7hqK
	RCYGHmiVOCpm8GwwxGBqsGJ3uiHaexOxPNU5a5rNbziBMEcFj/2rfdO9b06+DgiciKPqdCXJclplo
	uSxKBTwQG98s2mEObxbiejO7LrViV8XTFB7yo55XCqB73XqCq2dJEDILB8/hKv70J1UKJ3LXwWFrs
	nnyPqgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVpt-0000000Gg7D-3V0z;
	Tue, 30 Jun 2026 10:37:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVpr-0000000Gg5i-1sF0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:37:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mqka1611625
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=; b=F7C9rrU4ADibeHIz
	LckDKVebRoZ/eetdxIPh3GNAbmwnBinVxhSnzms6a9OMatwHo7RvVvVIq1nCRbU6
	un9Mu9FV8CeUcsf9IMHbsayGfbast+pFQ8QNi1tmle/RCgc/vg9GLgGuQypsAaIC
	+jLd2HAr9wR7nmglLaj5qKunaV1dnFKnpyLydxE2Pxns1JRrhj3NV7nzaZxfnJOr
	NPd+FwWBp56uz0Aawi21xSqrBXtFos79Y7vZqpSv8E7Jw6KhqezkrGOE7+T10tPt
	xz6XcnAMFaBF2GUkYVZl99WGZGW/X2NfMjJVdSIXCifUEbV6jxZx58xiJzHnD0x0
	ZutLEw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gt441-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:36:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8894570b58so1809922a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815818; x=1783420618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=EHj6Sm+mCuEpshL2KiLYCV7pgsDa10B9dyzSxM4u38v9rwSya73lTG/fgmn42IZKqY
         TgmY0MJCCUcdXfkXjL1ViSdfweAnCxvjjyUhKG7i8KHXK4hXYFbuX1puEgrKq0Zq4+UR
         5tIS0xNNRWQCrxYTd5mvDuE0OO+HzUKV8Pa0ORqhrIwesHKHTy1OL7xg2nLq4ep2r0zU
         +IgKxspz0RbkVmEQzq+227pori9hjzXn1NLc2AeJMrFSvBfFizgQ6pPC7/X4TVKOSFvb
         G74LjdQY2J90bY2jDQCqZVs5IGNno++IkL9R+CnjnAIx4P13zXLIICtnVsgmzp+UXAXV
         3L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815818; x=1783420618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OW6Vmhq2hYKxcZ5F32cGo7Tf3KP7sEpbCxt5lROTfXI=;
        b=N05LWesW059pUoJvXJ7CiRrM+UBVGC8Cgm5f7gs+EB8jfQp1azTkL+7qSSHdigPTxW
         3/m6NPU/py8gWgyrcRRcLakWgUK/MM9peId85qWTl+/lTZeF+IJERbN7jrN3dk9TgA7A
         STUA3mrhiCM7I4Lw4Kd5vnLOWjl0BNyavtNAzHMqJRtfd0Q5XgGjh1zHlkKIKkKLPNvU
         fdEJDGg6AKvxW4Um9RUlDt/7H9ADPWYWio7pqnnHouY8Mg3QNG1iwyOaf0Rsb5Y6qe0k
         rnE8AjOb0CBK7vFYpeHxiQHvOmaEm1Sbr9tkfuSmdaQ1kjSn4a5ai5P8Z1RDKwibITCi
         HMKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxC67fO9M9+maBK09WMUpV5k2sjTzmDdYz/Wx4AV92TSlyW0nq9y+G1bxlkmqC1Tzc1q3L4mWnRIGH1MEH0Ckw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9B9dVusXqqXFO5JnSbdxAh9ESsSkwVcXQUfsGEfWvIvc2gV1P
	43O6WslfE5lNz/9+1qwGVGsmI/yLPUNNlwW6aAMACMqPmAzwAdB7hYT6XRcx2i1j6dmBz/lrCXy
	Psngf6VGdu+0rhvAeGWDhdcIRuRBikIr5lvpluTY3XQkCct4aYFXX6+8mqdhYizpPVYvCJBE4O4
	SFtQ==
X-Gm-Gg: AfdE7cnGP82V+h8/T171WcEvVOjAPOEeQ6R4U09e1+2um12Lut+72CWLQd2yd9enij+
	cD7OJOS4std3L2RzYaMTJMoiNJINu6OSSW8Kq3L7xfw1dBp/B5rnsVp5Hf0bs8W5JFTafGFoe8d
	8QKlhwtz+yKSECdivrm3ZGWbyJbenLiuDdSBMw7Kfxpi95DAGqvOr3Uf3/RB+CPG6v8xF1QfHZR
	1QvdXxQXjsOGnemIew+7oMokmKEIX7mn8tmpx7ytPEdQYOPfLwGfB8/m60dt2ATSNSuIWS5VPcY
	/OWFDCby4TOQ4JCmnjV1625jt9gWifLFMKtmnMC2DNl/+29I+Q7+H/fnxVw3Re4TycbFi3/0xSx
	K88djxCoscVFRpzOJM3pY5NPeGUFqDeBFX1Wx7vFmhhjznD8WgH2RMv1w4eZkcc90yx/8QAq5fg
	==
X-Received: by 2002:a05:6a00:4b56:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-8479f277e17mr2455248b3a.48.1782815818050;
        Tue, 30 Jun 2026 03:36:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b56:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-8479f277e17mr2455228b3a.48.1782815817616;
        Tue, 30 Jun 2026 03:36:57 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:36:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:03 +0800
Subject: [PATCH v3 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-1-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=2337;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uafCeCPRUDIbJ3JsxlFN0G6VRVGMk4SKQJs8XKTSXuM=;
 b=JIwVOvTjthVWmGNBgjc4DfL0E8A502LDkwLjqcBDlBCXBDdgPBYJ7z3UrL4Kh6ZKCrs4WxJ4U
 wqcw/PQKjyiAMCodp+1nCm6qMmcEtKJo4U+B9xGEvhcs1E2388xMy6D
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX7BD66LH+/vNQ
 p50coWdeVJMTIUPvT+6NaE7fv7ZHtHl8w9/eG7IxZKQARao96Jv32NVF1SmPqqwtVUnnVoLNVqx
 XzfyJEQBzYaK0oB63QV3A6amNp5qzZ0=
X-Proofpoint-ORIG-GUID: 6r4XVTpO7A7nF8wNvpcyyTDdZpBg5IFv
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a439c4a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SQ-coMCA98RGVnoR9hcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX9tvS9yt9fqjU
 IwI5nfiq6BkCA3OH4SOsr0IryWCgyweS8W9tmY2DiEh5eLM01yHWpGPWe745jIWVadS2N2qDU/2
 a3zC3r/NNZ8YAOBo21+jj1niq1NfMgrT4oV6Vftp4LBcRI0Pp2wjU91rOAT+Dx6ftqcm/C7MeY6
 TP9frontnAs4KfyQnusl7rg7eID98PEuAukaqxv74kQIkj7d6PEXa9HJkC6txw0StFnn9rrmrDE
 pvKHnubqOiFDhNRbIo/ZjLhXNl+Dzz+ypmJsazASvk0Vy/MD8y3/tcHoTMFO3VmtQH7zotB7Sub
 kBmXAxk8p/d/Gb1qToMiSbX5mcVRtyJVWLdFPLr41GdyY+ukWt5V3QALMNl3sFUEkFc2RHEqfvz
 o+2+HbRK4ZpNjzxHOj2q6uDOmVD/XTcyrWJrLhgNRyjnwuPINybFTQd6rn29iiZdsQdCb61x7g1
 as0TIvra5/cWeSox2qg==
X-Proofpoint-GUID: 6r4XVTpO7A7nF8wNvpcyyTDdZpBg5IFv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_033659_510980_B148713E 
X-CRM114-Status: GOOD (  16.06  )
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


