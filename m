Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E73EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9PcjPUjmFrLewSvRSEJPDWXh0n51inHqjt5GPCorNY=; b=xGffOoVDiN3YY4HTT8m4TF+zpA
	Z3WU+cYXIgL1i/6bR+ihD7x3WzQKOnd63l9b1afupqU4R5xkSqJ0qbuBlU/IeSqbq5wfq1vkTzAyX
	t1zHR99iHYlKSzJPvgZc7lA/iWLfcJVo8Is3YAi13ANaDuU/Blih/70NkT6ywVq1I9Sb1lQVK1QXQ
	5yufNfB4D7Z6JmJP9h25F2ZEYNqEAJ2CX1SgUiBHb32XdvaB2Hejsd5af7ognlDGZV2HDb7NZdiXb
	nMrrPAvqRj1vrZnC5mkRrSt2lGTK7WQUR0yLZyDn9pyIPXucRVWi2uxj13+w9GnUS45lbgCgAdjX+
	imKMwqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRHE-00000008Ofj-2L6P;
	Sun, 03 Aug 2025 05:28:56 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsZ-000000088Uo-435m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:25 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e3f152700fso12488305ab.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193563; x=1754798363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9PcjPUjmFrLewSvRSEJPDWXh0n51inHqjt5GPCorNY=;
        b=STYUrRRXT8EcUO3zzC6nyj6+PhmgYiAa8H+czQRoBOneo+d89MhOU3ziiRE6a4XH4O
         EUy8cUX6ER5ecw0GcJe/VPkzTuIA1mOyg61RyuRJw916fSPkjkrlcd8cWE53WZLbFNdv
         WrIoPHMpolz5FGud8mX3RxnusgnBD5uhjtsLuRg6pYR2Q9st39tuYzX1dgvGSz2DPc/f
         HjMa23w6DKiQ9RhX5HM8TjK1qXOexGTouacjQeEdA3FQT0Na3fWcdqCZIB0PKlD7eUea
         L9SHCm3460495SsMXS3Xw7Rh10b8sHq3q7FAzcIp5aVaXO31rZRXGh18zJ3SD9Xyk91y
         gD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193563; x=1754798363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9PcjPUjmFrLewSvRSEJPDWXh0n51inHqjt5GPCorNY=;
        b=q9IpWTfXzpF287nw3QRy2oduJP00AescPYCWQrG8Ksw/fD4NArwfhWAe/0+mcIeGrp
         tnlhjcQhj3YZgcI0oTk6kH+3BlFncRdLKjUjHozrsekWHOMFGpyZtj2acJgNFDTervph
         8EkVhxN3flUfT3/AbfcN3YmoKrU/oK0qtcZ/PjEKffDva6tIUY2g0uUsvL3DZJZBp2gU
         qeAsLGuUAoppWjKabV2wPplHfhWGIMxR8MDx6WoMFA4xez8lXqrL8o5D5RPb2wQ+pErp
         /zL1i0xtUbZ1V9QFwCZagYnIhtZTnluxp1l2/QjsfXSGPM6EtfmaTnz0xaChIbRf+RdV
         U5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbOpE/R7w6jGK5oKPonVAgSXV52wb3BgTELM5bxsElQsdzmG1NQNAGMr9wZpH8hB/PdyO7P0PMt7QR/4B4p+15@lists.infradead.org
X-Gm-Message-State: AOJu0YwrbNXRJ3IkktQ3Hmd/HoSyCsovIeYkMtSd0AMpHLTWM5f/qqmj
	WQTLuUp7Z1KgfMY5cLmJnCRasSfwt+Nq3VCu9t0tRd2mN9zl01Dvax43
X-Gm-Gg: ASbGncuOLquYwj79/olJPoNkVfqnwCXfXxCGb0gbKpxWpjaDKvJ2DCZtopAtY8yKu5r
	lGk4QPYXKG0WsKMVFsHC6WQAHuzRiN6xbHkPZUz8ngOq+ArBkwyHxYGMqZGXNmRl0aFvvXDRkOm
	cNkr1EG2xykN3Sp/UXnCeQ7VQI/wUrFwHKCWhgAnFyFRbxfrxARE8hmQ+3HlmR2Kt+TVCZ5p271
	Y7qNasfivmXLdwIoFz1R0/ssbty7JUbQp5/WT5MEAnFLshJrSBCwzvxliTzQZzuYzXFgTPxfmhj
	UlYPlwSb5k0iPpOOWt3kH4cFMLcvjG3QGCJENit0kAXxMJBUNW2dfFWCc6cik2HaYU3G/esIVy8
	cfBA3+19wYAg16g/VtU3jj2MRipOesw5nNMW57ywP2iCI4Z7wMqamSt3B7j/xiauROJ8tVfmt+5
	sWuA==
X-Google-Smtp-Source: AGHT+IGHik12b+NzuHXdXH1TPCs7I43pZRfGChkNXR0L9WcmFgFx3EM2Cq+84hECD9IhAilvjxg83w==
X-Received: by 2002:a05:6e02:1f85:b0:3e3:e78e:4e0a with SMTP id e9e14a558f8ab-3e41610d65cmr100228055ab.1.1754193563265;
        Sat, 02 Aug 2025 20:59:23 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:22 -0700 (PDT)
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
Subject: [PATCH v4 33/58] drm: use correct ccflags-y spelling
Date: Sat,  2 Aug 2025 21:57:51 -0600
Message-ID: <20250803035816.603405-34-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205924_001991_D8C22B1D 
X-CRM114-Status: GOOD (  11.28  )
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

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which disabled dynamic-debug in modules built with:

CONFIG_DYNAMIC_DEBUG=n		# 1
CONFIG_DYNAMIC_DEBUG_CORE=y	# 2
CONFIG_DRM_USE_DYNAMIC_DEBUG=y	# 3

NB: this adds the flag (when 3) more often than strictly needed;
modules built with CONFIG_DYNAMIC_DEBUG=y (!1) don't need the flag.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5050ac32bba26..96b57b34bc505 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-- 
2.50.1


