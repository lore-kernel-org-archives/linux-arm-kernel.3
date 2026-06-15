Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347F8CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 19:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=isk5VSArpp3IPXJC+2cOjheoQad/XTpBKsU9Gm4z1ws=; b=wH5iwHWUEe2BgJs/3xpG29Sq//
	1o//O59Sh7obW/hLQqZBzUM6fA9enJadAHJZMZ7iOrvKi6W21DiSir9mO7uhBz/l3yxQ03AhkglbN
	I4wBp2uj322jxaywI8VxCgGSIUL5jNi8JBT0AWG9Pok1fQf9siiei4aGThHFM7jtVmliz+2ZDQpvJ
	IQNbuQzd4CCiKVaMWrqmdky+sZDxJAFR4+wzvb9dq8clFOQQm8EZfAD+k6hZAtpDnuCa3sVO1K2Jk
	8hERQ3WTQQjZAhvYZTQGuoJfAL1rIww37l20wCMEI5Tpfz/slkGvgxyPai5S7QCf7u+e47zxF1K+L
	C9d9JI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZCjG-0000000EluM-05P8;
	Mon, 15 Jun 2026 19:12:14 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZCjC-0000000Eltx-3BAQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 19:12:12 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-9157f7c1c0eso401182385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781550729; x=1782155529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=isk5VSArpp3IPXJC+2cOjheoQad/XTpBKsU9Gm4z1ws=;
        b=mbEAiqNZTsFitaKUeXlzb3oKrK9RGgMO4B4zmt2oLYLGkb1aoyDXNX9zoiM0sxhIE9
         JVYqCC1tFH3CmJxG30EPJlY2X5Knmr9I/+vtnm0z+vbKgNnHj3D5H+3dmzGxRnBXn+a7
         yClQdcUE57xEloUAlm8YKlgIe4rVrhtnysgxkRWnkMGQP06k5VWq0L71tp62E/rJD+p5
         SFnH9x31Gjjvl6NON8YosLdoGsOUsODeDNmxaqzvGC31TGqKe+sqjNvlyW59u5KgJKB7
         KwvB1LOD98wn3Eo7qyKemZIKT/NlwNL3Xz9vhXq6ZS1VIXZOn7Z9HKD4Sy8tbW6AOpnb
         +9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781550729; x=1782155529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isk5VSArpp3IPXJC+2cOjheoQad/XTpBKsU9Gm4z1ws=;
        b=nkdMZOa+UXC1fQhPl5T1kT8x4Q61jtAkZWTa2tpEdQzGfXBH9s+w7+xBvO71HUUsrS
         DCFDypFiFoiK9N7+7lZSzZjG9vLHEMOiD1wTqm1TFC7nPkXTPJqrvBBSqrDUipw5FP0B
         D1aWChN/KXeKyA2GqhSe66V4RkrH4dxdO1TsnH/216gsrjKM/C9ZR+AIN+MxAtrWJYBv
         WcgHAp22M4WvQG4iuJFzSw5u7Fspm3EVFXgQahMHigoTMp7ZdW9FW8WNVB81ZRIKn0AI
         rToVVBvNQXNsM9aANwAuF2pO4gWZPM8omIEdnA1g97MtORLR2djLudvwqCnhdZZvRQQE
         QCEQ==
X-Gm-Message-State: AOJu0Yy+hdcWCRD0Ulrr2VSkCf0IqET75ONBR8PntF8ssgZ31tusAI1M
	L0Vz/g72mIAU1n5RbothDis+kvVhxNcVM40plosvXkTQp/uFFv4VQA2B
X-Gm-Gg: Acq92OGwKmyqjDIsWm3NLw/Ax76MCC9GfHUe1G82pXdBttg95f++JIFzQ3i+RMXe9TG
	KDt+ZPGhjk4PDuGdmOmr++pdcpPq7hcb8+UAd2nOm5Ibuarrwh6OVAEKrHkEeli88CQld+1Lrl+
	Ub4OkRDEzlEUJSMfAu+ovEtvXynYGUjABt6HXMd7+m5z/LCa5GDQ0UHT3Ue7bukKwN/Mjx4zA2U
	61LyY0Q0GsEMVLWTUquy+ny/7JnhbjMknLhfjtX4DIRraIM1pMiHawBylwEVsojL1INzloXuNiQ
	im3j0kbVLpCVou4+kcG6mRU3YS9Bptb8hWB3U/kBA2tdTOJTviry1gCuq/nDyPleiu/Nht6Is+Z
	TgyPOR/EE1Q9aJhhzX0fqvpBBMt9SRdfKTAsrhQkBd6/vz9pIROfpH0Q6qxinN5uSrWv3+5iGRz
	9dw+151ip0dHoK0LRsmvO30HJK1RvEd8vr1lEbaPLGN1S4fodNFew=
X-Received: by 2002:a05:620a:19a1:b0:915:7f9e:a407 with SMTP id af79cd13be357-91c42cc5889mr69673285a.0.1781550729435;
        Mon, 15 Jun 2026 12:12:09 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm7547046d6.4.2026.06.15.12.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 12:12:09 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] bus: mvebu-mbus: Fix OF node reference leaks in DT init
Date: Mon, 15 Jun 2026 15:12:05 -0400
Message-ID: <20260615191205.738388-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_121210_805304_DB4BC39C 
X-CRM114-Status: GOOD (  11.39  )
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

mvebu_mbus_dt_init() gets the MBUS node with
of_find_matching_node_and_match() and the controller node with
of_find_node_by_phandle(). Both helpers return nodes with incremented
references, but the function returns without dropping either reference.

Route the error and success paths through common cleanup labels so both
local node references are released once they are no longer needed.

Fixes: 6839cfa82f99 ("bus: mvebu-mbus: Introduce device tree binding")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/bus/mvebu-mbus.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index dd94145c9b22..61301beeecdc 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -1265,23 +1265,27 @@ int __init mvebu_mbus_dt_init(bool is_coherent)
 	prop = of_get_property(np, "controller", NULL);
 	if (!prop) {
 		pr_err("required 'controller' property missing\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_np;
 	}
 
 	controller = of_find_node_by_phandle(be32_to_cpup(prop));
 	if (!controller) {
 		pr_err("could not find an 'mbus-controller' node\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_np;
 	}
 
 	if (of_address_to_resource(controller, 0, &mbuswins_res)) {
 		pr_err("cannot get MBUS register address\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_controller;
 	}
 
 	if (of_address_to_resource(controller, 1, &sdramwins_res)) {
 		pr_err("cannot get SDRAM register address\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_controller;
 	}
 
 	/*
@@ -1312,9 +1316,15 @@ int __init mvebu_mbus_dt_init(bool is_coherent)
 				     resource_size(&mbusbridge_res),
 				     is_coherent);
 	if (ret)
-		return ret;
+		goto put_controller;
 
 	/* Setup statically declared windows in the DT */
-	return mbus_dt_setup(&mbus_state, np);
+	ret = mbus_dt_setup(&mbus_state, np);
+
+put_controller:
+	of_node_put(controller);
+put_np:
+	of_node_put(np);
+	return ret;
 }
 #endif
-- 
2.43.0


