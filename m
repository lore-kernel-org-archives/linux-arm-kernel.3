Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35816C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=; b=3OyZYgRGMti5J+qNjGfGf1L0eW
	MKwczrm7ktMw8TTz1S9vwSBmA2tfvW7FyRoj6CHRkpSE8CmtTXxG8uCqnz8vumuN5MDUdxFafOjjS
	7RJ+pFGmFQV4gmcyulhGi9+AJDiVmgyP0vpDpNQwOGPhNO4KUFZHgE9VE1J/k21IJjD9y6kc4BCW3
	ME/LMuBHsFfdv8W8sDfAcMb+qYqqZaMQTt/5HgfCcgp1363w3Xf7rI8LtYp9RLbkl5MKjCgwQKOAK
	n8ScJaKOM1RiVUwn9KyJi8m1XFyQtkxNyr18L/ByjBOsQlmfC6Qaud41JqGggwL8GxbXSWjaN/CYC
	mfkWejzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOJ-00000003DXa-0635;
	Fri, 17 Jul 2026 20:42:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOG-00000003DW8-4Akk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:42:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtXvq2887020
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=; b=S1+sFPv3oD8ZA4D1
	6NQJIZ1xqUfwllz50zIRqPmGzoEcg5+y2zpdUY6J3qfkScQ8DgHhkxXU27swrtcj
	tbBLWU0DDrKFCJPEtMiqll4uU1IQjxCjdKgApxmZEWMfJR5bPsPzojfj3rnxRzEv
	BcE1+0Aw15aX8ItF7etjkVQnPpRMDGUcvFa0b0cwVzCjKjMn0fkUs/1T33ZEHk4Q
	E31ptetYOI7hUXTz4KSjywLE64xSC78GVEgwYW2bQxit3gP+5Zcu6bYbaM7T6ov0
	fG/kEgxpKy43MxYDn26ajGVwP+olmkvIGDlEBGzBOTTsnKt/JW9TsrVH3Ui4OK6P
	oTdVhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfjm98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so145242755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320954; x=1784925754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=;
        b=D0B0yc3SXoAwVXzTv4oreAD2Ai+Tjpr7N0ADK1hhMJpZnTQG9SfAK9I3yjKU+Ruq8R
         c3fljLQxRfCE6JVFi7h2e8cCjWjk6smoMy5smB33ZuGFxeZioWhfDOVqi4F/mxDEvBH8
         G10GffFj/vtq+WHfCbJG61OlvRCvrvBUzGedrv35oM7GQqrhtwvwONOmxlyGxMGvQO0X
         08F+hoi67I2uH85L2T2KxccRh17SrgA5Z7au+r+EKKYwGkqBV9ng+aPj18aElW06W4wP
         IX1JbDBV3TlM8kvJuokryg9V3M2nvuAsrVWl0BI8y/sNMPaGfQGQT5J9skll9hH6NQxW
         05zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320954; x=1784925754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q61K7rQL8TzxQSbcJjMDH84anlusBLwuWl2h6jLOOmQ=;
        b=GB5M09a2i/ytHDjugt1iSRGXYdVsbTyYgZ62uGyMX24Xtq5/KChDDMfIU3DzuZ5KJM
         /XEiasqZhsiHjylkYiPSvif7AjEb6H9dCrnft2UI0zUdBIHTXIwqIN2W+oIge/2j67bO
         BEOQvStnqdKmU1gOBBhTEFplHUbhVo8lIucJzL1Xvy847EKH2u/2/QA+BgLcnZ3nvWW3
         WJanBono02vjtfh0Hzq6s54sou0FcPgyBybOYgj8eqCpm7VIW0pzdpr/8M1+xyrsphMa
         E1E7FPa1mslCR0jzbXD715ANVnAPEUPrYEnMU3x8uw9Kvzrpg3guVkoaoqnNdODccWM4
         0SIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1ic+70qtolWOp5ZGQ9tQ5HKB9OZFyhwPqoOQSyOAUKKSGrPOrhLIXHXsDqImAhc1KAZsIM+e0TtN5dsncuELq@lists.infradead.org
X-Gm-Message-State: AOJu0YyMb15Kb55Ze8GgwgRYD3GbQFe3vNDHj873asOBZk9PElJ3a6I3
	EfVi6ssDA4q6YaMSTbHr61G9/mVBFSg0UT40TsaHkIEujbeElXrmMqm7c8YnRmghGplA0O4ocvT
	dybgsuJD/yyl/9GngWxveKJjb4OsjN6yuNX/G1Fc+jSMdqP8R4m9t5O1cQTjHjiht+SIZ3ldWYD
	exXQ==
X-Gm-Gg: AfdE7ckhU2uSaneTbza5y59FwnOYLgNUVV69u6+KEeKNd8GDV8EFwI/sN/MOgptHY4a
	vX26UJgwOrha5dmXPlR2w5nHF5PJ1aUGuecyfBSTZScCkM8N6bnP2Bj3mqlTIit7L4mlHhjIqof
	Kt5UqheexOP89W5gmTendtODqoHR0JR/50FlvCrIwi7F+JzznS6t4DO1sHyG4Hvd8EFF/+fXG40
	tnoloNgvYpN0h64o34yBFW6dzUWIs+IS9Vp8mmf03enZCQybfoxLjzjfZ16VnBosoA0ld0+AdBu
	ByIjMDu9ObYBxLTSah02UmRIsMWWD0OBcXx3BoGbouAatXqScmBwA8Ctz4SXlicSLUzm1s3RZeL
	/LMxErEEvdL10SxSAcDs43Rmx
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr4276409a91.19.1784320953910;
        Fri, 17 Jul 2026 13:42:33 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr4276375a91.19.1784320953504;
        Fri, 17 Jul 2026 13:42:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:30 +0530
Subject: [PATCH v2 5/9] dt-bindings: display/msm: Document Adreno 722 GPU
 and GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-5-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1977;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=H03u72Mj2+0Q/DcdLyrGjsdWiF04QoAQmREqPJ+DCmI=;
 b=SJZVRrqpECN/vKCAH/EzAokdNAPN9nODY536Kc/SKD/uVN/Wi+sIO/cXcpc14W8BcSLEm31gH
 3S8w7NqkDqRAHSQssaeMIUwci5dn3785frvA+sLtN95U3m9ljtJW6d2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfXywiwpFPRpOBZ
 zC3Hqe2HIoKUZ6Iv5kC6JKGk+1dbjNP0mb4AJoVmfMkCNnpYYUh8gY7e4+pEZdupkRhuBz8IPdI
 F4UzBFPdUAgG2+2cpj/NsN6LBkUW1pwZcwA/eS48e65tBXK4UXQXhhHw7dEW5xN5oT9JWuHHe5c
 VZWh9IGk2Qqsw6UE2nMx3rOr41vWV1I6HYAO92iig8O+q76tIatzGKmiFEsGOK9GsKxlY6xt01m
 RBgQAvI61zENWY3el4YCBcI9akJePllaFCEVtatbnU1WZgAIKUgtC24PG6aLhG3fYENBN+qQ9wo
 mbocHv76C//z4NyleFKKL1DTkBVfqqG59OHxH2jM755Ptd6NFVxMSQctUuGQJt/OeL+IcPb/Pt4
 5SHnpAGo5ZiVHjlwKK1DxGGv7fv4fwZTsNN1HYl5ms99huxsXpHujIPcqPTNod+bepeJRCwBPYe
 6mPEY5YnpPaRSvdXfJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX9mo4wgvWwohg
 +3E3aEYgrLI2oRqWwBOxU+y8lkPjr7TREhic+uBrQAzxMde7iaYT04j+Mtim3hAhmyO6DKyum3A
 H8LdI38PlHs7wWX4nxABVxEOcRo0U8s=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a93bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=byR7QgRKzgUKQ7cIeKEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: gXcWPY0KIEWsFEnGs-nIb-Niw_1xP3A3
X-Proofpoint-ORIG-GUID: gXcWPY0KIEWsFEnGs-nIb-Niw_1xP3A3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_134237_160896_1B50844F 
X-CRM114-Status: GOOD (  11.37  )
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

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Update the dt-binding docs to document this GPU and GMU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 8578c2f8122e..9e459f12ce3f 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -262,6 +262,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-722.0
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
               - qcom,adreno-gmu-750.1
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d096632694c9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -443,6 +443,7 @@ allOf:
               - qcom,adreno-680.1
               - qcom,adreno-690.0
               - qcom,adreno-730.1
+              - qcom,adreno-43020100
               - qcom,adreno-43030c00
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01

-- 
2.54.0


