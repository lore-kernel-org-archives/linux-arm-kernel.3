Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C36BCDB464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=; b=pmhkbdetSPwYYstr8/PRxXZPEe
	N+YD2pnoBTlysU2Yq2nlFAj+9FqXmzZdIvK+V9u3IKuPyOLVq4HoMPsDTCJI9HuVimqvjyUaQttTs
	e2rBLvwELE0U2S2eVzNRzWcSe5ERRzeW64lb7/l0m3zB35R7iJIN49unY3XnhB5GJHwkPTIHcQRXq
	I8RLOfi+cf05DTumuAxdxHOHTb7jEfWo8I92eRkFleuoL076zEaAf+MJY22aMasEyTqsRaii2abMf
	GIOxiaucM+MXM+GHvBUv/9v3a8XJjF/TZai5U0Y+wMfSh3pRNFX4J9//NzDIDMVQOqKp+nRwjlqmw
	7nVOe73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgnR-0000000BHs5-2Q2Q;
	Thu, 13 Nov 2025 23:32:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgnL-0000000BHmK-1R5j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:32:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMafw51477479
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=; b=fufrg+A/xvLPXJTR
	4goiQlZWmQiZLlyKIyzu7A0PvvDEGbY5TrNXy5RWDaW7zCoGqbpArXEUNNDCn3U6
	QIuxR/9S3N83lS0SF4YCS0rFr7xVW4TNZjYVh0Ex9CyD5c+gPEuQvrYwOoGb3PMV
	BoSm46RZq6QHmWCBlwhUJpG4XgjBlfwXf/8RKMIhrzQ3mPEd41Lko8PUMpQTbgvH
	Yrhsdng5FjRaP0AY25++McgRwtTm0n+avl5/HMgqJ/pjZgSGFnYBrSHLos779594
	OQcPnKid5h4OHFznwLit4FekPz4EwG3ow9sRY9HrgWbVqGKeeqtvyW1MCXJ0q+MX
	nN+6UA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dr48e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:32:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b952a966d7so2932497b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076721; x=1763681521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=;
        b=Z+yEzYk67ZfBU6wuF/YoZXKTM4I1VGXGoLILPAKlkY7jIg0Kav7ZC1dkvBjmIKMt3Y
         d9yuxwVRm/2t3ygS6Y7GW3BpZUk6ms6pIUxG2RzEbh9VKULYNGoem2b7WjY8/6uE7CaU
         ZT4grT6Lw4wLPWxG/9r4xOsSsi2PaSGFw95YPv9uE4hQp1rza5RUF4pHvRdqPxFYlbT2
         Q2Npmfww73PaaMNw+SJxVilTOFRaTcJ/RSIXYMoW50l0KFv/Cxv3pLUK744q130IQsuR
         uvKDxWjCTsB6R+vgJvU4xDodY4PV1726N+2LkYiO7Nrdw3UdPoTGWUNwD9rDgXiL64r5
         Kz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076721; x=1763681521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sx+7duOt8Mg6zZHNtc4wd93FWjeo32qOP0acS5OMuFQ=;
        b=PEWvDQNR7LC2UlHq+5Sf/3LdpwPaht6BCk4tw5sIezhs6r2N+Q1r82frAmlfRokY0r
         ahzMNJOWNFqCeenar4fZhyTnwevcwrzXSr9X+3WqGuG2HpG3RVQhj3IbJUihddzAbP/0
         Rymlx0tTEJo+zFnHqdHbnZaHWxJBFeQ7CNheLiEkvKYvSP8iDdYtKNOb96PvrsuserXD
         /F2qMCzT+ioF5bYxbZLAhqzioQqglOTFr5rNpoD4WtutzbvOi4CrrxEnImV4BcxeS7Zh
         BEffHHqad9UnzTI1pFbyiSd1jL0c+TSAZt4O8UX+P8yEx7/xJYMkGdQXZDXD/DHlop4n
         shQg==
X-Forwarded-Encrypted: i=1; AJvYcCWKCmf4Kd9ZmfR32BM1KWvMFYIIhEmj0XBaLvNwnJrfmvvSWj2nlDcsVpZyo6asi93eb0R+ZwxnSS7fF6Cvq00L@lists.infradead.org
X-Gm-Message-State: AOJu0YzlqxAl1AZ22F54ZAI8u6L2E55QQvOGqAn9v9+fADGyj8MvhS+7
	5HzlWnTYRBohEkr/DOvhfgrjt1W4THnG6MH6WiFNKtNyYeCwMjUlHn+7J/J8XZPOlZQP+DTDLCb
	1D/MNLgMyJshGv0akjyg5NsabGILf2GNnQqXprO6dsKaBb9TL+XXZ6AlDylrSbPY2Xwp7TlZmxc
	GDHg==
X-Gm-Gg: ASbGncvehuZ3pAC8mbDz3ebpPgBY+qv47ENVfdbOWh0Nkr8leiNcuIKTTpnjnx49zUw
	6XcctxbuKg+i7gL2aJsgcbA3BVHQgUIxTiEkT0jMqAMslnmgS+bi+WfiTBrWWn+Cq5DiHyHRJ+s
	b9OFJd7obnbjEsv2uCPbI9yoHyzMht7OkY++aTHTxtIy/41Gzs4A78oKMvLFOJr6KbDfxXTpQQ3
	sHhmW3HrXIhXDornV35h2ZzW4BU5XyC3qdIrAxlfZL8w1/o6dM45s5ogjDsKdE4fcohPT/Q7ZeC
	Vqo7WzQFK9Ft+kgov6W2ReonsE8+g9AZWbD8rsmWsslSsRCLqD5HTFri/8bMm0o84AILDYTm97u
	PH23NUh18Mkq7pOkqlqH/Vlk=
X-Received: by 2002:a05:6a21:6da1:b0:34e:a1b2:a35f with SMTP id adf61e73a8af0-35ba2692da8mr1640229637.53.1763076721287;
        Thu, 13 Nov 2025 15:32:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX/aqiHfq+KfDFbcwSzPve/zFmwha2Yv2xlolDdxZkmw42sGuTr2PqLnQdgxCC3lptWEZ10w==
X-Received: by 2002:a05:6a21:6da1:b0:34e:a1b2:a35f with SMTP id adf61e73a8af0-35ba2692da8mr1640150637.53.1763076720415;
        Thu, 13 Nov 2025 15:32:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:32:00 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:15 +0530
Subject: [PATCH v3 18/20] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=920;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+yhNHPe0JhwA+eOy4wzvzgK3jwdDA7lGVXF9GN6vVCw=;
 b=EVrIxsWJTSe1QIoktPi4f9hvpt+misNrn2q21fLyuIb1hcisO++zvNfpv7RIWnOz7RLMMksXA
 uKfR/4rWGFlBNoAJWn6V4gbbQ5DHcW/ZW+YYGwoh/JaM3aQxtDxxox5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69166a72 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nx9Ee08JJy_q_36Bb04A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9NwPzHPh0lKcrSx02K5cFm4rJNIJadsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX8VgLKqGgrpTZ
 jYxCQ4uMpX98gtja7UxjOGOcZa8Qps+HM7z2XAMr6MBo/Ira5wqzPHFbZIX9jWcMwhXxLKY+C00
 1p7QGmw9Iv+qTDjb9ZBWC4ZX/BdvaMfzpHabkLn/28dEi5Me9OmplLesQCrNhB9co4++QeLXSd/
 G2imlXw4kKT9LhBravudQ7pNEqJ9H1EO/n7nQUR00PUCXinU8x1lM+l8eLk6Gukii+Htco5Cfn+
 YjZnZyKa0cjAPwS2beo+OYgmu/RDngF4tON4H4qaRPBncg74I0QW5OUaTSB6+xTpGkcpDYkUCqm
 uiLTxVfY6vSGPedu5z40rncU/WyjktCorjcx1WCoDiwCrt31NCWA89H6UURnutFPbhOTUjc6uhE
 FBYlXOs5aBT8b7diCclfz2jknYDDNw==
X-Proofpoint-GUID: 9NwPzHPh0lKcrSx02K5cFm4rJNIJadsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153203_711200_8BC3A412 
X-CRM114-Status: GOOD (  12.07  )
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

Update the devicetree bindings to document the GPU SMMUs present in
Kaanapali and Glymur chipsets.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 59bbd20992c9..cdbd23b5c08c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,8 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

-- 
2.51.0


