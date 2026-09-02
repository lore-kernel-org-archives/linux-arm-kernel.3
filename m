Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F09BC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pBRbhbzo1PcOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=; b=PNXH5KAXbNF/bbpgZU7CzlDpL5
	BzUrwtaK4ICpuOnvV01pcahbrKeoQGKSDiZpUhoxULcs6o4v2Abyfi0jFhxSrn9sJR6d6EBZnzqoS
	WMGIQg+EZURVvdLxf9hYX+tPKwNEfGIoGUMHy18G99Q2kk26pWB311Hgn/4H/58CCb5pg7NiyInHQ
	zdnwMC3WxWZ5+peO48AZ0iDCYwrKNlWTvHd2HKl0PH2HvX5CPHbtt6sAH8gnrKMu2Tw8BVyxvsRcq
	MNvCXk5HxyxUe3MeehD05cJrhcJIV3jJDsfaIzUx/peWgKREVF4yaD0c3uCckY7U2HDme15w1jBH4
	FijNUUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOU-0000000FqMf-3PL4;
	Wed, 02 Sep 2026 20:17:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOS-0000000FqLn-3B1m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:17:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHCtm2523726
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5pBRbhbzo1P
	cOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=; b=YH71TVQXwSMcn3Fu/Uff9SK4nzC
	54IULE63yNKCuMTPEd49MGBUR9KKNNIN/QVTquPXtzIjMppcDurhMW02H3mw/HoK
	QpIWWpHShP1aC26/5Elx8gXqpOsaRWjvdKkLXCUSyLf1mZfjfZiZSS4H+mV1c8Id
	88ruhQ6RqKJIryjdqDsY4tS8gLQX3HTIOvazfZQQPjxVQiBY+Ozb/umbSbvelZan
	fwT6i3hl7FkpHSIJoP7vd8T9SpNtUG5AcXWPwBduK7YLtF34TKGVzNjoOtZ3ZMdN
	eB2EhtinE7Jy1HoAhoeMJRx0yJorifYNZ8msk5ykeSvB8lt2qUSCYqN0DjA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s4jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:17:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1078150a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380231; x=1788985031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pBRbhbzo1PcOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=;
        b=hq/mq92yP2baMAisKLEjM9Kqj/xTTJKY6xK+rWfzCk1GHhUn4ZZxzx1aLnq7HsnTGQ
         y1YHKIXf8bCYX9LsiQsakwJxxR6RCGhn/2+g1dtdbBQkRA7dZsNQfh9Vj+9f8DcDWBeS
         BrXDv6HDFCYHgllNkj/vIDV4oHjTB6eBdYw18HrBVQ9ZQyQcG6bDNXE7sWJ1G+X8znE9
         GGto6qfB8c+KIvuD51fPjUv7um/BgPnFca0j5lyk8/fUcUoMEFmU5ckSvzBiL//4EO+c
         JSnvc4hjQrt5Ox0k1aYazIvH9RnriAW6pMioNm++7I4MR2+T7i3lrDP9xiVxwa3ew4iK
         /3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380231; x=1788985031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pBRbhbzo1PcOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=;
        b=kzpHEv1Q+LJB+yx+qwV+yqEQSyv66FzvPBrbo5mbiB9Nwhur5nWm0269EBRLht2SQH
         x/paX6ARsMQrG8Hfyb6cbrvxSuj/MU3EE+NDOR2cJp/rtCEn1mDf5oHG+wrmo0sdp0ej
         o7XdTCMK9BVv9D+jygVIaLtPHGrsUF2eHU40ISOcXJ+Q2qiDzGt1TU7bYyWxY86ovOa3
         L4WJislEDL4IVvxyhP1VpFMiA1jFon8xpDnh8XBA2GlhQg4Y+I1BKVwVX0vH6nSyRARM
         UEc290YMMRZFVDx8pPg1uPLdotrNGUF5Dh7QOFg6PQxxHCnu/EuXeRFbsBQlTCHnEnw1
         g+dA==
X-Forwarded-Encrypted: i=1; AKwUvBxP/rtMyeHm3I0xO4TaZv520e9P6QGn8DrVbSgm0kAdB72+XlgEiIaT5OvOtVfYfoVZ2LndARTJVLmn4o3FRF3h@lists.infradead.org
X-Gm-Message-State: AFuF++lkxYcTOPUfUwXkQRr24nU4dvydxYmc9i+zVhFTY+UtylWa1v7n
	qC2qFGMff+bU+DsrcP47XqbKcFsAkbAe9Ly+W7GrJS5hwZlklXhUypD6ipZQJq+qx27IuLTxloM
	lVhvcQvcQtrsm6NQ11BPtUVhBWKYJNoQVoO9KBS1z95t8u9u04fAwQVdC3cZMB2ij+EGWLSkF4j
	DC/w==
X-Gm-Gg: AYBFou2fp38220tB0V5vN8dNE+XcvBl76mRB6k0d914euU6a/VwN7gQrDoYBxTjTNSj
	e8+im9qG4jLh5hqLHacS8CAqArXqAIlB3H59xAxGhPmbwv9/5C/MB3KnnnrF/L6L5jQ2XxV/NXw
	6oCdTPdHwQz+ID+ZySeEqNVOxYbFdcxUVnDYBodlcCC7Xs1wfGk+haj19Xd02uyC2CZKVSOlR0L
	aHi/QvtAkkdedTKLEGp6zqgGmSRsWjDUspoGF7vMLPXTYaryp1+2C5Kiut2ExhRwP8m+VAxTedl
	k5Re2YSe2wfOs/64ieqTmM7MaU4DJZsnmfr2x9UJIV7HBTiyGbrgpxNn0d87vdCXUWETMazFMrs
	rl2HbBV5CMGgF3oUFeKQR5Z5nfBE=
X-Received: by 2002:a17:90b:2785:b0:396:5cdc:4bea with SMTP id 98e67ed59e1d1-39aedeb83e0mr11608242a91.5.1788380230694;
        Wed, 02 Sep 2026 13:17:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:396:5cdc:4bea with SMTP id 98e67ed59e1d1-39aedeb83e0mr11607901a91.5.1788380228811;
        Wed, 02 Sep 2026 13:17:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/11] drm: hdlcd: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:31 +0530
Message-ID: <20260902201640.2024648-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a988447 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=zu8Q1U5i7KxegdXecekA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: aAC9B925g4RfED5PAobtZHeDOvmOAXh5
X-Proofpoint-ORIG-GUID: aAC9B925g4RfED5PAobtZHeDOvmOAXh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5YSTfl+kXOho
 mgweETLl4O47q9PDvdZfS9hehKmAt+Ppn08XOqrI808GktYGKs6RWFC2tyTXQiDBg2hW1umNrZw
 pnqcWY2OgehFgns4/8pO7Sy2bZFPiZXfQ++fCcRRRRx06YTsNK1KCbc/lXQCH9IaZS7lUHBud9o
 C3TBXQ1OLsrMKbWahK/36G1qzAM+79knk6B5ws6skn3YL2pwaLFZ+h3kcY0RF79LE2VWf7iMHCK
 6b+W1Nj1vSY0exK4BM8Gb2tSrCyGoQn3yQPhUG0fCrl1h/uYvFzmrDcG/m3tNxf78ktHNNoO+sq
 wROd77gA9+EWTsCJ8Pznt5h31iCWNkv5o7N/Igg9mIDflsELjviHiv0y2HuCQsa9UF1Iv0EYHUf
 jlRaUBNKpzG5Uap/E3L/p9euY9Piw74pnhofr8W/SEcKpK5mutgi2H4Cr0xb9/NLWyaYKILLOAj
 Z4XtrmQKj4nJHM5KUUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX8PbX+an4vqC8
 WWCwDc6gt6Ex0/BPt7bd4B8w3eUGFaAttQdUCfN2TxWyR5Lh44fHFufc7fGnkw3KzL0NAwBqCpt
 LyetzOWvivfXqZpaIGzFlf0TnZwnMao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131712_915106_91139AE8 
X-CRM114-Status: GOOD (  16.83  )
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

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Remove the three explicit of_reserved_mem_device_release() calls in
the setup_fail error path, the bind error path, and hdlcd_drm_unbind().

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 81d45f2dd6a7..67466fd441d5 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -134,7 +134,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 		version & HDLCD_VERSION_MINOR_MASK);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -164,8 +164,6 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 irq_fail:
 	drm_crtc_cleanup(&hdlcd->crtc);
 setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
 	return ret;
 }
 
@@ -316,7 +314,6 @@ static int hdlcd_drm_bind(struct device *dev)
 	of_node_put(hdlcd->crtc.port);
 	hdlcd->crtc.port = NULL;
 	hdlcd_irq_uninstall(hdlcd);
-	of_reserved_mem_device_release(drm->dev);
 err_free:
 	dev_set_drvdata(dev, NULL);
 	return ret;
@@ -338,7 +335,6 @@ static void hdlcd_drm_unbind(struct device *dev)
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
-	of_reserved_mem_device_release(dev);
 	dev_set_drvdata(dev, NULL);
 }
 
-- 
2.55.0


