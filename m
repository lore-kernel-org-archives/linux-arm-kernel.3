Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038A4C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vCob+FZUcKF6Rewr+4ZqyG5zkKuKpbnhgU0UJDlmA24=; b=rTKZva2YFAcgV625OpHrzux0MF
	jJdfH1y2BrXq/8yKItzHFXhvOrMSRSoZ4v43dUfndcXLVrWRtpcB/GQd9FfCeduGKUsMHH+NY1fUT
	bfBNvSdS4I/B11bphhGeFAtr4FmsHn0+dPjrtlrHFkVvKhc7AVXXkoQ+aMB11O+efRCiR/ZIWFWol
	WvXjydR1HUew0pZ/zSIQkxV1eVZpoNZK4Fvff/ngQECmYBs5Br2roU7LXeJTzcCKKnACiSnZC4jSn
	A8HvC9EMjXQ6kLOn2sbJGHzEi5zkJ6qgCbbGORcBqiBWn/1va+uHi2s2+MwolmWnh7HVZlU7xMr+c
	oxrwceRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeZ7-0000000CooX-2BK0;
	Wed, 22 Jul 2026 21:33:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeZ5-0000000Coo0-3azl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:33:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-495590dde14so40640995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 14:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784755998; x=1785360798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCob+FZUcKF6Rewr+4ZqyG5zkKuKpbnhgU0UJDlmA24=;
        b=OetUxstRrrbVcOu264STT+IEy4PFUiICuT7NvCXVP2ivc7O/ttwZfpzG7EqgiuEwZN
         Dnv5y23QvJlYeSO1SjLsYNu2HXa3cjGgHr7UtM0+BiXlYh1iUdfcSpl+lwuEt19PXAhL
         XALE7o9ciGbZRpVyfka1BvHX/TCtAc49yk6/oIrZ0IWZsbQuE2nVEhzvo3Pd5/p5l/u1
         3kaJFeXdkEy7giQ19G7TUIXcdBxDqyAGL9x+PcRjdC5lcgyknGEeOjQLEiCJF17jXX+M
         KfFHQ9Wh5hyOYd8zoZidPt1B7H4Mr589D6PLX23dYyCft7EXDGcXN51vABo/5LitQBtM
         NcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784755998; x=1785360798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCob+FZUcKF6Rewr+4ZqyG5zkKuKpbnhgU0UJDlmA24=;
        b=LkBGPXuhp1piLTp7rpmQ0pKdByzXr4VuWfwg8dHKCuOHpf4d+B8G7Gq8UiqXWDNZh9
         00hxoYfDFCvdvjrCbvgxennjgXUlsVdwMNbdghBPcC3SQ4l7Y2frnFAZddmJRC3CbAGB
         XrUaWTSiBGbFSSDpYgTLB7fx1B9l+Gshwc8dwlMNPFRcIFMpxCd0dkkmaA6HfRv+M6aG
         veVWa/0aZg4lTOSQlwa+xN9WKHAyA4KjhbI/L4eOu9PbbGpM4XOhaJJRT/vm2II5ChZx
         rbDtwL3b2C7P9Z7Mq2KpTO11khIC5h03pxSSXPPo5lKQA1w7a9A4aOILZUVsxqZzOJP7
         +MDA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7LohBUlV7d5L8WAvARj7+M3mZeGNKmUalFLQYiPzQG5srCqWrMC3FVrBL+Q5D3L+YAq7ZYh1C0Lg5JWJ/4MKm@lists.infradead.org
X-Gm-Message-State: AOJu0YxiMLKQ1Jjzz6cE3m7+QGUdmvzP3914kq9P4Jm/y33ulZuqUfnv
	Ok7oy46NpHX0dMwYQxREn486X/xNxUPGpgr8GWf4RZxCYI692cjW2Tv9
X-Gm-Gg: AR+sD13digb4bglQyupuf5vhmhEeLmHRbdetEPMKzlPPbKQ3u93TFEPW+6Ezocwdd3s
	N64cuhH4xytQCQRiXBuBuFVBfcdGjvy+pV672xM+JVXtZFDEq818bUOWwv0sAgLFRs0QCkImYZM
	DTuaaEg4cJHviZBluEnCCZQAyqVWY3n90NPa5zcoNaN9G90zw88OQ5LWjFYfwjzLWB/1GB337Fx
	uNyYARQbUt1bNvJpIxVrcSkRYFQu0skMQrNgwwzqk03DoVDjPGlinYGuGNW/Wo9F1LNS74H2LXS
	EzuTgqEblmtCxCZRo4n8BWBa50WJatX6RpViismErBgFPRPO8QOQNL4NbwuSj+XJ+ViH5myBDMs
	fuoZpOAhuAEZikrtMbmyTpSD0esBSqNsrBDlRBNqbsp7/B+XWRlDoHUEwNyzZY6I+MSQEXvoOP0
	SgTq7tShXC6IMgSUyVXjCMm2Dkb6SGydheO9L+ojWYYqVyVeNiVYloswtihFV5RrbZ/A==
X-Received: by 2002:a05:600c:4ed1:b0:495:5d6d:9cb3 with SMTP id 5b1f17b1804b1-49573d13756mr3467475e9.37.1784755997906;
        Wed, 22 Jul 2026 14:33:17 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c7880dsm9358636f8f.37.2026.07.22.14.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:33:17 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	linusw@kernel.org
Cc: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	kernel@pengutronix.de,
	bartosz.golaszewski@oss.qualcomm.com,
	andrei.stefanescu@oss.nxp.com,
	khristineandreea.barbulescu@oss.nxp.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
Date: Wed, 22 Jul 2026 22:33:14 +0100
Message-ID: <20260722213314.155310-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_143319_912013_2AF53CFC 
X-CRM114-Status: GOOD (  10.90  )
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

Currently, PINCTRL_S32G2 selects PINCTRL_S32CC which needs GPIOLIB, without
selecting or depending on GPIOLIB.

However, other similar options in this subsystem actually select GPIOLIB
instead of depending, so I think we can do the same here.

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
v2: fix typo in commit message PINCTRL_S32CC -> PINCTRL_S32G2
Link to v1:
https://lore.kernel.org/all/20260722202638.135277-1-julianbraha@gmail.com/
---
 drivers/pinctrl/nxp/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
index 711c0fe11565..fab725f250ab 100644
--- a/drivers/pinctrl/nxp/Kconfig
+++ b/drivers/pinctrl/nxp/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_S32CC
 	bool
-	depends on ARCH_S32 && OF && GPIOLIB
+	depends on ARCH_S32 && OF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
+	select GPIOLIB
 	select GPIO_REGMAP
 	select REGMAP_MMIO
 
-- 
2.54.0


