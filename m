Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B9BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 17:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aGYyBWo+9+yOvNuFGsYyiFsCMkaC4YR5bjaqf1qoRjE=; b=TNVwyJ2xSF11YSuHhcw5Y7RQ8+
	1ALVRswrcpCYarY3l6YRu55dCApBBrwACIBvdLDQnoM3byAaddkBlv30qo1ddnwEeak2RukU2Q2qm
	tlc84hiIeL5FFrNLKdeWLJ/muEeH0Gu8ihqXVlAEVFAQOvHfqLGs61PCvJbRJXXdDwu9T7v7mu9po
	ZrgoM1AJwkly6qPWu7MdmXK4V8Cek6T9bxvBVQSs3fNyrxK3dqHe7VRJnXaRELewLCTUx63KMMJxI
	Drh8DYNHlimsl3KLYrGPJ5aW1ijI1AE0DuVi21SskKHbU8YtPxoLbuRQ4on5PahwyHY41OIXg87Np
	B1e8EAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwg6-000000091vo-3R8d;
	Fri, 15 May 2026 17:50:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwg4-000000091v8-2nWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 17:50:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso140945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778867422; x=1779472222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGYyBWo+9+yOvNuFGsYyiFsCMkaC4YR5bjaqf1qoRjE=;
        b=GZeJ3EuYHBCBK1PpqadGE9zVdWLtsbGc1IW85dph71oMIeye3+CdqUE0KIce8chJPK
         7g2vF4nXI2P7KXUIqfUJFLoocbX+orwY7ygdDnYaDfyrleC8c7T56dOaSk3u3XPbU1oO
         FszjxVeu0b1DWKjFWovfgIIhS9MzsX+qCgUZrhItoG1iqDLOaZkQ5Myzrj3xBnicvNX8
         +SzUe+yuLG+9+MqH64bD6hbH7onutvSSOoU3s8N6RZU5B5ltVda76keUTCUn7pQbfcDr
         LGQPLmU62dpCpp33oZP6dwKTwl6hOs6DMzH1F8sCiL0mtfPXuqRebcYsBFZdlqzjOzXT
         GgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778867422; x=1779472222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGYyBWo+9+yOvNuFGsYyiFsCMkaC4YR5bjaqf1qoRjE=;
        b=lmQB3CIi8UMT3h1jRzrz3zwD93hBu7tlK28oJfGuosK/VIWk3daIZt+wIpGNLOwi+D
         9Oc4DXds/k2p3avf2ZKP5TaylNf4JGMorQCiNiJLxMFro9BR376VgJBZhrZWn/eBQWw1
         znguOYk/+8IiWXZJKdbV7XDqUmSHKH2jI8tPzHcN4l5uuXcqmh6fUZ6gCKpmUkG5/7Kq
         DrsPUH0ou4ZpvytncUvNLiInb86OLTl35EP1IY0WACvwQ4rJ5ODOsp/R6DOdKERcsOEa
         TDOLA/cXL5iwvRUXnR/nDuCOOpUrz6NLlRxfkWxtVBqd1ObJbTpcTJLVQE2EaQgwkEEo
         lhkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UnbZMsQrJHrlx0M55ab0fHlBS9WF95JpX6XBOAM08xhhNQXSq4cq77++IVcnQqvGvh4TGBbP6v9ctnJ0kn+xr@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFhU9DsnBjGAT6jEwFaFFQFKbaTcJ6eiB5cgldWkWLTLnEib9
	99H0srgPU14rLCc+8BRvxp6gr9bs53nRTHi+VhkD40JdJVnWps2eO+Yh
X-Gm-Gg: Acq92OGedP+blfGGLDFI0uDaw5aDtj8J2NHeVctE19tpH6lWKBY1CRa8VIcd7M7Fteb
	/alMCKpPXUjtaToKaZl7KjoyyxZT9R2pH/d8g+Wwuf5nhNuVvtfVySTTKhkWC8kx5NeB+sdk5Nm
	ptv8Zn5u8wXB+fMNfEGgNRTWKDsCoraEpE/syCePacvNjTiELVs3Q+gmN0aW4y5SgE8m1PhqZdF
	hijUbPo8Oz8qREbfs3A4ofL2nVJcOI8qHtaprwiXyUTEUL2VWjLjMW7efVsBPTKG0najf7b/tMJ
	Ad0EiCx1XypQmCvgGgzv8LrYg8AwUwVlH+tuvwt8Btpkx499rqZitwrn6cbtJMjQ6qzapiqHnWU
	ZFDnFYtcIfgsaUXF3j1r/NL8i8Ri48+ovTv6Yg5UR0o39l3wnZ/HGjkRUzJpPmu6MI5YTOBnuMz
	bTEleAu7ZkQdgGaU+rtF100exNEvYW0c4InrqCBG+5dbQB
X-Received: by 2002:a05:600c:45d0:b0:488:a797:f099 with SMTP id 5b1f17b1804b1-48fe61f0787mr36281325e9.3.1778867422082;
        Fri, 15 May 2026 10:50:22 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm66713435e9.5.2026.05.15.10.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:50:21 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: Frank.Li@nxp.com
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	gregkh@linuxfoundation.org,
	hcazarim@yahoo.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via sysfs_emit_at()
Date: Fri, 15 May 2026 22:50:01 +0500
Message-Id: <20260515175002.34853-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_105024_725691_E2EFFFF0 
X-CRM114-Status: GOOD (  13.99  )
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

wakeup_source_show() walks all IMX_SC_IRQ_NUM_GROUP groups and, for
every group with a wakeup_src set, writes a line into the sysfs
output buffer:

	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
		if (!scu_irq_wakeup[i].wakeup_src)
			continue;

		if (scu_irq_wakeup[i].valid)
			sprintf(buf, "Wakeup source group = %d, ...", ...);
		else
			sprintf(buf, "Spurious SCU wakeup, group = %d, ...", ...);
	}

	return strlen(buf);

Each iteration calls sprintf(buf, ...) starting at buf[0], so the
previous group's line is overwritten. When several groups have
wakeup_src set simultaneously, userspace reading
/sys/.../wakeup_src sees only the last group reported, not the full
set. The trailing return strlen(buf) reports only that last line's
length for the same reason.

sprintf() also has no buffer length argument; sysfs callbacks must
not write past PAGE_SIZE.

Convert to sysfs_emit_at() with a running offset so each group's
line is appended after the previous one, and bound the writes to
the PAGE_SIZE sysfs limit. Return the accumulated length directly
instead of strlen(buf).

Fixes: c081197a33a2 ("firmware: imx: scu-irq: support identifying SCU wakeup source from sysfs")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/firmware/imx/imx-scu-irq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/imx-scu-irq.c
index a68d38f89..d1fb20d95 100644
--- a/drivers/firmware/imx/imx-scu-irq.c
+++ b/drivers/firmware/imx/imx-scu-irq.c
@@ -179,6 +179,7 @@ static void imx_scu_irq_callback(struct mbox_client *c, void *msg)
 
 static ssize_t wakeup_source_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
+	ssize_t len = 0;
 	int i;
 
 	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
@@ -186,14 +187,16 @@ static ssize_t wakeup_source_show(struct kobject *kobj, struct kobj_attribute *a
 			continue;
 
 		if (scu_irq_wakeup[i].valid)
-			sprintf(buf, "Wakeup source group = %d, irq = 0x%x\n",
+			len += sysfs_emit_at(buf, len,
+				"Wakeup source group = %d, irq = 0x%x\n",
 				i, scu_irq_wakeup[i].wakeup_src);
 		else
-			sprintf(buf, "Spurious SCU wakeup, group = %d, irq = 0x%x\n",
+			len += sysfs_emit_at(buf, len,
+				"Spurious SCU wakeup, group = %d, irq = 0x%x\n",
 				i, scu_irq_wakeup[i].wakeup_src);
 	}
 
-	return strlen(buf);
+	return len;
 }
 
 int imx_scu_enable_general_irq_channel(struct device *dev)
-- 
2.43.0


