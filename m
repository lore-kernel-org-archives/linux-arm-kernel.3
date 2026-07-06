Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED2CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=2mEmiA22cLkLGiCNvTl4JuUNt4
	id6nhuwZWHm4c/CIMhYd5aotglPhaHJ5UecEpmyDZrP4E9TjmZv52jDfpYYJWGb3T8Dmoz1ljslXB
	SD5NkBvSeRsmYjsTIA1chR/kJoH7FCDtKaCRWkvI/5SV29wUOXrzwS/RIVLoluhkQZbEsO3SFPMyt
	F0lVOPY6iabvJvHgCgw5CtSbRPzm6srp7FFMfDOl8HTn4F6Gc2ibanKZHIOs0Dut6wR2V75/UlrMy
	DD17JziPbjCwTtDTFJgAhR59HlCZsR9BDClvA5YpAIzQZJ1uK8NxCtRAhgdhRlahtDUpNW/bkA7oX
	YddlUmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVG-0000000Db3b-30Py;
	Mon, 06 Jul 2026 21:05:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVE-0000000Db2b-0Cbm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:05:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE79T1428953
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=; b=FZ8j/Qwk9OdN6zki
	9ictFYTUl26CmsJYocIGqx+ILtabVxrVN4pGZTTBfkHVczbK30QYv1weMMzUgYo7
	jTvI15GrM1ZEeAKXZsWDSdG/v0AqxDI/Z1LOAL3S+tIvqFmjQddC0zSqrTZXrgk3
	MXvTtfINgtJVdUPKKTpJwB5X3aaEscjc1Dey6kaJH36Ejtmi6XyxullbdYrT6U4p
	HJhLF3n9kQmTMnjM8RzJBvmFfZIxZ4IgVvTJITr22wml8oU1r+X14PwhJAny0D02
	rmO0CfyqzN9iium7+AW3oW/jQHFlpy0SpfcZ37eGJnznIs1O2UN3W0TX8jAPQbZ/
	DUTOVQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxuhc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:05:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca3b314193so60591195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371919; x=1783976719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=UVwqVhEr5HQg8K2UGfzRhecOipOcRCTiGR/i50VtUciW0W4zcShEd1OA5d2YemCLcE
         dFum0C9KbBC2HtbzyKcU0fQmTGvvFU37hfDpVaiUCtuL0HbiEuyO+fbiRymHdOVn+5KB
         1Bfuyu8Ryvuw/bs2DoIUHe8C7C9kZAecyD2JlJjn5IAvzx3C6U9U24R8J+c5MmtK37JE
         s6p2neX1UnM8enZcRFYVYIITMv2PU5pY0/thM9N0VhZ8OmzJqsjOFlz0M/oYV3wsHpME
         dRZQ3iDytEPvXwewt6s5TmTtmpYn9/Ii3GJGdSoFVpzXT99g7A9UKJ3c0dESRTfR8Fdx
         qphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371919; x=1783976719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=exxwhZMTU/he8IZUkUT7QVw1F7W+mPM7cjzl+8AkNbk=;
        b=N3fvQwiIBdv4YXf8CyxndAOkh22qYNIfSQg5h3eKWpFQzmhRamyq5qz5UYXii+nvQo
         GM8iZTnOQ1rBP1bH3zggHuDQeTpPXM3h6iFM2YlWw+wMPdVBrkSPCZZ9taehF/687xdu
         BfzPkBE9CCi2IYeiQ0Xe7Eme1eFjiuiTvcGvlFpwqEcsYwsTWmspKqdrPQB00gnxvd1X
         vPH1H4JFzOQuqFfVtJoYaFIC0e0JDicxrEdOcdogYEqu3f5nTrqnKLChrHfyk2pOk8j+
         bYQPWiECnLysVYAcNwQiPsl1TAw+dXtRk14w7ON+c8SoLw9UbIk9BX5BNiG66MiAL20l
         8Pbg==
X-Forwarded-Encrypted: i=1; AHgh+RpeWIGPs2GztWhgEVsXP+c1mc6ItoBrj7VMVagv9M48c0rDya5kVCzlCbXCLV2tLh8l/RR+V2XUoZhqr9Xe5DXY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/bv8mvghFtbLfDhO1nxAEBJJ6Qhdc7ePA7jqPsXDfPp9yAdKZ
	55MANEpGCJP/kMSwuZPo/CE1orL60kqoAMOwTc6LHCtK0L4N6pdFHCBitmv2mzZcuZZxZblvvtT
	nqYEcb++NICg6g7VZ08gwHiEqyEnv1pM2fjdX4OP3D4Hvfm2vVmyLZWfFWuLYcJcZ44qwaj3NMj
	fG7w==
X-Gm-Gg: AfdE7cmmjaaNwaqS7nSHohUdylw0IqrMhkqMjd6liz2kZ+4IP61b0SKQ1wTxZGNvtkV
	PvTDPHNDX3HTRV90OfoA34ZirXQQ/xmpwFle/FVo7qCKt2fUZsZn1GgdMm8Nd+nND5jSszHojrk
	82k1um5k2Zv20kwmQFMkv0yvNVeruy5SvCWlOr2tiFoICrglPaWyi5QnmjFTjB/ouA2/25Kfe+J
	OfJ/YZcYYxj50Py5dOZ/qCebgVSo4cU7Ylu4fqCpQdoauZMW3nyUHIo7nVMikfOQ4kkEWL1eA13
	W2n+NiSkI3QbmywCwiIxwwFBRpR2Buuakdge06fTv+WvJ11bLSAVLpaxhx4egeKpZj3tZcoYDa8
	nPrMLP163+4L3zl6NyT/y3UZYPWk4qE462Vw=
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr23765085ad.17.1783371918742;
        Mon, 06 Jul 2026 14:05:18 -0700 (PDT)
X-Received: by 2002:a17:902:d4cb:b0:2cc:9473:9799 with SMTP id d9443c01a7336-2ccbe71f6abmr23764605ad.17.1783371918261;
        Mon, 06 Jul 2026 14:05:18 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:34 +0530
Subject: [PATCH v5 2/7] dt-bindings: display/msm/gpu: Add support for A704
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-2-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0reXjU4841qQsB76OT4bfKmGmY/z//RRWVRYHDWGzM=;
 b=vX6elNuOWQ/4xTG/AIha28ryHCrqCz3yvhkLfw4vwe9YMkegmgcm19fBeyeVORd5TxSW+WwUC
 /8wVZA0zXpkD5agy1gfq/6ZA/4fyK4Fhy6L2Kfebx+YnGBJfWNznNZy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: BS2h3hRxolh4nLKa0Qz2BrZzbMRt4Oxr
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4c188f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX2V0ff1FVJPhI
 EeHjjd2FQSriho9Y8uxTiMH0/NVgAF43tKY0GdAjRPun8JEBB8/Qocg7fb4Kb4ubjEbt8XoV+Pa
 /ic21N2gvi0ak2XPGQf0VRofv1Cr7pQ=
X-Proofpoint-GUID: BS2h3hRxolh4nLKa0Qz2BrZzbMRt4Oxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfXxugbdEjtal99
 6yoL7HGlmlLwg3cTrPkujzQDSRijRr3CbA6rEPeDMdq2jplwnnmd/QzwzHXpq/leLT92s2BO4Q9
 KhzESiSyDFuNUjjQ4veK+raEBeFr7VyAhOHpdBcUcH71x5ST++EptuPks9ipabi9l9DcRPQYDgX
 Lqzwq1aDzRk4Mw13WjZ38MDyRHHsuZj4PFtrib8XOKpGhMNUsmgVWgKKTeRdgios969htGTput2
 FqzN8eqOUuhNjTOOsl0X3qvZsN0gJkR/PU7SgQBt3zsHiI/apFIN7FQ0+smMpqu4VEhIqDWcz3S
 6zYS2GgWfYwLbAhYG1cYHoQZevf3wQ7fZFzibOsq3I1bUKb1ctMmBkbQSp5Pur0KER4IorVgZy5
 n0bMIW0qQZephLCETqlGlyXqsmpv+9gakvDlDJnvvsEmI8unHgn4ojdRN48VDyBhhwMmyBi2mA4
 /zztllq7kzXoNssLLxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_140520_115080_1F91D402 
X-CRM114-Status: GOOD (  12.50  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..8e648bfb3b23 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -353,6 +353,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.54.0


