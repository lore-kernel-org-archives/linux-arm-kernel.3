Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B85C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX0wy3dIOkODQINpUya7i2089vNboqetAJr/ccri1K0=; b=BZcm+XM10jzxvLZv6eMGLog21N
	inYgfIbgTgfY0eE2NHfaChbZ6l7XSTEsvXPSndjWs8JwqpcyP5gQbvUQ9osCXW+o3NmD3DfJ8eVZq
	2s5OqQDIZVe1trwSqkGnlUVqn68rlr4Kgvwp9M5dkAGf1pWShqFVOSG6pg0/4WKu83wHA9ZhlDfph
	EKJTkEBwHmUJ3z2KfTXxuDmO6DoFdgHAFoA/bhxPIrAgVgclYytiZv5GGSslBKnrha9cgjA5mtkGT
	PR+Axx0yroDdxwWRV6z6GyNljyUKfc0W077jRc8jUocNVgksKpUgIKGGkBOHx5Q8EjT+AbwGDXQKO
	CXfDxS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRZ3-00000008Pik-3rV3;
	Sun, 03 Aug 2025 05:47:21 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsj-000000088d5-2XoT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:34 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3e3cd27178fso12835745ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193573; x=1754798373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX0wy3dIOkODQINpUya7i2089vNboqetAJr/ccri1K0=;
        b=LfGR0SAPqVmq8sig4AQ6Tjc4O1943Kbo04AZsxQCT0ZKjPAq8YmGebtikxq8Gpx7so
         pHBoI7WpEHc2i+pAeubXF6WnfGS/8aELOQy1tRBBfy+ZAvSDwbxPN9gvBXVyNZr83CRc
         QczUoWSoPk+5fl8dbUO6NfXSyGv0izGMUsmOKm0U4fGy+4JhhMs8lcc/goHzzUjhAhWp
         DlZcLfOBiYbHMjcgCicdHZOHxUxkURIyf8Uj4ZMg/1Oy9niNF+HKEHX16fJdmsvwfBqK
         oB+mFA0NdJW5w7Y34x4J4MjHyfnrR2frA10hXXzv/N3KSzHSFb5AhjF3w5LFZ4dCpskq
         ucUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193573; x=1754798373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX0wy3dIOkODQINpUya7i2089vNboqetAJr/ccri1K0=;
        b=Pa78ROghH3SADWFiXrfyqYhRNvBCnDuB10XG79K3g8cku9uYltQFHriXf9K+6QclGI
         ny4GnlppE9Qc2y/ybQ9BnrsGrB/7jTubfvsGyIyr47sDUTqoS9BqKpHnOTH6bROBBm9E
         t7ut0fo+mLxanYwQU5HgvU5WBuj6z+kar5+Es04UdMo69bl2n2j04mK8JVNFT0LTQ4uP
         flTbnlHdZ7cX7poSnI1YclmyICuijfnJLQuZbwX01XPdUuQv+QEcNyue22xcyGllCAec
         DnKZUPhkRdx6K5HfGnsXRrnsxdeLDuutekKZ9n2xsmkUtWi0awL90C7A/pzqaePuKUYb
         yGjg==
X-Forwarded-Encrypted: i=1; AJvYcCVxOP8ehlOVBQbP2V+MQD3XIUFqu17trycHJNX4jHT5RVohBlHfQ9KyLTlnFRvjXQK3x5j7q70t84OjNpA/qs2R@lists.infradead.org
X-Gm-Message-State: AOJu0YzKXuBCLECsEvW7HjR5htoYxgZVrXJ/HoHrlXFGIfgMTU2P9BF2
	1XLChz9z3PHAQ++/KjWx2wBKm+GSv+MPV92QaO24dwUQ2WjR7UrFtN0e
X-Gm-Gg: ASbGncuTq7gzgFjHoJLWEK4C5ayPDA1Hndu2t9nnYs349ibsG/ADmq0dojY8kOOul/C
	9snsPiia7dHit8jkaFJYfZuZfZSMpPldlMISjjFizCdOBoZMwTBoJlXIhNSvhzDzL8C4junBwLZ
	T9+JMj9G3RffgeErZh8qcAuKRR9Cmus0PBPtJnVYu9xvZflvLLtN14bXuAlbf92TXxa08noaUo+
	D1LKGxKT8o4mmIxfFgYjUb3HzqKDtEHl3P1F2r6UO+KS429bvwLQB/ePF8cg/j/1RHM+n2YBaDy
	IAgRyrI4kdm36WeRZN9LulXIZD31gHjbohFbXLJW+YOCZNLo0GowTXNrk4rZ6fgJ2MVxQmWvPaC
	hbxF/GmlyctnXISvs94TnuIpQNz1NZWOmd6WsoaWxEkBeQpPij9I+XPEscOR+v3gnlN9qXyIcSh
	14Uw==
X-Google-Smtp-Source: AGHT+IGc+JsMKOicIj4OsJejzSDjbJADbBCmxpF9C67GucCVwf4NPItA66Nt3F/BJKgx0ySRSJwRNw==
X-Received: by 2002:a05:6e02:228f:b0:3df:5333:c2ab with SMTP id e9e14a558f8ab-3e4163772c7mr75665075ab.17.1754193572894;
        Sat, 02 Aug 2025 20:59:32 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:32 -0700 (PDT)
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
Subject: [PATCH v4 40/58] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Sat,  2 Aug 2025 21:57:58 -0600
Message-ID: <20250803035816.603405-41-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205933_648595_831B0FBB 
X-CRM114-Status: GOOD (  10.57  )
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
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index ea78c6c8ca7a6..f296fb9de0aa9 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -43,17 +43,7 @@
 
 #include "drm_dp_helper_internal.h"
 
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
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
-- 
2.50.1


