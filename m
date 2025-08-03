Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76C9C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UXktWfyU/nC8G5w+/5cLAwZreh7IMfsApWH9fi/o5I=; b=H8HBuHlhLuZVKcnjoGaQK4kRZ0
	fj5Zd2UkDrzav32yIvUDigvLK2Vsv+6Bw6Tw6AucGWymqajToUNax5REmtiDFGoa+79HIWtc+j+FL
	oIcwDnB/lCO4ZfJ1Dp/0CcZjIFaxy63xYxAVmQoyJdbwb//KsU6vIIzvffgSnBQJf8Io1LiTwDuYd
	a4U/7zgW/tmLkcnWtiSeZGkY5/WklqxWV+FxK6uDpnQ5JlabkpxtluZRFEz8Kd7ho0BMqvCwNMc+8
	EQ/FrSj398tiT6qv7QO8BYyxrzWi2umZrmAM+7BQeCVf7pkBDDjiOiG/MaCk6k+wKdFk6TwrnUo4o
	5S5tLQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiS3b-00000008RPQ-2uFV;
	Sun, 03 Aug 2025 06:18:55 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsz-000000088rE-3Sf9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:50 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e3f0287842so27597495ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193589; x=1754798389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UXktWfyU/nC8G5w+/5cLAwZreh7IMfsApWH9fi/o5I=;
        b=fGN1M6SMnmko+3BEt9SziTGoTwCmnAPpDvj0AKA4FujgLr2SqoxaeZclBe/8BNYAqu
         Hm7TXXXAYhkX+TT2gifNC8iGNbKDKVZXvfX2c/hzYawmvZl47jQyOF4fGZ+y12YE72Ui
         F4nf0x0MVjw/4oew4BZRUiQX/LxUrEFm7FcuQur7Ik5bmzzNlQBivmM+lJt5O3xT6nCj
         zGeWxu6z1O05TIAF95Irisr7zNonqkqB9QvtEuBjMcBa3Tl7ZBxeZ1Tlj9NAswvS9Y6n
         OtEfFZNsIXiMq27dvR84CZJOdHFKFtBA++GAAdIXtO+a5B7FXAgL52AXb44IQoVr+zaF
         lU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193589; x=1754798389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UXktWfyU/nC8G5w+/5cLAwZreh7IMfsApWH9fi/o5I=;
        b=rH7tj1pP4iGwIYa4w6m6PzF+Ef78LoGivncv4C1gX9BCnI9+Dfl330eCvqvMt+xM/E
         3C5+g71dZzFQXG2bUwn76PW7G8tJToZekYmEPRnvVQ8rDkoOiFFjZAtToo5qXvs0CzgL
         XfzoEw/GJHkAFU/APOA8nw9kqbQnbcZ+xpq2JnzwQGBD6IqQdFyDCzT88aC63xbZZPyY
         TWJyy7V2MuHSFp5wByRBkt6bRRVovie0lepWmw4adDl7gGRzlrB+JdljaQB/jMmF+duH
         dBahUXcoI67unWMPItJE6KeWokcMZo0LLwdhwfvubr7tLDS+X7L8VYDt0nDcgKC8LzZt
         vV8A==
X-Forwarded-Encrypted: i=1; AJvYcCVUmum4/NI2Fn1c9MIR0zjp6JwHIkYbuItjMKqfId1rE3vS/u5Zf1hL+nA3iPKlWnURTtm2jqKnOKdPl4JLxTRI@lists.infradead.org
X-Gm-Message-State: AOJu0YwVhOxscZXWD9XPnRdmIPitII4O+uVXdXdVwA/WjWh1shLlm4yR
	VpQbkHS59HYk+/GP27nofW5vfOxaDkk+yq7drUDKtGrvDdl3HWgqE+Iu
X-Gm-Gg: ASbGncud+bUY4BeDW2QGeohKXGS/2FzvO7GO0LugBpshu8ZX1Ed+EoN0X46d2C1akVh
	pjauuwD44NxhdJ5PGuLJ+fpN051jvFJOzLDVrsb4wJoXQgTqy1FkRGnD1W+MMvPchMkfEYZ+8KN
	V3+JdfZjPZdnbFkwoVk5RadwO13zvCjIR1wyUv/g3pcDeATCzZntEMESMwqFBcOSnRwOl/WRvLC
	DUf28Jpd5pg1LjLeIdAHr0e43Kl3VhnZyn/pVVEISMre39Xt1divQvVO0SjR3IkvpPFseyZz+el
	WJx2dWOq3mykfinttSsDLD08hlXYOwLVSGVPB22E3Nhn5ZCqTJWMd4xOvVdahym/wlRFm1VEwey
	YDSPiTZ2WVZO8D/kBGy7LYHmtT9ZpYfOHdjNVJscL/gaKDzzFKQ1wwbraEFQ+kERn72dWazpLCF
	+R+g==
X-Google-Smtp-Source: AGHT+IHgubDEoBo5SwwKlV7BEp7xGRXkCfl1MA6t15Y/tj05GEqe4gbfRTAzanGZnInCRSiMQrumQQ==
X-Received: by 2002:a05:6e02:2164:b0:3e3:d1ef:83f9 with SMTP id e9e14a558f8ab-3e416116d3fmr99926145ab.6.1754193589138;
        Sat, 02 Aug 2025 20:59:49 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:48 -0700 (PDT)
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
Subject: [PATCH v4 52/58] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Sat,  2 Aug 2025 21:58:10 -0600
Message-ID: <20250803035816.603405-53-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205949_870378_98484051 
X-CRM114-Status: GOOD (  11.04  )
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 32cd8ac018c08..f0b5b57646727 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -27,6 +27,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.50.1


