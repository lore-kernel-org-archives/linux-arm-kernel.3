Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D6FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ec8mexx4J8gKYlYC4pXrJdWhIH/flCkBKAIsxaGo12M=; b=IAG5D5BwULNoV6aXbi8FzspTMU
	GpnTxwyRrGSuAKXk6cdSn7wO7X7Fco/gMnyZjwsGF8ejZrhOQGILV+zZooh52suvYMPnK0fyjij1o
	Vgfxeafs4n/39DqVm1M2aGuwlJKiplIeiVoQIDWcmiAzx1cJWtCIiOKsE7wOKctnyV7Cc9PH1JPis
	i+vIn3UR/xkVT64atrEiv4xLYfIoZx17eFWf4BctSHwJLzUR9F5MHRFU6FvKaNqV705ZTv8lXIZ+K
	aF3d6MdtI2Qyu7f3XkSCugdQ9dvz1tbOF0b3MJWMqG54BO8bc2HXsnJ0pYXMcmVDvuSk1CDs0VCDf
	fmmJ+QIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiS68-00000008RYj-1qSO;
	Sun, 03 Aug 2025 06:21:32 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPt1-000000088s1-0unB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:53 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3e3f135bccdso15276345ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193590; x=1754798390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ec8mexx4J8gKYlYC4pXrJdWhIH/flCkBKAIsxaGo12M=;
        b=KMegGvRn35TidJEQiYD2khTCtTpmdWO8+s7WXG9Y3kdZ/HBAXL0N+B3MwaC3+IerU3
         f+uADvpk+tWPTE0vmEBA2mlh5dgWIAZAjjoZvnbh6eSv382xGZq5M1kB+EMTabObh3mc
         +BUs0UlGKu0U3bht686oRcCnunjK3NTLd+IGNCVKNqtYUY6sw9PbVO8TaLJDBx6UFIle
         lDLN82L1qM5AH+rG+pbu2Rh7ivBxy+BaO5IhbMcQcIDXstiwNJJ6eN3/dzOZQ+FnNefR
         /RSbrznsrDOsMsMC7YqAFCyvoPX8pwYaPfZpQe29kRG+lTcXGe22KU+cUsuIcreYZCAW
         b52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193590; x=1754798390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec8mexx4J8gKYlYC4pXrJdWhIH/flCkBKAIsxaGo12M=;
        b=ewv8S2aDnOJ5UxDIb0bz1kR0935LpsoHAxxcdX+T7g/klmJEwolvrg56N/eVyJ/wOm
         G+GsIdRi2+g98wC0HkgLTIxcMUkcwfkNfKLyhrHnpj8BcPzk7aS8O75BX8JZo1hGfpzY
         NKvAvYetCMo8zg/KIv7tr4PiA882s8/QwI9Ts+fz/lDD7KIhIuN0HaPvnDvr8aGGjCT2
         JaOgfIxPqhSALU7y1V9J49XW0qxs2WSPTovlR9e+OOeoOptFhraEYUaRT2eQJTJoIBWu
         f7FOykOIfp57s/RXgDqxbC/JzMKAkQRFA9le0zQ6yKZmn0iirjc6o89vKB3Ffb0/9VL/
         jRxg==
X-Forwarded-Encrypted: i=1; AJvYcCUtVYt92uIb4jeTpL4hNz1JmCnyWNmbEuYvdqPhtHaaQhEHgUgWweJ0Ua2Kb+4t7UZVOzJBlDkdJtYR9jjT016b@lists.infradead.org
X-Gm-Message-State: AOJu0Yz19vpZLSE3mG14bddshzEa4RtH+T+V10Ff5s8t1sVWHhyDIBSZ
	z3IAxGW/7eKHcpsoxvSNmRWw+zfFN6DtQA5x42086U6gzGbzxzQyWbil
X-Gm-Gg: ASbGnct/2HwzlDsLKBlcUhuPjYEbu0jvFoIRq89ThAY7NR+U/xSDCviNJuuD0DNSWMV
	NI0e8Y1a8OQYdfCvv6Kogr8zIlNt15ywYy/U+xP08yzmoLEVoI6ZVUHbmU9nA6cn2Ow4Gf6DRSr
	NOwONAL2eNJ2v2bw6mR48XCG/kEadAP2xvklagVHvYoi1YnST5I6oKhXql9VND5yrRSx0N9YyZR
	Lutp647VVTIxezubRE+Xa82T1S1fEzzylCuXAcDwaGIZ7C9x4+JmT14aMyK+BW8jN3jc3xpuLka
	lI/UnfNRSQ4cfe3rHDTdcBwbZTLfEjpaqF6P5pMD1iSl/XwS2tql2RrAK8sTNMlUp/bQxLta+EK
	z3CHvegAoevXnn/osO7KqgB3GrVBYKPAAGZ0OuGGBwvu3GE5hSak6a//O+DdQfxh3v+sep4Bx51
	GtMg==
X-Google-Smtp-Source: AGHT+IF/wtqWPX2Zi7GTVg1C35Kj0vqsIIXy5Rg7Uw34TkqPQk+fiEKJa0lSA2jtCZZXOMZn37J89w==
X-Received: by 2002:a05:6e02:216d:b0:3e4:ba2:2cd1 with SMTP id e9e14a558f8ab-3e41617ffa8mr84699525ab.16.1754193590548;
        Sat, 02 Aug 2025 20:59:50 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:50 -0700 (PDT)
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
Subject: [PATCH v4 53/58] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Sat,  2 Aug 2025 21:58:11 -0600
Message-ID: <20250803035816.603405-54-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205951_286462_4683C706 
X-CRM114-Status: GOOD (  10.90  )
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

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 5385a2126e45f..5b6797b80ff01 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.50.1


