Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98451FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4aQAS1VysiNLcvWOiSKb/FtmRaSKYwCs5hFH6xhhq4=; b=Gp6+MoofQ2DOU7ae1aLoUiuSiC
	7suH9cQAEI49TIr+pVmzBUicQP1GWx45sqg20EIX5zV8+etkL+l62m2tv8UTZwKrBVd91PAFlCA5A
	g1NqFhM/uPJIwsjjFuWLExqxVAco+08YP31noBD3TtdV3hdNCB7Eu5FYK83bwmPXaOh9HwTOxWTTB
	scFOY//g7KVSb30WXNo+Ir+mxjQFnr/VW6IgAa9o/aKsV4HKAlz9XqML3Kxk13ZQUlkDuiag9c0DT
	RE8QKkyTtt25KLvjmLJP0rlJ7/7B5pZ1zpjlMdOlNP5SPMcowm+cWdz/531hgaxrE4kFC6Ts/018r
	L5ZURskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6tt-0000000Fr7N-11LR;
	Sun, 26 Apr 2026 21:20:25 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6tq-0000000Fr6x-3QQB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 21:20:23 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2d9916deb14so17090710eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 14:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1777238422; x=1777843222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4aQAS1VysiNLcvWOiSKb/FtmRaSKYwCs5hFH6xhhq4=;
        b=KdGgEgvi07YQwWyfbFv6SUeolLlik4/A6KPIfIjp+yBM+mbdzc004PA1XPUYL8eOg6
         i+V3jhcv7931nA4NMKVh3+XLweBwDGW9MK0VZykgg6TWPJZNmCk5xtpYcN3ZHN3rAxWv
         tySRzBCPvwBvya2MxE18AldKSSdUTKtSSF7NOQPIGXb7QJelUwRGkP5vKsmxEWrAfMqY
         dbs2tCg31To359DkGLXvjPKo6ienGbAprVnkISRKEVqt8l6fXtAsZcm0fjF/+QA7K9YZ
         lc+JGQhKz6s87LUoh58LtA3aiNC4a5TCOGxmvRZ0stWC2T8hl/xyoWya8QMGpulSYUb0
         zHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777238422; x=1777843222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w4aQAS1VysiNLcvWOiSKb/FtmRaSKYwCs5hFH6xhhq4=;
        b=mkcA09FkT6ThKZ30VUDFgwjRG7ek6T9pHFGmlL21uc2OfBC0SwVnIY4JPFO8oGkISH
         E58t4C9S+d5AyYEaqeyRMNnwqIw4EpwtwprmE8hO4HfMBA2+MyuDUa9DFLPLeLA+dYyQ
         XIFy7Nr1rN20d+x3dytnVLEMlahdIk3XK04zIw9Lb5ops3hN9WLRERkmyGfup/F2+5nK
         vxJj/ccvDZMdbGywUQK7BkJZVgwKIt+kgZOllE1EfWTU7/PnaVe0eW3uiZGZjDvnU3Oq
         j3gsb81ULt0ehpVkU6npUiIU3DP/V17wW6LPFf34xiEv25NTqgfi7l6M0cpIZU6I99mG
         4MXA==
X-Forwarded-Encrypted: i=1; AFNElJ+k9h84NbPxDBLdiYWlO+hqOAuRT9gybyKIl7cmh1nkHMhFrJ41rwUKv72MEUOh64EdeBZ1sebnwJvGB5uyBPwJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzKzgkoUVhIuWxhpZ+5jtQoDPq4AutrmedLo/T0wpCn+h1oaSmw
	BTHV1C5mNnH4w4gIh5mTB1TT8VOgZPC6m6MhUf4jmq2CeGddKJjVaonCv6duHinEQz8=
X-Gm-Gg: AeBDievhpJ3pDee4Ux6az2EyMm+dskBYIQlBcOfFPX6qL2Dw0asFgB8rWoF2ZOzRTwn
	DGKOwvwe64iF0uMs5Z5V1PYapXtg9VxnkxRw7WZiKUElQERut8xS0KmxQVO5qF17g+q10m/zq4B
	7qoozGovKG2zU3r1QCmjBj68DmRPSuHEtT8T/9ytlOrwzxYQf4s+Uh7eNROTqYSMWTljLlW6wl5
	EK7Xl5EKyENnW7+Jsv/oNniAxvWV1OoFPebk4olqrP1ZwKEoF3g3MkgZzfUoPY2+j+Aez2pt3Kq
	YnvTTyuRUlatSGQHErA0X/rfQlkm8fcu0eMEoAz/IvLXDOu/FPmy+bgLsjkV+y7PNkAdyBQoA4G
	Tpij+gv4Pm1xvcffHYLKbRMXv/r6k/6b/2eP0amKyxii+JL30dm44xa462GTiERjU6M9bKkTtIg
	tvia4Gq1XMcLLNAD+x9Kt9TrcFE/DyTCk=
X-Received: by 2002:a05:693c:2b15:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-2e47a105b1cmr23742636eec.22.1777238421930;
        Sun, 26 Apr 2026 14:20:21 -0700 (PDT)
Received: from eileen ([38.10.153.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce0f5sm40799122eec.17.2026.04.26.14.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:20:21 -0700 (PDT)
From: Caio Morais <caiomorais@usp.br>
X-Google-Original-From: Caio Morais
To: andy@kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	michal.simek@amd.com,
	nuno.sa@analog.com
Cc: Caio Morais <caiomorais@usp.br>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH 1/3] iio: adc: xilinx-xadc: remove unnecessary includes and add missing ones
Date: Sun, 26 Apr 2026 18:18:00 -0300
Message-ID: <20260426211834.3318306-2-caiomorais@usp.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426211834.3318306-1-caiomorais@usp.br>
References: <20260426211834.3318306-1-caiomorais@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_142022_855538_19C03A2C 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

From: Caio Morais <caiomorais@usp.br>

Signed-off-by: Caio Morais <caiomorais@usp.br>
---
 drivers/iio/adc/xilinx-xadc-events.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/xilinx-xadc-events.c b/drivers/iio/adc/xilinx-xadc-events.c
index c188d3dca..31cda8e69 100644
--- a/drivers/iio/adc/xilinx-xadc-events.c
+++ b/drivers/iio/adc/xilinx-xadc-events.c
@@ -6,9 +6,13 @@
  *  Author: Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <linux/bitmap.h>
+#include <linux/errno.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
-#include <linux/kernel.h>
 
 #include "xilinx-xadc.h"
 
-- 
2.54.0


