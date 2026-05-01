Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E7AFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJy9JRzzea0MEbuvCcgPyf18aJdET1ySFm9JDivNUQ0=; b=mzTumSqjsO9sGsn+zc5yKFgH+P
	Z5vnfEEotLAic6xLZZ48gebnqNvNy1nHC4twwcy4A5EqXCywtBQJWfVZnjc2UDAPLk3uWryooTuOz
	qLLW+WXXjzjbxf6OFjiqY3CQcZ9WQyYKklqA64L5MTC68+EWXhn3yjAOG3oh1u8zr/C/JrhIIfKab
	dmeWSruF2HDGIgCFTPEPwVMyj9JZ7ZCSNE3Yoy1eBBdc8VyJR+0VrXuUJp4PH8+P1S3Y0SSTG7/UC
	K8HclkPmBmlXeLtvLGvLTO2Y/eJKkUdAzEZnbLQbGQCKjfqnj3h38m35b8a0iofHjNrokViR7kTVk
	ugmeCNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIj0O-00000006VEM-32Wz;
	Fri, 01 May 2026 08:13:48 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIj0M-00000006VE1-0wRJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 08:13:47 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so2113055a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 01:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777623225; x=1778228025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJy9JRzzea0MEbuvCcgPyf18aJdET1ySFm9JDivNUQ0=;
        b=q3UKoRq3HsNN6Gyv1Fo93WhGoll/4JwJfwCvH1uOQxRpo/OB90daOm5CuCMS/8xrPM
         2Wlp6VGElczadiWqVdz4g4/suau6/rWtq7i/ZOSjYnwMZXFpEbOXhRGV3PjuqTI1nsSU
         /3pmncisXdejPjbfhPD/FlwGZLa38EJzl438VWbwwHGYCZgYSZn+0UYyib5oeo3TnvRf
         CJIA8FTFX/RtveH9Cr0DMBmul5uQcq+TbDBd6qquXzX4QZemzP4LL/WNhmZtentvYrG7
         1TDpIYSSBW2JhS114y6IuzSCFuBP+iXuMr+Plj5mUJxPYS/ntEopQ0Qmy3GYNpS66gon
         syYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777623225; x=1778228025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJy9JRzzea0MEbuvCcgPyf18aJdET1ySFm9JDivNUQ0=;
        b=rNI6hJSSd2wnocE4sI5y3bvxEh/0zEbqJfjDmynAjkVtv2sWc55PHjNmmSDk/4lR9X
         8qK5QAzpY4L14RI7szV344xrGVkDIss1eWN8sLPVgJbtTti/0lWL6t5hPKj4jpj6I1zj
         U8VhhkbI+hiviPUwSCMTsZrNv5hqTalbUfgBBovazWY/CHFN4tlK9lVoZKZqZJJFtm9q
         /4Gsyw4lw44Ui6tlnMXgIA96VgX5nxu0ehz1vjt0YXL7wLAIOUffsxMe/9EWKY0kXLUc
         v6g1l6H2k+TFdMMWGRK3v8sIWg+62hDoEPr2fZZTaiJlz8TnpmJI+aGY793/qa+Q0L9j
         rX5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Jkk9+FeyvnfOel+dajUVLACoK3jDifHI2Bzp70rSlU3DbxV0+Eekj2He9YBEHmRNhpyAn5Nud14TT0pf6G9Bx@lists.infradead.org
X-Gm-Message-State: AOJu0YxvJKqLsNLH5Tuf4XmA46y5D2dtn9UwcCCJftAB/r9bIG7q2fkP
	yl36JQFjW5fvUFRX2pY0WN2oNb/JrQJcuP4Ra1wqiaEbgqAWnA0xyf2X
X-Gm-Gg: AeBDietwGf2lIMK44eLIoYY5Ci7nsewRG+6f77PbUtptozAcbNlluxNoeGJVvtOx2zw
	q185vkNWH4yPqyo31Axfd0zZdhoQk98JhcHJaxyiajzPbO1Ok8thqIqbYJI3/LVePbA6RiHwepZ
	4knZJmb0JuYSLeTDued6ktOls1ewC+woE8hNJvKNy+w/vle8eEIvsq8iWPZFCpm4ryAaqinMGTc
	lccyj4MZrzZTz5kZ10ifiVDYYO7BYdD9OiXC7BtAKMRZQT3hxyKe8TelwW53W6puXodQZab+9zz
	W2UCabIS2ORx2bJeQ6gmithVSad7+4rvAWP/G35XwF5DSraqQQNg1hwe7RXH0/Hm8CE6IzsHJtE
	6zyzEDHQIptHYpxbZs9BDeLTJFmEJAYYm8XBDTQAIdC60Z/C0B2iKFw3TUH9x0oinFcIR1YDi4g
	p2ExBi0fqV7sxweBp9eWMHxy47qAU4baVKnHhhJ6Ig0YCT
X-Received: by 2002:a17:90b:3911:b0:35e:5929:d78d with SMTP id 98e67ed59e1d1-364c2f0a149mr7040037a91.3.1777623224810;
        Fri, 01 May 2026 01:13:44 -0700 (PDT)
Received: from penguin.lan ([2409:40f0:11d1:8c2a:613a:7c61:540d:f337])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec03c944sm1551734a91.15.2026.05.01.01.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 01:13:44 -0700 (PDT)
From: Rakesh Alasyam <alasyamrakesh77@gmail.com>
To: richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rakesh Alasyam <alasyamrakesh77@gmail.com>
Subject: [PATCH] serial: atmel: honor CREAD in atmel_set_termios
Date: Fri,  1 May 2026 13:43:17 +0530
Message-ID: <20260501081317.15477-1-alasyamrakesh77@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_011346_265766_1F37848C 
X-CRM114-Status: GOOD (  11.55  )
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

Ignore received characters when CREAD is cleared by adding RXRDY
to ignore_status_mask.

This replaces an existing TODO in the driver.

Signed-off-by: Rakesh Alasyam <alasyamrakesh77@gmail.com>
---
 drivers/tty/serial/atmel_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 5d8c1cfc1c60..5b062d8ccabe 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -2184,8 +2184,8 @@ static void atmel_set_termios(struct uart_port *port,
 		if (termios->c_iflag & IGNPAR)
 			port->ignore_status_mask |= ATMEL_US_OVRE;
 	}
-	/* TODO: Ignore all characters if CREAD is set.*/
-
+	if (!(termios->c_cflag & CREAD))
+		port->ignore_status_mask |= ATMEL_US_RXRDY;
 	/* update the per-port timeout */
 	uart_update_timeout(port, termios->c_cflag, baud);
 
-- 
2.43.0


