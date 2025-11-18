Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF60CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=; b=27F/9mxOmrKy4CnQ0sSQ6ohJ0O
	yiQtR2XL1TuuH8KKxqAdMgnwonfdfF9kQy0uZtsGgKvdITxTyaVkw6fiWBz3pkkgI4SjpJuNvIWLF
	H2nV1jDBSRe7AwAslUWEYqnp8PQtC+fJaeYqwZvJiQdPHFzvwN7gth6X5JyfMCNVV1XZA53fcrCK3
	a8/Lbx7qj7fBQwwfb3BUjVKqMEWUw7FF7arIYMKlSTSfiCQT3UaMDp60ttoq9JKXenpy23HrvAM/3
	xv9xksTfnKvvbn7UV9M/UGwglnARo8+VRko3F1dwTmZsxoxYRAtqZKIC1bu0AwA+uvHLvxtuNhT8D
	phRFa8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHRD-000000005E4-28e9;
	Tue, 18 Nov 2025 08:51:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHR7-000000005Bc-3WYt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:51:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1I0884166696
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=; b=kG6MWYFm56FyS/dY
	diVBK7hBFx8rRM4vKOd/gDWtBy5atPPXqh736uHfkgPth0FtmszfkkNkx1Al1Ctz
	hn/znHNRxvEpkE7EVk9/tEtpMINtxH4qN/WQHA+oWq5VzVWYilZ8j88RssNxzy7W
	LQeouQChS/YLGHmgDxJd6lUPl98Pc1+GvDWy9jUyAFVcbh2YZDgtB+vP/0bFAeOs
	4uqf/7o3HkLwGcGtfa1yeEYTW02L3HXzEBLplDER9cjVE2ZVj0QmRNmwumGkjL2U
	zbSKkQ7CzNI5S/wLh+rf/i4WumDKsKNUTCNyTCSmOBpMG/DUOhtgALIi0LfklkFO
	PrerhA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593tupj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2955f0b8895so72396635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455901; x=1764060701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=;
        b=Rq66Tv7WOs1W92B1sKT5NPFvYfuJyxGHLRRdf0+tvmR1Bfy4aMCD4RPQ5cx6MGr5GK
         kYWoorHN5ZTUjNmk00gAgMRfFmZCvv9QGlup89H3F2NfuW0FXfuyAI16Ip91Ic7IIvsL
         q1YaAIr8ZM2Fn6c+7Cd+ANe5RZZR1nyC3v1jXj16X6siX+HWKfhcXRt9TXtHGJ/tk+39
         mCISrWMhih5feIEryYBVGEqWADxFCVrv8h+SDYT20APxxWRwQWRT/wG8Da3P4S8w2GfR
         drm425Vy8jrLYo8Dc3sxZKkaypbGnuI/mARg/hCGKodsZr2wZj+BRqIfCViOxDZy8RR3
         GsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455901; x=1764060701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rlajs93xW44KTRN0rgVj9S8DZUtP1T558SNf4fvM8c4=;
        b=PzcB0Vkh+3eRiXXC96mOzIpbnZTQNR9TYu31DQbisjhnePMsFuqnLvYlX8bnkFPuSS
         H9wHbEKO77tbxkvVzjaLz/nnk74Z8lIcJ4UEVKRs/sOqksKGe4cFVrJrAY+wbzOJrHkM
         UvumCfRskytn29oRB9rzLUl7E0EEazc6M4xPYNWeZF3bDNfxp039JTyiDUzRebMHWTwp
         IFknja0qbpuStX926+VLoeCSvcXEBIKqzs/R2jLUQBws/WaHl8jslA8CdrVoO7gHuQih
         YKqVqoS8+C3M5rRGtYsEmakXDnoJwclBc4UHrO+sNr3ZcUASxKujOFCtL9L91GC2tiIC
         WlLw==
X-Forwarded-Encrypted: i=1; AJvYcCVRmls0KoPaQKAfLY8TCPjjDxBvgbHNonZN9PULVH8TkceRUAugqdRhje5cz44pssuIfbct208rmrLerXN58io3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0tUUziabG+punQtvhl393ga0nIfJxT/8GJdrNsctGanibXTmI
	V/mdpclzk0KcbqYesiwSNyPPZJoHendKh/CpYBTRr5u1tSD3XqJX74EjIrmQvoRzjp31Njq7A7K
	pWQVdJpeW/irpYVdP3onLOH6r6GZjyK3WolbPFMpGZRA/n0j6JEfacJ54K+0+7zdW55dO5j28Mm
	W5AA==
X-Gm-Gg: ASbGncuho7RweD5sEvg38fUCZm0VkSCP/hKp5WkUDilQrv+aohY1z8LGB7TjI81eGcl
	u/TChsCMqr7qZklcC+4QpL+BvM9fZa9qhw7HxaSjhy98RTfm7z3r9a0PiCZg88cCWldn4SuEwZ1
	g9pQUBWKGKPSbFfPWYXiZgBMYSAL+ePGQsIzxnQMUXWx84nQCDFulH2HepjmxuC2oX7Kpx0A89C
	Sbbns+4+kG8XShhKJ80Xp4bCjRlma27h0qOa0amotjMi4IPEXzDeyLF1GEXrJ4cSrHDFZDoOo9p
	Z406+vsO/gQuj30aEqyi+gI+Fi/1HAtjYch9EgkMHiK2iyhavDL57kGIMwdg5D5rII1g+lwNGu8
	c9ghjboPYkqnafaYsIhyDD/o=
X-Received: by 2002:a17:903:2c0d:b0:282:2c52:508e with SMTP id d9443c01a7336-299f55124b9mr25184935ad.8.1763455900689;
        Tue, 18 Nov 2025 00:51:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCsVUT/gyxi19V6NNcgQ1Bhhk7hd0QU8Q3IwF4m63Apgo8HYRSB6+A4jdvCpbIXf22MBDTag==
X-Received: by 2002:a17:903:2c0d:b0:282:2c52:508e with SMTP id d9443c01a7336-299f55124b9mr25184705ad.8.1763455900192;
        Tue, 18 Nov 2025 00:51:40 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:51:39 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:30 +0530
Subject: [PATCH v4 03/22] drm/msm/a6xx: Fix the gemnoc workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-3-86eeb8e93fb6@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1590;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9A5anEH53GnLLVd9MMQtmEBnjJez85XhahSgwIYwj+o=;
 b=GKVy5XYk8J2atz7vVd9cbq8c445N4UJwCVBFzNslb6yr289XyqRF14cJW4/UDx5T1sgwFfTBe
 gLOlQU5BxT6CV9lRW2Re59yEwx79W/9ih/7ktY1yUUPaQPppV5gcEHU
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691c339d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=twmNDnkDfZCprR7-lykA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX1BhOAOC2s7YU
 Ut4qEMbtnKwFTDtulY3fnXtYH5ZW/QD7XZEVsrYR0/nLty0CnneuvHuTudxGomUeyMHvD8l4zAx
 Kj+PeXTHQSNYnuolP0EOpko2Up5tET4uilpuF8T94JI7y7UsDCVNJvrRV2u9ZsYYKd0NPP4yCgi
 8zu2ruQfeqI9A1e8bii3A6BtNIbVrDUAkTVoDPGjt3hLQEAchQK400xc23adr6cMpxO97yHQ4I8
 Y61T1vDiru0VtV3/qIBJnD1hqBRopfCK6xHusMrmU06TZuwnDbIoFK2yF1qoE06B2srH+yikokG
 6sI2it+UWXSX3Eg77Ig/33OdJvxn2y63rQM89m9xGowDJr+2tXZJq15C93qjHerpvp+W7tVAEZv
 X8Yp5UhZv7iUtZVCGswHUWiXgnWwCQ==
X-Proofpoint-ORIG-GUID: aMI9CXL0kJVg736nhVVlAojAlMyshOlJ
X-Proofpoint-GUID: aMI9CXL0kJVg736nhVVlAojAlMyshOlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005141_910295_B3C034E6 
X-CRM114-Status: GOOD (  15.54  )
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

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match the recommendation. Also, downstream does this
w/a after moving the fence to allow mode. So do the same.

Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 72cd4fe0905c..52653ad376fc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -511,8 +511,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -548,10 +549,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0


