Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6464CC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fefEqK5zfKOXV9NLq6khj1jGWiDvrdVkbBqTevoSgmA=; b=fRit1MIuoeZHkXCwSU+413MEEY
	Kty1yae0QKHNMY7TovJoo1j8dHDi+6i1h8mPFj4SIG6uEcYIGhLKvwO/ro74YRYZcDhRx+Up+xnFS
	m6jZstJB6F/n1g+afApe4KEuk2xnpxcyw5BC14E35VEkOhEOTq6ej0g8yJ3u7/G/wATiFhzKPKP/Z
	4T61i6UZJVx52ujeykqZFhIWLQXUm5MpCXZ1P8ey3rJXgV1J7lahq/5ioE8hCqMgH/KjzTBN0C+ea
	wCK3O9bpRFVBGDYFV/VgkO7QfW/NgQ704W9u+z7z+tKCWOv/fSAbk0VRW/fPDslFW639JCHxiPSjU
	Q4KjRPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mq2-00000008yK2-3j2t;
	Wed, 16 Sep 2026 10:26:02 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mq0-00000008yJc-1fxg;
	Wed, 16 Sep 2026 10:26:01 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAD3+Te1bqpq6A3hBw--.1939S2;
	Wed, 16 Sep 2026 18:25:58 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: brgl@kernel.org
Cc: heiko@sntech.de,
	jay.xu@rock-chips.com,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: rockchip: Fix debounce clock leak in rockchip_get_bank_data()
Date: Wed, 16 Sep 2026 10:25:29 +0000
Message-Id: <20260916102529.2019277-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAD3+Te1bqpq6A3hBw--.1939S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy8KrW7tw4UZF13WFW3KFg_yoW8WF13pa
	n8WrW5Kwn7GFn2gF1DAF15AFWFv3ZFyay3Wrn7G3WxCw13tFy7tFWUWFWvqF45Aryvkay5
	Ar43Ga4UGr43Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9S14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCV
	W8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6r
	xdYxBIdaVFxhVjvjDU0xZFpf9x0JUJWrAUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEMA2qqP7m20QAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_032600_804252_61D02C72 
X-CRM114-Status: GOOD (  11.93  )
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

rockchip_get_bank_data() obtains the debounce clock with of_clk_get()
for GPIO v2 banks and stores it in bank->db_clk for later use by the
debounce handling, but the reference is never released anywhere in the
driver.  When rockchip_gpiolib_register() fails in rockchip_gpio_probe()
or when the device unbinds, the debounce clock reference leaks.

Release the references returned by of_clk_get() with clk_put() when
probe fails after the gpiochip registration and when the device is
removed.  The bank clock reference is dropped as well since it suffers
from the same problem.

Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpio/gpio-rockchip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 69a7cd8c9a1a..cab1ac78c48f 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -755,6 +755,8 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 	ret = rockchip_gpiolib_register(bank);
 	if (ret) {
 		clk_disable_unprepare(bank->clk);
+		clk_put(bank->clk);
+		clk_put(bank->db_clk);
 		mutex_unlock(&bank->deferred_lock);
 		return ret;
 	}
@@ -797,6 +799,8 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(bank->clk);
 	gpiochip_remove(&bank->gpio_chip);
+	clk_put(bank->clk);
+	clk_put(bank->db_clk);
 }
 
 static const struct of_device_id rockchip_gpio_match[] = {
-- 
2.34.1


