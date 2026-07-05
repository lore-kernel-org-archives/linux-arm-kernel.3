Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F642C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=; b=3DjJ4AVQBdPXLTtElJkrow2LyT
	cR39CY7wCUmvmNeGnhAOXL280/UqQsMa1UWXQrlai3WkFgivUnAemoC79rWeC1Bh5gH5yjN3/JzVP
	Vgin3PxadBvrTIrQIlLI2mQngPCLmVCKPwpdzKlx7AM18plFQQChx3MmZXm2qYInDX0xfpDxrIFL+
	EqCnGv/R77nfnobwq1sduJR1VhJAbRjYuGYN4fRTOdh/Z0HEA7CwXjaTsjOwaCGlYr8BAsX+4nkzX
	eGeFZ9Gll8N5KCsvqCLB7JqISeQ6J0kK3zjKRrClRbHTYLPsHjgXjtr6jIizVQsxAAhnmXRmOU7sG
	x+S1iw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHmo-000000094vW-0tDS;
	Sun, 05 Jul 2026 08:01:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHml-000000094uU-36dp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:01:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6656Jei8930204
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=; b=BezB4TOkjvnOWtYw
	UkpcpbynKs/qu3POkRXnKFaGwJevrfu+kK/8Zu1sks6qnMGiD1WDvPTEGF7ZAAkH
	iA47ybIsJHYT7bgr27fVi1RV8SB+2OH+tYgooo+dsBdXi/4VcXmXesOT1skFK4gg
	2WMWz9oiq0fYfd2fO3cIjgCB3AONBBvQWYq+f9yxFqMLglGeZcJGVXYujWq0o5+O
	XQ2k5sWsADvSPN0Gfj9OL7FnWRpGmdHPgXuPXzKVQrA6vrSLrNwPYcRYuqfNpMJt
	KRqQfDRMCJghmhrTux9jVCys5W7L5gJ+vnLofnW8BWwJUALtSAbf84UTU5h+OtqS
	Vxn6sg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uj9pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:01:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so1761668a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238466; x=1783843266; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=;
        b=d7Ow5/uelp16V3QsJBcEIigu31FqZ52wpq25o3BS7ayBl6cRRfUMDZcBKpNFFC5+er
         dhpDVEHLd94507FRvMD9mgfkvZmPAtZVabmIUqRdIlR/fbXtFVtnaHmff58az23KElLs
         1UipWOi2BEwqHzatYVLiD7xlaNoFAI5Son58Y1R2TRogEqcGcTcuBg0IkQTRgWQ5bS1E
         h1AdhalwbvR6MU1LTzQyREoFUyivgTgKxEj7Y7L2aVDNcx6xcaWmOnRS8JF3NOpXLVee
         8RttsBgQJDb3/0nGle//LmCpdZtBM8WZEflMYdROZzQafpagM57N/MmNdM5g5rPseil+
         kGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238466; x=1783843266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=;
        b=SIpfFFMy7nOfek9l4CqBz8a+5z/zKxX4pwVxQGVYz57E7TV4hQ1D+VEHHLF+Yy6K0U
         b6nmpGMAVSYSQE2hJAsvTwveS8ambuXnw4XK5EMMQQEDMJp1Un48rohylHTd1IgSbBRr
         OkwHXAN25SBojOWtnK7PXg/Gdq7/tTkcTg/FFTX65RsvG1MCmP+hHJf26SXBX1SQCJJ2
         qPjZ0FhA4T+mHsjYe1BTXbspXY3ECYPbv5tZAgSC5g6vlbXSHI+n7+ldaEMk9YhzHZ24
         Ho/81r+LtXJshCt87/5jc9rzcjTFoF0G3fpRikj4j/l0jfj/LiS57YRh4fW1obvuBqn8
         PflQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVJRLo/XiS7mny1bT2gj2BcuxEQ/KdHKDm6rEZdm4+ql2QAo0KDAPUSoioO5Q9xYRZ5do1ngQ2akPMvHfmddmC@lists.infradead.org
X-Gm-Message-State: AOJu0YzbTmDTeSYYyVWFb78RaglPka9OCVHq8lRNzUZ1RpQHaf8xhWgH
	OJEwWiyaTshPOFzCm94P7stksYnW7PjVXPNwn3F5jHUqb9fYPtWy68qkA4XSS5qiCHC0IQRqSKC
	tu4bS0MJUDeMPKpGlCD0bBlanhdKrO3vRaoBsviS78tCe1DU89YCKYQS/vTM9cE8avD7/PmwzU1
	RYhQ==
X-Gm-Gg: AfdE7cnLpniKeFxQJ6PmFoA8nFrAcpfaKnj9URbahwyYt8q/+lxXDR2anGXNvsklsRg
	76qjfjTwV2HPIg2mrEfnTzCVh5C1MIXf8R6Uc0wlgPgCbrwvnkaikeTm7RisoNA0hIzkeaIx1Qh
	q56bL3v9j7XuFTd6eIe+daPCsT1GnLzl/843Z2ATYmGE97AYyKrU7G4J2r+AALjTEYmmq4spAPm
	SSksBbNuJsc7Y5VqVwO83B2di+Mfh5Oe2P0HToiPUdhi+G+Yn8mNFsErkElz1+At3mSZf/BkPh7
	Csqgk65mpaoS5S3jkicbUDrSKDIwxXJby3g7vkjVWJuEzlDqkXeJHLP0M6N1Gs4wHb0mwrP0iOg
	7KaBqx++J2g7jnBgmMa5AjBYsvrUeHMFL4j4=
X-Received: by 2002:a17:90b:38c8:b0:37f:9cdf:f03c with SMTP id 98e67ed59e1d1-3829f7ece33mr5155177a91.31.1783238465476;
        Sun, 05 Jul 2026 01:01:05 -0700 (PDT)
X-Received: by 2002:a17:90b:38c8:b0:37f:9cdf:f03c with SMTP id 98e67ed59e1d1-3829f7ece33mr5155121a91.31.1783238464724;
        Sun, 05 Jul 2026 01:01:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:06 +0530
Subject: [PATCH v2 2/8] dt-bindings: display/msm: gpu: Document Adreno 840
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-2-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=1293;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=rEVRE6tS8OEt2bDdC+eNcX3SJvvj+nz8Z0ZGM3xZAcU=;
 b=GAsTe5la0ufNmjlUop0lHQSJGg7ejUO8suiNPoqkpIJfG+V5N92J7e6DKYQWZC8idtEXAlIcA
 yq80BjmwnsvBgjoxZvpwNTPTexaH1YVNCh0nbT5Gn+LBYJAXWitzzKO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: cqVT7pG3eDh_8BuLQjKziA_ZcmF5NW84
X-Proofpoint-GUID: cqVT7pG3eDh_8BuLQjKziA_ZcmF5NW84
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX82jCvfVEPen4
 dyTJfVgB8xO5PHqYACS0vam6+LLEfbKl9e7RsrwKLG7GejMOq6ePkkspY95XSub4dAsHRIJ1Cu5
 q9k0WRvppRDTm8MRc9agY6yJsEadFig=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4a0f42 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2rxQ3qtc42-NlUa7jS8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfXw/yCnkYfTcuh
 o7TOXD+OJ5s0xjGyygAGIWDmOnbgGuNjAZX9z3jdvwUg4cs3QOJnUSdy1PvE5vkWKpzqaU73DAA
 /0OKNE5r8Vm5VMYg7uJ2jsyrd5tRbkTiorRZLy3OWynRQn4eR0MxPXkJBS6XDaF9fwDvze3b3eV
 Q1lxZc2/KPU+CIpa0PQto2ophVeKhxnk5y4whEfarpTZHbVv0zE4PHH/zvQ1Ba0XnLMUV8/kSR+
 Sg3cCDNhSDU+nJae3d8WYv534HFogOjUwySHq07cBo3CFYphO1X0RRvpQPDZGbJXR/c03h338Wi
 Cz1zaM9t71t7geHaQAIFOUVj5feQWR6G6eTXuY1SiKSVF/YTKU1Ss832ghsOSsZjxGnoDE/LxKC
 GBDaimsaPYHKYqhKXWNyZ1MEGHoEhjLV4enTUcZEEJ+85NwXw59dFLhJYGzjV5r0PZC3wGqp2+W
 e9kLqKQMs+VqV0J/U6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010107_903843_70514388 
X-CRM114-Status: GOOD (  13.25  )
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
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d0b7304c17af 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -413,6 +413,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
     then:
       properties:
@@ -448,6 +449,7 @@ allOf:
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.54.0


