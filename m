Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5197AFF6E97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 22:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2009rEY2gnfaE9h9ap7WndfJ2n1E8Xi93loAQJbZnc=; b=1eFREK3iylTOmvKw50ImXZlH9E
	gqWgkE1pu6o0vJPvj0kuzwvUmPE24QD+ClQ9mSFj1BF+IZIF4mZqmOQGx8lcBeQpa/LSMu9e1PC5A
	dkc3fMch66Zbqa8ewWLVsmMhCj3rtnlFh5Ja3lWS/QZ3KrQwDoLpR4G9FN8cvPNPh/t5Hmcoy5+08
	2c+y3r0u4iBPQxMDLDuZHwhlziPXRRpYMxKm7RBcTe0lG5svKjUqgp0IuH424VFlfHgW3H3MYZtRB
	HxS1yXSkkwzudsWgDLbqHHeVTTv3Iac0gHotcfOJsYq1bal0h/PSjwZgh1bFZf3vyFpEPjMSkeABC
	WFgbzxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2d7N-00000007Jiv-1n6v;
	Tue, 17 Mar 2026 22:42:29 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2d7H-00000007Jhc-0dPZ;
	Tue, 17 Mar 2026 22:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z2009rEY2gnfaE9h9ap7WndfJ2n1E8Xi93loAQJbZnc=; b=Lx2IjctPgdmk5pSubQ5eYd9W1n
	HizBTAelqrcl3Vs7YLbv+oQ5QoYogpIIH+Xl+SdiDl1qrk14NX/g0pE+zVatQeS6nymVVDauJu55N
	xdEXk+n9S/VdIKcSo6mIFF0eDqayApn2IRNEUaA8wFQXHBdqXxmoZWpqgoN4zdDRyvFwXNIzwOgjY
	gadsgyFNb0DgpRjzubDc6j1t4af/G+2w8YsZgJbEyI46cachbivuk4QhqYHO6960Mrxcwr6JU6ey0
	mnD1AGQLsuaJPLQ9HO/ApNvETxtu6nVwSradBW7Vk3wU0ogVxstm3ixI8leCLSY/Q/rfKjEtJI6Hn
	AG3hp0vA==;
Received: from [189.7.87.203] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w2d73-002VQv-6w; Tue, 17 Mar 2026 23:42:09 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 17 Mar 2026 19:41:49 -0300
Subject: [PATCH 1/2] pmdomain: bcm: bcm2835-power: Increase ASB control
 timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-bcm2835-power-timeout-v1-1-19db323c51f9@igalia.com>
References: <20260317-bcm2835-power-timeout-v1-0-19db323c51f9@igalia.com>
In-Reply-To: <20260317-bcm2835-power-timeout-v1-0-19db323c51f9@igalia.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>
Cc: kernel-dev@igalia.com, linux-pm@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=9prGGMPk75qqbDT81hIfE5A+1HwPjos8tDp1+6maqCA=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpudi4dyJ4KK1KtRrF/bvXoEogvw2rY4awK0thb
 1liS9Ac51aJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCabnYuAAKCRA/8w6Kdoj6
 qhnwCADERBggI/4Upzvl4EIwhQvSydEcFdJjtEp31Vc6Jpa4oIAaUOON/WM0To7WU6wKy4zdjXD
 4pXYFdHGpJTvw8FTtN5hZlHyKbNpFX+pSWLHfx4aQ598VsZnXQHlD6CHTHHhOSh+IJYx84wBBmX
 5UiomOwwXQTYWPNoUW/n/JIt8tRpA9zJrAZ6y9VjG291cen6vTLhr8oVmYa8tERhg4bYanHnz/G
 +zOOHsiMQI3QV3sv9xFYHHbvPaIHL2fgrNK9HkHvkapzFcudeFE8wmVcIlGTF/V72tjdSxf4uDh
 L7tn6e8A4ierCgQhm++Lz0b+Flq/kkNncPmGMHKsvg28saU5
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_154223_483260_64E3A851 
X-CRM114-Status: GOOD (  13.06  )
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

The bcm2835_asb_control() function uses a tight polling loop to wait
for the ASB bridge to acknowledge a request. During intensive workloads,
this handshake intermittently fails for V3D's master ASB on BCM2711,
resulting in "Failed to disable ASB master for v3d" errors during
runtime PM suspend. As a consequence, the failed power-off leaves V3D in
a broken state, leading to bus faults or system hangs on later accesses.

As the timeout is insufficient in some scenarios, increase the polling
timeout from 1us to 5us, which is still negligible in the context of a
power domain transition. Also, replace the open-coded ktime_get_ns()/
cpu_relax() polling loop with readl_poll_timeout_atomic().

Cc: stable@vger.kernel.org
Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains under a new binding.")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/pmdomain/bcm/bcm2835-power.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
index 0450202bbee2513c9116a36abaa839b460550935..eee87a3005325848547ce1f5fd729b168a641460 100644
--- a/drivers/pmdomain/bcm/bcm2835-power.c
+++ b/drivers/pmdomain/bcm/bcm2835-power.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/mfd/bcm2835-pm.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -153,7 +154,6 @@ struct bcm2835_power {
 static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable)
 {
 	void __iomem *base = power->asb;
-	u64 start;
 	u32 val;
 
 	switch (reg) {
@@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable
 		break;
 	}
 
-	start = ktime_get_ns();
-
 	/* Enable the module's async AXI bridges. */
 	if (enable) {
 		val = readl(base + reg) & ~ASB_REQ_STOP;
@@ -176,11 +174,9 @@ static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable
 	}
 	writel(PM_PASSWORD | val, base + reg);
 
-	while (!!(readl(base + reg) & ASB_ACK) == enable) {
-		cpu_relax();
-		if (ktime_get_ns() - start >= 1000)
-			return -ETIMEDOUT;
-	}
+	if (readl_poll_timeout_atomic(base + reg, val,
+				      !!(val & ASB_ACK) != enable, 0, 5))
+		return -ETIMEDOUT;
 
 	return 0;
 }

-- 
2.53.0


