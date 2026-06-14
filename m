Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA49DCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 01:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZpjppfkXsF0aKm70A5P1g48YtcG7stUximEnZ2noQg8=; b=Skj+gbRL7VuOIqAm+Cc7NFzxiN
	wId1/AmB9M/TMpjKE5LG5dnIFviOja+O6umnwuvOOQm/EQhmaJVkToMyYuTBqU0tLju8xVRq1AVII
	y747fEoGO2NfgCQIoMK2hcry6ikKk2Yefb57B5G8lNil9vDqbRQ6p5wKWrtI7MTF5Q8JJApDkuUeD
	lZ+c0rsJaZwozcTsiYkKfR/rrvau/Ch20Ago/sjDq8POdF9QBd9bHyUH0NzyUJsC5kCIofwOS1VU/
	uUK/zhNp/lAU4JQH1ZVXqiU5tvaIJOGsM8B9Jgr1L37R4NGf90StinS6SNrazPCdPo8sH6/VFfHQM
	e8K/V39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYZYt-0000000Cf2T-0wwG;
	Sun, 14 Jun 2026 01:22:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYZYr-0000000Cf2N-3zV9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 01:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CAEE43873;
	Sun, 14 Jun 2026 01:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB06AC19425;
	Sun, 14 Jun 2026 01:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781400173;
	bh=UZrZ5wSsnMIniOh8gxwPYURVNQ2lpmyhexav9L/ZBw0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=g3ZTVugdbkvttRhfJNzbcLSQSETOHnS/IcZWASHsBUa1pKv66zI0LsV8q+oKLluf3
	 s2FQHRtQlHJlNKi/zli1EADUgTva8l8xlIRU8kD7ihKvFzqP/v2JBLh98zRbhnjgkE
	 bZSQK+U3bJS151zRkYFDG7CP+CdhCkB5I0gcJcd8zLjYu5zoUFu745x+eiA1Tkwb3M
	 rBjky5XmRGAabPJKZYyOkxFTkzD5UTcFOiIZEKclM3LptpUGlDBLdoMheFF855T6ui
	 SsfL09Uawf3tH1GFMSblKasko7Gpnyiz6fEevlugCng5eKNfCRTmzUBCDUK1S95Fv5
	 axc3H0ELMVXHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28D0CD8CA8;
	Sun, 14 Jun 2026 01:22:52 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Sat, 13 Jun 2026 20:22:51 -0500
Subject: [PATCH v2] Input: apple_z2 - bound the device-reported finger
 count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-b4-disp-4ebcbd68-v2-1-0161acfbd688@proton.me>
X-B4-Tracking: v=1; b=H4sIAGoCLmoC/x3MMQqAMAxA0atIZgM1Si1eRRzaNGqWKi2IIN7d4
 viG/x8oklUKTM0DWS4teqQKahvg3adNUGM1kCFrbNdjGDBqOXGQwCFahxKdJ2dHYmao2Zll1ft
 fzsv7fj3weSViAAAA
To: Sasha Finkelstein <k@chaosmail.tech>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>, 
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
 Sven Peter <sven@kernel.org>, asahi@lists.linux.dev, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781400170; l=4274;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=cA3MAKlApjHMtPp/Y7yADcVtsqa7z1tz3hdWEHqZvM0=;
 b=1n1ZcPKptwRITcqPnqf8jdSPQQW9VcIhqm8xAkNmLickRLEVvDGJzKDZ5qu36odN+u6LCKUG9
 0XnTfbwmRhjD2URVlur1ypH55jvPb1hLHyw9HtvUv7U2EJr12VDXtxS
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
without ever checking the count against the length of the report:

	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
	for (i = 0; i < nfingers; i++)
		/* read fingers[i] ... */

msg points into the fixed 4000-byte z2->rx_buf and nfingers is a single
device-supplied byte, so it can be as large as 255.  A malicious,
malfunctioning or counterfeit controller (or an interposer on the SPI
bus) can report a large finger count in a short packet, making the loop
read up to 255 * sizeof(struct apple_z2_finger) bytes starting 24 bytes
into msg -- far past the 4000-byte buffer.  This is a controller-driven
heap out-of-bounds read, and the finger fields that are read (position,
pressure, touch and tool dimensions) are forwarded to userspace as input
events, leaking adjacent kernel memory.

Bound the device-reported count to the number of finger records the
report actually carries.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260613215358.329921F000E9@smtp.kernel.org/
Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchscreens")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
Changes since v1 [1]:
- Keep the early-return at NUM_FINGERS_OFFSET instead of moving it to
  FINGERS_OFFSET, so a short zero-finger ("all lifted") report still
  reaches input_mt_sync_frame()/input_sync() and does not leave touches
  stuck on the screen (caught by the sashiko-bot review of v1 [2]).  A
  packet too short to hold even one finger record clamps nfingers to 0
  instead of being dropped.

[1] https://lore.kernel.org/all/20260613-b4-disp-f0148c89-v1-1-868a48b2a187@proton.me/
[2] https://lore.kernel.org/all/20260614000725.6B8D11F000E9@smtp.kernel.org/

Reachable on every touch interrupt once the controller is booted
(apple_z2_irq -> apple_z2_read_packet -> apple_z2_parse_touches).

nfingers is bounded here by the message length; the message length is in
turn bounded by the companion "Input: apple_z2 - bound the device-reported
packet length" change (in flight), which caps the device-reported pkt_len
to the 4000-byte receive buffer.  The two together close the device-driven
out-of-bounds accesses in apple_z2_parse_touches() / apple_z2_read_packet().

Verified with a faithful in-kernel KASAN litmus (the verbatim 4000-byte
buffer, the struct apple_z2_finger layout and the parse loop),
CONFIG_KASAN=y on x86_64:

  Arm A, nfingers = 255 in a short packet (msg_len 19):
    BUG: KASAN: slab-out-of-bounds in apple_z2_parse_touches
    Read of size 2 ... 1 bytes to the right of allocated 4000-byte region
    ... cache kmalloc-4k of size 4096
  Arm B, with this patch: a zero-finger report (msg_len 19) reaches the
    sync; a 255-finger claim is clamped to what the packet holds; clean.
  Arm C, benign device (3 fingers): clean

  AddressSanitizer (x86_64 and i386): heap-buffer-overflow READ, both ABIs.

Reproducer and full logs available on request.
---
 drivers/input/touchscreen/apple_z2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index 271ababf0ad5..39ade83ef0de 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -92,6 +92,12 @@ static void apple_z2_parse_touches(struct apple_z2 *z2,
 		return;
 	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
 	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
+	/* a malicious controller can claim more fingers than the packet holds */
+	if (msg_len < APPLE_Z2_FINGERS_OFFSET)
+		nfingers = 0;
+	else
+		nfingers = min_t(int, nfingers,
+				 (msg_len - APPLE_Z2_FINGERS_OFFSET) / sizeof(*fingers));
 	for (i = 0; i < nfingers; i++) {
 		slot = input_mt_get_slot_by_key(z2->input_dev, fingers[i].finger);
 		if (slot < 0) {

---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: 20260613-b4-disp-4ebcbd68-ed8a28672ccc

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>



