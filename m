Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59162C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFh2RZochPrtpmKEJNCfPiOKK4EQdlmU3N2ti5dUWmM=; b=cZEWnTrOUMQQuuVeyIjKaXvfe4
	q6U//lPxZUTQrxc9mqcbG954I033rbxe1zJ4vti7ACgRph9RW8yJ6/Zzg5LGDM1SV8N84ZRE63nuc
	dVOCuLkL+WuUSI9xpi2I5TtRkjmCsyw8nRqgrllrpudgRg3ivm0VH8ygDTHj6E3T4w/bSZTxfNixE
	sykcKECVVTdTV/Tv125DI4JIgVkDO2UrMN+qJDtxrCLwdpAgLY+khevpf0zh63Kxj9C/Nb/xEA+HK
	ZcR+bcyOgLPEW3QZwNWG7OPA789aAlT8Rr/wVLHA+8vq/eIXYjomdI/HqdSfqd4ZeOdSn8EXwRk4l
	p6c3TmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRgh-00000008Q3L-1Iup;
	Sun, 03 Aug 2025 05:55:15 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsn-000000088fp-2WDx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:38 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e3ee9c7815so14653685ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193577; x=1754798377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFh2RZochPrtpmKEJNCfPiOKK4EQdlmU3N2ti5dUWmM=;
        b=NJe01I/cH/yK9z7YItS7W0S+7FvTePfwTnYg0kRML8kV9q70hPV5hF5CLa3xTQbTMm
         T66KtB8DGjid6T8jQwQlrky7OOOgtdPsmst4e39kexB3fZMUkhl3gkL5Eh3xybI5UPN0
         EaT5c/5awSGiH5z6Gba/BHy6f7hvXt9eRUGtIo/+HnZ2Y05gJ9soTaDFIavbg7/YncTB
         2iGSVFCBo2zUD6DYhwe+YFU+fhuwJd0AgNOEuuhPh83y/mZVnHN8+ntclibR0WNJJn2d
         JYh35bVRygylrxC7ZglqkvIxpY6Y5UwqNaxJ9EHv/pUw3Xst0ZjTo8SOgInrHZ3EknvS
         rV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193577; x=1754798377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFh2RZochPrtpmKEJNCfPiOKK4EQdlmU3N2ti5dUWmM=;
        b=F5042fX7y42wskF63A7LvOssb04Qg5EiAfeyKw8dAFhf3VMMi+1RAZ2uQhqmIMBhti
         da3JiTQERhLdnj3BqP5LH2gjnpX/BJQLLQqCbbrGj/qmdySKnnTYrVGGwf5koFnfdxGM
         rbhTOfmyeBtbBscsariq1uOeimQQkVgca/NHgs1gab8+5JC3TavXCQgUu3bKApY3f260
         E/lPJk1m1DuTg0P6rN9kMLbdjczHl16c0OYzP2CUhhwiIjhSGBwbwBfepG5Sruh3pNL3
         tMSRa4IdUgV2T2P3XqT6zapYw7UoUskdhdSYX2X3pFgoa3WcNlZNaw0pGJwzsJ9C+EvN
         bplA==
X-Forwarded-Encrypted: i=1; AJvYcCUnT1sobYrgJtkOBekqqqgD66FfGJrXtFkWd08btbLkorhRAJ7k24oYnj1c1h7/BXR6NrrV31VT6Zm3pf5HftJL@lists.infradead.org
X-Gm-Message-State: AOJu0YwQVozRQsyUvYbwlI7a2LC5LFSmnGQPzaNqknPCP3HHhYnhWZgy
	GlE2CQYfogvI5pwnkEAOq9fYDX7qCsHJ5y6qW2qK1kl8Bbsf7vI9nAfd
X-Gm-Gg: ASbGnctJEshqu8uwJmnY684GbsQWNrthRekGdH4o8vSsxkpStLv0HNwKbvPr/OxkxB5
	L5+NPo05/lb8AdDl9BsNRcjIefZd0dSN8rKEVG6hUIKkAo8snXz8JREndxnL5RBxlM3lDwGw4kq
	4Bnib8EQuhONp4iBcPkE3r2CHTTB/GAeeFaGnZby9qlDuQg0FtuYitykC92aEcKo1uSo3lD33H4
	xZi0nHO/TWoleSO4HWHu7rxHJmTzslz/4/L0qcsCEQnj2Ge2Vp7ltMi97gZCcqt4pLFCf0QEfCO
	SycVfzm4KA/t8PxWvES5HKU06XeKOuoUerZdf0LormFX4SuUDg3i2jAzZ7ijJmREhM/B7jR7CDi
	uqvyjGBrxubWnJEgUYtMTSVyVVLY5PFScXv1ZWvSxKDDrQxGKwX3Zw029Y4S8ArDzn7pe4iAKxr
	aWng==
X-Google-Smtp-Source: AGHT+IHpBDdR6FigTlQRJF71kEZPG5C4dRibFN0rdBgPoSfyb0NYf4gIgt2t1ZdaE/8lcZCX/fEPYQ==
X-Received: by 2002:a05:6e02:32c4:b0:3df:3ad6:bfb2 with SMTP id e9e14a558f8ab-3e416180bbbmr90758155ab.17.1754193576851;
        Sat, 02 Aug 2025 20:59:36 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:36 -0700 (PDT)
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
Subject: [PATCH v4 43/58] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Sat,  2 Aug 2025 21:58:01 -0600
Message-ID: <20250803035816.603405-44-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205937_645350_C315A435 
X-CRM114-Status: GOOD (  10.04  )
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

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index e32e680c71979..4487b5a41cbda 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -48,6 +48,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.50.1


