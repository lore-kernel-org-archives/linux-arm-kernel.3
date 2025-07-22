Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECFCC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJLkThqv/dSOl8n/5REBMN665eVsmLLXtOyGbSyEBng=; b=ruOxX9pUDDOt16RKhyUIW3D2Pe
	s9ikJ6+Q7WhgmhezCccUdzMEWTgS9HnpHzrfI+m9k+O0nHRbFWZmkPy3NkglTNcJmiUg7syKdX6aL
	gV1Ic7XPAgdIZYVYxFRoFX+NOdluAp1VOK5pbOUP6XlEU7s3t8PRQaPemmC01IwoCbRCZ64tnVz3P
	tlIVGDz067QHE9ZWG/Oj8g2xdnbeSe98gIXKxghaz8dfKM+0+T99zosvxXW5AQW6Q79AQmW00M7L+
	x0rIDlHTr+nAnTPtH+G5K7NrIJ7dbIECuXDCfZiVDnW+1Ffo5SYblHWS/nHQRx0bm4BBuWgSURMo8
	oYVaudvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9yh-000000027qN-36Gd;
	Tue, 22 Jul 2025 10:12:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9ph-000000025de-2hfz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:02:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so42817895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753178567; x=1753783367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJLkThqv/dSOl8n/5REBMN665eVsmLLXtOyGbSyEBng=;
        b=cPGWSzyTQLVO4NMHq/P4d6oPzwSn6Y+oBvB3NdgSRM3U89rFw7Nwoh0BGTKwUKRosy
         SKBfJ/dE81XWGbFHcQboyO1f/dcMFeyyC5b+I/Jj6wCNIipe3sA/4Q0kqmR9zfSKulJ9
         24KyQJZAFNflztWG0qoGt0nJE2DmcTC31rIgkGJSuryJ1Taac2za/ZVQNRb141U6s0Z+
         QXRWuvYbAPDfzh22yyGOHB5l31x++U2YDq656evQDIw1PecT8XvWGmR92V8GXtepYKC5
         0BbFdEZUY4kmBFsnc2GbVCwAJSpCl0JyZEWof6kjvpRl23YD0yoPx3+kwAHdt9IXqBxG
         yxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178567; x=1753783367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJLkThqv/dSOl8n/5REBMN665eVsmLLXtOyGbSyEBng=;
        b=p7W05+BUpsrAP/1JT9WpE6YsWgnKUHJvZaPrjmo8Cpp/IIZ6CQT75nw/ZJZFolGTDC
         rRkYd6U/7f9d0xrn92nsA4e4yEJN3n5x9FutsZpRPF9QBTKe66myIbwcV3y/evlI1cdq
         VfbTCobzXBM055FCIkcThyJPnOtJqRfXpCqkdyJPeU+mrgNgYBW9dwlyjlmVdyPvDUtk
         HeKNzKGdTc7tcoxRWNVM00cyoJ1Uzu3DQm8dYhsYdz1nw9kdrI9cUwFs9vYMAwU+5hdl
         CybmLvNKbr52GR1LJMJKNoOKG6cOqt/1/faV8VU2h2Z4kRbm/HIHJduGxXAf4YppJ7C7
         s7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4BhqFMekMqfae0jV0kJyLdsbis4MUFu3PcrocJs8Ziy6W6+XVP+tkCHV58+Uv2tMxRBAW/wVUazVescpBvk/P@lists.infradead.org
X-Gm-Message-State: AOJu0YyTRS3snJYC4XBIuYDMm6X/6HxAGniRB4m3UPL48o6Gp8izFbpT
	W9HTHWHN+8TcnwigFll6hXJgifri7Qw7ybLxhOr7JiZxoiwBZ5Lbm5RX
X-Gm-Gg: ASbGncuR1ajVQlZkp+Nj2MQlByhzuV0AQAWGsbpfvcR/ubaZhO94j5W3wvdRK9qT63B
	ma0X6fcuC0rL59BiGJPbFC2g3M7PDuUpDyw4kdEcy3in1vnycpQqp3jR+N1lG6Uk+Pfrv9kkSQv
	HjzfiTmK1KsOzN+A9OylMTmIYsbS9msWVmfQidyHbHcF/UcX+KmaDb/gBq+OJvGXd6/pfnAXpIx
	wuy2dGL518UlsMo7e22godaQo8A+NTs3wLnA4KoPs8wUiYzuRrbRUH09Bo0s2byVENKOPehOnkc
	V6ZLVznbdF0LzrhEcUIpjrhsctGgra1oPZgiV2pqh6YgRvTD8dbZKYwSOrQjvpDMCi60G6ApDcu
	VGYP2y5nGcme7kVd0MJOpInyhk7koQoU=
X-Google-Smtp-Source: AGHT+IF0laoKtKkFN/t6ngrLWQPIvWKMXmimOZe8OVNH0SnTJ2DeY5aDhhTHsNtNElR2dVPijh5fDg==
X-Received: by 2002:a05:600c:48a2:b0:456:22f8:3aa1 with SMTP id 5b1f17b1804b1-458626fe2c9mr15146055e9.2.1753178567181;
        Tue, 22 Jul 2025 03:02:47 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4562e89c308sm184216065e9.30.2025.07.22.03.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:02:46 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mailbox: cix: Fix spelling mistake "overlow" -> "overflow"
Date: Tue, 22 Jul 2025 11:02:14 +0100
Message-ID: <20250722100214.3792075-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_030249_682356_B4259D04 
X-CRM114-Status: GOOD (  12.25  )
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mailbox/cix-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
index 5bb1416c26a5..443620e8ae37 100644
--- a/drivers/mailbox/cix-mailbox.c
+++ b/drivers/mailbox/cix-mailbox.c
@@ -346,7 +346,7 @@ static void cix_mbox_isr_fifo(struct mbox_chan *chan)
 		/* FIFO overflow is generated */
 		if (int_status & CIX_FIFO_OFLOW_INT) {
 			status = cix_mbox_read(priv, CIX_FIFO_STAS);
-			dev_err(priv->dev, "fifo overlow: int_stats %d\n", status);
+			dev_err(priv->dev, "fifo overflow: int_stats %d\n", status);
 			cix_mbox_write(priv, CIX_FIFO_OFLOW_INT, CIX_INT_CLEAR);
 		}
 	}
-- 
2.50.0


