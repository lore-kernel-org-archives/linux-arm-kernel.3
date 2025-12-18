Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC02D68BD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y2jbH1db8AeiEGEGj/AbiSExSB62dsQlaEuMfDzg3ts=; b=GyuzTJjvta4YSUKXFawPT6x4xK
	xl50fap6xOw3z5gdvquqRAwrVPDxob7RN8t+gJPVdvjJmJ8koBeaGzEruCLFeV1xTetUKzNZ3tJid
	6N/l7IeMXDHbwZfT4kOeHkKwSKYEff2QniR4mOm4qJyI4265i9U2+GrS+L9Q/Ldg/ZRApXQuBWztV
	PzA5+q/d+aos8stnd6Cu0+xFYmqVDSIdlUnOi7xqftDi5V6doQoIjfmFqiod4euXcCG7eVj3uF3EN
	814gdiYyXV7rQ4Wv4VviYN8eo56bBowUHA5CtY8jF0uuCbtuiSbC0wejVWHP0V0JRLjTxpbWykFyi
	NrKLmO1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW970-000000081hD-3cgv;
	Thu, 18 Dec 2025 08:11:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW96r-000000081XW-12z3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:11:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AF0943DDE;
	Thu, 18 Dec 2025 08:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15582C113D0;
	Thu, 18 Dec 2025 08:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766045500;
	bh=0nXB07FG1QyZZmr7nXNMOdOp6Qnxp853fB5haK5cnGI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nj+PhAqJ8yUxH4Mv6itEIrpnd952dQO/smPXexULoGuKPGa0cfM3WwJOTu3mrCzvv
	 TU2SA8GYzEewuo8tG7O4iQiD5X6AiTSS+UGC9SsP/XjhGq1GUGkFY/ukT8x0FpRaSx
	 EWu/KSV65vuE9owMT8pL4atMQ3Oly9SYW4jejos710L7mLWiLUSJwyT4V9h1Vm3c/+
	 RRUInVrJ9CbP3/U9qG19zMXdYnBcqPKK9rXemwrO5l/GQtVeKBoboMSoVFTOyGIvdm
	 e3E6oaedlId63Ka2QcEpl+pyW4XzEtbJo56z//RpQM6djXhZb/YvIc6xZ+ufg8FVwJ
	 xNS01v3OoJSjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B56D68BD9;
	Thu, 18 Dec 2025 08:11:40 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 18 Dec 2025 09:11:26 +0100
Subject: [PATCH] Input: apple_z2: Fix reading incorrect reports after
 exiting sleep
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-z2-init-fix-v1-1-48e3aa239caf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Nz3Soj3cy8zBLdtMwKXeMkQ5PUNJNkMwtLAyWgjoKiVKAw2LTo2Np
 aAMagJqddAAAA
X-Change-ID: 20251217-z2-init-fix-3b14ef4c6890
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 pitust <piotr@stelmaszek.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045498; l=1783;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=OF8WOCZRA9+JnU6tzC4FoVlFYz2Y9tJ9S+rCxmTtWYo=;
 b=9M/jobQWeFJaXDS54JFsLzWEHIDl+bbiBoVgcNi8y9zH0dzwiavKzcvWquVuCv2w6S35QyEFs
 /Tty1VBEmetC5P+Ey1YYZq8Io8EkRjNjS2pn7tc70FvVJ/n48GX7n+q
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001141_355314_90423A95 
X-CRM114-Status: GOOD (  11.93  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Under certain conditions (more prevalent after a suspend/resume cycle),
the touchscreen controller can send the "boot complete" interrupt before
it actually finished booting. In those cases, attempting to read touch
data resuls in a stream of "not ready" messages being read and
interpreted as a touch report. Check that the response is in fact a
touch report and discard it otherwise.

Reported-by: pitust <piotr@stelmaszek.com>
Closes: https://oftc.catirclogs.org/asahi/2025-12-17#34878715;
Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchscreens")
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/input/touchscreen/apple_z2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index 0de161eae59a..271ababf0ad5 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -21,6 +21,7 @@
 #define APPLE_Z2_TOUCH_STARTED           3
 #define APPLE_Z2_TOUCH_MOVED             4
 #define APPLE_Z2_CMD_READ_INTERRUPT_DATA 0xEB
+#define APPLE_Z2_REPLY_INTERRUPT_DATA    0xE1
 #define APPLE_Z2_HBPP_CMD_BLOB           0x3001
 #define APPLE_Z2_FW_MAGIC                0x5746325A
 #define LOAD_COMMAND_INIT_PAYLOAD        0
@@ -142,6 +143,9 @@ static int apple_z2_read_packet(struct apple_z2 *z2)
 	if (error)
 		return error;
 
+	if (z2->rx_buf[0] != APPLE_Z2_REPLY_INTERRUPT_DATA)
+		return 0;
+
 	pkt_len = (get_unaligned_le16(z2->rx_buf + 1) + 8) & 0xfffffffc;
 
 	error = spi_read(z2->spidev, z2->rx_buf, pkt_len);

---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251217-z2-init-fix-3b14ef4c6890

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>



