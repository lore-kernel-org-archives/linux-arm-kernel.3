Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A672C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDxCUuQjUGu8gAgTcWoe0tjlRu1oBXDA/+Q2bzPJkMc=; b=0PFFBiGkLDkIGHNGQDBIxvnKzt
	ptmwPG0nnQju/VqW73PuCNndS6mJxYu2QRPHzh3xcGAk+yO/k4y8JAY6s2tsT59WH4AIwCrahM7y7
	aNps5euGATEB4Sc5TuuB0PjYIv4VJjXU7JY69meTzvue6kN7SPkCS9/1Jnw+b11MT30gyuUYdV96U
	pffk/aiwmMllI2yfhaJqJb1eh+yqN/1NXN5AslpIeEHPCJlcnfhDsXvwXTCYPC9f9d1sITmBDqVPs
	0JCErEygrCcAwXeeNLuQBUIMMdY0v9Tq/ZneuEpoCdYb40BEoCA5GjAB7R/u7fHe5uNoK7y7a3h3g
	SCx7vcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRRQ-00000008PNO-1RLZ;
	Sun, 03 Aug 2025 05:39:28 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsf-000000088Zn-1N1n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:30 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e3eeb81f9aso26795545ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193569; x=1754798369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDxCUuQjUGu8gAgTcWoe0tjlRu1oBXDA/+Q2bzPJkMc=;
        b=GOfXQi7XEgR3UJO83b7gLsmFBpb43kOQm6WhvlhczTCBmty5o7kA3wulWmjbarOzu1
         1QAA2juL6At0u4z1LWbeVWXYKEh9C0eG+IXA0vGmSKgwqgTlxmdR08VMOsdDbfUAOglt
         bpUffJdRnoQfr6x1zRtpYzn4lIu1WQfWxdHqn/rLrOTOrX0TadGJvT3EPXGAAlsMebJz
         8tMaFzRMANLX3m2O8Y5Jmt553yNhrDpnqFhtlbqciYSzQrdr0++MFzWOKT70SRhPpEWu
         SfgoQwPZ8hQcLVXOqd96m3hkIaIxv0+PAK4BjXP5xrsMTYYqQ3q3iE/zHYAHbdd4sf9u
         JGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193569; x=1754798369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDxCUuQjUGu8gAgTcWoe0tjlRu1oBXDA/+Q2bzPJkMc=;
        b=v5uOKKN7/oBe+ny15tcHustDW7zIImp8xfGdFBOuKHCTzlxzAaasMH9xC7DPPaGaxB
         eTsCBmGiUVDxOk3IgLfjpPOY5JtrScIN2Qx11Aj4vqWsqTVexOcS6l7iq0QeQP1eiyyc
         fl2jELNMoub+abzmYB9VpJ3ZHsuOjHT+w7Avj5FkpHRd90pC5zik6T+0kGIIvBYulVi4
         Kck5RoDn0I0HsIXBt5xbUnjQf5QlhHHxwbTtxYraDQl5a5cyPMIotkL7L4ZSmSVICOGQ
         fpltdfOZ/PIpx7HQgsBd4Q1sUaT7u6orD09YOb2rlj5UtAyG0k/eYyCgkebGAwNN0kEP
         707g==
X-Forwarded-Encrypted: i=1; AJvYcCW5FDv5Fkpfryr/gB0Wy9DjLVUp9/L9SRdJNcCPrHJ4LuXvykoKaIQARbTamzxz7PgUraeIbQRt52wK6+OTjVME@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7+f5LcC+NpcCK8nyWmfEDmSwVvnxUqHHPi2xsWStUfSuUP1r+
	xTtRMU0/E0ZSmgpd0wwV7OCUDCn+MTO+ONh97LKT8QJxRALwCu7gwG00
X-Gm-Gg: ASbGncuT+YkUeOB/ssOdWsRBDRGG3+cjdFF/0usyY1gmTIVHrcK+Zv7IDKHuXbYFDZp
	tWtS8Y9ry+0M1QZg85Ep0VuiGJHixKBIw8YB8P3oR0oGPGFrCsdbvj6K8NLx7vztGUSaex6BWfb
	fEfaU/Egyj420KItd4tUkZxU7udKiTs2Evq5uF8wnkWYNJONwP3Nct8ZNLLZz26c6yfo0VU6PgI
	OLbkpwc3zzO8+nmjYJbPDgw99+kYS6JoB8aD16AvPa+ofii5D/tp4W9BoxkusKHg/aUASWyMRMr
	h/MCqhzowY5vDJ/AaLZTmAuu++a2DlDpjbKUUwaJaObXzWUQgFqHusC7R/ztpluSY6AHVHuHPso
	H4ll9TTYTlFHfsbn69J35OZ6NHxzZApcPgSSFJf+KewiQSjabwwx4V6R4zwGPp3bbbVyzTFQIki
	UCfw==
X-Google-Smtp-Source: AGHT+IGth3u4prFPioIoRO0ZqX+noSjESd93MJR6zagV7L9uNGSa8yCZng+SW2QdyW/djCNVq3SQ3g==
X-Received: by 2002:a05:6e02:8e:b0:3dd:89b0:8e1b with SMTP id e9e14a558f8ab-3e4161b3e64mr95013645ab.15.1754193568672;
        Sat, 02 Aug 2025 20:59:28 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 37/58] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Sat,  2 Aug 2025 21:57:55 -0600
Message-ID: <20250803035816.603405-38-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205929_380730_161E854E 
X-CRM114-Status: GOOD (  11.24  )
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4db92e0a60da7..b235e1e8c6180 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -245,17 +245,7 @@ int amdgpu_umsch_mm_fwlog;
 int amdgpu_rebar = -1; /* auto */
 int amdgpu_user_queue = -1;
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
-- 
2.50.1


