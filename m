Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2FCC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUd0OZUdA8b96Ytm4NIRmXIDrelAvQRst6I1taJ2Nl0=; b=QVmAnUQFSeBo8DufqDjqJoL8y9
	NDRAIM2HChMFAFpRsgzZLMW25i0MjWfe2efM0eeVtwVgi8heZa776tFhIzYEMu5NJXIteHk7NiZpb
	ddGVYmEYeHPcbNg+2D40y8Yo4szFEpEcUITbjquBVEsg+eiyJYzfn4wnpItGevAzINzST4C8FeLEj
	CUAnBHPEgLfjI5K3rS8hk1JWbBHPhYgqhEnkkIH1WicS1TY95CmLTZ/rNSByf4RMK5CE/nD2kRyX3
	cXJ/DLYI10/bCGsCGlYvR+V6Z0J5bbtjo71o4Re8adA3hxABpDE79Wy+W5HTr0avw4txwOm4w1RTm
	/wHV9/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiS8f-00000008RfX-1DiA;
	Sun, 03 Aug 2025 06:24:09 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPt2-000000088tV-1rkg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:53 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e3d94aa969so14698035ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193592; x=1754798392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUd0OZUdA8b96Ytm4NIRmXIDrelAvQRst6I1taJ2Nl0=;
        b=ZDM9xoYOQrLfwaBioVNLLtB5BacNQP0lvgJhH1KPM1EuxXthCB0WreysgfPZv9/yKW
         TqVuNLY/fLvoqr4JjdM7fKNsMUO4XeMIO9y4Pex9A1hmut9JdW7x+XgbhVCYEGAlqghK
         z9833P/lQd+yfnBSE8P5TypKowXf8RivN77kCJ/ARwB1YiasbEZGnOJUZ9MlM6XNgrnG
         /EFXY1OiUCnkkRsblBXYdA18FvFFWHJ57bgJA4fnaHKzJ+yfrTYIaH4Qx2rx8+YDfPwd
         fC+oxR6gsPW1NOB8dbO6GLMri/GF1aHa6MupcNUm5MOECWR8yOSAu1ERugiU552loNno
         Ln/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193592; x=1754798392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUd0OZUdA8b96Ytm4NIRmXIDrelAvQRst6I1taJ2Nl0=;
        b=M5cVHY/cTwXXqdjWLcBqNX3kyZ7/o5qcXbHPPjekhfoxQbe8rGeYvNAJHyhqA5E3Ow
         +4RLWWECqtkLRRHxPr2YrVcNx2xFOmXmcmiJ+174XNwRFBdju4/GtPIM+aBgqYvwwRxw
         UOq1lur3Y3ZYqcuSnj20gp1nJdFKlnzejqEQYflcu/0T/LNUowg9vv+7d65k0x+HM3Zu
         Z/dRR054g+Fa2Q7yjlfpIJvaItuBXJesh50MLZLWmaajxMpmlo8rBfwubMMfrnGq2rsn
         QCeLQV8K2mGyTo8ZiSANKBZYB7WNL6FLUA1pCyhhznRTWfefUa6QpngakQp8GUCZksWU
         1rEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgNYfYqIpWrrmiZ4Rl7Ax6jBnS1beidyTDoC0wJpMc0sfcIszD39gH56zWuM5zxWSfeNMkeitlQ6rr4nFY6H76@lists.infradead.org
X-Gm-Message-State: AOJu0YxDu3V+I17K4JNKq16dPvopByyt9KaAVpDVrxvwYj6RYRfZZP5y
	xwbtXOqwtq4Z/alLC5Hep+4mn+5hZ27dpqxoPHTg5k0L42LfEXdVO0Ku
X-Gm-Gg: ASbGnct+y3xF7NpEunjCbA+HzM+s2DTOvOzfwo1XEYBKOIhyvfCHpNtYCnomkvllgyW
	vSzQSYMxk5cHaaOY6VyTjNPur9Pzp6jGSfbH3oBydvGLlhVYS8o3Kj1sw1AZqKXpx0jJ8ry/Mi8
	OCdAqFz9y1IL7OBjQnaDX+nE5jCpY5xQLpgdTSS4SAlio9V4fd3tXoS+Y9vqawOIeyU/ymv/xtI
	g228pueqOsRIKZG/gII7Y56k3LgTKBXj/8essElnFlyF36MhXV/ckH5m5p13e59DZPeZ0ba6be+
	nfyqiwrEig6AzVMUe+Hms90FMMw7JLkrVZQY8zUhNDHHUnFTmzM7CX9fUmZq/1oBC8gKuA5Mgnd
	oPFGlk1RHqb6KsenACjjrDezbJkBCBNHPkc8FlVjIV1AJFNs5hTcG13wz/j8DLAqx5C0VwnogGQ
	kY5w==
X-Google-Smtp-Source: AGHT+IEyhw5mUB/eNoeEely1BTFanJ4yHz9P0sfCu6Pe+TFRcVR4LSDg6aFmHhG3P/FtSBF/ZASr8Q==
X-Received: by 2002:a05:6e02:1fe8:b0:3e4:b9a:8ae7 with SMTP id e9e14a558f8ab-3e4161081afmr88579355ab.7.1754193591790;
        Sat, 02 Aug 2025 20:59:51 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:51 -0700 (PDT)
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
Subject: [PATCH v4 54/58] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Sat,  2 Aug 2025 21:58:12 -0600
Message-ID: <20250803035816.603405-55-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205952_488151_2AF6D558 
X-CRM114-Status: GOOD (  10.55  )
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

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 417061ae59eb4..c18577a3153d6 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -66,6 +66,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.50.1


