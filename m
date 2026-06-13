Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDD6CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 23:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=puTX5ppNwuSQZsE4McaXCODPNHegKNRx8wf0ZAwQhkI=; b=fnjIZOJmbNk0Msq19KtFUYZHVp
	mMprm2lza0lvIbTTTqgB8luQVjc8iZ1gIrRdv7KNi+A76zXpn/e3f/yWRcffceigUoI8SejExQa9Y
	NJx5jC2Mh3/1aF8n4T8rVQTNZZFDEI17JmxP6bGhuq3rNsi0GDFhXg+WPz+ZCtbXTV3aFa1L/cm54
	GFwQm5Xnswc6/r17wop0yIBH/Wc0lMizCz2SQg0kXFRDR+c6aglLcbe6pdMpN49UawECNXW/++kRv
	t2jY6kaVqI8vSEndRyqQhpZHTJjla5iJVd7xN8Lf44iWhpVDa+gOLq6zVlFpc78jFheCuhRJ/F6D4
	fzisfvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYYEZ-0000000Cd2q-22pL;
	Sat, 13 Jun 2026 23:57:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYYEY-0000000Cd2k-1n56
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 23:57:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C40840404;
	Sat, 13 Jun 2026 23:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7928C19425;
	Sat, 13 Jun 2026 23:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781395067;
	bh=m+TMh6HhYsjw1SdBVSjSnA5siVjAOfLsCOypQ9NjPUQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JJIcupS48OvrJURIzibRKAlmeIxo2zLbupgPP+xt9hisu+8UkqZylOfqjxoyvFNxz
	 kHM0xOq9xV3Kq1YaXeOe1njFBXzkaHN9N5TRg8orzCggg1jkmmQL6Kh8oH1v1P8720
	 fdb4xVaJeXuo+iMbiR4c3i0K/jCV3OavlAHpJlq5ObbMWQS31hmjE3k8QffpAUD3SC
	 2Wtr1Ou4X6Mpbooz5RV52+2hKdNDTHhPsHyiNwrleYKuPBkNLX7g8v1PDdUEQ4X/U7
	 D3CPtYv4JkieO+Ew9pVsDZQtCTmSfbd9uhIjfI8aP9i/o2trtduHbwVsj9gQINoMvM
	 KUjYwzNeU8aPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6E6CD8CA8;
	Sat, 13 Jun 2026 23:57:47 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Sat, 13 Jun 2026 18:57:46 -0500
Subject: [PATCH] Input: apple_z2 - bound the device-reported finger count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-b4-disp-f0148c89-v1-1-868a48b2a187@proton.me>
X-B4-Tracking: v=1; b=H4sIAHnuLWoC/x3MQQqAIBBA0avIrBvQErGuEi0yZ2o2JgoRRHdPW
 r7F/w9UKkIVJvVAoUuqnKnBdAq2Y007ocRm6HXvtDMDBotRakbWxvrNjxh55cjB2zAwtCwXYrn
 /5by87weeWEULYgAAAA==
To: Sasha Finkelstein <k@chaosmail.tech>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
 linux-input@vger.kernel.org, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781395065; l=3970;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=+piORlsZ9G+rq1w4Tyy0/0zNo6jPC9e+Ct0NYcVnLBs=;
 b=dWGh/OzZS92ftQe4q3LGeswyrD8DhpLSDQdRYBZcLlsyMA5R5Ay0ph0okO81sYCXYDNlfdxgV
 dwrdwpqHMvbBYgdgBei/shLH9p8q5q2omiz5EA/FLXV2M0u8RchxPHz
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
Reachable on every touch interrupt once the controller is booted
(apple_z2_irq -> apple_z2_read_packet -> apple_z2_parse_touches).

nfingers is a different device field from the packet length handled by
the in-flight "Input: apple_z2 - bound the device-reported packet length"
patch, so the two are orthogonal: that one bounds the spi_read() length
(rx_buf[1..2]); this one bounds the per-report finger count (msg[16]).

The early-return is tightened from NUM_FINGERS_OFFSET (16) to
FINGERS_OFFSET (24) so the subtraction below cannot underflow; since
msg_len == pkt_len - 5 and pkt_len is rounded to a multiple of four, the
only reachable lengths the tighter guard now drops are 19 and 23, both of
which are too short to hold even the finger-array header.

Verified with a faithful in-kernel KASAN litmus (the verbatim 4000-byte
buffer, the struct apple_z2_finger layout and the parse loop),
CONFIG_KASAN=y on x86_64:

  Arm A, nfingers = 255 in a short packet (msg_len 19):
    BUG: KASAN: slab-out-of-bounds in apple_z2_parse_touches
    Read of size 2 ... 1 bytes to the right of allocated 4000-byte region
    ... cache kmalloc-4k of size 4096
  Arm B, with this patch (count clamped to what the packet holds): clean
  Arm C, benign device (3 fingers): clean

  AddressSanitizer (x86_64 and i386): heap-buffer-overflow READ, both ABIs.

Reproducer and full logs available on request.
---
 drivers/input/touchscreen/apple_z2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index 271ababf0ad5..61f353553e7c 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -88,10 +88,13 @@ static void apple_z2_parse_touches(struct apple_z2 *z2,
 	int slot_valid;
 	struct apple_z2_finger *fingers;
 
-	if (msg_len <= APPLE_Z2_NUM_FINGERS_OFFSET)
+	if (msg_len <= APPLE_Z2_FINGERS_OFFSET)
 		return;
 	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
 	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);
+	/* a malicious controller can claim more fingers than the packet holds */
+	nfingers = min_t(int, nfingers,
+			 (msg_len - APPLE_Z2_FINGERS_OFFSET) / sizeof(*fingers));
 	for (i = 0; i < nfingers; i++) {
 		slot = input_mt_get_slot_by_key(z2->input_dev, fingers[i].finger);
 		if (slot < 0) {

---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: 20260613-b4-disp-f0148c89-dfafdfb84b3f

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>



