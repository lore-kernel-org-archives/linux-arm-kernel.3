Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCBCCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 04:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iaR7ye7e54dzT/PblXMczFnbDZoSyGAO6czW4k7MpSs=; b=Mbsg2kiI9I/SxNWN+28m8pnWo9
	elwCuHayQ23z/iMGA+tYJ02dUUPzcN3Zv50F4qU2Rs6HXGJXnRKTxo/ZhwoMQGos+JL7EcfnWRFuJ
	VNg7Vw6lwo05NUdAcIF8XmtAYSu3fTJa0p5CuUHVUvExcN0P70g/gN+HF8ut1EvOJV+YfdWE4KC5P
	+hbD/mgvZeKZP4ZhwCrl8OAn2grcNULjF91g9WouY+/pQeL8HxKF8sJ1DkNfBD9xWqpmnPg0BIlCv
	W2jPITKEe3aOEgmRGh9HxG/J1e9OM+Vt1ExCLVe7hJzVzU0FQzJDG9eI6vYy+qEG17o4PfvV/TCoI
	BkVwZIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF20K-00000005ScN-1AT5;
	Fri, 09 Oct 2026 04:14:44 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF20H-00000005SbX-0ekG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 04:14:42 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACXljQoashqx4wbCg--.48197S2;
	Fri, 09 Oct 2026 12:14:32 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	"Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: aspeed-g5: fix device node leak on LPC compatible mismatch
Date: Fri,  9 Oct 2026 12:14:35 +0800
Message-Id: <20261009041435.3096107-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXljQoashqx4wbCg--.48197S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1fKw4xAFWUGFyDZr18Zrb_yoW8Xr4kpa
	y3WFWYvr13Jr4Y9rW8XFy0gayaka1fXrW5Ca97K3srZFnxtryftw13KFWjqrs09rWkA3WY
	qF1Uta4Durn5Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxh
	VjvjDU0xZFpf9x07b8kskUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQPA2rIJHz+tgABs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_211441_641328_398C21AF 
X-CRM114-Status: GOOD (  11.28  )
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

aspeed_g5_acquire_regmap() takes a reference to the LPC device node with
of_parse_phandle() and then returns -ENODEV if the node's parent is not
compatible with "aspeed,ast2500-lpc-v2", without dropping that
reference. The function is called for every pin configuration, so the
leaked device_node reference accumulates on such systems.

Release the node with of_node_put() before returning from the error path.

Fixes: eaffd32bea0c ("pinctrl: aspeed-g5: Adapt to new LPC device tree layout")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index b0cba0f3e17e..6ab3ba89bd54 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2652,8 +2652,11 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 		np = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 1);
 		if (np) {
-			if (!of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2"))
+			if (!of_device_is_compatible(np->parent,
+						     "aspeed,ast2500-lpc-v2")) {
+				of_node_put(np);
 				return ERR_PTR(-ENODEV);
+			}
 
 			map = syscon_node_to_regmap(np->parent);
 			of_node_put(np);
-- 
2.25.1


