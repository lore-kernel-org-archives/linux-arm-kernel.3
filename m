Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AA5CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=; b=OKq/xEZBzCsoprsDbiTOsWIA/t
	oaV45UjQlavoVVTr4gDLWKSDmpdcLSfpVhK8q/ytPLrtZ77WCESIUs21E3+g1iDiUpY2NQVA+RT7F
	hKjxyRkrhyE8lN14cu1rizUR4FEN9/rE/vb9yNbVW6FFuFdvb5gwg0yUak1fs150rHeVVn3Ty0rQE
	PBb+cEIRlbdHWlvS+dXIJb0JMAf1n/iLjK/gzOXuDEi4lLaXEoNVNOmKbLu7tqepNozC+rsmdBcpZ
	6/+K9n4M+gYDX/WcYuXrSdiDEgHboKvdGnIxtgBvf8HrHNQvzrxxDIH1/IN09gBj+EE50NHHfzE65
	2GjmuDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUx3-00000005q8M-2L12;
	Mon, 10 Nov 2025 16:41:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUwt-00000005q2X-46mK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:41:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAG8FUl2867914
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=; b=FgXgnG+VzrNfD9Uu
	xxzWXTo+ysFP0KjKvm6Xc6apvKNGStrOzzMefelUuFcVtLxfr9PvT2dWIMPgxqaQ
	U4WcLBlhpmt68iEvng1m3nv7vfD4oz5HDLg9+cpyQATHFvM0ajH2IO8+pwYiBU8x
	shlQcv95904PwuvG5m441HI0euahNHLueZfwxhCgqrQF419Z4gS44D+GqEJ/kTNQ
	5ytx/8zFy3+4p+u/DseLySE5IHJuWqivxKA5QZFSEAD1WzDwBCshHpkd635YbuV1
	XW0a8phzd6Qtmims2BEq0F08BhNRXIY4f1kznhbGaHXewKtIcl32Rcm7sD6cASrW
	+qu/4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd761bhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3439fe6229aso1555473a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792859; x=1763397659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=;
        b=IgV4Vn+MinT13jq6YfiTEEZobwNG719B4P7sSPi2SajBgYF9xnRMTPbC3TSoemORkE
         vtaihquWeXwY92QwgPzPt4gdZglHsylPc2S9j3LHLURD+37jEVSitFWgfBYxYzt1/Gwx
         tutHIKprm2mNcO8cXRR2sAtydV9MWGe+2dj81mKV6VNwKdy1htUkVqJKZCV1/fh/OR9G
         0EDiWjB1oIg/F+vIMFv1EpEPAnEvI1N0GAy95SUUexZR99k3ZUT0sq99xqLIkh7Cd3OS
         vSt8cKxj/j0iS6YxKYKc7+opxeGPIBAmGDGpzmwlyLIBbzVD7Ebcx1zCuqfVK7cF+2CQ
         fGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792859; x=1763397659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EKz5Fgcl8FFI+imxbIKOoJpuYhVpSnaRPpvrLUXLF5M=;
        b=OMC5yJA/a+QsZzyOo6RCY8y0MHNid5dIr3ITNUv4h9hkqEfdF4GP/qJriy6fQd0+6K
         BXwmd+j9ATRJ0s5ucRi0ZZAWfPRa1Lbv+dbrtvgqmeyqyAtgfVAWUajOi+CtP3niP2ZO
         /RqCForFLglcizLslXqtz5W1+Xw4BukxEFt1qMmPGfUQBnUiUG5Y4asG95dufZxWamtc
         JGM5DzMzNFS/b4E4Me9y3zG1TS/UT5kT3KjWwolLwkPh168br/zN9ZXTfdU0VX7A6W6j
         h1R6lRRD7CJapHJkuEE62rCQLt3vbBnn2uznI47YaFOdr8i5EsSEDz6DA/0U2BJza1HW
         pNJg==
X-Forwarded-Encrypted: i=1; AJvYcCVUcYKM+tXG7ygaI9Kyakn05kgUQePaULVYoShj/+YXxUlgtVcFjRnVwHudXnlzJ500UiLIrqcHJhItfbeQFyZD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy16EVhDX6P4pZ7Q1nt52cTlWWyrjUJjrTP1YcqrY8V0uBmCT0y
	9x0f7wQobD7qxXhmX1dQsEhwVRosyIRSGVKIu69KagKHbCR2PzJpGwTrgvb3W52VCY/Tn1xeRar
	bozAbQ1rBKr+hgs25Dgf8YnInGbjCGOpaW3MvnFTNml9sX1rz6pq0L2hOK8AZxdehe8X9aD0UE/
	4soQ==
X-Gm-Gg: ASbGnctEyvYflYEnU3HDop9Bh/cgvQxWvuYOlNXMkaujQcL413GrofOLLXKBMVoMxe2
	FwM6FNnktoAeI13ySWp5xaWK2Vv7ezix4rLIsHojac6JKlP40PMs50syKCle/zh0uprhbT89wiJ
	bSC3+BAy1aI9bRkR/h7O5EClsYWYPO0ICdEZMHiegnjFKmWT558DYK9YiRMmePrFF0Y5dshk5gC
	kHKUgZrX+xpbuu2vDUUVC0wNo7hp8EfxKixk5U3YIV9aLMMT0GlG9WyWIQ/e5Pu4SY//NzXIqpg
	WE9IwPeDk8F12KsnM5XBeAcSnBI3SJaPBTaCDHnqz/cy3q9hdkjzbtPkaWrU4DrGhJnhpXkK3Xp
	moR2mpZ1CZy/OsaTTYroK9MY=
X-Received: by 2002:a17:90b:584f:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-343bf0dd563mr21178a91.5.1762792858797;
        Mon, 10 Nov 2025 08:40:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsAhzrL6dTTOmOA8ktM0ipxOyHiZ+nRx48w6MNOFL+Ma4SpEDRNwXEivWpIkv/T67KRQIZmQ==
X-Received: by 2002:a17:90b:584f:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-343bf0dd563mr21137a91.5.1762792858269;
        Mon, 10 Nov 2025 08:40:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:57 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:27 +0530
Subject: [PATCH v2 21/21] dt-bindings: arm-smmu: Add Glymur GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=866;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NgXP4H+ytjNcrx+o8ALLRhAZOLvOHraz88+cU8xEoFc=;
 b=P3JYEELDaQNqYHCNPT773ZPurLRY8irSH7D1ka8EbWy70v55a6s41XQrylNdFsIAiMGUQAHcM
 5oLMZZUY5xHBkdCRkIlYhXjOp0JiK+QgZQn+OMA4B0khnaxj4bei+c3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 8syVGkWyj8AM8wMfJz8gTKzpzlFgjZgg
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=6912159b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-Mh53b5kj-Vf1dIxLVYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX7JJJb+gIsIfe
 QaQ11jF5JecQVthHPYNPE7z+tWodq643ZEtmOh3heoUrdKvlLMJDsChrBJ8Slfu29X2qLDGxp0I
 64H/8IpMH8fJVKi1eO1d1OPGffGCl5/iDS09hMZw92oL8dGozDemZsRsSJlXKM0bgCXEvjkRbhK
 Hr8S4UhkX1oui70HV8CmbqZkWHhxHq6FHsBit5IUkxJEBldJ4eTUL0meQg8fcWEe+Etg7azKK7H
 a+e+hhBy2mW/VMLwUYPwb6ON5UI5O0jVwdNsJoEODRhlFBYvnbX6B9VgrjCHRxT9/sr381xSqHQ
 4nUX+wC7Z79AEQO70Hr6AG442AGygSY89lszmAGF58oWatRBNSsO9oTNS1V9UM8bdOH+z4et6wU
 e2DZFO5sRmpHb5IVhS74BKJxXOYq2g==
X-Proofpoint-GUID: 8syVGkWyj8AM8wMfJz8gTKzpzlFgjZgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_084105_944250_D7FF7215 
X-CRM114-Status: GOOD (  12.41  )
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

Update the devicetree bindings to support the gpu smmu present in
the Glymur chipset.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 14a9624e3819..cdbd23b5c08c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500

-- 
2.51.0


