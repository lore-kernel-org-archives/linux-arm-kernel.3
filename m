Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192FEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2JGFRfrIhHONHk9F3zUV83hFGKQa8jTEAD0j3plUI0=; b=hZFVT0QH++6LG4/aiecFXyp0D7
	1WdhuzP0KQV2GHkCOHrbLmN+puGhuEQZVycW51mi2wRhqS3a6SdCXxkewS8hg/4DDjfJ01RrHP3Gs
	6riFraQ7YYg1u2z7F1Kheyu9DpzsD0hFan7+SZ6dc42xl7RTPYPMYbjbBKjwSeSrKPaITcze2whPe
	oWAz0SvSwXP0ZLN4AJ29PI+2vhfKz6nIrzZlzjKtJh7xNe+aRm8Ay6lJ4R0w2mjceY1xz5uCLm7yl
	ct8TfZmNI4DXyM7/Euolo942M5eRrpQX/dT1+4LL+CqCKES6uJ+yFh/3unImkyrTniv/7am5I9lec
	nhqqo9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRyV-00000008R7H-3rO4;
	Sun, 03 Aug 2025 06:13:39 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsx-000000088oS-1aE7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:48 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3e3d0cba6a7so12047325ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193587; x=1754798387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2JGFRfrIhHONHk9F3zUV83hFGKQa8jTEAD0j3plUI0=;
        b=mmja55f2XMc63OUSx2r4mj/6+fnTJZ8A2/bRwIkDbn1z9JJELU70F39oIEFZHo78X0
         eLASN4gjG3ad+ZYHZxjw6DWhaHW29EnnjHfiJTy02NSJVmJXbA7/KngajNJVkz7a48U4
         1941GwFR2vcA7+HnLYcmSTQ4ntD2urI6Vm9iyw6oJFhl7eBE90LLdtETMsVWM+/9LH81
         MuwnaJpk3PyD2fQbP/Js2aJwHDEkUn8Bo5rwZJV3FZRZkrRLnJprQfwKGU+gcqM2DJ5M
         sGkIiocLibqS+VXfx3uCM5OUDoqdMCBRUUmSi+BZg7nKqPWVFehM4kf4p6A15U9Co11S
         JuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193587; x=1754798387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2JGFRfrIhHONHk9F3zUV83hFGKQa8jTEAD0j3plUI0=;
        b=s0tG4nWzZ4qCs6YYHDlQoqRRAvk8tASveim1tbawjdjm5FUTmyfwtECs2BFnuPSNh1
         59/oyHht9fivTdEe6Re1xx4BJml7dCEy7lQp6wP9XmIYPRIZ6beVU2MP+Ckb/azcIlZe
         ItPUWLFQBwJhvyDJmMbGSaXt0kh143AO5of8Ify/A8p2AwYxWYpvLd+nxY9FiiD59kDO
         qSOFEUE0ZSaxF5W9M69VzCPiGtnKJV2sUW/csEhMYFW9L0CSeeq3bXqvGsjUu8uHFrgf
         88HVXGPYNDyM0sCCjNAVWQaEkwkFZPS7b7j6R+wncFecGSrwpA3MxlLUZmrIkPbjp6qx
         shcg==
X-Forwarded-Encrypted: i=1; AJvYcCW6NoOYjzcab3ICmFdfkGrRwR+xi3d8alllM07dC8nFuQT819IREXFOj3ganrV6xHyZEcXmsg+xRHWK+FrAnrpZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxM1VqoSjFaNySm14F8fB+gqWgEN1EOojMFNzM8bbAhsL6OF+P2
	2UCwoV0i/mM1TfbFKJ4dTPkP8+YDnb+jCT5U9qv/NnWzU1kjdZcmREck
X-Gm-Gg: ASbGncvXGZqqZGsT2gKy8sCCobwU/ZwxxSBXbcHca6mErOxXJnBltT3MTbOlxknqQ2W
	UWZVgNsw2ss/eiuCs8I5Ljat5rWnB5tyelHM01h+yADex91mWPIx/6UlxcdXhQTsZau8IoU6fNC
	5NZ2N5V5CIGzXRXIzAWsshmw4+T4G33dKd0P7HJ0XNDcI0eeXV/YilQRYODEM8IIXM5zgRVYNZ8
	wuMp0oQ2eAwGBtsbK2NF4eW9qoXwe6xTQsMeQWLgwcxEsjaIDzV2S1tbLDPFuoW6h3gy9Fc/Euf
	J11eTccDg41SwJ4D7hXGncaiYgdnOwQVK/SRKJhpceN8f2o0VLy/LaySKLZ57yLbA/vjDOTTasi
	UcZNhloOZz1GKJZH6piirOZt2hr0yS6Ztx1M4qLYgkzGYQ7FyNJlKxVhHC3QfFe+elGaIMjY6CM
	uDsEJVr5XEK9A6
X-Google-Smtp-Source: AGHT+IHqVFvq1DXgRalOAEJ4e6OJ3Wn8/7Lu6yNitZbnZoklyriFDbu+1seaMWuZezPTVSx6Id5Rjg==
X-Received: by 2002:a05:6e02:3042:b0:3e3:ccdb:6ccc with SMTP id e9e14a558f8ab-3e4160fb7femr85375625ab.3.1754193586726;
        Sat, 02 Aug 2025 20:59:46 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:46 -0700 (PDT)
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
Subject: [PATCH v4 50/58] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Sat,  2 Aug 2025 21:58:08 -0600
Message-ID: <20250803035816.603405-51-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205947_443700_CCA3FF65 
X-CRM114-Status: GOOD (  10.19  )
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a24d1655f7b8e..29e47700688a9 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -37,6 +37,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.50.1


