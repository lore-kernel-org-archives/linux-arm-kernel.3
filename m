Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03A9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 19:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gh29NgtToLExo4FWXGHYjdoYSLAME9bGv9CYiniEKo=; b=aIkFdNy2+jnmcOLxwuwjqwzC6N
	v3vUyQlJijWpMsc0xls79YXIhLAZNqZaWRqtIidVvPE5LSgk/hsdQw9F7nnjjpu/vgeg0GKRNJlkk
	pDuD20l5Ab6OnaOc2m9foI4EW5RUOxzj0LjUwcoTvU/MOfPzI5t7jBFhNPqRl7nQ70iUIlosHisqI
	yokJectutnvq+OtUsZ3Otb0Wh6IPrM2C93hTUKpaNCbVVFgVurwaOL2Fd6ki8vADmCjz3ln+FQnHb
	9WBIJK4UAdK6+7vzQw8YyKw+V80uakkKIZvQrQNq6KWwA/bwWe1mBjfokuK+kPUpFHfHcPDclXZLT
	39DCqMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBP-0000000DGnr-3IV4;
	Sun, 28 Jun 2026 18:24:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBN-0000000DGn6-1kE4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 18:24:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHj3bQ440861
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+gh29NgtToLExo4FWXGHYjdoYSLAME9bGv9CYiniEKo=; b=AtoMHTsGd4iaZpmE
	HlcRrS8Fm3n6rjsVRFw1cpmHhlqUA1Ryga0NblfhcIGWPstxJd1/46MZKhpl+DKf
	x8p2WKigW0tgWbf5u2U1sbqeNcbYaqCqZma+EA9rRsOHRy6G/MbNMElGD9Ipye5O
	r6B80xwMQvXeg3hwGp89NpxuA3WkNOmfM01LwaajwRWbFa6beqI+dpgdl8c8a1FO
	Z3Bns/RP4x/h9m7+CR0l1pg5OfobXfrP8yNfycl6o8IjriDXIy+lpj8/1lEFaD1R
	XofeE38AyJF6/Hcmw7TyOUO59c19YaE1psOISv8vsZGxdXjcOkDQTmFtm0arbWt1
	pldu0A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a3ebu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:24:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bccca5620so3792523eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671080; x=1783275880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gh29NgtToLExo4FWXGHYjdoYSLAME9bGv9CYiniEKo=;
        b=VVjz5qh2tsQR8GdUPZ8x7qFoS7FWzLwzh5girrYE0DrsVH7V9DrB2EQknxT7t53/Dz
         /76452jePHLA+jAjYs+RGIaN6Xk6dQfdrX11yDyRzDYp9URFZ++0yNER2GqMQ0hXKn2y
         TFDMd5vr5pY/DeYfJMyRqTEdmLkfj8Qw/RKQkHw0HyS0fph9vfl/+ASrE4cDSPMv7ydN
         sHMmpW8BFey3pCNlbCBnfx2v5gSSFFnWC9UE9kYMuBDR73+LVJD6loxu25eEstVBzIo4
         KgmWDD8hfUc6wrgtbzhCC9FFrNj48xbtRtnEG5f+RnjX1l5wPXVtX0oAn4jPGiRAsb/F
         YT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671080; x=1783275880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+gh29NgtToLExo4FWXGHYjdoYSLAME9bGv9CYiniEKo=;
        b=NJEQujoqcptthniXb1C66iIdOeTA68n9CYAYmJixTuKY1bm2++lOScCFZ7JlQXQBM2
         LnK4LK7/IxV/dG+yJOCTQgA9Ri20JEy0g0nhzAguvPYklRO8nej/H0EXVFRS0T99oFWc
         BYJXdU+1x3+ZXb7PYogwZJurWXkXDnMJpbZShbPIWmkOgv0Pd2iRtYowQxnxSmgO3oeh
         jW1FV+U/SPJXzOvDdzTuCZyijSnp06QH3N66Q2xJ5MADRuFundLMcHFkJt82I2QgW0MO
         UbW2DXKXI28hTnfs1hxiPnEypT3mUAnfgF+Mg7/vltMrSeDTp/bstp7fg/Lfa0/UDTXP
         +8LQ==
X-Forwarded-Encrypted: i=1; AHgh+RozqnFC7ST/EWVNjri2Al/DHa8suS5urM4CdNLHtzuJdH1+ekI4ge+MIBUErbwIa5OuGMD4bFhNt3PuMZkehiCw@lists.infradead.org
X-Gm-Message-State: AOJu0YzKFY8sBIbsxnZ2tdhbDHqxCeITCdfFpyHZUlHwGYuvL0/DB2Cq
	nTgL5JDpAPpSPptYL02QU6PA0SE5B1BuCIJnklBHoz64P01mx5CkpMPFJK3FzqN0q3V5/0iMMLg
	WVAJqUS6bjVhyacOz1jxIJLZAs/6bgmxiuZeP8v/G10iVwiwQgRZZ+LRdYGDaHebY3s3UfRT7qG
	9W/Q==
X-Gm-Gg: AfdE7cnVhPubImAEnoINvHmBwL0+GEShpZQt4Qil1V1RIl8ay6vR7snuK+tDwbRpBSE
	tV/BwZJooxDI4hycp9bpdLDS5otI5YODf6HYddfoi9eqHh/uUUBCGNrHXLGRl6QM6PC38HT3TwD
	S5SqOgmWqqOdTgmygur+G/PnfPI0WTGGNcXvkoVo8aMAEwcwgPV5Ctf6v2VWiSS2lptqtx9g/ME
	UD5LUZYIVtK/SwZcRWuQ7D5xyJdhP9lXOf+NFRBTPQSVB+7YKSW91anC1tyzQzkUY0hGLTm3VYr
	220xmHYggbLU+0pZYOIBexDNNtlitwHSPmDXSTsKaWXQZjaF8J2qzM64Sn6hdE6oS8ZsJ7zdlQz
	xDM/++MNaFlwCPZIlKnJ+G/08uxNNqGvAR4U=
X-Received: by 2002:a05:7300:ad24:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ecb916ac9mr771747eec.22.1782671080088;
        Sun, 28 Jun 2026 11:24:40 -0700 (PDT)
X-Received: by 2002:a05:7300:ad24:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ecb916ac9mr771720eec.22.1782671079570;
        Sun, 28 Jun 2026 11:24:39 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:55 +0530
Subject: [PATCH v3 2/8] drm/msm/adreno: Add support for A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-2-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ondYi/J4omUToWNmj2nWqhqOf0wePhpZeJylLHwGXfY=;
 b=OaXvuIBH77BLABfsoVUiK2SLQPCijRGfyZFTJz+EP3d0PLXtC5KchOfPnFq6mXlqMb9xG8H0l
 xRhibSzgX5bBOSyhyra8+uMdkhad7ffYZ+5n3w/9rcsw4uJq3KId5uZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXwclsRXUurz/y
 uHpbhIS0Xd5hgJCNEfm9JqB/rgG+Ejj+n8UmHhRb/m381SAgcYP+7Jl90MdsyEh4H1IfkPkrzdE
 bTNzpOiMSKHcZPIOqfxHO2qf6+jjwJGk/dRR8EISO0Pv1TGLlxiM/BrRQdDSfTetXSyrHbmhmTg
 u6984/HXCFTSeQHjVg940CLZ6NLCFv5sZHwyTvSp2oGC96wcE9MdNaPYOgi3DyV4r1nkMt1lBLi
 U80tGrr4bX2HBiSW1zca92fId/oAMA7TJtnUugv9lj57/KRtTThz0Ok/ifcpHtL8XTQ0n4s5hgI
 wgvCZjZ9YUxqMDa57M2mnz6gftO2R1yTy1Gvs9HSjy3S4ohuGfM18lvZ98KOcztaF9bWcMe058a
 2/G99Ps1BJ7jud6pvkBXO5UkaXWFxWeJATDwWrXQA1IEknLdnwH3lokWy9FTq4WzFdgFEW50cfc
 p5MdgoVse7HwiIqyBtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX4siKdYbNUtdy
 tg3809Qme3WxHhZcTHFtyTBAox1/de3mt8Tphi5hyOCsp3NV2yhhtrz4hIzEtegtOJu0oGzpzGr
 YWSHySjNcaBzXBfiEXrvCi5bOAU+Qqs=
X-Proofpoint-GUID: L522jz3Fyb_ZqMOuCzZF_ocPvIOXFAdj
X-Proofpoint-ORIG-GUID: L522jz3Fyb_ZqMOuCzZF_ocPvIOXFAdj
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a4166e8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_112441_468862_811C4C54 
X-CRM114-Status: GOOD (  16.24  )
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

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.51.0


