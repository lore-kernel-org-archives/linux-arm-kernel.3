Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271A3CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+bFJzQA8V6grxSKW5mpCmQoAxXzJUQzk3wcMN3B8fCY=; b=Ai/fmvUEIksrMonRdrq3Gr5Mou
	f7BaYRUWojgESasE5HsRvXipQ4HH504tnS/3EQswCwnOM2q3OKYK+sxOL5KYx68954xPCxcAK3sMv
	X+BsIvwlMrD7zWJv2gLkE2DkwzNa0YsvTjEmghouUz0yKTN4A64romUOvHCLFulcG8JZiKN3FkHrL
	PsDshOtFe3K9acltoDG+lOT8PKnb3H4vr64Jc+DQZsGrMpF+rtV1f5SRp/7lNuXaJk9q1wgvw4+3c
	X/2B76XWDjcd+ffuudNNv0KYwkWF2SaJzU1//P+ej9rLZG8Rd37VbeDzo5wQ7mNL5Sqpkd3mRnDdX
	3Xyl3bpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLX7F-00000007yFB-0l7S;
	Sat, 09 May 2026 02:08:29 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLX7C-00000007yEi-0xMq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 02:08:27 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-1329507c387so1655238c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 19:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778292505; x=1778897305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bFJzQA8V6grxSKW5mpCmQoAxXzJUQzk3wcMN3B8fCY=;
        b=o1AJ4ctKNu4MO6dsduTgWp1qvqHuqG7cZsI7aKTHqJv/6yDLGOZDl33eIwzLDM9cbI
         d0AmKzPZqOGZ4ZPzD0Pg3pOeapI8kFQ2N60syAaSp/Jz74v/ryU5Q6lrkUw0ZnB4/jXl
         FKcdgIswVDxOGv1XdNcqyB4c48uJSRXDFyb/hhVAuPOQTkUE3o0XlCU8+J3JCvFcffrY
         IFZtwJq89KDD8oCoVm0vG0A0NEyUAcCmr9DkWTFwa+L26iKl+070O/3g8enrOB3VUZUG
         E7czC1ACFbmwAa+iyGbr2I6geQAO1iyNQOuZVZolvELjZtbKs5k/pFMOdJ4MRccZfWsJ
         7wlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778292505; x=1778897305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bFJzQA8V6grxSKW5mpCmQoAxXzJUQzk3wcMN3B8fCY=;
        b=FxS26oR86nwd4KDMetGL5z7nccay1+1gVtsZtLinFmfLf9mvoo90auyiXVsfIZocBb
         2gA97xnBvVErwuDKrT8jhTgG0x8dSpAA9IfpQPppVFkm31BJo5wQdfETvckMLpK32aYS
         hcC1uVn/J60nJwOBHBhAFOLq2Kx8TGmr6T8RdOYRvlSngfviNlM9auioygcQ4Sth6cne
         fS2OLHz28ND353WZDyK+SJyMU4A4hLxWgUUknUOUw07BS/uTzX8bgeAl+zaXJHSrTzGr
         ebnrDcVV+9wy+98iJgGVG9sxyPMYpysqWzGRAhVpchjzVLlKizPJB1Wv7RMC+LEiNfNB
         zKAA==
X-Gm-Message-State: AOJu0YxBEsvpsj4m06mnJ3P96dpqAW+MxRTFqtc9pAsQK9c6zitCiGOC
	SetKZ0f0NP+Df/PO3G0w2RANp56HApdwyjFQ36ZV2jgU7WyBzINusFJTY4mjKsW/zvo=
X-Gm-Gg: Acq92OEKP8H5LB+lF7Ovv3p+ZSujsxMX6qKkSvDhrLZwhYN0nKRtnCSJynf/3YFHlar
	tn7xfpkv/TlzurkJUwGPv10f7eELBPFP6YGKbBGkEYhBFesAlG1V0OYaqL2Ct6QdyjGN0ZW1RNK
	mWcleOq9L0Ft1McnyKVJ31V8uA6ed22LYuGRhG2KTQvd9BI4G6K3X+GvM5R+aYmBCXI2eCT1Kov
	M9okhYKnEQ8G3D3mC/43xaoTybnBAAwMcyDfLnDrytCdVmFZdW8bYsqBVE9xpPuiA59oCj/pWy6
	h2cJIxG4P3ua8hhp36m3byKG5Mh8tOjwT1Z/jzVlkfxO8aBuNd15QHbZj49FNLr9uVvtey7bYwj
	lh1kbRgyHutLHQbvBeq4Gf1lVqc/7XWkwmnuoKswJ4mYr/hUVGO5y3Md7yKfSl/k6w3KwMqbOA7
	UkSxOYX0MaFAdw/Ryxnn8JH5pY/JMXOBDMCTFvr5pRrMxikX9bFCpq2arrNc5b/TesPbp27hQrl
	PrGCurX9JUDVDgHEhEBlGqw5+ZCaFnBq0meTom39vw9ORvXd8j9BxQeKd/4mjRHvO/YEHUatBEc
	BiOS1rSDFxcUFy9dVQ==
X-Received: by 2002:a05:7301:e0b:b0:2e6:e504:5431 with SMTP id 5a478bee46e88-2f54cc681b9mr7932458eec.22.1778292505264;
        Fri, 08 May 2026 19:08:25 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm5423080eec.14.2026.05.08.19.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:08:24 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	stable@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Grazvydas Ignotas <notasas@gmail.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH] sound: soc: ti: omap3pandora: fix stale ARM machine ID check to use DT
Date: Fri,  8 May 2026 19:08:08 -0700
Message-ID: <20260509020809.33060-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_190826_292815_8E03A187 
X-CRM114-Status: GOOD (  15.11  )
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

The omap3pandora driver contains a check for the ARM machine ID via the
machine_is_omap3_pandora() macro. This check is incorrect because the
machine concerned now supports only FDT booting, which does not use
machine IDs, and therefore it will always fail. The legacy board file
for this machine was removed in commit 7fcf7e061edd ("ARM: OMAP2+:
Remove legacy booting support for Pandora"). To resolve this issue, use
of_machine_is_compatible() instead.

Fixes: b715da74deaf ("ARM: dts: omap3-pandora: add OMAP3530 600 MHz version")
Fixes: 9ccd0106c9db ("ARM: dts: omap3-pandora: add DM3730 1 GHz version")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 sound/soc/ti/omap3pandora.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
index f11b1d8a1306..6c9c184cd9d6 100644
--- a/sound/soc/ti/omap3pandora.c
+++ b/sound/soc/ti/omap3pandora.c
@@ -11,12 +11,12 @@
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
 #include <linux/module.h>
+#include <linux/of.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
-#include <asm/mach-types.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 
 #include "omap-mcbsp.h"
@@ -225,7 +225,8 @@ static int __init omap3pandora_soc_init(void)
 {
 	int ret;
 
-	if (!machine_is_omap3_pandora())
+	if (!of_machine_is_compatible("openpandora,omap3-pandora-600mhz") &&
+		!of_machine_is_compatible("openpandora,omap3-pandora-1ghz"))
 		return -ENODEV;
 
 	pr_info("OMAP3 Pandora SoC init\n");
-- 
2.43.0


