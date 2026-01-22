Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA77CA5FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xQZZgVs390syIeeLAieQiTM2YlIjG8t0zH+VmlGeom4=; b=HNgFUubfd47lFRAZj9dONdxFot
	sYxe1jJ996i5BCs1n5Ik5mJC2qdYM8UpXgV0mrLlObfgNjGN0JDHdNYgpcE95tRl3WOUZWbgH0u5+
	gFac4S/vZcoPHLfpfGGkjCX3y06rjeuH84WFI6FSzxr1NEiRY6oriHRaij10joGiAjQxWuus1qTMX
	Sk0ixsZCq7hNcF7Y6cCPm/KROg20c+uDouLqEOwEgI8+rnHdaYhOdiRHKWjIpv0IJpYyS//v/oxF8
	Umh5WTPF9LIvyEHSVFb/fFYtoyFl6bV9lZMZpP82Ysow5YtAGFNxmW9uqUUjoeVrzbMG1gNfdUcOB
	8KFYuOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitsE-000000073qN-0sqd;
	Thu, 22 Jan 2026 12:33:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitsA-000000073pq-1sR6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:33:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0a95200e8so6684665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 04:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769085193; x=1769689993; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQZZgVs390syIeeLAieQiTM2YlIjG8t0zH+VmlGeom4=;
        b=bIh87XOilC+RSiNDGrLd1z9WiktV03560tZawnREEykA/dCMYwEet+zEgPbxLeTE5Y
         ILFjkEzLk+nMQ9/ygZAjRwtaq81op1JW+OZI6VzNPWN6foK4RYbzatADuBqtsEX0tTrz
         dHVxni4rA3ky9O5iTPjrOjcH40Z1TSPym9hKGVNY4IzWF2IRy4x771NLeKLL8o9/QUar
         fVecGCAP8PLSK7FY+nviRMYJNpEefTVrb6Vj+gqg2v9/y1kZFWZGU2XICjkQ9DsQ8qys
         NwpIdE2IgOqS+wt4sCprvAaY7TdFGGueXLZHED90+4XrkwnpRziCXEilLvOXRk/z3yLa
         3dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769085193; x=1769689993;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQZZgVs390syIeeLAieQiTM2YlIjG8t0zH+VmlGeom4=;
        b=eiSAiSC+n3iRiH902UZZ5YX9boG2USk7EEr4atGSKkzAgpdM/1Xuk/9QUPAlF5h3cr
         0P2YLq9Wd5vUKOOQRBZHXVThIqPx+QGCbVc8BHdK5IYTNpWrDHQZm3TSvvOr7lV4EjIO
         XJUwZEO85ye56XrBUyJ7RY2lkTvW3Mfr9Gq1JAElI1EqjRsY7yCHAGNQ/jJrXVWhatB/
         B08vMB6MhkLOGYD0cVwAzhD97FmfI+lnnpd9LruJoMrasxpIbYBVv+Tpoj4Lx+JBmWmi
         veABg+9bP9TUxXwqqkgIhVIJBGkpHumGzeyjPaHRBqNZfvLVhvbgoXzsWoMLjjBKQEid
         5NIg==
X-Gm-Message-State: AOJu0YzqitCqeP7UglEJhSgfdY/PvSbLnwz377HBPzBBD2RRJfrqTlb5
	TqraFUdVodR87o9vVn7B3DDrTlbyQNyMNKN7JrgrgoEpvzEIp+imfKRL
X-Gm-Gg: AZuq6aLFqxwdLppnxW5BdiNt0uKK4RSa09ZduAyY+hIksK+ckiaa2wxDttmkoM4hUlA
	lwa8musC4ohYFzf6X217sFv0aFv85QMuNTLa7IjP4lzyMSoy58jwLKqSZuwagTnNQv3+tIVW0/s
	sO2aOI8ckLUYdOBbustRFGVrd9Me8C4pik50P92LWlqHoEcYBunfUHcy4BDZc6BrhiuUcfRpkVY
	Rx3uM/NgUw8+gnJ12n+z3pBgyxYGVNnRfWpSA342olDLXpCOzgXlnnzwkrb7QtigdiEThHm/6iK
	zKXL/+/IzhlugJM8uJuZxS9lUWw/HVOcqf70ibqyejjgC9dTRJMZ/89U4H3yYqoLKeAAYdtu8i5
	Qqxpo/P0Lvm13K/EP3Z1OgSp7bPZU2hzGsZc+S6r/hO7V0O+vduOb3dS4zQiN6gt1pl3KCPJT7u
	hCR5+gR+MIJzmpYCEXHEAoyH3jV0jjinEQfc8=
X-Received: by 2002:a17:902:e884:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a76b05aa28mr83053045ad.41.1769085192796;
        Thu, 22 Jan 2026 04:33:12 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a751b94562sm84090365ad.53.2026.01.22.04.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:33:12 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 22 Jan 2026 20:33:04 +0800
Subject: [PATCH] bus: vexpress-config: Fix device node reference leak in
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-b4-vexpress-config-v1-1-3f0c85bc4730@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP8YcmkC/x2MSQqAMAwAvyI5G2jigvoV8aA2ai5VGpCC+HeLx
 2GYecAkqhgMxQNRbjU9QwYqC1iPOeyC6jMDO24dMeNS4y3pimKG6xk23ZE8u4a6lnxfQQ6z3DT
 903F63w91G6p9ZAAAAA==
X-Change-ID: 20260122-b4-vexpress-config-1d2051861d93
To: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769085187; l=1470;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=1rAycEHla3RjCyPALY8h8XRG3C11PugsrHFuhn0s6jQ=;
 b=WwxNYfmNqBmYfjMdHGXC9MP4olFJe+UcC4IIBJs7Tz43v3R4QLBOJXKSdq3uoSG/R7LmpxGoG
 fqMuov1v51xDzctpGTPzsrxRMKXhUvLu7KBcLOpgsOglFhzNISlciP2
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_043314_520177_98B0D953 
X-CRM114-Status: GOOD (  12.73  )
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

In vexpress_syscfg_probe(), of_parse_phandle() is called inside a loop
but the returned device_node reference is never released.
Fix this by using the __free(device_node) cleanup handler to automatically
release the reference when the variable goes out of scope.

Fixes: a5a38765ac79b ("bus: vexpress-config: simplify config bus probing")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/bus/vexpress-config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
index 64ee920721ee..a1fa583e9f5d 100644
--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2014 ARM Limited
  */
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -390,9 +391,8 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
 	}
 
 	for_each_compatible_node(node, NULL, "arm,vexpress,config-bus") {
-		struct device_node *bridge_np;
-
-		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
+		struct device_node *bridge_np __free(device_node) =
+			of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
 		if (bridge_np != pdev->dev.parent->of_node)
 			continue;
 

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260122-b4-vexpress-config-1d2051861d93

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


