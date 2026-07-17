Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CC4C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=; b=hJwEOig39OtUnp8aLLrNK5kgNt
	MKBqIp+adiFm9F3Ite5OconKumC4IdbbSJmiX5nRvuk2pDR45VytiHqfDi4cWXFXOCLAQ2s9uZOv3
	m9NnSywioZlTpfAboOtET24QgWdyIoErypUtbk0P9d7vMMt8fvWRag+eYopbqN74Npyd/TtP4qPRy
	qzyYQ306D+wWwNJvcJy0goBIzYBe6CqztMsLFk0JgiRgiBEMiLMtrL9NkwQuE/BMAL5dlK5pyq5yy
	Bu0SojsbUrvg6x9sZy8Sa0FnLj6ggk77X+ReYolF+23kuuHlT/bHKu+I7YqLRhyEtsSyIkBggDtvi
	3ty/4HgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpNi-00000003DHp-1lhS;
	Fri, 17 Jul 2026 20:42:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpNf-00000003DGz-3as6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:42:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtRdG2449712
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=; b=ZHl6nAEWI3hupkUA
	RSklRR+dgpPQifepZ+uCiNbc/lwwhV9sXYZ2JsPr4nannzsEyudc3hLYcZ+dKuRI
	fsH7hrYvDaOmeHqRN1YgIx80p6Q1rdI9yjYvdZ7a2Caa4fh6CyjWvxPOeT5yDVUz
	o+sUhfF6o3IAP6Pvq5sd8se77yVU6+f6JMM6yQZFTJFbeCDZ+k2zsTVUg3HZ7YA9
	/PwO/Bm1jSfoKDJIZhaWnAQQaxb1nQgF4ZC56/+hAtxgr7QpR0nfmWdxqkUtSIfu
	pgcSIm/DOf1yW2S3XozgVCwOiUlQWF8VRSqIANpYJCMuvARJFOa0zxa3yQqytlRF
	GZzmvQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78tfaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:41:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so8966184a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320918; x=1784925718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=;
        b=LvfpjKEftla8iyQkF7tU/NUF5dCyVaC8EvYdkaZqEhGdLKkdHHRgPglF3X8MXxJQHc
         Ey1XXT0jtsANX4tX8EvPO5+EqsnXGfS6tNAu5+WjaVkaQGwSCWNwTQzPxvX0jH7Ayx2b
         vslPi0lYC+A51jMif89CODrbL5iS0MXTuHTGOeZQjzTZhsXNVzfsETMVUbmTyMLL1wJw
         ECVK0vjqH8tg8CeRHql5mLBitT4zk6dOhoSS3fYea7TObtbV75Op2Gw4znHYcbCo3KUJ
         7chDNSWjpebVrAQWiA9jvWDQUhY2gVv3Anj+FRzifwWESX+sgtMzKv0Dq3oMOI9rxjFP
         vVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320918; x=1784925718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hj9k/hn+4mYiUHK6HA/S0PAPXL5EHORkZMZGm7VAmsA=;
        b=qvjnnYTQ5CK2sGjwIDpUOcCLc3WNYJeTahxIgajFt3MhOYP0BI1E4JounfcjpsZm/1
         88L69HBSAowud6gN7/8a9tTk+o32f6fmYXHlv1M+b0wq630Uew3OPkUz0AmxXcpb+BOy
         zvL+GoW8SzUDQ1WYI/Rb5ZYvZHATrDZJR+ao9vdCESxBg/eQaE29RNEG9PBuqmXoS+23
         o8ff5nqDbLjn9eq1aB33VPper7NhsSddoqjirAn0SAMMhzestn9Krdl68b+AyIR+MeXx
         LdfaQ0EIKRwReiUXyh3Og5o680d5O+cb3Vna35xpMz1gvumdlXibUZyk8miGInfsRruE
         bn4g==
X-Forwarded-Encrypted: i=1; AHgh+RpULf5PAJpoAGoYay4va2rAl8DGeDILdfBugTuY+sDFTDoH/E+mtAoHY4f+HEJNtHLhvD3+zPVMF9vIHe11NWac@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Kr/AqQGhjjNf1qR3y97UxuZyvx8sIIj6yu1IgMCdq5X2mmhK
	N81k3+UY6zsxFHCrPv6iYhWi+92XWOWBWg2gcAUzonTSHS6lR77d5MBmiLQS2DxI/HGCBFsTGnc
	sF2+ttjJ+ptOFN1MNrHmXzn35Pxr/qLMJJfLMg5LuEYi6Y74UMvHqyFMlegLjnUVlNaLKYYkMTp
	mToQ==
X-Gm-Gg: AfdE7cm6tTIKB60XP8tOBxYqFjATZVlIjfKJl2bUNTNNFyrLaOAXwf0tbcHSm3/LdY7
	7Q2KBWaZ3HiR+4PYppd2KBSaK6Fu7Ac3ZklZXBEZd99qjZCfhRfjEAFGqRKAkwoSz2Ezbn4/cJC
	2hZGenE+TPfs55aL6tT4XTnmemxeOg6i+3WyehD/RApmnUAis2HOj7ZP3NaLZXpo4csUy2sLyWC
	9o5oQNzMUOK0LoLH/W+f4jLabe6T3l5Es6tBJ30ICY5kdGx/tvFjlSVe0B3vav68yYpYsIAAB1B
	XMdjmTxTiHOF8EcqariBuHQSO3mqnlDe/PUEExZuKVzu3fsniHF6UYL/B8rFrh/B+q34CdHt56H
	BehvkK2Re65t5wHhkLD6GZj2l
X-Received: by 2002:a17:90b:4c8e:b0:38d:a8be:a592 with SMTP id 98e67ed59e1d1-38e4b43cccamr3944745a91.19.1784320918516;
        Fri, 17 Jul 2026 13:41:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8e:b0:38d:a8be:a592 with SMTP id 98e67ed59e1d1-38e4b43cccamr3944683a91.19.1784320917831;
        Fri, 17 Jul 2026 13:41:57 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:41:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:26 +0530
Subject: [PATCH v2 1/9] drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in
 a730_hwcg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-1-64379dbebd7a@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1299;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=7exucDpQz56UUOX/GS72C0Nnz1GCp2aiTngaIPcMmkY=;
 b=59JZ+AiPbO7Um2ErH7yj1zS6z8HAFQqgcXTIpwOre8CaO2cTECbjzx98rAS+Oug8orhhgR49a
 K3NAhQOAEYCBdkiHjRWR8HaW5ARAVWD3vALuGFL4Nw0BCXXBQAVBjGF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX/VWAFu5Yr+bt
 FPPByqfONTI6TB6XECZ6ncjx61eMgOkiRKb7IWlvJtOsSuNVn3j1iTAjxWUv35GpihtnwY1blDM
 wInKhB0kfNL+Mzn3xLRGDUpFRMB+PNI3b85hQV2SrV+CgNV8jnOvjnsy1LeIA5ZUK7S/4uzHPHf
 n8PdGJG7UBdPD06WKb68gfXQMujssQfQmtSJJLUN+RQZczxGltH1+bIlNUWWlcIfXSH/M4sSnkP
 QbjZwCcUpW4oVr+o7fx2ttclo9a2e06eYLNdgyPCbUzZyGZRU3K403IsEYYBMTaY6V7wvvGUl9f
 16dXCwlmD+MmtgMLdMbVgpv3RdZlVdRVF0Gr1/+0CztSUtMmCFRuKScJmafiC7ua4f+88gOFxQS
 5boy9AdLGvsOs+pAenJ7elhmDKXsMueZ6+wD1geO3/XEU0xdHbu5DbZRHtdoW0hISvAcBicwaAx
 rdDFjL5utRWHG+c8tOA==
X-Proofpoint-ORIG-GUID: ScpIH0OEIvG07DNz4RUYSj4gbj6N0Zba
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a9397 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Vf0ozLlH3VOCCO7dkaEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ScpIH0OEIvG07DNz4RUYSj4gbj6N0Zba
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX4WhPnLLgjAQ+
 PZbvNPW7Bu5a81tTr59mI6pzm5kH28nBUys/XvHFw3QYvLbxEY9GV/cOgVaNZ0MwILs1Uobfu5x
 +cer7YHWer2k8VMMYRXBtpbvufoQPRU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_134159_916270_86ACA67E 
X-CRM114-Status: GOOD (  14.76  )
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

The RBBM_CLOCK_CNTL3_TP0 entry in a730_hwcg has bits[19:16] set to 2
(clock gating enabled for that TP0 stage). As per the latest
recommendation, clear this nibble to disable clock gating for this
particular stage.

Fixes: 9588d2f860a4 ("drm/msm/a6xx: Add A730 support")
Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..a98d550b72d0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1199,7 +1199,7 @@ static const struct adreno_reglist a730_hwcg[] = {
 	{ REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
-	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
+	{ REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22220222 },
 	{ REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
 	{ REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
 	{ REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },

-- 
2.54.0


