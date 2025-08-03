Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08AFC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hi5FRwOWbvP0Q9Jpmq/JvqKOu63Zljwrve6PAtUtdG8=; b=3SXYEJij0tSd1yP+gO5r4MTYRm
	akatjLio9wAc9GDANuvlpl5VnoJdFR57dyw93tW00PzGghZeTdiDdUWH7d2RmGxjDSf4T61ke3LOg
	UuGnSasOSKTjg2YWLTFQAE5Au5sVyPXAUdLz/EPeKzex8qKfHXC5F9zSq8Y6gnlTnM7X+qNyySA0i
	1+2fK7PMGDPCH1PA4yRorF+YoyV16p2/FKZCpEXHpDDY/m4vIWn0PVTm5gjILgSjjvmnEyeeZCFez
	HTpFBTrbPhBia7JRJqVhOJjTPacREe/G0CAJzW9dXBoYTtkAqwd7UuCFD4OTNQMUlilxX4pYazlU/
	p/ovKsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiROt-00000008PFG-2VHB;
	Sun, 03 Aug 2025 05:36:51 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPse-000000088Yf-0ayQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:29 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3e3ff43383fso24798095ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193567; x=1754798367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi5FRwOWbvP0Q9Jpmq/JvqKOu63Zljwrve6PAtUtdG8=;
        b=TcwhkxdUsRkKEF6ZwtLoMNPB+uJtr5aSAaEUlRMntGSirvD7Y37WW7DbHaPzvZLCuQ
         7+pi6qgmS4BxBDhngJdxF5/6pAc95C+682jA61nYFxPgvNeyBqhkRgYTFmedGpxyx+U3
         gE0bw4CzXbuTbfjIaiHKjSrklpUlCz+vxa/VXehFULlZWdb2zne6runDOOTerX4BZ7JD
         i9KYauf7RkjQqbQ6Qmp+VFVDwgY/aKnlKRqCr99k8Z7BKXJ5tJLPFZi9OxLo1V1m73lR
         yQQ+i0iUJAEQRhuhxP9+ljQLhH3BcMyjWACk7uZsFcFO1eqIudkJK11L2ERqD6n1sTrO
         f7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193567; x=1754798367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi5FRwOWbvP0Q9Jpmq/JvqKOu63Zljwrve6PAtUtdG8=;
        b=O3N0pIi0KpR8uT7UYmtv/qjFd+HzII2xUiVfISygaxqU8a68tf2+x8DpI65bYYImWk
         SU5wi7xIABxmAbOBPajLpy540x8aF9ehnPWMnmJwW67eDA4trttxIOgvXPpec2OxXg1s
         Cr5E+NGP3iI3VkuEu3Kijm9fu69g7teWOFqGE1NT5RIQZot6icMpANKu0RhRurPYoZAQ
         Boy0qRjBB4iYK0mtxlgDXfWIFrIZImHgReTCxq387kHa7RzbF4VEKJDfpkA0Ltfylrid
         KTdOUt76w31dYEq25pI6Ro9hf0VhRrinScs+4WmNtBj1P0Kmh96rHn3Xcae+qGqDyKsI
         Bz4w==
X-Forwarded-Encrypted: i=1; AJvYcCW+uajh1CkffJH3SOQAUffYqAJ5cnmq4wEe+FjnIjVJvtmG2KabCASHY/wSXU5lRTuvDO5LW5YJnKnJlArb8PMG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7ClKBpHpy4q/1HNWhpBHjSim+gqq/pqszquGSx+94X+NvAYXL
	Qkc7J8bGP6Rj6LZGJqulTFEmJGRF6Z4+X8GU0WgEgdP2uUWsiYdXjABB
X-Gm-Gg: ASbGnctsVlVDdDWCNFc21ZAfnoVZtTDrU32YmAiuxGs2wQkIHkCkAIUSNZfBFi+1wZB
	QHAkFy5/0Cl/ab2K0644lEa+W298INqsuJM52DKPtGTdjNFkTEPwqD8R+e6frPZYHu9UOfcxh2k
	bCOVsxkVipKFNuZKJCjHLmPA7oCaMbLdEPhyuRY0Q34iwTKA1YWG0R8jXhlGA8KM+MIow7Z9wfT
	MG2a11NTESmlmC5sSBUc8iV89zoYie5mhX5BeLA9kVfHpfH2IU/GWqho6LJVFttjuDi1PHWaxQU
	h7KCxQXMZ7/lYGGlP8n9lWchHfocwJmc8UFhJeb2P0E1AZ4e4vHFI1qnILTYKAm1uWcRue6y8E8
	jr5rF0rlH5uQpJOv1oyctpSNwf+NkCN4ZTAgrZ+h9VciFpt+hu8HPL83wVZ6r3XF2SaowRfU8ap
	0JIw==
X-Google-Smtp-Source: AGHT+IEu1fZhS4PGdMY445gHt6SyAM90kHYvE6rk3Vh6MeLyr4clbAteyYxBE5x1gS+10mLcC/WLSw==
X-Received: by 2002:a05:6e02:967:b0:3e3:faaf:df05 with SMTP id e9e14a558f8ab-3e4161ae4a2mr76953355ab.16.1754193567464;
        Sat, 02 Aug 2025 20:59:27 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:26 -0700 (PDT)
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
Subject: [PATCH v4 36/58] drm-print: fix config-dependent unused variable
Date: Sat,  2 Aug 2025 21:57:54 -0600
Message-ID: <20250803035816.603405-37-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205928_179052_98808135 
X-CRM114-Status: GOOD (  12.84  )
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, __drm_printfn_dbg() gets an
unused variable warning/error on 'category', even though the usage
follows immediately, in drm_debug_enabled(category).

For static-key optimized dyndbg, the macro doesn't actually check the
category var, since the static-key patches in the proper state.  The
compiler evidently sees this lack of reference and complains.

So this drops the local var and refs the field directly in the
macro-call, which avoids the warning/error.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 46d53fe302047..41ad11247b487 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -212,9 +212,8 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	__drm_dev_vprintk(dev, KERN_DEBUG, p->origin, p->prefix, vaf);
-- 
2.50.1


