Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E08C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2dm3Is+hmVrCyHRXfMeY87/RIu8WM4w64xIqHyRgwI=; b=FGGnV88D8E3rtDCvfJtf9u5bos
	xvDwyuqleb2HIQAYrFxAO41OOcZd3GjpGip39IYdcWcRdU47nW4SWdRspz7aPib0NEWxoRlAiyl7J
	Z5vMkyWNWxpgI1srZN5hYiDDIkDLLfQKYsDSNBaVY85+h73MBHLPmiCESD1Y0GXC+L6v3mTf28qAI
	V2PcN4xhdX1wBhWHzI9UW6m2bda4wFFtXzHIrMZmT53yr4Ekb/qpl57WBHdGEdCWi41g5KJApnYoi
	HUyMNRRRIyzHEwhUmEjcnQbP8MUi40Z3ny12Hlarx5jpnKDQe3zvp3ICkqTVfZ+haaR9kvDK+3Zim
	XaZbcUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRoJ-00000008QPz-33mD;
	Sun, 03 Aug 2025 06:03:07 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsr-000000088jH-2Mxz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:44 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e40d006105so14220485ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193581; x=1754798381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2dm3Is+hmVrCyHRXfMeY87/RIu8WM4w64xIqHyRgwI=;
        b=kGTRaDXPtkMlf+3oZPSlotzCf3ozhvwCse5YgxubPvSw38iqMoRS3ScTyNoKVNlDb/
         ZRSCLvfhlzv1rS4l3WTQXmXj6bEltdyh82PoAuIXCkvutFrlJhqSnFhlZC6J56EOHXcW
         SqCvoJg/HfrMlmkPgSNZ3CnqzNmf+mBCySD5aquuD1wVTtwnPFaJS9VNFklMT9SNaUCo
         +24CYEb2uIv1d9gdBW7MDmAPa7WkQ4CjdpeeBSdcwP+BaP+fx2Cju8ikINlsF2OwLmNS
         rL15NYPNUe71HqZ7oTkUYwh9k4D5zIvqIjY5je2RFZny/78wHr+Dd1h6/sNhKQcbeaAE
         BdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193581; x=1754798381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2dm3Is+hmVrCyHRXfMeY87/RIu8WM4w64xIqHyRgwI=;
        b=BURMuYPGV7/zFLbGGjDEOJhRdSclthtvdDigrmgCyqnvOWbxdxTx/r8q/cC0Fb5EhW
         vtW4o6Opzd6NuO1MgPUrLasoTmL2Jwh4Fx+a1HVG9srE9hWW2PB7qw26+utxA6CWf2IH
         XOtaS2czq5i+XKRTjSEW0XHHy53tcqu5c1hoE7nBefkeirLmSowAO3vls50hsSeHR4GO
         Yw4LDA5qrBYKlAQumKktKCxmFgMAYxA+L6lqTG8hHtipM73a5Tqa8zwSvRpeOe2ilWTu
         N2ZYJj6w7Z9nroofLiwkxflXB4TPziJJOFGrt+IYPZ3vWWmgdweOZsiaAmYEls9E/GnB
         E8tg==
X-Forwarded-Encrypted: i=1; AJvYcCXFElxPxee6HCA8KhNahzekZb53UWMdWCB8j1xQ9MtUl2QQwwb5wrPwF0IiSAB+oYRQIr2No4mxyUn4qGxlglrQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxUPn15u5ljROunoQKBrWUxkK/gLZi2PQCacwqQ9SfRPoBf9lNs
	u9sTYR2v4LjQ5hOk0t3jVkuCBpocyIa+TbfTrWlkBDVarB/K0tJV7fanpTpgznpeZZc=
X-Gm-Gg: ASbGncvSasRvvsyEULiP4YuOgIMJIZ7cqSMcV3tJFp61WvnBGNv4nOeLGvS2blX9HcU
	CjdYoGRbfqYThzYuPLwcdnpkf5euHyBwW1Jn7+fSwbI1/qQ88c1z4NncjJKXsKEzTR6ZXNy4loL
	eDy7BiywWI+gUtL/BISSc0Kzw2amHbat6C727L7qv32KzwSMvugT63QtBlw24q30+OIutcf2lwP
	ZkMwk3j+3ra2jbzlEOkqLzRDL47TzjsNamErzA9cO+Sw2MrOP5i4BS8FtLVYUFONw0/cv9BsxJf
	59wIapGdZTf6hCkLN70nn2K2u0rgawbNS7F9UKYnJwKlYFEfy658iFLDV/KMwVvpekcARmu1Iru
	NisLw3rwfU31AugCpxX3Jnf5DWvMRZcLcF3AZjgg3n7v60378zTaGQmWbSZf5KlO2OQaAi6kofn
	gdqg==
X-Google-Smtp-Source: AGHT+IHicophLwIo0f3Ezs0eOmSQt7ySKYvJ63NCgmDZPmmfZpDGy7DzzpgME8ux0Ifq1iE3S3f0yQ==
X-Received: by 2002:a05:6e02:17cd:b0:3e3:d197:b567 with SMTP id e9e14a558f8ab-3e416117005mr96473805ab.9.1754193580921;
        Sat, 02 Aug 2025 20:59:40 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:40 -0700 (PDT)
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
Subject: [PATCH v4 46/58] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Sat,  2 Aug 2025 21:58:04 -0600
Message-ID: <20250803035816.603405-47-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205942_041757_E874DABB 
X-CRM114-Status: GOOD (  10.08  )
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3e91747ed3393..70759b7d338f9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -25,6 +25,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.50.1


