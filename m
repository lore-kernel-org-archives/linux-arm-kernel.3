Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5AEC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWK2/qaA/kgie630momcYQ5e7QWvw3Fh0xiIUnGJB64=; b=TRhS7Hgt9vJVTInc2ST5okUQOt
	XLtlgB689Svx4QuWKEjFwwERBmTqCtpspZbwtXEhTQ/noUqgbalQrZ4OZerUqy1qYf7BjowNfxDjZ
	xcnyfGsfjUPct5uumTRePCvXbBAR+OZxf92GPTShsuutR3GCTJRdkF2DVQha/cvYzTslB4fZU40TK
	/+Jm8VDZ/Pvuh+Wj7mooFWw2eMtmXvlCR0jiGnQrv13RLIIfh53SXT3eQGtHXR2+yjdULX4+xwGfV
	tgxoKJyaX34q0cmUbSsK4qdgpbnQmos0n9el23/NhhAbZZ1Or91ABAAWxOJr/Se6iW8v8qc+dCELC
	9Rhmjp1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPO-0000000Fr4O-3xWz;
	Wed, 02 Sep 2026 20:18:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rPG-0000000Fqwa-0gsO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:18:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHWQm2686502
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 20:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dWK2/qaA/kg
	ie630momcYQ5e7QWvw3Fh0xiIUnGJB64=; b=DqM8xg8oAo4+te9MVkPE+2hkAzc
	jz5r9PJt3nDNOGMwdU/VUpro8XOtp3eHfX/u8HVUvQbu0LWCEtcmP5SLJcrrGspl
	qazsvC3ud6osB0K9NzaAEcU1rjz6QqFJugx6i+mrKgjMZBnECm27NB35J2zRSf9S
	XRpbNtmaL3xkSniXibMGlZNpXp2wU9GMSD8oBDO+O6J/1a4xYS7frja/mRQD2adV
	vr8uhDaiq5bxg56VPEFx5qdC8a7xDrgaQ8Qq8lx3ghdriTlbu0dZFSnmhEbgKYmB
	ya0xA/vAO7hnVf9OUZWz3jWUwUoutjgPdxOR+DWuQPLCFALNsgr1aZPu3Iw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a86w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 20:18:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso2089446a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380280; x=1788985080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWK2/qaA/kgie630momcYQ5e7QWvw3Fh0xiIUnGJB64=;
        b=LprDX9d69uRdFbjpFhsmKubiu/y3Iffsm0PRJYim3IYzxAQ4SFrzd2MzmgBZpIrOQn
         AqMPUS5wAtuDqPuutsyv3GFflvoum+AOgJenwMo7QcFYQqu2glGb/UXcm4MekhFc5pXz
         Ywqhq4iQVaJ3DHu5EUqUKcXOkmXldICwGZKjIenUzppSrH4VdHCoseRWb3D7p1XgQK5g
         3SvC58NAzqYw6bvwxsqeBApoVx7ELRhsDhfg5Jp1B/dJf9csl1t3GXnJQm/kxAndXoty
         Jb5mVP/n3rqEFsHpqPohKLl80e5HFEk3IYzDXxKlG+pCBoHTKdfNGCPE3Z5S505vqe1n
         OsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380280; x=1788985080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWK2/qaA/kgie630momcYQ5e7QWvw3Fh0xiIUnGJB64=;
        b=rDdF7ZYWXWAvo97jneljgOvqFx9Xo1dllqN/cTXSf2vjOhHvil7PUiqETO36ZSxRys
         p8RnrHE1tcCKYo8OL4IND4ya4GoHHl1CwqU9rbLhyH3lQ3COsFiCtdLcOTveBDvRnskQ
         TavFwOUVijf5cHhRyie886aOotuevcdZqElwZ+l6W3VaW/DTMxU2G5k9o4w07bxn691+
         7l2F1jKlzOBzlKeqGQQBiLtp823Voqw1xerS4lxWe608clvQhHccmefuZhrYNm1mgvYA
         enJOQj9/jNUZen0OqQNOMN2yJf1jC7XQnJYCWcKxuQIPvq3FJU6jJhyAWH1IPGjzXpRh
         C4Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwVSezCh4jT5mG+8T5/tA0F35D44vGtJyC2AqodGaP6FtL/axJYtY0XUbVJDhz5xcreK+Pne9PfgcPuQQlsL6Yp@lists.infradead.org
X-Gm-Message-State: AFuF++mwBBgvOEjtePzPdjgKrfA9TNn9ZcjTtpC1Zv4CnBnPUefXCkXR
	8TFTuW8d5uxfwt6xOIPaLoosjpurXjdNMPynqoeWkt0d0ePp14Y6fBIXUvagCQTHKpjrntCNvtm
	7IyhXFfsO48GLKr4Elr5cE+kzJhdCg9bejMYeVKDf3oaLxgsJgPwUy/LCAQtHe/5mkv8sBaHpvn
	q7qQ==
X-Gm-Gg: AYBFou0S1YC6luuswikstgpqHe0nP+8Q0rTJm5iUmI5cKxy03zfjPDEt3FheUPFO4fV
	GQ7N217DwXd1hVhLWu3gDDkgGm4l8jR+Ick1WVn18Xo4j4z8NKbAlMg/kgHElPEiZVBb8KeSzIy
	T4JE+hYzAm/5eDPPq5xjCmhhlnMbyFIOvufG7vWiggpENiadlxjHEb5MCMwxQ1oIUP9Kt+Lyyde
	h7bzLBvAIddhz4MfBSJ40Mr47a0OoqnGmBMYRxCs9PLwAoDfC1jX4wauh8r3JPwqtDjFBa9Qo4u
	F1ubxRCsKVkMDoSJbSBMeMtLT0CkZKwXXxp1zl2dOPEP2vicK3f8HImJJeVdI+/Nhw4NUgYsyYm
	qJf36z3/gKHxwLceQ7lpWsA1ABDo=
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39aee1f9788mr12319141a91.24.1788380279851;
        Wed, 02 Sep 2026 13:17:59 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39aee1f9788mr12319070a91.24.1788380279338;
        Wed, 02 Sep 2026 13:17:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:58 -0700 (PDT)
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
Subject: [PATCH v2 8/11] drm: sun4i: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:37 +0530
Message-ID: <20260902201640.2024648-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IcdCl_pE4WBEaWjaj9uevybP0saS9GAo
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a988478 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=UuaWy5wPpgFSIu4BNl0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX6+J4QVcVWJSR
 SWVWZxnQz25rF05W6BM3aHtr/fjQ76yHQjVKeJkdkhdET5wLkZ+Oh7mukyx1PvgcZK2anli1tLP
 R7LradHdvzqcphEVmHIAD38QdREmW/dnfsEx47fLcUjHjAUr0B73S9pfwm67b/u7RaXec2XQtaZ
 59w3MWK62tgSJv3GH9YBlukDzQJZ9f9tJbOSxtgTlIEotAoSSsoBXt56HxEKIxu4dacWd5JP8Xe
 YC8g5mOPTlvUoCAuZ4oC/lO/I+J6rWq7/E4LBxb6+R7EHop71HonfOuVp7udE2NDJSXgQ7H1Ary
 8b5xcgeVZ6uYb0uxlXhnXtE52zr8knDYpFW26UWejpNMmXMgCaS2FZ0KAuqKP9/zUiZYwx0yGFw
 rPHX6yOoKUkD2oOTXHO3Vui9VDOKibh9l/IFoNtM6D8jGKPtxBHerzwwRDBxSPXzFXZQiq3bhFO
 dbfePRsbNANpWaWD2og==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5aTp18fowL4I
 7bxpdbQsTs5LzJrnOWB1QLyv06C8GfYFCetJCmIbri6M4On9W1k38S/oVP6FZ7i0MUWfjBV1CRk
 xnKHd604xGiW4k06veJcRAGSy0TzW20=
X-Proofpoint-ORIG-GUID: IcdCl_pE4WBEaWjaj9uevybP0saS9GAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_131802_365522_4570908C 
X-CRM114-Status: GOOD (  15.10  )
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

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index e9baca360160..c24f96bdd135 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -80,7 +80,7 @@ static int sun4i_drv_bind(struct device *dev)
 	INIT_LIST_HEAD(&drv->engine_list);
 	INIT_LIST_HEAD(&drv->tcon_list);
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(drm->dev, "Couldn't claim our memory region\n");
 		goto free_drm;
@@ -125,7 +125,6 @@ static int sun4i_drv_bind(struct device *dev)
 	component_unbind_all(dev, NULL);
 cleanup_mode_config:
 	drm_mode_config_cleanup(drm);
-	of_reserved_mem_device_release(dev);
 free_drm:
 	drm_dev_put(drm);
 	return ret;
@@ -142,7 +141,6 @@ static void sun4i_drv_unbind(struct device *dev)
 	drm_mode_config_cleanup(drm);
 
 	component_unbind_all(dev, NULL);
-	of_reserved_mem_device_release(dev);
 
 	drm_dev_put(drm);
 }
-- 
2.55.0


