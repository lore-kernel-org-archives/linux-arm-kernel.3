Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA6BC61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPKH9pGNIN0uovWjUe3KBZqHnZkPMpvVj2ffXJquiG4=; b=LdlcSTPWyYhDwstuGvdaPKTMa2
	v60Tg1u27PTDjsPK18FAold8IS0CDBGobnO8rr0scUibNAtsDps0Par0Y4Vcwu72n7GkLAOA3f2Ey
	YvRHSrUFNqJiNyfjy/p1RLbORY+tnrdhnT+9rXdS++IY2gE3hJ2xZrCiFysC5hAWrSdqAe3MvAVUm
	WnSBW56UzNbdhiptVt/+8RhyNGC1dZ8XiJu5ab7GdQQh6eJA0F8ogYnLozwZ8+VR4f2j26X/FwAVk
	/lvw0h72rWVWsuqxRDdo299fNB0SDi+xyezdrunEdyZFGdrzuWsIvID+emX6h19hFq5OVd0NqEytQ
	a8JD9vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynCF-00000000SXX-2zCk;
	Tue, 25 Aug 2026 09:11:55 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynCC-00000000SWh-0RBu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:11:54 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso3312965a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649111; x=1788253911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPKH9pGNIN0uovWjUe3KBZqHnZkPMpvVj2ffXJquiG4=;
        b=Jbmvpu6cT7MPE82bmSYshE4GRH+86bnPQaMiKE7enGqDdpyrTWkmTLS0Z7mqMoJrWC
         VeC0n0kIRfQVu5mrXGU3AwIlIxAbYOnKBLYDutX70Ek/Z51Cy9cXXN1X0LO38B09CJP5
         LEBKWkKqhVzVobPw2KJzlw3gerrGTuaVErn0EXRVwOArtNeVNOPjGwJyrIOR3gI9NqWn
         aBA7I8bfaJhogMlpJAmyUGhXURUWUhaENKVqfeg/fPD2RScZel6dklp8eDEai3p0wIT/
         cZrhntvanM8+QGNt7uRnuMboYvsDMzJW1M/Yax/LnPtAjRWCkcS9FR6P/NXgOiXo/L0e
         UvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649111; x=1788253911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nPKH9pGNIN0uovWjUe3KBZqHnZkPMpvVj2ffXJquiG4=;
        b=BlsU5NlsFBuszxFegCEnsPx4zxP0RAjm4gOLona4uR56keuz2cA1FoATNWEY6PkLxc
         4r37mapbXy9AYLdCjTz1dKtaQy/9bLemkQKzavG4TGPVugomPFA5F4VTO70NRCpDIXDq
         nKm9msc/D4bEKbxIcnLUKaZUdSKSNkgsVKMELTZR5BiUyxLnnDL28UdSWQ1c/QW1c9hh
         SmRzzIAbXWz2yLhCRexAK1OmfA/K7zlwSCZGAZ+BTqkYHwkfaKqLdPg0Fm4hI9t+itpi
         qAKMtBwVHgRcHiZpsczmSD4SK5Zfm27mOgA34K1OmtbFyt66teyj/ocnWGeWzfO/Yc2Q
         8e+A==
X-Forwarded-Encrypted: i=1; AHgh+RoCdfnsnvUActTVivBBdgkgIVIGjb+/FA3bLYir5BR9R+BEGBZewQkx1KA7R05y8kEKk/OHOIHJ+LgUOVo1dW3s@lists.infradead.org
X-Gm-Message-State: AFuF++mdvz0Z2F8fSjS+4e84asRsWDaYKK6l4xkko8H+pRc6SDowRfur
	xn0N9ffMjWzVsmXwTG8mDn3aY5TGu+fhJwHJ11sXej0w7ecFjqvDkARAIgyDwvc=
X-Gm-Gg: AR+sD10oyYoZtrX9m5Q+23GltHRPe5PJi02hZ6JcULRUVX7YcYveJTjBXuTgV1q4fdL
	VI3IWX3Zo9nTG2aprlUOOSzSexn5gLlvlP63CqoZRJjcJe43wKzvyFzfjz0IO/wtEC1t/j9AC23
	KDG811hZdrvu9+beO+NTEULIMPGT2BNtBy7/Y/V7jrs9Ydm0lZlDmmOEqlj7HMAj2t+M++0T6ys
	NUF4R3rlWiBYY8fsrStioG+6NIbyY4u7neWW9DX82pAIcny6RbjhZUAG2Nb1mDA7F8xO5pU2IMF
	Yxr09wu4M7Z9E38nw0m2XLVA0GhLOJrZzeO7D6XRYJYYRcYEgpzhec2XusAZMkDrCPHwvScX6GA
	/401GWtodu7lx/Y6Tt/Vr294LPwweHaIpzH4jNOQFzSKhDFc+OIYu2KLslKPleySnQfhpI13cvj
	FECuacY2aIqnfRvw6lITmvMPxD3Sb2jFUq8ckJZPCOi/CDSdcCKR7KP5Yv0tKMf2C2zInsuPIl3
	CnA3UzHW3Sn
X-Received: by 2002:a05:6a21:3b89:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3cd4bca353cmr51063534637.18.1787649111108;
        Tue, 25 Aug 2026 02:11:51 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e4b125sm1703846a12.20.2026.08.25.02.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:11:50 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH v2 1/2] memory: atmel-ebi: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Aug 2026 16:11:17 +0700
Message-ID: <20260825091118.271720-2-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825091118.271720-1-triet.hoang.dev@gmail.com>
References: <20260825091118.271720-1-triet.hoang.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_021153_413588_B82FA894 
X-CRM114-Status: GOOD (  14.38  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from the suspend
and resume callbacks, also reduces kernel size in case CONFIG_PM
or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/memory/atmel-ebi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 1e8e8aba2542..3b1246e9ed66 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -610,7 +610,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	return of_platform_populate(np, NULL, NULL, dev);
 }
 
-static __maybe_unused int atmel_ebi_resume(struct device *dev)
+static int atmel_ebi_resume(struct device *dev)
 {
 	struct atmel_ebi *ebi = dev_get_drvdata(dev);
 	struct atmel_ebi_dev *ebid;
@@ -625,14 +625,14 @@ static __maybe_unused int atmel_ebi_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(atmel_ebi_pm_ops, NULL, atmel_ebi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(atmel_ebi_pm_ops, NULL, atmel_ebi_resume);
 
 static struct platform_driver atmel_ebi_driver = {
 	.probe = atmel_ebi_probe,
 	.driver = {
 		.name = "atmel-ebi",
 		.of_match_table	= atmel_ebi_id_table,
-		.pm = &atmel_ebi_pm_ops,
+		.pm = pm_sleep_ptr(&atmel_ebi_pm_ops),
 	},
 };
 builtin_platform_driver(atmel_ebi_driver);
-- 
2.53.0


