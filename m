Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4470FE83057
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 05:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=hn95mvOwyVqa8It0squWv1xavS
	XXoHCZIDNzSZAsOc/jUbKqwmFqbi8pVPrK861QXrQyCZs2VF2tgkR62BH9z4ZCmnYyHN7qt8NPoXc
	PII0TE8lRu3iGJ03/SDa2wWU4tRupGy24rMN4ZjZUcD2ycnNf8XShiVOpR7p4Mp90jpl3185IZ/pL
	TvD8nf7Kxh2vppeuLY+AtLFvTzSOzBvyjLKLTtQstTK/BHpGKiRsYa3ygpgl2B0u2nNyKZEfIXlEm
	R78UqQjrD/Y34bdcWaeQahHgvhlHtZhku8Cs/Zhi9IBtQEJufyOrWu4ptJ9+ADc8235kRJZ19mo8h
	+ZKO1ZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9Ko-000000068bi-0OY5;
	Tue, 03 Feb 2026 05:52:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9Kl-000000068Zl-1KwR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 05:52:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6135apXn2262003
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 05:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=idSHbaOE98zccvVu
	mKnErx4Wvc2uhjCfw/iTivTthNMg+ccee/X+WyL9l+2sbkaxURqKs75SDOR1SIf6
	vnKfBz+qSLzqwwoGvjLKAqmoWM/gBnmI4r/IBWnD38akwEdIwibneTtwpdhBZx/F
	gnPE27Ia0tSsPYVVC1PdhY3lcCfZfOoXbbEMg9WMWHyM93DSsa/qeTMgjgNIpsHK
	gsjmulx5SL4yiZa06YcPzoS9msayFgeWBEXumDMFuGx6bwAaqty83qaWvHG52T/h
	b0LIFbiUGsqJ5mc8aF55gMeUb6NpDkMFn6fkYihUm71922wgl9wqNTn3TYBbkU3j
	vOpDfg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tmtk2am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 05:52:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7a98ba326so5785945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 21:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097937; x=1770702737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=f4IfA+sHn5sef4M1vOzkTWaCsVUUmTUut2NEi5qKBT6ngC5PE3MT0Yo3kDpRyYyLeC
         +JHCStMefZ9kD3yrH8Z28SDkrKjngr2cljWcdZR5YUj/TfLZ3AmQrgg9fpsv6dDCy3Pf
         oB3gh0cWOwi5gVeSlu2S15U55RIaaSvathB5x3mBG8POfn+cJsv/RZnBx2tI04awgwun
         VC1uUFfVx+JxQJGVB5YIhric1YRAVvD8K04CZPiAJ8auzKrGVPsdKfODW68CbvL7sLpY
         /zBOW/gipnOq9YNHsgHojHQYryaKGRu43G+ojyMpkfaa5j9am0+yAeAYBmGXnuwlg7cd
         wyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097937; x=1770702737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=HPexEQRXY0cl0WJLjTgNVpAOErrdNsviUQycBLSpIRlRen5MrI5CGPz8WKQbtbVHIc
         ONjh7iPdFYGwklXtUI6p6YoRRFb2VkP9cS0wBi25hDbpAsZex4WGVG+SfgP2rQTQP3Fu
         fmPVGDEHCE6h5McUhdeMuyK2wL75FrU8kTr5pgfZA5psEm+h9mqSac66695xl7CBf/SN
         2rYnleq5tRxTDYXe5J4Yeu8ymXbmqa3iIdBYGrWYrEf9vI5ziSGLhKJuQ2DBCLudtSGj
         jetESIstiDDQqTyckGIzGmNoGmpjIX9jQ6Sb/JYqqSC9bHQKOavWKMi3ZmqKqXcndUp4
         /eCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw8VPXno1eTyaab0e7Abq3Jd7qEzLEk+qrRZnpp4Hnd73w5uOQ/IKl184VcAoC7ytTXylx+5H+d4YWX1Usq+Ot@lists.infradead.org
X-Gm-Message-State: AOJu0YygpSh2RQQwghFOmvhWsUx7xcF2t9FVPlnAOL+cxRZChGJofcvc
	tQ7m980uSoUrU+MVL6yv8OX521qFwpkysAH1HkwbK0F7hWu0tL7lF5OCpzoYKTnLE2PABtjlxMW
	VoEaJTQWDfnzfQpJTrof8MfF8ze37TG2EwOTaZhT01t5qlWmH0SMDtUAo1HWZdCaDTCIX/AUa5S
	o+Kw==
X-Gm-Gg: AZuq6aITdzlAzLFNHQyat103tblS9ntabt1PLxxrLKAV5XjSRWof/bdTvN7A4dkbkBg
	C/26NW2LeD33Vy0J5TTJRDpQF15RiWPzE19sUa9kx6pJsVpTKNSS5FXZaOCbbM2Lng9bDkmL9Pt
	9oOVRqGzJKcmYwOKak71q2cyJgtkE+6NWMyOVY6kPQwvnMQLBiojRIg30dB4zFCJGDfH8pY+qYs
	kK8uCKdRu+263hP7cUI9rXJb7FS+uLKX7K8s3H2KQVTApzIL50NYTadH51qBhENRJAyyIgO+kmK
	pChPaBJ2LrkSE1FMj5My18CuEX+xidQ2g76Ly6gbUC4A5fts8WevVnYARPxQGdG65vljV9mSQjJ
	3+CjdDmtocwdrxiLWbGzoJMaVbbpclrkbyMNYZ69RvIrbzGQVoYkNd74mhXTXYXbIhq4QmIPv
X-Received: by 2002:a17:903:8cd:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2a9246611e3mr19726155ad.28.1770097937122;
        Mon, 02 Feb 2026 21:52:17 -0800 (PST)
X-Received: by 2002:a17:903:8cd:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2a9246611e3mr19725725ad.28.1770097936638;
        Mon, 02 Feb 2026 21:52:16 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:16 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:21 +0800
Subject: [PATCH v12 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-5-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097896; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
 b=QjGEOOMg56eJBct8Kwsk+5m4YtQDj1HjvjzbLb9nksZDFfwoEo8hvfykF6PE/wRYbcmXJQ0Hn
 eMv0nFedomqCmqJV1q/ImNOWc7BRvXpsBHi3OcrmEngQMS1+9V2ELOw
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Xb6EDY55 c=1 sm=1 tr=0 ts=69818d12 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cNtftHkXHr47ml6Qt_t1he3Fkvltmcmp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfXwWdp/qfPiDJE
 Q+0Q42kNbxL3y0P8l42CFNMNLksE8xQK5quqAQiXOsuzHlZ2AGrMv5/uAoo5B3xJuBRGd36BpCQ
 v5hMx4j88n+7aCckyHWpjxAdwE3X5Jb1ILWsamqqb4Mir8deeKqU5PYHcszI5kLIzFgUn6kg3G6
 xh+dFN39pjz6Qjcrlj2jgG48nfP0iQ6OyidVIrhPzcgSbhLgutX67ikiTxCRUVRBiPKXCFLKL3m
 AVTstFgXSrCtf2B0AJ0ZSU/clfMTxptDNF9RDeyAl3ULzH0QwtnuXzT5s0JMj2Q8pUoDWGbTBz9
 rH5fzWUHzJ9tSdqLqFSycqHRRyV+BvrY4W0tylPDSs7mCztC5MQpNbwpFh1p+E+zA2AmkDwrlsY
 o86uJOCHA3D/IBrJfb8Cj5d5rPWINs+gBOdzrs3ryGlWSIQgmeyAY7vbfnp/I/M0Sc4/Esp6Sb3
 oM1rZgJEqTVi5giK73A==
X-Proofpoint-GUID: cNtftHkXHr47ml6Qt_t1he3Fkvltmcmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215219_488453_28940069 
X-CRM114-Status: GOOD (  14.58  )
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


