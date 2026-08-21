Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DB3C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:References:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbJl5fxGKNVdoPi1O5oWYHROj3QbC9kP8ZIzQytStbQ=; b=ncdXn7Ot/d/QjMe7FZbbxF5vRZ
	PVM/k1HcMAMVmiOb2TkXpSl29ec1S2tu39+LZPyyKapXey02mJh4c637qVgnYzKF03X12JHxSKhPw
	ZHzKWvFJLG+liG4ppcv8zOl0urCQGFIqzD5uFjuqdT44grQiVzT1K2RyD1HXXFDqhefxJWpdHeZkh
	OVJBHeEtZUDiWv0RC30LsmTwyC2gdqdAzVNwZ3RHBMWZ9K7+D+xF3Af5E6ymFzu0hFA5uNiHL2d0g
	ia0BBU3yPTw6dacmF6yZCQvvUuos/+Jy1SUb6+mpLYjxncPJMljq+qRmoVCii8eqObxEwYHPtkKC9
	EIuuyXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYoX-0000000EASd-3ALm;
	Fri, 21 Aug 2026 23:38:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYoW-0000000EAST-0fMs;
	Fri, 21 Aug 2026 23:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D21661126;
	Fri, 21 Aug 2026 23:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3DECC2BCB3;
	Fri, 21 Aug 2026 23:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787355498;
	bh=rlbSOuaEzyKo5jZHsV6n7SSdJDwWMAOutuR6tIJXPhI=;
	h=From:Date:Subject:In-Reply-To:References:To:Cc:Reply-To:From;
	b=FUrG4kTVRofbSX4GusS4dinoTUhR3Zlq5YLIqWfW9EFBdcKP2JZUtXoaN4nWQ/sYJ
	 1+QutDQMnjOaO3bvwZlRcVa8bngeoYegBEq8wrepAYDieMCSoQFE8mRtl9mjuFLJG4
	 fsqHOf7788o6Jpq1+Ta29JClM4hH9ow6hZsRLbT7GGi2HSSEvrBR6wWWC9rqRko7N6
	 na9/5ZrxbVMqsJsDVjfWVc2Wcfh4glM0IYLdIIlVYlHHFTByheZF3Wr/46WlIK07jW
	 w6dBh+r/ShK7J6MOwHDbV0MoBQNaEwK76WWeASuFyek5zelCeIhZAYwIxBbDAI0YXl
	 xm3s3NnkZdTew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B288C5DF8C;
	Fri, 21 Aug 2026 23:38:18 +0000 (UTC)
From: George Maraveyas via B4 Relay <devnull+george.0xfff.gmail.com@kernel.org>
Date: Sat, 22 Aug 2026 01:37:33 +0200
Subject: [PATCH RFC v2] Bluetooth: mt7925: trigger reset on WMT timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-mt7925-rfc-v2-1-c88e3bcf7eb8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22QTW7DIBCFr2KxLhZgCBBVVaRKPUC3VRZjGCe0w
 U7AsVpFvnsJzbLLNz/vezM3kjEFzGTb3EjCJeQwjUWIp4a4I4wHpMEXTQQTG2a4oXHWViiaBkf
 R+07iwDruLSkL54RD+K5mH+T97ZXs/4r52n+im+82j7GEl2tBzY/ZiDlDRW2b50rSrNAY57rtt
 JJKMcopODzB2H7BtHMwTmNwcGrdFF/upj1kpEXEMJf0xjMucOhlJ/RgnVZeIZMCtLMcLShZmmB
 NDXgMeZ7ST/3Awmue/45dOGVUGOmN2oBTWuwOEUINQPbruv4Cg3ggnkoBAAA=
X-Change-ID: 20260818-mt7925-rfc-edd34ef031d9
In-Reply-To: <20260818-mt7925-rfc-v1-0-284d856ac572@gmail.com>
References: <20260818-mt7925-rfc-v1-0-284d856ac572@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Chia-Lin Kao <acelan.kao@canonical.com>, 
 George Maraveyas <george.0xfff@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787355496; l=6566;
 i=george.0xfff@gmail.com; s=20260818; h=from:subject:message-id;
 bh=eD0xVzdZ+MLHOp0LYT7FNSr4T7TwQldMA7EKYnGOfwE=;
 b=KzR8Sr3nxgfX34AVXTYV5vC9vEHxjKPdJwG4SnjP+eVVVNb4Lr3dDHZ9AHC9kLB0seaa6bQhE
 xikvwO/kzEFCglAqfeeihvlm/BkmqyUPUoFtKYgTO0XaWAzFqK7PRDp
X-Developer-Key: i=george.0xfff@gmail.com; a=ed25519;
 pk=Jz8kMnumjUlo1GJvJ5kdfkF3ZP8DjPbYaYQR5J8IHMI=
X-Endpoint-Received: by B4 Relay for george.0xfff@gmail.com/20260818 with
 auth_id=960
X-Original-From: George Maraveyas <george.0xfff@gmail.com>
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
Reply-To: george.0xfff@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: George Maraveyas <george.0xfff@gmail.com>

The MT7925 Bluetooth USB function can enumerate successfully after a warm
reboot while the WMT function-control command remains unresponsive.

When that command times out, btmtk_usb_setup() currently returns
-ETIMEDOUT without entering the existing MediaTek reset path. The existing
USB reset and recovery machinery is therefore never reached.

For MT7925, call btmtk_reset_sync() when the WMT function-control command
times out. This enters the existing reset path in btusb_mtk_reset(), which
performs the MediaTek subsystem reset and queues a USB device reset.

Runtime tracing on the affected hardware showed the resulting path through
usb_queue_reset_device(), usb_reset_device() and
usb_reset_and_verify_device(). When reset and verification could not
restore the device, the USB core escalated to a logical disconnect and
re-enumeration.

Recovery succeeded in three controlled Windows-to-Linux tests. Runtime
tracing showed the existing USB reset path escalating to logical disconnect
and re-enumeration. In two of those tests, tracing continued through the
subsequent enumeration failures and directly captured
usb_acpi_port_prr_reset(), after which the MT7925 re-enumerated and
Bluetooth recovered.

These tests were performed on top of Chia-Lin Kao's ACPI _PRR hub patch,
which remains a prerequisite for this patch.

A fourth Windows-to-Linux test was then performed with the diagnostic btusb
blacklist removed and btusb binding normally during boot. The WMT timeout
reproduced and Bluetooth recovered automatically without manual
intervention.

Signed-off-by: George Maraveyas <george.0xfff@gmail.com>
---
Dear Alan,

Thank you for taking the time to look into my patch and for pointing me
towards the existing reset path. I have now traced the failure on the
affected MT7925 hardware and tested the individual parts separately.

You were correct that a new USB re-enumeration helper is unnecessary.
Once the MT7925 failure is made to enter the existing reset path, I can
see:

  btmtk_reset_sync()
    -> btmtk_usb_subsys_reset()
    -> usb_queue_reset_device()
    -> usb_reset_device()
    -> usb_reset_and_verify_device()

When reset and verification cannot restore the device,
usb_reset_and_verify_device() eventually reaches:

  hub_port_logical_disconnect()

and normal hub re-enumeration follows. I have therefore dropped the
proposed USB helper from v1.

The problem I found is earlier in the Bluetooth path. When MT7925 WMT
FUNC_CTRL times out, btmtk_usb_setup() currently returns -ETIMEDOUT
without entering the existing MediaTek reset machinery. The revised patch
now consists only of the part of my original submission that makes this
timeout enter the existing reset path:

  if (dev_id == 0x7925 && err == -ETIMEDOUT)
          btmtk_reset_sync(hdev);

I tested this both with and without Chia-Lin Kao's _PRR hub patch. I want
to stress that this v2 is based on and dependent on Kao's patch; that
remains the configuration in which I have validated recovery.

Kao's patch alone does not recover this failure because the WMT timeout
never enters the reset path. With the WMT trigger but without Kao's patch,
the reset/disconnect/re-enumeration sequence started, but the device did
not recover in that test.

With Kao's patch plus the WMT trigger, I reproduced and recovered the
Windows-to-Linux failure in three controlled tests. Runtime tracing showed
the existing reset path escalating through usb_queue_reset_device(),
usb_reset_and_verify_device() and hub_port_logical_disconnect(). In two
of those runs, tracing continued through the subsequent enumeration
failures and directly captured:

  usb_acpi_port_prr_reset() <- hub_event.cold

The MT7925 subsequently re-enumerated and Bluetooth recovered.

I then removed the diagnostic btusb blacklist and repeated the test as a
normal Windows-to-Linux restart, allowing btusb to bind automatically.
The WMT command again timed out with -110 and the adapter recovered
without any manual module loading or other intervention.

One behavioural difference is recovery time. The original RFC, which
requested logical disconnect/re-enumeration directly after the MT7925
subsystem reset timed out, recovered Bluetooth in about 71 seconds on
average. Using the existing usb_queue_reset_device() path takes about
133 seconds to complete Bluetooth setup in the current tests, with
successful USB re-enumeration at about 114-115 seconds.

The traces account for most of that difference:
usb_reset_and_verify_device() spends roughly 65 seconds attempting reset
and verification before escalating to hub_port_logical_disconnect(). In
practice this was long enough that, during the first test of the reduced
patch, I almost concluded that recovery had failed and rebooted to start
the test again before the device eventually returned.

I do not think that recovery-time difference justifies retaining the new
USB API, but it seemed worth mentioning because it is a noticeable
behavioural difference between v1 and the reduced approach.

Changes in v2:
- Drop the proposed USB re-enumeration helper.
- Drop the direct MT7925 re-enumeration handling which depended on it.
- Reduce the series from two patches to one Bluetooth patch.
- Retain only the part of the original Bluetooth patch that enters the
  existing reset path on an MT7925 WMT -ETIMEDOUT.
- Keep Chia-Lin Kao's ACPI _PRR hub patch as a prerequisite.
- Add the new runtime trace and recovery results.
- Link to v1: https://patch.msgid.link/20260818-mt7925-rfc-v1-0-284d856ac572@gmail.com

Thanks again for the review.

Kind regards,
George
---
 drivers/bluetooth/btmtk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 66b346761..e8f02f1e3 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1413,6 +1413,10 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 		err = btmtk_usb_hci_wmt_sync(hdev, &wmt_params);
 		if (err < 0) {
 			bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
+
+			if (dev_id == 0x7925 && err == -ETIMEDOUT)
+				btmtk_reset_sync(hdev);
+
 			return err;
 		}
 

---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260818-mt7925-rfc-edd34ef031d9
prerequisite-message-id: <20260706080117.3754550-1-acelan.kao@canonical.com>
prerequisite-patch-id: 47a2729fbc473534f8ba52052b00723c54a26c17

Best regards,
--  
George Maraveyas <george.0xfff@gmail.com>



