Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA7E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=; b=oIBOkXzIqxCWqQSepjxp8ldm+9
	03F5xCgUl5q9tE3uv30hAvvCwzIYFlJEEXQqWhofdz4X5mAyNs/b+bimIuXJP4TJSQ9rha9sPpt1u
	m9XvLhXTqCVyZCHA0tosmvYSwx2O174YDQ6m9GcfXJqPkqw086QX3mbfGnpMWVTtT2h4ud9E7JjOZ
	sDncGnbjW2ucsultop2j0cS+BaVfQcEd1AJ2X3hOUGl7z0BNccuuqZFWO4KsQSx7vNR7fLuacKqGH
	UVOdX3ZeaCgZCPS3Q9mA077wj8K1emcXC6khOOj/af/9dU1E7fKgS2o21DZg5DcoMRiapvLcbff4u
	Py/kOEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbC4-0000000DP6R-3kqm;
	Mon, 22 Dec 2025 08:23:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbC0-0000000DP3N-138X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:23:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b80fed1505so3930321b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391779; x=1766996579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
        b=cpDuj7GLZrjD4V9yT1Tx3Qe8sgFiEdLWHVySq51yQex7od82wcMd+7/4FvpNDDGVmz
         jzqGQ9AIAwgd6r8sid2Y6kjPag0lv1j94iqzno89dqteH/1PeO0UdtRCEPiECSZihC1r
         jhliplRYC2HRoemNNQvNNFlOOfXXbId5VLmwThu63XjMzZxr29jHwlsgKNvRKJfDaMd1
         9vKXp2Me+bsrSRL8lMk7M1wrLsLuuO7cQIZhSsGeZHLD8LTLVOxp5mTuMp/qZv561z5Q
         dp5Ldpk2X6Oqp2/fijX01u532AJgAPTq2xNjtcSgh7R5P8G0bKviE3gf4sLo/tbvUONH
         n1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391779; x=1766996579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
        b=Nstq2E7zHIyJkupLjypx1Xi4vZfOnBffBYZDHU2Iw49oJ60LHf4u2mrxw3Y6YmmTIo
         +wViPz/Pxu8AsuM99tVp37BZvuAdJMgU8+t79IiBMRMFBsIGifYtErIk/W6oKLXn/NYw
         6d66jiZBQ5z83tPDKmPlKV9wNM2vMnKmzzKBOF4CGCf7Di+ViVU6pKFkhbvtCBTlh81T
         GdCxNZASjh5Z3S7a4x7V6R3RfWL7vmwR9xsaKOKeGwX5HeWOpDhEX4CsDSQuJtblRaE7
         y0iko/6YNa4kaZsoLVBXq9uWwBhffMpnOOY0RL8EYi9ut5jwPL6T5H5JCJGBh6oH4Nrj
         x7RA==
X-Forwarded-Encrypted: i=1; AJvYcCVGFUrYNhSXOurZB+dAHQh8lKxs46nC/J/vHASDkrDdqgnKnH7Xetcl7rsxoHKATYAt0Y0wrNIpcr8yhsscDhi+@lists.infradead.org
X-Gm-Message-State: AOJu0YyyaQDyE7pDJxSE/OEdCLNqexfrRn5AGSPn0CqCHQlEXsRMWy0Y
	GCNMzfJZE4wngRX9lF2O98o0IWpfi5jM066YlWj58S/RdXc9fdbsDwnz
X-Gm-Gg: AY/fxX6FZEu/msUcHbS9UaGLopH1X47QxcTow1bH9qencPmcu2TniPbtavEvjgSUU4u
	Fd+MeJYPmX3f6bjXW3RqM8r3XcEhcCt4747LtwJZGwFvLLeNsvqpa56JIfzpPEcaDcyS/yAOihI
	BE4toD+Vj9BUlftX5ybQ4j48F+LD44GYJb+Zkc4UcaixAlgDpWIpKd44EhF6uT48BcWZzK2R52A
	nWz8n9QE5LbEn5m7MKFfKroaNyPrgMo6Sdn3MW9cnXYiq8fER3puMnTHMeXZuy6cRmtjXYsubhx
	4kX/gRKAufLHD3ZXMZ8vtMBmU/uyXfuvwRo+EVzTA1VD9ioscujUCwqFZRobm3KeWPZ6eU+E/9K
	NG3PYqrKLlD/g7g11hjG8XNUYIrHWNA52ixj8F0w2bgVNz8SxV0+c8kSgn2r+B/46XzdL3CUo1N
	VN15dgkJ7dDHin0RAgxLY=
X-Google-Smtp-Source: AGHT+IGPhjVEd8hFCFWSuzrJ6/8E9Tcr4jw08Ck32qa0ZVNPKd3V6Hm2f6vkNyl5Idf/bQen/LCS2Q==
X-Received: by 2002:a05:6a00:b902:b0:7a1:49f7:ad04 with SMTP id d2e1a72fcca58-7ff642154b6mr9938622b3a.14.1766391779554;
        Mon, 22 Dec 2025 00:22:59 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:58 -0800 (PST)
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
Subject: [PATCH v7 09/31] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Mon, 22 Dec 2025 21:20:26 +1300
Message-ID: <20251222082049.1782440-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002302_707218_6768C1FE 
X-CRM114-Status: GOOD (  10.93  )
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

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d2ff203d0873..21c1db7e8705 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.52.0


