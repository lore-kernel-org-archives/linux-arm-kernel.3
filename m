Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD47CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=; b=4naE9s8cvZRCdKrtPCR3GWuvQG
	cML1mZ/gdFksBoXeUCC9iscRdXHw3pa3OQ4AbwJ3oGEIv6U+QeMA6kIm18I1b40CUk7I45LnJvISY
	MiYt+AG4RkqCOr2tpJRbakIcqfBmx7IEyQEBq6Xs/u/5XNzAbwQWaE16gV9yK2nomg16sHS4QOc68
	kz4TcCH36gNlVQfnxdrMTpZ2OmcQx9hbBx6rIb4Aj2u9yOwSK+UebNzHdlw/C8MK0RFYk+EO+ODOp
	zpDZXfYHvtTuWJQvmYQy4MdOvpVjRkGlUPc/HbF030IV6vWaZCiPe2rqcgoinfawQJo4SbZZgdn7F
	eXPCwMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHzz-000000096EX-2Tqh;
	Sun, 05 Jul 2026 08:14:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHzx-000000096Dr-08T3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:14:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664MjtGm4092232
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=; b=X9dTxtoQsWPjTwA5
	Gj50OTqt/zygM17ti3yhh7M3q02i2+/8io4M/dCZWKo8aDCDbJFY5L/6IXNX2FtX
	sJ1GN/oXfqwAOrhE2Vv1azlgdptslqSW6CDfwwhWzEtDUKRRNWfACP485i2RDt7M
	HCiCnfm6A82Qix9OrxwmJhAoOQ1ZkGVQJQPaLn6kmdtnMNoXcjqSk/jgt3zgPTFp
	yF3F/SWTe3k+hCZcLnPHb7P+kyBpq92NIfUaY2YND+as39H7W9QTNw+GFpiFBODU
	mK/j76efBSjNZyKLMXsKvt7gXvPupnQYXWn3/ZKgBGUr9iD7HTIvTKawfHZAFp0y
	nzXvLg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txej88v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:14:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so1526819a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239284; x=1783844084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=;
        b=aCEv+GG0bx1X0+x2VS3OA2BEKktRp0YsibUTJlUTU+DtJIo4Dkp9vuUJyP6A2AUIXu
         ewYPdHhSuys01PRZTXEnUUhEMV99CzjaDkbGyETfyLAyTpySJn8ndZIjHJ0WhgKlXsSi
         TrH5oFjRDmDtN/cyc0TNtKMewDNxlkI+N+Qm6ZgCGJ1+4kq/upOYAOueambhdmHLhtCK
         cmwRVgAMioKlCpU1mMpHbM65ZFPUXFGL3zs50YHM4EQFeWyyCZfZu02XpxO92QwYZdnl
         S5+Q8WsqK2elA82vVk6OIZneFS1XtCFG3UStl8EqzajkHavIWbJzT1y/H9KWyjAGp8Hd
         frrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239284; x=1783844084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qot1YLP4Qw62VVQl33YtNMriD45vwXzabf/W6bmpClc=;
        b=BvbQekv7lSrV7FQOUIalv25BmwXAa2DK//ZsHbACGP8AKUlFXdSGSgp9OkTuMtcDA9
         85in6F/ruk1SEYSUdC5AaLr+SVvj4u4pj0e96VIq7iNLuLSOhgSor2+255YoEKvZaowt
         lpxXjH9sq6568NxvtVpfaqMLQQV1dbgYw8FjriG2th/IhiWDsOE0z9m9QXTx0Md6hljA
         YEQ3iPSzqBoDAf9RuUftdRdCLd5OiI4yjuMmK9Kx/3v+LbhQlk+Uaof6R4u18PRIQ6pd
         Eo+mhDDqE+3w8neX+bIi9zMiwlLj535kv1/NcyizDTUs3+IPxgYqHu6vDw7yoIRjABeu
         hEBA==
X-Forwarded-Encrypted: i=1; AHgh+RrPXg1MN7CqKCz3udOQgvTZ82I2uE+Fe7G0cc3h8m04ea7YY4bJDJMMduzVsWdFgPf0LhRzMdBENPL17urfwKek@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx8rsYO+56nkJOUCMpNdmdHqE/tfpk71OacGZgmd12wj0zmWE2
	fae/vVUmnjbVdVVxRnKVmq0u7Zk+fDzpvf0w/Cjbxdw2mXqlGBGk0brqpB8/LUfMZIiOrUgMD/E
	6snXl51eWvCxdhIfIJnLNwE71IgdHo+AXL340XGh0HOI9jQ/fy4PyI9cTRWxPDpu+2G0sLCdhoO
	QDxw==
X-Gm-Gg: AfdE7cnuEA1PfhzU7Drth2+AS6qYEbnmRu5Jy11tKGbxWM2gseWTXRbgVJ86t/asseo
	Hl6YO+z/rBS297P1e0xhfUWc7TuJdPtdVvzJTiAsn6HwdbLGfPkluwnZ5hj3gzgDjOFlJ6nj3gf
	Z1fK5VO6qBt+4DacKFHt5eqt3Z6yr84bL7CLfHffC7pPJtaot1Ii+8vCl55K2b7SckOMqX2ykYf
	6FQ6T+Q3bVXjVpQe2Jhwrh+kPSqSMI7IiMpen+TU8S180VgUnHeI0cobCkPMDhysIyuGY8fGuMA
	xuf+P7oZCXF173TVelNBsTmy0g65lJ3BYzomJ89g0hvt7eLZiVoG05F9Va2JmfcViivxmruEOJR
	BBxLR0fc0Mizw/UCWn83Deo5BfopwlktluXk=
X-Received: by 2002:a17:902:e74f:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cb97e58139mr61841865ad.8.1783239283817;
        Sun, 05 Jul 2026 01:14:43 -0700 (PDT)
X-Received: by 2002:a17:902:e74f:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cb97e58139mr61841665ad.8.1783239283335;
        Sun, 05 Jul 2026 01:14:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:14:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:16 +0530
Subject: [PATCH 1/8] drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in
 a730_hwcg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-1-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=1238;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OoP30nq6efDw/gDTU4tVQRkvylV9nMkq0P7LwxjPzqc=;
 b=K2483gwyhqLi/J7WvjgvqDh88wJZPkPUhmFw5qcCp573LO6/H7fw5XIN7fLqLBDMer82FPplk
 Q5nk2eUH9PNBHF7RtP14pDCYSjIh5szSJQLeY2X1ovfJKHH8/UCoysZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfXygC9JteezvIp
 TvTGS13YQKZj/6yQGPV3cLPArryCwMC1jLmXXQKzPO7dxnX7em54FeH0/dxMvx5shTqIb98Hi3u
 YfrwT8mnWGH19Rzu96jMm2ECBGmjgDw=
X-Proofpoint-GUID: iDSOZYlhJXKRvtMG-79SBLLoBS6hUAaK
X-Proofpoint-ORIG-GUID: iDSOZYlhJXKRvtMG-79SBLLoBS6hUAaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MyBTYWx0ZWRfX1PkFNQ+GbHjL
 7hItQs3XlYbMaHpJ7T1i5KvIhXo+uhR/lnhIkXmwtWWjFCFYngMqHt3hId86/rlk29b3yENIzFe
 YzIkaWBP7n+wb7I7mvPPxMNIb/TrVcfsEz5l08f7ErrgosC7Vz28mQnBbq0N4fWTZZgF1I6kBzM
 2r9VgliWZpXej39PQ54wUan9N4fMl4IN4N4iQW/jWUyFM5sUY6rhXL5rc66XGpjfLFjm6N615fD
 YnSRQ2fOTppmGI8h5oSTDPHo6FEX1oK4vSPuCO4Oadi1DyEjY6AB/5IJUOKxwF7AZKVeUEoQ+73
 NuF1Ey+GtBPTCvSB93rQD3RdhHoxlkXJdQCAnjc4QO9vHwtIaI5eFkmpu3E1YjcIvIxBZcltnng
 lFw7hvPX4HS2hYgJr4UpyY+NzwFroCGA7oh8/eB50VIoTOkYnmTHlQu1pRJHJWjHpcACefh/du7
 37qycW9nODbRadv9g3g==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a1274 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Vf0ozLlH3VOCCO7dkaEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_011445_088430_BEC8146A 
X-CRM114-Status: GOOD (  15.09  )
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


