Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E7BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXiCwepwhznbX1KBNscjXPO4baEWE9aXjHhFme2k8Rc=; b=BlHmKFZmqupmjYLFtKZ5qlIGfZ
	DemyrEzq5DSBjyg1ax/9YYHFLHKI60CHoG6pFBq7hX2zUwxHa0GqItwpq0V4V42maQMMAA8lcM+gA
	WChmFHwN6AM9ha7qC2d8uHy3sxGJSHVa+n0QQvQRk4wQoifyHVHzLIgodMLhhbc6LbgRn9Do7a//Y
	OwuEHO6Et4SkjeOE1sj0Y2TOk+f90/RP4oeJOSEZ3+DPB228CGV/X5z3DyX/Dg+T2QkhAli6YV80M
	wv8WQLY0k9KcFBRDLzUVOHz+PW1sz94+diuOXIc+OotDZokJkQR1lBoUXqqp/o0QU5PBzgJNqTqAB
	9Osd2frw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiSBC-00000008Rqx-08kw;
	Sun, 03 Aug 2025 06:26:46 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPt3-000000088uE-2Onr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:54 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3e40050551bso23422045ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193593; x=1754798393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXiCwepwhznbX1KBNscjXPO4baEWE9aXjHhFme2k8Rc=;
        b=dF9Xrt5JKox/LsXazuulGAPrYARttWahz5yqYUKgfG2qSqGusdnMrZM5Vjd/DB+iJA
         nNKHlAiPsYdCQ/RnuG0meBA2grTDye/PWuFKIlkx5S4UIYA1iwS0QlJ83dv4uUSJ+VmU
         DuuJJS9wILLQyzNwdR9h7mAdtsW5o5mE5yHfbnFUdtYiOJjCmjVQKlvm7lzlIt2L1tV8
         k4qLwV2ZjvL/dMq9QhLfTUvTq7hkyRpFowYp9X7IiLVAZFeRHRJseOFke7erHw6wegac
         Ahv2Kca5AO2LtCZAiDh8ozWiFMYPKa5LP2A+9MS4+MrxD3OyMbUNDfwpjRBVlT9ygXzz
         iILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193593; x=1754798393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXiCwepwhznbX1KBNscjXPO4baEWE9aXjHhFme2k8Rc=;
        b=uspRxt/TWz+tNJhFzzTQ3KVOm/FarMe7Clc1LRTXXgb2Atg5nwfyTqzEBe7gki3e0/
         8ozOtxuzDw1WLPKikHzrQW+NsrIkgLeRlpTm6qHPoWow9Ey1aj3/NDvQ3cj7ZXyBUA9r
         /wXIUMEcE7Rbi7yLfc511Ndc/+C7bcH0tenG80vO3LQBBecbmZ9NWHBp0W2hw2gKHsqR
         8sHq510ThDCUreqVMHEOYZsHeUGLwzOnq4cBD4ZAJov1BH5OtGnsf8GVkby3bdLLwZHl
         hUV5j0eWvatEpb1QhFHPH3SAnCZZUIKPTmdjIdZYPqok2U9gw8kSuyk8xPTqlPxILVid
         9gWg==
X-Forwarded-Encrypted: i=1; AJvYcCVmLkVeVh/SW+MtbznVk6TQqx2dUY/y6oY21J8OplY9r5D1UCpta1pvKMCtBm+zMFkyOI4Lruu/9eH+agRglxdd@lists.infradead.org
X-Gm-Message-State: AOJu0YwWdZTThIheSAT+WvEDu2i/uZ8F+I8wFVqwVuVfKERU/G8ZbZhd
	enpWz8auec5jqFB00D8A/329V3uyKazS6i9rb7Wt35p+EqmfINUynvrq
X-Gm-Gg: ASbGncvnZVnjgD6zK3oF0OZpRIQ61vwCz0IppbQEUeM7am7nYduKN98FhwXu+zr0T0f
	F3lCRvy2VDUgsd5bfNhRJllUEJW8wqfxUaJ5pm9AI8Chu0ZO6Rv1s/aygej9HOcxUu9htnXgtOp
	wTptlNVLF9qohlLB1wHD0mJHEZDdsssC+gHoLnWraAKq/0wJpzOoh9TnSOl6YdvabfUfq+ANbzo
	VAh/i4dl2xy08zr8fXO0I17gyXZOhFm+TblJg2+4Dld+6MGdev3JZydiZi8la8oSpT1z+zmvdfz
	D1vsUKszipLhv0fubuJltQkk3fEkQNbdxjBAzliUJLdd3J5ZhSdh12yoHCnH/bxEsBaBK1HGHjx
	rULlgI8spjYLgKQkd38GcV8As7DOgOVGHRcm8du3NkQ7s7w6J/PIt121ZMP953Ixj70Or/EQZON
	92GA==
X-Google-Smtp-Source: AGHT+IFRhlTHb2lQE4L0miOq7NLbPvlGhLYYpHWAVoxzVxg4lJp/ceeEQ8khoVmbBOpRBlSLgtRD3g==
X-Received: by 2002:a05:6e02:1689:b0:3e3:ef79:5a8a with SMTP id e9e14a558f8ab-3e41617efe3mr89164355ab.12.1754193592938;
        Sat, 02 Aug 2025 20:59:52 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:52 -0700 (PDT)
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
Subject: [PATCH v4 55/58] drm-dyndbg: add DRM_CLASSMAP_USE to the drm_gem_shmem_helper driver
Date: Sat,  2 Aug 2025 21:58:13 -0600
Message-ID: <20250803035816.603405-56-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205953_631692_76638131 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a5dbee6974ab6..95ff79abbcffc 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -23,6 +23,7 @@
 #include <drm/drm_print.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.50.1


