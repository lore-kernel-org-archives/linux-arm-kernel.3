Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE968C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YD1c9lgMbY1eaVT6v6ivEZXAlodIcOc1Rh1pqLxYHFs=; b=juZR5Gy3Q3+5OxqEFlGLPo3i88
	zf2bK46uczzFYrGX5UtUjA9+uv04XIM129RwT+zxHqubrSGcinCbpQb2iLULqmU9iave4hISV+4T5
	tDvEimqVWQlz2g+W9eTxD5S0LT87DEX/VYyO8ZItPimHMoC90MRWnbUP+YKRbNruz16bNtLRYVvGf
	bwQfIzYw0K9gd1nLJlhfFAlyv0oGeE6qvIo0Fta96potB501nmHlol0aYyjCVSJJRHEj5xEcMaL87
	dir2QWOI/mZWrHBqI6gPqnHLodQtW5BpuhaxEkU4/YnjUoBV7Eo8q+Yu7vZJgUH7Yi1XWVA6bPkFZ
	sGvRJ+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRjG-00000008QAB-0XBt;
	Sun, 03 Aug 2025 05:57:54 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPso-000000088gx-34ks
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:39 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e3f6ae4d08so14005195ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193578; x=1754798378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD1c9lgMbY1eaVT6v6ivEZXAlodIcOc1Rh1pqLxYHFs=;
        b=EUkzBzLelBLTQjuj5s9rJ0vt7A6dmV3f65Wy/STZq1esaJuj2UqLbnF30QQREpojg7
         BzRmL9b2zXe0axKZ3qlyRA3sIi6a1W+xfxTwuvmPaXodgxvKqTd7/B2zj3T2rGag2r4O
         J2YqRbss3VyZDYGq1mRADbBWkm06Xy/yGa4zH+Py36jMSsQEpOaGyhFyaXOu3Uy7s6v/
         i2/WOQitaor8J3FmSnjpWY3B/k2eQvb31p/wBXaxdCY4UsAsJc86ygYstfJ9yI/a+sxH
         jD7Cwwmz/SIHrbH9oHcgckBjwh9qPcHFZUZqy5GbBkzLlk0DcH0ozF25qk4PAWQbVyT8
         9QKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193578; x=1754798378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YD1c9lgMbY1eaVT6v6ivEZXAlodIcOc1Rh1pqLxYHFs=;
        b=lycsc9xiZ0yYY7OOM5vhLHccOiihtSHcoiIV4K4rAFLYj3ZbJAN1rTiM9FCecr9AhC
         dW6TlgYtrxFjAvRAPLwq4LNKpoky/rQXG6BxYV303hz0J8KqgOzsM+O+ZgR+thb/dvCL
         xpzC5XSpdoeCLFlf9FYSiIbnkcA07x2ZxUqXpVmiDqiieGzCToFEG00xcusIut7gZ5xk
         rgrlGYFs3okxod194En1TJjWpBfdYVm+Z/Qu+jMWjoKnCuVL1dwLw4suQMgUKbyfyfru
         KtVUT0bLjMjNjkqAmKbARZm9sgB0pyNwCQAcr1MULgMyy5krIfHxKWHRq5VqTW6xWQJF
         veDA==
X-Forwarded-Encrypted: i=1; AJvYcCV9ESYNer4rK8IsC9SbOc/y6z7DFmPkTv8F09XqNnakuYk/yxjXGGlVMiVjxqZI9+EppBbnb1kJPOTDCOV9gX9Z@lists.infradead.org
X-Gm-Message-State: AOJu0YytXs15CuAgPVb49L/K+AYH7XKGy7aTChMke8f9G5ZhUzyPYwCW
	Nfy6sqeNC6k47pCTZS7ontt3zOwSHVgqgIl+TwETfbPV6q/Kjt+KV/Ba
X-Gm-Gg: ASbGnctYEPd9GkhiPxg9DLvpovcUjj3FlMm6YyBSCF5X+BFwOcq8yhjURYyQL6toNok
	QYy1CAGhVshfyyTcEqBnxXCsfaORz9tnBR616NwLoYE4Y0R9j2Yza7FSfXRhTvtZ4mxgDJ7FXXI
	rjRwLFr0xUR819OaEaSAFNs/umXDZBTIu6MVNjMV7ILFfm5A8ULHUhzbMnxmIAy325sJbs5qbhl
	WxIVRF7QQ2elKF4SpYc1nYYRN+DP7GP1dEbhSNgyU+wns0f6hIqeelBMqKvoPtzcPDMBVDbZ5p4
	KYt+KYtMjRSnj/y9NCNVf57Tb1Y++r5OMTrWdi6L4y78uucHyMUVrIwUnz6EK9hGtiBgl/QuVWb
	0UHGQzApfwLNfIoly1qffnCwNCiPCoeAEPoaj+n8vV6OmBdg68Tnn2mzryYDC55L2ZhbO9zrgkm
	gZwSydNepyaDID
X-Google-Smtp-Source: AGHT+IEjmtrpy7aLLw6jvxFkKmow/fhVsLi167CpcWmTeMCa0QQeXgukw0jkAUEoPTovODFGo/PAgg==
X-Received: by 2002:a05:6e02:4403:20b0:3e4:64e:4fce with SMTP id e9e14a558f8ab-3e4064e55d9mr146712775ab.8.1754193578031;
        Sat, 02 Aug 2025 20:59:38 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:37 -0700 (PDT)
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
Subject: [PATCH v4 44/58] drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
Date: Sat,  2 Aug 2025 21:58:02 -0600
Message-ID: <20250803035816.603405-45-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205938_785042_C7135B96 
X-CRM114-Status: GOOD (  10.84  )
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

tiny/simpledrm has 3 DRM_UT_DRIVER debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330def..3562d6dacdc9c 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -34,6 +34,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * Helpers for simplefb
  */
-- 
2.50.1


