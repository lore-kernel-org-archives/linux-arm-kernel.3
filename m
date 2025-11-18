Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258E3CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=; b=Yft1f4UZF6JAJsya4Pb/DiOzAj
	ZmJgXNlml75e9myv4Oz5JVXFEbsgThwAlDv5raYfwYqH1AKlt+4pmkhJRqqtxxOtsYVLr8e0eEP+u
	T4AZW8UBaKUw8RW8dWjx/JBBU7XOgjz/xAziQBQArq9464xejlKT8UeRaa1hXZI370AFKlDqiEVZY
	rhAEnAsrFMFp90E+m3exv+fo80AmMbaxnMYVHCky0teFZN9tTHgVNue+DmRlXPVAA4vs+BZ3B39G2
	AGiN8e9JS9CwBywV2INVf6YFzajx0nPAu4sRyJEYcJiXbzT455pYMz8qZ/rQzJt/k0J3Lr4euv49o
	dv/sEUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHQv-0000000057j-0Yfe;
	Tue, 18 Nov 2025 08:51:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHQs-0000000056n-1Vjy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:51:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI2jpnt027447
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=; b=ZbQn/brjBhwoMCd/
	IXPswd+gdSg8ZixoZa5dJWsmP1Ku/zoA5LoC7BMJCRfwM0dL2cACyBXx/hP0dJNR
	w3gez8M0G3VQDwe0y9GX1ECUUhLBj43GfqOMriaOfD29Dgm4c5J3BEn+N1MYNSEe
	UmeJ9/fe9tXuwUhAJH3Vn9wGezXaxEMd2K96b+GZFFVPKpbBKdSVGFGDRkK2qIws
	c5F5qEGOddVkXdolc5LYbL+VBl7jBDAyAqRHr7vmCs68RP3IpaOevwTt4kEqlAMd
	2jQ3eF/DOGkCp4Rad4w59Y2nec+cy8oeqtvjQE8V7wkr26V4/+NJgzSuPy15ADCD
	8DBFMw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t2ed3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2955555f73dso60559175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455885; x=1764060685; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=;
        b=V2Czz8BocZsAoqNd3Yvvdv96IyFae+2utCZ4gGypkD7nMR8t3vIWvryZXHfsyoR0V8
         xG3s93FVL+bH5esmISsgPcZtBdH6WG4xyr3Bt0EBxos+qGp1V3Wa5XY0EHSX/6QiD5EF
         agAr8y8AZqs8S2WF9Gqj78uSXoszYmFydyhFpYG/KjiVI6fVCF5YmYJ0Ay73jJSNRos5
         cRZZvqdNNyKyOD6wvdpOvPsVAqQkQOk9DuC9mgRsSFq7/3FVZIRJMaBCisjgesfpXkaF
         5R3OzXeUa0iYr9q1R/BtFXk+/CnrzGR15UQpVJgo6PM/Lo6BxK0NR3ZHlP+LHKIHXQAD
         zAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455885; x=1764060685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=;
        b=FJrnk40DpXaNROGpHyZmZmuS5MqOfgX/6DyPJRV8QisLcS5wyqDqj+ONA3cPy1Solp
         FuS9LTCGYMxda5my3JeDYCLTva+/0Q1BFr0X7OiO3Nf8yyFjSafS9E1G0Gmt5nwA4QrF
         J5hbWMo583BvwhetgDvcnZm5gmFTArBe31bV4YQ+2zflRp7TYzAjIS/y97Pk1+g/4vBg
         zIEzivtKrQYWfw7SxcMWsWD4gMSsXc3+oY4677Wpx65HpeAO9hcZZXwOMJjvRnK9Jzaa
         tT6PgQ6amALryrq6tsKA8VeGxrkUcHfPRJn7F0G0Xc37vC/l99JC/SVAl3qMrrAAhaeG
         E4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHChvouGHab3udbOcKvMtuwj3t/mudS+XBj8lxecC3N0vTxYefXd8/hKh91yvA6DsURAtFZF5PDaC7fzsv3tpK@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzy2sljhWzChu4D/WHYTaQqux1oKLRtACkcuoLFf+FC1hbB1sX
	DaL7w3svcck4jM60AdJ/jNsGnck2aProl6NqVHY5RO+y9Tl/j7ulwWyvbkHu+fh0aI9v1A+kVnC
	YUlr47lQjRGzv38CmiYDjyAibIZYPjEN1ytlcCYww6kjRmyPAgAUt8hg2nj77yCXPJAu4M1HkZZ
	yWLA==
X-Gm-Gg: ASbGncsqelr87rRDUUBO5HZQzlC+5o0+Jucw11a7K6xczTswGAXcwBfbNoSiD17FVOB
	2VcGwm3tqTj0TGQ06T503aJchCdEAHhTnXECkAQgMI1ze0Rxt7anB8yv6wTbCoHakabkD/kRn4f
	AAiRpB3wRrldvChul0NLL/ZLI5YJsyA8AZJ3T7duUYFWScDNutRz7xXyXKJNQE04TGDsBWgmDWW
	ZyyywUIF5LtwTO5RDlKvT1Ejv2SvLpVG4T5b5DnTnhV/Psw6/fU1bL8NWsMIt7JMdeX8oU1vPYt
	fCGDu+xJEuWOWNr6ccYhHT7WIcSxaC2n6Teeg73qt7uTa9R6XmSSlCoSctcXLs0IuLze1RM64AL
	7VMRnYD7qN67Q0BZxLgaufsM=
X-Received: by 2002:a17:902:f603:b0:295:5b68:9967 with SMTP id d9443c01a7336-2986a752d17mr194312855ad.49.1763455885229;
        Tue, 18 Nov 2025 00:51:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbC51hO2dOCARJAyGl+8Koi6W7aP2bRmpLcyj3T7XMY2HEbsh68c6kf4TSJcXeGL2xke4r6g==
X-Received: by 2002:a17:902:f603:b0:295:5b68:9967 with SMTP id d9443c01a7336-2986a752d17mr194312525ad.49.1763455884759;
        Tue, 18 Nov 2025 00:51:24 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:51:24 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:28 +0530
Subject: [PATCH v4 01/22] drm/msm/a6xx: Fix out of bound IO access in
 a6xx_get_gmu_registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-1-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1041;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=75w/DSS2hsmQuGew0+oPiaGMUNyIZyrF4qSNr7xCjPw=;
 b=jLipoeUTateSBD+g7vKKvS2yUCM4T7jj8HbWbcE3idzdOQIu0EPirauUiY3Is2Tzh/Nibkr/K
 97kGQ3WCvoMAzjLIS/xjcAXB0eXKO6+mlb+Pc7iuP/yIi+AHnbe11mu
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXzily7iInjKxF
 Yc9PEK9os8KaEshh2uisJIy/BRPynutM6fap/TePHfOQ+1Djaf1Et+L+Z8oM+1oyUX80XhUwdPk
 gySvYMYsbIisuYqzbSr8ZO0SLzaWRF0AoEdwGP6+ELAKlkYXjwMCoPon03kpa/pEF1+FqAtIG+2
 my1V3cxt4OKIU3SFMyiPUhBWvz/Rj7fVKlQg+GDRXejj1oGKUbeQ+xg2n90NdugdspDCdwMZyHd
 ILQ3gsWLIK6IKmbm6uGGZjgz3EbJ+vRtI4Hx5Ujm3rn9WnPuKw1LDWX0SNhPUmAKPQ9e8gCk1P2
 7Nq9nxVuMIAFpb2Y2B/INF+is7zHEwoQ/JN4N2YSJfN87fde/ZpbSPBb1fZb7nGqMfNPnIXrgwX
 v3VZfRcznqUDTmgcDUb6cia8L0BTIg==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c338d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=PiXygW76SPkGC_ia2qEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: soaXifJS1Tw6_avPPEN_SWEfwzMjXHZz
X-Proofpoint-GUID: soaXifJS1Tw6_avPPEN_SWEfwzMjXHZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005126_411758_983224F5 
X-CRM114-Status: GOOD (  15.41  )
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

REG_A6XX_GMU_AO_AHB_FENCE_CTRL register falls under GMU's register
range. So, use gmu_write() routines to write to this register.

Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
Cc: stable@vger.kernel.org
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 838150ff49ab..d2d6b2fd3cba 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1255,7 +1255,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		return;
 
 	/* Set the fence to ALLOW mode so we can access the registers */
-	gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
 
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
 		&a6xx_state->gmu_registers[3], false);

-- 
2.51.0


