Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B170BCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1x/mOaa1dJhywLuUhoro4xsZpsIwTtvbqXZ9jlO2CSA=; b=SsfzQy7ood67v0JlBABmqEQS+W
	yC6TXdzq3VdIOkPBqRvSBRn/7YNOQEG2GfxkQmYc1TPz0KN/gkv5AYafUkZkt+7RIU4PIkzSJK/0L
	a95IMN6xVknFG1oQbgjk/Q0h/UJWyHfVy9zzzgRcgGKlSSmBCSEEbgTCgjjkB/6rJJ13JGEurg79A
	fI8nAULkkXB6QivVfoMgq1xce2RllWEx1WSC9F0cXKE5y/NjuOoPkj+ZkaC6tbO/lwQcDBiEmdG6p
	HUIWb/5iChUHWnvpIMqDzzjgIAGJ6PWXNAIqDoTW2cPhDXmVd6g4ti8QkxiG677BdLYanDKo6yVYw
	XPiSxCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTzU-0000000EIUP-0fRh;
	Mon, 11 May 2026 17:00:24 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTzS-0000000EITv-2RMF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:00:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82748257f5fso3357241b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778518821; x=1779123621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x/mOaa1dJhywLuUhoro4xsZpsIwTtvbqXZ9jlO2CSA=;
        b=hP2Y0WGx3JTREB1C4C19OrAYJHEMOq03tIGX9K9ehrRTWbxIsc3WABkZbRd7No3KW2
         vs7GXjxS101SdKx2hYDpw2FVuNnjF5+sXdJVFORzJ9/8s3bO7VrcgZthQ4YM0h8nc1SF
         4ctJ4B07nAygv2HeH9cXHby0jbaGK3pJPcDUKHVrrb5/jtzZMJC6k8k97Ao+6gQx0i2H
         U3bG4Ulhc3arPmd9b9o2dYD4fhH3KIy6NtsofIx0jpcn6SM8raI33k1IH97YbquP3ber
         0Sm3jqz6rvLtRvL2P1mAjYZhO6dLbYQOSmJlBybdjBgQQJBBH0Af14LxKsMQmI3NYccb
         Vx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518821; x=1779123621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1x/mOaa1dJhywLuUhoro4xsZpsIwTtvbqXZ9jlO2CSA=;
        b=FhmP+2xaPUuUrEIC87xqZ8jV+MZNKEAfxaNuukql8ZeSQ6Uh8OIZepuu0kpN9jXBOk
         nW2/czcyN+21pPa+VUYbeVL6CgV1ASFqeX5OgDT9Lj6vv+3/EVPzjXd6rlrdM5OlQXXs
         z7T9NvITGgXF5O1FLHkuGg3TSMC7hLNYpl2bUN3PwrMj2apx8bKmjNOEbhzv0u7f469d
         H/CFgdeWAf0Ijg405l6CosXd/zvOGQ9Mt6pGucsZU6Prs/PmRS5IfFfKB+0qwM+FTJsz
         O91qDZV7+fo1a4V5lpATwx8Ysv36lvThQnftv/2NkVXpZDpVL8iMWQb3jtOieO9wR22L
         CWNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9klCNATLzjPnaVZomAdNLgD9rPvF/ANUJpbeHfhjrgXnWxGKWqf5pLTxOwpbZS+xhdkSWOeEJgUINH6eJb0rGE@lists.infradead.org
X-Gm-Message-State: AOJu0YzYSShuTbpnKqDhB4Xh6Go7FiJRcNVWrvv9eAqblYKLsdZmNY4z
	lFlt5KGV97DvAvboM8f6NJ4re7NZRy2f6vokwfVyboZqHKvw74ti37a+
X-Gm-Gg: Acq92OEq29GC7TVwcBQsz7QHuEUudMPMz3boGpu5dgFrNFaQ6ehOim99tHLnsW3EVtC
	NiRJhwwf8nlW/D4NsyX/6ssvqXdmaFWsUENdSITC/AU36PJi9ZmbyWvGmuYM8kMVczkHntbaXNV
	Or5YWmBY2MJZ6kRcbsmPe7o58ocl615L91MzdRp7+eCLITxIAs/+t81VivMhIQbVgdk9zVo16I2
	XBEljiXlHxJYOYE12MSpEsD5qnVl9/sD8KPtcG/I4P3+cvK++pgwMvXT5xHGSLsPAAzWKH2EV3H
	nCVLFVteviiGJqaPqDqodo/BOKyCh59JVhLVYoiXwLkbOPVTG+YUg8Fz+Ylouw3mWKTb7yaQyiP
	dlGyx8xDte9kAHIAsQNfX+3NEBo97wn6t6Pg1TfTEy9FukEIc0Z3pW4XLtUIzjSYoKBUPh3iXtQ
	9Zn8AD2NvVSQcqPpqXaRRVb/9PqEt1Eg==
X-Received: by 2002:aa7:9316:0:b0:835:36f5:17c9 with SMTP id d2e1a72fcca58-83ee82d6185mr306041b3a.2.1778518821369;
        Mon, 11 May 2026 10:00:21 -0700 (PDT)
Received: from penguin.. ([2401:4900:cbde:8ff:92b4:bf0c:6a0f:7ccb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm26491381b3a.16.2026.05.11.10.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:00:20 -0700 (PDT)
From: Rakesh Alasyam <alasyamrakesh77@gmail.com>
To: gregkh@linuxfoundation.org
Cc: richard.genoud@gmail.com,
	jirislaby@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rakesh Alasyam <alasyamrakesh77@gmail.com>
Subject: [PATCH v2] tty: serial: atmel: Ignore chars when CREAD is cleared
Date: Mon, 11 May 2026 22:29:13 +0530
Message-ID: <20260511165913.36467-1-alasyamrakesh77@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026051106-obliged-dismount-d85f@gregkh>
References: <2026051106-obliged-dismount-d85f@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_100022_658147_A3CA02ED 
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

Ignore received characters when CREAD is cleared by adding RXRDY
to ignore_status_mask.

This replaces an existing TODO in the driver.

Tested on hardware.

Signed-off-by: Rakesh Alasyam <alasyamrakesh77@gmail.com>

---

v2:
- Add blank line before comment
- Tested on hardware
---
 drivers/tty/serial/atmel_serial.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 5d8c1cfc1c60..5c756dc904b0 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -2184,7 +2184,8 @@ static void atmel_set_termios(struct uart_port *port,
 		if (termios->c_iflag & IGNPAR)
 			port->ignore_status_mask |= ATMEL_US_OVRE;
 	}
-	/* TODO: Ignore all characters if CREAD is set.*/
+	if (!(termios->c_cflag & CREAD))
+		port->ignore_status_mask |= ATMEL_US_RXRDY;
 
 	/* update the per-port timeout */
 	uart_update_timeout(port, termios->c_cflag, baud);
-- 
2.43.0


