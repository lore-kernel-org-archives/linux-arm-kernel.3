Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D17C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6UtRGrc8i7gPdIHBxc2+2pdsu0ewzutkt0VHCMy4kXI=; b=gz8o1JJZV7nmM0/sUlKbeSQgUZ
	ULBJqb0V9B6aAY3XYP/FinlJgb/NCwNytvRETXuATipEOgK5Gw1dWQ0AJLsdDkbFPVgJnBhDWkVxW
	2K+2MuzIPRX6NlaI2+pqWhbPoiE4Aduu0QXJW+ZZJpezqQp5X17JfXEax/os/a7UzDGfL9WHXTZpy
	4LoIF5ojsOJcgVPX3/4xi1zzXw/gHETGi6PiDwhK2oAV6C2v3NxoWvrYEj9jip75jn2633lvWDVZl
	Vnf5H04q6kO7uVAxAJxM4/Nzt889xjoEkpuJRkXjfKXaC6Gw32CXk0F462AAKhkVnkGPKEuJNZfuu
	f1bmQQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGvE-00000007Wa2-0YAs;
	Fri, 07 Aug 2026 09:31:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGvB-00000007WZT-2tnW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:31:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cea3004256so40083915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786095081; x=1786699881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6UtRGrc8i7gPdIHBxc2+2pdsu0ewzutkt0VHCMy4kXI=;
        b=SBUrtPT9Km65cgh8reYmDh5Vt6rz7LZiTsyh8kV2eFIlTDRZpniXtWVvaQZWgI0mPQ
         R99IrdHZgXH8VhZdaA3caP07f4S0YZ1SV9PTl0y2hYds/xsqSjaI0pFXcttowsibP8Zf
         mfHcUYI9lJgiKSbwZHUl8NnwKJZZKUTv2TYuDu8OBGeHSrOzsxhn1docgoGW8tg0mWpo
         O3EbPP13Mf5PUId0zluvP+za9s+3daDsbBo4KpaNQN7lZrhx4HKJB4dhWnilnaGsSdkw
         /ydS0wcyB0hEeZJ5YDVdWLbf7gLyBsRucuW6IszPjwL/GQxkg0+nsL6s+FdXziCJhx8w
         Dd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786095081; x=1786699881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UtRGrc8i7gPdIHBxc2+2pdsu0ewzutkt0VHCMy4kXI=;
        b=KBRF5hMEu9Fb8dIVFnjQFpYKrZJ3wq1sRYg3r6aAFNGn17+oLdBtgGjNa8NxjPaU9U
         jkFE9nUBgpUr0B7UXeNsPkkzY5NeQBqqyVkXLx9WinhmKMm2dHCewUvZU0yCT33efPQ5
         vo1ysgirxvMrvUvil7nsVmhILO/1F/kpffxDPLwnjRooIkWihMI0RivjInUhlOMqtYF+
         Dlayzdpqy3XFUkFNFbWZI99C/lB0AN04ihtYiJpJIlUKKFEq0Q/r6YcejvtG29ZFr3KJ
         X6RmrxqoUIsmstUbxQJ/p062E7KS1ppHl6UE8hG1s2oVVjQ7TeWXihRjipB5/xgrYs1Q
         2+qQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4ZY/itTTty+9ifcjaVBB9sYC/QW/AGZ/wBz+enyEyhE2UW4GgzNicUGpLm4AYcHYDCqqWpeoP54AUnATtIDQ3@lists.infradead.org
X-Gm-Message-State: AOJu0YxkMmh2kYNRF/3WokXoOZi1sP5QIJPFG3grYRYG7o03HIc4OyXs
	T4FP4LCzAX0am1iIISpar2JsSKDdYF2KCZWYNKKdSyD2vZK6JHHkWwKP
X-Gm-Gg: AR+sD109QV0vekwxe7xd1NcdDTQ/Tav95xr81wFSYd7VZ5uLTGX3IDESY1E7Kndd7vF
	Y3jVEpU/jrpuieo3YgMPG1ReFhpmm1pplpQxwLOHPJiaiCfpB4k4IoE3kgHwdhZHtkJhV2zoiOa
	UvVpNh9oeaBL+ywZC5esNpvfh7iGnkc0BOJqjFLZviAr556faUp8HPFelmX48Y6TSxu2/0ce96E
	ZNdW53FqC/9xFHGDipvUUNPtBa21CitPUOaPHVaDdTKGpLCw3w1kiItxVf723GwWNqHVQbsBqd9
	aKUG+Qbeg7yiEtON+IPhfd+3ahDnhXS0B8qjIKsfqkA0uTHMjqjbFa1gOEHON5tp/uogMIeUrVS
	3yjvf37cKTZoUc3xLWA0vlq95PQAMQ0H2jt8bFV49Kdyp3ZTghp65VwykCUzabwvNl6JLD/mWpP
	uEs4Ccaw0BSBBC1W63fb+OA4Cmk+IXTdTxqBUm0m60/H6infh7zhlZ/Ng/EVnck9s2wpu7VuCpV
	FgZbcBz2wB8RNEaeY/9oajPumG3eyUea5DITCswJJS0skoU7ZCmdLRXwCEdLH0ON8YEFABaDYIA
	GT1g
X-Received: by 2002:a17:903:18d:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d0ca759b87mr227230365ad.10.1786095080818;
        Fri, 07 Aug 2026 02:31:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccd8f1bsm6347525ad.25.2026.08.07.02.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:31:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	niklas.soderlund@ragnatech.se,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:30:57 +0700
Message-ID: <20260807093058.42840-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_023121_732204_5E3CFD76 
X-CRM114-Status: GOOD (  13.20  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns -ENXIO when the optional IRQ is not
specified. Treat -ENXIO as a valid absence of an optional IRQ, while
propagating other errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 94804816e9e1..6204fb163ad7 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -491,7 +491,7 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 
 	for (i = 0; i < 2; i++) {
 		irq = platform_get_irq_optional(pdev, i);
-		if (irq < 0)
+		if (irq < 0 && irq != -ENXIO)
 			return irq;
 
 		irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",
-- 
2.43.0


