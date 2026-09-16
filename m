Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6CFC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+GLWj2j5kATD0tJykNfKU1dYrny4sjMGkDA+V08NX7A=; b=ACDPbX93s28/r23QJSm1UTRn87
	SqMOfnMbwXIrUZCB7z2a9KuOtN9/6o1sg8uG8/gJlSN6GvgI1odSxYz+8XbsL5rPKLXFvaD3OJXWn
	XLFixGlFbhVmANORV0oRqpqrNLHB5CNIF2EwEjg/gquO9e/2o5i6akaGbRBbie2Dzq5zJpfziDhOm
	WICaqZ2uyaYj/4XnuQF1PtaGEZKVJf+XfbnEmk256XQlhaYgSyEyXJM84h0Vc+Jr97Nn5um4Q6ukf
	+4spiLzzz53+JjfN1OmD3u23XJvdq7bz6J/UI0mZMditq08nZ9/FrscE7IdVnVM7LO/CeIpHIhKN3
	WSbzaoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mnh-00000008xsV-3vNa;
	Wed, 16 Sep 2026 10:23:37 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mnc-00000008xrb-3Syg;
	Wed, 16 Sep 2026 10:23:34 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACXmjgebqpqawfhBw--.61860S2;
	Wed, 16 Sep 2026 18:23:26 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: andriy.shevchenko@linux.intel.com
Cc: brgl@kernel.org,
	heiko@sntech.de,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	sebastian.reichel@collabora.com,
	ye.zhang@rock-chips.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: rockchip: Fix bank clock leak in rockchip_get_bank_data()
Date: Wed, 16 Sep 2026 10:22:58 +0000
Message-Id: <20260916102258.2018689-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXmjgebqpqawfhBw--.61860S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrykZr47uw4UKrWrXr1kZrb_yoW8WFy7pF
	s0kFyFkrsrJFnFgF1DAFZ3Ar4FyanrJFW3GFyxG3WxCw13tFyUtay5uayv9FWUArWIkw4a
	9r1DJFy8WrW7Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUMA2qqP4e3zAAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_032333_262379_86EF145E 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

rockchip_get_bank_data() obtains the bank clock with of_clk_get() and
enables it before reading the GPIO version ID.  The reference returned
by of_clk_get() is never dropped on the error paths that follow:

When the debounce clock is missing, the bank clock is disabled with
clk_disable_unprepare() but the reference is never released with
clk_put().  When the version ID is unsupported, the function returns
-ENODEV leaving the bank clock prepared, enabled and referenced.

Drop the reference with clk_put() on both error paths and disable and
unprepare the bank clock on the unsupported version path so that probe
failures no longer leak the clock.

Fixes: 41209307cad7 ("gpio: rockchip: change the GPIO version judgment logic")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpio/gpio-rockchip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 44d7ebd12724..69a7cd8c9a1a 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -673,6 +673,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		if (IS_ERR(bank->db_clk)) {
 			dev_err(bank->dev, "cannot find debounce clk\n");
 			clk_disable_unprepare(bank->clk);
+			clk_put(bank->clk);
 			return -EINVAL;
 		}
 		break;
@@ -682,6 +683,8 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		break;
 	default:
 		dev_err(bank->dev, "unsupported version ID: 0x%08x\n", id);
+		clk_disable_unprepare(bank->clk);
+		clk_put(bank->clk);
 		return -ENODEV;
 	}
 
-- 
2.34.1


