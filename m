Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8177C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6zBJEgANuVffuY9NQJyHG8/+Xeax9coZJWuW6ZJ2WM=; b=KaQKtO2ymEuo6m9WHf8WYCXbRB
	LaF+P3BQhBVX0kExY/0xbQ+MrAEvTlyQK5v6ujIBKRWpU2DSoApSwG+Jxq9rnU8v3+6kxdLT7T5w+
	BLNWQzgbY9mX2OHPIwpQsdRRgkJdWZOOe27lIJFyRtmwHJHHY2H5vCKT5hlJndPmQXM6UUecnKN5N
	ByZgY0eg0GlooSKkOasLPi4H15mbIvAnPOj2gLhBPtqbUWY1aSIRpW1f8tN95cxiJCZf5pq1QRCSW
	4h/OweqJpARY8oBpN2wIWMyh2NHZLdkdEM3GobCcrZLoV/guYUqe/AUQj8VEnwofOp1B047pk/LWV
	/stp+9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiSIp-00000008SH5-3Aaq;
	Sun, 03 Aug 2025 06:34:39 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPt7-000000088yH-40fl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:59 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso9004425ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193597; x=1754798397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6zBJEgANuVffuY9NQJyHG8/+Xeax9coZJWuW6ZJ2WM=;
        b=JPrYGWqPPP3Ger3bpE9b9TcqrkrF7+15/rJO80CVMCYDTlHUil3vOpy+UYiAXcgOLw
         o2q8UqazKh3FyXvfwanRrfe7bqgAL4IfWj2Z690pOhv9Kg/7jxk1jctoN3WXgb6LRTv2
         E7a9qnxG7iiHOvoR4pRbm6H+fG1qUNlYColO+BBqNDqIopy1d3tR+w/IBDJEE+LKnqzV
         o9xdE1JcAj8g4D91sUa1oVrJt+4xVJD90QxvC+KY39luPY9+krsexEEQA8fHYxYDUldc
         aSNHfSrE9YW6tRk2OwM4QXbaYK46TwqKlo4Iof3kht/ui+8RRaeM8Woh3ooGqk/vLElP
         /IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193597; x=1754798397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6zBJEgANuVffuY9NQJyHG8/+Xeax9coZJWuW6ZJ2WM=;
        b=CfTTZRE2Lbs0/5R9h3+LqKpr8cm8oDwobQpK5bDQPFFY96bgyLzlHwOvokvIDYohdz
         RiEyrMATT1Hu//SV/QROeDKMHa3OFkGxG7FLs8ys19huN7P1iTplm8zbfGJ4mWCQbdac
         cTwRDKivg4KDpjzJRDVmp1txuOmJF3jhSY8kRZLniGtimqeNnSw3KXgQOPeaDsuzecCa
         Y3PSR2yb5SmTpffWCY62nHb8iemehVHP11OnucGRRYxDovi0wXhsYjENgWpsEU14mv3N
         1XmuE43oWmmrf/TlqS4kPejnBL3WnbHbIDOyGG52cVXGDTLG5I0wgVaGuK6RX9NZVXvS
         JysA==
X-Forwarded-Encrypted: i=1; AJvYcCWN4+RvE7YJL7rokDIUFYQr/pt7YE46npr4tJ3+IeMxSptSttFncgk3V6dieRpEbOGwTilLT6mDNWHa5KGfoTOA@lists.infradead.org
X-Gm-Message-State: AOJu0YxQPD8qBAPC3+Mve15NCjZvqbO1W98kvZwEe18kFAJ6+tZu4nFT
	dyuWwiB+NyNCEz8mN9N75FSp1bJXOC1L/6CvVDVBVhWsvLYptD71pwuF
X-Gm-Gg: ASbGncu5aX7d5wbtzJgQvYqgY/3R58mrmzMCNht/dC9l9DcGVx7fmgA11BbtRTLKq+8
	xuCLzl0o0LuMZ6v9h6Z6hVw/nz16i8Z2ted7cuv5WF+VsAeLypPmtKW6k29fA7UKELiPpApHbVw
	85tNHimS3Uj9XfZ3m/K+VIgr95xPmQUS/EHRHHG31+Os1vDDJgwxtgm2QzFIKxQb+Kl6Ce1TN6P
	fFz1HeG7IeACY3JPjqX6yZmkCWlCJWuCE3NPhTj8MFp3Fkt+gLopKmNOAJtTVpROt0/m+oEzICk
	9dW5bHHNgsJlLEjA+M4hp1A8mI/ELpWJHJ4egub6PpmObrjpTYExSKABznw2j8ZBQKahP4/2fqz
	huhVgDmIN45JVTnzvcuJBMJezETHyZ2DsU02u+UmSmUseZWLX1RCZcX+VLiOyl+QGR0LCMxmP49
	9wDmUzosg2rUON
X-Google-Smtp-Source: AGHT+IGUOgHvStYGi2AGuiva7QKSCj6X9DfG9+bxlaldERvaqq+8SW2QK11YiYCBPzmbmAT64CKkJw==
X-Received: by 2002:a05:6602:6c01:b0:881:4a70:4651 with SMTP id ca18e2360f4ac-88168309e74mr805665539f.3.1754193597187;
        Sat, 02 Aug 2025 20:59:57 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:56 -0700 (PDT)
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
Subject: [PATCH v4 58/58] accel: add -DDYNAMIC_DEBUG_MODULE to subdir-cflags - RFC
Date: Sat,  2 Aug 2025 21:58:16 -0600
Message-ID: <20250803035816.603405-59-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205958_000642_D793B5B1 
X-CRM114-Status: GOOD (  10.76  )
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

Currently amdxdna uses drm_dbg, so it needs this cflag in order to
compile; it currently gets the cflag from its own Makefile.

If other accel modules want to use DRM.debug, they will need this flag
too, so add it in accel/Makefile.

NOTE: ivpu has its own CLASS-ish dbg system:

./drivers/accel/ivpu$ grep IVPU_DBG_ *
ivpu_drv.c:MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
ivpu_drv.h:#define IVPU_DBG_REG	 BIT(0)
ivpu_drv.h:#define IVPU_DBG_IRQ	 BIT(1)
ivpu_drv.h:#define IVPU_DBG_MMU	 BIT(2)
ivpu_drv.h:#define IVPU_DBG_FILE	 BIT(3)
ivpu_drv.h:#define IVPU_DBG_MISC	 BIT(4)
ivpu_drv.h:#define IVPU_DBG_FW_BOOT BIT(5)
ivpu_drv.h:#define IVPU_DBG_PM	 BIT(6)
ivpu_drv.h:#define IVPU_DBG_IPC	 BIT(7)
ivpu_drv.h:#define IVPU_DBG_BO	 BIT(8)
ivpu_drv.h:#define IVPU_DBG_JOB	 BIT(9)
ivpu_drv.h:#define IVPU_DBG_JSM	 BIT(10)
ivpu_drv.h:#define IVPU_DBG_KREF	 BIT(11)
ivpu_drv.h:#define IVPU_DBG_RPM	 BIT(12)
ivpu_drv.h:#define IVPU_DBG_MMU_MAP BIT(13)
ivpu_drv.h:	if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                         \

./drivers/accel/ivpu$ grep ivpu_dbg * | cut -f1,2 -d, | cut -d: -f2- | perl -pe 's/\s+/ /' | sort -u
extern int ivpu_dbg_mask;
 if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                         \
int ivpu_dbg_mask;
 ivpu_dbg_bo(vdev, bo
 ivpu_dbg(vdev, BO
 ivpu_dbg(vdev, FILE
 ivpu_dbg(vdev, FW_BOOT
 ivpu_dbg(vdev, IPC
 ivpu_dbg(vdev, IRQ
 ivpu_dbg(vdev, JOB
 ivpu_dbg(vdev, JSM
 ivpu_dbg(vdev, KREF
 ivpu_dbg(vdev, MISC
 ivpu_dbg(vdev, MMU
 ivpu_dbg(vdev, MMU_MAP
 ivpu_dbg(vdev, PM
 ivpu_dbg(vdev, REG
module_param_named(dbg_mask, ivpu_dbg_mask
static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo

This looks readily convertible to a dyndbg classmap and controlling kparam.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index a301fb6089d4c..e437549cba8ac 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+subdir-cflags-$(CONFIG_DYNAMIC_DEBUG_CORE) == -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
-- 
2.50.1


