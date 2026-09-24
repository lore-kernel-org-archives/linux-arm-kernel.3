Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A06C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MSWrvTJhaw4ng9HaxkyKXVaI1YO7DDOsINRc0X8/7pc=; b=WXnT9KQjVC8vopriIZRJWEjkLi
	rbFlKLQonkc/sm1S3YuIE7QSTmOUM472bIFMZ/N7uzMLvmRgxHb+yQEaK4es0YFNsIQqNTQmVSg0Q
	qfAb/WTtHY6bdO/4iMenJXI97rlmEVIcu8ziMiwfis2WxMP8Mn5/KKeIwhOql1MSHGI4cL/LXJKCb
	S62oNeSJSx1zS9QiuCfQ0DmI1co0gACKheGmtX4NnayVuKaI+F+jtrFddiQTLkmJftDqarafpWxWx
	XR0C7PUC7fiMipa80bGPDO+YhzX2KAukAestArgVAqeXnlXyxlaXOCp/ILCmvo2iokMplK7o5K2hY
	R/CcAfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hFK-0000000AoAt-0tuk;
	Thu, 24 Sep 2026 11:04:10 +0000
Received: from mail-pz2-f12.google.com ([74.125.228.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hFH-0000000AoAD-0RfS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:04:08 +0000
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso943851b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247846; x=1790852646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MSWrvTJhaw4ng9HaxkyKXVaI1YO7DDOsINRc0X8/7pc=;
        b=U/LA3aeVAxMrEfSjstCNJQdd3ZdEqKqTX/X6Aqh40U0UzfwLqEsxHFpOZ4OyiuzXBr
         liRxtxl41MkRzBb3vbKHrtvhYyTEEvVW2VUcttgVhEGdR5dpRsmmlRt3pq0/JIx+vsLC
         rUoS4TqY109MH/S/nL4cfET1ZCm6R3F33mHDxKZpzMZjeCGkDkdvJ7OKP5z2tm7MgxA5
         rRaPdPHNJl8WStTczroUPaAhm+TVCi5/zkBJ4GS3Zy/39rusOdD3zwn5ZqbPL+dLgwGb
         lEwl/YGJKHuPJW9ojSEBFnwI6QDrQn6yPh/hjEckdV5OLwOUay+40JOapv4ryF2lWGis
         qFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247846; x=1790852646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSWrvTJhaw4ng9HaxkyKXVaI1YO7DDOsINRc0X8/7pc=;
        b=mYIOwK0HiDhi6ERP5gzpZ60RY2OTKOq6eN8lOOOk3H+tGNwFUmQW2K08/vWQt7uKbG
         VryA0I4/fpXh3Tjcv63VkTyPOLCFxbgup3owDy/BqEvbcuwgc8OrSqBrDaNX3zrQzG9Y
         F8KaU8EOODda2kqbT87lTSRaM1UNr7X66b8SXKhZ0Dr3wVWMqPvXgyXzKI5FexWbx/tP
         v7cqhgaU+BWIbdm6VlW/qwOrPgBaWXZVBJN2HxiZFJVJxtMBxeRtXif9gZDfxV+PRDrq
         ajDq/WgYXbNUaFJNYWugQPgmWDONhnJL1+poP74PL3UHV5CUkgnQ5t558IPycP2bTswx
         l01Q==
X-Gm-Message-State: AFuF++n19Fu/p0hZhpNrdfJNRqSBFXiqYOM0k//2qxseNPmrGxD40Rl1
	Y9UacM5rAJGr6vKdyc25beQs78CYssU9wbcsUSSrQX+tnfWYzhs0J77f
X-Gm-Gg: AYBFou2QLuWsW1JkjYh5i9OTlQklQ1S8HAHrxwu7NfLugUscGifZRL2JQ/qC2SICaT1
	8ojofZwufBC8gwRTHL+AIZCtG3QeX/W5OwAQgcJzKQWaXL65WFtMvCWlABtLQKSOuigE1LcKXyj
	dtBPQ+5mR749HdWPylc39J+eLFm5D9dX1pEpOPUcmQtNcEq6cEKehWERSPyOe9Ezzw0h0IYSBM6
	pYbNnk1W20nJjzwnAhD4HLM2IUGZozbkoK5FB32n4Rm37Ldyy2KqqnDUbeUrH2riOIUCHFdSWRS
	7c2/IyueHCNhkT1+vwOronv1ElhGpvqXcKVPy2GM7EGe5SmxHGQpAYCfsThREtJYb1nvtGPc2LL
	aiLncsqtI1M5q5jCFS79vd7wtRNRi9wp2/vw19qUzw7OVR8JbtN2A78ZVp0nqu7/JNJ3NG0NMPK
	5uxvCoy+5A2CAFV5BvDPkb6rnAOlG+8jVkMsBJS/1vsv3McJ38wuWEYQ==
X-Received: by 2002:a05:6a00:a244:b0:874:708d:b61e with SMTP id d2e1a72fcca58-87e9b6a1475mr1819911b3a.28.1790247845878;
        Thu, 24 Sep 2026 04:04:05 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0f4fbbsm2751981b3a.52.2026.09.24.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:04:05 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	lgs201920130244@gmail.com
Subject: [PATCH] serial: ma35d1: unmap MMIO on remove
Date: Thu, 24 Sep 2026 19:04:00 +0800
Message-ID: <20260924110400.1556396-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_040407_143401_776F4519 
X-CRM114-Status: GOOD (  10.41  )
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

ma35d1serial_probe() maps up->port.membase with ioremap(), but
ma35d1serial_remove() does not perform the matching iounmap(). The probe
error path already releases this mapping after disabling the clock.

Add iounmap() to the remove path after clk_disable_unprepare() to match
the resource cleanup order used by ma35d1serial_probe().

Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/tty/serial/ma35d1_serial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 920fe7ff5083..e5eaaf154911 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -770,6 +770,7 @@ static void ma35d1serial_remove(struct platform_device *dev)
 
 	uart_remove_one_port(&ma35d1serial_reg, port);
 	clk_disable_unprepare(up->clk);
+	iounmap(up->port.membase);
 }
 
 static int ma35d1serial_suspend(struct platform_device *dev, pm_message_t state)

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0


