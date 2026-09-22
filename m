Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2519C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=; b=LDwesFGWvIle5EkaavRH5KU9Xz
	2vYyeUeggq1nF19B7/RSRbxPSGkOafCmzAvTxADHsGiAC/RtfVgMXWTfQBEpLH6kLPXrYT06VgYNq
	24hZ5EhmdZFv3xdgg2AqWTjHLjMWbJockQnag4cM9HnoCyn4QYPiuyH8Eh1zjOx2rKhHCnq74lehs
	h/C6UL1hx6xltDfmsQyLoUIFvxt6JBod96t3zJmURPrW5PvLMayqddvaBZasJpuOwWYrOVDDIPdNR
	8/5Zy/bkGaRwo34/IlYvmnCLAjEoP7MG+eUTK9Qe4YcuMcPe9CGRYinV0gMgrO5eQIunZ9kf/msnM
	sMiJ0m/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Tt-00000005qeM-3CNV;
	Tue, 22 Sep 2026 15:32:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Tp-00000005qcJ-22kB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:32:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjNxA318300
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=; b=Og4sas+SKQOeFaXF
	JVQovsfsAPxbRE9L6LI1OZZlb+5mE4zJ+oVqtHKDP1lxyzQwgPW23kXP299H/5hi
	pCXt2ViHFOMzAl32QAjmMiFwbn/PcVChkWz/1eOgW+kauAt4k117GvOWwARuwnlI
	xCxHz2TD7A05jJHeISc2lLE4kZoPKl4ASMcVfk3mTMVMc/s1q5DgukWOod98VcFY
	mUrnl5jJ0JRY7yngug/JVEJnOe61C0Gtb6L5cB/Zp0XkHfyqwhOnrMd8RA94ikCT
	OlaZwJAgEAN9LWIRZrt4tGur/yRMp9L7AFDA3BvlHOzLvLyvg6Mne+XqYUf5f9ti
	91/akg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqhue1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:32:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd188e16a2so47352045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790091143; x=1790695943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=ECDnB+4dwOl9c47A3w8NuLjzF4u1hTzdI8Y7N/eAtqCscEd3uU3GPMe9XvamEKlpaf
         6nU0d3DgJtcW8kfLb7YA3N0m9PB14X//3RDhdSLtec9kVt/5HataZgqW/9EVnfZDhtdc
         lUiQvSuSlSLNkqJp5j8c9+EB6RD5JbFlxmIJIwnxSjJTCM+pfWbzr1BtQLKtI/O3Elab
         FKes76+1k+Klo0j0fzbsaTrfpZKLJJDf2UjRfy892CSgpIIPREWW1miApD/La7xJ9xnO
         8SyxxSByrwUWcM9dVSbBxvvAyuc/KCE4vCiUwiHhyraQTnzEzVnE23IPP+FRK7LLXotP
         HdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091143; x=1790695943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=hNYeIIgw4nyQDiXaR0/eaF++p2dpY84smao5257khOKlCjsz4O2KMLPNZXktyn0rMg
         4t7GrW3UZNIlpxwUfJDjnd9SWL2SN5oqAkfCLZoWFo65le1OxgZ404D7e6njg3XlyISU
         BPsp9wGGWTk0VNgzayhZ5qeMzd695hezzWuEh3h70vr0evUTbkHnfWTetSPEzLUw9lQR
         tpb9xcEy2761k4wqV4U1OdDQMwL8ViaQqpNdEOq8KL7iv95wKLa6crdpeC29ak0Ab2ce
         IxNoxyevf454eQFQ3qlUgkKY7K/HuiLwKlnZXo205mpRdNz/oQcsAazSJVPCz6//x43q
         DcUA==
X-Forwarded-Encrypted: i=1; AKwUvBz3h1/M82i2hhP9CPhx5COIB9f8G+he8yn+YUcoZdrwvnABvGCHFiloQuvujrPNLGK2bk1DX2awfdkmGe9Ek8tF@lists.infradead.org
X-Gm-Message-State: AFuF++lFAPdbK+O5hjFRQRysLJUzcfS9OfnkxNhb+1c2tw1uyDrjcVCR
	wDOBxE8GZoimzp7z2ckiQrkYtN8EXNfMmI6iV8wxEGriJPeMCpnjmrdJbfd+O4H4I46gzqmcMVZ
	Zlx+DO4JAr1m3jGdq5mmGcurNfqYZ8/QwchRb16Nze+jItlB3ebkzmuvEKuyOX8/reyP1kOxiJC
	r9Dg==
X-Gm-Gg: AYBFou2oafc+FXguAwVx7dLLoXeGe6uY6z9fegnQBwx9knOub5vis4uroksuXZGPH1R
	qaZYiFyPex0zQKjmgrV5fICKFP/Q/L7SkxnPgZmJbERLmyHiBcfOwGLF/LK8rTnOtJJwR1y7BUU
	1Qp21hGrLE4GHNbdibqgnlXs20H/c0ZIeh9pvwn15U/GqwySJOAUGJxbxoonNiS9fP0saAizFcw
	5DYfvg5TC7u7WbE6TAVH1ikzsSxgpBRAgdujy6awiXlf8eGW/Svcmbr2w4MeRF4Dab1LzsTL3/D
	laR+/xUXxQjZ378yip0zg87MQO7ZfkLkGpd0FOFm6vmT3QiB1/VrsVquFSNk1wD5VDMPLIgq6VF
	jNx/XxDQJmJ2Kk9imK8T1WQrnScOtQicluBE=
X-Received: by 2002:a17:903:26c7:b0:2dd:c053:d73a with SMTP id d9443c01a7336-2df60b31af7mr18928995ad.33.1790091143051;
        Tue, 22 Sep 2026 08:32:23 -0700 (PDT)
X-Received: by 2002:a17:903:26c7:b0:2dd:c053:d73a with SMTP id d9443c01a7336-2df60b31af7mr18928465ad.33.1790091142341;
        Tue, 22 Sep 2026 08:32:22 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047c40sm12334945ad.50.2026.09.22.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:32:21 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:01:59 +0530
Subject: [PATCH v3 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 vcc-supply property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-rpi_reg-v3-1-9214321c4070@oss.qualcomm.com>
References: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
In-Reply-To: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790091133; l=1446;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=hqNneUV85ciDgNcaZNEAxA4akOO2zgiQecHtZF5ZtVY=;
 b=17xA8d6Jkrrhj2Xx9XVwKjaTVs3B2U5YwnT8omIyAWoZimyU+zIncQAKSfpWjGyuF7NTEreCP
 a4zrWMkMlR0Ae6LEUCZz9z7QK3W/HMG2GDHi555b7FqGg/Qoq7A36VU
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfX866jpOzNEBz7
 YkJWHDiuc719OTQd0HwXSd3C33Q8ELOKLpEPXnXWrDOKluLR/YkP3jWihlXM63LACtI2vtQYjZg
 MiFvgp7auyz9iwcjIXxh5SihHAAsRmWAXt+PQWtJDZ+Ujtr9HCmTpnvSX6TSe8ygIXnwe3e1WwA
 G9XdX5csRNuPAadP3hXpge5NqHT3asB97N8sJQvVRvPbRP08Fb8DBTt9Ew93AEgWy/mFTLtmwsH
 JjCfjibTMdXx9iRk+Foi0a9lXjmSYNcsVm8ypOcvoAf//zX1J8fmdtzrui3MDSkG80Hfz+sBfor
 tV8E76dn3Z7U7nfM8LCHGKR2Ov1rd4knf0Ez8oTAJP9lP1BHfXbRiiSAkWCphXM+qJkw4U5D2V6
 pyOqQKf7mgNp5STbSsV2fOHWIKs0hLWV6kirVRqbzvnHD/9fuKX1HUXvxvc+tHPQLSL8jwbmvUi
 GMSYUhmGJjpDlWm2fEA==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab29f88 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=P5neLcC-yKLQ9RCq2NIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Lmc6Ux2fyMKv_9dOjjhXkH8Srir4sb0q
X-Proofpoint-GUID: Lmc6Ux2fyMKv_9dOjjhXkH8Srir4sb0q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfXwMKKvVzUdb5w
 SBH/EGAJoZVc0VqFjZbJii6my6/cG4zRkQ4S52locC9NPTB1ZtZ7ZCRquA1aF+I8GKPk49NmRp7
 7W/EujxarOxiPCx7IMYkg9E0obzSPOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_083225_656985_F54E2F77 
X-CRM114-Status: GOOD (  15.39  )
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

Add an optional vcc-supply property to the Raspberry Pi 7" touchscreen
panel V2 regulator binding. The panel controller MCU is powered from an
external power rail, which has to be supplied before any I2C
communication can take place.

The property is optional so that existing device trees which do not
describe the supply remain valid.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
index 37b9ed371b67..3e2cbcad6490 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
@@ -35,6 +35,9 @@ properties:
     const: 3
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  vcc-supply:
+    description: Regulator supplying power to the panel controller.
+
 additionalProperties: false
 
 required:
@@ -55,6 +58,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         #pwm-cells = <3>;
+        vcc-supply = <&vcc_reg>;
       };
     };
 

-- 
2.34.1


