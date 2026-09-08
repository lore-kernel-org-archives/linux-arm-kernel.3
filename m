Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46423C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8FraEq/yUb0r8EupXB8EQKm5xu56D8kJQlL77fVqVg=; b=xXAhEuxhL9vpHnHuMPhnXcoT93
	e+4+UgIP/L+wAp0sWk46E43cYd5rJENTrgzbgwoBCpGvGs/adM7eLR5UiLJPBI6LngKFxSntFA23K
	wR0xJ2Mrq0PbDavFDFNVHmmccNAt69Voe4stT8Rupg0I+UnwsA8RCNUrvf4JQF0ACzmycBdxcksKX
	pnS/zUlfHTGCK+vv/KlKLh/8opCY6l8MU+JTQvyQGlnA6QHJoLGymn7zva+wLglY/KizrAA4ti6u3
	1zB6XIYjy6CUm7sGK1dgFSQ3Woapwap0c1+ULnvgwCkthI2BPnEBIUsrUzeVLlJx4x8HsaNIE5RkH
	7dGKb61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZB-00000009oH4-2TRk;
	Tue, 08 Sep 2026 17:25:05 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zZ6-00000009oEz-29wm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:25:03 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb752so170944a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788888300; x=1789493100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8FraEq/yUb0r8EupXB8EQKm5xu56D8kJQlL77fVqVg=;
        b=La5korvwvdjWwvJVBOlnmlPlZzPl683is3DoA77yGVMU25uvLNOWY0ZGxnOb4gg7aA
         5ax2KMrCnG6dA9BTkEidfx4+0jQOuamK0rCLItq8AHZCHtlAQwnTFBQwtFwbPV/80DkP
         Nz/tUmAJEDG2zjEJfIufktQhFGPGWbiwRECEnhmjReVgvhzisbewVfHmy5KOSBcakRSP
         0CUQd9Ux4LMYaOL5TO0JXHKoZoQPm1t+Puw9SvmZxlNoXfvtA1fKomDdZTFA+E4xzccm
         LfHkZQ6gGIfKFmWYT+dq24xGrLY+2UfyG/WOvhpbUzTIMRcWHyaVrZDjZDfzg7DXbjvS
         2SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888300; x=1789493100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8FraEq/yUb0r8EupXB8EQKm5xu56D8kJQlL77fVqVg=;
        b=oKmQNQkpqxgZkRiglm1LQBKSXobWZBe06ag8AGnuXzlX3hRGD/se/VbnOUqnDY9aWA
         gP1+bksKdPLXVR/VsQ58IxuV+dYdWtRpER0RWkn8D8g2R1WvaynyvfviyPRd9U1N9Vyz
         hVhQkCAnvbE54bGfnSdlEMTBYGZOPw3zKREy2Bi2wKWH3mrJ95cOmlrZGmwZ+yI5qdYf
         lMcj8azXcY9ARDOq8R9oEXRBe5ug/tdW/VfgkG/lX1ikuJEskOiIArsKd1g5ar6epvip
         Oz+IfEQVEHUFOAMSqcnbS4fOhHFDP3F0IH03Wbr3D2ie1SpDJ/sw10cG6i0gvPGLWdDB
         Zy4w==
X-Forwarded-Encrypted: i=1; AKwUvBw7tKBsYOFj2MxI7pgy3dFKmZ4+47wiJi3361AtvHZWad48AljR1OI1meHHiK4f0qcjmqPHtnmZRV+YwR78hocD@lists.infradead.org
X-Gm-Message-State: AFuF++nzoZYRkPlUPFNz5ZTTRsOWbf7X/Xxb3ahiz8axYj1g1coFMibQ
	DWSypEgpjoEFuBwiRYUlgF9EC0g4oXzi1H2W+AsD5ZheOGjr0cLQu04b
X-Gm-Gg: AYBFou0zfpX7EPFP0M9/vCyD1mkFQ/AfeNypiCI4kYvdzqS8PYd0ATjuHpO9m4Ortrt
	M7f+U2LmbNXmZXhoe060BHDcoOuC7OAVi3ogOCTUfJ1xOWKS/DLl1kbTYpsp8+YkX/FScqWskYN
	tBe0upUnyhycKSH/Iwz9brMkPmlxqi5xWE6yjKN55YVRH0TVjOd5pza25LlO9pAZKGBR5NfVS18
	dipHGlgzmBJ7lAxyHB2GjumfOH3E4lwm2ZJEI5/tr1Zi5LFMJV1dCPy128KhMRG8pNbFtnsSbXl
	LF6dk5qAVg7SnQk5TifR53P1J+7RbhlpWglzb8RdUHEC/42IUjYKkBPOqIDdn1a+5GA1d4MiEqn
	CRTKJALPY1d2N6gXhqzuz9lUZ3XuF/lp4IqesGcjy6AyvtpFyNNzgfLLNIKrG5+4sZZCutjJiUC
	PFj+YZGy74L5JzDCPLjxvzaW7rikVBWZiCfFeiQX2DjSX/R39l0PrkWfyhsFo=
X-Received: by 2002:a17:90b:270b:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39bac13b38dmr1363341a91.2.1788888299767;
        Tue, 08 Sep 2026 10:24:59 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:43ae:bf76:d99a:e5ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm19297176eec.20.2026.09.08.10.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:24:59 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v4 2/6] iio: adc: bcm_iproc_adc: fix include dependencies
Date: Tue,  8 Sep 2026 22:53:55 +0530
Message-ID: <20260908172359.30003-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_102502_750786_D975E949 
X-CRM114-Status: GOOD (  11.17  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Add the headers required directly by the driver for the APIs and
types it uses.

Remove the unused linux/io.h header now that register access is
handled through regmap APIs.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index e46e3761993a..21bd51da9cd6 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -3,14 +3,18 @@
  * Copyright 2016 Broadcom
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 
-- 
2.43.0


