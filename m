Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A335EE75426
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=zqcWK8qomoZzKp5Lc036vF9p2T
	qW+Oi8Nb0SBnhsfihmy51FwFOwpC6B99CcBc59oMEYqdoRqE0xZBZZIJxH1xqrToDi3CWZ0k7WkXx
	0v2IPsdk/PcnWzDkEUFYGeWtykmPK1rK813xg/RG6rX3r3Dsx4GNLITinWzKAs0X3rY4wTVvdZ3xN
	2OolRabkVU4AQ7P9Zivxv6wEW/GFPDs4xwPP4sttza18b43x5ighAnrjMb/YBp6uaQvI9evRMoi41
	8tNmj5YW4oitLbcnKEjOcRMBNhYwn7KnOkG+l+mLHHt0hdfwGTehI+2YY0iH1dsDGsLfrbF7PnGrg
	6S3D+rPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKq9-0000000GbgC-1mTG;
	Wed, 24 Dec 2025 09:07:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKq6-0000000Gbel-3W9Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:07:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO17X3v1597821
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=KkGGFlfVJeNvO8nW
	DO5c75xW7tB2eW8su7rJMJ1aW6AQkzjDeVIJ//9yr4/DvhEFoGxRHNv5O8n8hN+N
	D+Y31zvGf+XYWMDwP4JD0vLnnj9w2bna4JrUVB2/vHz/QqIYrf/wJcVN7X/OdVlI
	nrXT+KqYQzdoe8YA0aMlZVqBspjypgbE2ZnCf7BEBkJDei/fngmMJc9fWHnUWADs
	AOr1CejqUVBTz6WsbbaLrHnDZwsDOfilWH+gGXwp7h+BL2wChaI0EiCLtAiTbhTx
	G4d2myIYVKPQ0Z1nnxkCD+mvvhP0PtNpI0QH9zXKxZ+ceeYBD9ZoSalYz39dJgEm
	JxO/UQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h42u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a07fa318fdso105021075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567245; x=1767172045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=j4jA7VUALCPrJM/2WEXipJwUo8zx/wPG1ONZ32BF8agii9i1gzysQC4p8td30dliza
         Dd0tT8UsyiWTLj+oJIJ9Iuk4pnvUxObHYPPAeKP3JXh5bRasbPFNwlebz4n9tUgEol8Z
         yjXnmZdLolIUipxV1+E2FEBcwzP7hQJ/3HqYC9QmbbabzowbF8r9z0b1+3VFlE51RX69
         CdahzFn7ll1NC/6rxHB5MvVUJfVf3kuAVMHxWZtohZVcr/Fm2PWQNF4/k813tm13UqTU
         ouxbQB+ZmVr48KBecbhLZtJCazme8BEQ1lihYnbpiPgYeqMXva7z0a/A+m6RaeHd1QxW
         NadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567245; x=1767172045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=UqHTxN7GzN5+BR+5G/UYvu0fp3T1bvx6/2MhoLTmWoDpgnHdgMJJeDS8/o9GLY57Qt
         HUvNB4A1H8IM9QXuXc/BnyPujSnSFW2C8AHPNzQfcwyGbp+zFAiOWz7tWssrnY6sKeLC
         VpJYnTAqlu4nfd+6BUJ6NxcabwQmytIXftMkgBHGb9E4pwf3bXaLQ0OpnvwdxH830WKb
         P89WCrGMy/lGabkTG1W99r0wq2ctRXXLoiB2saFY7+FOHeQhuYFAa3E/196PeCrp1fX9
         Gu3o+R0DLzFcumXGPNjbBL3/vxqaOkkYJqJU2LPEZMlpcqdTt1oV4RBKQeJCHijXNzwS
         mpiA==
X-Forwarded-Encrypted: i=1; AJvYcCWNbm/JYxMBvSah86nKun3uFI0LHm2SL+SJ16vuPRDJKjPz3xCvQLsx17KEMyBCEvA4MbagOF2OkG8BvHC/wMk7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1/LYbI7mSfLUKwol+UC9rmXF9RXBO9LwWWfiNHnAiWBja8Pvj
	qQ9qT/jLXSRDStzYjyuPEeRxgFAdeKv1EvpYRCsBmpD5FxCtmeTo63xpWZL5Xxwt3BrgW/0ZJpA
	gkhEgdhU+5Ux9WD3aJwXA/+D0G6y7DkehpWxEV0jqaT87CqQqLnP/GcOZlTEXw/8WSoAdvfO2E3
	NYHZTZJc29LQ==
X-Gm-Gg: AY/fxX4O8OKmyvEYQxNEMq87XVbY0eyNWB+rE4sBI439ak7WiEA6dJxWP1ep7BECiNe
	AsPar16qTdkfF3WjTBgdnLwE6DOQX1UJSjRjOv/3XffmN9ZaFujLlhUF2q3lwJxKhVIORWO2xQl
	vUpBXjOuagh9teHiTQphw/9qBreVF/HtRjJk6Wz+PRNBpbWNw4dqbAL4cJT3JNnKG/ewVc6qK8B
	VTm8i+XVyPyTRcVs2NbDzT4M1XPs666YLe2Y+DCNWEG/eXR2DNi4BIfhiSJJ2vwYivt21VDsDQp
	fBxwQL5/N3y9wtUCSZgTXOKeEc00XYXpcx3AyG08zyfFF4BQnyleEyRfuyWsneENgBSzNtnZIQl
	BvxkAVlnDXyD1QTSCw09F1ts9CuXSBw747lNDj6bLErVkYWekL4H11drBn9MfeWrfhz/9H6ID
X-Received: by 2002:a17:903:3bd0:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a2f221278cmr148934555ad.8.1766567245456;
        Wed, 24 Dec 2025 01:07:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQJSCcEDJYpAElLBdwqPKFsyNLcK2o3ZpFHifNOj2aFk1A63DITNNzdU1841TN9YFANz2I4A==
X-Received: by 2002:a17:903:3bd0:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a2f221278cmr148934225ad.8.1766567244933;
        Wed, 24 Dec 2025 01:07:24 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:24 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:15 +0800
Subject: [PATCH v9 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-5-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567216; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
 b=tKR99cySKmryaYnNrYe05xHL6TEQFTTMHE0xGP1WEUL9152DOtRwuSu4OlI2/9ZkD/Y8RUsDv
 045i+bqbKOZDc9WJKr1W1gRHkc/BycGY2HUPjFzCpHYx1zIvbuBsZ9C
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: P8qjUpdejf-4Mv2fWcVs76DPc4gnFdxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX8nc4h0vBoCX6
 9eH0vLktlNb7uQuymGkwjRTUEHJbe/4ZSjvcoPOa96C0HeeXWYBNmqHQbuHgMDf+RwWBm4d/uyS
 WPOpVmGxcUw6HBaTTXvtPcSMYIMVlCETIcZfByTKUXXaEPImBotRVa/3CG7podgXFkmXuo7CAMR
 iIxer4eOoggT1tU7ITZgnW8kyf04M13xdGirpPw0J+A80+KOmRiZ9broDuZBzF0RhiCFr9bFmEv
 yi82wCyBoem080YvCarNrwPWDoptVuDtt3qtCJqgi1Sg/w8YixWVO4k8pgPavvXdHiR8Z7KRuOy
 BB8DjfHjEHyGRlsLgxxuSESdUkKM+vsguRPOijk3QKhHk2+m4tFeI/zJLTqErkWH9QkKgQ2YgGu
 InsiQJOCUHHnnRMtFUdsQzF7qcMJvzQyzAmJH6/LiYYqQJv4sXv+hi60gvSjlNRXEd3j+EEVbDh
 877emAbOKBr7QkLf2yg==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bad4e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: P8qjUpdejf-4Mv2fWcVs76DPc4gnFdxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_010726_898976_6CB1F7A1 
X-CRM114-Status: GOOD (  13.84  )
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


