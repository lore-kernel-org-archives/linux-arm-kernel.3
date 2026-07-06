Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=; b=3YsKetaeuCSvYSEwhleU/TXdVP
	D4WtcFfIHnLB8qaCe2+LJOQ1aPn/EdIXZTC7SplAXmVgFokNzVaFb+xK6+0b1F4lPesboz0lS8WEY
	Eef0RmADWOnFuOsYfaqddmxy/JMwf2YTITUw+anYwbr+zLBRi/ZUeQGeJsnCEV+LD6suhvUXLkubZ
	vq1CUqRh00zCAdRq1HKoL25KZTlKK1fcd94yHl6ydwdc4Cw/QgYLXB9FSqROODNdd8h4eZ+19t3X4
	JXgxOvVHWwgHlhN9XIzze91IzVS/QRaScU1py0Zkl/UgVXqOXyq6clU3vg26+T2NDEcy7EZYANjpK
	1vgTzrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr3f-0000000DetG-0wyG;
	Mon, 06 Jul 2026 21:40:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr3c-0000000DesT-2lBE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:40:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE3Xs1478204
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=; b=jCWKeDBiSZ4CNpz3
	UHG/bXB08T8jao6zLEqscXBgQY420HkAGU5CSdqRZHoPcUrRFtKaQJRqfG/PhdR/
	8Fyqd5AqqnT/XiPCqcFt+xHVl50PukrTPOmhiYNbjp56e/dSBVlBYzoxSMGOhJrU
	K+ieZnB1mOAdpwobm8JYAzR4i7LN/o8vIhjd7hNCmqNYLh1+YHNdUf16uZBXhxr4
	OOLNrKtiRzXFwzOJ19BU67H4AV7t5DIBbYV6yuoNLgs4Jvi6XhnXYL0iEH6aJTVo
	eB977Hv/7XMDbFnf5bi5yyA6+P4MJvDH8GdPNc628lR8JYpI3v6xrKEXpIvtp57R
	N0Y9OA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsbfg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:40:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so5766611a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374051; x=1783978851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=;
        b=aRgP2hEziNdOUOwUImMi3XtJOs0FAkoP5+1DGqtzam6AUehSjzLHTKRH+u0BPzSDS1
         4Lzzo+w+2qm3e4GCfwcfaqh42JWotlpmWrLVDcmesYs1DjiRLXYLg2fVvw0W/2yezC3V
         GgByNnGPYJiYRsxl1t5vKOJ/QYb4WPf3Kt6pftntsLsh8lF3Ctg068GcOd9qmL7+fJvF
         F8l3BUGZ7y4rQlEeZIoGZHqqv5Xk3sIMpIZppRkfCV1ed/7TsB4zu/0MwGjJIvtZXRyB
         OppOpuK0VuKgS45z/9k//oQYkhEE4k/Ksq8eB15F/2JkkJ71DYZUG2bPLTGEseFAIs8Y
         8rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374051; x=1783978851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=;
        b=hXY/3uLJKdNyN2ChW6wAC2qx3pE60lz1NoUgaRSoowkT0Mlo6wiGi4OmJw/zeGpfTQ
         Xnhkr9QO9wSBDXXdHnIhqq65ClikY4uCV2q1UACM6tiFyDjwurNtPjpSlRzBIhtqPRlS
         EBDERHPGa8Z7jBIZIph/M8Hs/j6OnGO9CCJLOomgAuAGfUFJoCOxnGfQR5/dQF6k7bcl
         t0V9GBXHiqI0PnZMBV3WiVrXmbkQ3ZiKM8NR2Yiign542HzHzfhthds6b9Ega2kCpuev
         uvcyL1IS5+jaG8+V7Rva5kQLgS+JwzjlWN3cSzenYK3HV7YZbeZ2GSUmpuJnbDHuUu0G
         v7yg==
X-Forwarded-Encrypted: i=1; AHgh+RpVxMCmqGSk2XkutXoFO+p1VpCZtAwd2xn0oi7n1NcoIz+mmZ7UrVNY0I3iiI75BX3fx9kIaKucEcFkQ+sgEV/i@lists.infradead.org
X-Gm-Message-State: AOJu0YwyWgTxbgvbuoiZ3k2LDE6ngEQNvwbmK5I9ymSLxllkR9fWnbHU
	n5HKnqkN/lZ0UHnHinsdoCjSdj6/0vc2oWkZnr7fijfyOs004w4RUPOzQTE4xmW2y/GOejN6JH5
	KOtniUne4CSWqkdS/eIhkFdUBHj0odGgGRwumc49OWYBcVoPQ9GsWQQ48/U/My+XPQUbzU3uOiH
	HH+w==
X-Gm-Gg: AfdE7ck6nne9KTqFX3O/7bnnNo8m8RqEPGpdAclCTgaw4f1gEC00gmPYnuETN5/Etj9
	pAdD9VDaLV5I487G2fdFlRqAp9o3sz+BnpnkZlwLAW66+6QDCFpPvfbx2qnKHyShBN62rAwhxAh
	nYWJT6WwQAk2Lu3UCOreoCk9yIu+2QyIckjKmlX3gAsHPNsmAm4000Ex9LeF2UEGaed5RfwClVP
	JSNz+WeLPW3fVfChh3ERf6QbiEuJ5VYBGYREbKxo3Bkp7OlXsg27yk/DFugG+ODssKzCmbaLf8T
	9APSw7BqPb3FH4NUWj7EHlnmjIUgSJZPuN21LFkJ5sbhimZct0+Ha/NK3lVlWxdFIdk9syZvFrW
	fsV1IYJHQvMkqvqPHBQnghlTmFsP/9ang0us=
X-Received: by 2002:a05:6a20:918d:b0:3bf:9bfd:ca95 with SMTP id adf61e73a8af0-3c08ef05781mr2677429637.34.1783374050536;
        Mon, 06 Jul 2026 14:40:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:918d:b0:3bf:9bfd:ca95 with SMTP id adf61e73a8af0-3c08ef05781mr2677399637.34.1783374050098;
        Mon, 06 Jul 2026 14:40:50 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:40:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:19 +0530
Subject: [PATCH v3 1/7] dt-bindings: display/msm: gpu: Document Adreno 840
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-1-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=1363;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lgLt7qK/jqQ9CHjMSFFe96pTIkCFyU2Iu+KakUcKLvY=;
 b=+P+NDR6cbAXILISO4q4L/6OEYgzU+DHpDtDOQUJr7ifwgex0pOzNyEowCA74kl7n5Srs35yDN
 PxQShTIo/yLAvA2XB1tMHqmYhhHkYJIT008pm2Q5i50KTBBYOTNWTQH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: eD4-Gd0AnsCbmURXnpaP5rhF9oiL0sCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX13vz3N9eQl44
 UeirIALMt7ONvSjKyn94kyKHRX1yxXVGHmFK/W6VFRgBS7P5mKMS52B7H/YUBzDzbszR80J/rYk
 H9yYVeVEeLmm/GvaCYrLEOJxMUfUoaeA3tYV+C2KELBcL4+CHumMnPMATCLdnZKfT0pIaXMAY6i
 J/waCZfJTs8fFVodQCgQgVtCfP51RF4bfHxNe6gjdEmgX4apUOk+JTp7EyR2ITfZpL8jSfvwCjY
 sCgPUloAxhM52LzXJpZNF4wrN1bGfdtjlIjIFzQSH0JAdl2M5kXiy1fXkSoXK/V62NOOk0GukRH
 Eexg4Sf9UYvIjUwmWYjCz+l2Lbpat8UhcoyuCquGQUcneYoha/lV3JqGooF6NlBHRLhEGhf+XO0
 s5sAwTSrlJmCQW24lZ/62DiEb88Q31FY+8rRSFnIM3DhknbH/B3NVkjT7GUkOTqrHnkg6WUDzQJ
 FRSxQGp0hcTXAT0xnVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX+P62T613Z+yi
 wvEp+g3w2In0bE7Hx/Kd64STPklA2NhrImB/MCb1Ux3djuO9mbsOE03XBI45iD/Fjpf2eyZXW0v
 9H75D+3PJWU2TfGeh/Ei/mMJD7fDIJ0=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c20e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2rxQ3qtc42-NlUa7jS8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: eD4-Gd0AnsCbmURXnpaP5rhF9oiL0sCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144052_820084_AEF1106A 
X-CRM114-Status: GOOD (  13.87  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


