Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B390CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=; b=h9mm67BDhTThOCYoRDhggn7vZx
	wgaqNXjLbcPJPa30/j80EDzvJinGEleZ+q2VchA0Ffoo7HCTd0EvohuXN19GsAEhQ1v9ZG9LzeIoK
	HBCYqeX3wvWQo/LZyp+c0SuVst+qy+wWaen46k46J2z2fiNdYUJZlmHaX3+Das7q4cSOqFL0t2AfY
	Dv0mf0DdJqjhmS9vvCoVMGJvEbJnpmZlYSxgV1oYKO3YqAiqqc/+mVvbI0Vz4KI/GAM4H5DAMFler
	bH6gzztJ5Qc7DHMcThhJ9yUvgHNZDAoazP2z0fdDRrfShsQTAHjS4T8KaPz3qxQqee/pLQffn5v49
	j9eBZ0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUuP-00000005obE-0qqU;
	Mon, 10 Nov 2025 16:38:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUuI-00000005oXk-0Ixo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:38:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGYMUO4070676
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=; b=FylzTH7qXckURdUD
	OLX83HGhHgJ+Q9hrI7XQQPI62RDSKKMBhh0bziVThWbjjxWf5o05jdu1XEuAvH8e
	y2wjqPz9YWG1klmm6PcsEK+dGJf1TE1OFvEQ5q6vtg4vTtft9dNnvAYFpwAGqYtI
	5cMkGqXJG1ErKfP5JM7siZHbbmnWs/YWf5DSJ0zsNpgkSHyyNeWJZlJCu9fSBCTi
	h22vLn4WnQF6xiaI8+hwlP4O/MMi5QIvHss41z8H5CVHvL/9YdB88qbjl7VH5R9z
	+pplPbbGPpUqPwS7snab8AalsHi+UjuVhJcr9kzTwD78uwY5lHZ24hYcBCC7LlYH
	BaYOPA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj80h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3436e9e3569so5102662a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792696; x=1763397496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=;
        b=Cu6FyIyGGV6nmjmXttqObOMv8I4uvQCQKG5d766wIZL18WuXAzgraWedXt3oDHI7PU
         znlQe0UvFc+H8JOJ0NSZjNvgNsqODJDv4923cQv+c8Thd/DZZrSO+zmZM1T/f37y35Ng
         VNIgEfH6p+gzmOVhsVd4K9/BrQE/Dwl8Wy0WE9G8ws5tRUyLLxq//SkVJhU2GMDAV+tx
         RANpG5Tw+qnvzB38FoEYizIYzRtqHOYrdgkBg/SQRVgaJtifMKAllu6TSVoOoMa3Y6B4
         YOx4ZxOx9eJ/k741kOTkEU8MfwfywVkrkZU4liHtYYAY8/at94IgPkSs1rCHy/PbqFCN
         doCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792696; x=1763397496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=;
        b=S+k1yOGyprZY/YyGOegnuYdLsCJE70JJ55fXGQVVX9vNzzaqkrF3MO+FbHMmqFIw2y
         1qadWL2tzdXetT0sblgyxXhw8wIoqUWaE+0MgASFGNsbocqOHeueOmC+7/70N7OGbJUD
         csVmkfNeUzQE/TILuBKB9GA8HJmIoF8EkjIrYKPymG06tZEEB2KFDN4Fi+ikhghdHQUW
         lbAqFByND3IvRRuok6m1ziQ6JS0Dnhrz4g2IcAZZlqr9jNMvhgSNU1uXsdD2+j0fagkQ
         XSWSZRd2gqW8LyqVofbPvIjtD9tTH3URySKlGmlYm1coiGUCdxQnxltR6xlw/5akk60P
         40yA==
X-Forwarded-Encrypted: i=1; AJvYcCWCdgeJey50teYSFAHeiRbR9GDZK8D9Lxbs9q/Sos52Ukgq65BRhXB2kIhVgCS0myTDMWnYrrvlLs8rsYMEV7sJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyDGZ+yOC1AA3jwONNgWYATN9MU0AHqmTGsvX/GVSfbDUXGn5S1
	hsdl2WxEuLFkQE1b2tcUZ3EKwsI8Z1ppHsrfrTndsVLuw+nj6lw11J43IhXsyBUZvJEaUQV4HAQ
	5s8gigBHHDdYRURlB1rG2622chugK/A85b49RhaU2nyLPzOYkvo8XwKOqNOHEgmQYUF719jEY6A
	NFpg==
X-Gm-Gg: ASbGnctcmGKz+Ip4GU+OZEPorBxRJs5hvxOYjDUaEf4WEzyWIo+5K/aedFxds3MxHYE
	/qMlqXfoGPY1YGAuw0fZs5qFdwrlzlAxqAs84q8Dd0MBOMRh9Er8LBXC++YDpAcFULNeVOpVT+H
	sd0g3FnNImPb8inhy7dITWJdv5Bs88Lg9KuznnHlY2Db11ETyWfsPvyaNTGMGS/GULDYoaAa2LL
	Cmb+vTwmywPfM9BiuHGWP2D3QDW07m3omLph1kHtjXmnT2rwHo++ZsXGTmbf+D5L/aR1yy+0PKB
	97hd/yk0kVJu87WpnohJZ9xxU3jcTCv/mGq0SzhR6UEEeYBabsjrFV/Ek4RYTWoJKGrwtvrhfTU
	ZzE9uSwz9wxpiRRPGvTKfHt0=
X-Received: by 2002:a17:90b:3d8d:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-3436cba90e9mr15119937a91.12.1762792696044;
        Mon, 10 Nov 2025 08:38:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpeeLzlAYES/pvtPhYhWt6lEiwIUScD1B6YRIb/1r23lLyKUJQumTRvtgD/qeTqkbN1zcfMw==
X-Received: by 2002:a17:90b:3d8d:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-3436cba90e9mr15119892a91.12.1762792695560;
        Mon, 10 Nov 2025 08:38:15 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:15 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:07 +0530
Subject: [PATCH v2 01/21] drm/msm/a6xx: Flush LRZ cache before PT switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1640;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0RH5+HB1DhuPB+qO4uxLrDpF6juU+e+LzCOFWLT2Qxo=;
 b=QKpYscsE7JUidxLJTjdztF9wYuuFQ9/van/0jE0PIt/jNOJ6D3vBNzOOdZyJ/eo0wJsHZeZJC
 YOytieMGrHrAXCLYQcFt1IEg81WjWnyBwdBPtLgVa7LKRAYQ44FDAn7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: KQFJgVXW1z82tPjeBJajvZlVm9swstUp
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=691214f9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: KQFJgVXW1z82tPjeBJajvZlVm9swstUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzOSBTYWx0ZWRfXxFCSzJOMSiRi
 oJTFyu5pZLPVBrVbvX4FlCzbDN4AkqkSp711SUSDXiAYlXjiIOWY1gS81YbdZXV83ZCe3VOaiti
 Z7a4J5CcfWay4WdEJHL5eeegy4ffjQsIRE8ZMKQ504pmimVzszk8rcfK85lm39SeBn+NLdnRG39
 a9NXRobxdup3faMt5y09XCrOYjZr7/pcWvPOk85x4ojwnSB2VHbYMg7TPp6DhanQWLZCsKjmcg8
 dcVliKXdoKEwhpLxrvhcnSmYG+3V7cv9REWkucT8H7V7uQkYRm9dW2RnI3KFgv4XDZGm07d1ESo
 7cGiyDM/hrKYbJPTqe5rt9cDfdlsMH/7MDyjUpi7gg4DHVEZoPq/+869SH6L2xBhA8wuutP9g7q
 5x8Z+UdMynntFYCjcMuqE6t8SBuliA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_083820_480033_97AD5AA8 
X-CRM114-Status: GOOD (  15.21  )
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

As per the recommendation, A7x and newer GPUs should flush the LRZ cache
before switching the pagetable. Update a6xx_set_pagetable() to do this.
While we are at it, sync both BV and BR before issuing  a
CP_RESET_CONTEXT_STATE command, to match the downstream sequence.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55..6f7ed07670b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, submit->seqno - 1);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BOTH);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
 		/* Reset state used to synchronize BR and BV */
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
@@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BR);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, LRZ_FLUSH);
+
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 	}
 
 	if (!sysprof) {

-- 
2.51.0


