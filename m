Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25D2D7830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+kMiETroC8DyqbPq5Hl67U8NCgFxK/BVpKcu/uPN904=; b=udkh7dCVOrBFRQ3FmsjZeyaatG
	5OJpLPi/D2uForXyzH4bA7EUYznPzYPHS1oIEb/lfJ11epYFuK3SrSuGNtfSl8UaFHrYyepgZuPWV
	K9iTvo55zXHbOcFze5NqbNNgEqK7hKaPnv2wXbPIj9Lq9GdvIpLCTJJ+rhB/KTowu72eIXX1zk9hC
	WzREewwGyxGwutmb78HFfSOQRhoz8T1CZV2Ik9cG2QTqqZ4TjWNPJDDLAcgni3dB1GKfUR2k6tt9K
	XuuM9f9IvWgRNmlPt+SF7QIBC5ALRg7PvkvqyzVG2msdJBw9zpbBUm0ZuylGyftNTtudHjn1AYRmK
	j4Di/DOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI526-00000005yO6-1y4O;
	Mon, 02 Dec 2024 11:56:06 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI515-00000005yDT-475Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733140492; x=1733745292; i=wahrenst@gmx.net;
	bh=+kMiETroC8DyqbPq5Hl67U8NCgFxK/BVpKcu/uPN904=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ajf1VuC927Wl/12ZqvRdKvyQCm3b4QORE29NN8+MYX9zBCPUtwfB+k6TXpgtFl9p
	 ur1veA47/nhjcYd24gqp7iQaK8mVlwXvmplTweDybKjs6VjnmvUbCgDdcVdL5M6Zg
	 14Wm+xpwMoSZQLEDM8c6cwkZtyAQIAQXdh41Q5U2kSxqY5+PsmU3bCPTWTkD9M91s
	 RoEciNN967I9GrzaBtzPrxRAgrHKHzf4N9raWVsVqs57F2DRf2C66GS4P0HRtXkM9
	 5mTQh0kUNKJRXEF6Kp3bPKFTowx6dtBavJjaD1u/tBpATTDBuoUERMyEmwyU6y1hD
	 GVGJT4dU8tQaqW5prw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbRs-1tSWkX3ZeQ-007CjV; Mon, 02
 Dec 2024 12:54:51 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] irqchip/bcm2836: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND
Date: Mon,  2 Dec 2024 12:54:37 +0100
Message-Id: <20241202115437.33552-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PAOc0tWu9aXLQliKviiI5wY4bX6FmXbTgA3b+Tq3POu3qo5atU7
 bEnyFxxtUg//Mnn46zU7TL85p8leZ/ZmDhFkC6fsq3ERP/I4c0/6wACTUCsMGIb08Mr9O08
 dgy22M+ybBIMSWIZzBJb06js7aKb/23fc18jkxc0wqx4JUDyrQrkI/13U+InX2EjUcqZaK9
 woDVC6mwqMkmkuFT4JcFg==
UI-OutboundReport: notjunk:1;M01:P0:Z+f23ECFyV0=;r9U8tY/6i3/WIx1MTvE5bg+5wDf
 hCydvhrfMHiURUFBXJaQ/aKPsnZQuryMaN8SO1z4IhcF6FboFdXdYM07AWT4HIWHtMfrbaqU9
 Nc8GrP+pN2lp9vBqFzBsjAlX6gPSB7YDPG7Mw7TpInydRFKdt/evV/OVE5nG5I8qHl0xumzmf
 SZ3WT/SDP0u1z2X/SgyBWPmqkA9Yx2c2nGsXIydGjACvuCU7GQZjBPMBgrJMxIbfVNXtJo0xL
 EOjjp1W7q3wMM85aJkwucA1t3vp3nlxnUOGoxjURqq1xZTvE1CkIWjTJ9bsey4qBHNhvKgB7s
 TaWdhO8YCwzMSIArQrGO78QW98CHq8tiniu7rfEXpL/yBkJTRELKisdUjDo9vvm3uzL2089nB
 tm9i9KjLy27D/ilJKwO1ThP7S7fYK9Hcx4+H9+uofLRROkKKH/BcybJ3OuiXqoVNifdxJcusu
 S6ymIOFOtBhfxJRmM70hSomqs9G4Ohiwql8YNnPWwQ6gZrgv5gaZHHq7VjyenhgPrHqwTuR+T
 Blvnbzhnf46+/4bZucsE0Us+0BOpy8JRnW1vKiDAzEzMzRQ8g1x3tbYVVR+rCK7Oo8dBI2X5m
 KJy8ANnTXW3fqC2bDBGVv88qrPVNbuwQqC6w0LFxR309yIEyM+E63NGBbkLa4b57dlPHg5XIm
 n/VcVP9/5/HVMTMYV5Rk/YXtRewi5RisHdZj7+RdL33b/Ewgdek9lK06vjvUKDdc/Glwwbmus
 kcLC9RT1Tpu1RWvWi2dbkFJe/qY/NjU22PTM08mmsyZWVhb79zX1fft8xsfCqCN7wKPMf+c86
 TRsyaJsZZcVum1D+5OL1DfG9/exQZH3VhseD+Ld0GlWd+qKxmjrQDavG0wAj3UjnQ2LPE8+nS
 AMmjInfQW0CGVFUoj++MfxOEUbd8Y1Acc1dHXDQsZpiClSgldm2ZDgjUSlE+F6/DksA4OKNei
 +Eu9Ac8MASOfVtfCiA0jivM83NcQ65siugfernbcWYGmBQzxw9+Whqh5xP7R/+wCPj6KBZlfU
 Zvguv/XWr7Ue9ITTdN0tjcZLyaeyeA0J7i58CHpY8P0DP0gUfZNadea30uPcpL0fKNfOqiLta
 y5rGTnHHIL47YaK+HYh3QT6g9wRONG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_035504_303904_5D47E356 
X-CRM114-Status: GOOD (  11.10  )
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

The BCM2836 interrupt controller doesn't provide any facility to
configure the wakeup sources. That's the reason why the driver lacks
the irq_set_wake() callback for the interrupt chip.

Enable the flags IRQCHIP_SKIP_SET_WAKE and IRQCHIP_MASK_ON_SUSPEND so
the interrupt suspend logic can handle the chip correctly.

This was inspired by the patch series "irqchip/irq-bcm283x update
for BCM7211" by Florian Fainelli.

Link: https://lore.kernel.org/lkml/20191001224842.9382-1-f.fainelli@gmail.=
com/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/irqchip/irq-bcm2836.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
index e5f1059b989f..e366257684b5 100644
=2D-- a/drivers/irqchip/irq-bcm2836.c
+++ b/drivers/irqchip/irq-bcm2836.c
@@ -58,6 +58,7 @@ static struct irq_chip bcm2836_arm_irqchip_timer =3D {
 	.name		=3D "bcm2836-timer",
 	.irq_mask	=3D bcm2836_arm_irqchip_mask_timer_irq,
 	.irq_unmask	=3D bcm2836_arm_irqchip_unmask_timer_irq,
+	.flags		=3D IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE,
 };

 static void bcm2836_arm_irqchip_mask_pmu_irq(struct irq_data *d)
@@ -74,6 +75,7 @@ static struct irq_chip bcm2836_arm_irqchip_pmu =3D {
 	.name		=3D "bcm2836-pmu",
 	.irq_mask	=3D bcm2836_arm_irqchip_mask_pmu_irq,
 	.irq_unmask	=3D bcm2836_arm_irqchip_unmask_pmu_irq,
+	.flags		=3D IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE,
 };

 static void bcm2836_arm_irqchip_mask_gpu_irq(struct irq_data *d)
@@ -88,6 +90,7 @@ static struct irq_chip bcm2836_arm_irqchip_gpu =3D {
 	.name		=3D "bcm2836-gpu",
 	.irq_mask	=3D bcm2836_arm_irqchip_mask_gpu_irq,
 	.irq_unmask	=3D bcm2836_arm_irqchip_unmask_gpu_irq,
+	.flags		=3D IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE,
 };

 static void bcm2836_arm_irqchip_dummy_op(struct irq_data *d)
=2D-
2.34.1


