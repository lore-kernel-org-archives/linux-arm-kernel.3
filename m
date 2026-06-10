Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C901CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=; b=AKp8fxcEy4vEQNnnPfNpKQK3vm
	ZDkJ+v+zBS6jK8X2SLxwbP5uWk7ZpBgDihspOoZasTtoVEpD86P0N1WSE/28cMndSZG7cYLqyqpdE
	YpDAgznoqzQPB5/aBNSybTyPcCrJKQbBVnvUlCK++cHvxXO1q3gb3fqH0dfg6yCtLNiqR/W99je+K
	gCqLdXx/OsJlfSQn285Myn9rOpUoR5ng3piy6mQEfw16w/fEJ9ILLnBXPMwpRx3IMhtmgjd0Te/1e
	T9KWPv/XtUMqU2dH16Weimwm81+aiKoIktyF6zbE5mCqEa9c9f+YKbY3CG7MnWKSjPERcpkR31LLs
	qAP5JTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfV-0000000788X-29X8;
	Wed, 10 Jun 2026 08:52:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfR-0000000786O-3Zpy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:52:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7ivlO997673
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=; b=SzEek9swZ6J6/ECf
	bKW7lZmkdXIvg+fvKngL654mtW+IW6hRewwFFGe1BEfdD5UvcT1yxSJWD5SYImFO
	U1WDgy01dPEfig5PnVoC3ZwD2BE5dnjam0v5y71ssCYLciYmLgKyaKgTayxh/COF
	RjPs+C/RvueYvUBvj43UujPxevZdhtgjdnJ3aqUKbyl5iatOXlZCvNmI9ZzQRbrE
	pQ1i0j3XN8hoM0MzzFfjLnqmEXKdZRDEgjFalu+YPbAxMV3t50b3tWYM8f5pf/As
	WU5Cek7V/jBnLdcnX5s9TvRDNWCRK3X5IBCbohs+ViV72OkaWA19NDk3N/Pz66o1
	+BLruw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8x00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0a99db8dfso71159115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081528; x=1781686328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=;
        b=JfE8cCznsJk5lb9Vvc31FGy3CB2eEOyGCX5u+gTDZGkiDxvgarzVxl1cvP/M24dDt6
         0OXmqdRLyEisAx5BC5dX3nDreEHCuCAQt+LegCrrQNk5UfDC7DGrAOnzJmCc/8kyPwz1
         R2QDDYfw9E5w3ku6CSdTDkm8naCR5t9gz7lBeWd+4c4m/u+Bo0tfJ4/434tQE3jgN36Z
         feEUF0M190NM3mPNt/uzGrX1rrRp3KAIaBflQnPCJYge3ASfVL9O634cPtt5wV5c+3Qv
         1Wkb1SzGT0nk0SVy6PsxSUuXAI76JBfd7mdsa0j+wOCJSc89QAzOVKge3oCoFfvN6uEV
         e49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081528; x=1781686328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r/YHsMyj/Joax26bhA1eUCPnKJSQ4Ljj+5px71Gw1Tk=;
        b=mojn7i15wwL+uCowehG8Jdhiu6khtXqNmgUDHvLqSuH+q4uS96eAwP4of8XILDkg7j
         tEAOwrX9S8nR7df4WU2zYZmxy6n44VJ/ton1yo/acT9RzwYna4sAMtl4PVU1XB4LgeFi
         9LNIPpUpj8XAGQotXncc/CflcQSXOxMFycYW4l4Uyyt4IEGJBQdBzvSq/+vTK/eXkBKy
         MTfNQhPd+qvg4zdDp9A2VdjgnE+KRsf3jiz4dvsvNqnwOUFVnHVFDN/KEYxXBPmDUE/x
         lA5Ndg9pAMwscpLpa80fcrRQQA4k0grpuiKjcNkMegKHEO2AkW8d8z4DfgjxJnYe5dKF
         wPag==
X-Forwarded-Encrypted: i=1; AFNElJ9IPNDg2qU/xOAmXQ3zEKNQ8hSx+/1Afpox2W9lE2jLpajVielyVKlgayo6h7cEJE345GMLyQmGNgvOssV3w4Fu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn49DVqBDC/e9N/2lxWs0ADZOHMzfm4jHVf1xIPDVc/6mN+w+t
	4kMb2Q/pPHWB9ffJSJCLtUdf35BX0RPmiqSSQhrA07Sb1/Di0fct84iWJ1MUOsA2bpPTegAMcW7
	3NXSku3GsRGbFMpKHoTNq2SAZfWgq/+jL317D/zxTLJUWDjTqF0Qcgm1HS+HrKiPhlMD4243AUV
	+9NA==
X-Gm-Gg: Acq92OGOd7PPkfMVF2Ybk/Qyr4FiM02wkmVdy5RBW8k050i6pzqTe+tL8VcX7N8pTLx
	PwDUJXfsI4rmXLpy9tEB9UHQZcuUPpoi0TVyszhQ2ENc2cii+R1rRhXMOKcT8jQojafgzQeoEMy
	4M8prOILWng8J8WgLD+KXc38xzufukG1qHgVK4dK1YM3qPBW2W9y32LniSqjeyLfe5DcBTN/0ct
	bjVc3HIpoh+5OzlSF7y+lGuVQN+C7w2Ns87xj1mE1y//TpOtsoZpb4V54O+B/5MRYYXjqaVZE60
	TcBSRJSv2+46FesZYW4rpAozSn8I3LZhhuD4wgqpIn15WUPYHOYbv+4vhTJSwy5hY1PKNMKG3X+
	GxqtrklG7iTYH8cLCaPT/CA5Zw1ID36z+SNQR4yjwHrVrCavEP1N3bM2jmDJ9JwWEPfXdvd/g8a
	MdAPdCB9o9A/o3P3LUEOXns+iU+PJVT8KuYzkafDioINoNpLvwfTTtoahtFq4=
X-Received: by 2002:a17:903:2b0f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c1e79f68c3mr292218005ad.9.1781081527642;
        Wed, 10 Jun 2026 01:52:07 -0700 (PDT)
X-Received: by 2002:a17:903:2b0f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c1e79f68c3mr292217545ad.9.1781081527194;
        Wed, 10 Jun 2026 01:52:07 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:06 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:29 +0530
Subject: [PATCH RFC v7 2/9] dt-bindings: firmware: arm,scmi: Add Qualcomm
 Generic Extension Protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-2-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=2124;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=bAPfzRfBHzCxb9s+4et3S1Cn+8StBrf+NqoLHGPL22w=;
 b=3IHb8xgfodeZAAvSCSF4qHqkSYryDWxcbJLlvj9a0b0v5bs3O9BHpGV7cJ0/YiWVycOereh7W
 bssXFnSFdxCBPUYH+4pHumxvGDs/0WVyTQFrYVc92HPIzicZlQHM4pP
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a2925b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=4P7DloUKvxegLOL1_H0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: i9w2UxD1eMAxao-G5ZUm6d3VG5b_bdp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfXxM0aXf/QcUpT
 LiBQDrN3s8YXFfqfzTTlk91nIpgU13RnZ1fvyyEKzVipH3UxKZO4tdRA1ytLicsD3ADcEVFmxLj
 OY0OBXkwRZiHIlVc+tiCUz1kame2RLBrb/FP6aOf9Sk/8b2tuL39APmIGhlbk1czit9RHGqOAt9
 hVFekUhxUgIfP5ormQQnz8bBz4fO9HbdUWwp6lncfssW00oygZmPf4+XusLZc4AUue8FV/ip6oD
 ZC04G6qwuMyf/slP/mwqM0TkkmShXKbtARnN4BjF1Km3BA1wfhRpm9qOkZxKuOrQwbINcuQMjcI
 DNyOL3Y2sqxGLQajgbWqG55m+h2eTHgx0Zbgj06TGvoIkr1Juce2E0r/S7O1U15Q4FqX4umgyn4
 P13jNlPH7oOj4mre2iZyDx0R3ci0JQl2CtDlDGr59LK8oAYWMrpXvJXXqbsfhUFQrT2RmInjxYP
 OOE9/g6PH56/b1s4Pdg==
X-Proofpoint-GUID: i9w2UxD1eMAxao-G5ZUm6d3VG5b_bdp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015210_017506_EF0D8B4E 
X-CRM114-Status: GOOD (  14.99  )
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

Add the binding schema for the Qualcomm SCMI Generic Extension Protocol
which helps support Bus DVFS on Glymur/Mahua/Hamoa/Purwa SoCs.

Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  1 +
 .../bindings/firmware/qcom,generic-scmi.yaml       | 27 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index d06cca9273c4..aedc57dd3b38 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -24,6 +24,7 @@ description: |
 
 anyOf:
   - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
+  - $ref: /schemas/firmware/qcom,generic-scmi.yaml
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
new file mode 100644
index 000000000000..077653dc1cda
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/qcom,generic-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm System Control and Management Interface(SCMI) Vendor Protocols Extension
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+  - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
+
+properties:
+  protocol@80:
+    description:
+      SCMI Qualcomm Generic Vendor Protocol which exposes a number of
+      Qualcomm SoC specific features (such as memory bus scaling) through
+      a mixture of pre-determined algorithm strings and param_id pairs
+      hosted on the SCMI controller.
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
+additionalProperties: true

-- 
2.34.1


