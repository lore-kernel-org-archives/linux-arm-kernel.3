Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC6CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 19:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=; b=g2dEuL7iEjQ9yeEjQfEnpOJEYf
	cCbkCghBa2hJQu7zLl80bMMzuls8sIxipe2CrxU9rl+SHuUEekbrlOgrm4IVgnvSe3LtQ9BIMpNLx
	Oz71SZILdPDTMNDXt5zNBYC1ZqPLYfIPjhiM40kisotcDKjeVgoazJxoZmDGgL6nYDXaGe8Egh9k4
	JjEzhL4//J+uDJ7Mkx8GNfzaqVcfzoaI+D/dxsLLYkPgacd+D5sIlP98LtEcftZxRNNHKMcynzIH1
	rYVzA8lTWsl4qqjCHzSZMPqvDSYSCHVzGNnklsEh2LZ0Ygf0iJA6x8xUSHflyHOgMZI/X1PgTIvwL
	d8QZQikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsgL-00000000Cx5-3uL3;
	Tue, 12 May 2026 19:22:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsgJ-00000000CvE-10Wh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 19:22:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CDgKgF680213
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=; b=bZf97tOGRyEE0oAa
	X1dFXhFPupPx5Xm+inIKhxZ2AiqxWkHeS3+pjkttLQS15PaqkD5NmqcV2K2tR07N
	4xCiGKoA6xW1w86ZsMG525PPYHIItjicOThVekEdKdqPy0zEaiQ3S89smuSr1uOG
	rNVXKZ7ZK++HTwhp12GsF0/9i9LJNI6eJ2rxCzr9JXo8WnsWOqfufrLFkdnmq0Gb
	jngW+Mz2QY5+/MQ5PVFfiqcHcUx53CiEUMIGX1GJ0kgnwvyoiV0QN1UNGClXk4tu
	l1PU8Qv3drmHmnwdRAPW5j4OpkAa0qbhMiXtbPmEsYngFrAGULKrdZ/C1XhQvifd
	/HTjCA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avhd3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:22:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babc42244aso111455145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613733; x=1779218533; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=;
        b=EvduoUznIHKBXxiVFvzeY12anef5Uo6v3jz3nJavOmKuZf3SQEp1a5yQjXvtGJOt5s
         MpWLLU3ruge2yTQAKrduQQ/stp74Xd4M1/7tLTVS/je/Z+bl498GJquqgFjdUBBAZHov
         le+HzSyuJLwNDhnvLZam4eAYy84JdaEz5o12Vm7Yu4FaUUOLbxLVOSgNN6lrOTF0XVpQ
         nTKTZnlM8l4Kzryd92J5bg5YSC/W3yLkogqNFmLbQVbnCKm5SBwfUrUmH2aQVd7Y+Y7y
         Y/ApcSN+uccC40ee6B/ls6sxfVBaUwzUNgyjUW3v3u3wrlWzfP/JRrnWIhCHu7ZQb6pp
         ltFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613733; x=1779218533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18vX5BO6Ky0YjuphCfCL/g3VnD5eR3Y2KIwiC9kySjg=;
        b=HX8zjvV5Z0Ex5P8DFhzglsPrDO56goXe+eV6Wl6kmIbSOzCrAVu6IB6AZaEo7daJ1I
         C0mmAMbNUYFN9N3BGhdWlndrlzln/qxIhFecmt8k3x9dHOApiKeKz3jn5sDQr828Mz0W
         vcFemXweiq8Lj1lcYVjj5a3wF6sX5ByLHgcjwXtOTFgtSZXHlorH6UnYSZJyYvEE8pMl
         AWoT1IRIULW4pEmsn0UZmtfbe/+lVQdykceunp0C/zu+0VMFWNMs97El0K+U1BJ0jFi9
         ++/5ibEIuBrFqgPFByCP41wQa5YJ3WhOzUOxJygdK5hC8UvI2EbvBWt7/J97peVJu/x/
         iyEg==
X-Forwarded-Encrypted: i=1; AFNElJ8RpeqD7DfRNbiDlo1IMcw5sSXhvrzZi9HfWb1B2uyknUOxRQvyOulLgA6/Z7xglM8WuBZn5UEo/xUj/jredvtB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/NDHrw+XJELpV+VsUR4DIyJ2/ILFdEAcZ8+BJmBJsrAzYq2xN
	3jwGABUnqVsxQIcZlu0/l3V5Lt/BIy6mXtKenxbfT959g0PDEyRX0HI+mGxLJdbi4VVFPrQXbYg
	h9l8ANj4yWiN1KZrcxZgomMjZH1YmXNbYkeAh/hkLQ/9gPeIEJ07vFyjrzcXVeRJNRF1PfvEvBF
	GnTA==
X-Gm-Gg: Acq92OED2W6IG22/z8c5csHI9p25DhLutHM0GfbEktx/J7vu0SDQbAU1DZwGe6vu3A/
	Vw5Duz6OujSXKdkMZGPZDq/gBc9TqB8SRmFJFa/XbOjTvSD9TF63zo2KecaZx5OZYFLWmmBvOqP
	lpXs6xRUv8UqPBYYYtPK94/wyOuFrytPYgyJGKOta0V+gt+mUCeAU6iuu9KvCqycydMwXxjIYBB
	vvSRAVhFaVUgKJefLMfzfFdDwIHnekZRbd3QTT8RcQoGf1D/Am2daWRy75r0dNvCcBGjQ5Dn7Fs
	JXPagJlzx15WI59xgC0gmgYOPUvYpDGGb9hq50cqAy5BMmVnYqIr/+OtZEu9vxXTXvyUNjlMOA9
	7A+XpFvLS8s1iSkhkvBDCAdXjiBGYT+vYYG9Jhf4IuG0sEA==
X-Received: by 2002:a17:903:8c6:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bd276f20f8mr3596565ad.32.1778613733148;
        Tue, 12 May 2026 12:22:13 -0700 (PDT)
X-Received: by 2002:a17:903:8c6:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bd276f20f8mr3596105ad.32.1778613732663;
        Tue, 12 May 2026 12:22:12 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:22:12 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:20 +0530
Subject: [PATCH v4 3/6] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-glymur-gpu-dt-v4-3-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=1014;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+Y9gYZSkWF93iB7//ohDWKNnMjwm/WhLykXaB9JYn4Q=;
 b=sJd52zbNvhJgb1ND3wewPjtymBQO1zHcJeff4xbFhYmqzmdH1ZAPEn/CEg3GbkRyuYyQW/n63
 GG493bLcmq7BWjLKyNq7Z7xbAwWo7HUq3kgm0UbPs89yZspZIMONxfz
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: R1_kB-LjqkX9SAqqbvPQObKOLdMKN5_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX8FvZtXrl7c/h
 vg4z64zoaCUptvUKbWQrZ/BV2TOsqrDZ+wZ3Y74Qjyh6KNd8u4j1f/IPE+3H2HBjjN6ZWnlYrwG
 rsZAcJbgSswbGOq6kCuqPlwPexXMO+zLxlz1rQJ/6TaPE50em/EelPE4kbspEu9rbkaAq3g8P7B
 CaQui1FA3lEV8cbAZWUD4K7h9QKIMDd5JZHEdpOqrTlNmq4CjPyjW/StE2E3wcfPAJ1uWxRLXE3
 83iPklevkDM+Mf9mcZUhUiIfzYkt3idd7ThZT+1UWpQfNnKh6x8OWJaYv9FjU+VW9CVd74mcYzE
 miTFHnAyiyAnPG4GLH/ZDsPOaG0eaUNfATSLSm97+V4nvuRFJbt4eMQsRXR+DH9D4z/tzXOMs6J
 A0aixiTMQOnsrHvDjmDcF3DwWOXK5sdSQVeC8y6pUsOrk+p46XMzS6fkx5OJ10WG9Tjv1akL/8n
 8qCxkgX69G7Y2n6xopQ==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a037de6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RQVZ3Ks9ONUmwc3llXAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: R1_kB-LjqkX9SAqqbvPQObKOLdMKN5_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_122215_398706_D7546CB4 
X-CRM114-Status: GOOD (  14.20  )
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

Add the interconnects property to the common SMMU properties and extend
the sm8750 clock description section to also cover Glymur since it uses
the same single "hlos" vote clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..b811ece722c9 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -566,7 +566,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8750-smmu-500
+            - enum:
+                - qcom,glymur-smmu-500
+                - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500

-- 
2.51.0


