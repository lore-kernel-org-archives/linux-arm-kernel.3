Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B40FC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=; b=vVpwiLP7AdQfyvq5aMVYnm5Zkl
	m6SH0HnVokFC8h810x7z8ThXUAlJoWaHASoAmYlOsyK5nLyA0h67NKhu9PGzU+Y0/H50SoO5uyytO
	0t16V4hXlW2nA4q0199q005mFYdzKVBcIPAhk28eCHvJnjqwZ8JNPSN5ARASNbUN34aFSvpXzec8j
	QX06u5V6uLtzBZZj0ddw0cQH0/yV5a4IMf/fPRrUjrQzgPyxr1A06QIf7bNMVS6Ytp6ELCXU67/Tw
	2RQkimpeJ4IxSf7lcLrSyHQQEWSigI+OpqocFnL13marPrsVo9eRMMRlURRo95Iu4SXW8RPb2FQPI
	NBF9VTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTO-0000000E08O-044r;
	Tue, 11 Aug 2026 12:20:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTH-0000000E048-05i1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2494829b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450842; x=1787055642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=;
        b=OoNT+djAhNFWSfdz7U7XV+4nvibx7I5OW2rm83yCEqy8NVbdXAqteUutjTYd4cIloi
         GtKbjyFKKwIiEGxMPw8CvLxcVTB2j4mgpZpGFlhZ3j6XnKrJYSvyYP0r7j4nG680emn6
         t4rx1FVHgUUtRZMZxXgQgcCgi70L10DZTTezg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450842; x=1787055642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=;
        b=q6fyE0OpgSb/irCw/QGVCglweSSFRqtctTnv+UHtqmryVMzPuEWyap2sW+paU7HdL9
         Cjl5aH0Z3hK79N8X3N0NyxJwpG7RO5w4nVd/s0eiVDpPRF6Jrhznia+v5gRaFnLh8A53
         /mA+KYs2/2pjRDswYRAn87r6qXWsbZsW6dZ+ieDYoKa10aKICX8CAbew5KysRX+Rtvwi
         Sh3xb/suJnLBliOx2BvcgtCzLkxgW2M7gTabK7rwU2/+5oDKD5OHBOueFW2LvP9sWoG0
         AYrpfXJqre/e5k0WB59XD5m0VJXtKTQn24mDOdLIdSJDy4TWe04nXLcpGFaNvA2+PKzh
         J+bw==
X-Forwarded-Encrypted: i=1; AHgh+Rpns6ULUhVfUqQHr7ZeWdDnqj5fPLjL1dPi2Bx0RQcKe2Z93zOgqzZXjQl/fg6Cg1128KDda0BcxNpuhO1HAxDY@lists.infradead.org
X-Gm-Message-State: AOJu0YxSzJX410CkD9tTeLy7PoU46XWZoPjEtBVmAWWyHJgJBI6KX2Jj
	BEesSz/obZ39Z0EuhPKGWpK/B5RgnYnyxIdkDH7oTkHctpbjjmlAEnO5fuOWcX54jQ==
X-Gm-Gg: AR+sD11Bzxl4Z0jdX1QMDB9yC2bSZNJqtCOSQWySOtNF0Hj75sDm+SoSz4bSQzhTTHN
	cBrEJzb8txtBpVxgG/xjUrNuq4WJs2NhY2DYbDpdndXWU6/eFL+SOJG3/aPOohIrGmTN+sc1Pqf
	4/LBgvNZ0jytAwtK2jGuj5ugPwestWmITcS8Bc6SAE/DCmN4uOJqTER1oUxUO3J1qplHVdcEoFZ
	lINHiYxmGlknBR64zFEw12sHb1Scl+s9xZdVdA5yYFFmpngb70GwqP+nN1TPmCXnjEAR369MVLR
	LJpU0Cp2SniD/fbS2N1bFunNOtJdvjTsYivJQLLvT43B+fHJD9TqphbgRzxlQ4lEz8T19hruIxr
	wYAbI9Ji8hraa94AcT70yZ8HL90w3iSLj0693V/rJn6RMGa7QUbNBz6Ri0WI5czX84TfmjZlvK+
	caXOk3w2rFTVV40wEahkJQaHoJvYqAmsOiPEw6BG/Nvfe6kbdoxXpmSbNBT073o0Dkqqo9iIfC+
	XH9AOXNxcCN01OMzcXh+DCusJx/6Xyzfo8fPrubSyK6dA==
X-Received: by 2002:a05:6a00:23d2:b0:845:c906:5ff5 with SMTP id d2e1a72fcca58-84fa8842ea1mr2725202b3a.30.1786450842194;
        Tue, 11 Aug 2026 05:20:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 2/9] Input: elan_i2c - sort include statements
Date: Tue, 11 Aug 2026 20:20:02 +0800
Message-ID: <20260811122011.3539250-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052046_021791_7AF91BC4 
X-CRM114-Status: GOOD (  12.36  )
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

Sort the include statements before adding new ones in the next change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/input/mouse/elan_i2c_core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f93dd545d66b..9f024a435dbf 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -16,27 +16,27 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/string_choices.h>
-#include <linux/input.h>
-#include <linux/uaccess.h>
 #include <linux/jiffies.h>
-#include <linux/completion.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string_choices.h>
+#include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
 #include "elan_i2c.h"
-- 
2.55.0.679.g6767b8d81c-goog


