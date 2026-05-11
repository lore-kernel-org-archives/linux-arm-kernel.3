Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61636CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=; b=2oe01LHtBusKeNEHnHhzObEhgY
	iXLVvnRsIFo0/Ot5WKw7695l21+7lxFwMRJR3AYSKJsud2LA6fK5dx4j/ryKlo/RGBYWDdh92oSNx
	lCxOFIyQJ46jtmMwJU0hkDH47oCyR8Vy6U+0DprTShWxfP/lr8o5SCSArrCRLq6qNJA0TEjzhXqJM
	gtsz8CglapdUxMh1nYW1seOQGd85eddd/04B/Sjf1/pHXpqMl2Zo64PCy+8I1NvXaFfkUsaGEGkmX
	ZTQof4Fq3/CeXmSRJgQrV8smhtz+hDvJ3mBz5EBYCwSjBQzc3sIGi99HsOep5D0yDhNlTGrEauhhk
	oBEak1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2a-0000000EuTx-0fCC;
	Mon, 11 May 2026 22:23:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2W-0000000EuSf-1dRh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:23:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK80FS2172833
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=; b=n672HzHxzEtRcoDf
	ir6x/ZJRlEfhbIJOMVkv4eyYqXy8MLDomiRPg2BnI9MdSgbrwtPlxGXcbQrE8ZMH
	Tm79PL/RiDti8cr5SSPqlKYIQPihvq+KgcpIznMhmQ3+VCQyPXo8icYNTV7yNUGw
	h+h/WaJFcROAZG4lMM10n7i6ntRQkn6Qa15zvkAvqPsJr0IFcJWkuhWOv4VUd9mO
	mHCMDbRSS2ZYZRzjxwjrs4HEctl0JYhJKxLP+Bv+3E0GTQiQrfhPpQicVPthpkXk
	WIoWEkPypH5zD1BNsC+BCVVeFbLjkTpgRepjdbQLjiZGJgp1Rarb11OFp2zFmNDq
	IJM12w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvj8ghu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:23:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba6fe41283so56505315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 15:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538230; x=1779143030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=;
        b=MTzj95wWTQy0WvgBXoKUHjn1VzelGv60AU3BvlDlPJR8puEcPSosnt8eq6HMGRVtNc
         kYzuGDVMx0jl/T2USR7ZrTt4a5mTThS6Zg6HDyVz3FPYBUam5owLTxz6ZEPLU5NRRzam
         3B47PiceNFcBWSv3OzwQVm50BpxTa6E/ZAbV8X9VRJPGT5urVB+I1DT0gpneUe640x2V
         vgtH1j8PLV14siwfIY89Bv9D/kG1/HBbYLavLVhhtLtE8s+Im28SOc7uXU0YZc9fkM/S
         9b3TawqcfDcJWvGk6fsZH0+2lqEYSYYpJWTj5GhlemHl9AtAKfRuc7k5sWiX/bLxd0+t
         mdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538230; x=1779143030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXUF9eOdUNAlLXcUL7FmdHp0dlAT98Q3o6ahLF/ZEhY=;
        b=TXcV/0mjx/9ebB4hGUEBotEeWjAc0/hA2spw30tI1JI4GZmqtjrk4ii+rnzwzIdlVM
         9v8fHQ2w4lR6W1uuK4Gv9bl+MvfqV6FB+ElC6rTDJsTcIn4Mp3L1lJ9G1pJET3rrybVU
         dfQdV/GKocWu4XZ1Q3hl8daM9mmiL1Qe7KXOOWeQIJMC9OweZNnEOnMiWoIZuwdf4qXu
         b1HrQLlkVpvlLUbDaeWknvMZ/tI2rcUsEQ6bQ5NBSLSFWrVsMk8ZxPcDn83ARvyoJIQK
         FRt/ybH3m9U6DvybI+flNEE+MBv2YPX0Jkqy4l8aKHswSdFF1cjMJNuUhiSw+NVA9JRL
         Vu8w==
X-Forwarded-Encrypted: i=1; AFNElJ8ERWZT1QVHM1Us/KG2YeujmbjZPJNTDrv/Jc8FQ5tROP28C2id6BvS1eKLkHvpSVMl4WQasqvQSQZK3KepK8s/@lists.infradead.org
X-Gm-Message-State: AOJu0YxerfWxhPD5DOr8Zxs90BNfUC/lVmDdnu3E4TMf6Gs8INaQ0ajc
	nTXoJi8cjFkS+UkqAgjLRnhReDnPXwo53ayDA/LO2yOLrKfPeeaZM1hyBmI7lYE9d+Xvwp98wim
	HkPahzS9Hhf/y6JA6CZHEwpO7vKyAILTRvRtyXJjqx0qtX5K+NLURkGCmOW+XtE2fDg/yyL8VIj
	Fiig==
X-Gm-Gg: Acq92OHDAno0TH/WrMVqEuUkp5a+G4Nf9koxDdT7Grx6TqSlRFWWAv1Q0EAkLFgNkek
	5p13yqeEoJSuVbU1eFDGvMDecA/KnODiBCiQ5dMRb38Mq0Dm+WqwvLDR12jfvLzjl5d2lLV0ZWJ
	dhulRT2FVIUsbsSvdPk3HvqMib4HV9Uujxo6a+jmPgmfG/MiLMVdAeJzL4UtcE97nGGFycoGWej
	fZ/QiGu4lx5JL1aepB6qJgnOu/fNY4Skby2VK+2T2iBy4qHpQHHSmEVecWIm5ScgT8fj8o8DBH0
	9ie4z7OVnMSzsqk/oCY0HSlnpEmllqVP4iZPx7vtlU8u6wyOedv8KzNHb1ZThOBd21RSgZsWBdu
	tmevEHhVjp+WRMrqCRGNnM+9qI9Zgozeqq237ow5+1/gNWA==
X-Received: by 2002:a05:6a20:3949:b0:3aa:f7df:6146 with SMTP id adf61e73a8af0-3aaf7df68ecmr9095251637.46.1778538230342;
        Mon, 11 May 2026 15:23:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:3949:b0:3aa:f7df:6146 with SMTP id adf61e73a8af0-3aaf7df68ecmr9095222637.46.1778538229874;
        Mon, 11 May 2026 15:23:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:16 +0530
Subject: [PATCH 2/8] dt-bindings: display/msm: gpu: Document Adreno 840
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-2-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=1371;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=j1uKoavk7LSXVTFpinQJ3L50+niGwfT5j/plxH9VxBI=;
 b=dkSBw1s8Hl7c34xGexPilCuQxVMR0sBENGS+SZhwEMiavLDKfYoCy5dsAY7UhE8iKS0QVuwSG
 2dA6b55CTO7AU/2fkPlZlCpIFE/Ms/Ak81W1hhKN6X0xKKbaFWz5JnE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 6N0afz735Ofxq3-gC7yn_j-hz6Ex8ZIs
X-Proofpoint-GUID: 6N0afz735Ofxq3-gC7yn_j-hz6Ex8ZIs
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a0256f7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=I2s05RQVLi5l9ras6fkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfXxk6TrL9cgGY+
 HrovUcNq2gbYdO5IP03LAOfHnl6RCpzQAeYe3+F7/bro+C54new7rGAizEGpOqZRM+U6zmnn3yh
 qNpBpsl4qLSO9dDjpKuSK3YEmgb7iUBwpQL3c+UilBh+6xwp74IwlCCI/vnUflx6ZvAnYYwjkoR
 tD6kqRH7E2IxxL/JcGWdqKVcllufKs1yD8y3HpLLalm4YP9j1hMYGi6ituV2MK/SbeVifPDkzH8
 mvA3a7KdqT7JX3wIWjaKuHnhOpMSHqpgylitdNUcOuTHoGjV85mYSdH+g84JAXKQooANYpkbRdZ
 UzRoIqtmVtVEQqYvTIlL8uDWPkf/YNUZtO/RYs4Zua45rBB2/yp2CjLUoeetwEw7R4LqwSO5y5p
 sSOaRBLofNEZpyKNBgxde4ePGLkb1INU8Ros9wy/Sly/nOl3O6Qwp67oK3clci/9Telmbrz5w5o
 LxoxKblYnwOkhrO2MyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_152352_552051_2D8D879C 
X-CRM114-Status: GOOD (  14.84  )
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

Adreno 840 GPU found in Kaanapali chipsets belongs to the A8x family.
It is a new IP which features the new slice architecture with 3 slices,
raytracing support, and the highest GMEM size seen so far on a Snapdragon
mobile chipsets. Update the dt bindings documentation to describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index e67cd708dda2..35c6d38dc379 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -415,7 +415,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-44070001
+            enum:
+              - qcom,adreno-44050a01
+              - qcom,adreno-44070001
     then:
       properties:
         reg:
@@ -450,6 +452,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.51.0


