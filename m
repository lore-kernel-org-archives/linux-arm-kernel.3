Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45918CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bD+g0bioO5e5vt2IwFQ8J7qJjU2HhnH3vIfXkJZr+6o=; b=XrE/g6QxW4c2Nw6EJsFlrV9DMY
	C9Q0S4IJ1GxANhqaZE1rF1alTpoBueMjGqAr652SsP7Kn3VV8zzOgf4n7Hg6x5VV46+TOzaX48j7I
	WIKTD1H3y7Fb3UU3ClOBi3rLWvh2FBxKtbTugG11AblRgUZJwOFS4Mtuzke6O3vr07FcVFR/duKi6
	tmihAHSy8ikRAg/2r1V1JMDh4AOplOg0OnL0H6mDbCkQhtB1A4mNAbtIyGrUbozGZHv20t5anr1D6
	8zjJ7B9H1ZrY1H/XqG6qOKh/1aPQtWMexNuXFZgaXVNJfG2CefJ8VYdX6tj75G4Otko1JZW/PVJ7M
	CK8HDlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWFfZ-00000002Jwj-0R3H;
	Sun, 07 Jun 2026 15:44:13 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWFfW-00000002JwH-0yHe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 15:44:11 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=oN1rmGGFON05zRH67x+hh9wsLWzawMjcMP92az7A75oOp1CJ7RjwoZ1yKdiUi0axXDsgFVN6qZeytTfdPdSr6tmmnsMP7mw3Nu95if9HFwgaMWG1fzBhYBHgAzlvDsug7+ojXPJzf2KNc6KcBh6Aype7/Ksc7MdvRD3CM57S6af/NYcwxuF+OS0fYEOST2kKfePXg9FuYEnlr1fg3Tle++GpviyBOOA0PkM8NyJiBS/tPcvyREwwqNHTh6Xz+vHA9vMF2bkqPYiGe+OqrrqW6qyb5tg9OWIMMdwLGKobozw9wUN9uFP5UNXIpKX7KOGsSbE1kwXYV5nr3EU2RE9VsQ==; s=purelymail2; d=crawford.dev; v=1; bh=zrAJjVuVOpwkp0E3QaqJyJWIrOj4ATGmSLb+c4q06rg=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=aRafYyaqVIbsDkoajoxwglY4OZCSeX84SP0Hd0FmucpLePvHlvXcVodlOISPzDDKuZ6a932FOdLQXC5jdPndPiE3Pi1MPRr8ZBKCXrp8I9MohEElyEc+HmNRN/5O3U2dADuf4Ih0/DOJtmkRADnOXCYdNgwgxdruDOrEtbTQ9naNi6IWrBZ6GuJDlVX7u+SBL8pGFenEeqVH17ni4F6xVh2ixcgBJ8w62dZ+qrXjRIh6bSr+AOb5NQ3lLgjKCKjUEFxZs3MXgiChOx1E9/QpHuo9uYVkLsuIZn/Z4woenkuD3K0VxSquAGfP8TNKO3YZGnmLOMmAxT4j4ONBQPANBw==; s=purelymail2; d=purelymail.com; v=1; bh=zrAJjVuVOpwkp0E3QaqJyJWIrOj4ATGmSLb+c4q06rg=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 152360:15601:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 458897218;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 07 Jun 2026 15:43:56 +0000 (UTC)
From: Steve Crawford <steve@crawford.dev>
To: jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-list@raspberrypi.com,
	Steve Crawford <steve@crawford.dev>
Subject: [PATCH] mailbox: bcm2835: Add ACPI support for UEFI-booted Raspberry Pi 4
Date: Sun,  7 Jun 2026 17:43:50 +0200
Message-ID: <20260607154350.204064-1-steve@crawford.dev>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_084410_384503_A4386795 
X-CRM114-Status: GOOD (  15.04  )
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

On Raspberry Pi 4 booted via UEFI (e.g. using the pftf/RPi4 firmware),
the kernel enumerates devices via ACPI rather than the device tree. The
RPIQ mailbox device is already correctly described in the edk2-platforms
GpuDevs.asl with HID BCM2849, complete with MMIO and interrupt resources,
but the driver has no ACPI match table and therefore never binds.

Add an ACPI device ID table matching BCM2849, and replace the
DT-only irq_of_parse_and_map() call with platform_get_irq(), which
handles both DT and ACPI resource lookup transparently.

The existing DT path (brcm,bcm2835-mbox) is unchanged; this is a
purely additive change that has no effect on any boot path other than
UEFI+ACPI on RPi4.

Testing
-------
On Fedora CoreOS 44 (kernel 7.0.8-200.fc44.aarch64) booted via pftf/RPi4
UEFI v1.42, BCM2849:00 (the RPIQ mailbox device) is visible in ACPI but
unbound. Using driver_override to force-bind the unpatched driver
reproduces the exact failure this patch fixes:

  # echo bcm2835-mbox > /sys/bus/platform/devices/BCM2849:00/driver_overrid=
e
  # echo BCM2849:00 > /sys/bus/platform/drivers/bcm2835-mbox/bind
  bcm2835-mbox BCM2849:00: error -EINVAL: request_irq(0) bcm2835_mbox_irq 0=
x0 BCM2849:00
  bcm2835-mbox BCM2849:00: Failed to register a mailbox IRQ handler: -22

irq_of_parse_and_map() returns 0 when dev->of_node is NULL (ACPI case).
platform_get_irq() correctly reads the interrupt from the ACPI _CRS
resources instead.

Signed-off-by: Steve Crawford <steve@crawford.dev>
---
 bcm2835-mailbox.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/bcm2835-mailbox.c b/bcm2835-mailbox.c
index ea12fb8..d450f3b 100644
--- a/bcm2835-mailbox.c
+++ b/bcm2835-mailbox.c
@@ -15,6 +15,7 @@
  *    https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interf=
ace
  */
=20
+#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -24,7 +25,6 @@
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
=20
@@ -144,7 +144,7 @@ static int bcm2835_mbox_probe(struct platform_device *p=
dev)
 =09=09return -ENOMEM;
 =09spin_lock_init(&mbox->lock);
=20
-=09ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
+=09ret =3D devm_request_irq(dev, platform_get_irq(pdev, 0),
 =09=09=09       bcm2835_mbox_irq, IRQF_NO_SUSPEND, dev_name(dev),
 =09=09=09       mbox);
 =09if (ret) {
@@ -186,10 +186,24 @@ static const struct of_device_id bcm2835_mbox_of_matc=
h[] =3D {
 };
 MODULE_DEVICE_TABLE(of, bcm2835_mbox_of_match);
=20
+static const struct acpi_device_id bcm2835_mbox_acpi_match[] =3D {
+=09/*
+=09 * BCM2849 is the ACPI HID for the RPi4 UEFI firmware's RPIQ mailbox
+=09 * device (defined in GpuDevs.asl of the tianocore/edk2-platforms RPi4
+=09 * platform). On UEFI-booted systems this device carries the correct
+=09 * MMIO and interrupt resources, allowing the driver to bind via ACPI
+=09 * rather than the device tree.
+=09 */
+=09{ "BCM2849", 0 },
+=09{ }
+};
+MODULE_DEVICE_TABLE(acpi, bcm2835_mbox_acpi_match);
+
 static struct platform_driver bcm2835_mbox_driver =3D {
 =09.driver =3D {
 =09=09.name =3D "bcm2835-mbox",
 =09=09.of_match_table =3D bcm2835_mbox_of_match,
+=09=09.acpi_match_table =3D bcm2835_mbox_acpi_match,
 =09},
 =09.probe=09=09=3D bcm2835_mbox_probe,
 };
--=20
2.54.0


