Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C85CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 12:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=; b=e7BjpHH7P+zhLzz+y0trmK1Qsi
	bgTJzbSSj+3Ofh4v64BdyOcQSBrGEJCXj3fNpoi+HNtiWCjPJG3SxpmLj5n5fZRMx9GX7r6Qu6muI
	0aoGMKxseFtgKkPVc/I+f/t0oCWE605n8PNcSJYBgYLF79vkQhiEC1vBR/L6435OlkkQqnXcAcyap
	aDcHcKYyIqx0GWTKfZZypxbcNGVjBYLLLnk/lXCR/pQ1mL0KfahhYL86CAx6dknJtK4bp2scV4ovA
	VNo1b006ctzJz+Cwm0bBRtjwkAAM2OOWa0GI2i9r9+vKZk2LexoZ0bSnZBA+fvSfeXXOflTF01R1S
	9l4Sex3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfG-00000002I1B-39GV;
	Sun, 30 Nov 2025 12:36:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgf7-00000002Hw5-2nhC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 12:36:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU2iSYZ253634
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 12:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=; b=jrxaUYnkZ48+4tXG
	L5zTrwdQe57RIVJMUrVyOYz71g5LUm7bC38EOjg74csAk54YkXiPYWudHh7u1QEb
	MyLSXisaFMA8mtlrqggiTnFVQ7aBe+oXlZZaqBoGPb7kXZ1G1tPwUM0U2ZFx6efh
	a1Rb4XD58ifNmfA4N2JxTNEUNfhFrp2VFB//w2L2Y98YD5/KfKqBjf/xBJKdv9Zk
	eRR8uczq6iy6SYB4oAyrBdgJ/Cl2T18E71sB8XKmqnQBRAiKLfMi2cpzvNHXVw8e
	aRCDF3nRhkj0R4MUs3EQ9Dw7enofSYa6S1uatcX6Uv1kfBWVdM6yJRrD2URpl/Au
	V12LwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqs20t5xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 12:36:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b30b6abb7bso627119585a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 04:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506180; x=1765110980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=;
        b=i0yZX7q2Ei/RSSsMWYX0vKnkgkCXWPZuptTKi58s07pG+4bAjTQV3aK7cxHXyl3Q+3
         PCXx628zgIVJHsgvHKvgHfiO3h8ahpglVp0OK/SROQ8oFPzk5t8OvXG06WlprY2RqGCC
         9ACGUHkVBDdJleEsvs8vI8AQZ1KeklfstjdEQjURtSZEm12i12Ec82BnkvXzFJG+yab6
         E5Mxr0qYr3E1UYzFN+Y71lJJLJ/tdihT7Z6iC+410gcbbGoU1+X4yepFnzfT8G2iiJP3
         D61aLz49xXczWfPboER8w8oSQHPGHzhdirY0cleNcOlQS3BjhzQIyFVUIi39ZUPzJcHL
         p6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506180; x=1765110980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RrqtCASUZ3LLt9ul3oZvn6rRWrr2qQDEBO4OynG5zZw=;
        b=kn8uD6qkcEZpqZgMRvQ/z1aPVLFHfyYyjX5LwVWBSDHZlncrDpjZCsz0bFvNnXIyYc
         eo+gxf1juVV62UCefTwCH+IV5BeKNr1V4WOqJXgQrc0TNGFcsEGs6dlM3R109gHefSDp
         vK9HmKZswqiUlOUu9FeXir8a1rbw1aZFTttZ4GW4hFcbElk5CteyEm4fRXpC398Rq8iu
         GBIGNUo9OMSfu3k5xwl2BUFsZ+h+W1KH/H+Bb31uQRQmEvBBIx5K5mh/Es5nL8iwSxfF
         02soX7iAAhlTvJ/nVBwOVPLKIEfzxuESqrni+TJP61h4gRvU/dZF3ETvAqFVQ9PQrZXe
         t1mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdQD71BPVvp+5Oy3gOZvO+zTQfbLulpKjgvRCrZ+aIN5AFXGuFeP9V/yLXsiT2zhPp2+kVprOY7GdM+O5vHfXy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn/9V6oglN+m/NIsNK3rXkp19nOh9RI/vYs7V+o+MdN0ocU6hQ
	c9WIHjC05hKByu6doL85jEtIX6G6regpz5yncwdIyHTa01fnyQaxuylJD+QynqRjDfbjUgczrUk
	SyYuZP0DiCG5nrqwOk4/S/372yCcpeKe1mB/JQ3nV8fzuC44uSi6NBzsBK+8NX7qZB0tO6KxTi6
	Skaw==
X-Gm-Gg: ASbGncuXic1VqGozC++XL8k66dGASsjSFvxyOmXBvmGT1dI86A+BvZoVR4Cw/pRzQ/q
	rL4X6A5uTSmYxEW5S+pnnP2B29vVWw9sEbJhDQefknFEEJFckcWPF/besZH+JJM9sIQxLGJtN2A
	ZOAEqeNr1s/detF/GtaFGHAIs/9Rkd6wDzL1c2ob+8hDsSmYo4TIlwA6TDC8Ghza6r/nuC4RWnr
	zXhhcEhmESWwGDOlaep6vlNVbva6KOXOqD3DPZqYLcld6MGLV9ekI0RxH/vJpa3oQst5TfTWTyv
	Xl0X5q0mOKoCDYnTXuGcDrtovCSbI1PAfinfg3rPPm/3+AMdzywKUktZ2IGItvaaiEJhYGM97o4
	aNw4GTZxDYl9/bFvAxwfzMdlUyu6ehXRL8w==
X-Received: by 2002:a05:620a:4689:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8b33d2681e5mr4596738985a.33.1764506180099;
        Sun, 30 Nov 2025 04:36:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVjFnLmAKnKsu+rROI20IfRIbSvxnxGH2GJOLhlIiUqNW2ucVuPMKhRlB1OZpEhn+d7v9Qkw==
X-Received: by 2002:a05:620a:4689:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8b33d2681e5mr4596735785a.33.1764506179712;
        Sun, 30 Nov 2025 04:36:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:09 +0100
Subject: [PATCH 2/4] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-2-cb11c7e0a024@oss.qualcomm.com>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Eijw7sfo1fHO3BdYpz8WwxXJjQps55VoXt7UFlcVMeA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo72TYdt6rx2Lc07XKkIkEPHnRGPcGuTpQIs
 bi/v4A8NCKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OwAKCRDBN2bmhouD
 1xtnD/oDgg43hK+yfYRQa5/OJIA2iP269kMbsXJJ+k0xaiWZ0X23n9yIREysBpFzzROhC6nrq+7
 RmwffS8bgzNPqAaonjTDi8g5SWVIgDLUG+jD8pKsr38ZenL58//aJwWUGK/4EvcvM3D997bpsIC
 t8qDt+saG84vnNGAu5A6r48Zj8DWVtjW3bHAwRMgn0ZX0dBc2tdTu3wYo7NbHZPXlJds+Evp1IB
 HWBvCGjOs63MVgvWUt+wsfNiKaT+7D8t9V0sJfTi37XMwMa+Rkp28buGEXUOnLSPHncl48ka8w7
 724pSPBcQvLcSicxYkCRFySGZ1xCnedG4gCn5go8HDonBdCwYrenEtYzvggjokzmR9tKVTMQBB7
 IhC6YwQKEal/n5gPTf/igMp640L9n4brJkDQtYRPlnEGifdQ67kAU2CY5IXiAdEKiGOrfW9mfHf
 b7dJ2gmAy19lOwvLiAUNHt5ii9QUUDwmTUPJulDGqx0IFtX8pJDh3CL7GS+NpDkCgbvUZJJLmqC
 1byTAKXNzxJiNrc0MlQmkLBnlINN0NGw1nC9P16GsRvoGgBvUcEjTBHMYzPcSE06HIaWHay2MU+
 cyu6McPojeS8IGB5HvrGSpoxLGWvgAzy8AFlR647pvtUVfdKsnv5dCC8X+7GhJ7PCFRUMmkZbtb
 fVgL16w38wuiO1A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: BZILUttN-CkkCBtvE9rbwQnY80q5SdNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfX9fxI3atSSkf1
 vqo+LjfiYE+LsuBaM0lQ2cqMl9jXWS1IRMnlSp5NTwdtaNinXaNEFS5AexIjBbgX5t5jN+86IP/
 n7Vu1K7IyZM+Zhk4FMWWBWvrFCh5zhNT02iUXnqDB7T3Xg9R1tjhsh5Fvv8O55K+OUS9o8aFxEM
 Ta5WrJAQxOF0cFtoX+mSYeD/X8cg2RLrTrfIZ28otO75uhG3p8hiLOVoCxTn8OuREpH6P2zhsnH
 Lwp8hEUX47d5QgejXUS4b4Dy1X3/RcA0liMSfCmS0knAmZrbEWye00F/vdRhbqSLgoIe6cMA//i
 nWUtQ3iTfefBx8k1U3Nx7nQLdb3tZ5kwxNBC6Cg1Cw1rfT0XmiwLWIadE6SDcOVyjIktbGcK2Ss
 pXGeZhG0kQTbmCxw5p46+UMitgqpBg==
X-Proofpoint-GUID: BZILUttN-CkkCBtvE9rbwQnY80q5SdNV
X-Authority-Analysis: v=2.4 cv=EqXfbCcA c=1 sm=1 tr=0 ts=692c3a45 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bWW22GgIgZmb96Hp9REA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_043621_715615_A52F5021 
X-CRM114-Status: GOOD (  16.88  )
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

scp_send_ipi() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp.c    | 2 +-
 include/linux/rpmsg/mtk_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index db8fd045468d..95d5e0138a15 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1061,7 +1061,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
 	scp_ipi_unregister(scp, id);
 }
 
-static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+static int scp_send_ipi(struct platform_device *pdev, u32 id, const void *buf,
 			unsigned int len, unsigned int wait)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040..badcbc89917f 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -25,7 +25,7 @@ struct mtk_rpmsg_info {
 			    ipi_handler_t handler, void *priv);
 	void (*unregister_ipi)(struct platform_device *pdev, u32 id);
 	int (*send_ipi)(struct platform_device *pdev, u32 id,
-			void *buf, unsigned int len, unsigned int wait);
+			const void *buf, unsigned int len, unsigned int wait);
 	int ns_ipi_id;
 };
 

-- 
2.48.1


