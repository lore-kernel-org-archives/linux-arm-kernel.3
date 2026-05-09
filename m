Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5553CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 01:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G0cHu/AZOFkLjDuxm2JV8SwCnwjEcedfmgM9JUvSLnc=; b=dxC8IVcynPIcQrKpZLxURidLoK
	w616MD+4NYKpUk7DniWTnTrDFsozG8Uk2holwFVDFvFjoskzAsvxSp+L0y5xXaQBqhDh47LOejoiv
	lyejdoauP7J7Jbv7eXjnv/WRGwRL1rl00AwcfFlqzmBlLoG4QZwiRG6aWX+yEL01rFnbo5wAcHvjn
	iqP0wW9Bh5BEJkrQSKOWGqbvGq1MSJ9ArMb1QNAxb1sR0/F3snGv0Y1TZVEwxIfVP83tvD1tpD6+w
	b9sYP0KxxopYaqpMcWHfisp+GlXp2eEqSULWgct8s5wOh5tNrQWzmsYq0d/T7D9jryaY7xaZYYOnF
	FmGkaCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWPE-00000007tjn-0SZj;
	Sat, 09 May 2026 01:23:00 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWPA-00000007tj9-3iae
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 01:22:58 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2f0ad52830cso4033368eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 18:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778289775; x=1778894575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G0cHu/AZOFkLjDuxm2JV8SwCnwjEcedfmgM9JUvSLnc=;
        b=XDNSowTegRCDqiUnRF5BBPySgww34HVbkjfB5aG3p1q+UsqbTzz0vobePL78pI2+xK
         LtbtdopgW2Zs35R5rwH30wd1YiXV+o1hyb5Pxw5qf44r9gqUYg2y8shG56QWE5F3IuV5
         OXET450qKccAM4MIeaQ/euvcsTUGZ8CqTcUeoWdNMuonNG+gDEIPbgzFPAdG28KBXxpy
         8Cwh6J07YUU1wsYciCrePpcqT++Z2hoXuAsqAtZWp1bnBu++3mZr18wAXZXrqcOisNjl
         KW7DekTkpxvcFurQG0MNhHX6PX9HXc/DZ5kgcea7NL96GKxvi8k+8m60rQefB2oy0JFd
         5dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778289775; x=1778894575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0cHu/AZOFkLjDuxm2JV8SwCnwjEcedfmgM9JUvSLnc=;
        b=IHvV+hirzwAx07tLQE5ptsW4+o6p99FhZ6NLW5BjlJTtJGEpcKO54Ncoo3MVJ+lOag
         aL0I/gMLqAPkcZdvkW469YMybqQbpnPZxEnBzs2l7QsmA30CXpIvep0MrjCsD4cWt9ac
         AXG4zsbX3NvOZvY48yGHmtx7R2N1pvLR/F6tNNMAjrWwSngEdthiKs+qhHkv8EdbwTy6
         nZJ5TZ+1qsJY7HGuYiFAuCn8lnHeRtPMVw5tdJ+s7S77zj4110zCM1mPKSA/jXAtSR/S
         8hdNXsE1d7HRhQfQA2aM8QM4COFe8ZNAbn/DqBTmb3Nn5sp8iW9HI5U+51DeaFCdXr6R
         j0Ng==
X-Gm-Message-State: AOJu0YwCDorKIdwKZ4K4UJC9S9IvVBPD7ciwI4YkA1RaWvlKbSNz05Ux
	D7pegO9UB5SyDhlDp4bx7UVGTYtWeBMluBgzcxo/vR5N5DVpMp7cXNwyku3pavqwAsY=
X-Gm-Gg: Acq92OFDpEkw5hj3vIAMoJ+xVFZloOg2b7O423djxpH8hmrE5f+U1fQcJHcBTRj1rew
	cXCyW4HLYLqjbMYEsiFWIgeOyQlFOMXvPpf5vOXBd3tsxQR7Iq0vBg8bFlOBF1BhjDJG7qJVZn4
	5Ne+91eEpigcPGE0FyDdI7XxaoGgrOhFy5I3+qP8Kut+d3S4cit4kSJD0FuIa4jTEPVPeJGR8Ag
	AvW+gSrLfqxOisjbHmccPPuWhBpN1rVE7nuPGT+QeqETtoUujLpCnhBTlh5AZoKg/RYmrLbabyB
	sqOnUTonhdfo/ffYIktKJROpmrhDgLRLHWccLmTk0wn/s0Xex95FOBlBgm9xCGJXD/HtgSA4Vfb
	EduSc6NrN9xI2jXnGDeX3CGlS27RnBp4hNxAdNUP6jjEZnPsnVqsXg5grdecG4MNtjZ0Sb1jEo8
	z4u8AoH4g08BvtxraoVA9m5qNVYhSKAL/zL5/2XScOS9dmZ7yuSG0IAxpIjSZWkj45aVpUzOr7i
	sDK9BbJ8G20+85uAMAPeqPX9OcPYiTS/NS8X7E3HhhTTo5CNNqiwew4GgphMtKupOqWlU+kbbV9
	bZpWUyPjL3iBAzAVPQ==
X-Received: by 2002:a05:7300:a508:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-2fb4d68f9f1mr209442eec.16.1778289774801;
        Fri, 08 May 2026 18:22:54 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88914523csm4457310eec.29.2026.05.08.18.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 18:22:54 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound: soc: ti: rx51: remove stale reference to machine_is_nokia_rx51()
Date: Fri,  8 May 2026 18:22:46 -0700
Message-ID: <20260509012247.14990-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_182256_935881_FA51456E 
X-CRM114-Status: GOOD (  13.30  )
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

The rx51 driver relies on the machine_is_nokia_rx51() macro, which is
always false since commit 9b7141d01a76 ("ARM: OMAP2+: Drop legacy board
file for n900"). Its presence prevents the removal of boards no longer
present in the kernel from arch/arm/tools/mach-types, because the
machine_is_*() macros are generated from mach-types. Drop this unused
code.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 sound/soc/ti/rx51.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 7eeb12e5066c..cfc23e0838c2 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -19,8 +19,6 @@
 #include <sound/soc.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 
-#include <asm/mach-types.h>
-
 #include "omap-mcbsp.h"
 
 enum {
@@ -364,7 +362,7 @@ static int rx51_soc_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &rx51_sound_card;
 	int err;
 
-	if (!machine_is_nokia_rx51() && !of_machine_is_compatible("nokia,omap3-n900"))
+	if (!of_machine_is_compatible("nokia,omap3-n900"))
 		return -ENODEV;
 
 	card->dev = &pdev->dev;
-- 
2.43.0


