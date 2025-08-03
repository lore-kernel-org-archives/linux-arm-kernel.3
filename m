Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1366C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zl5QPlbYy//3A+9v3q0806p6kCi+/AVd1aBX/P0nslw=; b=qIKjTRpSTPdiUjuZ/hjH3IlamC
	QJ2QnJo4c8gMR9TIxuxDUx6X2xsjxAPTUdRTrZEGq/ejq3VPE0Zed2YMmlz01A58gqpkRcr84azsO
	Qj9I/MgwWLc8dXsjwqvmczAZssnA9GErrB0xtLH8xPDHRAnfOdUZ/pFYhO7pv+VLH3EUR+xCxvFdg
	8oQMzW2+79Tore75Dxp6eh58yMGtQBeLxu5PYwBSvYyc3EqPZDwOjebGD4J5xxWT9a3M/wjKE26Gr
	5cPpJPjtYjnuTnRZz5Rqy3Gfpnp2XOFQ3VaQSq8oXf7em3JPcNtnXKmnkMrweevIfR7eg35x/zejc
	LCjB2Wiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRe9-00000008Pvt-2H3s;
	Sun, 03 Aug 2025 05:52:37 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsm-000000088et-1FuH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:37 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3e3f152700fso12488665ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193575; x=1754798375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl5QPlbYy//3A+9v3q0806p6kCi+/AVd1aBX/P0nslw=;
        b=UhpP4wHJAZ2Tm1yxBQkVeRVf2gkXPLlirzljhCexqV/V8mPai2CPq0shfB8e32oSQt
         02r9aid4VYRBVarq8DfCll1uQLrylb6oUG1gKPuePwSopIU6hIB882e8Ha4ceb0OP5G9
         L1rCumf6d0HYN8HbLB+dV5FTP9kEYJCGsfIkKpXLpTO7mF6Vf/z5yHBF3PDaLMhyHJgG
         m58KFPbjq2kJD1x26WG6voHpg5TbEHN5loR3DjSoIymLjzYsZEv+ZYJDsYAG6yve8FK8
         671QDajMeVdeRLxL+zMWsVBtPTYzvjTenPLJNvw9INgQWXK2ZUsvA7UiNK79ntBkaqpf
         FTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193575; x=1754798375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zl5QPlbYy//3A+9v3q0806p6kCi+/AVd1aBX/P0nslw=;
        b=U6SPA5q60QMa27cuwu6tc/jh0AAiyoOfQIuAyHS6RZLhULwZbbhXMgl3+gTNSf2yZA
         K4R4Q0YKe1KWJJsyuFnLL6+5er9gKIspG6jhy/2h8t5lhHVxmvai/H0uPiGTwIRWxulk
         z5oBgugAZwx28/SvVmF5PwRMrXrBHgEcdhZFx6EDdm8By/RGT5ODcjrosWxP9WguQQ8d
         zhGN1AnoEu8Sz41zwFUKHF4T86yUOkKLrYUfmX1/cmHwDoso3Ariqus+a8Zkei2/6A+e
         Zhf5nx/GPEfxqhCOQ3IhWLSbf9QV8JQU7G1jtCIfSZhA25BEoDcZVbrX2NkZSD5Dg0mH
         2Kcg==
X-Forwarded-Encrypted: i=1; AJvYcCXx6f0EL4s2860X1GRHDOYmQfdguznUABPw+8cAMV6MA6e/QNi8/nL3OP9Om2RlMCqfIYNafvBctwRnU4gQrbeS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4sdUphjlqsa2RcZF2NWaqpdZyv/9SKyPp+uilJgg4c7AUTzYl
	Szr7EMJF5TArnvyBbOiGBM3GDqItAX5v5/w7uoR1s6bnVJHR+Bred+Ha
X-Gm-Gg: ASbGnctqua4mfUzsz79tCTbE1cYQbqXe8ABQKq7RNBWlYWk89sU9uMeSrHVMeEGU034
	q4EoDwfAf7XPL3Q7y6Bg8U+xefUkMa8CL12cgv3aml0yPkX/uD1lg6qQMO3VUOAkhN7X+g+tTXz
	uQo3OTgT/AlPbGI2FRmKZIW/YAKRJFI3i1/mpIXOKmMmpsJ/omf+tQ7+CJRNblpUZBtKIxpxhKB
	ezbzkemtBu20oSOYuWkmvLLSxcYaM3XiqDWbE28+hBOoow3L5iMVXmHI4CSTK9H+S6DPvnCMx8H
	h0Qfp7+L2/14g9+Ez0nTHSOtx35Dj5l+D+ezxgZzQRZn4Ku2nmaSJm2PBrXvkBJkz+E2VVPCtJD
	iXGqa29eB8MzzeZzGuUjQqtvQT3Jj4448d3KJYZGzUYnTYn07TOLWeQzZWEFnlT7ymWs6tO1XTb
	AOjg==
X-Google-Smtp-Source: AGHT+IESuEDr8QZLisykL64g4ba83tdiLk29yQO3uqavO7uuyBzNgS6eJTj2v9K17Lorh8odwbLS3g==
X-Received: by 2002:a92:cb86:0:b0:3e2:9f1e:e291 with SMTP id e9e14a558f8ab-3e4161cec37mr78734765ab.21.1754193575462;
        Sat, 02 Aug 2025 20:59:35 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:35 -0700 (PDT)
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
Subject: [PATCH v4 42/58] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Sat,  2 Aug 2025 21:58:00 -0600
Message-ID: <20250803035816.603405-43-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205936_340829_230E7155 
X-CRM114-Status: UNSURE (   9.58  )
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

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe has
drm.debug callsites.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 31f688e953d7b..52ccc4701e067 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -21,6 +21,8 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * DOC: DRM Client usage stats
  *
-- 
2.50.1


