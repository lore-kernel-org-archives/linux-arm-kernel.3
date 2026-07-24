Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C8FC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KcTwhi8obGfuKLj8dNnCltx59+O49u6DXb3AWbAy+A=; b=K94AZ7rD8yYg97RCBMUptPW3Ou
	L80BxLl7KJcMnXq02O+BPUrCgVJ/o7s82jqxEZp1axyoKJEMmy4K2VV0fMb4B6TUOOh4CVIyzCAlC
	wtRayzQGLT/08xLZ237eqEU1nfBFUtEUtftNtThbo+3iVrhXko32rF6HmMbUqdnADc3/CFiaZ0chG
	QJBI8nInyDferPh3chZOUfIaSFGJA+XxBfzDTXGevMIFmVelwXP7bW8wnEmGGmPeg69duh0VGWEAv
	fsfQQK8XC9iawsaAHGlZsXYJG88guRU4scksA6WAs3jti4lvIJ+O7Ro+HXfB4BA/SBRRllxz+eaOG
	x/qTsOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnABe-0000000FgH5-2AzW;
	Fri, 24 Jul 2026 07:19:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnABW-0000000FgCf-06rx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:19:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4llu22125454
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KcTwhi8obGfuKLj8dNnCltx59+O49u6DXb3AWbAy+A=; b=h+Inf2ZjQWvrPiCE
	chmr1Np/f/lNLp1yYpWVdXgR4z/nUUVP5nnCdeUQSbDL3mktBPdXXj1jT8WeIiBN
	0jtg8btiWVXuEDbR+ezRdxqkg1FukelNmq7P0Gk13LRcG6+yxu8vyU5A0k6AX3a+
	k3JTuTSD+WJDKKCm+vbvBy0pUY2S6z9Ml3jHttP+xlWZIlq/91mB7Qa6wRApDgYs
	95xOFBCHTPL4+8A/q5ZP3PumYh4nncV2oUaG+9FOdIOP20tITKC2yTZ3sCcKiYvc
	ZwR0NlqjFTquiaQtV61tAG1S6zHeL9JlsRvi4ua9uKhs1Rs3+/xaF08340ZpEByX
	yLNWoA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamtj8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so226665a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877544; x=1785482344; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KcTwhi8obGfuKLj8dNnCltx59+O49u6DXb3AWbAy+A=;
        b=EnVSk7GjykpmyMpb7awsc1C93HM4ATZcTnPoHK3RgX2xG0ln4qhFd1SYI0121Gz7r/
         lgL89ysA7TjCtQl1P0m1QsVOZYiBzbI7NFhfsZc9NsbnDCkocQ63L4O5BM5vS5HS6yIU
         ARw68/hCXHh3Dx+s3mMSf9vcz6O8VbbMwcEH8+q3eKi7fWA8SLc8Si8ROT/xrNcGwvaI
         XX12806wxlZDVVcrJK2VxU4ePqik4IVIpN8qV1Rhgx6l5Fh1QaqEEfl4imXUKXWr4dqG
         nNC38xX5PqsPKJgoXTXb4vd72C3+TaeK025PqxszLlv+AS0FLPU7+XL/UbH1bJv/9+ww
         +IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877544; x=1785482344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6KcTwhi8obGfuKLj8dNnCltx59+O49u6DXb3AWbAy+A=;
        b=rwztllc83G/azfB/B9ZiqHeBFnKZ6lTWwKDg0ttarT1zPYsqQHrVwxJP++FrlQ4Lli
         pcBQi+hg+0OUd2rTdo6OGS3fdLnhXHT7RVyiFh01/hZpwlRNX3dZUI1BYapLqiI6V8dy
         /c90lHMe+sd+ja9Gr0zIvO9xsXWjdD+0XgTLwFa2Pm1gMV/jiX8ws/WbfqpEMKFmgXSe
         9lA/MyUQzFf55FQpea9GzN34vSB/T77K7o8zbEnZrl6zvMUxBE3OU+pQZTBWKTUoDIYL
         ji8UHGM4xQQD7wvET64eM9IH0P7nn3DlV7ZKTHVapXYPG5ycWYoeCUnnciEYLPa8x66x
         3DTg==
X-Forwarded-Encrypted: i=1; AHgh+RpNFivTlvmev0e+AJIW9+PahnVMhrIq2sv8xpTnZJXDtQWEzq8BNCrCVZ64azb2+1qx+DFIqN/H/W0aLC89nDLB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs7TgFBEEZn/y344C7MGFbYan4+vyuh9b6e09Clwuxfg0akked
	LyYicWt7RyCEpvtU5dpHjcM4gXV6Q89Q7s60tm31NJ13klJEwA7Ou1tr4M13UpbDCKlUEYbHiII
	lRC9ZQhWBRGPYY3XBr5/ny5d3XjYpKDDeYBsN8735XpqsTz3RR3jCvZJ15MJ4InHrQ/53p22WQ1
	tHjw==
X-Gm-Gg: AR+sD10tymgv7rvUREdyol/2oL//ZIlKyykZVV23hOtzDWirV87bnzQXeyeVUGiAm83
	HPoRi/PWXgLzzkIKrULiIfqnKQ2qWOyTmcqRZuGafaNhh5Wn8zWyYeBhdE5F2Y9hnGSt23xyPAK
	aviHIAJU+aKY4dmtirbVobQiquf5UBF1i7ZPUjtJkOvrx1e/ytI6+5HcqZfhcJcuCxTBNv33ZiY
	0KUci9VqPOSPp8it/NOU1zxT9AfRyhS3Kf1x4/YjP3ogUmEuGRHqCfQUcdujqqZyUnhPUoyMnUb
	IDF7AyklhkqQXG5GWtEqFW9G1scnlsFua5y/jiPA44LUjzC6S9ji21adWTejnDdLNxgqQxiqsF0
	W4GrtxAeTmmn0qRDZPiBfaLBc2OS8GZcbaqpC46Kv3VuqMu/Esp+MDS1QHkWr+/KiD6xHt11Ccb
	Ze1GqyALQ7iBu0Rt57KCA+S8YDTKE=
X-Received: by 2002:a17:90b:4b08:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38ec65fc538mr6150333a91.22.1784877541279;
        Fri, 24 Jul 2026 00:19:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38ec65fc538mr6150131a91.22.1784877536051;
        Fri, 24 Jul 2026 00:18:56 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:18:55 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:07 +0530
Subject: [PATCH RFC 02/10] dt-bindings: firmware: arm,scmi: Add Qualcomm
 Generic Extension Protocol
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-2-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=2320;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=8kOkUq8/QNbkFlOXibGos7tK4ImImcoivey6N7UaC1A=;
 b=kcWWRSTmgHpghdRGCm+tzYMnocOcNLzdIw5A4hcEd3F4SOsgeVTWlBHbs9nPYviDl1lcqVDJl
 XTULEl0Z8EYANL6bYs9r63RpnC+qwCYRqzora1Gjcn8/0ESEKueC6PU
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX2iD5CkjEybnw
 pYt5fxeMNJ+xsdOlV8I1q5PsBkSttNtuWcMrIYJsQTqNNqWriotQURVQYTyXENDf1ephGFnM8JF
 7IdziCH/5+kGmk97oV4a31E1vQP/4+IXmH6D8wu3faURem1svxSCM/RflfhNZTNnIabCMavvYfT
 90U+YGeP/JriaoXri+ocUdUaxiFMgG27xJvklfK0ABgIIBVdLliKQwX6X3e0d+FzLx5OWoQdx4+
 86bAo+g4mzKVRVRBrdr05cYEEJ/QKGpdnoTUIPUaRLOXowN62gC1CQzQIBTBth1dWzj48OWTECA
 iMuV+vTU1Z8N60igWRqdSXfY6s2KdnabE3mERnrCnoNx7LlVYSNatSk54LtBcYrIXTgxirEjhXf
 UFoeb2szPyKfFiQwLDYFjoAM0oF6LjCe8QTGTEyudm9GBn8r9h19/AEjpWbATzby7OOdYQOfzwc
 lqVFUjv4bPSFx6iSElw==
X-Proofpoint-GUID: Bz6c9B_I0HEAGuKG_zjC_2MT-JqceWi2
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a6311e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=dmqMg6edKZ0wKbcdjZwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX5l96tbt67K8S
 PgoNvo9pp9g+UK6U2IqtjPW9ISQaMOs2TQNa4WQOc/b+QSbA9NsQV7JOu1SMzHOqE0Vuji/L4Ek
 /syBg+Aq+L4RLILMWQ2pfrzM/ZzWM84=
X-Proofpoint-ORIG-GUID: Bz6c9B_I0HEAGuKG_zjC_2MT-JqceWi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_001906_243044_DDE9977E 
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

Add the binding schema for the SCMI Qualcomm Generic Extension Protocol
which helps support Bus DVFS on Glymur/Mahua/Hamoa/Purwa/Kaanapali SoCs.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  1 +
 .../bindings/firmware/qcom,generic-scmi.yaml       | 27 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 6fc44105f1c3..85f06a6a7452 100644
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
index 000000000000..a50e5e8fdccc
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/qcom,generic-scmi.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/qcom,generic-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: System Control and Management Interface (SCMI) Qualcomm Generic Extension Protocol
+
+maintainers:
+  - Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+
+properties:
+  protocol@80:
+    description:
+      SCMI Qualcomm Generic Extension Protocol exposes Qualcomm SoC specific
+      algorithms such as Memory Latency (MEMLAT) bound DDR/LLCC/DDR-QOS bus DVFS.
+      The algorithm runs on the SCP, it can be turned on/off and be configured
+      through a pairing of algorithm strings with an immutable list param_ids.
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


