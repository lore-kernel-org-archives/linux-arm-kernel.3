Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D289F8D75E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZdfqgTzXtA3fPbIpl8GLH8neb3096MRhShKVT67buk=; b=x6TOBLD0p6LslGp/pd9I8sjkTP
	brz5RtKWxrew4Qhzuk4dhhaTHGTK2W7DurnvapIxEtrQmr2xcWr8XDZgur4qO6D68ATAUAP7Uyrlb
	WfCv470AikRroSxK7SheJ3t4LsSplbObPjN399bAtsi29i+F51WtJCpJVrgNdXtkU5okNpR8zx1Ws
	HPRVwiyhS3q3PzFBkcttmMxawGQ5LTVREe7PIBfsf3dNnxlRnlF3Dd07FLJStbBflfznUfUM+LQ3w
	s7xNQU/Lvo5r955kWStD92qcMmJvPQwxeQlYzbU69bwj9ss0c22Bu8YobjVxK6DFbzBAqc5YaYadW
	KgyBYLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOyN-00000002ddO-20KM;
	Thu, 16 Apr 2026 15:49:43 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOyK-00000002dca-1gwL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 15:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1776354578;
 bh=iZdfqgTzXtA3fPbIpl8GLH8neb3096MRhShKVT67buk=;
 b=MCl0POvdl4KVnynmurGEdVkDtm/c1qW5AF5DkD8NZh0TJg6D0xeNwzgvfsaKgi8IHVM3/b2YI
 /wYXvw2MmtY0qwObW/yAYFUYtx6JkyH90KmU5A09wvxv6IvsGpXT6qLHd69Cg8RY5TShEnlB20D
 dOveg6hE8AZ4JtSGStHf++HVSOL4vjc/CzD77wkBNs/m0dbVb5pHXm8dFeJJATLeuWyON4UgyG+
 bkpKwHV6XAxuoaR5FO/XWZe8YNnrK4wKiKq4d7w1vBGLG8VdgasSptSHU5u+Gq+vL9X1uRJT5kr
 fatwDmtQ9PVRVPJp8W75HOFombXGiedXnRkF1l0FIwJA==
X-Forward-Email-ID: 69e1050d06b3fda24d33d578
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.7.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
Date: Thu, 16 Apr 2026 15:49:28 +0000
Message-ID: <20260416154928.2103388-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_084940_833582_A2044D0B 
X-CRM114-Status: GOOD (  11.70  )
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

The commit c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base
allocation") broke GPIO on devices using device trees which don't set
the gpio-ranges property, something only Rockchip RK35xx SoC DTs do.

On a Rockchip RK3399 device something like following is now observed:

[    0.082771] rockchip-gpio ff720000.gpio: probed /pinctrl/gpio@ff720000
[    0.083531] rockchip-gpio ff730000.gpio: probed /pinctrl/gpio@ff730000
[    0.084110] rockchip-gpio ff780000.gpio: probed /pinctrl/gpio@ff780000
[    0.084746] rockchip-gpio ff788000.gpio: probed /pinctrl/gpio@ff788000
[    0.085389] rockchip-gpio ff790000.gpio: probed /pinctrl/gpio@ff790000
--
[    0.212208] rockchip-pinctrl pinctrl: pin 637 is not registered so it cannot be requested
[    0.212271] rockchip-pinctrl pinctrl: error -EINVAL: pin-637 (gpio3:637)
[    0.212344] leds-gpio leds: error -EINVAL: Failed to get GPIO '/leds/led-0'
[    0.212389] leds-gpio leds: probe with driver leds-gpio failed with error -22
--
[    0.607545] rockchip-pinctrl pinctrl: pin 519 is not registered so it cannot be requested
[    0.608775] rockchip-pinctrl pinctrl: error -EINVAL: pin-519 (gpio0:519)
[    0.610003] dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockchip failed with error -22
--
[    0.805882] rockchip-pinctrl pinctrl: pin 547 is not registered so it cannot be requested
[    0.806672] rockchip-pinctrl pinctrl: error -EINVAL: pin-547 (gpio1:547)
[    0.807301] reg-fixed-voltage regulator-vbus-typec: error -EINVAL: can't get GPIO
[    0.807307] rockchip-pinctrl pinctrl: pin 602 is not registered so it cannot be requested
[    0.807970] reg-fixed-voltage regulator-vbus-typec: probe with driver reg-fixed-voltage failed with error -22
[    0.808692] rockchip-pinctrl pinctrl: error -EINVAL: pin-602 (gpio2:602)
[    0.810279] reg-fixed-voltage regulator-vcc3v3-pcie: error -EINVAL: can't get GPIO
[    0.810284] rockchip-pinctrl pinctrl: pin 665 is not registered so it cannot be requested
[    0.810299] rockchip-pinctrl pinctrl: error -EINVAL: pin-665 (gpio4:665)
[    0.810960] reg-fixed-voltage regulator-vcc3v3-pcie: probe with driver reg-fixed-voltage failed with error -22
[    0.811679] reg-fixed-voltage regulator-vcc5v0-host: error -EINVAL: can't get GPIO
[    0.813943] reg-fixed-voltage regulator-vcc5v0-host: probe with driver reg-fixed-voltage failed with error -22
--
[    0.867788] rockchip-pinctrl pinctrl: pin 522 is not registered so it cannot be requested
[    0.868537] rockchip-pinctrl pinctrl: error -EINVAL: pin-522 (gpio0:522)
[    0.869166] pwrseq_simple sdio-pwrseq: error -EINVAL: reset GPIOs not ready
[    0.869798] pwrseq_simple sdio-pwrseq: probe with driver pwrseq_simple failed with error -22
--
[    0.940365] rockchip-pinctrl pinctrl: pin 623 is not registered so it cannot be requested
[    0.941084] rockchip-pinctrl pinctrl: error -EINVAL: pin-623 (gpio3:623)
[    0.941823] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: Cannot register the MDIO bus
[    0.942542] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: MDIO bus (id: 0) registration failed
[    0.943772] rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac-dwmac failed with error -22

Restore GPIO to a working state on devices using older Rockchip SoCs
and/or DTs not having the gpio-ranges property set by restoring prior
use of bank->pin_base as the pin_offset value.

Also change to use bank->nr_pins as the npins value to align and prevent
a possible future breakage if gc->ngpio is ever changed to match the 32
GPIOs each controller theoretically can handle.

Fixes: c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base allocation")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpio/gpio-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 08ea64434f8f..44d7ebd12724 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -617,7 +617,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 			return -ENODEV;
 
 		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
-					     gc->base, gc->ngpio);
+					     bank->pin_base, bank->nr_pins);
 		if (ret) {
 			dev_err(bank->dev, "Failed to add pin range\n");
 			goto fail;
-- 
2.53.0


