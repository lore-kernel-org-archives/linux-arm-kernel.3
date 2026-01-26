Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AD3C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=Y/FMPEEDoYJb4Io0Emck5J2MRt
	Ol7F09kbIr718ogblqxsFZaDEJyapPv6qpxqtZbSY/3K09Rz7Ob4c3X6PtlRjpsio9KRptkumFsPQ
	nOh9rEgFGEsrVxRvoYYUyOAc0v7hV+oft6DQaof/FjgHCVMpy7ecgIoGVQ1FvkIAM+nXgP2MNO+SI
	g4gp2sqdYD//2gZDvMbT9fzLHLYBtCU//Ta6+v3fZmsHj/hBWr4rF5NXSD9DCvGvpgWXFkJynKO0Y
	i9E9VUqrYG82SRgSb+iA423YRq3WADlqIKTyzEpyLpCDMi8bntxVc8HUNORX04L/Z/778IwaeAG5Z
	yqAeGL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHLL-0000000C3DQ-0VPC;
	Mon, 26 Jan 2026 07:49:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHLI-0000000C3B3-1aUM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:49:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q40xgG1361804
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=JvG6i0KJu000BHx/
	yJ4pRSOGXpc4R3PDb0wcJb9DpXylFMn1TRFMq+UbwF+vDkDaVwUmu0wpye/Nud5R
	a2YeecFgDit2EAjZpQRzJUItgEZ3sP93fIAtNqK1aPgEwHEdgXWNEjLvP7BSxnFJ
	lZSEPgUY9IOrDh+rai265rJCYxTZ8war2AEMMfdzozvtS8vuYjvU+B/skAd2Kp3f
	k5z3JlRLmAKcj9Q0D3uuZ8MxdUSQFmnqOrcDG/uq+wN0DX8yv9uE2kOZrPROg+y1
	mnoG60jfiI/yfr6YjSt0pt2b5rgTPsnvyKRGk5LqwWTNfzevmS65V06JmLKvkPgp
	jS37aA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v30eej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82357cbd272so156630b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 23:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413739; x=1770018539; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=Q5Q69i5rexrzpzxDKSeQIgkvnuGfLc1yXIJ0Glb1/EkygrDinV5GxZcGCZo4MLoISd
         d1aiS9V1BwCBYZuUep2xJOmeJk9dje7ehlLjOUueYVM9VB6lP8pLb6pqfnEn+XyLVItR
         v3MeqhWqTndzlHp5/bW7mrTp9iaQI9fvt/UDzjitD2vsn4ZfpAg84x53uSGCq8/8MqLI
         J7EuxIvgA/HUjmmWPVVW4mCqvPtqg8zOccirqzkGIcG31ldvAtUdrxu5q6xH+XdOhtBb
         CsWNb5Gmk2eJwUuxQE5BG9WSswFxBJZ7jQouqeHz+8e+81hn4LOK9uE6unuERkR3ca+R
         c66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413739; x=1770018539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=XaYqTR1JXaeZHafrvY2tbGDf7LvbM411j9RjqURLdJ1H3qOzKB4JQyQg+e617DodsI
         MMc25HykUh1Q6BPgyvAH1qvsPZ0ZL/PXChGj0XsYayB4nx3Hc2JzDpUGecgthjEshM/p
         Ejp/ccK39JrlrHIeXNP5ibiVvLS9lh3N+14RcNCzklngXdT1GlEMG8/AdJ3hd82bY6dS
         IiNm8gYDm7A51N5PAFLQAvrQKinjjypN9PNU58lfTfT+yZg1eaTxUTLcw3pwzBRwZvZ4
         ct/hzn7rrm+cYM9sfagvlKnbQGfZwwgBctxtxWfhQB8CK5PA+gntQ9CRiYBpoxH5Gtyr
         kt1w==
X-Forwarded-Encrypted: i=1; AJvYcCXVlB/57OSkXgHo05XUSfRoYmXLOsGUDxugHFXgARDJ/3hlQ+rR7Hoge5gi4hs74QxisCFu/yxJMtGr+rWFNky2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0HmECXUmuU8kN7uIuZvwgU+0sJ8yGrv+qpNFcPjwWM1L36IiT
	CZdXJyWmAWsCzRVY2QNs8evf1OQIaAxGo/7s+lyvA9KtKLe5ehQJ+Rt+ueeko5wt0n7tUw6RKXD
	fklhVfy/O1F93GSQfRtye2AcesYDDWKjT0pV/ihs0Wgr9ut/wYj0oQkT8duSGAh93CJ36Ip4vZw
	/7tA==
X-Gm-Gg: AZuq6aLJ4QWWGUgtPBth8Jbh6HYHWR0awNXVD/1RL44Tx0fFwLsu4jHFf3eOCjnBaji
	Z4pIxVZ7Mb5C2Dj27EwF1FRSqQ3k2pcinexD1/3jloLLmLVDCz1frYknd1ypZJe91mskTmWDsBd
	F46YJIUkH9sc3z/mSrWk0lZ/s+GWCfGHVkE3gz6LuBGvKyYpLrFQQ4DiIGyu+lFYGXIlfNiryw+
	T3SuOGzVpUtsNmgHo4uKzQBM36p9gwLjQTU/cmsadOtwoK2Xr54LLDUCbF/KODKJf7bwe6xyC6z
	pOKOfCABBMoVJi/SO2PzMn9nla9ovkSUsPI14lSlQDzfka7PWh6HLGlH/cL/ha3bFJtgpQS9SOQ
	cF2ffHAMJJfx+eKiO2AjyQStqkN4lnfY1YI9sG8eqyVN60hOFI8FRjVC1bHvhu3dEVcPhvvQz5E
	Nm
X-Received: by 2002:a05:6a00:2294:b0:81f:4566:cce6 with SMTP id d2e1a72fcca58-8234121c8e5mr3573552b3a.28.1769413739254;
        Sun, 25 Jan 2026 23:48:59 -0800 (PST)
X-Received: by 2002:a05:6a00:2294:b0:81f:4566:cce6 with SMTP id d2e1a72fcca58-8234121c8e5mr3573535b3a.28.1769413738792;
        Sun, 25 Jan 2026 23:48:58 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:58 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:57 +0800
Subject: [PATCH v11 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-5-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413706; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
 b=CwJwXgXX7zGGBu6bOdUjbp0ej8SuneGsyvWe7mye7VP9EezB/SML38TmlJ9XLKhPIjJm4m9om
 rpFo04y2Zv7CFR1BoUf8tb60tXJFaMNUOZS8w2ILqThhNhX1QRTID2/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX3z+DTmlTK6em
 uQle+hIGJiIdKHlFV0WF0p0WPzVQN+79O6/wGmxhqgt6U5DHweYprHAiKOCQWGXD/TlO9yO6USe
 jJTu2Hiu4I0K7LFcA8zXpsdMrEcZbicOc9scKBHBvJhFcogf3geOklQ1TIl190/QqUJfpgwkOrr
 mCIki6P/80SG+G+kfeS+iQFUYuWwcxGPrE7U/F+x0xasCUF5jueTfFYyw9IEoaWp6E5QaerpC0m
 X7N33HNLii4czBrud+Nun9D4b/oJ8qLSv/VDbs/hBbTjp0X5rxpsRSKSVa3JZDy0iV9niVQMJgH
 XNGHGvGImHHsbgH0pOhvHTRNYwOobxegZui9rLAN8YTeunijRf3ZTLkmxPS2yydE2PSOvry9zRk
 x/91d9yOBS/+Tu8+umzAnmeGiF9kV4jcVTfNZaHi6TS5wCSXLaEix0skzD/cs/e72LrC5bWCgP9
 YYsDuM/QxA/3foelieg==
X-Proofpoint-GUID: 8kASeWSGhB206gRW8f_gk6d9gGTrtfaF
X-Proofpoint-ORIG-GUID: 8kASeWSGhB206gRW8f_gk6d9gGTrtfaF
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69771c6b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_234900_464928_B4355F3B 
X-CRM114-Status: GOOD (  14.32  )
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
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..ac27a8b89085 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -60,6 +65,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -67,6 +74,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


