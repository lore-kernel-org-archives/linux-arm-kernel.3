Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6585C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=; b=CT+s8arW/SebxXrneqhlmwxgnQ
	Z/SEGiWNnYVYRLYTbCcJSXW4sOJnFsvJnZ44vAGkm2GF2hh6eUrvQ0htmd2fOf8BKe0WDlujU9JwK
	df5udoIwsDm3/b+zcAfPpw3uwumfvxkT/nB1CAHJhx8iMyHQF/sq3zolukn4p5yDOCgWJtEZETIxk
	V+UCUZA6QbvHzUihj0lL3D7EGO6lYIleZZa7lTlNuHgPGGVglLzWjGcT1pIe9pg+A8HDr7qdUR3/9
	90iUrD/9TxUuq/fzdtkGaxACkGry+rCGoz53P7V73fimf/VTatxsetprK0kh97pU0ChEs6P9dQRCz
	sRof6eRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRh-00000003lIp-2gS3;
	Sat, 05 Sep 2026 07:04:13 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRf-00000003lGX-1dPo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:04:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4859245e493so175384f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591849; x=1789196649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=jsHloE8EuIOJlCHDPUzYHpTEC3oR70SCyTKIsnxwBNzKK3gOyUAm1c8frT74j7o0CP
         ZPFDwbL2WBMiSrglmFkgu8K/kq+g6Plk/n8dNev4lESErcAJ6pqNHSoFy8BSZn7/XBNy
         NVL1Q5JxTVlIfT4eAvsAnO8e9XPJFyTTH5zuuLKsdz1XSYs5K/SBCR6LTon1V+W+tLiE
         l6BtXqOKF7YNBcq5ZwWruY1FpkPae2+qeM6MMlkNYZj4ujakZsbAAwRKTzwl7YXgbrWR
         T5uc/iSLH9jtum32pbJXPCL1AsWZNcAVGRnMT0J1zwvkhNPARpV5nROvAHPywrGujilX
         TFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591849; x=1789196649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=mhIJhaaoTNOajLbew+LVecyHY/TT39ZSkftP8bQMo/jFoagJwvoNYCpT2HJxNVnrLe
         ZFpHiigwCllRvB8gnceOQBKHok/MIN2QQtxtSAdGU7u+2q/Q/KBc4qZIL3Hglz5kDiT7
         bylaYXzNgGcGDmSSEgvIqugDeheM9AF6Hyr2o58XJg2e5YG1lFwzWzdfyutHNi1Wtdri
         XlV3RvX1wA4FZ2jcsRS10E37N/8Q5O9WmQi7t2VMWOwF8E54UjrsNlfg9vufiGAS3qOJ
         BCE+0R1LhVzBIN79q4O3xjkaZ2eqKrTLZBptF4uiWU/mSDG3vNMSkldeIicoU+XaPpjo
         sLDg==
X-Forwarded-Encrypted: i=1; AKwUvBw0mX+nAxUWm31W11q1jso3HZDjKhoo0nXFK6l7zkfHvxOVKpdeb8RZKcsSC3LGzrEUDnHRlZNVcbMc4YM7Hfij@lists.infradead.org
X-Gm-Message-State: AFuF++lRb/FTeE+pe7unTayV0oNQAbTQDJ2+KUAwMa/CiGxSStQ9Bvzh
	YuXWt4tQGXERPE8eYMR8SKKx3mUccDHI+bwfat734kkzx1tOm040M1fL
X-Gm-Gg: AYBFou0oh6r5ansMgsOcB9SBaHa2Mm3V60U1J/mTylf1pTVjBjkvBtYkz/2mNa6b7of
	43/7HZqKQuprF/aeqxjEDp6irNHAurJmTgXktQfK9GESvLBKgKT3YjvvfG9br0UxweuKKPvYwQH
	HPmZFlgjBFaNthErQtMTW+WBBfe+xrSLo5fs3Zq+Bp3nHGEixWWFVbsx5g2bu510NVaMueRryG/
	SOZTkYei3FRInxiEM7kbUbH/HGafI0GH5zzum7vDP5sw56xeJp0dPRLM1FIi78DnEqYWig/y+Rv
	Z43kKa4Ng9Sp7h9ydVYSPFT2RyJOo35275X/1blZUo2o0Ikc6d6DYuQ2anN79l78NKFz2AuiVIX
	IG4WPxDyovvRWVt/53E9OxupmagDM/wCvGCNX4PLeoP26P334wkSWfHb+LjlDdJxwj7KIHUWtK4
	8nV97VVeY9IKHjD1DCf0HNPCv7Wu5FJWZ1ABLsSSIQ/+mUYr7F5BooQSHRCBGSPsrjd4ki9L57Q
	bDxWtJA8kL0KSGA6NjlDAvbefmcYyJ5La/WVsMgbjlvDihLK0nw0ZcwVR1SSDz9kj2UydU3IG8W
	tvqDPCLh+o+FfdqpEjwKdSQPpm+h0H+JVZewH+OmWj9BJejgRiqQs1+p3NWhe9P/IBgjlfbO
X-Received: by 2002:a05:6000:46c8:b0:484:3f43:4914 with SMTP id ffacd0b85a97d-485872a6622mr9310761f8f.20.1788591849363;
        Sat, 05 Sep 2026 00:04:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:08 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 09:03:46 +0200
Message-Id: <20260905070347.25902-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000411_446868_1BF8C7B2 
X-CRM114-Status: GOOD (  10.56  )
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

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0


