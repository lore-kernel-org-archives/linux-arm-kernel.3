Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1EDCD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=; b=brOxMwShDzKLzuW1dKUbeuQfNX
	ir7hhJtqwj1ptdQ5qzQpyxfFVSLRaMpsG9HH6cbCuJ7kZJiURi1K+5MdQsvjLeK5fmZSwkn471g5L
	IS7h/lDidIf/FXLs/hXyxUtmtqa/AAbpYsBwHgzmwR5DCgi3WGk+rrS3BtR/L8FomLnLNtumXPDTC
	vjJHbsQlkBJRI2W08URWUJeeoO57dbf3qsp8XFmhIW6dJG5G1IboebiMHECL9rrOhvuffcJq0r1h/
	QyJuJmv+dwlkqx2QebKbtD+6s86C3dmet2AUXvhGyBlcF708NzaxVHP5sJ2sT5bq2kDsErdhXChJZ
	/y2Sxueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJglP-0000000BGXW-2Nw2;
	Thu, 13 Nov 2025 23:30:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJglM-0000000BGWI-19MQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:30:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaW0l1611840
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=; b=UQE1C7LPJm9301dA
	s/+45xtya6dKHJw4ywyVCmAOJCFCYGSoQ/Tw+B1jQvDUtVdlltohTbrtBobkF25z
	GglE27Z7HJl6jHg2K0tw3THfyt8p8k2uzgtwWCmAZGw5SHhNnY8J91QQTkTTGOBW
	uBPuulh//YChgSmCTokka+eZhRZRQJNTTw08Njw30JbZUc1Y1b9exRrPE0PcQKWd
	BB0CtBOI0BQJyCd4Jnc+OvWkK8UrxSE9W7I/DtJpgbuHvDd2zZFKk+HnaYo8E+0a
	O8LeWLrwYi3t4/S/34PGPxlGx5jGPtgG5c4vbPl6RjBwBCKQ7sYQE9hIK0saT4+D
	ZSUG7g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9bg3y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:29:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bbcf3bd4c8fso1253774a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076599; x=1763681399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
        b=ZaUYp3JdE8Jye3cHORjVLRHz4lVk3o9M3vuh0l3OER2f6Yb18HscsurWjrN550MXRH
         2TdU3iZkajPOG3O8IUGv0UCru15lVlVt6vC4uQWxKcV7HM3TtKcVmSOjn4B+MkukJcvi
         UGpn17uQNufcPCBfT2bFJygqbQEDSZvIij14DS/YH6eIXXiU4rOBH7PqV6IGjYuSPzsc
         pbvSVToXFEmLRiFFiYVJqZDsJCf2xlq9qILI0bPYlus6KQr72bhIF5iFhHgAZ/aOZUjw
         07nDt674bqsfOIWGjCtToOeZ8fXkEpJ3hJ8LXYO81o5lu2Ocmoy/zZC3tgreZHQhFBci
         OS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076599; x=1763681399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
        b=jybF86eFDcxsXKBuqqzSxptctScdCYt1NwnqkSBml7s2lNmG7jLM+i4Yegq7yE0k5m
         RJcFYvcFEKHbdpIUVQ8yNM5dUB9beZ3rLoC2ZgfZABfBAfKVOHXnYBlpNjuNl0Vz/RMC
         icGT+zb9h6nv/NZmV97CLxdyaJfkGLJfI2bj339aq1xJQkgO0DTKTpV6C0FMjrs8/ErU
         8R5gb3mjGxcbS2O5o4fV6Xm4Srwri2gEvJ2Y8oLAdPFi93fySTK26ybDR4dWOo0Vd+8v
         osSEGB5AhYpyH0eINjIG2pY1qs3xkmbElJP+3IldcjQ8BEC6OlZ6RsXyB+4OvSFMhCBJ
         Uu+g==
X-Forwarded-Encrypted: i=1; AJvYcCU7417cyC81f/Rqax2U0PZpUi+OeOPfY7TfGHzUjI7oKhKcVeQ8ViqqzvqW6m2ySRfTojrZkRQebUdAEFUszgdI@lists.infradead.org
X-Gm-Message-State: AOJu0YxFVLe7foUzyv5v+pUg6q8p0SIPyuZ0/4WBCN+zMLZfdV4gtRKt
	hgcZao++D39P/yGoAUs2zhSyCbP3JSCrQ89JmXeqwElwU9EZYLt237m1sjFjcgdbwbdeUltNkMm
	LwsuHMic5MeKxj7unlO8vgZ21FYOzLJp2KyeMlBG8pFt7m5i1ZqltpvG/sp8Fz0YZfaJ3qlcZFm
	2btA==
X-Gm-Gg: ASbGncvfL+3uSBkll982LlJ/z42w7QOHrft/z4N5PQD+6fNxBBKccvs0WB9gJX6BJCa
	wuwp2ZRj9XRuAMkK3H/WRQ7CI7pjtbnhAyb5zd1U1mhVQ/FIyc9XFO4DVknQ1Uo7RbtFVDDeZ+O
	k59AyCwQ3rCRINl79sqcTeDGNYfC3IUtyixJ7n7T+TSnj5dJA9ihsocoj6XNz4YMQxTyA9pWrfv
	cdLQmM7Lv1Y+yTOb+jOfy16+Te59ACkFHA3+pkhIINwlyhEfQVBCDEhmuYXTeNQWLZPoO8l6EEQ
	BZtUObplcezNRUqJXr0f/IW5Y6Dix2QZQWvwCP/Xzi2FaWS6SViBwNcV+pzQ8oDKCiNIW8O+Iry
	flAO5eu+262JvuUB4PGvjL5I=
X-Received: by 2002:a05:6a20:394a:b0:347:1a7c:dea7 with SMTP id adf61e73a8af0-35a52789993mr6748076637.31.1763076599047;
        Thu, 13 Nov 2025 15:29:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe59CpeNjRSyNw92JEuQdzL8WkgOpZ7xPVnMY1vuZEtJlI/TUBl0nb1yLfJqJlaxIYROr9Fw==
X-Received: by 2002:a05:6a20:394a:b0:347:1a7c:dea7 with SMTP id adf61e73a8af0-35a52789993mr6748048637.31.1763076598546;
        Thu, 13 Nov 2025 15:29:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:29:57 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:58:59 +0530
Subject: [PATCH v3 02/20] drm/msm/a6xx: Fix the gemnoc workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-2-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1529;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B0t21POhzhnkPllkO0aJhsfTVayUVxYvYda/rajz62U=;
 b=/XPn6y9/sGaZJkUAy9FCP9e1/me5R2Ws/cxZiiYLXvbvNvzGaU1VsNsVvvUc5TDgOddrJMTKG
 G4t91gdKb/CCVOPapjdmn8NaruZHcRKYOt5SqLB3n0oACbqmHWKpKKW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=aJz9aL9m c=1 sm=1 tr=0 ts=691669f7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gggc3m2WwWe7Cuz57AEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 6XSBSS9vaj996c8tKBH9302UAvIpZTur
X-Proofpoint-ORIG-GUID: 6XSBSS9vaj996c8tKBH9302UAvIpZTur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX28q4zEDZB/gM
 rUOCNYkgq/T/M4OcX9EBaTv65noyGFSQWwW5MbsrxMvaiqwn6yztMbV/zPbL4Me3bQeI00nhgA7
 JmgBn7Jxe+pMjDuP2iKBla53vUETbi7kuAIcU+ZM6QwdMDfNe6EOjK3vk4yksHMa6pZPlFNaT7K
 2YVRHwz/WOVAYPwRBX5F+coRPY5iPoV9e5lkt/aN8VligClKwBw4gZoFiYks5EYSghlVfWGzfz2
 E3P3yzP/IItqOwKHelkA45Brr5tOx62TegQPAuFtTCxRuTgJA37rEk9/QOxRZ99H6jh8TtjV5gC
 c4jAfgy64aj+QSf1Yqj5R8f7n9t21kjh98dSnLZqJ5OJvh4x3w14Nk6oMs/1AA5JgCEQbHA0VzH
 0Jt2AwQ+BMWJVnKBAsEoGLTAjyGYtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153000_321012_1DBD8F65 
X-CRM114-Status: GOOD (  15.44  )
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
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4e6dc16e4a4c..605bb55de8d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
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
@@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
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


