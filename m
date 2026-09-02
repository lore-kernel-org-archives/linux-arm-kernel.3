Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE37CC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JDjRVYqzUw0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=; b=k6SbmzXGmk0X2Oiarkyq3opoF3
	ymdLIjB0UjM8eB6pxE50465/b5DJ+Xmcf7l9uKw1l7W+2rHyUgRCA0i7yz0FV4a6UU15Yf+Nxp3iE
	BbXjfCPB0u6MXaR8t1ysbhcRTMlDmQmbnnzlQiiMbSk07qxg3qAt+ZRMQSZVgG6SQqCetCxKLkSlv
	yp0ZdmNmNx7wPgJp8GwP667jlP+XpD6LzZ+LrfSEpxZAFUDHppHQ4BSXNGOayD/aqdYPEro2UdlV4
	u0gUbd6uhVpSvXDuXGul5zd25rX6fCO2kmBBEt1MZ9AWIzdpCwnz3Iev7Toa4Sqt0gHMByDl5uQWN
	8iUwY3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rP9-0000000Fqqr-3xea;
	Wed, 02 Sep 2026 20:17:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rP7-0000000Fqoi-28o2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:17:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH8g22417705
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8JDjRVYqzUw
	0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=; b=EZxmMMjjSUe4iDpYendft8KMQIW
	QkTF2YwCjO/T+sAA0lM05BjucwS8gz5p8R9Y3XJ8dt3UKkChO5FXcmzEgXUYh5LV
	0eUM6KrEuBBs5kxP0uzF9gj5GfWUkp6aC6hqAqGb4Rt++R/dXixxZqPa/dj3gjgG
	VIondF8saW5VVamYQkiL3C+emxDxq886FpIUTmNoJIWi8eb7UMiAGOZ2JQ+QMhfO
	/oD7yrZ9fucXcKp59nfpx2XTZ4N06MhaW5AEiuqcHir5eQFTJnqvpTT9lAiTGR8C
	8XHq+Nb3SFVzm1xP/WolzePIlW8KkPNlVss4gLm+VQ3dA98z+xxFZHo6Lww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsepg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:17:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso2287033a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380271; x=1788985071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JDjRVYqzUw0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=;
        b=TtJ63lfWqmYQ+oglFQRoQbBZrztz5IZS83eBlqGksFENvQcMKAS5MNjx/zAxkR8JdY
         tNY3lDU0dIrSIYFXU9VPqwLWXrgDc4GF8Yy0oIClvvXaipteBK+lJtsdkd7qN8I43Ebe
         X+qdLulmST6OKcLSE7B94ze2aXKjj4tyvxUAXy4JbH/uzkKZJuGBVkioGvN9EzHrd8EF
         dbebyKcukpCISUwo7GWVkL/xitMTZ5aS0B2/c84hDSU6o41OVIoJuBFchn2PFdfFdWRz
         LYbhQN2LF/abJZmUeyJyBqmnCa+XGQucmyiEEqEwMlvUqqXJQkK9ccLPjfXY3+ahpPYT
         rpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380271; x=1788985071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JDjRVYqzUw0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=;
        b=qV5SvmZUywPy4jSRRClD4zOKJEPqWfrcisBsUIGb+X3QJE86Kf8f5wC4+nJAgbVAfY
         p+97paiThglZsXgReUw9XhFXKRBlcxAI6wqBBO/JtxpowE98IBBYgbU7YSmq9AahhBay
         KtkQ86/sUQovL/QO8FE5udIHu85AAvI0dzjqDB/ro3TjQ54eJKzR4l2BZGzcktQgUwf1
         0FfKLhdDqR7r/LCQt1WXWAi2XsQX52aMzsUh1HUWuJfGibB2xJVExAEI3nCl01exIn0A
         2uXN69WHLs8j1ipsvHeFhf1K42wbRMw54QfE8uYwre53Phh9xHgfdiqH09aChF0DV3+n
         NcYw==
X-Forwarded-Encrypted: i=1; AKwUvBxHrM40MOIWWeV8BqPUn1aqkuqSZ5o7Icwi8egudMt3hZ4VZorKS3r+JYVmUZXDncL/prDpVgo1t80+/JP/czg2@lists.infradead.org
X-Gm-Message-State: AFuF++mEUgqQPE+pztvk9C9bjkkn9ErHk7IMcyb/0zAzP5/p6cdRDBnH
	zHXPEHUB1lJ0OvPywN0yQ17rdu7asJwmkFHm8UgeOUryQyKDW0HXolcQTIp7bzwSBQu/AQNjLMw
	GVFw3w2D3SI9B6mNbjHVDwN91R7tYK4xYyoLL63fgJDbyhWTqSegzN3YZc4cwhqXvEIbrjK2nAd
	GfAw==
X-Gm-Gg: AYBFou3GkXWV6RF9lhjqxGP0wkJnyn0+ZXvtPSQi837cifFKe9leljtZ8SFSF5PTaWI
	gYtt18XxTo74zwKdn6Mn8wjz3TmupFvemBwFCx1wK8d0C2CNB4ntvaZGd78M6h1A2OQJ5/sNg/k
	ZVVgQNuTdSJk71L4c5oE34IS2dRLQzurSEefEA6Rirgnvg7g7RsggTFgJmtrOXET07X1Jq8F42d
	eeJa1sIxteGl1NDgmcA2fXllyoz909Sjl/FvKfshn5gHKEhYlMPIkMlBrzFu3dGyF7rPhFxn+BO
	Q9AMd7SCSyB7GnlorZqp0yFAwbMgNMfIA6BaQq9Euftmg0f5EeoyoGJUYqAgE8ZmV93i8b2pl6u
	njIDmgjXGSFmM3mM//oCs1jiN3Y4=
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr11025937637.1.1788380271478;
        Wed, 02 Sep 2026 13:17:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr11025843637.1.1788380270956;
        Wed, 02 Sep 2026 13:17:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:50 -0700 (PDT)
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
Subject: [PATCH v2 7/11] drm: kmb: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:36 +0530
Message-ID: <20260902201640.2024648-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a988470 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WgoW8aVLYYFOpEymBdMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: kHt0OmLaSK3aJKSDjIOJqHBX2qaQpQC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXzg5qhIF5H73D
 C0CMwu7Pbb0WR0rAiOeJtqiCGuQboygKgHKW0xK9IPbZWMxnKCNNTNseO6gtlU7haOPBHQd2HwE
 xsDVMNJf+hPHaNgOhJFZipi+flSIxLLzcrYTKVtqaNgi0bS6SgWCDFlf17LSZvnVZqTlzKg+AmD
 gMGn+VDTqWkltprNruAW/FHzRUuDVq3ZlGteWjCLy0l6D79jjVhR5PRQ1CL5X4aJqhKp21iY5WE
 jucpMeE9iLm24mHPaJDPHpqygKvaRPF44vO2Hkbn8Vz2gwYTO+uU5HkTplJC3q2SOaLnBIAfOKt
 P7Y8G6pd5dNoIjyoTWBy6/MoAEMPy07FMopuO3lvYGAGmNV7pboQ47SUzw+Cn09ns9VUrNGG9CE
 pDT1VMegQqg7TuFpP/dno9CVPORTZ5giWKeHyMna9iIir5seysVkGhOTzROoqu+SzRJVI8qSXzf
 cuM8IM21YX/6yasiCvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX4ojVF4/V3TVf
 1h6+WiBpoiONLOJxelekAvvYN1jBkM0/IeYPxpTn25+3sApnMtZTV8E71IBoqyCUc7fTyeCDPV3
 3Bt93J54g+VW8Uu+QeV4ITokOioKAUo=
X-Proofpoint-ORIG-GUID: kHt0OmLaSK3aJKSDjIOJqHBX2qaQpQC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131753_672390_97C7CE0C 
X-CRM114-Status: GOOD (  17.91  )
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

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.
Also simplify the IRQ error path since the release before init was a no-op.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7c2eb1152fc2..88fe377940f3 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -140,13 +140,12 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	/* Allocate LCD interrupt resources */
 	irq_lcd = platform_get_irq(pdev, 0);
 	if (irq_lcd < 0) {
-		ret = irq_lcd;
 		drm_err(&kmb->drm, "irq_lcd not found");
-		goto setup_fail;
+		return irq_lcd;
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -155,11 +154,6 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	kmb->irq_lcd = irq_lcd;
 
 	return 0;
-
- setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
-	return ret;
 }
 
 static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
@@ -465,8 +459,6 @@ static void kmb_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
 
-	of_reserved_mem_device_release(drm->dev);
-
 	/* Release clks */
 	kmb_display_clk_disable(kmb);
 
-- 
2.55.0


