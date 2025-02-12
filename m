Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0E9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RKVnOyx1/VLC5hIczSELZnSDd/twEbt35BMvF5Yzcpg=; b=nUyMD5kSK8OCj8tt2oIiOGkY+1
	iaapWRX9wSccbpTa2iMAiVjYD+8ze2Y8ZxPihNG1pgRbkXFjU1aAVrGMRNJVn6NUMhMDQ95fvzvze
	hKmPA8/kCW5wI8PzL5lizfD1tArjvpfbxL7KH7UqPNT1pGi5dAY7JgciS8ymIUhKdco+k5OI5BGVI
	nUyn9KrBaMXEX3ZKAqbttMffgMRM9edCzAyBrzymNnBnYkaajFyPVQPiq7RlcmFDHMbfrpikZioRT
	vMA00tumfDGMNSMz8s9ICLRm/pSG47wxVD9Zmz6LXSMI5bdwhxBQ9xXUDLGC2o4OxBg5UkiWWKFgw
	mRVJcJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKGr-00000008tjG-243f;
	Wed, 12 Feb 2025 21:27:49 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKFQ-00000008tWx-0upq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 21:26:21 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c05b700c03so2227385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 13:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739395577; x=1740000377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKVnOyx1/VLC5hIczSELZnSDd/twEbt35BMvF5Yzcpg=;
        b=V7flwiQYoH8LgQ2fzy8ZJ0xOpVxLB845KivcItNmiFkHaHKPYWA/bZzKSvY9COUgpL
         9QgqtFp9GM0R5MZ05Qp6YE2t1JMgDnxRD0RRDfMK0ei/ZHr14r3LY+i14UnAishXgf2Q
         8z9jDIOnV9mHFJ4JcS6J0ssFWFLfPhQhHq4MrNOIFjmbyYxc/TDtUYEOMeD/WrtC+p+E
         CMmLI961H51Ma6Goge7r8V7+mOtdCNYdz5W9hzn9kaSmUZLS80RPKw8gBZ/PphXaB/hR
         cqHsACYUw10WCf9qPT+A5oKrLMenCaPDFwc3VDPcmaTb61EVw6uHfJDsyFP4XoNSCUJj
         IyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739395577; x=1740000377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKVnOyx1/VLC5hIczSELZnSDd/twEbt35BMvF5Yzcpg=;
        b=RYUx5bzEOiIs89Nk5Lnmr3ZKJDkjb56UjLc8oqcMl9eIflhM8jsfSmdVUZcRti/zKg
         GVoJBcL29v/oD5mP1GN0XQ9dBZuk6nd+hiY1lD8RjYMaX/TJzTuEWpmzmPIq+/HYtisR
         CkixD6cAxDS1ha1w5KdDlTe8BvavegQCCKOGpf/M1QctMXiCbkc5ZHCumlsyIkeZh6xS
         VzdwXTviiBOsaZnJ/P8a7BR0zPe2mWoPFSlmJqf4ZkcieTf1BbClolpnnaSfcTA2KgjX
         RSFQ+jTI3wIyDJDK0LnQINodYF1cJYgDLjgwu1pOxcljUCRk1fzWUdDwY34U9tIEgohz
         4cIg==
X-Gm-Message-State: AOJu0YwOSMyOFCyWNCkJ0q80cDDGGmx+a6Uz4ZkaEeR2+Kqi+UzNSYoP
	ikGzSO1VG57UV9Jh5IkXNpf9f/6uK1EgtekagEbrjCzZ10ytv6VoDaDh
X-Gm-Gg: ASbGncuVlSimvdx8x+H/vQkWyfPfD9Sa5ZwFAUe4hLx0BCG3Odcexj6bPQbDiXF3Aqg
	LsS1d3BU7JHnfjtKPrt37Lvk7HqEsk57r2MpOOZL7Jfj98x/TBrVTGxE90f/CBwT4hcNTKsAtjw
	uY0qirjGz6P5JDPjgCDFJsymaRSE87QG5ky7p7DsBNy18w30wq+OBLfCWUAiNCMlQ2exn8bKNIG
	o9WfVG8CLoIf4w7WsicGRIv1M8DXJJUC3ePw+8oiMj68QaPWbtZkp7kR8JE30QE0t17EPsOfne8
	2YdJ3IIFo1Et
X-Google-Smtp-Source: AGHT+IGd1Y0JnSACVaZOKyKB72nc3A5B1D1EcMp52cuNwxHCQGYLp7nvFvXTV7+ixgZOYHfw/YEdvw==
X-Received: by 2002:a05:620a:1926:b0:7be:3d02:b5e2 with SMTP id af79cd13be357-7c06fe307c4mr265815385a.6.1739395577321;
        Wed, 12 Feb 2025 13:26:17 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0728eb208sm148719985a.99.2025.02.12.13.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 13:26:16 -0800 (PST)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	richardcochran@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] soc: aspeed: Add NULL pointer check in aspeed_lpc_enable_snoop()
Date: Wed, 12 Feb 2025 15:25:56 -0600
Message-Id: <20250212212556.2667-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_132620_261468_C475B523 
X-CRM114-Status: GOOD (  10.79  )
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

lpc_snoop->chan[channel].miscdev.name could be NULL, thus,
a pointer check is added to prevent potential NULL pointer dereference.
This is similar to the fix in commit 3027e7b15b02
("ice: Fix some null pointer dereference issues in ice_ptp.c").

This issue is found by our static analysis tool.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..376b3a910797 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_snoop->chan[channel].miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!lpc_snoop->chan[channel].miscdev.name)
+		return -ENOMEM;
 	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
 	lpc_snoop->chan[channel].miscdev.parent = dev;
 	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
-- 
2.34.1


