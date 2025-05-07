Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5139C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/U+rK2T4ViQLnQ9q3EO/RZ0a7/6qjipXjmsvRLUSarA=; b=Q8KXOAAQC4TylUdvePQDnVG5M9
	5MOND+NH/VsWdYRVWovNpzqDxKKL/MM38Ke3EGDWt0MmYZBGCRndbemMYY5+MUrNqQc9DnRbT/31C
	R9aKXAtjzViHTZluNT2IRshSR2IUln4kIg7annTHSf5FL7d2ywLDXgpzFLXuJlEWcVro4/Yjjzxsu
	K5ysB1mihYHHkfqPlAhOrEVE8/gmShTpkcjWy40DeT9jQ1ea8ZSuSKwnzYUNd0r8P/c5F4C6v27Xx
	R1HBGofCiqlkxmZHeXd81DzJXBkVosIJpHduip/S8OOkiVPaZX3ORVGEFhfJB6uyjggZ1eO73NGZY
	qMbRs93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeYf-0000000FWZZ-3ZoT;
	Wed, 07 May 2025 13:11:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeV0-0000000FViO-3yuZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:07:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCeUy-0006P4-8e; Wed, 07 May 2025 15:07:44 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCeUw-001ZIn-2o;
	Wed, 07 May 2025 15:07:42 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCeUx-00EJKB-0s;
	Wed, 07 May 2025 15:07:42 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 07 May 2025 15:07:25 +0200
Subject: [PATCH v2] gpio: mxc: configure dynamic GPIO base for
 CONFIG_GPIO_SYSFS=n
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAA1bG2gC/42NQQ6CMBBFr0Jm7Zi2gBRW3sOwKDCUWdiSFhFDu
 LuVE7h8L/nv7xApMEVosh0CrRzZuwTqkkE/GWcJeUgMSqhSSJljVyA/N7Qze+xMJHyb4NhZLMb
 akK61rgYBaT4HGnk704828cRx8eFzPq3yZ/+IrhIFCqN0lUtT9uPtPpOzryV4x9t1IGiP4/gCg
 LUfEcUAAAA=
X-Change-ID: 20250113-b4-imx-gpio-base-warning-4f9ae89887d0
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Haibo Chen <haibo.chen@nxp.com>, 
 Catalin Popescu <catalin.popescu@leica-geosystems.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_060746_991232_0E8CED51 
X-CRM114-Status: GOOD (  16.10  )
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

i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
("gpio/mxc: specify gpio base for device tree probe"), a year after
device tree support was first added back in 2011.

Reverting to dynamically allocated GPIO base now would break most
systems making use of the sysfs API. These systems will be eventually
broken by the removal of the sysfs API, but that would result in GPIO
scripts not working instead of essentially toggling at random according
to probe order, which would happen if we unconditionally set base to -1.

Yet, the warning is annoying and has resulted in many rejected attempts
to remove it over the years[1][2][3].

As the i.MX GPIO driver is device tree only, GPIO_SYSFS is the only
consumer of the deterministic GPIO numbering. Let's therefore restrict the
static base and the warning that comes with it to configurations
with CONFIG_GPIO_SYSFS enabled.

[1]: https://lore.kernel.org/all/20230226205319.1013332-1-dario.binacchi@amarulasolutions.com/
[2]: https://lore.kernel.org/all/20230506085928.933737-2-haibo.chen@nxp.com/
[3]: https://lore.kernel.org/all/20241121145515.3087855-1-catalin.popescu@leica-geosystems.com/

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
This was one result of the discussion with Bartosz at FOSDEM 2025.
---
Changes in v2:
- drop warning opt-out flag
- set a dynamic base only if sysfs support is disabled.
- drop unrelated driver cleanup separately picked by Bartosz
- Link to v1: https://lore.kernel.org/r/20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de
---
 drivers/gpio/gpio-mxc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 619b6fb9d833a4bb94a93b4209f01b49ad1cbdb0..38504c9486b05802a792367111c9d71dc08bdd16 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -490,7 +490,14 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->gc.request = mxc_gpio_request;
 	port->gc.free = mxc_gpio_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
-	port->gc.base = of_alias_get_id(np, "gpio") * 32;
+	/*
+	 * Driver is DT-only, so a fixed base needs only be maintained for legacy
+	 * userspace with sysfs interface.
+	 */
+	if (IS_ENABLED(CONFIG_GPIO_SYSFS))
+		port->gc.base = of_alias_get_id(np, "gpio") * 32;
+	else /* silence boot time warning */
+		port->gc.base = -1;
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
 	if (err)

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250113-b4-imx-gpio-base-warning-4f9ae89887d0

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


