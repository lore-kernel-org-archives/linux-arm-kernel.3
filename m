Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983D0C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+3gQstz+ynLenZZkOIHRG2TEYZzSHYIitb2qWK/ts+w=; b=j5dKgSI3j2WmWkDiH+ao+3f2O3
	llqXen+C8kUH5tUEaKwTkJ9m5ZSm6bSpyvgfEtV8U8Y4WNWnJueJVZWk0i6p+PFfG20Tbr6ULjNCj
	lmhG3+z3M4Lvfq3DmQcmh3ktC8IyfOmDhV/m8j0YWeXkv/LsFoCjkvSm77uzAMqeoFZR4QK5iBM/R
	DqBquTL1CuAZ3/hRCVb7htOu0nKC7tjLWAX4k+UJC1aiOtGss5vSiAw6ihV7y4POGeNG3Ive9GJ3a
	dJGTehkn0/GhPA5KLqPVl1etPxH7QX6eJQTFdzUg9VoK9x7OS2YcUJQoT0BZzR3PVGnRSI1zdqDKu
	AdIvjTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGS1-00000007fbw-4B9b;
	Tue, 18 Aug 2026 09:49:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGS1-00000007fbn-0FRG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:49:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C055601FB;
	Tue, 18 Aug 2026 09:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB6A1F000E9;
	Tue, 18 Aug 2026 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787046584;
	bh=+3gQstz+ynLenZZkOIHRG2TEYZzSHYIitb2qWK/ts+w=;
	h=From:Date:Subject:To:Cc;
	b=Mp127J7X2WYfzJHcXaLguKI0yBVpMLYIP9vedFanrNG6QmKilyIXCzDYvExuVcTUg
	 1wbfOeMevZRupYhrZDUa92eRQUV9jcdoHPM+G+H8SC/MeDwY4koLjNLwCTNTZOuoQa
	 wVKFnsomqqj+g9uip8WtnQjnJ+ypHQnXlw1Z4vc0FdFlYN6EYqwtW09gS/CEc7ZiFD
	 uYVA3NXKn3L+SlFdErNN+/Jdg3qt388skhOSaSvNAisCoFqLPNqAyztpKgBDOlYABq
	 CPqPTXXK/GHXybs9Y4w2pb91WPubUTsr5rp/v1HV3okJLRyQOG7yjMAkCwGafesmWX
	 mdE2QEScmZJyg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 18 Aug 2026 10:49:34 +0100
Subject: [PATCH] Bluetooth: hci_bcm4377: Ignore reserved PHY in ext adv
 reports on BCM4378
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-fix-bcm4378-ext-adv-v1-1-81a143eac194@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bkEzVPpKdChdaw9ZaIQQ/T3pO
 DAzD2RKTBmG5oFEN2c+YgXZNuC2Oa6E7CtDJzotrLQYuODi9l4Zi1QunP2NwijjlAte6wVqeSa
 q2n8dp/f9AOPzgC5lAAAA
X-Change-ID: 20260818-fix-bcm4378-ext-adv-0737c3cfd66b
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2533; i=ljs@kernel.org;
 h=from:subject:message-id; bh=y5GD6lS0t2jnsBMwQDdXpyEkybJrOftyeRvVeWJIWFc=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJatDZdiBD26Z6Xf+nL2WZpx1a+tqLKTMmZzpGielYcB
 SaPZG06SlkYxLgYZMUUWZ5/Ed8fJBI2r/OCvxvMHFYmkCEMXJwCMJGinwz/lBVsyhezFPzeFSVb
 bhmXP+1RBfs0Wb4gbcHlsnuPygYIMDJ0nph/O/0ue4bR/nOmXcGmIhsS/96p0rX5fE30tPWmz7v
 4AA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

Commit ed2a2ef16a6b ("Bluetooth: Add quirk to ignore reserved PHY bits in
LE Extended Adv Report") added a quirk to handle creative use of the
reserved bits in the PHY fields for 4388 controllers in Apple silicon.

I observed the same issue with the BCM4378 Bluetooth controller (14e4:5f69,
rev 05) on an Apple MacBook Pro (13-inch, M2, 2022):

> HCI Event: LE Meta Event (0x3e) plen 51
      LE Extended Advertising Report (0x0d)
        Num reports: 1
        Entry 0
          Event type: 0x2513
            Props: 0x0013
              Connectable
              Scannable
              Use legacy advertising PDUs
            Data status: Complete
            Reserved (0x2500)
          Legacy PDU Type: Reserved (0x2513)
          Address type: Random (0x01)
          Address: EA:C1:82:F0:24:C6 (Static)
          Primary PHY: Reserved
          Secondary PHY: No packets
          SID: no ADI field (0xff)
          TX power: 127 dBm
          RSSI: -57 dBm (0xc7)
          Periodic advertising interval: 0.00 msec (0x0000)
          Direct address type: Public (0x00)
          Direct address: 00:00:00:00:00:00 (OUI 00-00-00)
          Data length: 25

This results in the firmware rejecting connection attempts with
"Unsupported Feature or Parameter Value" (0x11).

Fix the issue by using the same quirk for BCM4378 devices too.

I tested this locally and confirmed that the issue is resolved.

This was observed when attempting to connect a Kinesis Advantage 360
keyboard to the MacBook.

Assisted-by: Claude:claude-fable-5
Fixes: 2e7ed5f5e69b ("Bluetooth: hci_sync: Use advertised PHYs on hci_le_ext_create_conn_sync")
Cc: stable@vger.kernel.org
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 drivers/bluetooth/hci_bcm4377.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 925d0a635945..66d49b471544 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2490,6 +2490,7 @@ static const struct bcm4377_hw bcm4377_hw_variants[] = {
 		.has_bar0_core2_window2 = true,
 		.broken_mws_transport_config = true,
 		.broken_le_coded = true,
+		.broken_le_ext_adv_report_phy = true,
 		.send_calibration = bcm4378_send_calibration,
 		.send_ptb = bcm4378_send_ptb,
 	},

---
base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
change-id: 20260818-fix-bcm4378-ext-adv-0737c3cfd66b

Best regards,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>


