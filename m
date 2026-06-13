Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EA7CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 21:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CRIqGQhAwGuRWkY66oPKA8cZeSR7kS6i4po3hOoRRts=; b=C5dqSBGh9QsLzR99FT7Z/XAMD7
	DDKs7UehSZYKWaQVB3O/o7jjh4BOUYk7X77WSnVTikhkQ+YPwT19SbU9WinpRMJOm3ydiMqx+2d/p
	aQecVPB3Yk18eVYTs4DfhUUVoTx5ifHHPWvFMp0pk6vkqj4PcGhTPKqPTlxw3HGoxdblHQSo61LR9
	Uyz5jLVTGJQKGF52fgaBjkJYUG5a+m4yZDqxaoTtfj9h1utg4jost4riJA7E5nL/KGmfVuVGPgdDQ
	F3qs1TUoxqCrFNDNocaELEnLAG/SYK6mOH1JZLv64qQpeI4pHsW0Yu7GZeBZVOxSbKzDOARO2k5jE
	Su1sTFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYW7M-0000000CYWn-1770;
	Sat, 13 Jun 2026 21:42:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYW7L-0000000CYWg-2eTa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 21:42:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A2376008A;
	Sat, 13 Jun 2026 21:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A262C19425;
	Sat, 13 Jun 2026 21:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781386934;
	bh=UDF2EKMrT5gKBEA18/mC2S/FqavgJhyXi06Nv2Z1Xmg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=J1KfefCRMStVKUahWuBNDHg6ZVobYypt3hg6keQ4H1Ijwkxaz60t95E0ejTlg1pyy
	 ZideBvjYU04u114Mr3+0PJzWT2TEn9VWeVJRoc6qs/Zdf036/sSpyWRU9s2b4yyAYq
	 g56OAe8EizjwLSpYyZctKEMdmUH37kU127v79BMAg0P878sNut0llltvGv+8lvIjHy
	 +Cp41Da5PZIZH9Jyg/L8HhL+c9N4Wq5s513g5QFnhHnuo47XMIF9Ade0WFHneZN4b2
	 o6BUXRJWwUDvm+p/7b6U6Ab2wOmWO2W76V5PeZL0sxVJatVG4DMYxrypOCH6ZO5X0y
	 PGU+C2Z2nPuIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B6BCD98C5;
	Sat, 13 Jun 2026 21:42:13 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Sat, 13 Jun 2026 16:42:12 -0500
Subject: [PATCH] Input: apple_z2 - bound the device-reported packet length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-b4-disp-b1926f1a-v1-1-3a277b7c0cfa@proton.me>
X-B4-Tracking: v=1; b=H4sIALPOLWoC/x3MQQqAIBBA0avErBtIC8muEi3GHGs2JQoRiHdPW
 r7F/wUyJ+EMS1cg8SNZ7qtB9R3sJ10Ho/hm0IM2g1Ejugm95IhOWW2CItyJ/BzspClYaFlMHOT
 9l+tW6wfY+4MYYgAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>, 
 linux-input@vger.kernel.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781386931; l=3413;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=HJr41MzsNAgdosyjOBWzjfV06tvv0y+yjyYHV/ssUMU=;
 b=uJGd+xWxV/O/9IKWycpqj9CKYM4uyDLxIThyI5YroMJXLg9nuvw2kuBkdcBHSk5VF0aKBIk2+
 7FQuydudKU6CgHu0E6hF3LagjfSG95afsqzvV9Z3Y++mOEq5dALtSLZ
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

apple_z2_read_packet() takes a 16-bit length from the touch controller's
interrupt-data reply (rx_buf[1..2]) and, only rounded down to a multiple of
four, uses it as the size of the second SPI transfer into the fixed-size
rx_buf:

	pkt_len = (get_unaligned_le16(z2->rx_buf + 1) + 8) & 0xfffffffc;
	error = spi_read(z2->spidev, z2->rx_buf, pkt_len);

rx_buf is a fixed 4000-byte buffer, but pkt_len is fully controlled by the
device and is never checked against it, so a malicious, malfunctioning or
counterfeit controller (or an interposer on the SPI bus) that reports a
large length makes spi_read() write up to 65540 device-supplied bytes into
the 4000-byte buffer -- a controller-driven heap out-of-bounds write of up
to about 61 KiB.  The recently added reply-type check only validates
rx_buf[0], not the length.

Reject any packet whose length exceeds the receive buffer.

Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchscreens")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
Reachable on every touch interrupt once the controller is booted
(apple_z2_irq -> apple_z2_read_packet).

Verified with a faithful in-kernel KASAN litmus (the verbatim 4000-byte
allocation, the exact pkt_len computation, and the spi_read transfer modelled
as a memset of pkt_len controller bytes), CONFIG_KASAN_INLINE=y:

  Arm A, reported length 0x1000 -> pkt_len 4104:
    BUG: KASAN: slab-out-of-bounds in apple_z2_read_packet
    Write of size 4104 ... located 0 bytes inside of allocated 4000-byte region
    ... which belongs to the cache kmalloc-4k of size 4096
  Arm B, with this patch (length rejected): clean
  Arm C, benign length: clean

  AddressSanitizer (x86_64 and i386), reported length 0xffff -> pkt_len 65540:
    heap-buffer-overflow WRITE of size 65540, both ABIs.

Reproducer and full logs available on request.
---
 drivers/input/touchscreen/apple_z2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index 271ababf0ad5..ff9ff97be185 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -22,6 +22,7 @@
 #define APPLE_Z2_TOUCH_MOVED             4
 #define APPLE_Z2_CMD_READ_INTERRUPT_DATA 0xEB
 #define APPLE_Z2_REPLY_INTERRUPT_DATA    0xE1
+#define APPLE_Z2_MAX_PACKET              4000
 #define APPLE_Z2_HBPP_CMD_BLOB           0x3001
 #define APPLE_Z2_FW_MAGIC                0x5746325A
 #define LOAD_COMMAND_INIT_PAYLOAD        0
@@ -147,6 +148,8 @@ static int apple_z2_read_packet(struct apple_z2 *z2)
 		return 0;
 
 	pkt_len = (get_unaligned_le16(z2->rx_buf + 1) + 8) & 0xfffffffc;
+	if (pkt_len > APPLE_Z2_MAX_PACKET)
+		return -EMSGSIZE;
 
 	error = spi_read(z2->spidev, z2->rx_buf, pkt_len);
 	if (error)
@@ -363,7 +366,7 @@ static int apple_z2_probe(struct spi_device *spi)
 	if (!z2->tx_buf)
 		return -ENOMEM;
 	/* 4096 will end up being rounded up to 8192 due to devres header */
-	z2->rx_buf = devm_kzalloc(dev, 4000, GFP_KERNEL);
+	z2->rx_buf = devm_kzalloc(dev, APPLE_Z2_MAX_PACKET, GFP_KERNEL);
 	if (!z2->rx_buf)
 		return -ENOMEM;
 

---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: 20260613-b4-disp-b1926f1a-caad8f942af9

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>



