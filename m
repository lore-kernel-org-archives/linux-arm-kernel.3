Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8C7D41159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=; b=CMBvCQJ4JfUG3JsRGKUT+d1Zbx
	SSQhA4+Fw/pxBssThUaGwdXPb4kfQI2v1awW45DNnkoGFzLXMUo01wRf0fCcMdviTBdlYlh4UUrjG
	0CV9ylpUa09z7a9OJmR425U0xK9wxaY6VVLlN+kixgB3VKFW7BSXVU6F8coWo54tAuciNYjOTzfa+
	c4ag/DyHf92q/tVmWlLSaF5miYdC5Lbl/hohm2cvYsTj4qv6RxvToT4PdbqO+kPIuJv0HaBRRTNT7
	tLoYMUa9WXt/ZrvXta+gEuwoPHBEgt9AwA6tXT1ROOZTyJ+47dZfu8WsXo9NLs9ON3GBLrE82sam8
	e0WNVEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKM1-0000000C8BU-0biK;
	Thu, 15 Jan 2026 10:13:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKLx-0000000C8AV-3yLk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:13:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fm1A2074317
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=; b=OaN9SmJ/H3lNT0zQ
	yhAHmML/R7Yq/CEZIqgCDd6z9zQU69N7vXY4n0mPIz4gmCKrmFRIYlDS0okxda0h
	A1i3HKy1N94em79UsG5l0/jye9qOWs4fTun2HmFdk2HzL3FwrbMVvFTxQpSx5YbR
	hpY/fIMQHGH1hktqqzkR+zENDMFa319bxJiSEPMiR+lFRysxbKznYPKnkfRRMow0
	bbDDHtlTlIPD+i+AwdA7yXBOhr4r38laM+b2M4Qch9m2BJsJV3UpceAyHavcjBgG
	KOi3kD8iHnSSzIOTu0Yiptr9DBCN7TMV0BIRgXoLDLdaR9gsJ6v7aNp6BuW+2xOa
	9nAISA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9j45h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:13:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50146a67232so22328061cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472000; x=1769076800; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=;
        b=P9DOuCCXBTXfUSgJ1kcTmw3FwwVCPbuHA87wZRDSA24QRQ43FhJn+has8EFZML5cfs
         UbenuJ6Sg7EU0nTp67gXS23j//rYzOLnZFM2DgzywPzQkqB8Q+sZZtKVHiFKd4T2Fkms
         6r3nY/8ipyOpT6lO64e2xesOtPt6ZJAjin4hTUNiizG6sC3ij3Q8Mw2a84nxQDSXmUJx
         VL3CUQgfGfhKdjyJebcuKpiuW+rDxTiFZccycBEQIWD58z2I1Gd96NmVLx1CqVoSjuF2
         gNMWYxr/cC6yTU2EcHoQWMh6gNR4xbwNDKUvJwgwRnE3hyJuL4LUQkAZcC8fHrvP2HqU
         LzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472000; x=1769076800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=;
        b=pNTzSOlBVAkXSAVYmhWSLpylA3DxW/V+VPy51a5H7ZHc4I9LaR1hBC/Vhx7R+g6vZA
         h6KpqN8jUtSfyTwcjmD/sfMtaE/FleslbKsi1l+GJI/8uc7oa/NekQ9QAIe9iohqYO1x
         Pf1rJPnVjoK7ScJpSya+51jU5RwpXhpVbD6lMYaroMzBUsbEo+hkZN8HLcb9t0USWBhu
         ikx77gkxGkjVGF/+oEhUIlB76RCBaQCGesx4imDUdbskwyQMXZ1fgh5GxpncsxnLqd2o
         5cprAWuX11hUDfvYytv53LKB3JrcWnzfx2HPrxEYH/0TlPi4ppBnLKCKeTJ2LGvNs7MF
         /ZqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCHVsqVmgdlNRKNKxvq/hJNgM7Uqx7q6FwfX0BFCfjd5YY5aMeoV+C5jzeHPvWumDdOYAyU0Ud5CvMlUvn1YCf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn4UHP2uW2oQNShq3O4acD+1TN1V5ja1qYPT7gXAFvwWS+/auq
	iBYwEo8aqWrBf5AVMt0BfIZNY+KiSn/baWhsbmTt1gSrtT5KeFb5zzf732FFdF824DgVmnyFZZy
	4gn+7CtL4AN6lk4zPz5MfQXGCxdARUMpXM3J60llv4GdiWe07cqhMye4yQVlHmgedbUug5xSO6H
	qATg==
X-Gm-Gg: AY/fxX4XXjJWBOv0KJz8VPq7N9hfx2cz5yXbrzHhweYc1rm4ya9NNA78YipkIx7/qjT
	/yS2S5cMThzfQy4vZkwRktqnBhalU97O6k3WVEfL+j46cC3v/MlCUG47wBMlOfaFvoYk8+PD/Rv
	kzSX5dbykp+kJPrYWk59JJiWBSnG1TwTg+cinZaAXitFXjDs2cMkWZaYnF55CSwxHWb2Nxtirlq
	8AlW0g0RT8UadmEE7+4GiQeq9M6e5yhSUwvdmHmp+H8fviBUtn5PTaTr/bLMDa8p7UTlTW7VqS9
	pEU31YrbgYG5pTmra7EVyNCoYQ3eyeWjJ0+JpzzZ+c7FqmQgj6oCQrh2etlNLnkdDn/xjau3bCw
	W6/VgiELocWcLj6dR84C6/aeKvuu/7yAHDEKnmhWyqb8xoTfB9F1zE+t/N6U/KWu+TVHI2lGbwY
	YY
X-Received: by 2002:a05:622a:53c4:b0:4ff:c0da:5a06 with SMTP id d75a77b69052e-5014a91902fmr72423001cf.20.1768472000278;
        Thu, 15 Jan 2026 02:13:20 -0800 (PST)
X-Received: by 2002:a05:622a:53c4:b0:4ff:c0da:5a06 with SMTP id d75a77b69052e-5014a91902fmr72422511cf.20.1768471999685;
        Thu, 15 Jan 2026 02:13:19 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:38 +0800
Subject: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=1602;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=M5+8O8yCjRisazGnwCs6jTZ5OFgWEq0sYZmbzH3kaMA=;
 b=mcgnYzGzT8fjH70t6p9m5FammsN5vwFrN1bKnlE1VUTzkmRGRIeI71ZRJ0Wmbd6DwFqy10lqm
 byH7WP7ANBsDw1LBOx5pl0N8vq8ioDboHxN1RFC+BWUikx2yvoJRpdj
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: Ymo-rHKKyiMDeanMayuXYGNfAjGXpzF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX6NFOkn27yUsl
 Uz/Guz+FlrHe10s1jLjp9PkYx95N3BmLenUlHq2N/+bMjtMXU3qFVt8PL5AiLCLQ6+8YJWxgTo2
 C1DwP7pzmbvir6BAxPsEIh+qrwl6anS8Ssjio9g66mK8o3XNWcCl8jroShc0YN/Ij/dD0++NUvf
 rAXMvRdLPI33VsTZAU7EivPuJ+0+QXFnXW8BVy4mU8mFfY6uwf76+vUrD/Er7pF6vm1CPfkfe3G
 mOTCZWaniSfx+tvmr4GC7Iw3kmC87JbXjdP4fdm9kxiHCyNBxex1NwvG9mSnMkuSJVb+i1pSGs/
 oITbNVx1H0QOHdtswPQ9Mf6hwMptUxZNxA0VqFpFxALQ8NgoHsuG7KfjKVTSqgelwAnXrGfsVew
 r0XLklYSWqTDqSBDdIl4HN2kiHgo8aY5XrZOkI9h7dRp6IAe/sUW1fi/cEcR5WaDbEDLbKvihJB
 6+jT7fuG9oo53zXzQ0g==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=6968bdc1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=E-b4n2RehmlEprTZI_0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ymo-rHKKyiMDeanMayuXYGNfAjGXpzF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_021322_867587_1277471F 
X-CRM114-Status: GOOD (  11.85  )
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

Add the sm6150 CCI device string compatible.

SM6150 include three clock:
bus: Bus clock responsible for data transfer.
iface: Interface clock responsible for register read and write.
cci: Clock for CCI core operations.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -263,6 +264,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6150-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: bus
+            - const: iface
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


