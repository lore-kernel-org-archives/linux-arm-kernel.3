Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD97C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zxqhJG+46XP4U4QelHuaFoOC2P3agnUHF42PXfBS3WI=; b=El8d+cMr7TSV6A
	1Zv0vNdxpWtAbwSUicQMmq7Vv6JnT9BSko2CtxCR4MRJQaCXs0v/kDHb65aipOy6YlnHi6aZBSirU
	zDVIjK8q4otZ0y5/WTB8browi4uLc0y/95EfvgI+nw6Xh2eJ7CFGVOy1m5k5cMWlXvkoz9r4/tRoJ
	GJxArSpdgWnnfCw1+Q/oyuZEaBVxrCCtkKBhEdlTnV29Luly+/iKBR8iM70rxw6WjjtJ24HlV413r
	ANXvc9z77nRKeYW0F1TVil80YQXFb/UlUVlJJbvPfJsdJkFNIklx1348yBqZ9/uajdUx6NHy6b5ri
	hkVEcqxiV9UVHSK3MCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRM2-0000000C6Gl-2IN8;
	Mon, 10 Aug 2026 14:51:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRM0-0000000C6FT-03Vh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:51:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj4xx1343128
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zxqhJG+46XP4U4QelHuaFo
	OC2P3agnUHF42PXfBS3WI=; b=XpAMESP9n908IPHu947b12Bsdz2BREv7xJjkq1
	M3rZwDXCp+FBLV6Rm2JhQit7XzeMRbZZXKBnaUclwygxoW05+JAvYfXfNx91QFfH
	vkyIp+V9uTqlbwYvsxxuW/Ix5pKVIEWE7qiH7mYbdDswT38uLhE2mV2e+aJAzZ6y
	DttSM2tMJFt88pLUsq9da1UE+m5ryWqDgejk7jQbAMEuhJZYCU6bT1ymKexbq+xg
	SAFmlcdSPjPys1GXycjAkLH49vgJJmWq8KSg/iaSVHaBpxWZhUGT+JvzAKnnasNR
	OkHHKU+IzF6EE5Jhf74bitMEAJA3NIV/GCxgr2CaPTDUe16w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v5a1ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:51:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9087f2fe592so8708336d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373510; x=1786978310; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zxqhJG+46XP4U4QelHuaFoOC2P3agnUHF42PXfBS3WI=;
        b=U1Afk4067zgu0FpOwUa63Bq1Dms9Gg+zo9zxjuf6tORPgKlBaWn4uYN7O6Wy863agI
         2BHYj49qMK99lxCH6Ajxoul6olilegTsT35eOOkrfk4bh6OL+bnNrBKzb4+cYmOV9hRV
         FB0e/E8FYZO54xNEA8VSaUs3xZX9jVua8D94nLiGrNmIqunhZwzmCeVtJRjphBmcJ3RZ
         ZICuIxjar2AcFC5rFS+/EQiRAw1bfUtqIbgvyiRnM7U3gBqSn0UTyLJPHZVsX9QRSQq1
         5/RgvBIDVXs+xzO6vMybtmVgWGrPAl8ZQBEbWp1d8Saj4/Xw7HtxmjTIq8Xe80UCGawq
         zeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373510; x=1786978310;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zxqhJG+46XP4U4QelHuaFoOC2P3agnUHF42PXfBS3WI=;
        b=juXiaUj7VABqSGWXBYkG6mZabeqq3ykT0Fgstiofvs8cglMWFuLVIV59W8j9hjBAt2
         7eVR5/phVErWY2e0Ia2GFOdlhaf3nb985NgYGn0p8BtqGhPRShU9vXBCbrZH7hBnKwuW
         vYd1PbvPlTpsWR/izG7LKxCbXGycU7KRoyHYWr8zQMLdXFhHOivNF9dVsSNgh4P7nHGJ
         heA+J8wE/tzqAUBnlv/zB8t1ekedVUE2FByi2kCVhqB/vIQJj5SdgHf7tUJIRGwEohuU
         cOqBLzo38MVpYXu+SXSX1wgHdFzCBqIGTLKcZYxwg34011Woyf9YazJDarwkXdpFHxLb
         iCCw==
X-Forwarded-Encrypted: i=1; AHgh+RpKrbZPV8Qm4FA49Ekwhui+YKrf4G2T8ERwSswqj2WJycazWaDB9zUa+2D+DQTeUJQcuZEEiZWXmjptdLQnZVpK@lists.infradead.org
X-Gm-Message-State: AOJu0YydBqbN3XlH7H7l/3ftPvlzKG2gyhTwUaaG2SyA87tY7FGUHxRa
	c7URvYRQSXHEB2VI+QnCnXxboZSJ4t9SOEgnpYqTIi6hcol20CpAscT3829u7EOZGBUJ6lXkuTv
	oTCwwOEGMwlmolC83FReAt/bVnU0ekPHCVNM7MEtMUgJNy74dS4UEfhTnUaln93IWzVQGCRGsjV
	TahA==
X-Gm-Gg: AR+sD13GuJB/YseJQrg3QmfpX0QR9zTBaaARe7iCTwdcnSEchV4HruYS0xwrxkB3B3y
	BjuniWLX8tpKSkL6bHsQvgry6YkiFPcq9EOK7gdPI+HKO3+x2vz05pO0OBcdOBV74hTqn/6ARoL
	rXOE2cVhxM1jpgUIU1htIUBPoR2guGc+Wxx+ZVTpwZHHXl35wqVKi4Y4VFrKnyTVSzfbctdkknn
	htOm+HkjjLd/ph2hG0oYVYYPoZ30ozk3pfKyAtzf2RWj1Cv/n3p5W35ewzSMcl6gpYCkNZKRGLg
	bcLgPhACQiQ/IqSKm5mv2uVkVDzb8hzMNVBepadNxVojceBZr3WKmg3oocMhWtgaUhuud8eThrI
	wWJPhGCyKP+50Uw0qd7J6rdQapcOtw3gP+8TiiJLEyD8zdEFwG0IRukdLcpWdX6WbVKFTHFP0zb
	YPsYatr8njdd2xZw==
X-Received: by 2002:ac8:5907:0:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52d20960822mr231815951cf.16.1786373510462;
        Mon, 10 Aug 2026 07:51:50 -0700 (PDT)
X-Received: by 2002:ac8:5907:0:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52d20960822mr231815361cf.16.1786373509999;
        Mon, 10 Aug 2026 07:51:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/imx: fix TVE / HDMI coexistence
Date: Mon, 10 Aug 2026 17:51:45 +0300
Message-Id: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHleWoC/yXMyw5AMBCF4VeRWZukraC8iligg5G4pEWaiHdXL
 L+cnP8CR5bJQRldYOlkx+sSIOMIurFZBkI2waCEyoSWAnn2aYI9exzNzCgSqQqTFzrLNYTTZil
 sX7Cqf7ujnajb3wrc9wN7Z1CJcgAAAA==
X-Change-ID: 20260810-imx53-fix-hdmi-03129d798678
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n0QwEGmm9QPFYqEaWEPfuhWwBfoE4E6XocGYB82nrkY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWD0drxB6zJyouBN6QZVzN8RjwVSKS4JXKly
 Mt49RWAqPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1Y9jB/43j39n7WjjoMAQDWUq589TaOBcT8q1aNzDUtM3ol5l786d/QI0TGEFznYALxKC97mF56N
 Kug2nJmXQf/kJM90Hp/mhuIZHbvRTFtQGm7t2TspzdZ+9+CUVQVEw2D/Avr6u24qwjgkp+Iegky
 7c5+9hXHjOC9vMYPo3Z3v47TZCKp9g7eD8AxFloZlpaFVg5BDLKI3zaUTj/zYTHkytQVTWLM034
 RMtR31LoM8xSE4MA7+lhJT9Omo8cDnfNb28GJePn/vECpbvX7Gcr1We0e8q0+ixsQO+UEI6iOZY
 huAzUDgnPWuQzxRI/HFK0w+1nPR+QA0fNkmtRF9B+edPkoJP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX5QNukBoITzjb
 sWk5RMv3lJrNmf7Ym7yt9s/TlvcL2nFMgQa0XtHYtw26id+Y2yllmBSyqQ84sr/ZkOtWZ/tG0+n
 RYBTNBEo5v1lm1OBtlKvhhW5tFapDJg=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79e587 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qhRTTLL9oDwathZehP0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: GHBPkxtAm97s6-hyb94sBeDjNOwwohif
X-Proofpoint-ORIG-GUID: GHBPkxtAm97s6-hyb94sBeDjNOwwohif
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX9EPaL8TQ1lc+
 v1DMRlwmPfPNzxodTH2BqiWQHlMja6/BFnAPJ4i6SucmUcf2FmhYTJCRoA0HEbNSyeCuUTOXcct
 i+Mav5L1q0upCEx1sefhs1Je0GqnGkWAjePeE+Gb2V5RrqGX2kdmwzh3mjN0TW/HB2/KWqUqmvP
 EvfJic+sZToAIOsBIo91sfvaiVVNyu31xyQ4vhKe/eetCDRMgStZy4QOYsl7FPsUQdX8r0GGE7r
 GzYbmH3ScIHaqEAUyzQbcy8Kz6PyNuuMjeYI8k77EyKR5qtfJOFWvQDD0nrwTgs09yomY56ey0w
 I58QIwbT+IR4pzT2sezQ3B/WkTxg8ytuJ2+7NVsmEjhFjOBeyRzNn49PUFf4rJ+M9DmNDA6tS3c
 HdzB64cKhqpwomt54ZZNZV7HSNtspg4kkYTjf7jIs3fxOOWCoC4spI/bvhxcXagKBNvlsfk29Zx
 cpC4aGZW0THMvvlTAkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_075152_058998_C3A44114 
X-CRM114-Status: GOOD (  11.28  )
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

Testing MCIMXHDMICARD on IMX53 QSRB platform revealed that the HDMI
output is broken. The TVE output (even unconnected) forces the PLL4
frequency, breaking the frequency selected for the HDMI output. Fix
those issue, making TVE stop grabbing the PLL4 frequency (by correctly
reporting if it is unconnected).

While we are at it, fix two plane-related issues, which are now reported
by DRM.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      drm/imx: ipuv3-plane: do not advertise separate alpha formats on DC planes
      drm/imx: ipuv3-plane: add the pixel blend mode property
      drm/imx: imx-tve: probe DDC before claiming the connector is connected
      gpu: ipu-v3: di: report an unattainable pixel clock

 drivers/gpu/drm/imx/ipuv3/imx-tve.c     |  1 +
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 49 +++++++++++++++++++++++++--------
 drivers/gpu/ipu-v3/ipu-di.c             | 16 +++++++++++
 3 files changed, 55 insertions(+), 11 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-imx53-fix-hdmi-03129d798678

Best regards,
--  
With best wishes
Dmitry


