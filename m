Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F01C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDFyPqw10Ep82ElDuZGKcT1q4iRZM5kCL+pWZOCaT5o=; b=WKNfmilnZsqhz6dnMVV745UMaM
	692a/wImx5mSxGNQ2xsinyU2k2LtHy/AaoRoGHApvxuG5+3lNbLErXMs9e56v4I3XbYSupKCTL/NR
	RSfQQmppeb0N6FDQ3bECFipvUSW6Dnpb9LIofaxT4rkTIn80cG0uyUOmN6+e0orgSraGrLtmRDbRL
	9kq8ZETlD0GhXunXLhXLPqscEJ9CBoGxAHnj+fccESI+HlBmZrb6Kske0/rakj4Buu2cHktic8T+K
	MGCMheBImWiQ9HbGSgj3pDj1yyQ+Du9pTCmIhmkGfcxDrjxrtp/QcBF3y+cvXx1VB2HDAv5dr8CXs
	py7ll+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRM5-0000000C6Iw-3szK;
	Mon, 10 Aug 2026 14:51:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRM1-0000000C6GJ-379R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:51:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACif9x1704894
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDFyPqw10Ep82ElDuZGKcT1q4iRZM5kCL+pWZOCaT5o=; b=h0iBKJivkSLJmqBV
	Y+JcftgGcaGnvzQ+Wfkzz+L9SNN+MCGpFTfG/92s2hjvMAI3O0QM8NcaHIxz6qTR
	UvbfhzNT5nqKVX3mIjF4GkZQQ3ASdMY1KSjR2zfWPeSYpy+FOjf2cwyEZqDCt3i/
	TiSrl8Jg3N2Dh1dx6ewpTMkb3G/SbYgF703AQPVJTJIqQukmhE1ruRjQqbaNOnnY
	P4APEQNESwMiybS3RZVNxizROrIT790tQXTyz0WnOqOCbPqCg7TE2FwqOMWYAM3f
	2QCbXSm2Pk2qRBxe100K5hgYc7IHnO0jpFDmxrH03Ima4IV+2BMkrtoqUagFkw+W
	v7eGxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh59ew0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0f45415cfso17958776d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373512; x=1786978312; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDFyPqw10Ep82ElDuZGKcT1q4iRZM5kCL+pWZOCaT5o=;
        b=Hs8lpOCzzeZOrFR5NP7cJA4ITHxAbh28VDE7zS7SmicTX9fn3OvmJpZPGvE5RDL6dC
         VDkunVityuOdzvw7sPVtjsgGoD4nzGZL5XCMSZXBwAnsiTjVEdsvcQdckBXzs+aAk5Bg
         0myzG03R1MSYvFG/x/Z8fjsnCQ/ylXOe+2jd2ydozgkHPlBcVx5n19+ZDZWOMV0rgKo4
         EUZ+NvPpy1t9WXGOHnjlMOUN/QVwGaAqYLfwkxEhADYN+QPm9jEM85h77D4P9waT1ZUh
         wRD9a3s/cLArb/7IbrYNmMNMKcKJnbntp16O6+A77E7BhmDgkITtDSGZGAvRc3+R2tEo
         9RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373512; x=1786978312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDFyPqw10Ep82ElDuZGKcT1q4iRZM5kCL+pWZOCaT5o=;
        b=hX3ygO4yPEDUC6NtTljeTMpMaQR0M1d5lVRHhPkutLXep4kOu81oQOo6p4+HGxsQZ7
         BuKUwm8xb5mpZdsKKhRdG/EVuzhAegyc29/TkEnX4/DLO/fxyqisPOWs+X6ks09Hl/Ib
         RK4ykFqODqZBbHyueUL/SL3j/QfDvDi0R60JAlBJPlUcOkRkqylGeblFKWXMmWiD45v+
         R1T/iIJU4ZLx2ZiVqSV2B1YwUV2USJ21lmDuxvNEddqg+QKSTH+SUkgFFp4gBxpQTmxJ
         3lj7ZZEMvMr6QBwnIGqUSUc9/v4QOcwIKmPdBMLpKI0N2CJIfu6S9r0jUBV+3xpHvFi4
         fG8g==
X-Forwarded-Encrypted: i=1; AHgh+RoaKtQb1hTl5rjmxzkUZHLopz5YcqJLZHHdAdoMcc4Kl/TrJcIpFnZrOZrnQiGBWNLl08ZqbiLbIRWki7nRBw7y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1NmaBtdlaCBjbSmzSbS8mEBggH/hW5RuSYl9anS0/UJJX0JW1
	/R78KlGRkPIkb9SdzVSXPuoueM1DPqf7TqANkLNRrXQqUokyfpsp6NCBN+qo+6KD/QEoOatebwe
	4rhlX790TJzXJpANxBCMoQ5QUJK5xVSq08Lu4UAK2JgBbSi2SbRg3qN2SEkiJ1n6GZbvtyKs56u
	QvfA==
X-Gm-Gg: AR+sD12dbuy0PLlZ5D60vtLpe5Tu9qpTafkdxdIwY+S4PJzYGxUf062KycBokvCBOik
	7hAru3SToqgBvhwDz+IumIbLI+1Nne9mzjBKZyCHyl4bJ8oT/CH8CBMEjgOzTpSxJ/aZSxwPTsu
	BTty5+jJuKq/zS3OsGJBmMroGoYyqgoGBsySFOa3sl95VX4A1Gx0ySkpcCCqF+ebZJ2gVxcDffp
	mOVTyAqiMBbespkHHgFDkjTvzjVOr2zNYArvGZXwgUjh81pjZfdhku/U+aR7x0AhUgouynDeT6W
	HQulHP1AvBwoTwg/aK/ppmNaIyGYLNmpRCKHBoDPOG5stgVUMiC7iUPX/g6eo6M/+gXhtydTijw
	H4Aw5j0bUACZeJGewJoUMtD2gB/1jr6xpESB/ACVV8PXHFnfX+Vh1HeGnm63q2qVryzHM6oSVj5
	hkUxWMMMaC4n2X/Q==
X-Received: by 2002:a05:622a:2b49:b0:527:6d4a:1970 with SMTP id d75a77b69052e-52d20a7bc1amr264405041cf.38.1786373512048;
        Mon, 10 Aug 2026 07:51:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2b49:b0:527:6d4a:1970 with SMTP id d75a77b69052e-52d20a7bc1amr264404441cf.38.1786373511644;
        Mon, 10 Aug 2026 07:51:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:51:46 +0300
Subject: [PATCH 1/4] drm/imx: ipuv3-plane: do not advertise separate alpha
 formats on DC planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-imx53-fix-hdmi-v1-1-fff9b1b17f25@oss.qualcomm.com>
References: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
In-Reply-To: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r7E8ZVmX9Up1oISda84Old2tqIxw9+NGvdtLAuv610g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWDVybdK+bajyFR2U9qOC1Id33rHVYsMqrqR
 jGBG/sFn9yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1atqB/9Q8iKGctDO3jyDeWnHHP8qLR6BFfYSRKtvv7cIX14gCWNXxKcaDHsXJ1Eef1sHbQjrM8i
 rC3deEXGiUV1610r+8ro3YZjtsVFpED1MV73KjDSHp7skOMTFskWtM7zZDr42w+VZ0Ym62vcyQT
 4qXT/xUsZE/M8EQixz8cx8/TqdOSl6/zmqjGSBjvPKu0Zv+I0/DDIvKgx6eamKtOp9/8Nx7N8Ml
 Mmisre1dwGHWqBxx3hF2Ub4X7iRhYUMTLFuQN8vMlaB6nPLiqNnVp99lotDQ0emD9PXrNau6OM2
 ilucfD44wB6zE0lkddulgXdP2fC9GQWxudLWE+2Bv518op4D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79e589 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YURt6oeoqR9mFI1qLTQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: wmBLxejuILsrSsCvGVPl7SnQiap4X1mj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfXyIEjTE7pGf6B
 jdAgz431wq74bS2XWhL6r4VIAZX3vKy+mH7N4BWjh96gsF/rj4rCyNe9eVSZVtbdiFz8X8uamE2
 f2SggwQH64FFOfvM+3AP08CLdcxjMYA=
X-Proofpoint-GUID: wmBLxejuILsrSsCvGVPl7SnQiap4X1mj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfXyh1pez/Q6P5H
 ENtTRCF1cdMaAR3/jqmaocuLAFApndSpsMWcnKLAp953azQrdR2ZXJrLhRBJnzQQGH//H6no1gH
 yHZ658MLxGzsfbxgfsSy28SJVpjXePjscxg9h6pIdQQzljetWk8C1+fiY49Xe3JKkvk+V0zX4yl
 OUzxtFikxtJdrPHtQrup7nxhuHPmPYNm0LO6oC9VSqqxTcBGHiIUzoG8VI1b//tmJbTWd+GwFnq
 P2EpINxtBQP//5bX0lnXl2btK5oU+jfEJDtGvlqsgsQ4OXcjkAKN/L5AtA4kenvEWEFFgm3q5Jr
 uFwVyUlpAMhNrecV/hHr7QCOH9J7RdOj7zP0ZZiyGgRRW4UFFPmrHGn8dng2K2dqPGtjOOCpatU
 31DzQ1ZDGI7bV5/jPmlG+n8D90+8VMBAWuiiAVG6fs3fRByNBtpc+/rvLbGQYz+/dcLHDBJhQn0
 iD/ueJXtK08c+zqJFLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_075153_788614_F03A78C2 
X-CRM114-Status: GOOD (  13.06  )
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

Separate alpha formats need a companion IDMAC channel, which only the
graphics (DP) channels have. ipu_channel_alpha_channel() has no case for
IPUV3_CHANNEL_MEM_DC_SYNC, so ipu_plane_get_resources() leaves alpha_ch
at NULL for planes on the DC path. Yet ipu_plane_rgb_formats[], used for
exactly those planes, still advertises the six *_A8 fourccs.

Userspace picking one of them gets past ipu_plane_atomic_check(), which
never looks at alpha_ch, and ipu_plane_atomic_update() then dereferences
the NULL channel in ipu_cpmem_zero(). On i.MX53 this is reachable from
any client scanning out on DI1.

Drop the separate alpha formats from the RGB list.

Fixes: f6b50ef14ea8 ("drm/imx: ipuv3-plane: add support for separate alpha planes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index c7ec09e557c1..a0fd39eebbbc 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -96,12 +96,6 @@ static const uint32_t ipu_plane_rgb_formats[] = {
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGB565_A8,
-	DRM_FORMAT_BGR565_A8,
-	DRM_FORMAT_RGB888_A8,
-	DRM_FORMAT_BGR888_A8,
-	DRM_FORMAT_RGBX8888_A8,
-	DRM_FORMAT_BGRX8888_A8,
 };
 
 static const uint64_t ipu_format_modifiers[] = {

-- 
2.47.3


