Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C94C71159
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cqG2PqVw3HqOIYGAG850BjgDwkb+Sht11Jx983Z/KlI=; b=2oaaH9Hnd6LyyZ0l5m5Oe/ZkXY
	NR3CYnDHlb1vKV2YR1tJW1dhgTNZ+r9DmUd+pRfKoY9joxOkA4c9YL4N5Uefd4KoqnIHsYefKgJP9
	LQWL8ow6g0YiaPBCan5fdoPDX6rgmBxfWlR/ZuHt0isNGWMcnrWFlm2Aa2rSbXI5mwUIL2SVfwUZ7
	bRB00kTPKcJFbU0g0NoXgQAHYA3+Ax3soZTxjlmHPEbyNXZ/Z8TYkALVehJ1Zi6pRbKDDFmFVaZN2
	eDhBK5/4OOkIzpZTaoV3YPbjcjkDLobub4fAflyQ2kc0NjFfschgIUKC33f4CHA77nz18F5NhJFn2
	5W9vKnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9hG-0000000HNhg-3LHZ;
	Fri, 13 Jun 2025 19:04:14 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8u1-0000000HEhr-2kl6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 18:13:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D5CB1F4F3;
	Fri, 13 Jun 2025 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749838397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cqG2PqVw3HqOIYGAG850BjgDwkb+Sht11Jx983Z/KlI=;
	b=KE6Ft6znr3dVhvxcyi44AEgdjmLtZk/4CfSHx7HX7ov1SJ6NTiyAPR+b+qJzoR/3hmsEwf
	6LmMBteem4lSIPWpJmDTwF9sN1sPi6u9dOakioXRhmuKnsfxGvBvAw5i6kIAhLnqG3jJqW
	datB0VIxCwb7ckPGrq0IcOwlsGTmvUyZjzbf6/WpW5yzUxVcip8L/mQmFYYcqsyVNaas5V
	QRh+pHHf62OTt4+O4pc2okLIGWr3W7UJz/xyK4Wy3N+PuBZ4bQFH/P/XCV3DZ0/6c9jZBI
	5nvwAJU53pHTTJvD90ZOfyGpbrZLFIjsFkcwuGLrqXkoFoQ7A9mq4lpbOSH97g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: nuvoton: Fix boot on ma35dx platforms
Date: Fri, 13 Jun 2025 20:13:12 +0200
Message-ID: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteefudelfeejffehveelgefgtddvudfhudegueeijeevjeeivdfhudfgtedtheenucfkphepvdgrtddumegtsgdurgemvdefmegsjedvvdemrgdutdgrmeelfhgvkeemudgsiegvmeelledtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudgrmedvfeemsgejvddvmegruddtrgemlehfvgekmedusgeivgemleeltddupdhhvghlohepfhifrddrpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohephigthhhurghnghefsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepshgthhhunhhgsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnugihrdhshhgvvhgthhgvnhhkohesg
 hhmrghilhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_111321_842399_EC211606 
X-CRM114-Status: GOOD (  13.60  )
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

As part of a wider cleanup trying to get rid of OF specific APIs, an
incorrect (and partially unrelated) cleanup was introduced.

The goal was to replace a device_for_each_chil_node() loop including an
additional condition inside by a macro doing both the loop and the
check on a single line.

The snippet:

	device_for_each_child_node(dev, child)
		if (fwnode_property_present(child, "gpio-controller"))
			continue;

was replaced by:

	for_each_gpiochip_node(dev, child)

which expands into:

	device_for_each_child_node(dev, child)
		for_each_if(fwnode_property_present(child, "gpio-controller"))

This change is actually doing the opposite of what was initially
expected, breaking the probe of this driver, breaking at the same time
the whole boot of Nuvoton platforms (no more console, the kernel WARN()).

Revert these two changes to roll back to the correct behavior.

Fixes: 693c9ecd8326 ("pinctrl: nuvoton: Reduce use of OF-specific APIs")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 06ae1fe8b8c5..b51704bafd81 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -1074,7 +1074,10 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 	u32 idx = 0;
 	int ret;
 
-	for_each_gpiochip_node(dev, child) {
+	device_for_each_child_node(dev, child) {
+		if (fwnode_property_present(child, "gpio-controller"))
+			continue;
+
 		npctl->nfunctions++;
 		npctl->ngroups += of_get_child_count(to_of_node(child));
 	}
@@ -1092,7 +1095,10 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 	if (!npctl->groups)
 		return -ENOMEM;
 
-	for_each_gpiochip_node(dev, child) {
+	device_for_each_child_node(dev, child) {
+		if (fwnode_property_present(child, "gpio-controller"))
+			continue;
+
 		ret = ma35_pinctrl_parse_functions(child, npctl, idx++);
 		if (ret) {
 			fwnode_handle_put(child);
-- 
2.48.1


