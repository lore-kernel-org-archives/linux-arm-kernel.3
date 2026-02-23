Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A595E98DEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=u+06PwXRwZxPIt8fd1zbhWjOep
	OO/6p/aPIazUB5cMCQE3K5ujVorh1koy8tBVa14PBcqHDVCBao0f4ZZ8VWTLlM1gXVOOBxLVa1Fmt
	cWboAeFAm5oPka5Fh526A5/jiMKJQQiST8s0PXkJzBOkQlhThaPWuR1/uj4hgkbz1EuV2KF64ftIr
	HnhYcL7tbMHb1PzHkUxCGPHwGbQRDT6NnHK9oF4s9pL9TJwpLqwO19O/sgb0Vtn1Mt68sNHEljBCX
	XammFyd8NJ32A++qHNFMsLeseoJwE13Vs3Y4HnmcYPbb8IRX590xb+TC54Y3HsZB8G0RC/aCHRVmq
	MxsaxYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPhC-0000000HJHE-1ql1;
	Mon, 23 Feb 2026 06:45:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPh9-0000000HJFY-3aDy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:45:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MBZRca670853
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=ix8DF9LmUni4de00
	khCA1SoUKSQzji7xApq2vVKqZnzWhrhtMazw81w9FkUu0cWCoNvAwDL6f0XJ1TIg
	nlt9VBJ5ttdURFiZREuaK6PrQNBDMpo19k/lDPAZnzZ+pMTPUDC+yoig/ARe+/ea
	2q/pDn/C9J8iZPQLC5y7jyBEMTYJi9kHRoMb7ro6P9NHrHmT53m6NlfqB4NxI9Pm
	0/qVjWyIhrPHXC2p75hPxkEOGT5tVSxLrycYuCXTQ7RBtjH+qBYIuaem4wLknEir
	l+5KK345ulUFbZD+40LH9y0qC8q/ZmMOdHHhKDYiMXjeIdHzLbrhTPTFMb2B9PXb
	e+X6FQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5waup8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so2832894a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829127; x=1772433927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=KI2I9774MwIZikkPeWcXzoEahQLCd9Ea6gHiP6HHEox5EJyIgo7YWSGgOMdNKWhcil
         rIcRFnn0SBkSP4Z5dmui7GSMGf+1qvkkScd/nA31j4pwALbfnDxGvPIxWjcH4dTNmr2u
         tb81ySbHGOyvg6u4zv1iAquNw2zmv3rlspILTBL4hCXCTfk83R3wh9/tONYzKDTTQ7Tc
         U8YII5uwaFPLcqBJcj7tX3VkMRNwhUUKESf5pFMcnJKBz1rhRcxz+bbaM7I3Lw7FYH15
         BIo1E9UE6lzRNxvZYMabzsHMt7w73rmlD24m/s9y5CkZ4VzyKeyulAkDpE3PLY3IQ89f
         cU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829127; x=1772433927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=Mve55uvo4gHz43KLLxWY8sPd/QXmwvM+JAgjwREWOUBH4s69h1kF93oSPs9HHVUmTV
         fA9ZwkY800dDvYfJwXDMyO+oo+Gz6g6Q9WVMxvDxhW/rUowexB3bYCpExnaSKqH+wTjt
         7hkSOrw8YFAECk0GNdEAjwH0krGmC0vDAGZC07prVQdnV+BIz2bWuTvWqv75tOTpgXH6
         UTd5s2d6xAg41CLsJTwCCV0GSUqHqXFZ04VYSMv8WaN7qdkXmpd69cANTkXPJ8Nv5o4q
         uvoih2rszRY9eV6iBvS6iSoDTx/MZQYcoqp4MYMzD9s5XWlnf4GGCUMstj7OdTXU1ZZ3
         PIxA==
X-Forwarded-Encrypted: i=1; AJvYcCVyOFeWMc6eLCk4sTEv2QwiGAotJ6aPNiQZgJlmo2Ol4rM2XLYwdS4EWFafQyaBUuhikqR8hY1gf65FGs2xq+nS@lists.infradead.org
X-Gm-Message-State: AOJu0YwzMxpZx16T74xPjIIHG/O9zFGzxQm1CELJN1emJInqMDa+ktsL
	Ic/NojmJHjHIeJclUpmhi4oH7d6T7hDeowIAa5bVqeYaUizIUq3vt/wdFx7UNxSPERdznCiezTc
	XmyoxhkdbLDtihkJwhod6R/R4XKI8c/g+Q5q46VncUckQMJCsog1erY4Xl4r/kO+0KDGfj8khDT
	/caA==
X-Gm-Gg: AZuq6aKP9V/H9O666i7covXeSfSTV6HkewiVUMNeNrQh4mrrRSp8T5U3M969bnJF+n7
	pRbxUQAqv3Uj6YzHxkUENbnx2fgIe/e/DqLDvCD9CoH0BDGMkHvxsiaSwaHuGdm6zzUxP1U/YYS
	4NLjXvMl2qz5J6OVn+n1/LG2CfNcxM5Ji3I3gj5+P/f3F7OvIcaRJaQahqedCRTdQK5Ei+sMmxu
	Uk8XCzhIecWV9pI1AYbaKd74M7+zKRZm5Tl78EqkcKo2rBrTF+CowfRL6sJUTpcjPCg3QxkQPzl
	6W5y7gQv5oegUaAkvV2aCw2kx4UO0vzyrvV+6lP2qmWiHRwOJjCU0QEamNkDMOfShSmLefN8iFJ
	F4NXqfq1nkgi05LK/PI7jWxN8E8XZVTp9lTm9TRbgzg4WLH1F5tAz5LJE745IxqKkcZqHWOkK7E
	HwlZkPByy21UD/
X-Received: by 2002:a05:6a20:258d:b0:38b:ea89:700a with SMTP id adf61e73a8af0-39545f55426mr6544373637.34.1771829126536;
        Sun, 22 Feb 2026 22:45:26 -0800 (PST)
X-Received: by 2002:a05:6a20:258d:b0:38b:ea89:700a with SMTP id adf61e73a8af0-39545f55426mr6544342637.34.1771829125924;
        Sun, 22 Feb 2026 22:45:25 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:25 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:41 +0800
Subject: [PATCH 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-5-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829096; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=dKirz3jBPCDSlBfWyW2kjkYiVvnjbcuEABUq5s5D1lABgfXVMfeJ6WvofATkXja4IF8NUrRI8
 mJYR53CJLf/AIv70geMxfmLFBU3Su1cx91BAhNV81HGkH4DOotQqnOF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699bf787 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfXy+c5r7NzB0of
 WMpsoNqTJyD3Z8N4GhnX8CxGTlcf11I9Q3YUVTDGzAv2i5ZNh4Qb29juqbn5/sFum9FvczchAu+
 STxjYr3ea98ZHkPBSh1pUib0dv0FYAuQUDu8HETrCzkHQW/8OsbLQEwbEyR5On1Ujm6yJuQOLLx
 WdOvh1No0ExGDKDe36uYgsMX/agCvx2zgEb5fTEhBm4RDRWiP5OH4ZUjrO+lV7ecH0oYF4NFMnf
 o51IAwFivrMLmpGjkBMzGwOWW/ZfIyEuP9LZcRVhZcLVtYRfbCXaZGmDfcfSyilPi8cwwa7zJsF
 DT8lLT4bFYAQ7YICbVvzBQLRmShlem+g8Gwguo0hyrRY7T3aLxc3pJb2U4vDMEKsV1FbYqnr6gX
 f144Cl5cPbepH3yyGM+160DCAR27vAY7asn3uf9c6zFJalFy2YG2qNtZeH+0lDu2VLXIv5kK/Kr
 yn1VN5+Ht1NrE+8A8Rw==
X-Proofpoint-ORIG-GUID: oWzZiAANQtFapUw6KzqpuLwhDdyP8YSi
X-Proofpoint-GUID: oWzZiAANQtFapUw6KzqpuLwhDdyP8YSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_224527_906834_DF5B59E7 
X-CRM114-Status: GOOD (  13.97  )
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


