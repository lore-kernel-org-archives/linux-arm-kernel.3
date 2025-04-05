Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D51C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SoQfJRPHunsbNr6uBql3ChRC57ynqxjZE49jEW526Ik=; b=MOEb7noO+t4mQJoDKOtRhB4yI4
	jNqkqhF91UMgY8VWFUhhLq/BHoqxT7ihwzpUteYJkSq0fJ9+v8dZu44a5a32ha80roIe6ofgxWeq2
	e2gdbIWJnS/dMdFq9vq7rgM0OfCDjfh6vsQ36NhjRxmtaXm/dfTpFf32TpDo1SlQw8jb3Qja0cCUQ
	1gNfA/xWvCeLRtdYLvIVTsgaBFRFj+kFXE660LzcT7C6l6FgKdcAxuUhsObHWgp5NzFWJKGT3g1Ls
	5wQfudTPfQpLY/d8EeP1CEE6Ebuz0s74qv8aEjZqhBhrxhPgtZMyE7w7YSLUfJGxIvuf2hYPL02kT
	1D947PRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u11l8-0000000DtzT-1VO1;
	Sat, 05 Apr 2025 11:32:22 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u11jO-0000000DttP-1ITC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 11:30:35 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-736b350a22cso2438999b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852633; x=1744457433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SoQfJRPHunsbNr6uBql3ChRC57ynqxjZE49jEW526Ik=;
        b=JyzuAYOUKmXWsfytnp5Vu2+fDLZL5S8Ul22W6yTiPVa3CfBhEWn5cj41JINLIleJBU
         79XzplE/9El66szdk/Ua544Dizk1rwmIRkYEwdpFf+c/anB3D8Dh0KEi2keOt9fM0VvE
         Dr5ZBPxDWdczGaYmfB1rle6g4/ganZ5OsuFAkLyEKclQpZ4hhH1gjIyBhxBAg94J40P1
         deFmyGkvt9Kj4elG126H0e8A1tnUrWDEpzGDLcWZ8+vGrgat/QYoc1KpdxHDZ/iOdkuT
         URhtxe2UDVQysu1BwTR+hunV7qUJ3K35eH3t5V7UPPOXWSBYoHCd5X/DZ3rqbhqdBLWn
         nhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852633; x=1744457433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SoQfJRPHunsbNr6uBql3ChRC57ynqxjZE49jEW526Ik=;
        b=xURllwU8yTJHUsWUkYz7r9oYvVmK1J0181bRHqjMXaUYTxiEW75Vj8qFCooMUZJj7g
         b0/H3GZ7aEgTtbpO5T9fz7/KlUcLD1A9cput/onZyShZDDQloFSBB/XE52XzUAoC8G0R
         6cPP3Pwl1Awkcm0i1shN7wxb5DN2uMMtskfRxTuNWV0EBQCA9elc/huLQSJWm2ceO2Me
         MLphqOshPJW5nLIA5I6VY6yVmLJ3SguyzZt3J+AC8vKdRD3ijaYRiA9cZ8IWInLOkwSN
         5ImZ+LbuP33n5vYGaK9jwdQt+TC/vI4xrTRcR6Sm4U2kB8rbHKEyEZ1S1bKd8PlXiU8x
         hdog==
X-Forwarded-Encrypted: i=1; AJvYcCVtaaa4dgWGM9hqbsVfVUvg1jKAuk/qdn9xLkB6dhYGpQIc7/fcjPUaBfyU5IJKXYyo1EhcWFPZyXa0W/MiKr2G@lists.infradead.org
X-Gm-Message-State: AOJu0YwNwDOTMSnRnOFy89iWwbhIpIeD4UcDaqnT/PZoI+JN7rwFfBz7
	yHLCHj60r83w5OmVhu3p5HiAn1JC4mU20yDITdSprHUyg3YK6+w/
X-Gm-Gg: ASbGnctg7g8kroHIVoVB4F3Gyw9XJvwdwXTjoHQGgN0i+mwUKlk76+887GpWgn0aS0F
	QvtQ+yRfLV7D68dCSzbqO6rdnGnIBh3OGFf/fktQyBYTG5VIFd2Y7HhOdwToC0yqb+0UnevXnVq
	cMI09NkuORZZ/djaZJrqPfzvw7ne17ibmYB2j8B2oR8kZOiUqI0S45/eyJMAtdGE6UvF87X4T2H
	wk50Wca3JIxfPcKGFaDouJiw3HTbtAhyC4iqGnRopyi8Orp/0QRAjl6weK7RnavDXHcv/+yoBR8
	iWJWCbRowx/+4yENtndEEcXoVcpaPSwPJVlYYe+xy3LTlDCIv4cNyIPOi6GMmuIFxoKi
X-Google-Smtp-Source: AGHT+IG3yh2rev0TOr9Xa1tn7dlPnXmv6Sk9wM2sX7rVbQR8YnS+sCVDoP/A+k0aNPhcL4ZnjR4Y1A==
X-Received: by 2002:a17:90a:e18c:b0:2fe:d766:ad95 with SMTP id 98e67ed59e1d1-306a4860a03mr8905930a91.9.1743852633336;
        Sat, 05 Apr 2025 04:30:33 -0700 (PDT)
Received: from henry.localdomain ([223.72.104.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc323839sm4299234a12.30.2025.04.05.04.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:30:32 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: gregkh@linuxfoundation.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb/gadget: Add NULL check in ast_vhub_init_dev()
Date: Sat,  5 Apr 2025 19:30:20 +0800
Message-Id: <20250405113020.80387-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_043034_345858_42B73D95 
X-CRM114-Status: UNSURE (   9.15  )
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
ast_vhub_init_dev() does not check for this case, which results in a
NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Cc: stable@vger.kernel.org	# v4.18
Fixes: 7ecca2a4080c ("usb/gadget: Add driver for Aspeed SoC virtual hub")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Add Cc: stable label and correct commit message.

 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 573109ca5b79..5b7d41a990d7 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -548,6 +548,8 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 	d->vhub = vhub;
 	d->index = idx;
 	d->name = devm_kasprintf(parent, GFP_KERNEL, "port%d", idx+1);
+	if (!d->name)
+		return -ENOMEM;
 	d->regs = vhub->regs + 0x100 + 0x10 * idx;
 
 	ast_vhub_init_ep0(vhub, &d->ep0, d);
-- 
2.34.1


