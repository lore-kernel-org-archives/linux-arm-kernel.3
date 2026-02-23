Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B51E98DF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=njRNbiz1Cy+XyusEQelcYmKn2P
	j6kqbnmm2SkXl70r78DtJeKbjdGuP4NiRSf/g/9YDlmCkC1wAlFSAlbixDMFDnACPhHNMeICEXEQ/
	Nwfc1wlVqF/yu0MJ3Mi032uS6DS06Mjl++5XZAfBL699HKCJwv+2cUo/WSXw7rYKkiIeubPaZ5vFX
	sw457N0+/NX2M1IBkQL8oG8Ra3BAVawvmgXhYVF9iy2Fj6+TrDbPtVCgRd9AJyeCgZdFPPx+pZilq
	lIgKwzyfVYQEnzxWN0qGqEhf/LJw+k4MKLCjRinKlX2uEllLX3g5wuDORrCyGr1xqNdrhPwup2jN7
	hBkrd5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPs2-0000000HKbt-2v8B;
	Mon, 23 Feb 2026 06:56:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPs1-0000000HKan-0eMC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:56:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNva2o2916725
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=NKTrUkhxiWsvCWcm
	vcmRCE710MOBG1EFZ+jKlUiDMtVSYH2jHR5XFnMR6WXVr8EcrxTci/Kn7bYRORIa
	fEKMCteJYt8DajCcQ3jzWEHNgWBH9x+WBQYEmEne2152ptQyq9O1tGgVr5gpdxlf
	dFQRIjv9xhWC4Wu50v9X5tmTvSYKyvDOGBgNlFB4MQvk3k7lUgkaD+D5ovtTiIPZ
	gA1eOg7xku3rFNHr6hIOS/tU1ZeYU+Jj9vRhUxCkXk9tUEhT1cAzS57CrMo2UnrY
	AMIYjtpbrG2RZdsjt5p3RBX8bz+Fziy2tUd9kF7mVoNMcqMmfiMBhMa93RWpBEb2
	sfNqKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vguqbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:56:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a75ed2f89dso37232905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829800; x=1772434600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=g0ouYAKRioc6syH6qXL5Au4cwN6paWg89k/qfbfh6oTztuvgIqObEIeQeKYFOP1ji/
         pqgaFOK5bjpmdBzskssjX0GD5F1jobKGtKgwLcx2lhFZefuSgkQSyFVT+HmEM9yxY40S
         3m9tNJ+WyDfDRS/9Hr1QtXI2yK1cmIu1TLvwEzqCPaBu1Hs2x0erNIiJr5Am2cF3iouI
         TSx3qozqARpBNrPZ6n+Zr4oE/OZM9oIbYgzw4RARoVsUZYYOs15b2MoxTNYE55OfBy6S
         yObjXwkgogy4J48MqwEEXv5h2AS2WtM7+RnpEpZaMvdsLMggRD8XFkgX3X1xX+vtN1BE
         XnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829800; x=1772434600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=IdNxAplM/nMxmBkk1j+pmfJUnD9jUnba9C4bZG8/DXWeVWwdUD/fXHTqJL2j/CUjv9
         5IrP4u+/qOnwisrl1udehhlB8IjVNbwM2LscmaXGLqueHVQ1wp6PfPBXDX6KVj5vHdwJ
         xr/oezPWJyy/S3RBQH1QOkDLD6IkRMTr28zxZLKnzjqy4nRy/7jXtlzE7aqxXLu5UFsb
         I/11bI8+SzUD43vewkSLsTtRmQ3CqwwobEhhg+o6JPamtpIVYN+HxPyTnLOfgJuxppdd
         pbM1fpmY4TKFj5H7bYENL6BCaDfLmfaAY3/HLDUSYcq+xbxIsZ3wMuPYTPtRGzr3uMYp
         Lj/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdBb6VyooTSvt4LQgXdnc5JQb1/JsGBs+OH8/SCumlIl7jOk0iIPuWKbOPfHeZj9LSZIseUFYw4RB2xbdzjLcZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy31YuCfwcgUz7Khi2MEMSSBdXK7qIHR8bPrRwtgoQ9Wcq4BzAd
	riXGzF20pnXXoMF796wExXvH3sriFyMgHpH1buSQnLdLuBt3XjPSccsR3AeMc4F0L/IMDj6KWxZ
	ukRcpPIKQenV/EFvaIXxPm5h9R/zh+Zs1zwfQM3dwlIi5AFpoEYvD1ipNsBDo3klKnYSuG3gSu8
	IHbg==
X-Gm-Gg: ATEYQzwYJfiug2Ta7FYOPgGvyBFOy3My5yK5G/gcRO1EqfDJvloAdL+tjOE9yEHbXah
	fKu2h8eLVCKM9ctbUZ9AOCgdrHwMeXkvIYHANy5e2R1PKf1DDCWOkOGWHNb047y8G8i1tnNlNnD
	SfVQ/pzKTd8V065ePoalKjjUgcqvqqCQgmBVZRF5EuQHcAYWjYhGKH/t5YPiX3zJaR9QAdfWYyu
	R34LgYHO+SJs5/4KTLceNK6k1Up/v/p6Lk2RiOZkRT3maktQitCUK8uj9VtEXW8u1mgWNuIoiy7
	jLonk1MUFqgAaWhaU9Y7Z/soYXf0v/VDwghkpn87tCnorMoWpWdCdyl7yzQlS8FP3HmSbTMH/B7
	Sn6yPg9dTGfnxqM/adTHslNjbvscU2/dZIgiMXIJfxSgh0BCYCKbLJoiGNWMV4IwlBIa+VkXYK7
	qWqoVq6ZRLxHTq
X-Received: by 2002:a17:902:d2cb:b0:2aa:e568:164a with SMTP id d9443c01a7336-2ad7453de73mr74727895ad.31.1771829800057;
        Sun, 22 Feb 2026 22:56:40 -0800 (PST)
X-Received: by 2002:a17:902:d2cb:b0:2aa:e568:164a with SMTP id d9443c01a7336-2ad7453de73mr74727705ad.31.1771829799594;
        Sun, 22 Feb 2026 22:56:39 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:45 +0800
Subject: [PATCH v13 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-5-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829766; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=QWedPA9AaKhex4ym4w+qoBHDsF0wrFknKypOlMeyS2Ij/VssAG7VHPQyN3j/KA5tLTxJRu3rk
 HHhK07Q3bjiBmdNBDhbjpw68FVZc/JPqnB8UxTmJgc5AcQHlArgI49R
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfX/MuYz88Mu66h
 XmT+wX2+2yU/eABSWzDmXQwYttwbWEJ1Z8aoNOwRim6oeHTd9wGhjrMV2Vs7QU25iMIhg5yQa9e
 ZYQnxUckn3p2wgCn45APUx0b+zTyb8jSWpJCaimxWVmx6nffw86V2Z4ggk5ruSOHxTPrImo5+w3
 wFIV7NidIdKSr60MTKiEnI8LSCFuhet67eY8wjzL2H4h2hVjO03qAjhgBckR9eqSwX257PJOJPD
 n58Zciu0Ai8B8HJCQ6obp38ke9gZQNfbTZLEai0atId3ZZqYg0Ob+Su4k7kCR/5Q901RYWSuK4+
 0awJhDevC21y5D/6hFqHjZSBo8p++YPgY0Lt3PyOal7CGw3gRAnFmPDnZsIsX0Fvyr+Bqh4Xswo
 1uekIfYrY0M6pk4LHTCEbbMXwJcGGgN7ubaDNVbyjYZCPq/PwY7/xrB/ANBU8jabSJ2AVvrEbzV
 4+mV6gic+uARqmgwJDw==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699bfa28 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GXG97TKQepMT_Xi6Ay_d3yHOt_gN_zsJ
X-Proofpoint-ORIG-GUID: GXG97TKQepMT_Xi6Ay_d3yHOt_gN_zsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_225641_195972_179661BC 
X-CRM114-Status: GOOD (  13.71  )
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
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
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
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
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


