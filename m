Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F043CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 18:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsGbqA7zl4Zvw/5ddcGMADA0p0RdnsreeRW49Mudp8c=; b=Jqc9OQDsLM7XddKWgcC5GvbQ2s
	Sp+hAXx+3vM4bd97zVPaLk4H0DhHXg8B7/uMgdgxmdCr/bFKsTB9/K0LfhZo/XEv0SYMQ9RNWJRjl
	bbguZayyrLu5ehklTfhM0DRdqyOUd6sMgf2QPqOdBgaO92QV7dR1my0JSh2U9jwIIGkqPciG39ozH
	DCpxbaob+FJ6Qda1cNPXOqmTWtTFFXzZfpNzbhABsE5HB0i7GE8pdm+ipGlUK3AGVvX1WeOFOxgMM
	X2G+0hueXkFWF3/WPc2RbDj7XTbhNbsuWZvKWzqkzvsKeMrG73unCwWFrmXOuc7mgFcRrRPGhikAW
	7GJT0Y2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBvb-0000000Einy-4B8H;
	Mon, 15 Jun 2026 18:20:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBvZ-0000000EimX-2GXy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 18:20:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 018E0601E1;
	Mon, 15 Jun 2026 18:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4C70C2BCB8;
	Mon, 15 Jun 2026 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781547652;
	bh=Ye6rZN1p5lFph0JBhdLxZXH3lTacqgpnudHMAZSL1LQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VYo+732UYPYSLG/2dWz4SJ1dI5gGxWw6stg8+CFwmx1I8M9R+Zg1CVaMlCKDTC9yF
	 y8EUrBCme0nXAoK8wO5HRK5pPpOT99AsiCHHVfFhEeDafly61ULG07EvpmNSKmvEAe
	 Pl3erMe+ZA+GelY7ykHzWNuL97P3q+vzwkPgAab0jbSHvWmlYqrgpdmk0lB/NSVX2l
	 KFYp8PS+dS4ZQKRAYBY0Hv/DCslsSSvhXUA+i6sOOfS0MY0HZ3nvA2YBRT9rAF3ExK
	 m5rP7K7yvGLseG6/YVstY1fNOH3xy8kuhObnh+GZObb4FNxP1L+Z+LQouXXySuKF7r
	 eZyY4dmP6UBKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91382CD98E1;
	Mon, 15 Jun 2026 18:20:52 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Mon, 15 Jun 2026 13:20:52 -0500
Subject: [PATCH v3 2/2] Input: apple_z2 - bound the device-reported finger
 count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-b4-disp-05943ee1-v3-2-bbfe1b651613@proton.me>
References: <20260615-b4-disp-05943ee1-v3-0-bbfe1b651613@proton.me>
In-Reply-To: <20260615-b4-disp-05943ee1-v3-0-bbfe1b651613@proton.me>
To: Sasha Finkelstein <k@chaosmail.tech>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
 Sven Peter <sven@kernel.org>, linux-input@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781547650; l=2830;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=DVQu2uvhJW5sxa7z9aTL83zmiULcE9bwvHJa+3o4ZK8=;
 b=AcyRZ+eyXLTDZ7XtLCTaXD0RmLR9HF3B9i/TUyNlGUymo09wMpiy7P0RRMNzX3EZcgYG0tVbT
 HmIzYzNQp4QCQOm83x1PjR/Jg+hSpBXUwYryjezAOHrgMqUWmME5NNd
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
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
Reply-To: hexlabsecurity@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Bryam Vargas <hexlabsecurity@proton.me>

apple_z2_parse_touches() takes the finger count from the touch
controller's report and loops over that many fixed-size finger records
without checking the count against the length of the report:

	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
	for (i = 0; i < nfingers; i++)
		/* read fingers[i] ... */

msg points into the fixed 4000-byte rx_buf and nfingers is a single
device-supplied byte, so it can be as large as 255.  A malicious,
malfunctioning or counterfeit controller (or an interposer on the SPI
bus) can report a large finger count in a short packet, making the loop
read up to 255 * sizeof(struct apple_z2_finger) bytes starting 24 bytes
into msg -- past the end of the receive buffer.  This is a
controller-driven heap out-of-bounds read, and the finger fields that
are read (position, pressure, touch and tool dimensions) are forwarded
to userspace as input events, leaking adjacent kernel memory.

Drop any packet that claims more fingers than it can hold, warning once
per rate-limit interval, rather than reporting a truncated set of
fingers from an inconsistent report.  A short zero-finger ("all lifted")
report is still passed through so the lifted state reaches userspace.
The 4000-byte receive buffer holds at most 132 finger records, so this
only ever drops counts that could not have been parsed in bounds.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260613215358.329921F000E9@smtp.kernel.org/
Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchscreens")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
 drivers/input/touchscreen/apple_z2.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index ff9ff97be185..4e2a6967436e 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -93,6 +93,17 @@ static void apple_z2_parse_touches(struct apple_z2 *z2,
 		return;
 	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
 	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
+	/*
+	 * A malicious or malfunctioning controller can report more fingers
+	 * than the packet actually carries; drop the packet rather than read
+	 * finger records past the end of the receive buffer.
+	 */
+	if (nfingers && msg_len < APPLE_Z2_FINGERS_OFFSET + nfingers * sizeof(*fingers)) {
+		dev_warn_ratelimited(&z2->spidev->dev,
+				     "discarding packet: %d fingers exceed packet length\n",
+				     nfingers);
+		return;
+	}
 	for (i = 0; i < nfingers; i++) {
 		slot = input_mt_get_slot_by_key(z2->input_dev, fingers[i].finger);
 		if (slot < 0) {

-- 
2.43.0



