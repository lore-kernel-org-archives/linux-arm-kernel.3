Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED214C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtfhK5w7Yo+a5z54EUc7Xp1UlRoMo3u4slEdBn91UUE=; b=CxOMXw7oFleF3vX16bd7lOh4PJ
	OjjxGPg9Zvc1ISmvzrMjeOiUQFQzu4mTd8QkxWAsa2cl0Yv4TVr6TVOHi6MoVs1yHxhBOwTqlLv1z
	eBEwtq2lOdK1Vbb83kYFvzailZGdirzqu+I+Sf4xqYZ2OVkKsVoXOA+yQxn26AFi7kKHSGO2SBV7i
	TLHBDZkPZvoKKMa/2wJc+G8/CRrvNvuuaU+l1VOjgQtPg6v+0xB/yvMX/o0fp+UHXBAqBSflITky3
	YUv7pN0HHJnezHKRAp7Co7A3SDyLnfmvcboSaWURjHyAx1ktcz58qj8sXGV2JkZvDo8Usv5yf2rsl
	StuNClng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTl5K-00000003ZnH-1nlR;
	Mon, 23 Jun 2025 17:35:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThwB-0000000307n-3YF0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:14:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9THcI020768
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtfhK5w7Yo+a5z54EUc7Xp1UlRoMo3u4slEdBn91UUE=; b=naGXnuY5npw8Z1Eu
	SABjSFnHk7x5gWyiwyNUahSEUH8bKSqsv7pFKXm/WhVLMLkCyHQAo4gHMSTXloFv
	O1Rt282vcukJDHGbP45RoPRmsv4XN6uI1LVfvYw0zQxirykQZDv5eYf/8LT1Uxlr
	2XuAwI7OMSOJEuGqf8+I73CXv9V+4qhtiu0dBGLk85m8tdkOyPByQEiXVQzJQy/p
	pvFZy+x1A5pJxLFxLOJHFOP19zT8XaTo81Rynce17c6i1jFdgB3FBeMYrQkK+C8h
	S0jds8VF0KPXcUFGar2mSdMwuA+Hcw8hBKTIxfxbuv9VU3W4Vdd7HiIs/BMF5kDH
	fLCHFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rs1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:14:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31366819969so3932711a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 07:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688058; x=1751292858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtfhK5w7Yo+a5z54EUc7Xp1UlRoMo3u4slEdBn91UUE=;
        b=KfIaJprUO+EwWBFdIvWRD+q2iWRiEAaOhlQlwnAbU7YHHP7hNmlpAQKeLeHV+gKYqW
         SWaAWFUcK2RNVKl35iWtbCJ0bHczi2hwb16WSzJ8VOxLN4FiAXYLsohyY3+jKfBurxGF
         /9+T9+NwpxURptb/zCzOZkPLXg+Jc9nDCf2fylxCipKsmTxw2fyGipuZoHfoTVjaMilZ
         DV4vGKjgxYpop+KTHzzrIw4QEB1WlIh0Ma0u5PCAdOjP+CZ+ohMoN4+YRgRwwlCI8U8v
         KwBDXK8BQCW1DcxZX3BIy0bR9eQZmWMmjVkYuoQ1smUH8KEubDEGmRY1dhCUkdDipZoN
         jhOQ==
X-Gm-Message-State: AOJu0YztF2GMkBYGawtqZN4SYEFukreBAbdyIz2/vy5c1QcjCgdvza0F
	IrQoKS+9vDlt8qYS68PzG0U6hMWSYBu7wOx7dPFO0D28LLiEn62ZLQnSizpewpyM6ctFm2XGUbz
	aiVzUmXvLQAZ2Q9XWeue0aDFcOgKPukF3LK7tftFaRBIUVaeJiq9SljrpZ4qQuWSMz5Lrq67UVx
	5zeQ==
X-Gm-Gg: ASbGncu4UFbPcYM3apZy0zkG1IDWeSN/nMFu0a/IaN+rJe3qivTSYFMrkd2dYRZB3Qj
	TtNoBVKzGqSXMsaq1tWSGK6XdsFBZVHZ05uMW6NsZW5PSi3JQZIzZoOjotlf/gzXjUC8bI9f9G+
	d7MfJxlsfmudz7vs+jDY11SawfjUc22Uo4vIYcuoTJ+K0u7OJUZjYpzl2YllT2GT0sdaHYFF5m4
	bRu9NcRC5HfLm/YXQjrnwflvuM6uMGaMmnk9Xtc5lZ3EMyXMpePCL9uYIlSJbT7nOCPcISMDqYO
	p/hkr9Y+wp04s6yXIAWRMfxXpSNL/cDD
X-Received: by 2002:a17:90b:3506:b0:313:2f45:2fc8 with SMTP id 98e67ed59e1d1-3159d8c7c8cmr22958717a91.18.1750688058201;
        Mon, 23 Jun 2025 07:14:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE36OaUgAuAzm1zkswuN/1LVRm779C8aiQthxLaXOxOz/CZTu4jbvzkHS2TORWEEglAA5uAtw==
X-Received: by 2002:a17:90b:3506:b0:313:2f45:2fc8 with SMTP id 98e67ed59e1d1-3159d8c7c8cmr22958623a91.18.1750688057492;
        Mon, 23 Jun 2025 07:14:17 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:14:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:06 +0530
Subject: [PATCH v4 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-1-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=1923;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TCFdV3fJCtM692nAUJeh6Kg61bWHn7h/r/7bivD1ZOY=;
 b=ETabZqcXTpK9ISzvEMm1GGFzT3eN0ByVbCE60cr/JNzTmMAlrzM1bK2CWqhi3ZP4d4IF96zRT
 FJvZjKgub0OD0uTow4rTdGcZTwcRlp+OTMjAwTcNRLZTA2pOJL+p/8Q
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX6kLTt9qT2W+N
 qY2LLqH0f1A+7N3HtAuQEFiRdFI9abJAWLrWrwdagSKmt1x3stMI+8nfzyG6S+fJqHWYkZJ3WDA
 5gFWQNaXM2S86RA4UnD3cD/K2rpoo4XAb7mscLRHwEvg7Sb+5FNi7MiGTV2wcH8a2D5hgGKAlaM
 5LHu+a1XCsIiYn/1dONKLI0Tiyv6NfN0rPZBIAzsHPYJ+f32DzgJVCikzaW/rI6HadNFBmvgL73
 maSm3OGtA0gesQYBsiNr+4v28xuA+NyJlJ5dQxVCjosMCMU5ecsbNn/YuTX9PhZJaybU9KLdNJ8
 5ZFVC2Ff81xHZdpfVF2SkgT1fiCDPKAkcDHGc8Hw+cifS+g33DP3vnaTR9Ws/1IX3HL5lnyEJsD
 PPkb6UFJdI4VnKyhOUZrkvQ5AxzDUDKirVUVSl87hzG///APNcB/slrZkhJL2id0AvWjCXv0
X-Proofpoint-ORIG-GUID: hh3E2b2kDojK79rnQWMnUgnKlT06ju5z
X-Proofpoint-GUID: hh3E2b2kDojK79rnQWMnUgnKlT06ju5z
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=6859613b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PEQATVZ-5NWm0mRdv2wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=kiRiLd-pWN9FGgpmzFdl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_071419_894785_9139CF6F 
X-CRM114-Status: GOOD (  16.16  )
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

In some cases, an OPP may have multiple variants to describe the
differences in the resources between SKUs. As an example, we may
want to vote different peak bandwidths in different SKUs for the
same frequency and the OPP node names can have an additional
integer suffix to denote this difference like below:

 opp-666000000-0 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <8171875>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0xf>;
 };

 /* Only applicable for SKUs which has 666Mhz as Fmax */
 opp-666000000-1 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <16500000>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0x10>;
 };

Update the regex to allow this usecase.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
index a27ba7b663d456f964628a91a661b51a684de1be..0bd7d6b69755f5f53a045ba7b5e1d08030d980e6 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -23,7 +23,7 @@ properties:
       const: operating-points-v2-adreno
 
 patternProperties:
-  '^opp-[0-9]+$':
+  '^opp(-[0-9]+){1,2}$':
     type: object
     additionalProperties: false
 

-- 
2.48.1


