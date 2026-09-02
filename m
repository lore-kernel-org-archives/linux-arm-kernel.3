Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0028C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJookc6jcAFEyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=; b=24Rg/X6WyEb03jOEYeUK2Fk/oj
	4LLXYarFruiNfROSLVas1fkfGN54+siFcz58qxGnfcq1TiH193QF1IUvKhk0aGxKvV49N8gKY8o8E
	hHD8sTA5unjQnyRY7WTnuKhGhrnDvG+zTK/z2w3s5XhHOxcmzmwL7XcjMoXpg7edjsN8DMj15rks5
	+/y/YvGPBbxDxUDe580FoICeK13CjkG6OBU1EajmlAOooPk4MJ3aJGO5E2Kt9xQYf0794Q0kprqsv
	vhkjp2kBRT5Rp53JO4wy/Qr0/+IlNbYLKdKfduGFHUKJQe+Ym4uufTczTDYRmCOj9u2104vhlvxeu
	eV4iV+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOt-0000000Fqeh-2lV1;
	Wed, 02 Sep 2026 20:17:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOq-0000000FqcQ-3k7W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:17:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHIkj2417953
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fJookc6jcAF
	EyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=; b=cKzTE0q9kggbsu9YuOq1kAkuDdR
	YJhvVN+czMppY1U0nol/0Nu9eJg+w/VFZzYpLp6tDgr08w/mOjZzQMor1M5ZJ43s
	aqFqFF8zPGXQ974shwBrtJIoDDhkVNz9CXms9H9Ur4Nh5EJh3egmeDqIa8aVm3HB
	f7W+dmLT4Bpgj5WrbBijZpdzHBScjhtTOCpC5WtmF8n6Kg8j3e12752VkYVhsUAV
	euJrXiqfaKFvPGVbkivLLcukuLJ4/t0MfC0ImtQmBOwomB4h1Tyd5aDhFDADBn7C
	wt5VIxwjnf6q4IbxY62WHm94TJBj9F6OQtfzZFVnS5QgaNIjYXnDEWEc8lA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsena-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:17:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2640589a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380255; x=1788985055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJookc6jcAFEyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=;
        b=KQJ0Z6vwPK80xzzU4Mocy8sFFKxVMMZa7VZv1OWAb4+8cGKi0S6V2BFdbQiJV7ryIe
         rk4xDABys+YZmdpOw0Dviak3jaFZ2ZNykkTLdurUHybgcEl22H5ZFZzsUNXHPf1Cts2C
         VcPEtiPRxTORAluBwdejkO22gl6LebrU13fWrEpCAGFFyRv1yrWW9krt4dYaErBqL3yn
         sVuQbmaEotcv/0H+losBqpYeuvtS8xyBKut8cEHlm58puoN4EwkKfct+Ok5ULxOn1vPv
         E0684iTfyapm0JObj0DoQnGOMJ6u+GzXoRgn9CQaFTiZBAIHp+dyXhAF2iZiX12eFjaq
         wBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380255; x=1788985055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJookc6jcAFEyWsEkKo0DtGELL3YSCH9IlXzUWBNEdY=;
        b=FVRlF2qe0gl0FcvVU162jCvHrd7lEhiwifwDgifmM/9Te5cgjx44Fnz+nsstHXeefu
         9Cnen0Vz2V6nbjaYFe+DxObadh06BfYH+MVt0rYSgrbJ0seBGsYYQYoNb4ZHti0jiw9A
         tF18AW36c5MRhFJtKobmOwHPZIDvj0u3QuhkOExqmkUXZ1edrkJoPCrol/yXFJhRGeFN
         H9+giTD+35J2xLp689/nBvd25vQE56IRyQVIN8euXLmt7wHn6VNs36pAyzEYvYt2zBqX
         PVJkKYRjCUVMYQs5nKTrou9HISz3w8f+derTRmQJHsXfyx66HeDK4M44ElCV4IaOfVBs
         R1vA==
X-Forwarded-Encrypted: i=1; AKwUvBwyboSiorzLxvM6NrOSkSbK8BGwvjrfQOrxaWiNavSGhrZGZ+Fgvvj8AVapSzFoFIzAUKAssYoUZOm+PXeL/9LZ@lists.infradead.org
X-Gm-Message-State: AFuF++k4wSTVSQ9Go0l7sKJREJnR4v0aGpDa5fXAIZmyh2c5rqR/LXEQ
	p5UV7EP4PmbHbhDQO02iP3MIDzN6LvvgTlWPx1/lEvtQ94t8ZcXEjZ8u2b9gLLiBKhv18506kib
	2xqqBylcXoRkfiL9qrhIAqq7xkZHcBOaXmfiSbn2C2W0TBPMOF/Mrx2Kuy0XA8sgNsqqClK5KXH
	rjbg==
X-Gm-Gg: AYBFou1p6vB7G0jItyM6qa6E8bklIP7qbOb+X/B+yAlkvjmiW1Uu4asAJpXgxQo6LU+
	tM5Rn+CjryFyt4W42Z1yxKTVNawu1MJxkSseoGZ4aEl5uR7OiGo1qVzBkaLGFVA3ZtTU/O5XB78
	IahXTu5htbv06p7HwD6u0XeBkJRvIKBsGodpja/4SKL/4qk0SEzMOY8vushbseO4U6HZYh/JTtP
	sNuEIxMu0BLmPv1YLckovU3R5nA9vZHwmpCQkoSHg5fENTbPWQ15+VsiMX1vKH69APU6FOTtcfG
	DL+RQfrP6AfK3IozM0fPbJ2JngPRUZiHNeIRp94tRjPECKjNgH7zTr+Ih3bICK9n99YbbU1bHY4
	eERY1K+hRprL3x3op8wx2ltw7wrw=
X-Received: by 2002:a17:90b:4b0f:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39aee238df1mr8817750a91.21.1788380254738;
        Wed, 02 Sep 2026 13:17:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0f:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39aee238df1mr8817663a91.21.1788380254041;
        Wed, 02 Sep 2026 13:17:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:33 -0700 (PDT)
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
Subject: [PATCH v2 5/11] drm: malidp: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:34 +0530
Message-ID: <20260902201640.2024648-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a98845f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=JOjAg5lxkONN77W759IA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: XBF-v9n0pBxJ2kwpI_m_cY1rqWjBPSXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX8TecxdUVkCt1
 YhhL+VziSI2VcqxFyaJIWpxfYFczh3/deyub95/CRC1C0UaJY4auMmv3E4+TcTBuPS/EHFeWV+T
 n9przRSihYsJ5zIZW7EJCrFry6nQ3Aivlot3NRyLuVcYARXqA/XJ4M/LzEdk7SNXwcT3896Al5c
 8E2LVS7pvCoriM4jb0qQlKwUDt2YO3zdSNjUpz7hi1iiAjeu3knwV43pHrdnI0HMEwlkm/m9t9w
 h4w+qs6wXWfYlxiIKKHyJzpaN79va2DaHAFUWSjgvkj2+2SLXoGaZptyPwan8/rq04+lqd7obAT
 RlGDDZvWdUAG5PR4gLXVuNbSVvcFzHIEcAK5+9xYfcim/lrkk7mhoFjLjHayS92TMCdQaGQMlot
 2R1JIbthT1WsvOC6q2TAfS3JHd++M8i0HxbnxwGCdq60DFp8Z2gTqyMtSSf9ULxpkCVIU1Em1Lp
 Mbn5AFIlrAMgLjdAg6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXwXKUGzui/3pn
 QqQ/pY+KXFWgdx6ZAJ61EtMWJaJDykdgaJp4WvtsRbCN8FehsH0r2gihJXM+Zkcdbl9Pqu7oCh+
 TfMDwAMqHm3TRzGnrfUubSdoMPfgUdY=
X-Proofpoint-ORIG-GUID: XBF-v9n0pBxJ2kwpI_m_cY1rqWjBPSXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131737_051399_49A7744A 
X-CRM114-Status: GOOD (  16.04  )
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

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 23fa942ae4bb..3e17513c3114 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -758,7 +758,7 @@ static int malidp_bind(struct device *dev)
 		return PTR_ERR(hwdev->pxlclk);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -887,7 +887,6 @@ static int malidp_bind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -913,7 +912,6 @@ static void malidp_unbind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct component_master_ops malidp_master_ops = {
-- 
2.55.0


