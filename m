Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF240C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lDnpS9AG8BMnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=; b=IGH1/zOBz4Y5XhsyDNDoEmStmD
	QLjas/gpp3B0w4+nG/pl55XtMDXGJh4xJyG6NM3L02hTKYFX6bgvYCUrh3zR+6afouW9Sb0HTOjrh
	QqnCWpM5iiWQMYkD6v02bmPYneA17qBDBRPXrtX2T7+UR3a4bCkC904cQ8NLDLQyTJa0LuzoHzmI3
	kf1EFSmJKIDAKvcoW+CgHeVF25MqjI0d/17tOckM34o1Go1KWLhUTji+1UMxwQXNcFNDsaFVBOJW7
	yAwmvaxwzUm9+8ZZORsS3lt56UmoBsEzTFWme7+CIZHC2xu3ou4XccHlqpczvHuY0vvDEl4Lhxyts
	pymZPA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOc-0000000FqQy-003U;
	Wed, 02 Sep 2026 20:17:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOZ-0000000FqP8-0Fe5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:17:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH2jD3288558
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9lDnpS9AG8B
	MnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=; b=a0sYz4CCAZERJ5cvQgZ067dKOaN
	q3zsMGdWtgW4siEJGM7JhH5S27ck/eEvpze57SsRdLn6TIb6EYfN4QDUd0EgoQ47
	hCyZGr6sDbJ7x0sKo2J5FjWKamDlSx8J1AfHtG13YKSYWtdxi8lr8kdNCA37Mrn7
	ffVtMIw9RXL7cpU0LXHWe8Y2v1Hng0Cw8YAniRAajGPRp4mAkHO15m2C94aUICNL
	VtHZwWDy3QkuVzs9vQCqcXewaaRtyixuRjgqgrCtOI+jCbl0UhLpkfLp1PykMbjL
	qokITfmOkJByT5TuP8bH+8444POICdhc+B1vucMlN5DsaaxXwT4RQuCrmzQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8qx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:17:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so1812055a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380238; x=1788985038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lDnpS9AG8BMnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=;
        b=Ysq5P4vTnV24g8srKBI/Y6QXLr03PYNMi/T9bMaF7vXOtslO7dsJRrGAervOJQtRQr
         KXjxIf2rGjFQlJsbNHFuyAqFcnmprHeSzCHxy56NMkG15CxH3/P/ADT7YopxOfZVy5/Z
         jl6IIlCmZrX85VUJzAmTZVGUUB3o6VdzhhcYhv5emb8fu84O5B8tz6f36eQoQGl29KDK
         2huRZ8B5RWqcdQ/cQoQL9QRFlsRjcJISUOPYTd7WjRl7okrpM+J0ScBVw1ku0mvJC44D
         qQtK/wdKk65OcFDnVXu/eDme895eZDdgdqaxOKsYhPfFOGCMdRBPBaEALgYEJUO308dH
         MV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380238; x=1788985038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lDnpS9AG8BMnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=;
        b=Y6Myq23zraj7V2/n2oyZ8lrRxkgt9aBKdPLZTYEW1NnDDmczG0l1s593VYvpMmuvUm
         zdgnrdsb6bpVcAdAL9+Wgktul2c2NIAJW2iNOi3Lo8WAAs3Ss1X0cU/4rfwt/WmW29wi
         S9WNwu28I0tCGG2jZ7r5eqrSdk77YaTwVw5hWCO3Bj89zoaZEdYsbW3QpKz0GbRfs7wc
         PLcKkJyAUScEvwoHZsK1NsJ+ksoxEcCvBSu4ZmoIqvpMYZaZPmFN2mupWTLu6dBEfokX
         CHku4fHtB9jyaU/QJ4Kfll+3nBuRQ/jze12CBtOLbl5x4o/w4BAtz6mMCTKx7aW9zrI9
         Rqsg==
X-Forwarded-Encrypted: i=1; AKwUvBxyMIFE/VVL7ZTes0h82+n5q3r5qFCMSVj2SvV9VbdxUECZ3kf6DOKjvBw9U4WYXda6jHUrDlyar/AMW746Zfzg@lists.infradead.org
X-Gm-Message-State: AFuF++kme5a4WlwFUEwOojbqntDnLrnxjWXg55cJY4OH31O1KedjOSi5
	LulKBMKk/diFwP05Ktr9jmrOmVPaPLmVfF/wG+OCX9Z8PciUwazvw2zeIeLZFSW81cdJmInBi2F
	kCBrruZ0hJ3ytID3DJRAdyTShg4HQP9FCztxjXmkrDt4n5nBu20r2qjHp5IxgdhVgO9yJW+AuEO
	wq2w==
X-Gm-Gg: AYBFou1b1kyplY8QiwTcG1PYeYZVbRklFzaq+tXp1PWQ83rHKPVbMmqYBqdDtWGiyxX
	23if7zyVkejjV5X0e737hrDw8IUtgCtW+uu7MsGHewiPC81cbYSRkxFG3WJtMM/vnpOjkn1OmiD
	bJmwMUmOX74MpD3mZTWSTcEaj82vhO9UxVDQI7tLD2JZRem1x1IMvWhNGKjMEgijjixe67+qudw
	y6ZBnhE3VM9LQeGn9M0HYoqEZJmjtWpRUSrfUlp3QEamJEitt+knna+1FZZq0dMBX+4IOZVXG37
	9NzPRMnYeDs2AQg3367xeqwDuF07SlLxUsaN19ArlHP5tIET5PMmgK5v5HAm2u2uuxQXYxKG9Y3
	6qkZz7lwoXg08bABLTcA7fsyJc6k=
X-Received: by 2002:a17:90b:1dc9:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39aee17a0ecmr11378938a91.25.1788380237640;
        Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc9:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39aee17a0ecmr11378858a91.25.1788380237159;
        Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:16 -0700 (PDT)
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
Subject: [PATCH v2 3/11] drm: pl111: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:32 +0530
Message-ID: <20260902201640.2024648-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a98844e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=cxSrDiPXJhrM2elx99wA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXyn/MIBmqjD//
 jJzZO+uFXX0A1IFlbmQ+JRbaRJ/OeZgXfkKxigGmFK3BZKWrT9uWPktdwVLgKrCNRBbRezM4ILz
 tlahqMyuPzdq3+z174dw3QETBfehjcg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5mcxGDj/WNfp
 7ihaUhPVBZ8D/vyhGaXG1I2osDlPECNDHHFw2XVMsofB1Vy3mlrqRUCrOn1HrYzGzpF5t2hSHtZ
 Qgm1CJjHVJ1l2jmMVgMi+Jrvrag+IDdZXuvmeFqtqbRYjC3QBeIKCis4Z+02C8v3wDQ2MbcdMTy
 +Si2Kp2g7G9NW6WS6mNYd/8C0I0ZWEODVGiaesMvgqU6f/9ShPLsTm1oS/V2pf9qEjf6P7x/91Z
 XqCzmF6Dni9pQUmZBYNdt2649huEGEiorGrr+G9jBCyrJGY1aI9QGPLms28NXF9sweacOdWkY4I
 ttm59//1mTZmK2IAoL4CgYYkWFzeETsATBQkCNbd3zRkj++H/8ObjPUHOOPl9aHCqQJX+pPlgpJ
 jxE7DRMOrqbtP01FZ2dk9fIOpd5mls4PEahgI2JIeid+vYVgg0ZYITmtBdr/cGUOEHoxkst9UTt
 bmuomRB3nHA9UoDD/cA==
X-Proofpoint-GUID: 0MUW0LqM25VR_uJ8-IVg4AN670GJEvqD
X-Proofpoint-ORIG-GUID: 0MUW0LqM25VR_uJ8-IVg4AN670GJEvqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131719_105393_63A20FE4 
X-CRM114-Status: GOOD (  16.12  )
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
region is released automatically on probe failure or device removal.
Remove the explicit of_reserved_mem_device_release() calls in the
dev_put error path and pl111_amba_remove().

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 8ec659b3c08e..a07b17261961 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -255,7 +255,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	drm->dev_private = priv;
 	priv->variant = variant;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (!ret) {
 		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
@@ -314,7 +314,6 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 dev_put:
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -330,7 +329,6 @@ static void pl111_amba_remove(struct amba_device *amba_dev)
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 }
 
 static void pl111_amba_shutdown(struct amba_device *amba_dev)
-- 
2.55.0


